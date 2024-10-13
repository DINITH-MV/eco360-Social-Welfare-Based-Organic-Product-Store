import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CardDetailsRecord extends FirestoreRecord {
  CardDetailsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "CardType" field.
  String? _cardType;
  String get cardType => _cardType ?? '';
  bool hasCardType() => _cardType != null;

  // "CardName" field.
  String? _cardName;
  String get cardName => _cardName ?? '';
  bool hasCardName() => _cardName != null;

  // "ValidThiru" field.
  DateTime? _validThiru;
  DateTime? get validThiru => _validThiru;
  bool hasValidThiru() => _validThiru != null;

  // "CVCNo" field.
  int? _cVCNo;
  int get cVCNo => _cVCNo ?? 0;
  bool hasCVCNo() => _cVCNo != null;

  void _initializeFields() {
    _cardType = snapshotData['CardType'] as String?;
    _cardName = snapshotData['CardName'] as String?;
    _validThiru = snapshotData['ValidThiru'] as DateTime?;
    _cVCNo = castToType<int>(snapshotData['CVCNo']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('CardDetails');

  static Stream<CardDetailsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CardDetailsRecord.fromSnapshot(s));

  static Future<CardDetailsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CardDetailsRecord.fromSnapshot(s));

  static CardDetailsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CardDetailsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CardDetailsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CardDetailsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CardDetailsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CardDetailsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCardDetailsRecordData({
  String? cardType,
  String? cardName,
  DateTime? validThiru,
  int? cVCNo,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'CardType': cardType,
      'CardName': cardName,
      'ValidThiru': validThiru,
      'CVCNo': cVCNo,
    }.withoutNulls,
  );

  return firestoreData;
}

class CardDetailsRecordDocumentEquality implements Equality<CardDetailsRecord> {
  const CardDetailsRecordDocumentEquality();

  @override
  bool equals(CardDetailsRecord? e1, CardDetailsRecord? e2) {
    return e1?.cardType == e2?.cardType &&
        e1?.cardName == e2?.cardName &&
        e1?.validThiru == e2?.validThiru &&
        e1?.cVCNo == e2?.cVCNo;
  }

  @override
  int hash(CardDetailsRecord? e) => const ListEquality()
      .hash([e?.cardType, e?.cardName, e?.validThiru, e?.cVCNo]);

  @override
  bool isValidKey(Object? o) => o is CardDetailsRecord;
}
