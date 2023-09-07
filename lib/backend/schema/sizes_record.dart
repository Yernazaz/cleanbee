import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SizesRecord extends FirestoreRecord {
  SizesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "size" field.
  String? _size;
  String get size => _size ?? '';
  bool hasSize() => _size != null;

  // "cost" field.
  double? _cost;
  double get cost => _cost ?? 0.0;
  bool hasCost() => _cost != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _size = snapshotData['size'] as String?;
    _cost = castToType<double>(snapshotData['cost']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('sizes')
          : FirebaseFirestore.instance.collectionGroup('sizes');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('sizes').doc();

  static Stream<SizesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SizesRecord.fromSnapshot(s));

  static Future<SizesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SizesRecord.fromSnapshot(s));

  static SizesRecord fromSnapshot(DocumentSnapshot snapshot) => SizesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SizesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SizesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SizesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SizesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSizesRecordData({
  String? size,
  double? cost,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'size': size,
      'cost': cost,
    }.withoutNulls,
  );

  return firestoreData;
}

class SizesRecordDocumentEquality implements Equality<SizesRecord> {
  const SizesRecordDocumentEquality();

  @override
  bool equals(SizesRecord? e1, SizesRecord? e2) {
    return e1?.size == e2?.size && e1?.cost == e2?.cost;
  }

  @override
  int hash(SizesRecord? e) => const ListEquality().hash([e?.size, e?.cost]);

  @override
  bool isValidKey(Object? o) => o is SizesRecord;
}
