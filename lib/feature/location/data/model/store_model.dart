class StoreStaticModel {
  final String name;
  final String distance;
  final int offers;
  final String imageUrl;
  final bool isFavourite;

  const StoreStaticModel({
    required this.name,
    required this.distance,
    required this.offers,
    required this.imageUrl,
    required this.isFavourite,
  });
}

class StoreModel {
  int? id;
  String? name;
  String? category;
  String? image;
  String? address;
  String? about;
  String? latitude;
  String? longitude;
  double? distance;
  int? favoritesCount;
  List<Offers>? offers;

  StoreModel(
      {this.id,
      this.name,
      this.category,
      this.image,
      this.address,
      this.about,
      this.latitude,
      this.longitude,
      this.distance,
      this.favoritesCount,
      this.offers});

  StoreModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    category = json['category'];
    image = json['image'];
    address = json['address'];
    about = json['about'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    //distance = json['distance'].toInt;
    favoritesCount = json['favorites_count'];
    if (json['offers'] != null) {
      offers = <Offers>[];
      json['offers'].forEach((v) {
        offers!.add(new Offers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['category'] = category;
    data['image'] = image;
    data['address'] = address;
    data['about'] = about;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['distance'] = distance;
    data['favorites_count'] = favoritesCount;
    if (offers != null) {
      data['offers'] = offers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Offers {
  int? id;
  String? name;
  int? storeId;
  String? image;
  String? address;
  String? about;
  String? latitude;
  String? longitude;
  String? startDate;
  String? endDate;
  String? createdAt;
  String? updatedAt;

  Offers(
      {this.id,
      this.name,
      this.storeId,
      this.image,
      this.address,
      this.about,
      this.latitude,
      this.longitude,
      this.startDate,
      this.endDate,
      this.createdAt,
      this.updatedAt,
      });

  Offers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    storeId = json['store_id'];
    image = json['image'];
    address = json['address'];
    about = json['about'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['store_id'] = storeId;
    data['image'] = image;
    data['address'] = address;
    data['about'] = about;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}