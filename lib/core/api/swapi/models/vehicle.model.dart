class Vehicle {
    String name;
    String model;
    String manufacturer;
    String costInCredits;
    String length;
    String maxAtmospheringSpeed;
    String crew;
    String passengers;
    String cargoCapacity;
    String consumables;
    String vehicleClass;
    List<dynamic> pilots;
    List<String> films;
    DateTime created;
    DateTime edited;
    String url;

    Vehicle({
        required this.name,
        required this.model,
        required this.manufacturer,
        required this.costInCredits,
        required this.length,
        required this.maxAtmospheringSpeed,
        required this.crew,
        required this.passengers,
        required this.cargoCapacity,
        required this.consumables,
        required this.vehicleClass,
        required this.pilots,
        required this.films,
        required this.created,
        required this.edited,
        required this.url,
    });

    factory Vehicle.fromJson(Map<String, dynamic> json) => Vehicle(
        name: json["name"],
        model: json["model"],
        manufacturer: json["manufacturer"],
        costInCredits: json["cost_in_credits"],
        length: json["length"],
        maxAtmospheringSpeed: json["max_atmosphering_speed"],
        crew: json["crew"],
        passengers: json["passengers"],
        cargoCapacity: json["cargo_capacity"],
        consumables: json["consumables"],
        vehicleClass: json["vehicle_class"],
        pilots: List<dynamic>.from(json["pilots"].map((x) => x)),
        films: List<String>.from(json["films"].map((x) => x)),
        created: DateTime.parse(json["created"]),
        edited: DateTime.parse(json["edited"]),
        url: json["url"],
    );

    Map<String, String> get relevantInfo => {
      'model': model,
      'cost': costInCredits,
      'length': length,
      'capacity': cargoCapacity,
      'class': vehicleClass,
    };
}