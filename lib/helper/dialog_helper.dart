import 'package:flutter/material.dart';

Future<void> showMyDialog({
  required BuildContext context,
  required String title,
  required Widget content,
  List<Widget>? actions,
})  {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: content,
        actions: actions ?? <Widget>[
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
