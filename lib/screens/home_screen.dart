import 'package:flutter/material.dart';
import 'package:flutterdemo/widgets/bonus.dart';
import 'package:flutterdemo/widgets/slider.dart';


class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<String> sales = [
    "Скидка на первый заказ",
    "Скидка на второй заказ",
    "Скидка на последующий заказ",
  ];

  void navigateToForm(BuildContext context) {
    Navigator.pushNamed(context, '/form');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Заголовок приложения', style: TextStyle(color: Colors.blueGrey, fontSize: 24, fontWeight: FontWeight.bold)),
        centerTitle: true,
        leading: IconButton(
            onPressed: () => navigateToForm(context),
            icon: Icon(Icons.person)
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          spacing: 15,
          children: [
            BonusWidget(title: 'Бонусная'),
            //SliderMain(items: sales),
          ],
        ),
      ),
    );
  }
}
