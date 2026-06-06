import 'package:ceritakita/views/add_story_view.dart';
import 'package:ceritakita/views/detail_stories_view.dart';
import 'package:ceritakita/views/login_view.dart';
import 'package:ceritakita/views/register_view.dart';
import 'package:ceritakita/views/stories_view.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: LoginView.appRoute,
  routes: [
    GoRoute(path: LoginView.appRoute, builder: (context, state) => const LoginView()),
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
