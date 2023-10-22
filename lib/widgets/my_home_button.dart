import 'package:flutter/material.dart';

import '../constants/constants.dart';

class HomeListButton extends StatelessWidget {
  const HomeListButton({
    Key? key,
    this.text,
    this.onPressed,
    this.height = 68,
    this.width = 158,
  }) : super(key: key);

  final String? text;
  final VoidCallback? onPressed;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    final Responsive resp = Responsive(context);
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.only(
            topRight: radiusSmall,
            bottomLeft: radiusSmall,
          ),
          side: BorderSide(
              color: Theme.of(context).colorScheme.primary, width: 1.2),
        ),
      ),
      child: SizedBox(
        width: width != 0 ? width : resp.wp(40),
        height: height != 0 ? height : resp.hp(8),
        child: Center(
          child: Text(
            text ?? '',
            style: fontSFProMedium22,
          ),
        ),
      ),
    );
  }
}
