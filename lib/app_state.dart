import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  double _totalPrice = 0.0;
  double get totalPrice => _totalPrice;
  set totalPrice(double _value) {
    _totalPrice = _value;
  }

  List<DocumentReference> _services = [];
  List<DocumentReference> get services => _services;
  set services(List<DocumentReference> _value) {
    _services = _value;
  }

  void addToServices(DocumentReference _value) {
    _services.add(_value);
  }

  void removeFromServices(DocumentReference _value) {
    _services.remove(_value);
  }

  void removeAtIndexFromServices(int _index) {
    _services.removeAt(_index);
  }

  void updateServicesAtIndex(
    int _index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _services[_index] = updateFn(_services[_index]);
  }

  DocumentReference? _single =
      FirebaseFirestore.instance.doc('/users/UX9YBdPNkmZOqc2VU91DOOOAK4a2');
  DocumentReference? get single => _single;
  set single(DocumentReference? _value) {
    _single = _value;
  }

  String _success = 'false';
  String get success => _success;
  set success(String _value) {
    _success = _value;
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
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
