class FavoriteStoresResponse {
  final bool success;
  final String message;
  final List<FavoriteStore> data;
  final Meta meta;
  final Links links;

  FavoriteStoresResponse({
    required this.success,
    required this.message,
    required this.data,
    required this.meta,
    required this.links,
  });

  factory FavoriteStoresResponse.fromJson(Map<String, dynamic> json) {
    return FavoriteStoresResponse(
      success: json['success'],
      message: json['message'],
      data: List<FavoriteStore>.from(json['data'].map((store) => FavoriteStore.fromJson(store))),
      meta: Meta.fromJson(json['meta']),
      links: Links.fromJson(json['links']),
    );
  }
}

class FavoriteStore {
  final int id;
  final String name;
  final int categoryId;
  final String? image;
  final String address;
  final String? about;
  final String phone;
  final String latitude;
  final String longitude;
  // final String placeId;
  final DateTime createdAt;
  final DateTime updatedAt;

  FavoriteStore({
    required this.id,
    required this.name,
    required this.categoryId,
    this.image,
    required this.address,
    this.about,
    required this.phone,
    required this.latitude,
    required this.longitude,
    // required this.placeId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory FavoriteStore.fromJson(Map<String, dynamic> json) {
    return FavoriteStore(
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
