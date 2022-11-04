import 'package:cubit_auth/app/app_routes.dart';
import '../../app/app_constants.dart';
import '../../localization/string_hardcoded.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/bloc/auth/auth_cubit.dart';
import '../../domain/bloc/user/user_cubit.dart';
import '../widgets/auth_builder.dart';
import '../widgets/default_button.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'.hardcoded),
      ),
      body: AuthCubitBuilder(
        buildNotAuthorizedState: (context) => const _UnAuthorizedPage(),
        buildAuthorizedState: (context) => const _AuthorizedPage(),
      ),
    );
  }
}

class _AuthorizedPage extends StatelessWidget {
  const _AuthorizedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.max,
        children: [
          const _UserCard(),
          DefaultButton(
            text: 'Logout'.hardcoded,
            onPressed: () => context.read<AuthCubit>().logOut(),
          ),
        ],
      ),
    );
  }
}

class _UnAuthorizedPage extends StatelessWidget {
  const _UnAuthorizedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Not authorized'.hardcoded,
            style: Theme.of(context).textTheme.headline5,
          ),
          DefaultButton(
            text: 'Register'.hardcoded,
            onPressed: () =>
                Navigator.pushNamed(context, AppRoutes.register.value),
          ),
        ],
      ),
    );
  }
}

class _UserCard extends StatelessWidget {
  const _UserCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const TextStyle? style = TextStyle(color: Colors.teal, fontSize: 30);

    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        if (state.inProgress) {
          return const CircularProgressIndicator();
        }
        if (state.errorMessage?.isNotEmpty == true) {
          return Text(state.errorMessage!);
        }
        if (state.user == null) {
          return Text('User is null'.hardcoded);
        } else {
          return Column(
            children: [
              Text(
                ' Hi, ${state.user?.id ?? 'null'}'.hardcoded,
                style: Theme.of(context).textTheme.headline5,
              ),
              Image.network(AppConstants.successImageUrl)
            ],
          );
        }
      },
    );
  }
}
