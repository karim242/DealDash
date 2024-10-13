import 'package:dealdash/core/resources/color_manger/color_manager.dart';
import 'package:dealdash/core/resources/strings_manger/strings_manager.dart';
import 'package:dealdash/feature/home/presentation/control/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductStaticDetails extends StatelessWidget {
  const ProductStaticDetails({super.key, required this.productModel});

  final ProductModel? productModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:  Text(productModel?.title??' '),
      ),
      body: ListView(
        
        children: [
          SizedBox(height: 50.h),
          Card(
            margin: const EdgeInsets.symmetric(horizontal:15).r,
            elevation: 2,
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //image
                    SizedBox(
                      height:250.h,
                      width: double.infinity,
                      child: Image.asset(
                        productModel?.imagePath ?? '',
                        fit: BoxFit.fill,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    //title
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0).r,
                      child: Text(
                        // maxLines: 1,
                        // overflow: TextOverflow.ellipsis,
                        productModel?.title ?? AppStrings.appelMob,
                        style:  TextStyle(
                          fontSize: 24.sp,
                        ),
                      ),
                    ),
                     SizedBox(height: 25.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FittedBox(
                            fit: BoxFit.scaleDown,
                            child:  Padding(
                              padding: const EdgeInsets.only(left: 8.0).r,
                              child: Text(
                                "${productModel!.newPrice} E ",
                                style: TextStyle(
                                  fontSize: 24.sp,
                                  color: ColorManager.primary,
                                ),
                              ),
                            )),
                       Text(
                         "30% Off",
                         style: TextStyle(

                           fontSize: 24.sp,
                           fontWeight: FontWeight.w400,
                           color: ColorManager.red,
                         ),
                       ),
                        const SizedBox(),
                      ],
                    ),
                  ],
                ),

                Positioned(
                  top: 5,
                  right: 5,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: ColorManager.whitGreen,
                    ),
                    child: Row(
                      children: [
                        Text(
                          "3.5",
                          style: TextStyle(
                            color: ColorManager.primary,
                          ),
                        ),
                        Icon(
                          Icons.star,
                          color: ColorManager.yellow,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}