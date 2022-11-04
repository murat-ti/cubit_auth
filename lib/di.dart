import 'package:get_it/get_it.dart';
import 'data/impls/auth_repository_impl.dart';
import 'data/impls/user_repository_impl.dart';
import 'domain/interfaces/auth_repository.dart';
import 'domain/interfaces/user_repository.dart';

final GetIt locator = GetIt.instance;

/// Dependency configuration
configureDependencies() async {
  locator.registerFactory<AuthRepository>(() => AuthRepositoryImpl());
  locator.registerFactory<UserRepository>(() => UserRepositoryImpl());
}
