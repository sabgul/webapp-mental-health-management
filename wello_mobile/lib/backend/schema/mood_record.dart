import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'mood_record.g.dart';

abstract class MoodRecord implements Built<MoodRecord, MoodRecordBuilder> {
  static Serializer<MoodRecord> get serializer => _$moodRecordSerializer;

  @nullable
  String get mood;

  @nullable
  String get email;

  @nullable
  String get date;

  @nullable
  String get time;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(MoodRecordBuilder builder) => builder
    ..mood = ''
    ..email = ''
    ..date = ''
    ..time = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('mood');

  static Stream<MoodRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  MoodRecord._();
  factory MoodRecord([void Function(MoodRecordBuilder) updates]) = _$MoodRecord;

  static MoodRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createMoodRecordData({
  String mood,
  String email,
  String date,
  String time,
}) =>
    serializers.toFirestore(
        MoodRecord.serializer,
        MoodRecord((m) => m
          ..mood = mood
          ..email = email
          ..date = date
          ..time = time));
