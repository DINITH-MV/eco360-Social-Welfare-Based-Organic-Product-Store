import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DeliveryDetailsRecord extends FirestoreRecord {
  DeliveryDetailsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "PhoneNumber" field.
  int? _phoneNumber;
  int get phoneNumber => _phoneNumber ?? 0;
  bool hasPhoneNumber() => _phoneNumber != null;

  // "EmailAddress" field.
  String? _emailAddress;
  String get emailAddress => _emailAddress ?? '';
  bool hasEmailAddress() => _emailAddress != null;

  // "Address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  // "TotalPay" field.
  double? _totalPay;
  double get totalPay => _totalPay ?? 0.0;
  bool hasTotalPay() => _totalPay != null;

  // "DeliveryPay" field.
  double? _deliveryPay;
  double get deliveryPay => _deliveryPay ?? 0.0;
  bool hasDeliveryPay() => _deliveryPay != null;

  void _initializeFields() {
    _name = snapshotData['Name'] as String?;
    _phoneNumber = castToType<int>(snapshotData['PhoneNumber']);
    _emailAddress = snapshotData['EmailAddress'] as String?;
    _address = snapshotData['Address'] as String?;
    _totalPay = castToType<double>(snapshotData['TotalPay']);
    _deliveryPay = castToType<double>(snapshotData['DeliveryPay']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('DeliveryDetails');

  static Stream<DeliveryDetailsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DeliveryDetailsRecord.fromSnapshot(s));

  static Future<DeliveryDetailsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DeliveryDetailsRecord.fromSnapshot(s));

  static DeliveryDetailsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DeliveryDetailsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DeliveryDetailsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DeliveryDetailsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DeliveryDetailsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DeliveryDetailsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDeliveryDetailsRecordData({
  String? name,
  int? phoneNumber,
  String? emailAddress,
  String? address,
  double? totalPay,
  double? deliveryPay,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Name': name,
      'PhoneNumber': phoneNumber,
      'EmailAddress': emailAddress,
      'Address': address,
      'TotalPay': totalPay,
      'DeliveryPay': deliveryPay,
    }.withoutNulls,
  );

  return firestoreData;
}

class DeliveryDetailsRecordDocumentEquality
    implements Equality<DeliveryDetailsRecord> {
  const DeliveryDetailsRecordDocumentEquality();

  @override
  bool equals(DeliveryDetailsRecord? e1, DeliveryDetailsRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.emailAddress == e2?.emailAddress &&
        e1?.address == e2?.address &&
        e1?.totalPay == e2?.totalPay &&
        e1?.deliveryPay == e2?.deliveryPay;
  }

  @override
  int hash(DeliveryDetailsRecord? e) => const ListEquality().hash([
        e?.name,
        e?.phoneNumber,
        e?.emailAddress,
        e?.address,
        e?.totalPay,
        e?.deliveryPay
      ]);

  @override
  bool isValidKey(Object? o) => o is DeliveryDetailsRecord;
}
