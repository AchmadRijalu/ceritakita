import 'package:ceritakita/Utils/network_logger.dart';
import 'package:ceritakita/providers/auth_provider.dart';
import 'package:ceritakita/providers/stories_provider.dart';
import 'package:ceritakita/services/auth_repository.dart';
import 'package:ceritakita/services/stories_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

void setupInjection() {
  NetworkLogger.instance.init();

  sl.registerLazySingleton<http.Client>(
    () => NetworkLogger.instance.createClient(),
  );
  sl.registerLazySingleton(() => AuthRepository(client: sl<http.Client>()));
  sl.registerLazySingleton(
    () => StoriesRepository(
      client: sl<http.Client>(),
      authRepository: sl<AuthRepository>(),
    ),
  );
  sl.registerLazySingleton(() => AuthProvider(authRepository: sl()));
  sl.registerLazySingleton(() => StoriesProvider(storiesRepository: sl()));
}
