

import 'package:client/helpers/spacings_helper.dart';
import 'package:flutter/material.dart';

class RoundedAvatar extends StatelessWidget {
  final Widget child;
  final double aspectRatio;

  const RoundedAvatar({
    Key? key,
    required this.child,
    this.aspectRatio = 1
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: aspectRatio,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(4.0)),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).primaryColor.withOpacity(0.2),
              width: 1.5
            ),
          ),
          padding: EdgeInsets.all(SpacingsHelper.small),
          child: child
        ),
      ),
    );
  }
}
