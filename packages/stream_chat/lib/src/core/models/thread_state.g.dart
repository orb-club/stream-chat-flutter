// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'thread_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ThreadState _$ThreadStateFromJson(Map<String, dynamic> json) => ThreadState(
      thread: json['thread'] == null
          ? null
          : ThreadModel.fromJson(json['thread'] as Map<String, dynamic>),
      replies: (json['replies'] as List<dynamic>?)
          ?.map((e) => Message.fromJson(e as Map<String, dynamic>))
          .toList(),
      read: (json['read'] as List<dynamic>?)
          ?.map((e) => Read.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ThreadStateToJson(ThreadState instance) =>
    <String, dynamic>{
      'thread': instance.thread?.toJson(),
      'replies': instance.replies?.map((e) => e.toJson()).toList(),
      'read': instance.read?.map((e) => e.toJson()).toList(),
    };
