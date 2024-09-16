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
    distance = json['distance'];
    favoritesCount = json['favorites_count'];
    if (json['offers'] != null) {
      offers = <Offers>[];
      json['offers'].forEach((v) {
        offers!.add(new Offers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['category'] = this.category;
    data['image'] = this.image;
    data['address'] = this.address;
    data['about'] = this.about;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['distance'] = this.distance;
    data['favorites_count'] = this.favoritesCount;
    if (this.offers != null) {
      data['offers'] = this.offers!.map((v) => v.toJson()).toList();
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
    data['id'] = this.id;
    data['name'] = this.name;
    data['store_id'] = this.storeId;
    data['image'] = this.image;
    data['address'] = this.address;
    data['about'] = this.about;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}