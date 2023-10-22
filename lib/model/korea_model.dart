import 'dart:convert';

Korea koreasFromJson(String str) => Korea.fromJson(json.decode(str));

String koreasToJson(Korea data) => json.encode(data.toJson());

class Korea {
  Korea({required this.data});

  final List<Models> data;

  factory Korea.fromJson(Map<String, dynamic> json) => Korea(
        data: List<Models>.from(json["data"].map((x) => Models.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Models {
  Models({
    required this.id,
    required this.koreasName,
    required this.koreasImage,
    required this.rating,
    required this.description,
    required this.playerName1,
    required this.playerName2,
    required this.playerName3,
    required this.playerImage1,
    required this.playerImage2,
    required this.playerImage3,
    required this.genreIds,
    required this.contentRating,
    required this.episode,
    required this.playerAbout1,
    required this.playerAbout2,
    required this.playerAbout3,
  });

  final int id;
  final String koreasName;
  final String koreasImage;
  final double rating;
  final String description;
  final String playerName1;
  final String playerName2;
  final String playerName3;
  final String playerImage1;
  final String playerImage2;
  final String playerImage3;
  final List<int> genreIds;
  final String contentRating;
  final String episode;
  final String playerAbout1;
  final String playerAbout2;
  final String playerAbout3;

  factory Models.fromJson(Map<String, dynamic> json) => Models(
        id: json["id"],
        koreasName: json["koreasName"],
        koreasImage: json["koreasImage"],
        rating: json["rating"]?.toDouble(),
        description: json['description'],
        playerName1: json['playerName1'],
        playerName2: json['playerName2'],
        playerName3: json['playerName3'],
        playerImage1: json['playerImage1'],
        playerImage2: json['playerImage2'],
        playerImage3: json['playerImage3'],
        genreIds: json['genreIds'].cast<int>(),
        contentRating: json['contentRating'],
        episode: json['episode'],
        playerAbout1: json['playerAbout1'],
        playerAbout2: json['playerAbout2'],
        playerAbout3: json['playerAbout3'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "koreasName": koreasName,
        "koreasImage": koreasImage,
        "rating": rating,
        "description": description,
        "playerName1": playerName1,
        "playerName2": playerName2,
        "playerName3": playerName3,
        "playerImage1": playerImage1,
        "playerImage2": playerImage2,
        "playerImage3": playerImage3,
        "genreIds": genreIds,
        "contentRating": contentRating,
        "episode": episode,
        "playerAbout1": playerAbout1,
        "playerAbout2": playerAbout2,
        "playerAbout3": playerAbout3,
      };
}
