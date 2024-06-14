import 'dart:math';

import 'package:flutter/material.dart';

class Dice extends StatefulWidget {
  final bool attack;

  const Dice({Key? key, required this.attack}) : super(key: key);

  const Dice.attack({super.key}) : attack = true;
  const Dice.defense({super.key}) : attack = false;

  @override
  State<Dice> createState() => _DiceState();
}

class _DiceState extends State<Dice> {
  bool diceVisibility = true;
  bool loading = false;
  int currentDiceRoll = 1;

  void changeVisibility(bool) {
    setState(() {
      diceVisibility = !diceVisibility;
    });
  }

  void rollDice() async {
    setState(() {
      loading = true;
      currentDiceRoll = Random().nextInt(6) + 1;
    });
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool mobile = size.height > size.width * 1.8;
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: widget.attack
            ? [
                Column(
                  children: [
                    Checkbox(
                        value: diceVisibility, onChanged: changeVisibility),
                    Visibility(
                      visible: diceVisibility,
                      child: IconButton(
                        onPressed: rollDice,
                        icon: const Icon(Icons.shuffle),
                      ),
                    ),
                  ],
                ),
                Visibility(
                  visible: diceVisibility,
                  child: loading
                      ? const CircularProgressIndicator()
                      : Image.asset(
                          'assets/images/dice-$currentDiceRoll.png',
                          width: mobile ? size.width * .2 : size.height * .15,
                        ),
                ),
              ]
            : [
                Visibility(
                  visible: diceVisibility,
                  child: loading
                      ? const CircularProgressIndicator()
                      : Image.asset(
                          'assets/images/dice-$currentDiceRoll.png',
                          width: mobile ? size.width * .2 : size.height * .15,
                        ),
                ),
                Column(
                  children: [
                    Checkbox(
                        value: diceVisibility, onChanged: changeVisibility),
                    Visibility(
                      visible: diceVisibility,
                      child: IconButton(
                        onPressed: rollDice,
                        icon: const Icon(Icons.shuffle),
                      ),
                    ),
                  ],
                ),
              ],
      ),
    );
  }
}
