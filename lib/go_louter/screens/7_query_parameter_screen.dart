import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:river_pd/go_louter/layout/default_layout.dart';

class QueryParameterScreen extends StatelessWidget {
  const QueryParameterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      body: ListView(
        children: [
          Text(
            'query parameter :${GoRouterState.of(context).queryParameters}',
          ),
          // /query_parameters?utm=google&utm_source=123
          // /query_parameters?name=soonger&age=27
          ElevatedButton(
            onPressed: () {
              context.push(
                Uri(
                  path: '/query_param',
                  queryParameters: {
                    'name': 'soonger',
                    'age': '27',
                  },
                ).toString(),
              );
            },
            child: const Text(
              'Query Parameter',
            ),
          )
        ],
      ),
    );
  }
}
