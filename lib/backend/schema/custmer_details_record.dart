import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CustmerDetailsRecord extends FirestoreRecord {
  CustmerDetailsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "District" field.
  String? _district;
  String get district => _district ?? '';
  bool hasDistrict() => _district != null;

  // "Address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  void _initializeFields() {
    _name = snapshotData['Name'] as String?;
    _district = snapshotData['District'] as String?;
    _address = snapshotData['Address'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('CustmerDetails');

  static Stream<CustmerDetailsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CustmerDetailsRecord.fromSnapshot(s));

  static Future<CustmerDetailsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CustmerDetailsRecord.fromSnapshot(s));

  static CustmerDetailsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CustmerDetailsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CustmerDetailsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CustmerDetailsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CustmerDetailsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CustmerDetailsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCustmerDetailsRecordData({
  String? name,
  String? district,
  String? address,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Name': name,
      'District': district,
      'Address': address,
    }.withoutNulls,
  );

  return firestoreData;
}

class CustmerDetailsRecordDocumentEquality
    implements Equality<CustmerDetailsRecord> {
  const CustmerDetailsRecordDocumentEquality();

  @override
  bool equals(CustmerDetailsRecord? e1, CustmerDetailsRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.district == e2?.district &&
        e1?.address == e2?.address;
  }

  @override
  int hash(CustmerDetailsRecord? e) =>
      const ListEquality().hash([e?.name, e?.district, e?.address]);

  @override
  bool isValidKey(Object? o) => o is CustmerDetailsRecord;
}
