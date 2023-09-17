import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:new_project/language_learning_app/componts/items.dart';
import 'package:new_project/news_app/models/numbers.dart';

class NumbersPage extends StatelessWidget {
  const NumbersPage({super.key});
  final List<Numbers> numbers = const [
    Numbers(
        sound: 'sounds/numbers/number_one_sound.mp3',
        image: 'assets/images/numbers/number_one.png',
        jbName: 'ichi',
        enName: 'one'),
    Numbers(
        sound: 'sounds/numbers/number_two_sound.mp3',
        image: 'assets/images/numbers/number_two.png',
        jbName: 'Ni',
        enName: 'tow'),
    Numbers(
        sound: 'sounds/numbers/number_three_sound.mp3',
        image: 'assets/images/numbers/number_three.png',
        jbName: 'San',
        enName: 'three'),
    Numbers(
        sound: 'sounds/numbers/number_four_sound.mp3',
        image: 'assets/images/numbers/number_four.png',
        jbName: 'Shi',
        enName: 'four'),
    Numbers(
        sound: 'sounds/numbers/number_five_sound.mp3',
        image: 'assets/images/numbers/number_five.png',
        jbName: 'Go',
        enName: 'five'),
    Numbers(
        sound: 'sounds/numbers/number_six_sound.mp3',
        image: 'assets/images/numbers/number_six.png',
        jbName: 'Roku',
        enName: 'six'),
    Numbers(
        sound: 'sounds/numbers/number_seven_sound.mp3',
        image: 'assets/images/numbers/number_seven.png',
        jbName: 'Sebun',
        enName: 'seven'),
    Numbers(
        sound: 'sounds/numbers/number_eight_sound.mp3',
        image: 'assets/images/numbers/number_eight.png',
        jbName: 'Hachi',
        enName: 'eight'),
    Numbers(
        sound: 'sounds/numbers/number_nine_sound.mp3',
        image: 'assets/images/numbers/number_nine.png',
        jbName: 'Kyu',
        enName: 'nine'),
    Numbers(
        sound: 'sounds/numbers/number_ten_sound.mp3',
        image: 'assets/images/numbers/number_ten.png',
        jbName: 'Jo',
        enName: 'ten'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Numbers"),
          backgroundColor: Color(0xff463025),
        ),
        body: ListView.builder(
          itemCount: numbers.length,
          itemBuilder: (context, index) {
            return Item(number: numbers[index]);
          },
        ));
  }
}

List<Widget> getList(List<Numbers> numbers) {
  //children: getList(numbers)
  List<Widget> listItem = [];
  for (int i = 0; i < numbers.length; i++) {
    listItem.add(Item(number: numbers[0]));
  }
  return listItem;
}
