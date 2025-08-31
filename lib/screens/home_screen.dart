import 'package:flutter/material.dart';
import 'package:flutterdemo/widgets/bonus.dart';
import 'package:flutterdemo/widgets/slider.dart';
import 'package:flutterdemo/utils/SliderCardModel.dart';
import 'package:flutterdemo/widgets/card_detail.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<SliderCardModel> sales = [
    SliderCardModel(
      title: "Скидка 10%",
      description: "Получите скидку на первый заказ сейчас",
    ),
    SliderCardModel(
      title: "Скидка 5%",
      description: "Получите скидку на второй заказ",
    ),
    SliderCardModel(
      title: "Скидка 25%",
      description: "Получите скидку на третий заказ",
    ),
  ];

  final List<SliderCardModel> news = [
    SliderCardModel(
      title: "Новые события",
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam",
    ),
    SliderCardModel(
      title: "Не новые события%",
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
    ),
    SliderCardModel(
      title: "Свежие события",
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt",
    ),
  ];

  final List<SliderCardModel> products = [
    SliderCardModel(
      title: "Товар 1",
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam",
    ),
    SliderCardModel(
      title: "Товар 2",
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam",
    ),
    SliderCardModel(
      title: "Товар 3",
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam",
    ),
    SliderCardModel(
      title: "Товар 4",
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam",
    ),
    SliderCardModel(
      title: "Товар 5",
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam",
    ),
    SliderCardModel(
      title: "Товар 6",
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam",
    ),
    SliderCardModel(
      title: "Товар 7",
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam",
    ),
    SliderCardModel(
      title: "Товар 8",
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam",
    ),
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
        title: Text(
          'Заголовок приложения',
          style: TextStyle(
            color: Colors.blueGrey,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => navigateToForm(context),
          icon: Icon(Icons.person),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 0),
        child: Column(
          spacing: 30,
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Colors.indigo,
                  ),
                ),
                onPressed: () => navigateToForm(context),
                child: Text('Открыть форму обратной связи', style: TextStyle(color: Colors.white)),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: BonusWidget(title: 'Бонусная'),
            ),
            SliderMain(title: 'Акции', items: sales),
            SliderMain(title: 'Новости', items: news),
            SliderMain(title: 'Товары', items: products),
          ],
        ),
      ),
    );
  }
}
