import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CatogoriesRecord extends FirestoreRecord {
  CatogoriesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "Image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  void _initializeFields() {
    _name = snapshotData['Name'] as String?;
    _image = snapshotData['Image'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Catogories');

  static Stream<CatogoriesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CatogoriesRecord.fromSnapshot(s));

  static Future<CatogoriesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CatogoriesRecord.fromSnapshot(s));

  static CatogoriesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CatogoriesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CatogoriesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CatogoriesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CatogoriesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CatogoriesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCatogoriesRecordData({
  String? name,
  String? image,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Name': name,
      'Image': image,
    }.withoutNulls,
  );

  return firestoreData;
}

class CatogoriesRecordDocumentEquality implements Equality<CatogoriesRecord> {
  const CatogoriesRecordDocumentEquality();

  @override
  bool equals(CatogoriesRecord? e1, CatogoriesRecord? e2) {
    return e1?.name == e2?.name && e1?.image == e2?.image;
  }

  @override
  int hash(CatogoriesRecord? e) =>
      const ListEquality().hash([e?.name, e?.image]);

  @override
  bool isValidKey(Object? o) => o is CatogoriesRecord;
}
