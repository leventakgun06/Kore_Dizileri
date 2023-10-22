import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:koredizileri/constants/navigator.dart';
import 'package:provider/provider.dart';

import '../constants/constants.dart';
import '../model/korea_model.dart';
import '../provider/genre_provider.dart';
import 'my_player_about.dart';

class MyDetailBottomBar extends StatelessWidget {
  const MyDetailBottomBar({super.key, required this.korea});

  final Models korea;

  @override
  Widget build(BuildContext context) {
    final GenreProvider genreProvider = context.read<GenreProvider>();
    return SingleChildScrollView(
      child: Column(
        children: [
          sizedBoxHeightLow,
          _MyListViewBuilder(koreaGenres: genreProvider.getGenreList(korea.genreIds)),
          sizedBoxHeightLow,
          _buildCenterRating(context),
          sizedBoxHeightLow,
          _buildText(context),
        ],
      ),
    );
  }

  Center _buildCenterRating(BuildContext context) {
    final Responsive resp = Responsive(context);
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MyContainer(
            height: resp.hp(4.0),
            width: resp.wp(14.0),
            child: Center(
                child: Text(
              korea.contentRating.toString(),
              style: fontSFProBold16,
            )),
          ),
          sizedBoxWidthLow,
          MyContainer(
            height: resp.hp(4.0),
            width: resp.wp(44.0),
            child: Center(
              child: RatingBarIndicator(
                  rating: korea.rating.toDouble() / 2,
                  itemBuilder: (context, index) =>
                      const Icon(Icons.star, color: Colors.amber),
                  itemCount: 5,
                  itemSize: 24),
            ),
          ),
          sizedBoxWidthLow,
          MyContainer(
            height: resp.hp(4.0),
            width: resp.wp(14.0),
            child: Center(
                child: Text('${korea.rating}', style: fontSFProBold16)),
          ),
        ],
      ),
    );
  }

  Widget _buildText(BuildContext context) {
    return Padding(
      padding: paddingLR,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(textSubject, style: fontSFProMedium20),
          sizedBoxHeightLow,
          Text(korea.description, style: fontSFProMedium16),
          sizedBoxHeightLow,
          Text(korea.episode, style: fontSFProMedium22),
          sizedBoxHeightLow,
          Text(textPlayer, style: fontSFProMedium22),
          sizedBoxHeightLow,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _ImageText(
                text: korea.playerName1,
                imageUrl: korea.playerImage1,
                onPressed: () {
                  context.navigateToPage(MyPlayerAbout(
                    playerImage: korea.playerImage1,
                    playerName: korea.playerName1,
                    playerAbout: korea.playerAbout1,
                    seriesName: korea.koreasName,
                  ));
                },
              ),
              _ImageText(
                text: korea.playerName2,
                imageUrl: korea.playerImage2,
                onPressed: () {
                  context.navigateToPage(MyPlayerAbout(
                    playerImage: korea.playerImage2,
                    playerName: korea.playerName2,
                    playerAbout: korea.playerAbout2,
                    seriesName: korea.koreasName,
                  ));
                },
              ),
              _ImageText(
                text: korea.playerName3,
                imageUrl: korea.playerImage3,
                onPressed: () {
                  context.navigateToPage(MyPlayerAbout(
                    playerImage: korea.playerImage3,
                    playerName: korea.playerName3,
                    playerAbout: korea.playerAbout3,
                    seriesName: korea.koreasName,
                  ));
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ImageText extends StatelessWidget {
  const _ImageText(
      {required this.text, required this.imageUrl, required this.onPressed});

  final String text;
  final String imageUrl;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final Responsive resp = Responsive(context);
    return Column(
      children: [
        ClipRRect(
          borderRadius: borderRadiusSmall,
          child: InkWell(
            onTap: onPressed,
            child: SizedBox(
              width: resp.wp(30),
              height: resp.hp(18),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        sizedBoxHeightLow,
        Text(
          text,
          style: fontSFProMedium12,
          textAlign: TextAlign.center,
        ),
        sizedBoxHeightSmall,
      ],
    );
  }
}

class MyContainer extends StatelessWidget {
  const MyContainer(
      {super.key,
      required this.height,
      required this.width,
      required this.child});

  final double height;
  final double width;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: borderRadiusLow,
        border:
            Border.all(color: Theme.of(context).colorScheme.primary, width: .5),
      ),
      child: child,
    );
  }
}

class _MyListViewBuilder extends StatelessWidget {
  const _MyListViewBuilder({required this.koreaGenres});

  final List<String> koreaGenres;

  @override
  Widget build(BuildContext context) {
    final Responsive resp = Responsive(context);
    return SizedBox(
      height: resp.hp(4.0),
      width: resp.width / 1.3,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: koreaGenres.length,
        itemBuilder: (context, index) => Padding(
          padding: paddingHor / 4,
          child: MyContainer(
            height: resp.hp(10.0),
            width: resp.wp(24.0),
            child: Center(
              child: Text(koreaGenres[index], style: fontSFProBold16),
            ),
          ),
        ),
      ),
    );
  }
}
