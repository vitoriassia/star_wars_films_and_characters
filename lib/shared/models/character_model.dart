class CharacterModel {
  int id;
  String name;
  String actorName;
  String image;
  bool isFavorit = false;

  CharacterModel(
      {required this.id,
      required this.name,
      required this.image,
      required this.actorName});

  factory CharacterModel.fromJson(Map<String, dynamic> json) => CharacterModel(
        id: 1,
        name: json["name"]["first"] + " " + json["name"]["last"],
        image: json["picture"]["large"],
        actorName: json["actorName"],
      );
}
