import 'package:child_fuction/form_add_user.dart';
import 'package:child_fuction/user.dart';
import 'package:flutter/material.dart';

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
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<User> userList = [];
  @override
  Widget build(BuildContext context) {
    void addUser(User user) {
      setState(
        () {
          userList.add(user);
          print(userList.length);
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Emiting event exameple"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: userList.length,
          itemBuilder: (context, index) => ListTile(
            leading: Text('Id: ${userList[index].id}'),
            title: Text(userList[index].name.toString()),
            trailing: Text('Idade: ${userList[index].idade}'),
          ),
        ),
      ),
      floatingActionButton: ButtonCreateUser(
        addUser: addUser,
      ),
    );
  }
}

class ButtonCreateUser extends StatelessWidget {
  final Function addUser;
  const ButtonCreateUser({
    Key? key,
    required this.addUser,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        onPressed: () {
          final createUser = Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const AddUser(),
            ),
          );
          createUser.then((value) {
            if (value != null) {
              print(value.id);
              print(value.name);
              print(value.idade);
              addUser(value);
            }
          });
        },
        child: const Icon(Icons.add));
  }
}
