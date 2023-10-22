import 'package:flutter/material.dart';

import '../model/genre_model.dart';

class GenreProvider extends ChangeNotifier {
  GenreProvider() : super();

  List<String> getGenreList(List<int> idList) {
    List<String> movieGen = [];

    for (int i = 0; i < genreIds.length; i++) {
      for (int j = 0; j < idList.length; j++) {
        if (genreIds[i]['id'] == idList[j]) {
          movieGen.add(genreIds[i]['name']);
        }
      }
    }
    return movieGen;
  }
}
