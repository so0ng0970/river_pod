import 'package:go_router/go_router.dart';
import 'package:river_pd/go_louter/screens/1_basic_screen.dart';
import 'package:river_pd/go_louter/screens/2_named_screen.dart';
import 'package:river_pd/go_louter/screens/3_push_screen.dart';
import 'package:river_pd/go_louter/screens/4_pop_base_screen.dart';
import 'package:river_pd/go_louter/screens/5_pop_return_screen.dart';
import 'package:river_pd/go_louter/screens/7_query_parameter_screen.dart';
import 'package:river_pd/go_louter/screens/root_screen.dart';

import '../screens/6_path_param_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        return const RootScreen();
      },
      routes: [
        GoRoute(
          path: 'basic',
          builder: (context, state) {
            return const BasicScreen();
          },
        ),
        GoRoute(
          path: 'named',
          name: 'named_screen',
          builder: (context, state) {
            return const NamedScreen();
          },
        ),
        GoRoute(
          path: 'push',
          name: 'push_screen',
          builder: (context, state) {
            return const PushScreen();
          },
        ),
        GoRoute(
          path: 'pop',
          name: 'pop_screen',
          builder: (context, state) {
            return const PopBaseScreen();
          },
          routes: [
            GoRoute(
              path: 'return',
              builder: (context, state) {
                return const PopReturnScreen();
              },
            )
          ],
        ),
        GoRoute(
          path: 'path_param/:id', // / path_param/123
          builder: (context, state) {
            return const PathParamScreen();
          },
          routes: [
            GoRoute(
              path: ':name',
              builder: (context, state) {
                return const PathParamScreen();
              },
            )
          ],
        ),
        GoRoute(
          path: 'query_param',
          builder: (context, state) {
            return const QueryParameterScreen();
          },
        )
      ],
    ),
  ],
);
