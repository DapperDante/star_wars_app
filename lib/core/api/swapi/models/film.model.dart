class FilmModel {
    String title;
    int episodeId;
    String openingCrawl;
    String director;
    String producer;
    DateTime releaseDate;
    List<String> characters;
    List<String> planets;
    List<String> starships;
    List<String> vehicles;
    List<String> species;
    DateTime created;
    DateTime edited;
    String url;

    FilmModel({
        required this.title,
        required this.episodeId,
        required this.openingCrawl,
        required this.director,
        required this.producer,
        required this.releaseDate,
        required this.characters,
        required this.planets,
        required this.starships,
        required this.vehicles,
        required this.species,
        required this.created,
        required this.edited,
        required this.url,
    });

    factory FilmModel.fromJson(Map<String, dynamic> json) => FilmModel(
        title: json["title"],
        episodeId: json["episode_id"],
        openingCrawl: json["opening_crawl"],
        director: json["director"],
        producer: json["producer"],
        releaseDate: DateTime.parse(json["release_date"]),
        characters: List<String>.from(json["characters"].map((x) => x)),
        planets: List<String>.from(json["planets"].map((x) => x)),
        starships: List<String>.from(json["starships"].map((x) => x)),
        vehicles: List<String>.from(json["vehicles"].map((x) => x)),
        species: List<String>.from(json["species"].map((x) => x)),
        created: DateTime.parse(json["created"]),
        edited: DateTime.parse(json["edited"]),
        url: json["url"],
    );

    Map<String, String> get relevantInfo => {
      'title': title,
      'director': director,
      'producer': producer,
      'release_date': releaseDate.toIso8601String(),
    };
}
