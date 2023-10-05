import 'package:flutter/material.dart';
import 'package:xo/gameBoard/gameBoardArgs.dart';
import 'package:xo/gameBoard/gameBoardButton.dart';

class GameBoard extends StatefulWidget {
  static String routeName = "GameBoard";

  @override
  State<GameBoard> createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  TextStyle playerNameTextStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  List<String> board = [
    "","","",
    "","","",
    "","","",
  ];

  int counter = 0;
  int player1Score = 0;
  int player2Score = 0;

  @override
  Widget build(BuildContext context) {
    GameBoardArgs args = ModalRoute.of(context)!.settings.arguments  as GameBoardArgs;
    return Scaffold(
      appBar: AppBar(
        title: const Text("GameBoard"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "${args.Player1Name}: $player1Score",
                  style: playerNameTextStyle,
                ),
                Text(
                  "${args.Player2Name}: $player2Score",
                  style: playerNameTextStyle,
                )
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                GameBoardButton(
                  symbol: board[0],
                  onClick: onButtonClick,
                  index: 0,
                ),
                GameBoardButton(
                    symbol: board[1], onClick: onButtonClick, index: 1),
                GameBoardButton(
                    symbol: board[2], onClick: onButtonClick, index: 2),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                GameBoardButton(
                    symbol: board[3], onClick: onButtonClick, index: 3),
                GameBoardButton(
                    symbol: board[4], onClick: onButtonClick, index: 4),
                GameBoardButton(
                    symbol: board[5], onClick: onButtonClick, index: 5),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                GameBoardButton(
                    symbol: board[6], onClick: onButtonClick, index: 6),
                GameBoardButton(
                    symbol: board[7], onClick: onButtonClick, index: 7),
                GameBoardButton(
                    symbol: board[8], onClick: onButtonClick, index: 8),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void onButtonClick(int index) {
    if (board[index].isNotEmpty) return;
    String symbol= counter % 2 == 0 ? "O" : "X";
    board[index] = symbol;
    counter++;

    if (checkWinner(symbol)) {
      if(symbol == "O") {
        player1Score++;
      }else {player2Score++;}
      showGameResult();
        resetBoard();
        return;
    }

    if (counter == 9) {
      showGameResult();
      resetBoard();
    }
    setState(() {});
  }

  void resetBoard() {
    board = [
      "","","",
      "","","",
      "","","",
    ];
    counter = 0;
    setState(() {});
  }

  bool checkWinner(String symbol) {
    if (board[0] == symbol && board[4] == symbol && board[8] == symbol) {
      return true;
    }

    if (board[2] == symbol && board[4] == symbol && board[6] == symbol) {
      return true;
    }

    for (int i = 0; i < 3; i++) {
      if (board[i] == symbol &&
          board[i + 3] == symbol &&
          board[i + 6] == symbol) {
        return true;
      }
    }

    for (int i = 0; i <= 6; i += 3) {
      if (board[i] == symbol &&
          board[i + 1] == symbol &&
          board[i + 2] == symbol) {
        return true;
      }
    }

    return false;
  }

  void showMessage(String message){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(message),
      duration: Duration(seconds: 1),
    ),

    );
  }

  void showGameResult(){
    if(checkWinner("X")){
    } else if (checkWinner("O")) {
    } else {
      showMessage("It's a draw!");
    }
  }
}
