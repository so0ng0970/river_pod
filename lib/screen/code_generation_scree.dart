import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_pd/layout/default_layout.dart';
import 'package:river_pd/riverpod/code_generation_provider.dart';

class CodeGenerationScreen extends ConsumerWidget {
  const CodeGenerationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('build');
    final state1 = ref.watch(gStateProvider);
    final state2 = ref.watch(gStateFutureProvider);
    final state3 = ref.watch(gStateFuture2Provider);
    final state4 = ref.watch(
      gStateMultiplyProvider(number1: 5, number2: 4),
    );

    return DefaultLayout(
      title: 'Code generation screen',
      body: Column(
        children: [
          Text(
            'state1 : $state1',
          ),
          state2.when(
            data: (data) {
              return Text(
                'state2 : $data',
                textAlign: TextAlign.center,
              );
            },
            error: (err, stack) {
              return Text(
                err.toString(),
              );
            },
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
          ),
          state3.when(
            data: (data) {
              return Text(
                'state3 : $data',
                textAlign: TextAlign.center,
              );
            },
            error: (err, stack) {
              return Text(
                err.toString(),
              );
            },
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
          ),
          Text('state4 : $state4'),
          Consumer(
            builder: (context, ref, child) {
              print('builder build');
              final state5 = ref.watch(gStateNotifierProvider);
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('state5 : $state5  '),
                  if (child != null) child,
                ],
              );
            },
            child: const Text('hello'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  ref.read(gStateNotifierProvider.notifier).increment();
                },
                child: const Text('Increment'),
              ),
              ElevatedButton(
                onPressed: () {
                  ref.watch(gStateNotifierProvider.notifier).decrement();
                },
                child: const Text('decrement'),
              ),
            ],
          ),
          // invalidate()
          // 유효하지 않게 하다
          // 초기값으로 돌아가게 됨
          ElevatedButton(
            onPressed: () {
              ref.invalidate(gStateNotifierProvider);
            },
            child: const Text('invalidate'),
          ),
        ],
      ),
    );
  }
}

class _StateFiveWidget extends ConsumerWidget {
  const _StateFiveWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state5 = ref.watch(gStateNotifierProvider);
    return Text('state5 : $state5');
  }
}
