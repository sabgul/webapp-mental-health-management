import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'meditations_record.g.dart';

abstract class MeditationsRecord
    implements Built<MeditationsRecord, MeditationsRecordBuilder> {
  static Serializer<MeditationsRecord> get serializer =>
      _$meditationsRecordSerializer;

  @nullable
  String get url;

  @nullable
  String get description;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(MeditationsRecordBuilder builder) => builder
    ..url = ''
    ..description = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('meditations');

  static Stream<MeditationsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  MeditationsRecord._();
  factory MeditationsRecord([void Function(MeditationsRecordBuilder) updates]) =
      _$MeditationsRecord;

  static MeditationsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createMeditationsRecordData({
  String url,
  String description,
}) =>
    serializers.toFirestore(
        MeditationsRecord.serializer,
        MeditationsRecord((m) => m
          ..url = url
          ..description = description));
