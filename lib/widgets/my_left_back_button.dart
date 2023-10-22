import 'package:flutter/material.dart';
import '../constants/constants.dart';

class MyLeftBackButton extends StatelessWidget {
  const MyLeftBackButton(
      {super.key, required this.child, required this.onPressed});

  final Widget child;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final Responsive resp = Responsive(context);
    return Padding(
      padding: paddingHor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: resp.wp(11),
            height: resp.hp(5),
            decoration: BoxDecoration(
              borderRadius: borderRadiusLarge,
              color: Theme.of(context).colorScheme.secondary,
              border: Border.all(color: Theme.of(context).colorScheme.primary),
            ),
            child: IconButton(
              onPressed: onPressed,
              icon: Icon(
                Icons.arrow_back,
                color: Theme.of(context).colorScheme.primary,
                size: iconSmall,
              ),
            ),
          ),
          child,
        ],
      ),
    );
  }
}
