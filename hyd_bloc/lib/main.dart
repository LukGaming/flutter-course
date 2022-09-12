import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hyd_bloc/bloc/Auth/auth_cubit.dart';
import 'package:hyd_bloc/bloc/Utils/utils_cubit.dart';
import 'package:hyd_bloc/presentation/screens/home_page.dart';
import 'package:hyd_bloc/presentation/screens/login_view_screen.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getTemporaryDirectory(),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => UtilsCubit(),
          ),
          BlocProvider(
            create: (context) => AuthCubit(
              utilsCubit: context.read<UtilsCubit>(),
            ),
          ),
        ],
        child: BlocListener<UtilsCubit, UtilsState>(
          listener: (context, state) {
            if (state is ShowSnackBar) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                ),
              );
            }
            if (state is ShowPopUp) {
              print(state.message);
              print(state.title);
            }
          },
          child: const LoginOrHome(),
        ),
      ),
    );
  }
}

class LoginOrHome extends StatelessWidget {
  const LoginOrHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is LoggedUserState) {
          return HomePage();
        }
        if (state is AuthInitial) {
          return LoginFormView();
        }
        return Container();
      },
      listener: (context, state) => {},
    );
  }
}
