import 'dart:convert';
import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';
import '../utility/app_platforms.dart';

enum Url {
  testing('http://software.abairtechsolution.com:1400/ords/mobile/pic'),
  production("http://software.abairtechsolution.com:1400/ords/mobile/parent");

  final String url;
  const Url(this.url);
}

class ApiService {
  final baseUrl = Url.production.url;
  final Dio _dio = Dio();
  final String username = "api";
  final String password = "apitest";

  Map<String, String> _createHeaders() {
    String basicAuth =
        'Basic ${base64Encode(utf8.encode('$username:$password'))}';
    return {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': basicAuth,
    };
  }

  Future<Map<String, dynamic>> get(String endpoint,
      {Map<String, String>? headers}) async {
    var response = await _dio.get('$baseUrl$endpoint',
        options: Options(headers: headers ?? _createHeaders()));
    if (response.statusCode == 200) {
      return response.data as Map<String, dynamic>;
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<Map<String, dynamic>> post(String endpoint, Map<String, dynamic> data,
      {Map<String, String>? headers}) async {
    final response = await _dio.post(
      '$baseUrl$endpoint',
      options: Options(headers: headers ?? _createHeaders()),
      data: data,
    );

    if (response.statusCode == 200) {
      return response.data as Map<String, dynamic>;
    } else {
      throw Exception('Failed to post data');
    }
  }

  Future<Map<String, dynamic>> put(String endpoint, Map<String, dynamic> data,
      {Map<String, String>? headers}) async {
    final response = await _dio.put(
      '$baseUrl$endpoint',
      options: Options(headers: headers ?? _createHeaders()),
      data: data,
    );
    if (response.statusCode == 200) {
      return response.data as Map<String, dynamic>;
    } else {
      throw Exception('Failed to post data');
    }
  }

  Future<Map<String, dynamic>> delete(
      String endpoint, Map<String, dynamic> data,
      {Map<String, String>? headers}) async {
    final response = await _dio.delete(
      '$baseUrl$endpoint',
      options: Options(headers: headers ?? _createHeaders()),
      data: data,
    );

    if (response.statusCode == 200) {
      return response.data as Map<String, dynamic>;
    } else {
      throw Exception('Failed to post data');
    }
  }

  Future<String?> download(
    String downloadUrl, {
    Map<String, String>? headers,
    required String saveFilePath,
    Function(int)? onProgress,
  }) async {
    String? filePath;

    if (getPlatform() == AppPlatform.android) {
      DeviceInfoPlugin plugin = DeviceInfoPlugin();

      AndroidDeviceInfo android = await plugin.androidInfo;
      if (android.version.sdkInt < 30) {
        await Permission.storage.request().then((value) async {
          if (value.isGranted) {
            filePath = '/storage/emulated/0/Download/$saveFilePath';
          } else if (await Permission.storage.isPermanentlyDenied) {
            await openAppSettings();
          } else if (await Permission.storage.isDenied) {
            await openAppSettings();
          }
        });
      } else {
        filePath = '/storage/emulated/0/Download/$saveFilePath';
      }
    } else if (getPlatform() == AppPlatform.ios) {
      Directory documentsDir = await getApplicationDocumentsDirectory();

      filePath = '${documentsDir.path}/$saveFilePath';
    }

    final response = await _dio.download(
      '$baseUrl$downloadUrl',
      filePath,
      onReceiveProgress: (count, total) {
        if (total != -1) {
          int progress = (count / total * 100).toInt();
          if (onProgress != null) {
            onProgress(progress);
          }
        }
      },
    );
    if (response.statusCode == 200) {
      return filePath!;
    } else {
      return null;
    }
  }
}
