import 'package:dealdash/core/resources/color_manger/color_manager.dart';
import 'package:dealdash/core/resources/routes_manger/routes_manager.dart';
import 'package:dealdash/feature/favourite/data/model/favourite_model.dart';
import 'package:dealdash/feature/favourite/logic/favourite_cubit.dart';
import 'package:dealdash/feature/favourite/logic/favourite_state.dart';
import 'package:dealdash/feature/location/presentation/widget/store_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/check_connect_internet/cubit/connect_internet_cubit.dart';
import '../../../../core/check_connect_internet/cubit/connect_internet_state.dart';
import '../../../../core/widget/ui_not_connectinternet_widget.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<FavouriteCubit>().getFavoriteStores();
    return BlocBuilder<ConnectInternetCubit, ConnectInternetState>(
        builder: (context, state) {
      if (state is NotConnectedState) {
        return const UINotConnectInterNetWidget();
      }
      return BlocBuilder<FavouriteCubit, FavouriteState>(
        builder: (context, state) {
          if (state is FavouriteLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is FavouriteSuccess) {
            return ListView.builder(
              itemCount: state.response.data.length,
              itemBuilder: (context, index) {
                final store = state.response.data[index];
                return FavouriteStoreCard(store: store);
              },
            );
          } else if (state is FavouriteFailure) {
            return Center(
                child: Text('No Favourite yet: ${state.errorMessage}'));
          } else {
            return Container(); // الحالة الأولية
          }
        },
      );
    });
  }
}

class FavouriteStoreCard extends StatelessWidget {
  final FavoriteStore store;

  const FavouriteStoreCard({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(Routes.favouriteStore, extra: store);
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
                    store.image ??
                        'https://media.istockphoto.com/id/681622484/photo/concrete-wall-shiny-smooth-backgrounds-white-textured.jpg?s=2048x2048&w=is&k=20&c=87J5-OznIqEEKD923thUgWZBNIiAD4oDVAmHSQYLr1o=',
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                ),
                // Favourite Icon
                const Positioned(
                  top: 10,
                  right: 10,
                  child: Icon(
                    Icons.favorite,
                    color: Colors.red,
                    size: 30,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                store.name,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: ColorManager.primary),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                //  ${store.distance!.toStringAsFixed(1)}
                '${store.address}  ',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 16, color: ColorManager.yellow),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
