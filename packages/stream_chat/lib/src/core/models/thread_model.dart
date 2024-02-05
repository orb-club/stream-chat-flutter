import 'package:json_annotation/json_annotation.dart';
import 'package:stream_chat/src/core/models/thread_participant.dart';
import 'package:stream_chat/src/core/util/serializer.dart';
import 'package:stream_chat/stream_chat.dart';

part 'thread_model.g.dart';

/// The class that contains the information about a channel
@JsonSerializable()
class ThreadModel {
  /// Constructor used for json serialization
  ThreadModel({
    this.channel,
    this.parentMessage,
    this.createdBy,
    this.replyCount,
    this.participantCount,
    this.participants,
    this.lastMessageAt,
    DateTime? createdAt,
    DateTime? updatedAt,
    this.deletedAt,
    this.title,
    this.extraData = const {},
  })  : createdAt = createdAt ?? DateTime.now(),
        updatedAt = updatedAt ?? DateTime.now();

  /// Create a new instance from a json
  factory ThreadModel.fromJson(Map<String, dynamic> json) =>
      _$ThreadModelFromJson(
        Serializer.moveToExtraDataFromRoot(json, topLevelFields),
      );

  /// The channel this thread belongs to
  @JsonKey(includeToJson: false)
  final ChannelModel? channel;

  /// The parent message of this thread
  @JsonKey(includeToJson: false)
  final Message? parentMessage;

  /// The user that created this thread
  @JsonKey(includeToJson: false)
  final User? createdBy;

  /// The date of the last message
  @JsonKey(includeToJson: false)
  final DateTime? lastMessageAt;

  /// The date of thread creation
  @JsonKey(includeToJson: false)
  final DateTime createdAt;

  /// The date of the last thread update
  @JsonKey(includeToJson: false)
  final DateTime updatedAt;

  /// The date of thread deletion
  final DateTime? deletedAt;

  /// The count of this thread participants
  final int? participantCount;

  /// The list of participants
  @JsonKey(name: 'thread_participants')
  final List<ThreadParticipant>? participants;

  /// The count of this thread replies
  final int? replyCount;

  /// The title of this thread
  @JsonKey(includeToJson: false)
  final String? title;

  /// Map of custom thread extraData
  final Map<String, Object?> extraData;

  /// Known top level fields.
  /// Useful for [Serializer] methods.
  static const topLevelFields = [
    'channel',
    'parent_message',
    'created_by',
    'participant_count',
    'thread_participants',
    'reply_count',
    'last_message_at',
    'created_at',
    'updated_at',
    'deleted_at',
    'title',
  ];

  /// Serialize to json
  Map<String, dynamic> toJson() => Serializer.moveFromExtraDataToRoot(
        _$ThreadModelToJson(this),
      );

  /// Creates a copy of [ChannelModel] with specified attributes overridden.
  ThreadModel copyWith({
    ChannelModel? channel,
    Message? parentMessage,
    User? createdBy,
    DateTime? lastMessageAt,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? deletedAt,
    int? participantCount,
    List<ThreadParticipant>? participants,
    int? replyCount,
    String? title,
    Map<String, Object?>? extraData,
  }) =>
      ThreadModel(
        channel: channel ?? this.channel,
        parentMessage: parentMessage ?? this.parentMessage,
        createdBy: createdBy ?? this.createdBy,
        lastMessageAt: lastMessageAt ?? this.lastMessageAt,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt ?? this.deletedAt,
        participantCount: participantCount ?? this.participantCount,
        participants: participants ?? this.participants,
        replyCount: replyCount ?? this.replyCount,
        title: title ?? this.title,
        extraData: extraData ?? this.extraData,
      );

  /// Returns a new [ChannelModel] that is a combination of this channelModel
  /// and the given [other] channelModel.
  ThreadModel merge(ThreadModel other) => copyWith(
        channel: other.channel,
        parentMessage: other.parentMessage,
        createdBy: other.createdBy,
        lastMessageAt: other.lastMessageAt,
        createdAt: other.createdAt,
        updatedAt: other.updatedAt,
        deletedAt: other.deletedAt,
        participantCount: other.participantCount,
        participants: other.participants,
        replyCount: other.replyCount,
        title: other.title,
        extraData: {
          ...extraData,
          ...other.extraData,
        },
      );
}
