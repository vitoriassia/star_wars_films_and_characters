class MovieModel {
  String photo;
  String name;
  int id;
  bool isFavorit;
  String releaseDateOf;
  MovieModel(
      this.id, this.isFavorit, this.name, this.photo, this.releaseDateOf);

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        json["episode_id"],
        false,
        json["title"],
        'assets/episodio${json["episode_id"]}.png',
        getReleaseDateOf(json["release_date"]),
      );
}

String getReleaseDateOf(String dateof) {
  return '${dateof.substring(8, 10)} / ${dateof.substring(5, 7)} / ${dateof.substring(0, 4)}';
}
