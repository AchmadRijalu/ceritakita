import 'package:ceritakita/providers/auth_provider.dart';
import 'package:ceritakita/router/router.dart';
import 'package:ceritakita/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => AuthProvider())],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'CeritaKita',
        routerConfig: appRouter,
      ),
    );
  }
}
