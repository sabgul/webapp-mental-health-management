import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'emotion_journal_entries_record.g.dart';

abstract class EmotionJournalEntriesRecord
    implements
        Built<EmotionJournalEntriesRecord, EmotionJournalEntriesRecordBuilder> {
  static Serializer<EmotionJournalEntriesRecord> get serializer =>
      _$emotionJournalEntriesRecordSerializer;

  @nullable
  String get emotion;

  @nullable
  String get trigger;

  @nullable
  String get text;

  @nullable
  String get email;

  @nullable
  DateTime get date;

  @nullable
  DateTime get time;

  @nullable
  @BuiltValueField(wireName: 'photo_url')
  String get photoUrl;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(EmotionJournalEntriesRecordBuilder builder) =>
      builder
        ..emotion = ''
        ..trigger = ''
        ..text = ''
        ..email = ''
        ..photoUrl = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('emotion_journal_entries');

  static Stream<EmotionJournalEntriesRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  EmotionJournalEntriesRecord._();
  factory EmotionJournalEntriesRecord(
          [void Function(EmotionJournalEntriesRecordBuilder) updates]) =
      _$EmotionJournalEntriesRecord;

  static EmotionJournalEntriesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createEmotionJournalEntriesRecordData({
  String emotion,
  String trigger,
  String text,
  String email,
  DateTime date,
  DateTime time,
  String photoUrl,
}) =>
    serializers.toFirestore(
        EmotionJournalEntriesRecord.serializer,
        EmotionJournalEntriesRecord((e) => e
          ..emotion = emotion
          ..trigger = trigger
          ..text = text
          ..email = email
          ..date = date
          ..time = time
          ..photoUrl = photoUrl));
