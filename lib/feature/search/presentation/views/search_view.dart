//search view

import 'package:dealdash/core/widget/cart_offer_item.dart';
import 'package:dealdash/feature/search/logic/search_cubit.dart';
import 'package:dealdash/feature/search/logic/search_state.dart';
import 'package:dealdash/feature/search/presentation/views/search_card_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key,}) : super(key: key);
  @override


 
  Widget build(BuildContext context) {
   //  context.read<SearchCubit>().searchForOffer("Desire");
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Result'),
      ),
      body: BlocConsumer<SearchCubit, SearchState>(
        listener: (context, state) {
        },
        builder: (context, state) {
           if (state is SearchSuccess) {
            if (state.searchResponse.offers.isEmpty) {
              return const Center(
                child: Text("No offers found"),
              );
            }

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
                      final offer = state.searchResponse.offers[index];
                      return SerachCardItem(offerData: offer); // عرض كل عرض باستخدام SerachCardItem
                    },
                    childCount: state.searchResponse.offers.length, // عدد العروض
                  ),
                ),
              ],
            );
          } else if (state is SearchFailure) {
            return Center(
              child: Text(state.errorMessage),
            );
          }  else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
