import 'package:flutter/material.dart';

import '../../../../core/resources/color_manger/color_manager.dart';
import '../../data/data.dart';
import '../widget/list_top_offer_addis_details_widget.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key, required this.list});

  final List list;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Category"),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1 / 1.2),
          itemCount: list.length,
          itemBuilder: (c, i) {
            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => ListTopOfferAddisDetailsWidget(
                              list: productList[i],
                            )));
              },
              child: SizedBox(
                width: MediaQuery.sizeOf(context).width/2.3,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(
                            list[i].image,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 1,
                      child: Container(
                        decoration: BoxDecoration(
                            color: ColorManager.whitGreen,
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(15),
                              topLeft: Radius.circular(15),
                            )),
                        alignment: Alignment.center,
                        width: MediaQuery.sizeOf(context).width/2.3,
                        padding: const EdgeInsets.all(4),
                        child: Text(
                          list[i].title,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      )),
    );
  }
}
