import 'package:dealdash/core/resources/color_manger/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import '../../../../core/services/service_locator.dart';
import '../../data/model/places_model.dart';
import '../cubit/places_cubit/places_cubit.dart';
import '../cubit/places_cubit/places_state.dart';
import '../cubit/store_cubit/store_cubit.dart';
import 'stores_view.dart';

class LocationView extends StatefulWidget {
  final LocationData currentLocation;

  const LocationView({super.key, required this.currentLocation});

  @override
  State<LocationView> createState() => _LocationViewState();
}

class _LocationViewState extends State<LocationView> {
  late LatLng userLocation;
  Set<Marker> markers = {}; // Set لحفظ الـ Markers

  @override
  void initState() {
    super.initState();
    userLocation = LatLng(
      widget.currentLocation.latitude!,
      widget.currentLocation.longitude!,
    );

    // استدعاء PlacesCubit لجلب المحلات القريبة
    context.read<PlacesCubit>().fetchNearbyPlaces(
          widget.currentLocation.latitude!,
          widget.currentLocation.longitude!,
        );
  }

  // تحديث الـ Markers بناءً على الأماكن القادمة من PlacesCubit
   void _updateMarkers(List<Place> places) {
    final newMarkers = places.map((place) {
      return Marker(
        markerId: MarkerId("${place.lat},${place.lng}"), // معرف فريد لكل Marker
        position: LatLng(place.lat, place.lng), // إحداثيات المكان
        infoWindow: InfoWindow(title: place.name), // نافذة معلومات
      );
    }).toSet();

    // يتم تحديث markers بعد اكتمال بناء الواجهة
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        markers = newMarkers; // تحديث قائمة الـ Markers
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // print("${widget.currentLocation.latitude}, ${widget.currentLocation.longitude}");
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<PlacesCubit, PlacesState>(
          builder: (context, state) {
            if (state is PlacesLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is PlacesLoaded) {
              // تحديث Markers عند تحميل الأماكن
              _updateMarkers(state.places);

              return Stack(
                children: [
                  GoogleMap(
                    initialCameraPosition: CameraPosition(
                      target: userLocation,
                      zoom: 16.0,
                    ),
                    markers: markers, // إضافة الـ Markers للخريطة
                    myLocationEnabled: true,
                  ),
                  Positioned(
                    bottom: 30,
                    left: 20,
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: ColorManager.yellow,
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      padding: const EdgeInsets.all(8),
                      child: IconButton(
                        color: ColorManager.primary,
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => BlocProvider(
                                create: (_) => sl<StoreCubit>()
                                  ..fetchNearbyStores(
                                      widget.currentLocation.latitude,
                                      widget.currentLocation.longitude),
                                child: StoreView(
                                    currentLocation: widget.currentLocation),
                              ),
                            ),
                          );
                        },
                        icon: Icon(Icons.storefront_sharp),
                      ),
                    ),
                  ),
                ],
              );
            } else if (state is PlacesError) {
              return Center(child: Text(state.message));
            }

            return Center(child: Text('No data available'));
          },
        ),
      ),
    );
  }
}
