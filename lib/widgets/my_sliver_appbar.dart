import 'package:flutter/material.dart';
import 'package:koredizileri/constants/navigator.dart';

import '../constants/constants.dart';
import 'my_left_back_button.dart';

class MySliverAppBar extends StatelessWidget {
  const MySliverAppBar({
    super.key,
    required this.image,
    required this.text,
  });

  final String image;
  final String text;

  @override
  Widget build(BuildContext context) {
    final Responsive resp = Responsive(context);
    return SliverAppBar(
      elevation: 0.0,
      automaticallyImplyLeading: false,
      toolbarHeight: resp.hp(14),
      expandedHeight: resp.hp(70),
      title: MyLeftBackButton(
        onPressed: () => context.navigation.pop(),
        child: const Center(),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: Image.network(image, fit: BoxFit.cover),
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(05),
        child: Container(
          width: double.infinity,
          padding: paddingAll,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: const BorderRadius.only(
              topLeft: radiusMedium,
              topRight: radiusMedium,
            ),
          ),
          child: Align(
            alignment: Alignment.center,
            child: Text(text, style: fontSFProMedium20),
          ),
        ),
      ),
      stretch: true,
      backgroundColor: colorTransparent,
    );
  }
}
