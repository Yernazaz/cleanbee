// ignore_for_file: unnecessary_getters_setters
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NewRequestStruct extends FFFirebaseStruct {
  NewRequestStruct({
    DocumentReference? aptType,
    DocumentReference? aptSize,
    String? city,
    String? address,
    String? aptName,
    String? additionalInformation,
    List<DocumentReference>? additionalServices,
    double? totalPrice,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _aptType = aptType,
        _aptSize = aptSize,
        _city = city,
        _address = address,
        _aptName = aptName,
        _additionalInformation = additionalInformation,
        _additionalServices = additionalServices,
        _totalPrice = totalPrice,
        super(firestoreUtilData);

  // "aptType" field.
  DocumentReference? _aptType;
  DocumentReference? get aptType => _aptType;
  set aptType(DocumentReference? val) => _aptType = val;
  bool hasAptType() => _aptType != null;

  // "aptSize" field.
  DocumentReference? _aptSize;
  DocumentReference? get aptSize => _aptSize;
  set aptSize(DocumentReference? val) => _aptSize = val;
  bool hasAptSize() => _aptSize != null;

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  set city(String? val) => _city = val;
  bool hasCity() => _city != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  set address(String? val) => _address = val;
  bool hasAddress() => _address != null;

  // "aptName" field.
  String? _aptName;
  String get aptName => _aptName ?? '';
  set aptName(String? val) => _aptName = val;
  bool hasAptName() => _aptName != null;

  // "additionalInformation" field.
  String? _additionalInformation;
  String get additionalInformation => _additionalInformation ?? '';
  set additionalInformation(String? val) => _additionalInformation = val;
  bool hasAdditionalInformation() => _additionalInformation != null;

  // "additionalServices" field.
  List<DocumentReference>? _additionalServices;
  List<DocumentReference> get additionalServices =>
      _additionalServices ?? const [];
  set additionalServices(List<DocumentReference>? val) =>
      _additionalServices = val;
  void updateAdditionalServices(Function(List<DocumentReference>) updateFn) =>
      updateFn(_additionalServices ??= []);
  bool hasAdditionalServices() => _additionalServices != null;

  // "totalPrice" field.
  double? _totalPrice;
  double get totalPrice => _totalPrice ?? 0.0;
  set totalPrice(double? val) => _totalPrice = val;
  void incrementTotalPrice(double amount) => _totalPrice = totalPrice + amount;
  bool hasTotalPrice() => _totalPrice != null;

  static NewRequestStruct fromMap(Map<String, dynamic> data) =>
      NewRequestStruct(
        aptType: data['aptType'] as DocumentReference?,
        aptSize: data['aptSize'] as DocumentReference?,
        city: data['city'] as String?,
        address: data['address'] as String?,
        aptName: data['aptName'] as String?,
        additionalInformation: data['additionalInformation'] as String?,
        additionalServices: getDataList(data['additionalServices']),
        totalPrice: castToType<double>(data['totalPrice']),
      );

  static NewRequestStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? NewRequestStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'aptType': _aptType,
        'aptSize': _aptSize,
        'city': _city,
        'address': _address,
        'aptName': _aptName,
        'additionalInformation': _additionalInformation,
        'additionalServices': _additionalServices,
        'totalPrice': _totalPrice,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'aptType': serializeParam(
          _aptType,
          ParamType.DocumentReference,
        ),
        'aptSize': serializeParam(
          _aptSize,
          ParamType.DocumentReference,
        ),
        'city': serializeParam(
          _city,
          ParamType.String,
        ),
        'address': serializeParam(
          _address,
          ParamType.String,
        ),
        'aptName': serializeParam(
          _aptName,
          ParamType.String,
        ),
        'additionalInformation': serializeParam(
          _additionalInformation,
          ParamType.String,
        ),
        'additionalServices': serializeParam(
          _additionalServices,
          ParamType.DocumentReference,
          true,
        ),
        'totalPrice': serializeParam(
          _totalPrice,
          ParamType.double,
        ),
      }.withoutNulls;

  static NewRequestStruct fromSerializableMap(Map<String, dynamic> data) =>
      NewRequestStruct(
        aptType: deserializeParam(
          data['aptType'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['house_type'],
        ),
        aptSize: deserializeParam(
          data['aptSize'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['house_type', 'sizes'],
        ),
        city: deserializeParam(
          data['city'],
          ParamType.String,
          false,
        ),
        address: deserializeParam(
          data['address'],
          ParamType.String,
          false,
        ),
        aptName: deserializeParam(
          data['aptName'],
          ParamType.String,
          false,
        ),
        additionalInformation: deserializeParam(
          data['additionalInformation'],
          ParamType.String,
          false,
        ),
        additionalServices: deserializeParam<DocumentReference>(
          data['additionalServices'],
          ParamType.DocumentReference,
          true,
          collectionNamePath: ['additional_services'],
        ),
        totalPrice: deserializeParam(
          data['totalPrice'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'NewRequestStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is NewRequestStruct &&
        aptType == other.aptType &&
        aptSize == other.aptSize &&
        city == other.city &&
        address == other.address &&
        aptName == other.aptName &&
        additionalInformation == other.additionalInformation &&
        listEquality.equals(additionalServices, other.additionalServices) &&
        totalPrice == other.totalPrice;
  }

  @override
  int get hashCode => const ListEquality().hash([
        aptType,
        aptSize,
        city,
        address,
        aptName,
        additionalInformation,
        additionalServices,
        totalPrice
      ]);
}

NewRequestStruct createNewRequestStruct({
  DocumentReference? aptType,
  DocumentReference? aptSize,
  String? city,
  String? address,
  String? aptName,
  String? additionalInformation,
  double? totalPrice,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    NewRequestStruct(
      aptType: aptType,
      aptSize: aptSize,
      city: city,
      address: address,
      aptName: aptName,
      additionalInformation: additionalInformation,
      totalPrice: totalPrice,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

NewRequestStruct? updateNewRequestStruct(
  NewRequestStruct? newRequest, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    newRequest
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addNewRequestStructData(
  Map<String, dynamic> firestoreData,
  NewRequestStruct? newRequest,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (newRequest == null) {
    return;
  }
  if (newRequest.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && newRequest.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final newRequestData = getNewRequestFirestoreData(newRequest, forFieldValue);
  final nestedData = newRequestData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = newRequest.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getNewRequestFirestoreData(
  NewRequestStruct? newRequest, [
  bool forFieldValue = false,
]) {
  if (newRequest == null) {
    return {};
  }
  final firestoreData = mapToFirestore(newRequest.toMap());

  // Add any Firestore field values
  newRequest.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getNewRequestListFirestoreData(
  List<NewRequestStruct>? newRequests,
) =>
    newRequests?.map((e) => getNewRequestFirestoreData(e, true)).toList() ?? [];
