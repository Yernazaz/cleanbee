import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HouseTypeRecord extends FirestoreRecord {
  HouseTypeRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('house_type');

  static Stream<HouseTypeRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => HouseTypeRecord.fromSnapshot(s));

  static Future<HouseTypeRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => HouseTypeRecord.fromSnapshot(s));

  static HouseTypeRecord fromSnapshot(DocumentSnapshot snapshot) =>
      HouseTypeRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static HouseTypeRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      HouseTypeRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'HouseTypeRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is HouseTypeRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createHouseTypeRecordData({
  String? name,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
    }.withoutNulls,
  );

  return firestoreData;
}

class HouseTypeRecordDocumentEquality implements Equality<HouseTypeRecord> {
  const HouseTypeRecordDocumentEquality();

  @override
  bool equals(HouseTypeRecord? e1, HouseTypeRecord? e2) {
    return e1?.name == e2?.name;
  }

  @override
  int hash(HouseTypeRecord? e) => const ListEquality().hash([e?.name]);

  @override
  bool isValidKey(Object? o) => o is HouseTypeRecord;
}
