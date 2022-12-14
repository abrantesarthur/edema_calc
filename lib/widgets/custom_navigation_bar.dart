import 'package:edema_calc/consts/actions.dart';
import 'package:edema_calc/home.dart';
import 'package:edema_calc/template.dart';
import 'package:flutter/material.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({
    Key? key,
    required this.actions,
    this.height,
  }) : super(key: key);

  final List<CustomAction> actions;
  final double? height;

  @override
  _CustomNavigationBarState createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth,
      height: widget.height ?? 50,
      color: Colors.blue,
      child: Padding(
        // TODO: bar
        padding: calculateLateralPadding(screenWidth),
        child: Row(
          children: [
            InkWell(
              onTap: () => onTapAction(context, HomePage.routeName),
              child: const Text(
                "EDEMA Score Calculator",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Flexible(
              child: Container(),
            ),
            ...widget.actions.map(
              (action) => Padding(
                padding: const EdgeInsets.only(left: 20),
                child: InkWell(
                  onTap: () => onTapAction(context, action.routeName),
                  child: Text(
                    action.title,
                    style: getActionStyle(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextStyle getActionStyle() {
    return const TextStyle(
      color: Colors.white,
      fontSize: 16,
    );
  }

  EdgeInsets calculateLateralPadding(double screenWidth) {
    double padding = screenWidth < 1100
        ? 100
        : screenWidth < 1400
            ? 200
            : screenWidth / 5;
    return EdgeInsets.only(left: padding, right: padding);
  }
}
