import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _authUserId = prefs.getString('ff_authUserId') ?? _authUserId;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _activePage = 'employees';
  String get activePage => _activePage;
  set activePage(String value) {
    _activePage = value;
  }

  String _authUserId = '';
  String get authUserId => _authUserId;
  set authUserId(String value) {
    _authUserId = value;
    prefs.setString('ff_authUserId', value);
  }

  String _loggedInUserId = 'Id';
  String get loggedInUserId => _loggedInUserId;
  set loggedInUserId(String value) {
    _loggedInUserId = value;
  }

  String _loggedInUserFullname = 'Christopher Santos';
  String get loggedInUserFullname => _loggedInUserFullname;
  set loggedInUserFullname(String value) {
    _loggedInUserFullname = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
