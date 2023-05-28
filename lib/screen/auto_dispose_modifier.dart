import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_pd/layout/default_layout.dart';
import 'package:river_pd/riverpod/auto_dispose_modifier_provider.dart';

class AutoDisposeModifierScreen extends ConsumerWidget {
  const AutoDisposeModifierScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(autoDisposeModifierProvider);
    return DefaultLayout(
      // 캐시를 삭제 , 자동으로 삭제를 한다. 필요할때 다시 생성
      title: 'Auto Dispose ModifierScreen',
      body: Center(
        child: state.when(
          data: (data) {
            return Text(
              data.toString(),
            );
          },
          error: (error, stack) {
            return Text(
              error.toString(),
            );
          },
          loading: () => const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
