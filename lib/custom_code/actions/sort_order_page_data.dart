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

List<dynamic> sortOrderPageData(
  List<dynamic> listToSort,
  bool isAsc,
  int sortColumnIndex,
) {
  /// MODIFY CODE ONLY BELOW THIS LINE

  // 0 = code, 1 = product_name
  switch (sortColumnIndex) {
    case 0:
      listToSort.sort((a, b) =>
          (a['code'] ?? '').toString().compareTo((b['code'] ?? '').toString()));
      break;
    case 1:
      listToSort.sort((a, b) => (a['product_name'] ?? '')
          .toString()
          .compareTo((b['product_name'] ?? '').toString()));
      break;
    default:
      break;
  }

  if (!isAsc) {
    listToSort = listToSort.reversed.toList();
  }

  return listToSort;

  /// MODIFY CODE ONLY ABOVE THIS LINE
}
