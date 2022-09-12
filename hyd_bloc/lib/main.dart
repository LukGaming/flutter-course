import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hyd_bloc/bloc/Auth/auth_cubit.dart';
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
    AuthCubit authBloc = AuthCubit();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiBlocProvider(
        providers: [BlocProvider.value(value: authBloc)],
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            print(state);
          },
          builder: (context, state) {
            if (state is AuthInitial) return const LoginFormView();
            if (state is LoggedUserState) return const HomePage();
            return Container();
          },
        ),
      ),
    );
  }
}
