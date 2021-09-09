class ContactModel {
  String name;
  String email;
  String image;

  ContactModel({required this.name, required this.image, required this.email});

  factory ContactModel.fromJson(Map<String, dynamic> json) => ContactModel(
        name: json["name"]["first"] + " " + json["name"]["last"],
        image: json["picture"]["large"],
        email: json["email"],
      );
}
