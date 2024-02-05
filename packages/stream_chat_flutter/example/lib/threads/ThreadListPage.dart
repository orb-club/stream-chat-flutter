import 'dart:async';

import 'package:flutter/material.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class ThreadListPage extends StatefulWidget {
  const ThreadListPage({
    super.key,
    this.onTap,
  });

  final void Function(ThreadState)? onTap;

  @override
  State<ThreadListPage> createState() => _ThreadListPageState();
}

class _ThreadListPageState extends State<ThreadListPage> {
  late final _client = StreamChat.of(context).client;

  StreamSubscription<List<ThreadState>>? subscription = null;
  var threads = <ThreadState>[];

  @override
  void initState() {
    super.initState();
    subscription = _client
        .queryThreads(replyLimit: 3, participantLimit: 10)
        .asStream()
        .listen((event) {
      setState(() {
        threads = event;
      });
    });
  }

  @override
  void dispose() {
    subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: ListView.builder(
          itemBuilder: (context, index) {
            final state = threads[index];
            final pCount = state.thread?.participantCount ?? 0;
            return ThreadListItem(
              state: state,
              onTap: widget.onTap,
            );
          },
          itemCount: threads.length,
        ),
      );
}

class ThreadListItem extends StatelessWidget {
  const ThreadListItem({
    super.key,
    required this.state,
    this.onTap,
  });

  final ThreadState state;
  final void Function(ThreadState)? onTap;

  @override
  Widget build(BuildContext context) {
    final replyCount = state.latestReplies?.length ?? 0;
    return ListView.builder(
      itemBuilder: (context, index) {
        if (index == 0) {
          return Container(
            color: Colors.grey[200],
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  state.thread?.createdBy?.name ?? 'No author name',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Participants: ${state.thread?.participantCount ?? 0}'),
                Text(state.thread?.parentMessage?.text ?? 'No message text'),
              ],
            ),
          );
        }
        final reply = state.latestReplies![index - 1];
        return ListTile(
          title: Text(reply.user?.name ?? 'No user name'),
          subtitle: Text(reply.text ?? 'No message text'),
        );
      },
      itemCount: replyCount + 1,
      shrinkWrap: true,
    );
  }
}
