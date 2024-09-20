class Place {
  final double lat;
  final double lng;
  final String name;

  Place( {required this.lat, required this.lng,required this.name,});

  // Factory method to create Place from JSON
  factory Place.fromJson(Map<String, dynamic> json) {
    return Place(
      lat: json['geometry']['location']['lat'],
      lng: json['geometry']['location']['lng'],
       name:json['name'],
    );
  }
}
