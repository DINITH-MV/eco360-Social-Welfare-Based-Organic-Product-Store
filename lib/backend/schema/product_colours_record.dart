import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '../../core/util.dart';

class ProductColoursRecord extends FirestoreRecord {
  ProductColoursRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "ProductID" field.
  String? _productID;
  String get productID => _productID ?? '';
  bool hasProductID() => _productID != null;

  // "Colour" field.
  String? _colour;
  String get colour => _colour ?? '';
  bool hasColour() => _colour != null;

  void _initializeFields() {
    _productID = snapshotData['ProductID'] as String?;
    _colour = snapshotData['Colour'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ProductColours');

  static Stream<ProductColoursRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProductColoursRecord.fromSnapshot(s));

  static Future<ProductColoursRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProductColoursRecord.fromSnapshot(s));

  static ProductColoursRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProductColoursRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProductColoursRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProductColoursRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProductColoursRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProductColoursRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProductColoursRecordData({
  String? productID,
  String? colour,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'ProductID': productID,
      'Colour': colour,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProductColoursRecordDocumentEquality
    implements Equality<ProductColoursRecord> {
  const ProductColoursRecordDocumentEquality();

  @override
  bool equals(ProductColoursRecord? e1, ProductColoursRecord? e2) {
    return e1?.productID == e2?.productID && e1?.colour == e2?.colour;
  }

  @override
  int hash(ProductColoursRecord? e) =>
      const ListEquality().hash([e?.productID, e?.colour]);

  @override
  bool isValidKey(Object? o) => o is ProductColoursRecord;
}
