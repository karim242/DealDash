import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location/location.dart';

import '../../../../core/resources/color_manger/color_manager.dart';
import '../../data/model/store_model.dart';
import '../cubit/store_cubit/store_cubit.dart';
import '../cubit/store_cubit/store_state.dart';
import '../widget/store_card.dart';

class StoreView extends StatelessWidget {
  final LocationData currentLocation;
  const StoreView({super.key, required this.currentLocation});

  // final List<StoreStaticModel> stores = const [
  //   StoreStaticModel(
  //     name: 'Store 1',
  //     distance: '3.2 دقيقه',
  //     offers: 5,
  //     imageUrl: 'assets/images/store1.webp',
  //     isFavourite: false,
  //   ),
  //   StoreStaticModel(
  //     name: 'Store 2',
  //     distance: '4.1 دقيقه',
  //     offers: 3,
  //     imageUrl: 'assets/images/store2.webp',
  //     isFavourite: true,
  //   ),
  //   StoreStaticModel(
  //     name: 'Store 3',
  //     distance: '1.5 دقيقه',
  //     offers: 8,
  //     imageUrl: 'assets/images/store3.webp',
  //     isFavourite: false,
  //   ),
  //   StoreStaticModel(
  //     name: 'Store 4',
  //     distance: '1.5 دقيقه',
  //     offers: 10,
  //     imageUrl: 'assets/images/store4.webp',
  //     isFavourite: false,
  //   ),
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: ColorManager.whitGreen,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: ColorManager.yellow,
        title: Text('Nearby Stores',style: TextStyle(fontWeight: FontWeight.bold, color: ColorManager.primary),),
      ),
      body: BlocBuilder<StoreCubit, StoreState>(
        builder: (context, state) {
          if (state is StoreLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is StoreError) {
            return Center(child: Text(state.message));
          } else if (state is StoreLoaded) {
            return ListView.builder(
              itemCount: state.stores.length,
              itemBuilder: (context, index) {
                final store = state.stores[index];
                return StoreCard(store: store);
              },
            );
          } else {
            return Center(child: Text('No stores found'));
          }
        },
      ),
    );
  }
}
