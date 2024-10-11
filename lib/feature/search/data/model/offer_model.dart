class SearchResponse {
  final List<Offer> offers;
  final Meta meta;

  SearchResponse({
    required this.offers,
    required this.meta,
  });

  factory SearchResponse.fromJson(Map<String, dynamic> json) {
    // تحويل `data` إلى قائمة من `Offer`
    final List data = json['data'];
    final List<Offer> offers = data.map((item) => Offer.fromJson(item as Map<String, dynamic>)).toList();

    return SearchResponse(
      offers: offers,
      meta: Meta.fromJson(json['meta']),
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
