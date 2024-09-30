class CategoryModel {
  final int id;
  final String name;
  final String imageUrl;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;

  CategoryModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });

  // Factory constructor to create a Category from JSON
  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      name: json['name'],
      imageUrl: json['image'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      deletedAt: json['deleted_at'] != null ? DateTime.parse(json['deleted_at']) : null,
    );
  }
}
