import 'package:flutter/material.dart';

class BottomSlider extends StatelessWidget {
  final int index;
  final int totalIndex;
  final VoidCallback? onNext;
  final VoidCallback? onPrev;
  final VoidCallback? onComplete;
  const BottomSlider(
      {Key? key,
      required this.index,
      required this.totalIndex,
      this.onNext,
      this.onPrev,
      this.onComplete})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: new Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _getTextButton(
                index == 0 ? "" : "Prev", index == 0 ? null : onPrev),
            _getDottedLayout(),
            _getTextButton(index == totalIndex - 1 ? "Get started" : "Next",
                index == totalIndex - 1 ? onComplete : onNext)
          ]),
    );
  }

  Widget _getDottedLayout() {
    return new Row(
      children: [for (int i = 0; i < totalIndex; i++) _getDot(i)],
    );
  }

  Widget _getDot(int i) {
    final double size = index == i ? 12 : 8;
    final color = index == i ? Colors.blue : Colors.black26;
    return new Container(
      margin: const EdgeInsets.only(right: 8),
      height: size,
      width: size,
      decoration: new BoxDecoration(shape: BoxShape.circle, color: color),
    );
  }

  Widget _getTextButton(String text, VoidCallback? onTap) {
    return new TextButton(
        onPressed: onTap,
        child: new Text(text, style: const TextStyle(color: Colors.black)));
  }
}
