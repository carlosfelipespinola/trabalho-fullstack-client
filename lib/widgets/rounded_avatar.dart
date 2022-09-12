

import 'package:flutter/material.dart';

class RoundedAvatar extends StatelessWidget {
  final Widget child;

  const RoundedAvatar({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(4.0)),
      child: child,
    );
  }
}
