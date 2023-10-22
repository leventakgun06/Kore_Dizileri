import 'package:flutter/material.dart';
import 'package:koredizileri/constants/navigator.dart';
import 'package:provider/provider.dart';

import '../constants/constants.dart';
import '../provider/korea_provider.dart';
import '../views/age_calculate.dart';
import '../views/japons_list.dart';
import '../views/movies_list.dart';
import '../views/series_list.dart';
import '../widgets/my_home_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    final serieProvider = Provider.of<SerieProvider>(context, listen: false);
    serieProvider.getDataFromAPI();
    final movieProvider = Provider.of<MovieProvider>(context, listen: false);
    movieProvider.getDataFromAPI();
    final japonProvider = Provider.of<JaponProvider>(context, listen: false);
    japonProvider.getDataFromAPI();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Responsive resp = Responsive(context);
    final series = Provider.of<SerieProvider>(context);
    final movies = Provider.of<MovieProvider>(context);
    final japons = Provider.of<JaponProvider>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: resp.hp(8.0),
      ),
      body: Column(
        children: [
          Column(
            children: [
              _headerTextImage(context),
              sizedBoxHeightMedium,
              HomeListButton(
                  text: '$textSeries: ${series.korea.data.length}',
                  onPressed: () => context.navigateToPage(const SeriesList())),
              sizedBoxHeightLow,
              HomeListButton(
                  text: '$textMovies: ${movies.korea.data.length}',
                  onPressed: () => context.navigateToPage(const MoviesList())),
              sizedBoxHeightLow,
              HomeListButton(
                  text: '$textJapon: ${japons.korea.data.length}',
                  onPressed: () => context.navigateToPage(const JaponList())),
              sizedBoxHeightLow,
              HomeListButton(
                  text: textAge,
                  onPressed: () =>
                      context.navigateToPage(const AgeCalculate())),
            ],
          ),
          sizedBoxHeightLow,
          _buildBottomImages(resp),
        ],
      ),
    );
  }

  Row _headerTextImage(BuildContext context) {
    final Responsive resp = Responsive(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            Text(textCountryK, style: fontSFProBold50),
            Text(textSeriesi, style: fontSFProBold50),
          ],
        ),
        Image.asset(imgFilm2, width: resp.wp(44)),
      ],
    );
  }

  Column _buildBottomImages(Responsive resp) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Image.asset(imgFilm3, width: resp.wp(86)),
      ],
    );
  }
}

