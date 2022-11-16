import 'package:flutter/material.dart';
import 'package:frontend_job_recruitment/utils/colors.dart';

class RoundedToggle extends StatefulWidget {
  final BoxConstraints box;
  final Function(bool toggle) callback;
  final String option1;
  final String option2;

  const RoundedToggle({
    Key? key,
    required this.box,
    required this.callback,
    required this.option1,
    required this.option2,
  }) : super(key: key);

  @override
  State<RoundedToggle> createState() => _RoundedToggleState();
}

class _RoundedToggleState extends State<RoundedToggle> {
  bool toggle = false;

  void setToggle(bool val) {
    toggle = val;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) {
        setState(() {
          toggle = !toggle;
          widget.callback(toggle);
        });
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: paletteIndigo,
        ),
        clipBehavior: Clip.antiAlias,
        width: widget.box.maxWidth * 0.7,
        height: 40,
        child: Stack(
          children: [
            AnimatedContainer(
              margin: !toggle
                  ? const EdgeInsets.only(left: 5, top: 5)
                  : EdgeInsets.only(left: widget.box.maxWidth * 0.7 * 0.5 + 5, top: 5),
              duration: const Duration(milliseconds: 300),
              width: widget.box.maxWidth * 0.7 * 0.5 - 10,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 40,
              child: Row(
                children: [
                  Expanded(
                    child: Center(
                      child: AnimatedDefaultTextStyle(
                        duration: const Duration(milliseconds: 300),
                        style: TextStyle(
                          color: !toggle ? paletteMagenta : Colors.white,
                          fontWeight: !toggle ? FontWeight.w800 : FontWeight.w500,
                        ),
                        child: Text(widget.option1),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: AnimatedDefaultTextStyle(
                        duration: const Duration(milliseconds: 300),
                        style: TextStyle(
                          color: toggle ? paletteMagenta : Colors.white,
                          fontWeight: toggle ? FontWeight.w800 : FontWeight.w500,
                        ),
                        child: Text(widget.option2),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
