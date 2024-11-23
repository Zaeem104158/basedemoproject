// import 'package:flutter/material.dart';
// import 'package:intl/date_symbol_data_local.dart';
// import 'package:intl/intl.dart';

// class DateTimeConverter {
//   // Country time offsets (in minutes)
//   static final Map<String, int> countryTimeOffsetMinutes = {
//     "PK": 300, // Pakistan Standard Time (UTC+5)
//     "US": -300, // Eastern Standard Time (UTC-5)
//     "IN": 330, // India Standard Time (UTC+5:30)
//     "GB": 0, // Greenwich Mean Time (UTC+0)
//     // Add more countries and their UTC offsets as needed
//   };

//   /// Method to convert a given date-time string to a specific country's time and format
//   static Future<Map<String, String>> convertDateTime({
//     required String dateTime,
//     required String selectLoca,
//     required String dateTimeFormat,
//   }) async {
//     try {
//       // Parse the input UTC date
//       DateTime parsedDate = DateTime.parse(dateTime);

//       // Adjust time based on the country code (selectLoca)
//       if (countryTimeOffsetMinutes.containsKey(selectLoca)) {
//         int offsetMinutes = countryTimeOffsetMinutes[selectLoca]!;
//         parsedDate = parsedDate.add(Duration(minutes: offsetMinutes));
//       }

//       // Map country code to a valid locale, defaulting to 'en_US'
//       String locale = _getLocaleFromCountryCode(selectLoca);
//        // Initialize the locale data
//       await initializeDateFormatting(locale, null);
//       // Format the adjusted date and time
//       String formattedDate =
//           DateFormat(dateTimeFormat, locale).format(parsedDate);
//       String formattedTime = DateFormat.jm(locale).format(parsedDate);

//       return {
//         "date": formattedDate,
//         "time": formattedTime,
//       };
//     } catch (e) {
//       debugPrint("Error in convertDateTime: $e");
//       return {"date": "Error", "time": "Error"};
//     }
//   }

//   /// Helper method to map country code to a valid locale
//   static String _getLocaleFromCountryCode(String countryCode) {
//     switch (countryCode) {
//       case "PK":
//         return "en_PK";
//       case "US":
//         return "en_US";
//       case "IN":
//         return "en_IN";
//       case "GB":
//         return "en_GB";
//       default:
//         return "en_US"; // Fallback to US English
//     }
//   }

//   /// Method to pick a date and convert it
//   static Future<Map<String, String>?> pickAndConvertDate({
//     required BuildContext context,
//     required String countryCode,
//     required String format,
//   }) async {
//     try {
//       // Open the date picker and let the user select a date
//       DateTime? selectedDate = await showDatePicker(
//         context: context,
//         initialDate: DateTime.now(),
//         firstDate: DateTime(2000), // Set the minimum date
//         lastDate: DateTime(2100), // Set the maximum date
//       );

//       // Return null if no date was selected
//       if (selectedDate == null) {
//         return null;
//       }

//       // Add a default time (midnight local) to the selected date
//       DateTime selectedDateWithTime = DateTime(
//         selectedDate.year,
//         selectedDate.month,
//         selectedDate.day,
//       );

//       // Convert the selected date to UTC and format it to ISO 8601
//       String selectedDateTime = selectedDateWithTime.toUtc().toIso8601String();

//       // Call the conversion method
//       return convertDateTime(
//         dateTime: selectedDateTime,
//         selectLoca: countryCode,
//         dateTimeFormat: format,
//       );
//     } catch (e) {
//       debugPrint("Error in pickAndConvertDate: $e");
//       return null;
//     }
//   }
// }

import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class DateTimeConverter {
  /// Method to convert a given date-time string to a specific format and locale
  static Future<Map<String, String>> convertDateTime({
    required String dateTime,
    required String dateTimeFormat,
    String locale = 'en_US', // Default to US English
  }) async {
    try {
      // Parse the input UTC date
      DateTime parsedDate = DateTime.parse(dateTime);

      // Initialize the locale data for date formatting
      await initializeDateFormatting(locale, null);

      // Format the date and time
      String formattedDate =
          DateFormat(dateTimeFormat, locale).format(parsedDate);
      String formattedTime = DateFormat.jm(locale).format(parsedDate);

      return {
        "date": formattedDate,
        "time": formattedTime,
      };
    } catch (e) {
      debugPrint("Error in convertDateTime: $e");
      return {"date": "Error", "time": "Error"};
    }
  }

  /// Method to pick a date and convert it
  static Future<Map<String, String>?> pickAndConvertDate({
    required BuildContext context,
    required String format,
    String locale = 'en_US', // Default to US English
  }) async {
    try {
      // Open the date picker and let the user select a date
      DateTime? selectedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2020), // Set the minimum date
        lastDate: DateTime(2100), // Set the maximum date
      );

      // Return null if no date was selected
      if (selectedDate == null) {
        return null;
      }

      // Convert the selected date to UTC and format it to ISO 8601
      String selectedDateTime = selectedDate.toLocal().toIso8601String();

      // Call the conversion method
      return convertDateTime(
        dateTime: selectedDateTime,
        dateTimeFormat: format,
        locale: locale,
      );
    } catch (e) {
      debugPrint("Error in pickAndConvertDate: $e");
      return null;
    }
  }
}
