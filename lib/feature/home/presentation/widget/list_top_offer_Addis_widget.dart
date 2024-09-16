import 'package:flutter/material.dart';
import '../data/data.dart';
import 'item_page_view_addis_widget.dart';
import 'list_top_offer_addis_details_widget.dart';

class ListTopOfferAddisWidget extends StatelessWidget {
  ListTopOfferAddisWidget({super.key});


  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: 150,
      child: ListView.builder(
        itemCount: imageListTopAddis.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return ItemListTopPageViewAddisWidget(
            imagePath: imageListTopAddis[index],
            function: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ListTopOfferAddisDetailsWidget(
                        list: mobileList,
                          )));
            },
          );
        },
      ),
    );
  }
}

