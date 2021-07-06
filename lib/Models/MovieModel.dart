  // @dart=2.9
import 'dart:convert';

MoviesModel moviesModelFromJson(String str) => MoviesModel.fromJson(json.decode(str));

String moviesModelToJson(MoviesModel data) => json.encode(data.toJson());

class MoviesModel {

  MoviesModel({
    this.sourceUrl,
    this.lastUpdatedAtApify,
    this.author,
    this.lastUpdatedAtSource,
    this.phim,
  });

  String sourceUrl;
  DateTime lastUpdatedAtApify;
  String author;
  DateTime lastUpdatedAtSource;
  PhimClass phim;

  factory MoviesModel.fromJson(Map<String, dynamic> json) => MoviesModel(
    sourceUrl: json["sourceUrl"],
    lastUpdatedAtApify: DateTime.parse(json["lastUpdatedAtApify"]),
    author: json["author"],
    lastUpdatedAtSource: DateTime.parse(json["lastUpdatedAtSource"]),
    phim: PhimClass.fromJson(json["phim"]),
  );

  Map<String, dynamic> toJson() => {
    "sourceUrl": sourceUrl,
    "lastUpdatedAtApify": lastUpdatedAtApify.toIso8601String(),
    "author": author,
    "lastUpdatedAtSource": lastUpdatedAtSource.toIso8601String(),
    "phim": phim.toJson(),
  };
}

class PhimClass {
  PhimClass({
    this.phimbo,
    this.phimle,
    this.phimchieurap,
    this.phimhoathinh,
  });

  List<PhimboElement> phimbo;
  List<Phimle> phimle;
  List<PhimboElement> phimchieurap;
  List<PhimboElement> phimhoathinh;

  factory PhimClass.fromJson(Map<String, dynamic> json) => PhimClass(
    phimbo: List<PhimboElement>.from(json["phimbo"].map((x) => PhimboElement.fromJson(x))),
    phimle: List<Phimle>.from(json["phimle"].map((x) => Phimle.fromJson(x))),
    phimchieurap: List<PhimboElement>.from(json["phimchieurap"].map((x) => PhimboElement.fromJson(x))),
    phimhoathinh: List<PhimboElement>.from(json["phimhoathinh"].map((x) => PhimboElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "phimbo": List<dynamic>.from(phimbo.map((x) => x.toJson())),
    "phimle": List<dynamic>.from(phimle.map((x) => x.toJson())),
    "phimchieurap": List<dynamic>.from(phimchieurap.map((x) => x.toJson())),
    "phimhoathinh": List<dynamic>.from(phimhoathinh.map((x) => x.toJson())),
  };
}

class PhimboElement {
  PhimboElement({
    this.category,
    this.episode,
    this.imageUrl,
    this.title,
    this.url,
  });

  Category category;
  List<PhimboEpisode> episode;
  String imageUrl;
  String title;
  String url;

  factory PhimboElement.fromJson(Map<String, dynamic> json) => PhimboElement(
    category: categoryValues.map[json["category"]],
    episode: List<PhimboEpisode>.from(json["episode"].map((x) => PhimboEpisode.fromJson(x))),
    imageUrl: json["imageUrl"],
    title: json["title"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "category": categoryValues.reverse[category],
    "episode": List<dynamic>.from(episode.map((x) => x.toJson())),
    "imageUrl": imageUrl,
    "title": title,
    "url": url,
  };
}

enum Category { PHIM_HNH_NG, PHIM_TNH_CM, PHIM_C_TRANG, TV_SHOW, HI_HC, PHIM_PHIU_LU, PHIM_HOT_HNH, PHIM_KINH_D }

final categoryValues = EnumValues({
  "Hài Hước": Category.HI_HC,
  "Phim cổ trang": Category.PHIM_C_TRANG,
  "Phim hành động": Category.PHIM_HNH_NG,
  "Phim hoạt hình": Category.PHIM_HOT_HNH,
  "Phim kinh dị": Category.PHIM_KINH_D,
  "Phim phiêu lưu": Category.PHIM_PHIU_LU,
  "Phim tình cảm": Category.PHIM_TNH_CM,
  "TV SHOW": Category.TV_SHOW
});

class PhimboEpisode {
  PhimboEpisode({
    this.episode,
    this.url,
    this.type,
  });

  String episode;
  String url;
  Type type;

  factory PhimboEpisode.fromJson(Map<String, dynamic> json) => PhimboEpisode(
    episode: json["episode"] == null ? null : json["episode"],
    url: json["url"],
    type: typeValues.map[json["type"]],
  );

  Map<String, dynamic> toJson() => {
    "episode": episode == null ? null : episode,
    "url": url,
    "type": typeValues.reverse[type],
  };
}

enum Type { IFRAME, VIDEO, EMPTY }

final typeValues = EnumValues({
  "": Type.EMPTY,
  "iframe": Type.IFRAME,
  "video": Type.VIDEO
});

class Phimle {
  Phimle({
    this.category,
    this.episode,
    this.imageUrl,
    this.title,
    this.url,
  });

  Category category;
  List<PhimleEpisode> episode;
  String imageUrl;
  String title;
  String url;

  factory Phimle.fromJson(Map<String, dynamic> json) => Phimle(
    category: categoryValues.map[json["category"]],
    episode: List<PhimleEpisode>.from(json["episode"].map((x) => PhimleEpisode.fromJson(x))),
    imageUrl: json["imageUrl"],
    title: json["title"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "category": categoryValues.reverse[category],
    "episode": List<dynamic>.from(episode.map((x) => x.toJson())),
    "imageUrl": imageUrl,
    "title": title,
    "url": url,
  };
}

class PhimleEpisode {
  PhimleEpisode({
    this.url,
    this.type,
  });

  String url;
  Type type;

  factory PhimleEpisode.fromJson(Map<String, dynamic> json) => PhimleEpisode(
    url: json["url"],
    type: typeValues.map[json["type"]],
  );

  Map<String, dynamic> toJson() => {
    "url": url,
    "type": typeValues.reverse[type],
  };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
