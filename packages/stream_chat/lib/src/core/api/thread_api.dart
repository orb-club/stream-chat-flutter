import 'package:stream_chat/src/core/http/stream_http_client.dart';
import 'package:stream_chat/stream_chat.dart';

/// Defines the api dedicated to thread operations
class ThreadApi {
  /// Initialize a new device api
  ThreadApi(this._client);

  final StreamHttpClient _client;

  /// Requests threads with a given query from the API.
  Future<QueryThreadsResponse> queryThreads({
    bool watch = true,
    int? replyLimit,
    int? participantLimit,
    PrevNextPager pager = const PrevNextPager(),
  }) async {
    final response = await _client.post(
      '/threads',
      data: {
        // default options
        'watch': watch,

        // passed options
        if (replyLimit != null) 'reply_limit': replyLimit,
        if (participantLimit != null) 'participant_limit': participantLimit,

        // pagination
        ...pager.toJson(),
      },
    );
    return QueryThreadsResponse.fromJson(response.data);
  }

  /// Requests threads with a given query from the API.
  Future<QueryThreadsResponse> getThread(
    String threadId, {
    bool watch = true,
    int? replyLimit,
    int? participantLimit,
  }) async {
    final response = await _client.get(
      '/threads/$threadId',
      queryParameters: {
        // default options
        'watch': watch,

        // passed options
        if (replyLimit != null) 'reply_limit': replyLimit,
        if (participantLimit != null) 'participant_limit': participantLimit,
      },
    );
    return QueryThreadsResponse.fromJson(response.data);
  }

  /// Updates the [channelId] of type [ChannelType] data with [data]
  Future<PartialUpdateThreadResponse> updateThreadPartial(
    String threadId, {
    Map<String, Object?>? set,
    List<String>? unset,
  }) async {
    final response = await _client.patch(
      '/threads/$threadId',
      data: {
        if (set != null) 'set': set,
        if (unset != null) 'unset': unset,
      },
    );
    return PartialUpdateThreadResponse.fromJson(response.data);
  }
}
