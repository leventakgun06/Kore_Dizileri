import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:koredizileri/constants/navigator.dart';


import '../constants/constants.dart';

import '../home/home_page.dart';
import '../widgets/my_left_back_button.dart';


class AgeCalculate extends StatefulWidget {
  const AgeCalculate({Key? key}) : super(key: key);

  @override
  State<AgeCalculate> createState() => _AgeCalculateState();
}

class _AgeCalculateState extends State<AgeCalculate> {
  String days = "", month = "", year = "";
  @override
  Widget build(BuildContext context) {
    final Responsive resp = Responsive.of(context);
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: resp.hp(10),
            child: MyLeftBackButton(
              onPressed: () => context.navigateToPage(const HomePage()),
              child: const Center(),
            ),
          ),
          Positioned(
            top: resp.hp(20),
            left: resp.wp(06),
            child: Text(textTopAge, style: fontSFProMedium44),
          ),
          Padding(
            padding: paddingTop * 1.2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OutlinedButton(
                      onPressed: () {
                        getBirthdays();
                      },
                      style: OutlinedButton.styleFrom(
                        foregroundColor:
                            Theme.of(context).colorScheme.primary,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                          topRight: radiusSmall,
                          bottomLeft: radiusSmall,
                        )),
                        side: BorderSide(
                          width: 2.0,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      child: Padding(
                        padding: paddingHV,
                        child: Text(
                          textBirthDay,
                          style: fontSFProMedium24,
                        ),
                      ),
                    ),
                    sizedBoxHeightMedium,
                    Container(
                      width: resp.wp(66),
                      height: resp.hp(10),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topRight: radiusMedium,
                          bottomLeft: radiusMedium,
                        ),
                        color: colorTransparent,
                        border: Border.all(
                            color: Theme.of(context).colorScheme.primary,
                            width: 2.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildText(context, "$year. "),
                          sizedBoxHeightLow,
                          _buildText(context, "$month. "),
                          sizedBoxHeightLow,
                          _buildText(context, days),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Text _buildText(BuildContext context, String text) {
    return Text(
      text,
      style: fontSFProMedium24,
    );
  }

  Future getBirthdays() async {
    int d, m, y;
    DateTime? date = await showDatePicker(
        builder: (context, child) {
          return Theme(
            data: ThemeData.light().copyWith(
              colorScheme: const ColorScheme.dark(
                onPrimary: colorBlack,
                primary: colorGrey,
                onSurface: colorBlack,
                surface: colorWhite,
              ),
              dialogBackgroundColor: colorWhite,
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelMedium,
                  foregroundColor: colorBlack,
                  backgroundColor: colorWhite,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topRight: radiusSmall,
                      bottomLeft: radiusSmall,
                    ),
                    side: BorderSide(color: colorPurple, width: 1.2),
                  ),
                ),
              ),
            ),
            child: child!,
          );
        },
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime.now());
    setState(() {
      d = int.parse(DateFormat("dd").format(date!));
      m = int.parse(DateFormat("MM").format(date));
      y = int.parse(DateFormat("yyyy").format(date));
      int d1 = int.parse(DateFormat("dd").format(DateTime.now()));
      int m1 = int.parse(DateFormat("MM").format(DateTime.now()));
      int y1 = int.parse(DateFormat("yyyy").format(DateTime.now()));
      int day = finddays(m1, y1);
      if (d1 - d >= 0) {
        days = "${d1 - d} gün";
      } else {
        days = "${d1 + day - d} gün";
        m1 = m1 - 1;
      }
      if (m1 - m >= 0) {
        month = "${m1 - m} ay";
      } else {
        month = "${m1 + 12 - m} ay";
        y1 = y1 - 1;
      }
      year = "${y1 - y} yıl";
    });
  }

  int finddays(int m2, int y2) {
    int day2;
    if (m2 == 1 ||
        m2 == 3 ||
        m2 == 5 ||
        m2 == 7 ||
        m2 == 8 ||
        m2 == 10 ||
        m2 == 12) {
      day2 = 31;
    } else if (m2 == 4 || m2 == 6 || m2 == 9 || m2 == 11) {
      day2 = 30;
    } else {
      if (y2 % 4 == 0) {
        day2 = 29;
      } else {
        day2 = 28;
      }
    }
    return day2;
  }
}
