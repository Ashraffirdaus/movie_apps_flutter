// ignore_for_file: unnecessary_new, unused_import

import 'package:flutter/cupertino.dart';

class MovieSearch {
  final String title;
  final String imdbId;
  final String year;
  final String poster;
  final String type;

  MovieSearch(
      {required this.title,
      required this.imdbId,
      required this.year,
      required this.poster,
      required this.type});

  factory MovieSearch.fromJson(Map<String, dynamic> json) {
    return MovieSearch(
        title: json["Title"],
        imdbId: json["imdbID"],
        year: json["Year"],
        poster: json["Poster"],
        type: json["Type"]);
  }
  // Transform JSON array into list of map , only do this method if in the UI you have a ListView
  static List<MovieSearch> moviesFromJson(dynamic json) {
    var searchResult = json["Search"];
    if (searchResult != null) {
      var results = new List<MovieSearch>.empty(growable: true);
      searchResult.forEach((v) {
        results.add(MovieSearch.fromJson(v));
      });
      return results;
    }
    return new List<MovieSearch>.empty();
  }
}
