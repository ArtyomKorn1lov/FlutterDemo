import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutterdemo/utils/models/SliderCardModel.dart';
import 'package:flutterdemo/widgets/card_detail.dart';
import 'package:flutterdemo/widgets/work_card.dart';

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
                (item) => GestureDetector(
                  onTap: () {
                    showModalBottomSheet<void>(
                      context: context,
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(16),
                        ),
                      ),
                      builder: (BuildContext context) {
                        return CardDetail(item: item);
                      },
                    );
                  },
                  child: WorkCard(
                    title: item.title,
                    description: item.description ?? "",
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
