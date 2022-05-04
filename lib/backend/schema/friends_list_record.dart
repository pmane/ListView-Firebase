import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'friends_list_record.g.dart';

abstract class FriendsListRecord
    implements Built<FriendsListRecord, FriendsListRecordBuilder> {
  static Serializer<FriendsListRecord> get serializer =>
      _$friendsListRecordSerializer;

  @nullable
  String get name;

  @nullable
  int get phone;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(FriendsListRecordBuilder builder) => builder
    ..name = ''
    ..phone = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('friends_list');

  static Stream<FriendsListRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<FriendsListRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  FriendsListRecord._();
  factory FriendsListRecord([void Function(FriendsListRecordBuilder) updates]) =
      _$FriendsListRecord;

  static FriendsListRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createFriendsListRecordData({
  String name,
  int phone,
}) =>
    serializers.toFirestore(
        FriendsListRecord.serializer,
        FriendsListRecord((f) => f
          ..name = name
          ..phone = phone));
