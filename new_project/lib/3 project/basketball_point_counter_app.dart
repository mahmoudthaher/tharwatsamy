import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_project/3%20project/cubit/bacektball_cubit.dart';
import 'package:new_project/3%20project/cubit/basketball_satate.dart';

class BasketballPoints extends StatelessWidget {
  const BasketballPoints({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BacektballCubit>(
      create: (context) => BacektballCubit(),
      child: MaterialApp(
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BacektballCubit, BasktballState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xFFff9900),
            title: const Text("Points Counter"),
          ),
          body: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Team A",
                        style: TextStyle(fontSize: 27),
                      ),
                      Text(
                        '${BlocProvider.of<BacektballCubit>(context).numberCountTeamA}',
                        style: const TextStyle(fontSize: 145),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFff9900),
                        ),
                        onPressed: () {
                          BlocProvider.of<BacektballCubit>(context)
                              .teamIncrement(team: 'A', numberCount: 1);
                        },
                        child: const Text(
                          "Add 1 Point",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFff9900),
                        ),
                        onPressed: () {
                          BlocProvider.of<BacektballCubit>(context)
                              .teamIncrement(team: 'A', numberCount: 2);
                        },
                        child: const Text(
                          "Add 2 Point",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFff9900),
                        ),
                        onPressed: () {
                          BlocProvider.of<BacektballCubit>(context)
                              .teamIncrement(team: 'A', numberCount: 3);
                        },
                        child: const Text(
                          "Add 3 Point",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 370,
                    child: VerticalDivider(
                      indent: 25,
                      endIndent: 10,
                      thickness: 3,
                    ),
                  ),
                  Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Team B",
                        style: TextStyle(fontSize: 27),
                      ),
                      Text(
                        '${BlocProvider.of<BacektballCubit>(context).numberCountTeamB}',
                        style: const TextStyle(fontSize: 145),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFff9900),
                        ),
                        onPressed: () {
                          BlocProvider.of<BacektballCubit>(context)
                              .teamIncrement(team: 'B', numberCount: 1);
                        },
                        child: const Text(
                          "Add 1 Point",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFff9900),
                        ),
                        onPressed: () {
                          BlocProvider.of<BacektballCubit>(context)
                              .teamIncrement(team: 'B', numberCount: 2);
                        },
                        child: const Text(
                          "Add 2 Point",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFff9900),
                        ),
                        onPressed: () {
                          BlocProvider.of<BacektballCubit>(context)
                              .teamIncrement(team: 'B', numberCount: 3);
                        },
                        child: const Text(
                          "Add 3 Point",
                          style: TextStyle(color: Colors.black),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 70,
              ),
              SizedBox(
                width: 135,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFff9900),
                  ),
                  onPressed: () {
                    BlocProvider.of<BacektballCubit>(context).deleteNumbers();
                  },
                  child: const Text(
                    "Reset",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        );
      },
      listener: (context, state) {
        if (state is TeamAIncrementPointerState) {
        } else {}
      },
    );
  }
}
