import 'package:go_router/go_router.dart';
import 'package:river_pd/go_louter/screens/root_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(
        path: '/',
        builder: (context, state) {
          return const RootScreen();
        }),
  ],
);
