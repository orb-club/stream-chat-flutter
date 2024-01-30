import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:stream_chat/src/core/models/user.dart';

part 'thread_participant.g.dart';

/// The class that contains the information about the user membership
/// in a channel
@JsonSerializable()
class ThreadParticipant extends Equatable {
  /// Constructor used for json serialization
  ThreadParticipant({
    this.channelCid,
    this.threadId,
    this.user,
    DateTime? createdAt,
    this.leftThreadAt,
    this.extraData = const {},
  }) : createdAt = createdAt ?? DateTime.now();

  /// Create a new instance from a json
  factory ThreadParticipant.fromJson(Map<String, dynamic> json) {
    final participant = _$ThreadParticipantFromJson(json);
    return participant.copyWith(
      userId: participant.user?.id,
    );
  }

  /// The interested user
  final String? channelCid;

  /// The interested user
  final String? threadId;

  /// The interested user
  final User? user;

  /// The date of creation
  final DateTime createdAt;

  /// The last date of update
  final DateTime? leftThreadAt;

  /// Map of custom channel extraData
  final Map<String, Object?> extraData;

  /// Creates a copy of [Member] with specified attributes overridden.
  ThreadParticipant copyWith({
    String? userId,
    String? channelCid,
    String? threadId,
    User? user,
    DateTime? createdAt,
    DateTime? leftThreadAt,
    Map<String, Object?>? extraData,
  }) =>
      ThreadParticipant(
        channelCid: channelCid ?? this.channelCid,
        threadId: threadId ?? this.threadId,
        user: user ?? this.user,
        createdAt: createdAt ?? this.createdAt,
        leftThreadAt: leftThreadAt ?? this.leftThreadAt,
        extraData: extraData ?? this.extraData,
      );

  /// Serialize to json
  Map<String, dynamic> toJson() => _$ThreadParticipantToJson(this);

  @override
  List<Object?> get props => [
        channelCid,
        threadId,
        user,
        createdAt,
        leftThreadAt,
      ];
}
