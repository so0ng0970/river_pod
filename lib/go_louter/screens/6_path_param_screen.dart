import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:river_pd/go_louter/layout/default_layout.dart';

class PathParamScreen extends StatelessWidget {
  const PathParamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      body: ListView(
        children: [
          Text('path ${GoRouterState.of(context).pathParameters}'),
          ElevatedButton(
            onPressed: () {
              context.go(
                '/path_param/123/숭어',
              );
            },
            child: const Text(
              'Path Param',
            ),
          )
        ],
      ),
    );
  }
}
