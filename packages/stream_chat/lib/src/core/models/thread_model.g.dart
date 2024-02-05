// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'thread_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ThreadModel _$ThreadModelFromJson(Map<String, dynamic> json) => ThreadModel(
      channel: json['channel'] == null
          ? null
          : ChannelModel.fromJson(json['channel'] as Map<String, dynamic>),
      parentMessage: json['parent_message'] == null
          ? null
          : Message.fromJson(json['parent_message'] as Map<String, dynamic>),
      createdBy: json['created_by'] == null
          ? null
          : User.fromJson(json['created_by'] as Map<String, dynamic>),
      replyCount: json['reply_count'] as int?,
      participantCount: json['participant_count'] as int?,
      participants: (json['thread_participants'] as List<dynamic>?)
          ?.map((e) => ThreadParticipant.fromJson(e as Map<String, dynamic>))
          .toList(),
      lastMessageAt: json['last_message_at'] == null
          ? null
          : DateTime.parse(json['last_message_at'] as String),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      deletedAt: json['deleted_at'] == null
          ? null
          : DateTime.parse(json['deleted_at'] as String),
      title: json['title'] as String?,
      extraData: json['extra_data'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$ThreadModelToJson(ThreadModel instance) =>
    <String, dynamic>{
      'deleted_at': instance.deletedAt?.toIso8601String(),
      'participant_count': instance.participantCount,
      'thread_participants':
          instance.participants?.map((e) => e.toJson()).toList(),
      'reply_count': instance.replyCount,
      'extra_data': instance.extraData,
    };
