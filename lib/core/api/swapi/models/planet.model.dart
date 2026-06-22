class Planet {
    String name;
    String rotationPeriod;
    String orbitalPeriod;
    String diameter;
    String climate;
    String gravity;
    String terrain;
    String surfaceWater;
    String population;
    List<String> residents;
    List<String> films;
    DateTime created;
    DateTime edited;
    String url;
    String id;

    Planet({
        required this.name,
        required this.rotationPeriod,
        required this.orbitalPeriod,
        required this.diameter,
        required this.climate,
        required this.gravity,
        required this.terrain,
        required this.surfaceWater,
        required this.population,
        required this.residents,
        required this.films,
        required this.created,
        required this.edited,
        required this.url,
        required this.id
    });

    factory Planet.fromJson(Map<String, dynamic> json) => Planet(
        name: json["name"],
        rotationPeriod: json["rotation_period"],
        orbitalPeriod: json["orbital_period"],
        diameter: json["diameter"],
        climate: json["climate"],
        gravity: json["gravity"],
        terrain: json["terrain"],
        surfaceWater: json["surface_water"],
        population: json["population"],
        residents: List<String>.from(json["residents"].map((x) => x)),
        films: List<String>.from(json["films"].map((x) => x)),
        created: DateTime.parse(json["created"]),
        edited: DateTime.parse(json["edited"]),
        url: json["url"],
        id: json["url"].split('/').reversed.first
    );
    
    Map<String, String> get relevantInfo => {
        'population': population,
        'climate': climate,
        'gravity': gravity,
        'terrain': terrain,
    };
}