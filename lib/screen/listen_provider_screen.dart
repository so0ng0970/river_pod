import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_pd/layout/default_layout.dart';
import 'package:river_pd/riverpod/listen_provider.dart';

class ListenProviderScreen extends ConsumerStatefulWidget {
  const ListenProviderScreen({super.key});

  @override
  ConsumerState<ListenProviderScreen> createState() =>
      _ListenProviderScreenState();
}

class _ListenProviderScreenState extends ConsumerState<ListenProviderScreen>
    with TickerProviderStateMixin {
  late final TabController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller = TabController(
      length: 10,
      vsync: this,
      initialIndex: ref.read(listenProvider),
    );
  }

  @override
  Widget build(BuildContext context) {
    //  dispose 안해도 중복으로 listen 안되게 설정함
    ref.listen<int>(listenProvider, (previous, next) {
      if (previous != next) {
        controller.animateTo(next);
      }
    });
    return DefaultLayout(
      title: 'Listen Provider Screen',
      body: TabBarView(
        controller: controller,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(
          10,
          (index) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                index.toString(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[300],
                    ),
                    onPressed: () {
                      ref
                          .read(listenProvider.notifier)
                          .update((state) => state == 0 ? 0 : state - 1);
                    },
                    child: const Text('뒤로'),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      ref
                          .read(listenProvider.notifier)
                          .update((state) => state == 10 ? 10 : state + 1);
                    },
                    child: const Text('다음'),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
