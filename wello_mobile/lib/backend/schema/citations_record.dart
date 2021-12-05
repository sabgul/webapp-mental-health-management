import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'citations_record.g.dart';

abstract class CitationsRecord
    implements Built<CitationsRecord, CitationsRecordBuilder> {
  static Serializer<CitationsRecord> get serializer =>
      _$citationsRecordSerializer;

  @nullable
  String get text;

  @nullable
  String get author;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(CitationsRecordBuilder builder) => builder
    ..text = ''
    ..author = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('citations');

  static Stream<CitationsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  CitationsRecord._();
  factory CitationsRecord([void Function(CitationsRecordBuilder) updates]) =
      _$CitationsRecord;

  static CitationsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createCitationsRecordData({
  String text,
  String author,
}) =>
    serializers.toFirestore(
        CitationsRecord.serializer,
        CitationsRecord((c) => c
          ..text = text
          ..author = author));
