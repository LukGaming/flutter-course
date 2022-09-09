import 'package:flutter/material.dart';

class DefaultDialog {
  static Future<void> showMyDialog(context, error, message) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: error ? const Text('Ocorreu um erro') : const Text('Sucesso!'),
          content: SingleChildScrollView(
            child: ListBody(children: [
              Center(
                child: Text(message),
              )
            ]),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Ok.'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
