import 'package:json_annotation/json_annotation.dart';
import 'package:stream_chat/src/core/models/message.dart';
import 'package:stream_chat/src/core/models/read.dart';
import 'package:stream_chat/src/core/models/thread_model.dart';

part 'thread_state.g.dart';

/// The class that contains the information about a thread
@JsonSerializable()
class ThreadState {
  /// Constructor used for json serialization
  ThreadState({
    this.thread,
    this.latestReplies,
    this.read,
  });

  /// The channel to which this state belongs
  final ThreadModel? thread;

  /// A paginated list of channel messages
  final List<Message>? latestReplies;

  /// The list of channel reads
  final List<Read>? read;

  /// Create a new instance from a json
  static ThreadState fromJson(Map<String, dynamic> json) =>
      _$ThreadStateFromJson(json);

  /// Serialize to json
  Map<String, dynamic> toJson() => _$ThreadStateToJson(this);

  /// Creates a copy of [ChannelState] with specified attributes overridden.
  ThreadState copyWith({
    ThreadModel? thread,
    List<Message>? latestReplies,
    List<Read>? read,
  }) =>
      ThreadState(
        thread: thread ?? this.thread,
        latestReplies: latestReplies ?? this.latestReplies,
        read: read ?? this.read,
      );
}
