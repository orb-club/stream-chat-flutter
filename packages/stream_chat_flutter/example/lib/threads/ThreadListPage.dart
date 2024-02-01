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
    subscription = _client.queryThreads().asStream().listen((event) {
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
            return ListTile(
              title: Text(state.thread?.title ?? 'No title'),
              subtitle: Text('Participants: $pCount'),
              onTap: () {
                widget.onTap?.call(state);
              },
            );
          },
          itemCount: threads.length,
        ),
      );
}
