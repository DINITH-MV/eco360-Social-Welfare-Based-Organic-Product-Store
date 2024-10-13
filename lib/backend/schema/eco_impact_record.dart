import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EcoImpactRecord extends FirestoreRecord {
  EcoImpactRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Month" field.
  List<String>? _month;
  List<String> get month => _month ?? const [];
  bool hasMonth() => _month != null;

  // "Quantity" field.
  List<int>? _quantity;
  List<int> get quantity => _quantity ?? const [];
  bool hasQuantity() => _quantity != null;

  void _initializeFields() {
    _month = getDataList(snapshotData['Month']);
    _quantity = getDataList(snapshotData['Quantity']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ecoImpact');

  static Stream<EcoImpactRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EcoImpactRecord.fromSnapshot(s));

  static Future<EcoImpactRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EcoImpactRecord.fromSnapshot(s));

  static EcoImpactRecord fromSnapshot(DocumentSnapshot snapshot) =>
      EcoImpactRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EcoImpactRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EcoImpactRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EcoImpactRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EcoImpactRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEcoImpactRecordData() {
  final firestoreData = mapToFirestore(
    <String, dynamic>{}.withoutNulls,
  );

  return firestoreData;
}

class EcoImpactRecordDocumentEquality implements Equality<EcoImpactRecord> {
  const EcoImpactRecordDocumentEquality();

  @override
  bool equals(EcoImpactRecord? e1, EcoImpactRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.month, e2?.month) &&
        listEquality.equals(e1?.quantity, e2?.quantity);
  }

  @override
  int hash(EcoImpactRecord? e) =>
      const ListEquality().hash([e?.month, e?.quantity]);

  @override
  bool isValidKey(Object? o) => o is EcoImpactRecord;
}
