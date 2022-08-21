import 'package:contacts_crud/models/contact.dart';
import 'package:contacts_crud/views/contact_view.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../utils/SqlHelper.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> _contacts = [];
  bool _isLoading = true;
  final maskFormatter = MaskTextInputFormatter(
      mask: ' (##) #####-####',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

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
    final _formKey = GlobalKey<FormState>();
    showModalBottomSheet(
        context: context,
        elevation: 5,
        isScrollControlled: true,
        builder: (_) => Form(
              key: _formKey,
              child: Container(
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
                    TextFormField(
                      controller: _nameEditingController,
                      decoration: const InputDecoration(hintText: "Name"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter a name";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      inputFormatters: [maskFormatter],
                      controller: _mobileEditingController,
                      decoration: const InputDecoration(hintText: "Mobile"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter a mobile";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            if (id == null) {
                              await _createContact();
                              _handleSnackBar(
                                  "Contact Created Successfuly", "success");
                            } else {
                              if (id != null) {
                                await _updateContact(id);
                                _handleSnackBar(
                                    "Contact Updated Successfuly", "success");
                              }
                            }

                            _mobileEditingController.text = '';
                            _nameEditingController.text = '';
                            Navigator.of(context).pop();
                          }
                        },
                        child: Text(id == null
                            ? "Create a new Contact"
                            : "Updating a Contact"))
                  ],
                ),
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
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ContactView(
                                contact: Contact(
                                    _contacts[index]['id'],
                                    _contacts[index]['name'],
                                    _contacts[index]['mobile']))));
                  },
                  child: Card(
                    color: Colors.orange[200],
                    elevation: 2,
                    margin: const EdgeInsets.all(5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(_contacts[index]['name']),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Text(_contacts[index]['mobile'],
                                style: const TextStyle(color: Colors.black)),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                                onPressed: () =>
                                    _showForm(_contacts[index]['id']),
                                icon: const Icon(
                                  Icons.edit,
                                  color: Colors.purple,
                                )),
                            IconButton(
                                onPressed: () {
                                  _deleteContact(_contacts[index]['id']);
                                  _handleSnackBar(
                                      "Contact deleted Successfuly", "success");
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.deepOrange,
                                ))
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }),
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

  _handleSnackBar(String message, String? type) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          backgroundColor: type == "success" ? Colors.green : Colors.red,
          content: Text(message)),
    );
  }
}
