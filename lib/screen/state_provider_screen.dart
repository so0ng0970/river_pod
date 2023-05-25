import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_pd/riverpod/state_provider_screen.dart';
import '../layout/default_layout.dart';

class StateProviderScreen extends ConsumerWidget {
  const StateProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // watch - provider 바라보다 변경이 되면 빌드 재실행
    final provider = ref.watch(numberProvider);
    return DefaultLayout(
      title: 'StateProviderScreen',
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              provider.toString(),
            ),
            ElevatedButton(
              onPressed: () {
                ref.read(numberProvider.notifier).update(
                      (state) => state + 1,
                    );
              },
              child: const Text('UP'),
            ),
            ElevatedButton(
              onPressed: () {
                final state = ref.read(numberProvider.notifier).state;
                if (state > 0) {
                  ref.read(numberProvider.notifier).state =
                      ref.read(numberProvider.notifier).state - 1;
                }
              },
              child: const Text('DOWN'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const _NextScreen(),
                  ),
                );
              },
              child: const Text('Next Screen'),
            )
          ],
        ),
      ),
    );
  }
}

class _NextScreen extends ConsumerWidget {
  const _NextScreen();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(numberProvider);
    return DefaultLayout(
      title: 'StateProviderScreen',
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              provider.toString(),
            ),
            ElevatedButton(
              onPressed: () {
                ref.read(numberProvider.notifier).update(
                      (state) => state + 1,
                    );
              },
              child: const Text('UP'),
            )
          ],
        ),
      ),
    );
  }
}
