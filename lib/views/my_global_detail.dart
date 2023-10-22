import 'package:flutter/material.dart';

import '../model/korea_model.dart';
import '../widgets/my_detail_bottom_bar.dart';
import '../widgets/my_sliver_appbar.dart';

class MyGlobalDetail extends StatelessWidget {
  const MyGlobalDetail({super.key, required this.korea});

  final Models korea;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          MySliverAppBar(
            image: korea.koreasImage,
            text: korea.koreasName,
          ),
          SliverToBoxAdapter(
            child: MyDetailBottomBar(korea: korea),
          ),
        ],
      ),
    );
  }
}
