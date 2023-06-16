import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:river_pd/go_louter/layout/default_layout.dart';

class PushScreen extends StatelessWidget {
  const PushScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      body: ListView(
        children: [
          // 현재 라우트에 스크린을 띄우는 것
          ElevatedButton(
            onPressed: () {
              context.push('/basic');
            },
            child: const Text(
              'push basic',
            ),
          ),
          // router에 지정된 순서대로 화면이동됨 
          ElevatedButton(
            onPressed: () {
              context.go(
                '/basic',
              );
            },
            child: const Text(
              'Go basic',
            ),
          ),
        ],
      ),
    );
  }
}
