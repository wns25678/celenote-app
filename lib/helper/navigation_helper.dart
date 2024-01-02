import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:celenote_app/screens/bottom_navigation/bottom_navigation.dart';
import 'package:celenote_app/screens/ex/ex_page.dart';
import 'package:celenote_app/screens/find_friends/find_friends_page.dart';
import 'package:celenote_app/screens/home/home_page.dart';
import 'package:celenote_app/screens/my/my_page.dart';
import 'package:celenote_app/screens/my/my_page_login_state.dart';
import 'package:celenote_app/screens/my_record/my_record_page.dart';
import 'package:celenote_app/screens/my_wedding/my_wedding_page.dart';
import 'package:celenote_app/screens/record/record_page.dart';
import 'package:celenote_app/screens/sign_up/signup_screen.dart';
import 'package:celenote_app/screens/sign_up/val_phone_num_screen.dart';


class NavigationHelper {
  static final NavigationHelper _instance = NavigationHelper._internal();

  static NavigationHelper get instance => _instance;
  factory NavigationHelper() {
    return _instance;
  }

  static late final GoRouter router;

  static final GlobalKey<NavigatorState> routerKey =
      GlobalKey<NavigatorState>();

  static final homeKey = GlobalKey<NavigatorState>();
  static final myRecordKey = GlobalKey<NavigatorState>();
  static final exKey = GlobalKey<NavigatorState>();
  static final myKey = GlobalKey<NavigatorState>();
  static final signupKey = GlobalKey<NavigatorState>();
  static final valPhoneKey = GlobalKey<NavigatorState>();

  BuildContext get context =>
      router.routerDelegate.navigatorKey.currentContext!;

  GoRouterDelegate get routerDelegate => router.routerDelegate;

  GoRouteInformationParser get routeInformationParser =>
      router.routeInformationParser;

  NavigationHelper._internal() {
    final routes = [
      StatefulShellRoute.indexedStack(
        parentNavigatorKey: routerKey,
        pageBuilder: (
          BuildContext context,
          GoRouterState state,
          StatefulNavigationShell navigationShell,
        ) {
          return getPage(
            child: BottomNavigation(
              navigationShell: navigationShell,
            ),
            state: state,
          );
        },
        branches: [
          StatefulShellBranch(
            navigatorKey: homeKey,
            routes: [
              GoRoute(
                name: 'home',
                path: '/home',
                pageBuilder: (context, GoRouterState state) {
                  return getPage(
                    child: const HomePage(),
                    state: state,
                  );
                },
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: myRecordKey,
            routes: [
              GoRoute(
                name: 'my_record',
                path: '/my_record',
                pageBuilder: (context, GoRouterState state) {
                  return getPage(
                    child: const MyRecordPage(),
                    state: state,
                  );
                },
                routes: [
                  GoRoute(
                    parentNavigatorKey: myRecordKey,
                    name: 'find_friends',
                    path: 'find_friends',
                    builder: (context, state) {
                      return const FindFriendsPage();
                    },
                    routes: [
                      GoRoute(
                        parentNavigatorKey: myRecordKey,
                        name: 'record',
                        path: 'record/:recordid',
                        pageBuilder: (context, state) {
                          final index = state.pathParameters['recordid'] ?? '';
                          return getPage(
                            child: RecordPage(
                              recordid: index,
                            ),
                            state: state,
                          );
                        },
                      ),
                      GoRoute(
                        parentNavigatorKey: myRecordKey,
                        name: 'record_my_wedding',
                        path: 'my_wedding',
                        pageBuilder: (context, state) {
                          return getPage(
                            child: const MyWeddingPage(),
                            state: state,
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: exKey,
            routes: [
              GoRoute(
                name: 'ex',
                path: '/ex',
                pageBuilder: (context, GoRouterState state) {
                  return getPage(
                    child: const ExPage(),
                    state: state,
                  );
                },
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: myKey,
            routes: [
              GoRoute(
                name: 'my',
                path: '/my',
                pageBuilder: (context, state) {
                  return getPage(
                    child: const MyPage(),
                    state: state,
                  );
                },
                routes: [
                  GoRoute(
                    parentNavigatorKey: myKey,
                    name: 'my_wedding',
                    path: 'my_wedding',
                    pageBuilder: (context, state) {
                      return getPage(
                        child: const MyWeddingPage(),
                        state: state,
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: signupKey,
            routes: [
              GoRoute(
                name: 'input_phone_number',
                path: '/input_phone_number',
                pageBuilder: (context, state) {
                  return getPage(
                    child: const InputPhoneNumScreen(),
                    state: state,
                  );
                },
              ),
              GoRoute(
                name: 'enter_name',
                path: '/enter_name',
                pageBuilder: (context, state) {
                  return getPage(
                    child: const InputPhoneNumScreen(),
                    state: state,
                  );
                },
              ),
              GoRoute(
                name: 'validate_phone_number',
                path: '/validate_phone_number',
                pageBuilder: (context, state) {
                  return getPage(
                    child: const ValPhoneNumScreen(),
                    state: state,
                  );
                },
              )
              // GoRoute(
              //   path: 'enter_email',
              //   name: '/enter_email',
              //   pageBuilder: (context, state) {
              //     return getPage(
              //       child: const SignUpScreen(),
              //       state: state,
              //     );
              //   },
              // )
            ],
          ),
        ],
      ),
    ];

    router = GoRouter(
      debugLogDiagnostics: true,
      navigatorKey: routerKey,
      initialLocation: '/home',
      routes: routes,
      errorPageBuilder: (context, state) {
        return getPage(
          child: Container(),
          state: state,
        );
      },
    );
  }

  static Page getPage({
    required Widget child,
    required GoRouterState state,
  }) {
    return MaterialPage(
      key: state.pageKey,
      child: child,
    );
  }
}
