import 'package:flutter/material.dart';

class ProgressWidget extends StatelessWidget {

  final Widget child;
  final bool isShow;
  final double opacity;
  final Color color;
  final Animation<Color> valueColor;

  ProgressWidget({
    Key key,
    @required this.child,
    @required this.isShow,
    this.opacity = 0.3,
    this.color = Colors.grey,
    this.valueColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = new List<Widget>();
    widgetList.add(child);
    if (isShow) {
      final modal = new Stack(
        children: [
          new Opacity(
            opacity: opacity,
            child: ModalBarrier(dismissible: false, color: color),
          ),
          new Center(
            child: new CircularProgressIndicator(
              valueColor: valueColor,
            ),
          ),
        ],
      );
      widgetList.add(modal);
    }
    return Stack(
      children: widgetList,
    );
  }
}