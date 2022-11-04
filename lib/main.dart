import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'app/app_routes.dart';
import 'presentation/screens/main_screen.dart';
import 'presentation/screens/register_screen.dart';
import 'package:path_provider/path_provider.dart';
import 'app/app_theme.dart';
import 'di.dart';
import 'domain/bloc/auth/auth_cubit.dart';
import 'domain/bloc/user/user_cubit.dart';
import 'domain/interfaces/auth_repository.dart';
import 'domain/interfaces/user_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //Инициализация хранилища, для хранения состояния приложения.
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );
  //Dependencies initialization
  await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(locator.get<AuthRepository>()),
        ),
        BlocProvider(
          create: (context) => UserCubit(
              authCubit: context.read<AuthCubit>(),
              userRepository: locator.get<UserRepository>()),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: mainAppThemeData,
        initialRoute: AppRoutes.initial.value,
        routes: {
          AppRoutes.initial.value: (context) => MainScreen(),
          AppRoutes.register.value: (context) => RegisterScreen(),
        },
      ),
    );
  }
}
