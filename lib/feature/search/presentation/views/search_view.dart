//search view

import 'package:dealdash/core/widget/cart_offer_item.dart';
import 'package:dealdash/feature/search/logic/search_cubit.dart';
import 'package:dealdash/feature/search/logic/search_state.dart';
import 'package:dealdash/feature/search/presentation/views/search_card_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Result'),
      ),
      body: BlocBuilder<SearchCubit, SearchState>(
        builder: (context, state) {
        
          if (state is SearchLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is SearchSuccess) {
            if (state.offer.isEmpty) {
              return const Center(
                child: Text("No offers found"),
              );
            }
            print("Successssssssssssssss");
             final offer = state.offer[1];
                     // return CardOfferItem(offerData: offer);
            return CustomScrollView(
              slivers: [
                SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 6,
                    mainAxisSpacing: 12,
                    childAspectRatio: 1 / 1.3,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      final offer = state.offer[index];
                      return SerachCardItem(offerData: offer);
                    },
                    childCount: state.offer.length, // عدد العروض
                  ),
                ),
              ],
            );
          } else if (state is SearchFailure) {
            return Center(
              child: Text(state.errorMessage),
            );
          } else {
            return const Center(
              child: Text('Unknown error'),
            );
          }
        },
      ),
    );
  }
}
