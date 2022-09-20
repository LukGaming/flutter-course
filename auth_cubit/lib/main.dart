import 'package:auth_cubit/Cubit/Auth/auth_cubit.dart';
import 'package:auth_cubit/Cubit/Utils/utils_cubit.dart';
import 'package:auth_cubit/data/repositories/base_repository.dart';
import 'package:auth_cubit/presentation/screens/home_page_screen.dart';
import 'package:auth_cubit/presentation/screens/login_screen.dart';
import 'package:auth_cubit/presentation/screens/user_register_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider<UtilsCubit>(
          create: (context) => UtilsCubit(),
        ),
        BlocProvider<AuthCubit>(
          create: (context) => AuthCubit(
            utilsCubit: context.read<UtilsCubit>(),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: BlocConsumer<UtilsCubit, UtilsState>(
          listener: (context, state) {
            if (state is UtilsLoadingState) {
              showDialog(
                context: context,
                builder: (context) => const AlertDialog(
                  content: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              );
            }
            if (state is UtilsCloseLoadingState) {
              Navigator.pop(context);
            }
            if (state is ShowSnackBar) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  duration: const Duration(seconds: 1),
                  content: Text(state.message),
                ),
              );
            }
            if (state is ShowAlertPopUp) {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text(state.title),
                  content: Text(state.message),
                  actions: [
                    TextButton(
                      onPressed: () {
                        context.read<AuthCubit>().closePopup("ok");
                      },
                      child: const Text("Ok"),
                    ),
                  ],
                ),
              );
            }
            if (state is ClosePopUp) {
              final state = context.read<AuthCubit>();
              final currentState = state;
              if (currentState is UserRegister) {
                currentState.goToLoginView();
              }
              Navigator.pop(context);
            }
          },
          builder: (context, state) {
            return const AuthCubitView();
          },
        ),
      ),
    );
  }
}

class AuthCubitView extends StatelessWidget {
  const AuthCubitView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthInitial) {
            return const FormPage();
          } else if (state is UserLoggedState) {
            return const HomePage();
          } else if (state is UserRegister) {
            return const UserRegisterView();
          }
          return Container();
        },
        listener: (context, state) => {},
      ),
    );
  }
}
