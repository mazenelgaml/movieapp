// To parse this JSON data, do
//
//     final tvShowsModel = tvShowsModelFromJson(jsonString);

import 'dart:convert';

TvShowsModel tvShowsModelFromJson(String str) {
  final jsonData = json.decode(str);
  return TvShowsModel.fromJson(jsonData);
}

String tvShowsModelToJson(TvShowsModel data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class TvShowsModel {
  int? page;
  List<Result>? results;
  int? totalPages;
  int? totalResults;

  TvShowsModel({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  factory TvShowsModel.fromJson(Map<String, dynamic> json) => new TvShowsModel(
    page: json["page"] == null ? null : json["page"],
    results: json["results"] == null ? null : new List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
    totalPages: json["total_pages"] == null ? null : json["total_pages"],
    totalResults: json["total_results"] == null ? null : json["total_results"],
  );

  Map<String, dynamic> toJson() => {
    "page": page == null ? null : page,
    "results": results == null ? null : new List<dynamic>.from(results!.map((x) => x.toJson())),
    "total_pages": totalPages == null ? null : totalPages,
    "total_results": totalResults == null ? null : totalResults,
  };
}

class Result {
  bool? adult;
  String? backdropPath;
  List<int>? genreIds;
  int? id;
  List<String>? originCountry;
  String? originalLanguage;
  String? originalName;
  String? overview;
  double? popularity;
  String? posterPath;
  String? firstAirDate;
  String? name;
  double? voteAverage;
  int? voteCount;

  Result({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originCountry,
    this.originalLanguage,
    this.originalName,
    this.overview,
    this.popularity,
    this.posterPath,
    this.firstAirDate,
    this.name,
    this.voteAverage,
    this.voteCount,
  });

  factory Result.fromJson(Map<String, dynamic> json) => new Result(
    adult: json["adult"] == null ? null : json["adult"],
    backdropPath: json["backdrop_path"] == null ? null : json["backdrop_path"],
    genreIds: json["genre_ids"] == null ? null : new List<int>.from(json["genre_ids"].map((x) => x)),
    id: json["id"] == null ? null : json["id"],
    originCountry: json["origin_country"] == null ? null : new List<String>.from(json["origin_country"].map((x) => x)),
    originalLanguage: json["original_language"] == null ? null : json["original_language"],
    originalName: json["original_name"] == null ? null : json["original_name"],
    overview: json["overview"] == null ? null : json["overview"],
    popularity: json["popularity"] == null ? null : json["popularity"].toDouble(),
    posterPath: json["poster_path"] == null ? null : json["poster_path"],
    firstAirDate: json["first_air_date"] == null ? null : json["first_air_date"],
    name: json["name"] == null ? null : json["name"],
    voteAverage: json["vote_average"] == null ? null : json["vote_average"].toDouble(),
    voteCount: json["vote_count"] == null ? null : json["vote_count"],
  );

  Map<String, dynamic> toJson() => {
    "adult": adult == null ? null : adult,
    "backdrop_path": backdropPath == null ? null : backdropPath,
    "genre_ids": genreIds == null ? null : new List<dynamic>.from(genreIds!.map((x) => x)),
    "id": id == null ? null : id,
    "origin_country": originCountry == null ? null : new List<dynamic>.from(originCountry!.map((x) => x)),
    "original_language": originalLanguage == null ? null : originalLanguage,
    "original_name": originalName == null ? null : originalName,
    "overview": overview == null ? null : overview,
    "popularity": popularity == null ? null : popularity,
    "poster_path": posterPath == null ? null : posterPath,
    "first_air_date": firstAirDate == null ? null : firstAirDate,
    "name": name == null ? null : name,
    "vote_average": voteAverage == null ? null : voteAverage,
    "vote_count": voteCount == null ? null : voteCount,
  };
}
