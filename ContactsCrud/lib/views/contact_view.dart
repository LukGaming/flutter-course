import 'package:contacts_crud/models/contact.dart';
import 'package:flutter/material.dart';

class ContactView extends StatelessWidget {
  const ContactView({Key? key, required this.contact}) : super(key: key);
  final Contact contact;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact Screen"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(children: [
                  Row(
                    children: const [
                      Text(
                        "Contact Name: ",
                        style: TextStyle(fontSize: 40, color: Colors.white),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        contact.name,
                        style:
                            const TextStyle(fontSize: 40, color: Colors.white),
                      ),
                    ],
                  ),
                ]),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(children: [
                  Row(
                    children: const [
                      Text(
                        "Mobile: ",
                        style: TextStyle(fontSize: 40, color: Colors.white),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        contact.mobile,
                        style:
                            const TextStyle(fontSize: 40, color: Colors.white),
                      ),
                    ],
                  ),
                ]),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
