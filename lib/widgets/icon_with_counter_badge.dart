import 'package:flutter/material.dart';

class IconWithCounterBadge extends StatelessWidget {
  final IconData icon;
  final int counter;
  
  const IconWithCounterBadge(this.icon, { Key? key, required this.counter }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Icon(icon),
        Positioned(
          right: 0,
          top: 0,
          child: Container(
            padding: const EdgeInsets.all(1),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(2),
            ),
            constraints: const BoxConstraints(
              minWidth: 10,
              minHeight: 10,
            ),
            child: Text(
              counter.toString(),
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
                fontSize: Theme.of(context).textTheme.caption?.fontSize,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        )
      ],
    );
  }
}