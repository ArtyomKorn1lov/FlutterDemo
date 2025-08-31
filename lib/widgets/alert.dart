import 'package:flutter/material.dart';

typedef AlertCallback = void Function();

class Alert extends StatelessWidget {
  final String? content;
  final AlertCallback? onClose;

  const Alert({
    super.key,
    this.onClose,
    this.content
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: Text('Успешно'),
      content: Text(content ?? ''),
      actions: [
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
              Colors.indigo,
            ),
          ),
          onPressed: () {
            Navigator.of(context).pop();
            onClose!();
          },
          child: Text('Закрыть', style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }
}
