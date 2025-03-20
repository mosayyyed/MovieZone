import 'package:flutter/material.dart';

class EscapeParentPadding extends StatelessWidget {
  final double height;
  final Widget child;

  const EscapeParentPadding({
    super.key,
    required this.height,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: height,
      child: Row(
        children: [
          Expanded(
            child: OverflowBox(
              maxWidth: MediaQuery.of(context).size.width,
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}
