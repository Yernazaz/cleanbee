import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StreetsRecord extends FirestoreRecord {
  StreetsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "street" field.
  String? _street;
  String get street => _street ?? '';
  bool hasStreet() => _street != null;

  void _initializeFields() {
    _street = snapshotData['street'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('streets');

  static Stream<StreetsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => StreetsRecord.fromSnapshot(s));

  static Future<StreetsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => StreetsRecord.fromSnapshot(s));

  static StreetsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      StreetsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static StreetsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      StreetsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'StreetsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is StreetsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createStreetsRecordData({
  String? street,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'street': street,
    }.withoutNulls,
  );

  return firestoreData;
}

class StreetsRecordDocumentEquality implements Equality<StreetsRecord> {
  const StreetsRecordDocumentEquality();

  @override
  bool equals(StreetsRecord? e1, StreetsRecord? e2) {
    return e1?.street == e2?.street;
  }

  @override
  int hash(StreetsRecord? e) => const ListEquality().hash([e?.street]);

  @override
  bool isValidKey(Object? o) => o is StreetsRecord;
}
