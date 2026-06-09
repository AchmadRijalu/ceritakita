import 'package:ceritakita/Utils/network_logger.dart';
import 'package:ceritakita/injection/injection.dart';
import 'package:ceritakita/providers/auth_provider.dart';
import 'package:ceritakita/providers/stories_provider.dart';
import 'package:ceritakita/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupInjection();
  final authProvider = sl<AuthProvider>();
  await authProvider.initialize();
  initRouter(authProvider);
  runApp(MyApp(authProvider: authProvider));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.authProvider});

  final AuthProvider authProvider;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>.value(value: authProvider),
        ChangeNotifierProvider(create: (_) => sl<StoriesProvider>()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: "Cerita Kita",
        routerConfig: appRouter,
        builder: (context, child) {
          if (child == null) return const SizedBox.shrink();

          return NetworkLogger.instance.overlay(child: child);
        },
      ),
    );
  }
}
