class StoreModel {
  final bool success;
  final String message;
  final List<String> errors;
  final List<Store> data;
  final Meta meta;
  final Links links;


  StoreModel({
     required this.success,
    required this.message,
    required this.errors,
    required this.data,
    required this.meta,
    required this.links,
  });

  factory StoreModel.fromJson(Map<String, dynamic> json) {
    return StoreModel(
       success: json['success'],
      message: json['message'],
      errors: List<String>.from(json['errors']),
      data: List<Store>.from(json['data'].map((store) => Store.fromJson(store))),
      meta: Meta.fromJson(json['meta']),
      links: Links.fromJson(json['links']),
    );
  }

}

class Store {
  final int id;
  final String name;
  final int categoryId;
  final String? image;
  final String address;
  final String? about;
  final String? phone;
  final String latitude;
  final String longitude;
//  final String placeId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final String distance;
  final int favoritesCount;
  final List<Offer> offers;
  final Category category;

  Store({
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
    required this.distance,
    required this.favoritesCount,
    required this.offers,
    required this.category,
  });

  factory Store.fromJson(Map<String, dynamic> json) {
    return Store(
      id: json['id'],
      name: json['name'],
      categoryId: json['category_id'],
      image: json['image'],
      address: json['address'],
      about: json['about'],
      phone: json['phone'],
      latitude: json['latitude'],
      longitude: json['longitude'],
     // placeId: json['place_id'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      deletedAt: json['deleted_at'] != null ? DateTime.parse(json['deleted_at']) : null,
      distance: json['distance'],
      favoritesCount: json['favorites_count'],
      offers: List<Offer>.from(json['offers'].map((offer) => Offer.fromJson(offer))),
      category: Category.fromJson(json['category']),
    );
  }
}


 

class Offer {
  final int id;
  final String name;
  final int storeId;
  final String image;
  final String address;
  final String about;
  final String price;
  final String latitude;
  final String longitude;
  final DateTime startDate;
  final DateTime endDate;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;

  Offer({
    required this.id,
    required this.name,
    required this.storeId,
    required this.image,
    required this.address,
    required this.about,
    required this.price,
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
      price: json['price'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      startDate: DateTime.parse(json['start_date']),
      endDate: DateTime.parse(json['end_date']),
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      deletedAt: json['deleted_at'] != null ? DateTime.parse(json['deleted_at']) : null,
    );
  }
}

class Category {
  final int id;
  final String name;

  Category({
    required this.id,
    required this.name,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
    );
  }
}

class Meta {
  final int currentPage;
  final int totalCount;
  final int perPage;
  final int totalPages;
  final bool hasMorePages;

  Meta({
    required this.currentPage,
    required this.totalCount,
    required this.perPage,
    required this.totalPages,
    required this.hasMorePages,
  });

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      currentPage: json['current_page'],
      totalCount: json['total_count'],
      perPage: json['per_page'],
      totalPages: json['total_pages'],
      hasMorePages: json['has_more_pages'],
    );
  }
}

class Links {
  final String? nextPageUrl;
  final String? prevPageUrl;
  final String firstPageUrl;
  final String lastPageUrl;

  Links({
    this.nextPageUrl,
    this.prevPageUrl,
    required this.firstPageUrl,
    required this.lastPageUrl,
  });

  factory Links.fromJson(Map<String, dynamic> json) {
    return Links(
      nextPageUrl: json['next_page_url'],
      prevPageUrl: json['prev_page_url'],
      firstPageUrl: json['first_page_url'],
      lastPageUrl: json['last_page_url'],
    );
  }
}