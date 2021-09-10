class CharacterModel {
  String name;
  String email;
  String image;

  CharacterModel(
      {required this.name, required this.image, required this.email});

  factory CharacterModel.fromJson(Map<String, dynamic> json) => CharacterModel(
        name: json["name"]["first"] + " " + json["name"]["last"],
        image: json["picture"]["large"],
        email: json["email"],
      );
}
