import 'package:flutter/material.dart';

class GameBoardButton extends StatelessWidget {
  String symbol;
  Function onClick;
  int index;
  GameBoardButton({required this.symbol, required this.onClick, required this.index});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
          margin: EdgeInsets.all(4),
          child: ElevatedButton(onPressed: (){
            onClick(index);
          },
              child: Text(symbol,
                style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),)
          ),
        )
    );
  }
}
