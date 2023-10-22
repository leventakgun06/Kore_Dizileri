// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:koredizileri/constants/navigator.dart';
import 'package:koredizileri/widgets/my_dialog_box.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants/constants.dart';
import 'my_home_button.dart';
import 'my_left_back_button.dart';

class MyPlayerAbout extends StatelessWidget {
  const MyPlayerAbout({
    super.key,
    required this.playerImage,
    required this.playerName,
    required this.playerAbout,
    required this.seriesName,
  });

  final String playerImage;
  final String playerName;
  final String playerAbout;
  final String seriesName;

  @override
  Widget build(BuildContext context) {
    final Responsive resp = Responsive.of(context);
    final Uri url = Uri.parse(playerAbout);

    Future<void> showLaunchUrl() async {
      if (!await launchUrl(url)) {
        buildShowDialog(context);
      } else {
        throw Exception("$url başlatılamadı");
      }
    }

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: resp.hp(10),
            child: MyLeftBackButton(child: const Center(), onPressed: () => context.navigation.pop()),
          ),
          Positioned(
            top: resp.hp(18),
            left: resp.wp(06),
            child: Text(
              textInfo,
              style: fontSFProMedium44,
            ),
          ),
          Padding(
            padding: paddingTop * 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                sizedBoxWidthLow,
                Text(
                  seriesName,
                  style: fontSFProMedium22,
                ),
                sizedBoxHeightLow,
                Center(
                  child: ClipRRect(
                    borderRadius: borderRadiusSmall,
                    child: Image.network(
                      playerImage,
                      fit: BoxFit.fitHeight,
                      height: resp.hp(30),
                    ),
                  ),
                ),
                sizedBoxHeightLow,
                Center(
                  child: Text(
                    playerName,
                    style: fontSFProMedium16,
                    textAlign: TextAlign.center,
                  ),
                ),
                sizedBoxHeightLarge,
                HomeListButton(
                  height: resp.hp(6),
                  width: resp.wp(32),
                  text: textGoAbout,
                  onPressed: showLaunchUrl,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<dynamic> buildShowDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (_) {
        return const MyDialogBox(
          image: imgWarning,
          title: textWarning,
          descp: textInfoBox,
          text: textClose,
        );
      },
    );
  }
}
