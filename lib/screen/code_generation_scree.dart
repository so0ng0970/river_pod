import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_pd/layout/default_layout.dart';
import 'package:river_pd/riverpod/code_generation_provider.dart';

class CodeGenerationScreen extends ConsumerWidget {
  const CodeGenerationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state1 = ref.watch(gStateProvider);
    return DefaultLayout(
      title: 'Code generation screen',
      body: Column(
        children: [
          Text(
            'state1 : $state1',
          ),
        ],
      ),
    );
  }
}
