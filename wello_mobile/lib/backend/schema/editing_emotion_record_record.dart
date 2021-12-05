import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'editing_emotion_record_record.g.dart';

abstract class EditingEmotionRecordRecord
    implements
        Built<EditingEmotionRecordRecord, EditingEmotionRecordRecordBuilder> {
  static Serializer<EditingEmotionRecordRecord> get serializer =>
      _$editingEmotionRecordRecordSerializer;

  @nullable
  String get emotion;

  @nullable
  String get email;

  @nullable
  String get date;

  @nullable
  String get time;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(EditingEmotionRecordRecordBuilder builder) =>
      builder
        ..emotion = ''
        ..email = ''
        ..date = ''
        ..time = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('editing_emotion_record');

  static Stream<EditingEmotionRecordRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  EditingEmotionRecordRecord._();
  factory EditingEmotionRecordRecord(
          [void Function(EditingEmotionRecordRecordBuilder) updates]) =
      _$EditingEmotionRecordRecord;

  static EditingEmotionRecordRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createEditingEmotionRecordRecordData({
  String emotion,
  String email,
  String date,
  String time,
}) =>
    serializers.toFirestore(
        EditingEmotionRecordRecord.serializer,
        EditingEmotionRecordRecord((e) => e
          ..emotion = emotion
          ..email = email
          ..date = date
          ..time = time));
