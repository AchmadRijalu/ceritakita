import 'package:ceritakita/providers/auth_provider.dart';
import 'package:ceritakita/services/auth_repository.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void setupInjection() {
  sl.registerLazySingleton(() => AuthRepository());
  sl.registerFactory(() => AuthProvider(authRepository: sl()));
}
