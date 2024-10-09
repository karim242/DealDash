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
