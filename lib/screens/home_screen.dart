import 'package:flutter/material.dart';
import 'package:flutterdemo/utils/api/Endpoints.dart';
import 'package:flutterdemo/utils/models/CustomException.dart';
import 'package:flutterdemo/utils/models/MainData.dart';
import 'package:flutterdemo/widgets/bonus.dart';
import 'package:flutterdemo/widgets/slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late MainData? mainData = MainData();

  void navigateToForm(BuildContext context) {
    Navigator.pushNamed(context, '/form');
  }

  void navigateToAuth(BuildContext context) {
    Navigator.pushNamed(context, '/auth');
  }

  @override
  void initState() {
    super.initState();
    getMainData();
  }

  Future<void> getMainData() async {
    try {
      MainData response = await Endpoints.getMainData();
      setState(() {
        mainData = response;
      });
    } on CustomException catch (error) {
      print('Ошибка: ${error.message}');
    }
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
                child: Text(
                  'Открыть форму обратной связи',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Colors.indigo,
                  ),
                ),
                onPressed: () => navigateToAuth(context),
                child: Text(
                  'Открыть форму авторизации',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: BonusWidget(title: 'Бонусная'),
            ),
            Visibility(
              visible: mainData?.sales != null,
              child: SliderMain(title: 'Акции', items: mainData?.sales ?? []),
            ),
            Visibility(
              visible: mainData?.news != null,
              child: SliderMain(title: 'Новости', items: mainData?.news ?? []),
            ),
            Visibility(
              visible: mainData?.products != null,
              child: SliderMain(
                title: 'Товары',
                items: mainData?.products ?? [],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
