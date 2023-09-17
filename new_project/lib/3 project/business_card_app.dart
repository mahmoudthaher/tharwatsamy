import 'package:flutter/material.dart';

class FirstProject extends StatelessWidget {
  const FirstProject({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: const Color(0xFF28475E),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircleAvatar(
            radius: 52,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              backgroundImage: AssetImage("assets/images/picture.png"),
              radius: 50,
            ),
          ),
          const Text(
            "Tharwat Samy",
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontFamily: "Pacifico"),
          ),
          const Text(
            "FLUTTER DEVELOPER",
            style: TextStyle(fontSize: 10, color: Color(0xFF647d92)),
          ),
          const Divider(
            color: Colors.grey,
            indent: 60,
            endIndent: 60,
            thickness: 0.2,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Card(
              color: Colors.white,
              child: ListTile(
                leading: Icon(
                  Icons.phone,
                  color: Color(0xFF28475E),
                ),
                title: Text("(+962) 787006524"),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  color: Colors.white),
              height: 55,
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 17, right: 32),
                    child: Icon(
                      Icons.email,
                      color: Color(0xFF28475E),
                    ),
                  ),
                  Text(
                    "mthaher3@gmail.com",
                    style: TextStyle(fontSize: 16),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}
