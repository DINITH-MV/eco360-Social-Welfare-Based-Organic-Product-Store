import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CartRecord extends FirestoreRecord {
  CartRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "ProductID" field.
  String? _productID;
  String get productID => _productID ?? '';
  bool hasProductID() => _productID != null;

  // "Quantity" field.
  int? _quantity;
  int get quantity => _quantity ?? 0;
  bool hasQuantity() => _quantity != null;

  // "ProductName" field.
  String? _productName;
  String get productName => _productName ?? '';
  bool hasProductName() => _productName != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "Price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  // "Size" field.
  String? _size;
  String get size => _size ?? '';
  bool hasSize() => _size != null;

  // "Colour" field.
  String? _colour;
  String get colour => _colour ?? '';
  bool hasColour() => _colour != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  void _initializeFields() {
    _productID = snapshotData['ProductID'] as String?;
    _quantity = castToType<int>(snapshotData['Quantity']);
    _productName = snapshotData['ProductName'] as String?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _price = castToType<double>(snapshotData['Price']);
    _size = snapshotData['Size'] as String?;
    _colour = snapshotData['Colour'] as String?;
    _image = snapshotData['image'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Cart');

  static Stream<CartRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CartRecord.fromSnapshot(s));

  static Future<CartRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CartRecord.fromSnapshot(s));

  static CartRecord fromSnapshot(DocumentSnapshot snapshot) => CartRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CartRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CartRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CartRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CartRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCartRecordData({
  String? productID,
  int? quantity,
  String? productName,
  DateTime? createdAt,
  double? price,
  String? size,
  String? colour,
  String? image,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'ProductID': productID,
      'Quantity': quantity,
      'ProductName': productName,
      'created_at': createdAt,
      'Price': price,
      'Size': size,
      'Colour': colour,
      'image': image,
    }.withoutNulls,
  );

  return firestoreData;
}

class CartRecordDocumentEquality implements Equality<CartRecord> {
  const CartRecordDocumentEquality();

  @override
  bool equals(CartRecord? e1, CartRecord? e2) {
    return e1?.productID == e2?.productID &&
        e1?.quantity == e2?.quantity &&
        e1?.productName == e2?.productName &&
        e1?.createdAt == e2?.createdAt &&
        e1?.price == e2?.price &&
        e1?.size == e2?.size &&
        e1?.colour == e2?.colour &&
        e1?.image == e2?.image;
  }

  @override
  int hash(CartRecord? e) => const ListEquality().hash([
        e?.productID,
        e?.quantity,
        e?.productName,
        e?.createdAt,
        e?.price,
        e?.size,
        e?.colour,
        e?.image
      ]);

  @override
  bool isValidKey(Object? o) => o is CartRecord;
}
