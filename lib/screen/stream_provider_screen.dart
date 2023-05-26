import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_pd/layout/default_layout.dart';
import 'package:river_pd/riverpod/stream_provider.dart';

class StreamProviderScreen extends ConsumerWidget {
  const StreamProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(multipleStreamProvider);
    return DefaultLayout(
      body: Center(
        child: state.when(
          data: (data) {
            return Text(
              data.toString(),
            );
          },
          error: (error, Stack) {
            return Text(error.toString());
          },
          loading: () => const CircularProgressIndicator(),
        ),
      ),
      title: 'stream provider screen',
    );
  }
}
