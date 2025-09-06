import 'package:flutter/material.dart';

typedef AlertCallback = void Function();

class Alert extends StatelessWidget {
  final String? content;
  final AlertCallback? onClose;
  final String? title;

  const Alert({
    super.key,
    this.title = "Ошибка",
    this.onClose,
    this.content
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: Text(title!),
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
