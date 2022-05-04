import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'sidenavigation_record.g.dart';

abstract class SidenavigationRecord
    implements Built<SidenavigationRecord, SidenavigationRecordBuilder> {
  static Serializer<SidenavigationRecord> get serializer =>
      _$sidenavigationRecordSerializer;

  @nullable
  String get title;

  @nullable
  int get priority;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(SidenavigationRecordBuilder builder) => builder
    ..title = ''
    ..priority = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('sidenavigation');

  static Stream<SidenavigationRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<SidenavigationRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  SidenavigationRecord._();
  factory SidenavigationRecord(
          [void Function(SidenavigationRecordBuilder) updates]) =
      _$SidenavigationRecord;

  static SidenavigationRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createSidenavigationRecordData({
  String title,
  int priority,
}) =>
    serializers.toFirestore(
        SidenavigationRecord.serializer,
        SidenavigationRecord((s) => s
          ..title = title
          ..priority = priority));
