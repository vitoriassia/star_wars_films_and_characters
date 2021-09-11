class CharacterModel {
  int id;
  String name;

  String? image;
  bool isFavorit = false;

  CharacterModel({
    required this.id,
    required this.name,
    required this.image,
  });

  factory CharacterModel.fromJson(Map<String, dynamic> json) => CharacterModel(
        id: getIdByUrl(json["url"]),
        name: json["name"],
        image: null,
      );
}

// fazendo isso pois a API nao oferece um id
int getIdByUrl(String url) {
  String myid = url.substring(29, 31);

  if (myid[1] == "/")
    return int.parse(myid[0]);
  else
    return int.parse(myid);
}
