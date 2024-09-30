class StoreModel {
  final bool success;
  final String message;
  final List<dynamic> errors;
  final List<Store> data;

  StoreModel({
    required this.success,
    required this.message,
    required this.errors,
    required this.data,
  });

  factory StoreModel.fromJson(Map<String, dynamic> json) {
    return StoreModel(
      success: json['success'],
      message: json['message'],
      errors: List<dynamic>.from(json['errors']),
      data: List<Store>.from(json['data'].map((store) => Store.fromJson(store))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'errors': errors,
      'data': data.map((store) => store.toJson()).toList(),
    };
  }
}

class Store {
  final int id;
  final String name;
  final String category;
   String? image;
  final String address;
  final String about;
  final String? phone;
  final String latitude;
  final String longitude;
   final double distance;
  final int favoritesCount;
  final List<Offer> offers;

  Store({
    required this.id,
    required this.name,
    required this.category,
     this.image,
    required this.address,
    required this.about,
    this.phone,
    required this.latitude,
    required this.longitude,
     required this.distance,
    required this.favoritesCount,
    required this.offers,
  });

  factory Store.fromJson(Map<String, dynamic> json) {
    return Store(
      id: json['id'],
      name: json['name'],
      category: json['category'],
      image: json['image'],
      address: json['address'],
      about: json['about'],
      phone: json['phone'],
      latitude: json['latitude'],
      longitude: json['longitude'],
       distance: json['distance'].toDouble(),
      favoritesCount: json['favorites_count'],
      offers: List<Offer>.from(json['offers'].map((offer) => Offer.fromJson(offer))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'category': category,
      'image': image,
      'address': address,
      'about': about,
      'phone': phone,
      'latitude': latitude,
      'longitude': longitude,
       'distance': distance,
      'favorites_count': favoritesCount,
      'offers': offers.map((offer) => offer.toJson()).toList(),
    };
  }
}

class Offer {
  final int id;
  final String name;
  final int storeId;
   String? image;
  final String address;
  final String about;
  final String latitude;
  final String longitude;
  final String startDate;
  final String endDate;
  final String createdAt;
  final String updatedAt;
  final String? deletedAt;

  Offer({
    required this.id,
    required this.name,
    required this.storeId,
     this.image,
    required this.address,
    required this.about,
    required this.latitude,
    required this.longitude,
    required this.startDate,
    required this.endDate,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });

  factory Offer.fromJson(Map<String, dynamic> json) {
    return Offer(
      id: json['id'],
      name: json['name'],
      storeId: json['store_id'],
      image: json['image'],
      address: json['address'],
      about: json['about'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      startDate: json['start_date'],
      endDate: json['end_date'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      deletedAt: json['deleted_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'store_id': storeId,
      'image': image,
      'address': address,
      'about': about,
      'latitude': latitude,
      'longitude': longitude,
      'start_date': startDate,
      'end_date': endDate,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'deleted_at': deletedAt,
    };
  }
}
