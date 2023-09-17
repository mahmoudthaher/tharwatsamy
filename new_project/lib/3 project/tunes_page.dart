import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class TunesPage extends StatelessWidget {
  const TunesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  final List<TunesClass> tunes = const [
    TunesClass(
        color: Colors.black, sound: 'sounds/family_members/daughter.wav'),
    TunesClass(
        color: Colors.blue, sound: 'sounds/family_members/grand_father.wav'),
    TunesClass(
        color: Colors.pink, sound: 'sounds/family_members/older_sister.wav'),
    TunesClass(
        color: Colors.yellow,
        sound: 'sounds/family_members/younger_brohter.wav'),
    TunesClass(color: Colors.red, sound: 'sounds/family_members/son.wav'),
    TunesClass(color: Colors.black, sound: 'sounds/family_members/father.wav'),
    TunesClass(color: Colors.cyan, sound: 'sounds/family_members/mother.wav'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tunes App'),
        centerTitle: true,
      ),
      body: Column(
        children: tunes.map((e) => WidgetColor(tunesClass: e)).toList(),
      ),
    );
  }
}

class WidgetColor extends StatelessWidget {
  const WidgetColor({required this.tunesClass, super.key});
  final TunesClass tunesClass;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
          child: Container(
            color: tunesClass.color,
          ),
          onTap: () {
            tunesClass.play();
          }),
    );
  }
}

class TunesClass {
  final Color color;
  final String sound;
  const TunesClass({required this.color, required this.sound});
  void play() {
    final player = AudioPlayer();
    player.play(AssetSource(sound));
  }
}
