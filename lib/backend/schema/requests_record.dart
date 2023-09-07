import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RequestsRecord extends FirestoreRecord {
  RequestsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "type" field.
  DocumentReference? _type;
  DocumentReference? get type => _type;
  bool hasType() => _type != null;

  // "size" field.
  DocumentReference? _size;
  DocumentReference? get size => _size;
  bool hasSize() => _size != null;

  // "address" field.
  DocumentReference? _address;
  DocumentReference? get address => _address;
  bool hasAddress() => _address != null;

  // "services" field.
  List<DocumentReference>? _services;
  List<DocumentReference> get services => _services ?? const [];
  bool hasServices() => _services != null;

  // "totalCost" field.
  double? _totalCost;
  double get totalCost => _totalCost ?? 0.0;
  bool hasTotalCost() => _totalCost != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "applied_by" field.
  List<DocumentReference>? _appliedBy;
  List<DocumentReference> get appliedBy => _appliedBy ?? const [];
  bool hasAppliedBy() => _appliedBy != null;

  // "chosen_cleaner" field.
  DocumentReference? _chosenCleaner;
  DocumentReference? get chosenCleaner => _chosenCleaner;
  bool hasChosenCleaner() => _chosenCleaner != null;

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  bool hasCity() => _city != null;

  // "adres" field.
  String? _adres;
  String get adres => _adres ?? '';
  bool hasAdres() => _adres != null;

  // "building" field.
  String? _building;
  String get building => _building ?? '';
  bool hasBuilding() => _building != null;

  // "comment" field.
  String? _comment;
  String get comment => _comment ?? '';
  bool hasComment() => _comment != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "payed" field.
  bool? _payed;
  bool get payed => _payed ?? false;
  bool hasPayed() => _payed != null;

  // "created_date" field.
  DateTime? _createdDate;
  DateTime? get createdDate => _createdDate;
  bool hasCreatedDate() => _createdDate != null;

  // "started" field.
  bool? _started;
  bool get started => _started ?? false;
  bool hasStarted() => _started != null;

  // "rejected" field.
  bool? _rejected;
  bool get rejected => _rejected ?? false;
  bool hasRejected() => _rejected != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _type = snapshotData['type'] as DocumentReference?;
    _size = snapshotData['size'] as DocumentReference?;
    _address = snapshotData['address'] as DocumentReference?;
    _services = getDataList(snapshotData['services']);
    _totalCost = castToType<double>(snapshotData['totalCost']);
    _status = snapshotData['status'] as String?;
    _appliedBy = getDataList(snapshotData['applied_by']);
    _chosenCleaner = snapshotData['chosen_cleaner'] as DocumentReference?;
    _city = snapshotData['city'] as String?;
    _adres = snapshotData['adres'] as String?;
    _building = snapshotData['building'] as String?;
    _comment = snapshotData['comment'] as String?;
    _date = snapshotData['date'] as DateTime?;
    _payed = snapshotData['payed'] as bool?;
    _createdDate = snapshotData['created_date'] as DateTime?;
    _started = snapshotData['started'] as bool?;
    _rejected = snapshotData['rejected'] as bool?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('requests')
          : FirebaseFirestore.instance.collectionGroup('requests');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('requests').doc();

  static Stream<RequestsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RequestsRecord.fromSnapshot(s));

  static Future<RequestsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RequestsRecord.fromSnapshot(s));

  static RequestsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RequestsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RequestsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RequestsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RequestsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RequestsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRequestsRecordData({
  DocumentReference? type,
  DocumentReference? size,
  DocumentReference? address,
  double? totalCost,
  String? status,
  DocumentReference? chosenCleaner,
  String? city,
  String? adres,
  String? building,
  String? comment,
  DateTime? date,
  bool? payed,
  DateTime? createdDate,
  bool? started,
  bool? rejected,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'type': type,
      'size': size,
      'address': address,
      'totalCost': totalCost,
      'status': status,
      'chosen_cleaner': chosenCleaner,
      'city': city,
      'adres': adres,
      'building': building,
      'comment': comment,
      'date': date,
      'payed': payed,
      'created_date': createdDate,
      'started': started,
      'rejected': rejected,
    }.withoutNulls,
  );

  return firestoreData;
}

class RequestsRecordDocumentEquality implements Equality<RequestsRecord> {
  const RequestsRecordDocumentEquality();

  @override
  bool equals(RequestsRecord? e1, RequestsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.type == e2?.type &&
        e1?.size == e2?.size &&
        e1?.address == e2?.address &&
        listEquality.equals(e1?.services, e2?.services) &&
        e1?.totalCost == e2?.totalCost &&
        e1?.status == e2?.status &&
        listEquality.equals(e1?.appliedBy, e2?.appliedBy) &&
        e1?.chosenCleaner == e2?.chosenCleaner &&
        e1?.city == e2?.city &&
        e1?.adres == e2?.adres &&
        e1?.building == e2?.building &&
        e1?.comment == e2?.comment &&
        e1?.date == e2?.date &&
        e1?.payed == e2?.payed &&
        e1?.createdDate == e2?.createdDate &&
        e1?.started == e2?.started &&
        e1?.rejected == e2?.rejected;
  }

  @override
  int hash(RequestsRecord? e) => const ListEquality().hash([
        e?.type,
        e?.size,
        e?.address,
        e?.services,
        e?.totalCost,
        e?.status,
        e?.appliedBy,
        e?.chosenCleaner,
        e?.city,
        e?.adres,
        e?.building,
        e?.comment,
        e?.date,
        e?.payed,
        e?.createdDate,
        e?.started,
        e?.rejected
      ]);

  @override
  bool isValidKey(Object? o) => o is RequestsRecord;
}
