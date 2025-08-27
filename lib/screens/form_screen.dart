import 'package:flutter/material.dart';

class FormScreen extends StatelessWidget {
  const FormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Форма', style: TextStyle(color: Colors.blueGrey, fontSize: 24, fontWeight: FontWeight.bold))
                ],
              )
          ],
        ),
    );
  }
}
