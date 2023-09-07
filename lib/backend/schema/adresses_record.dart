import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AdressesRecord extends FirestoreRecord {
  AdressesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  bool hasCity() => _city != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  // "building_name" field.
  String? _buildingName;
  String get buildingName => _buildingName ?? '';
  bool hasBuildingName() => _buildingName != null;

  // "comment" field.
  String? _comment;
  String get comment => _comment ?? '';
  bool hasComment() => _comment != null;

  // "house_number" field.
  String? _houseNumber;
  String get houseNumber => _houseNumber ?? '';
  bool hasHouseNumber() => _houseNumber != null;

  // "entrance" field.
  String? _entrance;
  String get entrance => _entrance ?? '';
  bool hasEntrance() => _entrance != null;

  // "apt_number" field.
  String? _aptNumber;
  String get aptNumber => _aptNumber ?? '';
  bool hasAptNumber() => _aptNumber != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _city = snapshotData['city'] as String?;
    _address = snapshotData['address'] as String?;
    _buildingName = snapshotData['building_name'] as String?;
    _comment = snapshotData['comment'] as String?;
    _houseNumber = snapshotData['house_number'] as String?;
    _entrance = snapshotData['entrance'] as String?;
    _aptNumber = snapshotData['apt_number'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('adresses')
          : FirebaseFirestore.instance.collectionGroup('adresses');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('adresses').doc();

  static Stream<AdressesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AdressesRecord.fromSnapshot(s));

  static Future<AdressesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AdressesRecord.fromSnapshot(s));

  static AdressesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AdressesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AdressesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AdressesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AdressesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AdressesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAdressesRecordData({
  String? city,
  String? address,
  String? buildingName,
  String? comment,
  String? houseNumber,
  String? entrance,
  String? aptNumber,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'city': city,
      'address': address,
      'building_name': buildingName,
      'comment': comment,
      'house_number': houseNumber,
      'entrance': entrance,
      'apt_number': aptNumber,
    }.withoutNulls,
  );

  return firestoreData;
}

class AdressesRecordDocumentEquality implements Equality<AdressesRecord> {
  const AdressesRecordDocumentEquality();

  @override
  bool equals(AdressesRecord? e1, AdressesRecord? e2) {
    return e1?.city == e2?.city &&
        e1?.address == e2?.address &&
        e1?.buildingName == e2?.buildingName &&
        e1?.comment == e2?.comment &&
        e1?.houseNumber == e2?.houseNumber &&
        e1?.entrance == e2?.entrance &&
        e1?.aptNumber == e2?.aptNumber;
  }

  @override
  int hash(AdressesRecord? e) => const ListEquality().hash([
        e?.city,
        e?.address,
        e?.buildingName,
        e?.comment,
        e?.houseNumber,
        e?.entrance,
        e?.aptNumber
      ]);

  @override
  bool isValidKey(Object? o) => o is AdressesRecord;
}
