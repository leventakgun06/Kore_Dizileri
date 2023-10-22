import 'package:flutter/material.dart';
import '../constants/constants.dart';

class MyDialogBox extends StatelessWidget {
  const MyDialogBox({
    super.key,
    required this.image,
    required this.title,
    required this.descp,
    required this.text,
  });

  final String image, title, descp, text;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: borderRadiusMedium,
      ),
      elevation: 10,
      backgroundColor: colorTransparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: paddingLRTB,
          margin: paddingTop / 2,
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: borderRadiusMedium,
              boxShadow: const [
                BoxShadow(
                    color: colorBlack, offset: Offset(0, 10), blurRadius: 10),
              ]),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(title, style: fontSFProBoldRed24),
              sizedBoxHeightSmall,
              Text(descp,
                  style: fontSFProMedium22, textAlign: TextAlign.center),
              sizedBoxHeightSmall,
              Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(text, style: fontSFProMedium22)),
              ),
            ],
          ),
        ),
        Positioned(
          left: kDefaultSpacing,
          right: kDefaultSpacing,
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: kDefaultSpacing * 2,
            child: ClipRRect(
              borderRadius: borderRadiusLarge,
              child: Image.asset(image),
            ),
          ),
        ),
      ],
    );
  }
}

