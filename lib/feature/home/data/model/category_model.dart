class CategoryModel {
  final bool success;
  final String message;
  final List<String> errors;
  final List<CategoryData> data; // هنا نستخدم List لأنها قائمة من الفئات

  CategoryModel({
    required this.success,
    required this.message,
    required this.errors,
    required this.data,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      success: json['success'],
      message: json['message'],
      errors: List<String>.from(json['errors']),
      data: List<CategoryData>.from(json['data'].map((category) => CategoryData.fromJson(category))),
    );
  }
}

class CategoryData {
  final int id;
  final String name;
  final String type;
  final String image;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final List<StoreInCategory> stores;

  CategoryData({
    required this.id,
    required this.name,
    required this.type,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.stores,
  });

  factory CategoryData.fromJson(Map<String, dynamic> json) {
    return CategoryData(
      id: json['id'],
      name: json['name'],
      type: json['type'],
      image: json['image'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      deletedAt: json['deleted_at'] != null ? DateTime.parse(json['deleted_at']) : null,
      stores: List<StoreInCategory>.from(json['stores'].map((store) => StoreInCategory.fromJson(store))),
    );
  }
}

class StoreInCategory {
  final int id;
  final String name;
  final int categoryId;
  final String? image; // يمكن أن تكون الصورة null
  final String address;
  final String? about;
  final String? phone;
  final String latitude;
  final String longitude;
  // String placeId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final List<String> offers; // القوائم تكون فارغة حالياً

  StoreInCategory({
    required this.id,
    required this.name,
    required this.categoryId,
    this.image,
    required this.address,
    this.about,
    this.phone,
    required this.latitude,
    required this.longitude,
    //required this.placeId,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.offers,
  });

  factory StoreInCategory.fromJson(Map<String, dynamic> json) {
    return StoreInCategory(
      id: json['id'],
      name: json['name'],
      categoryId: json['category_id'],
      image: json['image'],
      address: json['address'],
      about: json['about'],
      phone: json['phone'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      //placeId: json['place_id'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      deletedAt: json['deleted_at'] != null ? DateTime.parse(json['deleted_at']) : null,
      offers: List<String>.from(json['offers']), // القوائم هنا تكون فارغة
    );
  }
}
