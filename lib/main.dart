import 'package:flutter/material.dart';
import 'package:xo/gameBoard/gameBoardSplash.dart';
import 'package:xo/gameBoard/game_board.dart';

void main() {
  runApp(MaterialApp(
      routes: {
        GameBoard.routeName: (_) => GameBoard(),
        GameBoardSplash.routeName: (_) => GameBoardSplash()
      },
    initialRoute: GameBoardSplash.routeName,
  ));
}