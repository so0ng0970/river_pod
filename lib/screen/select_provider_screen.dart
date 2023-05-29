import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_pd/layout/default_layout.dart';
import 'package:river_pd/riverpod/select_provider.dart';

class SelectProviderScreen extends ConsumerWidget {
  const SelectProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('빌드');
    final state = ref.watch(
      selectProvider.select((value) => value.isSpicy),
    );
    ref.listen(selectProvider.select((value) => value.hasBought),
        (previous, next) {
      print('next:$next');
    });
    return DefaultLayout(
      title: 'Select Provider Screen',
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text(state.name),
            // CheckboxListTile(
            //   title: Text('구매  ${state.hasBought}'),
            //   value: state.hasBought,
            //   onChanged: (e) {
            //     ref.read(selectProvider.notifier).toggleHasBought();
            //   },
            // ),
            // CheckboxListTile(
            //   title: Text('맵기  ${state.isSpicy}'),
            //   value: state.isSpicy,
            //   onChanged: (e) {
            //     ref.read(selectProvider.notifier).toggleHasSpicy();
            //   },
            // ),
            Text(state.toString()),
            ElevatedButton(
              onPressed: () {
                ref.read(selectProvider.notifier).toggleHasSpicy();
              },
              child: const Text('HasSpicy'),
            ),
            ElevatedButton(
              onPressed: () {
                ref.read(selectProvider.notifier).toggleHasBought();
              },
              child: const Text('HasBought'),
            ),
          ],
        ),
      ),
    );
  }
}
