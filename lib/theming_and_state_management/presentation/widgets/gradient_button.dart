import 'package:flutter/material.dart';

import '../theme.dart';

class GradientButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final EdgeInsets padding;

  const GradientButton({
    Key? key,
    required this.text,
    required this.onTap,
    this.padding = const EdgeInsets.all(14),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: deliveryGradient),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: onTap,
          child: Padding(
            padding: padding,
            child: Text(
              text,
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
