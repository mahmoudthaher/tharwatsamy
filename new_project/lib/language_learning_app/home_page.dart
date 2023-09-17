import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_project/language_learning_app/componts/category.dart';
import 'package:new_project/language_learning_app/numbers_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFfffde4),
      appBar: AppBar(
        title: Text('Toku'),
        backgroundColor: Color(0xFF533d34),
      ),
      body: Column(
        children: [
          Category(
            color: Color(0xffff9f3b),
            text: "Numbers",
            ontap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return NumbersPage();
                },
              ));
            },
          ),
          Category(
            color: Color(0xff5d8b3e),
            text: "FamilyMember",
            ontap: () {},
          ),
          Category(
            color: Color(0xff854cae),
            text: "Colors",
            ontap: () {},
          ),
          Category(
            color: Color(0xff51b0d5),
            text: "Pharses",
            ontap: () {},
          ),
        ],
      ),
    );
  }
}
