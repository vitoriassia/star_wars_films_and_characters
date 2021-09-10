class CharacterModel {
  String name;
  String actorName;
  String image;

  CharacterModel(
      {required this.name, required this.image, required this.actorName});

  factory CharacterModel.fromJson(Map<String, dynamic> json) => CharacterModel(
        name: json["name"]["first"] + " " + json["name"]["last"],
        image: json["picture"]["large"],
        actorName: json["actorName"],
      );
}
