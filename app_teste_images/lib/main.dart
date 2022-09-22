import 'package:app_teste_images/cubit/login/login_cubit.dart';
import 'package:app_teste_images/cubit/utils/utils_cubit.dart';
import 'package:app_teste_images/presentation/screens/home_page.dart';
import 'package:app_teste_images/presentation/screens/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
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
            create: (context) =>
                LoginCubit(utilsCubit: context.read<UtilsCubit>()),
          ),
        ],
        child: const HandleInitialView(),
      ),
    );
  }
}

class HandleInitialView extends StatelessWidget {
  const HandleInitialView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UtilsCubit, UtilsState>(
      listener: (context, state) {
        if (state is ShowSnackBarMessage) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: BlocConsumer<LoginCubit, LoginState>(
            builder: (context, state) {
              if (state is LoginInitial) {
                return const LoginView();
              }
              if (state is RegistrandoUsuario) {
                return const Center(
                  child: Text("Registrando usuário"),
                );
              }
              if (state is LoggedUserState) return const HomePage();
              return Container();
            },
            listener: (context, state) => {},
          ),
        );
      },
    );
  }
}
