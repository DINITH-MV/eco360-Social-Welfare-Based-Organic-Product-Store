import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '../../core/util.dart';

class ProductSizeRecord extends FirestoreRecord {
  ProductSizeRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "ProductID" field.
  String? _productID;
  String get productID => _productID ?? '';
  bool hasProductID() => _productID != null;

  // "Size" field.
  String? _size;
  String get size => _size ?? '';
  bool hasSize() => _size != null;

  void _initializeFields() {
    _productID = snapshotData['ProductID'] as String?;
    _size = snapshotData['Size'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ProductSize');

  static Stream<ProductSizeRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProductSizeRecord.fromSnapshot(s));

  static Future<ProductSizeRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProductSizeRecord.fromSnapshot(s));

  static ProductSizeRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProductSizeRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProductSizeRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProductSizeRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProductSizeRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProductSizeRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProductSizeRecordData({
  String? productID,
  String? size,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'ProductID': productID,
      'Size': size,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProductSizeRecordDocumentEquality implements Equality<ProductSizeRecord> {
  const ProductSizeRecordDocumentEquality();

  @override
  bool equals(ProductSizeRecord? e1, ProductSizeRecord? e2) {
    return e1?.productID == e2?.productID && e1?.size == e2?.size;
  }

  @override
  int hash(ProductSizeRecord? e) =>
      const ListEquality().hash([e?.productID, e?.size]);

  @override
  bool isValidKey(Object? o) => o is ProductSizeRecord;
}
