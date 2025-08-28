import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutterdemo/utils/slider_card_model.dart';

class SliderMain extends StatefulWidget {
  final List<SliderCardModel> items;
  final String title;

  const SliderMain({super.key, required this.items, required this.title});

  @override
  State<SliderMain> createState() => _SliderMainState();
}

class _SliderMainState extends State<SliderMain> {
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 5,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
          child: Text(
            widget.title,
            style: TextStyle(color: Colors.black, fontSize: 22),
          ),
        ),
        CarouselSlider(
          items: widget.items
              .map(
                (item) => Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 30, horizontal: 32),
                    decoration: BoxDecoration(
                      color: Colors.blueGrey[200],
                      borderRadius: BorderRadius.circular(28),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 10,
                      children: <Widget>[
                        Text(
                          item.title,
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                        Text(
                          item.description ?? "",
                          style: TextStyle(color: Colors.black87, fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                ),
              )
              .toList(),
          options: CarouselOptions(enableInfiniteScroll: true, autoPlay: true),
        ),
      ],
    );
  }
}
