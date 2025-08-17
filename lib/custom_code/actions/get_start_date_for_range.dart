// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

DateTime getStartDateForRange(String range) {
  final now = DateTime.now();

  switch (range) {
    case '1D':
      return now.subtract(Duration(days: 1));
    case 'WTD':
      final monday = now.subtract(Duration(days: now.weekday - 1));
      return DateTime(monday.year, monday.month, monday.day);
    case 'MTD':
      return DateTime(now.year, now.month, 1);
    case 'YTD':
      return DateTime(now.year, 1, 1);
    case 'ALL':
    default:
      return DateTime(1970, 1, 1);
  }
}
