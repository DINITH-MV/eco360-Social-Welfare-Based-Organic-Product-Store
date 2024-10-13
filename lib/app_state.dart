import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

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
      _sum = prefs.getDouble('ff_sum') ?? _sum;
    });
    _safeInit(() {
      _ecoImpact2State =
          prefs.getString('ff_ecoImpact2State') ?? _ecoImpact2State;
    });
    _safeInit(() {
      _Artificial = prefs.getString('ff_Artificial') ?? _Artificial;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  double _sum = 0.0;
  double get sum => _sum;
  set sum(double value) {
    _sum = value;
    prefs.setDouble('ff_sum', value);
  }

  String _deliveryPay = '';
  String get deliveryPay => _deliveryPay;
  set deliveryPay(String value) {
    _deliveryPay = value;
  }

  String _totalPay = '';
  String get totalPay => _totalPay;
  set totalPay(String value) {
    _totalPay = value;
  }

  double _deliveryFee = 0.0;
  double get deliveryFee => _deliveryFee;
  set deliveryFee(double value) {
    _deliveryFee = value;
  }

  String _ecoImpact2State = 'ecoImpact';
  String get ecoImpact2State => _ecoImpact2State;
  set ecoImpact2State(String value) {
    _ecoImpact2State = value;
    prefs.setString('ff_ecoImpact2State', value);
  }

  String _Artificial = 'Artificial';
  String get Artificial => _Artificial;
  set Artificial(String value) {
    _Artificial = value;
    prefs.setString('ff_Artificial', value);
  }

  bool _color = false;
  bool get color => _color;
  set color(bool value) {
    _color = value;
  }

  bool _color25 = false;
  bool get color25 => _color25;
  set color25(bool value) {
    _color25 = value;
  }

  bool _color50 = false;
  bool get color50 => _color50;
  set color50(bool value) {
    _color50 = value;
  }

  bool _color75 = false;
  bool get color75 => _color75;
  set color75(bool value) {
    _color75 = value;
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
