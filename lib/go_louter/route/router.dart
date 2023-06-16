import 'package:go_router/go_router.dart';
import 'package:river_pd/go_louter/screens/1_basic_screen.dart';
import 'package:river_pd/go_louter/screens/2_named_screen.dart';
import 'package:river_pd/go_louter/screens/3_push_screen.dart';
import 'package:river_pd/go_louter/screens/root_screen.dart';

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
      ],
    ),
  ],
);
