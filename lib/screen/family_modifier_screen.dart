import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_pd/layout/default_layout.dart';
import 'package:river_pd/riverpod/family_modifier_provider.dart';

class FamilyModifierScreen extends ConsumerWidget {
  const FamilyModifierScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // data 값에 해당되는 것을 파라미터로 넣어줘야함
    final state = ref.watch(
      familyModifierProvider(5),
    );
    return DefaultLayout(
      body: Center(
        child: state.when(
          data: (data) {
            return Text(
              data.toString(),
            );
          },
          error: (err, Stack) {
            return Text(
              err.toString(),
            );
          },
          loading: () => const CircularProgressIndicator(),
        ),
      ),
      title: 'family modifier screen',
    );
  }
}
