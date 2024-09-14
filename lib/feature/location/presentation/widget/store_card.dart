import 'package:flutter/material.dart';

import '../../data/model/store_model.dart';

class StoreCard extends StatelessWidget {
   final Store store;

  const StoreCard({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              // Store Image
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                child: Image.network(
                 store.imageUrl,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              // Favourite Icon
              Positioned(
                top: 10,
                right: 10,
                child: Icon(
                  store.isFavourite ? Icons.favorite : Icons.favorite_border,
                  color:store.isFavourite ? Colors.red : Colors.white,
                  size: 30,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
             store.name,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Distance
                Text(
                  'المسافة: ${store.distance}',
                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                ),
                // Offers
                Text(
                  'عروض: ${store.offers}',
                  style: const TextStyle(fontSize: 16, color: Colors.blue),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}