import 'package:contacts_crud/utils/SqlHelper.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Contacts Crud",
        theme: ThemeData(primarySwatch: Colors.deepOrange),
        home: const HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> _contacts = [];
  bool _isLoading = true;

  void _getContacts() async {
    final data = await SqlHelper.getContacts();
    setState(() {
      _contacts = data;
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _getContacts();
  }

  final TextEditingController _nameEditingController = TextEditingController();
  final TextEditingController _mobileEditingController =
      TextEditingController();

  void _showForm(int? id) {
    if (id != null) {
      final existingContact =
          _contacts.firstWhere((element) => element['id'] == id);
      _nameEditingController.text = existingContact['name'];
      _mobileEditingController.text = existingContact['mobile'];
    }
    showModalBottomSheet(
        context: context,
        elevation: 5,
        isScrollControlled: true,
        builder: (_) => Container(
              padding: EdgeInsets.only(
                top: 15,
                left: 15,
                right: 15,
                // this will prevent the soft keyboard from covering the text fields
                bottom: MediaQuery.of(context).viewInsets.bottom + 120,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextField(
                    controller: _nameEditingController,
                    decoration: const InputDecoration(hintText: "Name"),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: _mobileEditingController,
                    decoration: const InputDecoration(hintText: "Mobile"),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        if (id == null) {
                          await _createContact();
                        } else {
                          if (id != null) {
                            await _updateContact(id);
                          }
                        }
                        _mobileEditingController.text = '';
                        _nameEditingController.text = '';
                        Navigator.of(context).pop();
                      },
                      child: Text(id == null
                          ? "Create a new Contact"
                          : "Updating a Contact"))
                ],
              ),
            ));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Creating Contacts")),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _contacts.length,
              itemBuilder: (context, index) => Card(
                color: Colors.orange[200],
                elevation: 2,
                margin: const EdgeInsets.all(5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(_contacts[index]['name']),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(_contacts[index]['mobile'],
                            style: const TextStyle(color: Colors.blueGrey)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                            onPressed: () => _showForm(_contacts[index]['id']),
                            icon: const Icon(
                              Icons.edit,
                              color: Colors.purple,
                            )),
                        IconButton(
                            onPressed: () =>
                                _deleteContact(_contacts[index]['id']),
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.red,
                            ))
                      ],
                    ),
                  ],
                ),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showForm(null),
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> _createContact() async {
    await SqlHelper.createContact(
        _nameEditingController.text, _mobileEditingController.text);
    _getContacts();
  }

  Future<void> _updateContact(int id) async {
    await SqlHelper.updateContact(
        id, _nameEditingController.text, _mobileEditingController.text);
    _getContacts();
  }

  Future<void> _deleteContact(int id) async {
    await SqlHelper.deleteContact(id);
    _getContacts();
  }
}
