import 'package:flutter/material.dart';

import '../control/category_model.dart';
import '../data/data.dart';
import '../widget/custom_list_view_category.dart';
import '../widget/list_top_offer_addis_details_widget.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key, required this.list});

  final List list;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 35,
      ),
      body: SafeArea(
          child: Padding(
           padding: const EdgeInsets.symmetric(horizontal: 8.0),
           child: GridView.builder(
             padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*.1),
             physics:const NeverScrollableScrollPhysics(),
             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            childAspectRatio: 1/1.2
                     ),
                     itemCount: list.length,
                     itemBuilder: (c, i) {
            return InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (_)=>ListTopOfferAddisDetailsWidget(list: productList[i],)));
              },
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
                    bottom: 0,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(.6),
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(15),
                            topLeft: Radius.circular(15),
                          )),
                      alignment: Alignment.center,
                      width: 150,
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
            );
                     },
                   ),
      )),
    );
  }
}
