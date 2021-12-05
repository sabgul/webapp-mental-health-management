import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'journal_entries_record.g.dart';

abstract class JournalEntriesRecord
    implements Built<JournalEntriesRecord, JournalEntriesRecordBuilder> {
  static Serializer<JournalEntriesRecord> get serializer =>
      _$journalEntriesRecordSerializer;

  @nullable
  String get name;

  @nullable
  String get description;

  @nullable
  String get text;

  @nullable
  String get email;

  @nullable
  DateTime get timestamp;

  @nullable
  String get date;

  @nullable
  String get time;

  @nullable
  @BuiltValueField(wireName: 'image_url')
  String get imageUrl;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(JournalEntriesRecordBuilder builder) => builder
    ..name = ''
    ..description = ''
    ..text = ''
    ..email = ''
    ..date = ''
    ..time = ''
    ..imageUrl = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('journal_entries');

  static Stream<JournalEntriesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  JournalEntriesRecord._();
  factory JournalEntriesRecord(
          [void Function(JournalEntriesRecordBuilder) updates]) =
      _$JournalEntriesRecord;

  static JournalEntriesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createJournalEntriesRecordData({
  String name,
  String description,
  String text,
  String email,
  DateTime timestamp,
  String date,
  String time,
  String imageUrl,
}) =>
    serializers.toFirestore(
        JournalEntriesRecord.serializer,
        JournalEntriesRecord((j) => j
          ..name = name
          ..description = description
          ..text = text
          ..email = email
          ..timestamp = timestamp
          ..date = date
          ..time = time
          ..imageUrl = imageUrl));
