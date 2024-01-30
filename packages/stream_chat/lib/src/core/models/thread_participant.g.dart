// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'thread_participant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ThreadParticipant _$ThreadParticipantFromJson(Map<String, dynamic> json) =>
    ThreadParticipant(
      channelCid: json['channel_cid'] as String?,
      threadId: json['thread_id'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      leftThreadAt: json['left_thread_at'] == null
          ? null
          : DateTime.parse(json['left_thread_at'] as String),
      extraData: json['extra_data'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$ThreadParticipantToJson(ThreadParticipant instance) =>
    <String, dynamic>{
      'channel_cid': instance.channelCid,
      'thread_id': instance.threadId,
      'user': instance.user?.toJson(),
      'created_at': instance.createdAt.toIso8601String(),
      'left_thread_at': instance.leftThreadAt?.toIso8601String(),
      'extra_data': instance.extraData,
    };
