import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'coin_list_record.g.dart';

abstract class CoinListRecord
    implements Built<CoinListRecord, CoinListRecordBuilder> {
  static Serializer<CoinListRecord> get serializer =>
      _$coinListRecordSerializer;

  @nullable
  String get name;

  @nullable
  String get price;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(CoinListRecordBuilder builder) => builder
    ..name = ''
    ..price = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('CoinList');

  static Stream<CoinListRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  CoinListRecord._();
  factory CoinListRecord([void Function(CoinListRecordBuilder) updates]) =
      _$CoinListRecord;

  static CoinListRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createCoinListRecordData({
  String name,
  String price,
}) =>
    serializers.toFirestore(
        CoinListRecord.serializer,
        CoinListRecord((c) => c
          ..name = name
          ..price = price));
