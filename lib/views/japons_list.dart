import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:koredizileri/constants/navigator.dart';
import 'package:koredizileri/views/my_global_detail.dart';
import 'package:koredizileri/widgets/my_anim_search.dart';
import 'package:koredizileri/widgets/my_left_back_button.dart';
import 'package:provider/provider.dart';

import '../constants/constants.dart';
import '../home/home_page.dart';
import '../provider/korea_provider.dart';

class JaponList extends StatefulWidget {
  const JaponList({super.key});

  @override
  State<JaponList> createState() => _JaponListState();
}

class _JaponListState extends State<JaponList> {
  @override
  void initState() {
    final providers = Provider.of<SerieProvider>(context, listen: false);
    providers.getDataFromAPI();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final series = Provider.of<SerieProvider>(context);
    final Responsive resp = Responsive.of(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: resp.hp(4.0),
      ),
      body: Column(
        children: [
          MyLeftBackButton(
              child: MyAnimSearchBar(
                  controller: TextEditingController(),
                  onChanged: (value) => series.search(value)),
              onPressed: () => context.navigateToPage(const HomePage())),
          _headerTextImage(),
          Expanded(
            child: series.isLoading
                ? getLoadingUI()
                : series.error.isNotEmpty
                    ? getErrorUI(series.error)
                    : getBodyUI(),
          ),
        ],
      ),
    );
  }

  Widget _headerTextImage() {
    final Responsive resp = Responsive(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            Text(textCountryJ, style: fontSFProBold50),
            Text(textSeriesi, style: fontSFProBold50),
          ],
        ),
        Image.asset(imgFilm2, width: resp.wp(44)),
      ],
    );
  }

  Widget getLoadingUI() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SpinKitFadingCircle(color: colorBlue, size: 80),
          Text(textLoading, style: fontSFProMedium22),
        ],
      ),
    );
  }

  Widget getErrorUI(String error) {
    return Center(
      child: Text(
        error,
        style: const TextStyle(color: Colors.red, fontSize: 22),
      ),
    );
  }

  Widget getBodyUI() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: Consumer(
            builder: (context, JaponProvider koreaProvider, child) {
              return ListView.separated(
                separatorBuilder: (context, index) {
                  return _buildDivider();
                },
                itemCount: koreaProvider.searchedKorea.data.length,
                itemBuilder: (context, index) {
                  _sort(koreaProvider);
                  return _listTile(koreaProvider, index);
                },
              );
            },
          ),
        ),
      ],
    );
  }

  ListTile _listTile(JaponProvider koreaProvider, int index) {
    return ListTile(
      dense: true,
      contentPadding: paddingHor,
      minVerticalPadding: 10.0,
      leading: Text(koreaProvider.searchedKorea.data[index].koreasName,
          style: fontSFProMedium17),
      trailing: const Icon(Icons.chevron_right, size: iconSmall),
      onTap: () {
        context.navigateToPage(
            MyGlobalDetail(korea: koreaProvider.searchedKorea.data[index]));
      },
    );
  }

  void _sort(JaponProvider koreaProvider) {
    koreaProvider.searchedKorea.data.sort((a, b) {
      return a.koreasName.toLowerCase().compareTo(b.koreasName.toLowerCase());
    });
  }

  Divider _buildDivider() {
    return const Divider(
      indent: kDefaultSpacing - 10,
      endIndent: kDefaultSpacing,
      height: 1,
    );
  }
}
