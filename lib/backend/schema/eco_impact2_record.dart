import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EcoImpact2Record extends FirestoreRecord {
  EcoImpact2Record._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Month" field.
  String? _month;
  String get month => _month ?? '';
  bool hasMonth() => _month != null;

  // "Quantity" field.
  int? _quantity;
  int get quantity => _quantity ?? 0;
  bool hasQuantity() => _quantity != null;

  void _initializeFields() {
    _month = snapshotData['Month'] as String?;
    _quantity = castToType<int>(snapshotData['Quantity']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ecoImpact2');

  static Stream<EcoImpact2Record> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EcoImpact2Record.fromSnapshot(s));

  static Future<EcoImpact2Record> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EcoImpact2Record.fromSnapshot(s));

  static EcoImpact2Record fromSnapshot(DocumentSnapshot snapshot) =>
      EcoImpact2Record._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EcoImpact2Record getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EcoImpact2Record._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EcoImpact2Record(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EcoImpact2Record &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEcoImpact2RecordData({
  String? month,
  int? quantity,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Month': month,
      'Quantity': quantity,
    }.withoutNulls,
  );

  return firestoreData;
}

class EcoImpact2RecordDocumentEquality implements Equality<EcoImpact2Record> {
  const EcoImpact2RecordDocumentEquality();

  @override
  bool equals(EcoImpact2Record? e1, EcoImpact2Record? e2) {
    return e1?.month == e2?.month && e1?.quantity == e2?.quantity;
  }

  @override
  int hash(EcoImpact2Record? e) =>
      const ListEquality().hash([e?.month, e?.quantity]);

  @override
  bool isValidKey(Object? o) => o is EcoImpact2Record;
}
