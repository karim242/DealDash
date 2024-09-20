import 'package:dealdash/core/resources/color_manger/color_manager.dart';
import 'package:flutter/material.dart';

import '../../data/model/store_model.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/resources/routes_manger/routes_manager.dart';

class StoreCard extends StatelessWidget {
  final StoreModel store;

  const StoreCard({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(Routes.aboutStoreRoute, extra: store);
      },
      child: Card(
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
                    store.image?? 'https://media.istockphoto.com/id/681622484/photo/concrete-wall-shiny-smooth-backgrounds-white-textured.jpg?s=2048x2048&w=is&k=20&c=87J5-OznIqEEKD923thUgWZBNIiAD4oDVAmHSQYLr1o=',
                     height: 200,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                ),
                // Favourite Icon
                Positioned(
                  top: 10,
                  right: 10,
                  child: Icon(
                    store.favoritesCount == 1
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color:
                        store.favoritesCount == 1 ? Colors.red : Colors.white,
                    size: 30,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                store.name!,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: ColorManager.primary),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Distance
                  Text(
                  //  ${store.distance!.toStringAsFixed(1)}
                    'dis:  2',
                    style: TextStyle(fontSize: 16, color: ColorManager.yellow),
                  ),
                  // Offers
                  Text(
                    'Offer: ${store.offers!.length}',
                    style: TextStyle(fontSize: 16, color: ColorManager.red),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
