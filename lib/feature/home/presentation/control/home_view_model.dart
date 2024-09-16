import 'package:dealdash/core/resources/strings_manger/strings_manager.dart';

import '../../../../core/resources/image_manger/image_manger.dart';
import 'category_model.dart';

class HomeViewModel{

 static List<CategoryModel> listCategory = [
    CategoryModel(
      title:AppStrings.superMarket,
      image: ImageManger.imageSm1,
    ),
    CategoryModel(
      title: AppStrings.clothes,
      image: ImageManger.imageCloth,
    ),
    CategoryModel(
      title: AppStrings.deviceHome,
      image: ImageManger.imageHomeDevice,
    ),
    CategoryModel(
      title: AppStrings.mobile,
      image: ImageManger.imageMobil,
    ),

  ];
}