import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PostRecord extends FirestoreRecord {
  PostRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "post_title" field.
  String? _postTitle;
  String get postTitle => _postTitle ?? '';
  bool hasPostTitle() => _postTitle != null;

  // "post_discribection" field.
  String? _postDiscribection;
  String get postDiscribection => _postDiscribection ?? '';
  bool hasPostDiscribection() => _postDiscribection != null;

  // "time_post" field.
  DateTime? _timePost;
  DateTime? get timePost => _timePost;
  bool hasTimePost() => _timePost != null;

  // "post_image" field.
  String? _postImage;
  String get postImage => _postImage ?? '';
  bool hasPostImage() => _postImage != null;

  // "post_user" field.
  DocumentReference? _postUser;
  DocumentReference? get postUser => _postUser;
  bool hasPostUser() => _postUser != null;

  void _initializeFields() {
    _postTitle = snapshotData['post_title'] as String?;
    _postDiscribection = snapshotData['post_discribection'] as String?;
    _timePost = snapshotData['time_post'] as DateTime?;
    _postImage = snapshotData['post_image'] as String?;
    _postUser = snapshotData['post_user'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Post');

  static Stream<PostRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PostRecord.fromSnapshot(s));

  static Future<PostRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PostRecord.fromSnapshot(s));

  static PostRecord fromSnapshot(DocumentSnapshot snapshot) => PostRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PostRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PostRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PostRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PostRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPostRecordData({
  String? postTitle,
  String? postDiscribection,
  DateTime? timePost,
  String? postImage,
  DocumentReference? postUser,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'post_title': postTitle,
      'post_discribection': postDiscribection,
      'time_post': timePost,
      'post_image': postImage,
      'post_user': postUser,
    }.withoutNulls,
  );

  return firestoreData;
}

class PostRecordDocumentEquality implements Equality<PostRecord> {
  const PostRecordDocumentEquality();

  @override
  bool equals(PostRecord? e1, PostRecord? e2) {
    return e1?.postTitle == e2?.postTitle &&
        e1?.postDiscribection == e2?.postDiscribection &&
        e1?.timePost == e2?.timePost &&
        e1?.postImage == e2?.postImage &&
        e1?.postUser == e2?.postUser;
  }

  @override
  int hash(PostRecord? e) => const ListEquality().hash([
        e?.postTitle,
        e?.postDiscribection,
        e?.timePost,
        e?.postImage,
        e?.postUser
      ]);

  @override
  bool isValidKey(Object? o) => o is PostRecord;
}
