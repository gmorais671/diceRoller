import 'package:dice_roller/dice.dart';
import 'package:flutter/material.dart';

const String diceRollerButtonTitle = 'Rolar dados';
const TextStyle titleStyle =
    TextStyle(fontSize: 28, fontWeight: FontWeight.bold);

class BattleContent extends StatelessWidget {
  const BattleContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 25, 0, 15),
      height: size.height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.yellow,
              border: Border.all(color: Colors.black, width: 2),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Text(
                  'Ataque',
                  style: titleStyle,
                ),
                Dice.attack(),
                Dice.attack(),
                Dice.attack(),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.red,
              border: Border.all(color: Colors.black, width: 2),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Text(
                  'Defesa',
                  style: titleStyle,
                ),
                Dice.defense(),
                Dice.defense(),
                Dice.defense(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
