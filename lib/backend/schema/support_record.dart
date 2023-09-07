import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SupportRecord extends FirestoreRecord {
  SupportRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "requestID" field.
  DocumentReference? _requestID;
  DocumentReference? get requestID => _requestID;
  bool hasRequestID() => _requestID != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  bool hasText() => _text != null;

  // "images" field.
  List<String>? _images;
  List<String> get images => _images ?? const [];
  bool hasImages() => _images != null;

  // "date_created" field.
  DateTime? _dateCreated;
  DateTime? get dateCreated => _dateCreated;
  bool hasDateCreated() => _dateCreated != null;

  // "created_by" field.
  DocumentReference? _createdBy;
  DocumentReference? get createdBy => _createdBy;
  bool hasCreatedBy() => _createdBy != null;

  // "solved" field.
  bool? _solved;
  bool get solved => _solved ?? false;
  bool hasSolved() => _solved != null;

  void _initializeFields() {
    _requestID = snapshotData['requestID'] as DocumentReference?;
    _title = snapshotData['title'] as String?;
    _text = snapshotData['text'] as String?;
    _images = getDataList(snapshotData['images']);
    _dateCreated = snapshotData['date_created'] as DateTime?;
    _createdBy = snapshotData['created_by'] as DocumentReference?;
    _solved = snapshotData['solved'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('support');

  static Stream<SupportRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SupportRecord.fromSnapshot(s));

  static Future<SupportRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SupportRecord.fromSnapshot(s));

  static SupportRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SupportRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SupportRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SupportRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SupportRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SupportRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSupportRecordData({
  DocumentReference? requestID,
  String? title,
  String? text,
  DateTime? dateCreated,
  DocumentReference? createdBy,
  bool? solved,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'requestID': requestID,
      'title': title,
      'text': text,
      'date_created': dateCreated,
      'created_by': createdBy,
      'solved': solved,
    }.withoutNulls,
  );

  return firestoreData;
}

class SupportRecordDocumentEquality implements Equality<SupportRecord> {
  const SupportRecordDocumentEquality();

  @override
  bool equals(SupportRecord? e1, SupportRecord? e2) {
    const listEquality = ListEquality();
    return e1?.requestID == e2?.requestID &&
        e1?.title == e2?.title &&
        e1?.text == e2?.text &&
        listEquality.equals(e1?.images, e2?.images) &&
        e1?.dateCreated == e2?.dateCreated &&
        e1?.createdBy == e2?.createdBy &&
        e1?.solved == e2?.solved;
  }

  @override
  int hash(SupportRecord? e) => const ListEquality().hash([
        e?.requestID,
        e?.title,
        e?.text,
        e?.images,
        e?.dateCreated,
        e?.createdBy,
        e?.solved
      ]);

  @override
  bool isValidKey(Object? o) => o is SupportRecord;
}
