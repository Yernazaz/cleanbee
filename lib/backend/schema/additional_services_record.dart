import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AdditionalServicesRecord extends FirestoreRecord {
  AdditionalServicesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "service_name" field.
  String? _serviceName;
  String get serviceName => _serviceName ?? '';
  bool hasServiceName() => _serviceName != null;

  // "decrement_cost" field.
  double? _decrementCost;
  double get decrementCost => _decrementCost ?? 0.0;
  bool hasDecrementCost() => _decrementCost != null;

  // "service_cost" field.
  double? _serviceCost;
  double get serviceCost => _serviceCost ?? 0.0;
  bool hasServiceCost() => _serviceCost != null;

  void _initializeFields() {
    _serviceName = snapshotData['service_name'] as String?;
    _decrementCost = castToType<double>(snapshotData['decrement_cost']);
    _serviceCost = castToType<double>(snapshotData['service_cost']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('additional_services');

  static Stream<AdditionalServicesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AdditionalServicesRecord.fromSnapshot(s));

  static Future<AdditionalServicesRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => AdditionalServicesRecord.fromSnapshot(s));

  static AdditionalServicesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AdditionalServicesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AdditionalServicesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AdditionalServicesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AdditionalServicesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AdditionalServicesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAdditionalServicesRecordData({
  String? serviceName,
  double? decrementCost,
  double? serviceCost,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'service_name': serviceName,
      'decrement_cost': decrementCost,
      'service_cost': serviceCost,
    }.withoutNulls,
  );

  return firestoreData;
}

class AdditionalServicesRecordDocumentEquality
    implements Equality<AdditionalServicesRecord> {
  const AdditionalServicesRecordDocumentEquality();

  @override
  bool equals(AdditionalServicesRecord? e1, AdditionalServicesRecord? e2) {
    return e1?.serviceName == e2?.serviceName &&
        e1?.decrementCost == e2?.decrementCost &&
        e1?.serviceCost == e2?.serviceCost;
  }

  @override
  int hash(AdditionalServicesRecord? e) => const ListEquality()
      .hash([e?.serviceName, e?.decrementCost, e?.serviceCost]);

  @override
  bool isValidKey(Object? o) => o is AdditionalServicesRecord;
}
