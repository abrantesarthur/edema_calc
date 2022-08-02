import 'package:edema_calc/widgets/components.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        return SingleChildScrollView(
          child: Row(
            children: [
              Flexible(flex: 1, child: Container()),
              Flexible(
                flex: calculateFlex(constraints),
                child: Container(
                  child: const Components(title: "EDEMA Calculator"),
                  padding: const EdgeInsets.only(top: 20, bottom: 50),
                ),
              ),
              Flexible(flex: 1, child: Container()),
            ],
          ),
        );
      }),
    );
  }
}

int calculateFlex(BoxConstraints constraints) {
  return constraints.maxWidth < 400
      ? 14
      : constraints.maxWidth < 600
          ? 10
          : constraints.maxWidth < 1000
              ? 6
              : 2;
}
