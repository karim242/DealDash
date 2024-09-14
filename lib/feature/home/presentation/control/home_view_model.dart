import '../../../../core/resources/image_manger/image_manger.dart';
import 'category_model.dart';

class HomeViewModel{

 static List<CategoryModel> listCategory = [
    CategoryModel(
      title: "سوبر ماركت",
      image: ImageManger.imageSm1,
    ),
    CategoryModel(
      title: "ملابس",
      image: ImageManger.imageCloth,
    ),
    CategoryModel(
      title: "أجهزة كهربائية",
      image: ImageManger.imageHomeDevice,
    ),
    CategoryModel(
      title: "موبيلات",
      image: ImageManger.imageMobil,
    ),

  ];
}