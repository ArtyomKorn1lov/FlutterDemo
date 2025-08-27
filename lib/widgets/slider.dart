import 'package:flutter/material.dart';

class SliderMain extends StatefulWidget {
  final List<String> items;

  const SliderMain({
    super.key,
    required this.items
  });

  @override
  State<SliderMain> createState() => _SliderMainState();
}

class _SliderMainState extends State<SliderMain> {
  final PageController pageController = PageController(viewportFraction: 0.8);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
        itemCount: widget.items.length,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.blueGrey[200],
            margin: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 32),
              decoration: BoxDecoration(
                  color: Colors.blueGrey[200],
                  borderRadius: BorderRadius.circular(28)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 5,
                children: <Widget>[
                  Text('Элемент $index', style: TextStyle(color: Colors.black, fontSize: 22)),
                  Text(widget.items[index], style: TextStyle(color: Colors.black, fontSize: 14)),
                ],
              ),
            ),
          );
        }
    );
  }
}
