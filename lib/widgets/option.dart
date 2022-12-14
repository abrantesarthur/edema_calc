import 'package:edema_calc/consts/buttons.dart';
import 'package:edema_calc/consts/calculator_input.dart';
import 'package:flutter/material.dart';

class ComponentOption extends StatefulWidget {
  const ComponentOption({
    Key? key,
    required this.input,
    required this.index,
    required this.isSelected,
    required this.callback,
    this.isLast = false,
  }) : super(key: key);

  final CalculatorInputOptions input;
  final int index;
  final bool isSelected;
  final void Function(int index) callback;
  final bool isLast;

  @override
  State<StatefulWidget> createState() => ComponentOptionState();
}

// ignore: must_be_immutable
class ComponentOptionState extends State<ComponentOption> {
  ComponentOptionState();

  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => widget.callback(widget.index),
      onHover: (v) => setState(() {
        isHover = v;
      }),
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              widget.input.title,
              style: TextStyle(
                color: widget.isSelected ? Colors.white : Colors.black,
                fontSize: 16,
              ),
            ),
            Text(
              "+" + widget.input.score.toString(),
              style: TextStyle(
                color: widget.isSelected ? Colors.white : Colors.black,
                fontSize: 16,
              ),
            ),
          ],
        ),
        height: buttonHeight,
        decoration: getButtonDecoration(
          isSelected: widget.isSelected,
          isFirst: widget.index == 0,
          isLast: widget.isLast,
        ),
      ),
    );
  }
}
