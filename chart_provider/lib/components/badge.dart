import 'package:flutter/material.dart';

class Badge extends StatelessWidget {
  final Widget child;
  final String value;
  final Color? color;
  const Badge({Key? key, required this.child, required this.value, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        child,
        Positioned(
            top: 8,
            right: 8,
            child: Container(
              padding: const EdgeInsets.all(2),
              constraints: const BoxConstraints(minHeight: 16, minWidth: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: color ?? Theme.of(context).colorScheme.secondary,
              ),
              child: Text(
                value.toString(),
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 12),
              ),
            ))
      ],
    );
  }
}
