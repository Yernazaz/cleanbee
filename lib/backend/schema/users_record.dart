import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "role" field.
  int? _role;
  int get role => _role ?? 0;
  bool hasRole() => _role != null;

  // "rating" field.
  List<double>? _rating;
  List<double> get rating => _rating ?? const [];
  bool hasRating() => _rating != null;

  // "bgColor" field.
  Color? _bgColor;
  Color? get bgColor => _bgColor;
  bool hasBgColor() => _bgColor != null;

  // "admin" field.
  bool? _admin;
  bool get admin => _admin ?? false;
  bool hasAdmin() => _admin != null;

  // "card_number" field.
  String? _cardNumber;
  String get cardNumber => _cardNumber ?? '';
  bool hasCardNumber() => _cardNumber != null;

  // "card_holder" field.
  String? _cardHolder;
  String get cardHolder => _cardHolder ?? '';
  bool hasCardHolder() => _cardHolder != null;

  // "card_month" field.
  String? _cardMonth;
  String get cardMonth => _cardMonth ?? '';
  bool hasCardMonth() => _cardMonth != null;

  // "card_year" field.
  String? _cardYear;
  String get cardYear => _cardYear ?? '';
  bool hasCardYear() => _cardYear != null;

  // "active_request" field.
  bool? _activeRequest;
  bool get activeRequest => _activeRequest ?? false;
  bool hasActiveRequest() => _activeRequest != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _role = castToType<int>(snapshotData['role']);
    _rating = getDataList(snapshotData['rating']);
    _bgColor = getSchemaColor(snapshotData['bgColor']);
    _admin = snapshotData['admin'] as bool?;
    _cardNumber = snapshotData['card_number'] as String?;
    _cardHolder = snapshotData['card_holder'] as String?;
    _cardMonth = snapshotData['card_month'] as String?;
    _cardYear = snapshotData['card_year'] as String?;
    _activeRequest = snapshotData['active_request'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  int? role,
  Color? bgColor,
  bool? admin,
  String? cardNumber,
  String? cardHolder,
  String? cardMonth,
  String? cardYear,
  bool? activeRequest,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'role': role,
      'bgColor': bgColor,
      'admin': admin,
      'card_number': cardNumber,
      'card_holder': cardHolder,
      'card_month': cardMonth,
      'card_year': cardYear,
      'active_request': activeRequest,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.role == e2?.role &&
        listEquality.equals(e1?.rating, e2?.rating) &&
        e1?.bgColor == e2?.bgColor &&
        e1?.admin == e2?.admin &&
        e1?.cardNumber == e2?.cardNumber &&
        e1?.cardHolder == e2?.cardHolder &&
        e1?.cardMonth == e2?.cardMonth &&
        e1?.cardYear == e2?.cardYear &&
        e1?.activeRequest == e2?.activeRequest;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.role,
        e?.rating,
        e?.bgColor,
        e?.admin,
        e?.cardNumber,
        e?.cardHolder,
        e?.cardMonth,
        e?.cardYear,
        e?.activeRequest
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
