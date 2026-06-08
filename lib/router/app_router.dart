part of 'router.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: LoginView.appRoute,
  routes: [
    GoRoute(
      path: LoginView.appRoute,
      builder: (context, state) => const LoginView(),
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
