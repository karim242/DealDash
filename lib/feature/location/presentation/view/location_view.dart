import 'package:dealdash/core/resources/color_manger/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import '../../../../core/services/service_locator.dart';
import '../../data/model/store_model.dart';
import '../cubit/store_cubit/store_cubit.dart';
import '../cubit/store_cubit/store_state.dart';
import 'stores_view.dart';

class LocationView extends StatefulWidget {
  final LocationData currentLocation;

  const LocationView({super.key, required this.currentLocation});

  @override
  State<LocationView> createState() => _LocationViewState();
}

class _LocationViewState extends State<LocationView> {
  late LatLng userLocation;
  Set<Marker> markers = {}; // لتخزين الـ Markers

  @override
  void initState() {
    super.initState();
    userLocation = LatLng(
      widget.currentLocation.latitude!,
      widget.currentLocation.longitude!,
    );

    context.read<StoreCubit>().fetchNearbyStores(
          widget.currentLocation.latitude!,
          widget.currentLocation.longitude!,
        );
  }

  void _updateStoreMarkers(List<Store> stores) {
    final newMarkers = stores.map((store) {
      return Marker(
        markerId: MarkerId("${store.latitude},${store.longitude}"),
        position: LatLng(double.parse(store.latitude), double.parse(store.longitude)),
        infoWindow: InfoWindow(title: store.name), // عرض اسم المتجر في النافذة
      );
    }).toSet();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        markers.addAll(newMarkers); 
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<StoreCubit, StoreState>(
          builder: (context, state) {
            if (state is StoreLoading) {
              return Center(child: CircularProgressIndicator()); // إظهار مؤشر تحميل
            } else if (state is StoreLoaded) {
              // تحديث Markers عند تحميل المتاجر
              _updateStoreMarkers(state.stores);

              return GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: userLocation,
                  zoom: 16.0,
                ),
                markers: markers, // عرض جميع الـ Markers
                myLocationEnabled: true,
              );
            } else if (state is StoreError) {
              return Center(child: Text(state.message)); // عرض رسالة الخطأ
            }

            return Center(child: Text('No data available')); // في حال عدم وجود بيانات
          },
        ),
      ),
    );
  }
}
