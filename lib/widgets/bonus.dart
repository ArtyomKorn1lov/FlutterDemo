import 'package:flutter/material.dart';

class BonusWidget extends StatefulWidget {
  final String title;

  const BonusWidget({
    super.key,
    this.title = "Заголовок программы",
  });

  @override
  State<BonusWidget> createState() => _BonusWidgetState();
}

class _BonusWidgetState extends State<BonusWidget> {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 30, horizontal: 32),
      decoration: BoxDecoration(
        color: Colors.blueGrey[200],
        borderRadius: BorderRadius.circular(28)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        spacing: 12,
        children: <Widget>[
          Expanded(child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 5,
              children: <Widget>[
                Text(widget.title, style: TextStyle(color: Colors.black, fontSize: 22)),
                Text('Бонусная информация о бонусной системе', style: TextStyle(color: Colors.black87, fontSize: 13)),
              ],
            )
          ),
          Icon(Icons.account_balance_wallet, size: 50, color: Colors.black)
        ],
      ),
    );
  }
}
