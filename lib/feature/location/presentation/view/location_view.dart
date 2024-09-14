import 'package:dealdash/core/resources/color_manger/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'store_view.dart';

class LocationView extends StatefulWidget {
  final LocationData currentLocation;

  const LocationView({super.key, required this.currentLocation});

  @override
  State<LocationView> createState() => _LocationViewState();
}

class _LocationViewState extends State<LocationView> {
  late LatLng userLocation;

  @override
  void initState() {
    super.initState();
    userLocation = LatLng(
        widget.currentLocation.latitude!, widget.currentLocation.longitude!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: GoogleMap(
                    initialCameraPosition: CameraPosition(
                      target: userLocation,
                      zoom: 14.0,
                    ),
                    markers: {
                      Marker(
                        markerId: MarkerId('currentLocation'),
                        position: userLocation,
                      ),
                    },
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 30,
              left: 20,
              child: Container(
                height: 60, // حجم أكبر للزر العائم
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
                        builder: (context) =>
                            StoreView(currentLocation: widget.currentLocation),
                      ),
                    );
                  },
                  icon: Icon(Icons.storefront_sharp),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
