import 'package:flutter/material.dart';
import 'package:location/location.dart';

import '../../data/model/store_model.dart';
import '../widget/store_card.dart';

class StoreView extends StatelessWidget {
  final LocationData currentLocation;
  const StoreView({super.key, required this.currentLocation});

  final List<Store> stores = const [
    Store(
      name: 'Store 1',
      distance: '3.2 كم',
      offers: 5,
      imageUrl: 'https://via.placeholder.com/400',
      isFavourite: false,
    ),
    Store(
      name: 'Store 2',
      distance: '4.1 كم',
      offers: 3,
      imageUrl: 'https://via.placeholder.com/400',
      isFavourite: true,
    ),
    Store(
      name: 'Store 3',
      distance: '1.5 كم',
      offers: 8,
      imageUrl: 'https://via.placeholder.com/400',
      isFavourite: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Location:\nLat: ${currentLocation.latitude}, Long: ${currentLocation.longitude}',
        ),
      ),
      body: ListView.builder(
        itemCount: stores.length,
        itemBuilder: (context, index) {
          final store = stores[index];
          return StoreCard(
            store: store,
          );
        },
      ),
    );
  }
}
