import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'journal_viewing_date_record.g.dart';

abstract class JournalViewingDateRecord
    implements
        Built<JournalViewingDateRecord, JournalViewingDateRecordBuilder> {
  static Serializer<JournalViewingDateRecord> get serializer =>
      _$journalViewingDateRecordSerializer;

  @nullable
  String get date;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(JournalViewingDateRecordBuilder builder) =>
      builder..date = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('journal_viewing_date');

  static Stream<JournalViewingDateRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  JournalViewingDateRecord._();
  factory JournalViewingDateRecord(
          [void Function(JournalViewingDateRecordBuilder) updates]) =
      _$JournalViewingDateRecord;

  static JournalViewingDateRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createJournalViewingDateRecordData({
  String date,
}) =>
    serializers.toFirestore(JournalViewingDateRecord.serializer,
        JournalViewingDateRecord((j) => j..date = date));
