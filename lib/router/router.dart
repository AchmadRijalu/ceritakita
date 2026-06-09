import 'package:ceritakita/Utils/network_logger.dart';
import 'package:ceritakita/providers/auth_provider.dart';
import 'package:ceritakita/views/views.dart';
import 'package:go_router/go_router.dart';

part 'app_router.dart';

late final GoRouter appRouter;

void initRouter(AuthProvider authProvider) {
  appRouter = createAppRouter(authProvider);
}
