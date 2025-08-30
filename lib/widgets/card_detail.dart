import 'package:flutter/material.dart';
import 'package:flutterdemo/utils/SliderCardModel.dart';
import 'package:flutterdemo/widgets/work_card.dart';

class CardDetail extends StatelessWidget {
  final SliderCardModel item;

  const CardDetail({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 24,
        children: <Widget>[
          WorkCard(title: item.title, description: item.description ?? ""),
          Column(
            spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("Реклама", style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.w700)),
              Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam",
                style: TextStyle(color: Colors.black87, fontSize: 20),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
