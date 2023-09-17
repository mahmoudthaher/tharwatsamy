import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:new_project/news_app/models/numbers.dart';

class Item extends StatelessWidget {
  const Item({required this.number, super.key});
  final Numbers number;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xfff9952f),
      child: Row(
        children: [
          Container(
              color: Color(0xfffff4db),
              height: 70,
              child: Image.asset(number.image)),
          Container(
            padding: const EdgeInsets.only(left: 8),
            height: 70,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  number.jbName,
                  style: TextStyle(color: Colors.white),
                ),
                Text(number.enName, style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
          Spacer(
            flex: 1,
          ),
          Padding(
              padding: const EdgeInsets.only(right: 15),
              child: IconButton(
                icon: Icon(
                  Icons.play_arrow,
                  color: Colors.white,
                ),
                onPressed: () {
                  final player = AudioPlayer();
                  player.play(AssetSource(number.sound));
                },
              ))
        ],
      ),
    );
  }
}
