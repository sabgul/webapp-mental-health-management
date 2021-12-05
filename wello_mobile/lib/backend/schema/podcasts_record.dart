import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'podcasts_record.g.dart';

abstract class PodcastsRecord
    implements Built<PodcastsRecord, PodcastsRecordBuilder> {
  static Serializer<PodcastsRecord> get serializer =>
      _$podcastsRecordSerializer;

  @nullable
  String get description;

  @nullable
  String get url;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(PodcastsRecordBuilder builder) => builder
    ..description = ''
    ..url = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('podcasts');

  static Stream<PodcastsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  PodcastsRecord._();
  factory PodcastsRecord([void Function(PodcastsRecordBuilder) updates]) =
      _$PodcastsRecord;

  static PodcastsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createPodcastsRecordData({
  String description,
  String url,
}) =>
    serializers.toFirestore(
        PodcastsRecord.serializer,
        PodcastsRecord((p) => p
          ..description = description
          ..url = url));
