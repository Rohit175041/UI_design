import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/providertwo.dart';

class Devicebutton extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  Devicebutton(
      {Key? key,
      required this.value,
      required this.onChanged,
      required MaterialAccentColor activeColor})
      : super(key: key);

  @override
  _DevicebuttonState createState() => _DevicebuttonState();
}

class _DevicebuttonState extends State<Devicebutton>
    with SingleTickerProviderStateMixin {
  Animation? _circleAnimation;
  AnimationController? _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 60));
    _circleAnimation = AlignmentTween(
            begin: widget.value ? Alignment.centerRight : Alignment.centerLeft,
            end: widget.value ? Alignment.centerLeft : Alignment.centerRight)
        .animate(CurvedAnimation(
            parent: _animationController!, curve: Curves.linear));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController!,
      builder: (context, child) {
        return GestureDetector(
          onTap: () {
            if (_animationController!.isCompleted) {
              _animationController!.reverse();
            } else {
              _animationController!.forward();
            }
            widget.value == false
                ? widget.onChanged(true)
                : widget.onChanged(false);
          },
          child: Container(
            width: 50.0,
            height: 28.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24.0),
                // color: _circleAnimation!.value == Alignment.centerLeft
                //     ? Colors.white
                //     : Colors.blueGrey.shade100,
                color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 2.0, bottom: 2.0, right: 2.0, left: 2.0),
              child: Stack(children: [
                Container(
                  alignment: widget.value
                      ? ((Directionality.of(context) == TextDirection.rtl)
                          ? Alignment.centerRight
                          : Alignment.centerLeft)
                      : ((Directionality.of(context) == TextDirection.rtl)
                          ? Alignment.centerLeft
                          : Alignment.centerRight),
                  child: Container(
                    width: 21.0,
                    height: 21.0,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.black),
                  ),
                ),
                widget.value
                    ? const Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "Off ",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ))
                    : const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          " On",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ))
              ]),
            ),
          ),
        );
      },
    );
  }
}
