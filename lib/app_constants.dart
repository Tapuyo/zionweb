import 'package:flutter/material.dart';

abstract class FFAppConstants {
  static const Color selectedNavContainer = Color(4289827649);
  static const Color selectedNavText = Color(4294967295);
  static const int modalLabelMarginR = 10;
  static const String Dispatched = 'Dispatched';
  static const String InTransit = 'In-Transit';
  static const String AwaitingLogisticsConfirmation =
      'Awaiting-Logistics-Confirmation';
  static const String NewOrder = 'New';
  static const String Cancelled = 'Cancelled';
  static const String ReadyToDispatch = 'Ready-to-Dispatch';
  static const String OnHold = 'On-hold';
  static const String Delivered = 'Delivered';
  static const String Drafts = 'Drafts';
}
