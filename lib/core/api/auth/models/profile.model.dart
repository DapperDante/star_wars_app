class ProfileModel {
  int id;
  int createdAt;
  String name;
  String email;
  String role;
  ProfileModel({
    required this.id,
    required this.createdAt,
    required this.name,
    required this.email,
    required this.role,
  });
  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
    id: json["id"],
    createdAt: json["created_at"],
    name: json["name"],
    email: json["email"],
    role: json["role"],
  );
}