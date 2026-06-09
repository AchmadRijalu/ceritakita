part of 'router.dart';

GoRouter createAppRouter(AuthProvider authProvider) {
  return GoRouter(
    navigatorKey: NetworkLogger.instance.navigatorKey,
    initialLocation: authProvider.isLoggedIn
        ? StoriesView.appRoute
        : LoginView.appRoute,
    refreshListenable: authProvider,
    redirect: (context, state) {
      final isLoggedIn = authProvider.isLoggedIn;
      final location = state.matchedLocation;
      final isAuthRoute =
          location == LoginView.appRoute || location == RegisterView.appRoute;

      if (!isLoggedIn && !isAuthRoute) {
        return LoginView.appRoute;
      }

      if (isLoggedIn && isAuthRoute) {
        return StoriesView.appRoute;
      }

      return null;
    },
    routes: [
      GoRoute(
        path: LoginView.appRoute,
        builder: (context, state) => LoginView(
          registerSuccessMessage: state.extra as String?,
        ),
      ),
      GoRoute(
        path: RegisterView.appRoute,
        builder: (context, state) {
          return const RegisterView();
        },
      ),
      GoRoute(
        path: StoriesView.appRoute,
        builder: (context, state) {
          return const StoriesView();
        },
      ),
      GoRoute(
        path: DetailStoriesView.appRoute,
        builder: (context, state) {
          return const DetailStoriesView();
        },
      ),
      GoRoute(
        path: AddStoryView.appRoute,
        builder: (context, state) {
          return const AddStoryView();
        },
      ),
    ],
  );
}
