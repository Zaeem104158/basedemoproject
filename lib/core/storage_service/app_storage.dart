import 'package:get_storage/get_storage.dart';

class AppStorage {
  static final AppStorage _instance = AppStorage._internal();
  factory AppStorage() => _instance;

  // Private constructor
  AppStorage._internal();

  // Instance of GetStorage
  final GetStorage _storage = GetStorage();

  // Initialize GetStorage
  static Future<void> init() async {
    await GetStorage.init();
  }

  /// Write data to storage
  Future<void> write(String key, dynamic value) async {
    await _storage.write(key, value);
  }

  /// Read data from storage
  T? read<T>(String key) {
    return _storage.read<T>(key);
  }

  /// Remove data from storage
  Future<void> remove(String key) async {
    await _storage.remove(key);
  }

  /// Update data in storage (only if the key exists)
  Future<void> update(String key, dynamic newValue) async {
    if (_storage.hasData(key)) {
      await _storage.write(key, newValue);
    } else {
      throw Exception("Key '$key' does not exist in storage.");
    }
  }
}

class AppStorageKeys {
  static const String hasSeenOnboarding = 'hasSeenOnboarding';
  static const String loggedIn = 'hasLoggedIn';
}
