import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:koredizileri/constants/constants.dart';

import '../model/korea_model.dart';

class SerieProvider extends ChangeNotifier {
  bool isLoading = true;
  String error = '';
  Korea korea = Korea(data: []);
  Korea searchedKorea = Korea(data: []);
  String searchText = '';

  getDataFromAPI() async {
    try {
      Response response = await http.get(Uri.parse(koreasUrl));
      if (response.statusCode == 200) {
        korea = koreasFromJson(response.body);
      } else {
        error = response.statusCode.toString();
      }
    } catch (e) {
      error = e.toString();
    }
    isLoading = false;
    updateData();
  }

  updateData() {
    searchedKorea.data.clear();
    if (searchText.isEmpty) {
      searchedKorea.data.addAll(korea.data);
    } else {
      searchedKorea.data.addAll(korea.data
          .where((search) =>
              search.koreasName.toLowerCase().trim().startsWith(searchText))
          .toList());
    }
    notifyListeners();
  }

  search(String koreasName) {
    searchText = koreasName;
    updateData();
  }
}

class MovieProvider extends ChangeNotifier {
  bool isLoading = true;
  String error = '';
  Korea korea = Korea(data: []);
  Korea searchedKorea = Korea(data: []);
  String searchText = '';

  //
  getDataFromAPI() async {
    try {
      Response response = await http.get(Uri.parse(koreamUrl));
      if (response.statusCode == 200) {
        korea = koreasFromJson(response.body);
      } else {
        error = response.statusCode.toString();
      }
    } catch (e) {
      error = e.toString();
    }
    isLoading = false;
    updateData();
  }

  updateData() {
    searchedKorea.data.clear();
    if (searchText.isEmpty) {
      searchedKorea.data.addAll(korea.data);
    } else {
      searchedKorea.data.addAll(korea.data
          .where((element) =>
          element.koreasName.toLowerCase().trim().startsWith(searchText))
          .toList());
    }
    notifyListeners();
  }

  search(String koreasName) {
    searchText = koreasName;
    updateData();
  }
}

class JaponProvider extends ChangeNotifier {
  bool isLoading = true;
  String error = '';
  Korea korea = Korea(data: []);
  Korea searchedKorea = Korea(data: []);
  String searchText = '';

  //
  getDataFromAPI() async {
    try {
      Response response = await http.get(Uri.parse(japonsUrl));
      if (response.statusCode == 200) {
        korea = koreasFromJson(response.body);
      } else {
        error = response.statusCode.toString();
      }
    } catch (e) {
      error = e.toString();
    }
    isLoading = false;
    updateData();
  }

  updateData() {
    searchedKorea.data.clear();
    if (searchText.isEmpty) {
      searchedKorea.data.addAll(korea.data);
    } else {
      searchedKorea.data.addAll(korea.data
          .where((element) =>
          element.koreasName.toLowerCase().trim().startsWith(searchText))
          .toList());
    }
    notifyListeners();
  }

  search(String koreasName) {
    searchText = koreasName;
    updateData();
  }
}