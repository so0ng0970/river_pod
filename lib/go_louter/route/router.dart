import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:river_pd/go_louter/screens/10_transition_screen1.dart';
import 'package:river_pd/go_louter/screens/11.error_screen.dart';
import 'package:river_pd/go_louter/screens/1_basic_screen.dart';
import 'package:river_pd/go_louter/screens/2_named_screen.dart';
import 'package:river_pd/go_louter/screens/3_push_screen.dart';
import 'package:river_pd/go_louter/screens/4_pop_base_screen.dart';
import 'package:river_pd/go_louter/screens/5_pop_return_screen.dart';
import 'package:river_pd/go_louter/screens/7_query_parameter_screen.dart';
import 'package:river_pd/go_louter/screens/8_nested_screen.dart';
import 'package:river_pd/go_louter/screens/9_login_screen.dart';
import 'package:river_pd/go_louter/screens/9_private_screen.dart';
import 'package:river_pd/go_louter/screens/root_screen.dart';

import '../screens/10_transition_screen2.dart';
import '../screens/6_path_param_screen.dart';
import '../screens/8_child_screen.dart';

// 로그인이 된지 안됐는지
bool authState = false;

final router = GoRouter(
  redirect: (context, state) {
    // return string (path) -> 해당 패스로 이동한다
    // return null -> 원래 이동하려던 라우트로 이동한다
    if (state.location == '/login/private' && !authState) {
      return '/login';
    }
    return null;
  },
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
        ),
        ShellRoute(
          builder: (context, state, child) {
            return NestedScreen(
              child: child,
            );
          },
          // child 내용
          routes: [
            GoRoute(
              path: 'Nested/a',
              builder: (_, state) => const NestedChildScreen(
                routeName: '/nested/a',
              ),
            ),
            GoRoute(
              path: 'Nested/b',
              builder: (_, state) => const NestedChildScreen(
                routeName: '/nested/b',
              ),
            ),
            GoRoute(
              path: 'Nested/c',
              builder: (_, state) => const NestedChildScreen(
                routeName: '/nested/c',
              ),
            ),
          ],
        ),
        GoRoute(
          path: 'login',
          builder: (_, state) => const LoginScreen(),
          routes: [
            GoRoute(
              path: 'private',
              builder: (_, state) => const PrivateScreen(),
            )
          ],
        ),
        GoRoute(
          path: 'login2',
          builder: (_, state) => const LoginScreen(),
          routes: [
            GoRoute(
              path: 'private',
              builder: (_, state) => const PrivateScreen(),
              redirect: (context, state) {
                if (!authState) {
                  return '/login2';
                }
                return null;
              },
            )
          ],
        ),
        GoRoute(
          path: 'transition',
          builder: (_, state) => const TransitionScreen1(),
          routes: [
            GoRoute(
              path: 'detail',
              pageBuilder: (_, state) => CustomTransitionPage(
                transitionDuration: const Duration(seconds: 3),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return FadeTransition(
                    opacity: animation,
                    child: child,
                  );
                },
                child: const TransitionScreen2(),
              ),
            )
          ],
        )
      ],
    ),
  ],
  errorBuilder: (context, state) => ErrorScreen(error: state.error.toString()),
  debugLogDiagnostics: true,
);
