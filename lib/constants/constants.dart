import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Responsive {
  late double _width, _height;

  double get width => _width;
  double get height => _height;

  static Responsive of(BuildContext context) => Responsive(context);

  Responsive(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final Size sizeOf = MediaQuery.sizeOf(context);
    _width = size.width;
    _height = size.height;

    _width = sizeOf.width;
    _height = sizeOf.height;
  }

  double wp(double val) => _width * val / 100;
  double hp(double val) => _height * val / 100;
}

//Divider indent
const kDefaultSpacing = 20.0;

//Icon Size
const double iconLow = 10;
const double iconSmall = 20;

TextStyle get fontSFProBold50 =>
    const TextStyle(fontSize: 50, fontFamily: sfProBold);
TextStyle get fontSFProMedium44 =>
    const TextStyle(fontSize: 44, fontFamily: sfProBold);
TextStyle get fontSFProMedium24 =>
    const TextStyle(fontSize: 24, fontFamily: sfProMedium);
TextStyle get fontSFProMedium22 =>
    const TextStyle(fontSize: 22, fontFamily: sfProMedium);
TextStyle get fontSFProMedium20 =>
    const TextStyle(fontSize: 20, fontFamily: sfProBold);
TextStyle get fontSFProMedium17 =>
    const TextStyle(fontSize: 17, fontFamily: sfProMedium);
TextStyle get fontSFProMedium16 =>
    const TextStyle(fontSize: 16, fontFamily: sfProMedium);
TextStyle get fontSFProBold16 =>
    const TextStyle(fontSize: 16, fontFamily: sfProBold);
TextStyle get fontSFProMedium12 =>
    const TextStyle(fontSize: 12, fontFamily: sfProMedium);

//Text Fonts Color
TextStyle get fontSFProBoldRed24 =>
    const TextStyle(fontSize: 24, fontFamily: sfProBold, color: colorRed);

//Paddings
const EdgeInsets paddingAll = EdgeInsets.all(8.0);
const EdgeInsets paddingTop = EdgeInsets.only(top: 50.0);
const EdgeInsets paddingLeft = EdgeInsets.only(left: 8.0);
const EdgeInsets paddingBot = EdgeInsets.only(bottom: 3.0);
const EdgeInsets paddingLB = EdgeInsets.only(left: 20, bottom: .8);
const EdgeInsets paddingHor = EdgeInsets.symmetric(horizontal: 10.0);
const EdgeInsets paddingLR = EdgeInsets.only(left: 10.0, right: 10.0);
const EdgeInsets paddingHV = EdgeInsets.symmetric(horizontal: 20, vertical: 20);
const EdgeInsets paddingLRTB = EdgeInsets.only(left: 20, right: 20, top: 65, bottom: 20);


//Radius
const Radius radiusZero = Radius.circular(0);
const Radius radiusHeight = Radius.circular(50);

const Radius radiusLow = Radius.circular(10);
const Radius radiusSmall = Radius.circular(20);
const Radius radiusMedium = Radius.circular(30);
const Radius radiusLarge = Radius.circular(40);

//BorderRadius
BorderRadius borderRadiusLow = BorderRadius.circular(10);
BorderRadius borderRadiusSmall = BorderRadius.circular(20);
BorderRadius borderRadiusMedium = BorderRadius.circular(30);
BorderRadius borderRadiusLarge = BorderRadius.circular(40);

//SizedBox Height
const SizedBox sizedBoxHeightLow = SizedBox(height: 10);
const SizedBox sizedBoxHeightSmall = SizedBox(height: 20);
const SizedBox sizedBoxHeightMedium = SizedBox(height: 30);
const SizedBox sizedBoxHeightLarge = SizedBox(height: 40);

//SizedBox Width
const SizedBox sizedBoxWidthLow = SizedBox(width: 10);

//Colors
const Color colorBlack = Color(0xFF000000);
const Color colorWhite = Color(0xFFffffff);
const Color colorBlue = Color(0xFF2196F3);
const Color colorGreen = Color(0xFF43A047);
const Color colorRed = Color(0xFFFF0000);
const Color colorPurple = Color(0xFF660099);
const Color colorOrange = Color(0xFFFF9800);
const Color colorGrey = Color(0xFF9E9E9E);
const Color colorCyan = Color(0xFF00bcd4);
const Color colorAmber = Color(0xFFFFBF00);
const Color colorTransparent = Color(0x00000000);

const Color colorMineShaft = Color(0xFF303030);
const Color colorWhites = Color(0xFFFAFAFA);

class ThemeClass {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: colorWhite,
    listTileTheme: const ListTileThemeData(contentPadding: EdgeInsets.zero),
    cardTheme: const CardTheme(color: colorWhite),
    dividerTheme: const DividerThemeData(color: colorBlack),
    iconTheme: const IconThemeData(color: colorMineShaft),
    iconButtonTheme: IconButtonThemeData(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(colorMineShaft))),
    appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        titleTextStyle: TextStyle(color: colorBlack),
        backgroundColor: colorWhite,
        elevation: 0.0),
    colorScheme: const ColorScheme.light().copyWith(
      primary: colorMineShaft,
      secondary: colorWhite,
      onBackground: colorGrey.withOpacity(.4),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(colorWhite),
        foregroundColor: MaterialStateProperty.all<Color>(colorBlack),
        side: MaterialStateProperty.all(
          const BorderSide(color: colorBlack),
        ),
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: colorMineShaft,
    listTileTheme: const ListTileThemeData(contentPadding: EdgeInsets.zero),
    cardTheme: const CardTheme(color: colorMineShaft),
    dividerTheme: const DividerThemeData(color: colorWhite),
    iconTheme: const IconThemeData(color: colorWhite),
    iconButtonTheme: IconButtonThemeData(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(colorWhite))),
    appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle.light,
        titleTextStyle: TextStyle(color: colorWhite),
        backgroundColor: colorMineShaft,
        elevation: 0.0),
    colorScheme: const ColorScheme.dark().copyWith(
      primary: colorWhite,
      secondary: colorMineShaft,
      onBackground: colorGrey.withOpacity(.2),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(colorMineShaft),
        foregroundColor: MaterialStateProperty.all<Color>(colorWhite),
        side: MaterialStateProperty.all(
          const BorderSide(color: colorWhite),
        ),
      ),
    ),
  );
}

//Font Family
const kanitBold = 'Kanit-Bold';
const kanitRegular = 'Kanit-Regular';
const kanitMedium = 'Kanit-Medium';

const sfProBold = 'SF-Pro-Display-Bold';
const sfProRegular = 'SF-Pro-Display-Regular';
const sfProMedium = 'SF-Pro-Display-Medium';

//Images
const String imgFilm1 = 'assets/images/im_film1.png';
const String imgFilm2 = 'assets/images/im_film2.png';
const String imgFilm3 = 'assets/images/im_film3.png';
const String imgFilm4 = 'assets/images/im_film4.png';
const String imgFilm5 = 'assets/images/im_film5.png';
const String imgWarning = 'assets/images/im_warning.png';
const String imgSplash = 'assets/images/im_splash.png';

//Text
const String textAppName = 'Kore Dizileri';
const String textSeries = 'Diziler';
const String textMovies = 'Filmler';
const String textJapon = 'Japon';
const String textAge = 'Yaş Hesapla';

const String textLoading = 'Yükleniyor...';
const String textSubject = 'Konusu:';
const String textPlayer = 'Oyuncular:';
const String textEpisode = 'Bölüm:';
const String textSeriesError = "Diziler Yok";
const String textMoviesError = "Filmler Yok";
const String textCountryK = "Kore";
const String textCountryJ = "Japon";
const String textSeriesi = 'Dizileri';
const String textMoviesi = 'Filmleri';
const String textSearch = 'Ara...';
const String textInfo = 'Bilgiler:';
const String textGoAbout = 'Hakkında';
const String textClose = 'Kapat';
const String textWarning = 'Uyarı!';
const String textInfoBox = 'Henüz bilgi girilmedi...';
const String textTopAge = 'Yaş\nHesapla';
const String textBirthDay = 'Doğum Günü';
const String textWrong = 'Bir şeyler ters gitti';

//Network json
String get koreasUrl => 'https://leventakgun06.github.io/api/koreas.json';
String get koreamUrl => 'https://leventakgun06.github.io/api/koream.json';
String get japonsUrl => 'https://leventakgun06.github.io/api/japons.json';
