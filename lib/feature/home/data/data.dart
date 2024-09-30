import '../../../core/resources/image_manger/image_manger.dart';
import '../../../core/resources/strings_manger/strings_manager.dart';
import '../presentation/control/category_static_model.dart';
import '../presentation/control/product_model.dart';

//لازم يكون عدد لايست الكاتوجرى مساوى لعدد ليست المنتجات
List<String> imageListTopAddis = [
  ImageManger.addis,
  ImageManger.imageValue,
  ImageManger.imageMold,

];
List<CategoryStaticModel> listCategory = [
  CategoryStaticModel(
    title:AppStrings.superMarket,
    image: ImageManger.imageSm1,
  ),
  CategoryStaticModel(
    title: AppStrings.clothes,
    image: ImageManger.imageCloth,
  ),
  CategoryStaticModel(
    title: AppStrings.deviceHome,
    image: ImageManger.imageHomeDevice,
  ),
  CategoryStaticModel(
    title: AppStrings.mobile,
    image: ImageManger.imageMobil,
  ),

];
//لازم يكون عدد لايست الكاتوجرى مساوى لعدد ليست المنتجات
List<List<ProductModel>> productList=[superMarketList,clothList,deviceHomeList,mobileList];

List<ProductModel> superMarketList=[
  ProductModel(imagePath:ImageManger.market1,
      title:"Pack of 2 Pril Liquid Dishwasher Detergent Lemon 1 Liter + Dish washing Loofah" ,
      rate:"4.0" ,oldPrice: "192.00",newPrice: "182"),
  ProductModel(imagePath:ImageManger.market2,
      title:"Persil Power Gel Liquid With Deep Clean Lavender 1 L Equals 2 kg Powder" ,
      rate:"3.5" ,oldPrice: "259.00",newPrice: "252.00"),
  ProductModel(imagePath:ImageManger.market3,
      title:"Sweet&Slim 100 Sachets STEVIA" ,
      rate:"2.5" ,oldPrice: "170",newPrice: "150"),
  ProductModel(imagePath:ImageManger.market4,
      title:"Kahve Dunyasi Caffe Latte Instant Coffee 15gm - 1 Sachet" ,
      rate:"5.0" ,oldPrice: "70",newPrice: "50"),
  ProductModel(imagePath:ImageManger.market5,
      title:"Sugar 1kg" ,
      rate:"4.2" ,oldPrice: "50",newPrice: "35"),
  ProductModel(imagePath:ImageManger.market6,
      title:"Pasta Fettucini 400grams" ,
      rate:"4.5" ,oldPrice: "25",newPrice: "21.5"),
  ProductModel(imagePath:ImageManger.market7,
      title:"Espresso Coffee Capsules Dark Blend - 10 Capsules" ,
      rate:"4.0" ,oldPrice: "195.00 ",newPrice: "175.00"),
  ProductModel(imagePath:ImageManger.market8,
      title:"Instant coffee 3*1-180gm" ,
      rate:"3.7" ,oldPrice: "150.00 ",newPrice: "140.00 "),

];
List<ProductModel> clothList=[
  ProductModel(imagePath:ImageManger.man1,
      title:"Man Comfort Fit Crew Neck Short Sleeve Knitted T-Shirt" ,
      rate:"4.5" ,oldPrice: "600",newPrice: "550"),
  ProductModel(imagePath:ImageManger.man2 ,
      title:"AE Cozy Cabin Flannel" ,
      rate:"2.5" ,oldPrice:"2500",newPrice: "2300"),
  ProductModel(imagePath:ImageManger.man3 ,
      title:"Man Smart Casual Slim Fit Polo Neck Short Sleeve Knitted Polo T-Shirt" ,
      rate:"3.5" ,oldPrice:"3000",newPrice:"2850" ),
  ProductModel(imagePath:ImageManger.man4 ,
      title:"Man Regular Fit Resort Neck Short Sleeve Smart Casual Knitted Polo T-Shirt" ,
      rate:"4.5" ,oldPrice: "1000",newPrice:"950" ),
  ProductModel(imagePath:ImageManger.man5,
      title:"Man Smart Casual Slim Fit Polo Neck Woven Long Sleeve Shirt" ,
      rate:"4.2" ,oldPrice:"3000",newPrice:"2700" ),
  ProductModel(imagePath:ImageManger.man6,
      title:"Man Smart Casual Slim Fit Polo Neck Short Sleeve Knitted Polo T-Shirt" ,
      rate:"3.1" ,oldPrice:"600",newPrice: "500"),
  ProductModel(imagePath:ImageManger.man7 ,
      title:"Man Regular Fit Resort Neck Short Sleeve Smart Casual Knitted Polo T-Shirt" ,
      rate:"2.5" ,oldPrice: "700",newPrice: "650"),
  ProductModel(imagePath:ImageManger.man8 ,
      title:"Man Regular Fit Resort Neck Short Sleeve Smart Casual Knitted Polo T-Shirt" ,
      rate:"3.0" ,oldPrice: "600",newPrice: "450"),
];


List<ProductModel> mobileList=[
  ProductModel(imagePath:ImageManger.mob1 ,
      title:"Girasole G30 - 2.4-inch Dual SIM Mobile Phone - Red, Earphone Free , 12 Months Warranty" ,
      rate:"4.9" ,oldPrice: "700",newPrice: " 639"),
  ProductModel(imagePath:ImageManger.mob2 ,
      title:"Galaxy A15 Dual Sim Blue Black 8GB RAM 256GB 4G - Middle East Version" ,
      rate:"4.5" ,oldPrice: "12999",newPrice: "8859"),
  ProductModel(imagePath:ImageManger.mob3 ,
      title:"Note 50 Dual SIM Midnight Black 4GB RAM 128GB 4G - International Version" ,
      rate:"4.5" ,oldPrice: "7957.40 ",newPrice: "4957.40"),
  ProductModel(imagePath:ImageManger.mob4 ,
      title:"Girasole G30 - 2.4-inch Dual SIM Mobile Phone - Red, Earphone Free , 12 Months Warranty" ,
      rate:"4.9" ,oldPrice: "700",newPrice: " 639"),
  ProductModel(imagePath:ImageManger.mob5 ,
      title:"Galaxy A15 Dual Sim Blue Black 8GB RAM 256GB 4G - Middle East Version" ,
      rate:"4.5" ,oldPrice: "12999",newPrice: "8859"),
  ProductModel(imagePath:ImageManger.mob6 ,
      title:"Note 50 Dual SIM Midnight Black 4GB RAM 128GB 4G - International Version" ,
      rate:"4.5" ,oldPrice: "7957.40 ",newPrice: "4957.40"),
];
List<ProductModel> deviceHomeList=[
  ProductModel(imagePath:ImageManger.elc1 ,
      title: "TV Stand with Media Shelf - Corner Book Shelf, Wooden Storage for Living Room 140x30x50",
      rate:"4.9" ,oldPrice: "2700.00 ",newPrice: "2426.00 "),
  ProductModel(imagePath:ImageManger.elc2 ,
      title:"Silicone Case Cover for LG AN-MR21GA Magic Remote, Shockproof Protective Cover for LG Smart TV Remote 2021, Standing Design, Skin-Friendly, Washable, Anti-Lost with Loop (Black)" ,
      rate:"4.5" ,oldPrice: "400.00",newPrice: "300.00 "),
  ProductModel(imagePath:ImageManger.elc3 ,
      title:"Full Motion TV Wall Mount For Most 32-60 Inch Load 36 Kg P5" ,
      rate:"4.5" ,oldPrice: "7957.40 ",newPrice: "4957.40"),
  ProductModel(imagePath:ImageManger.elc4 ,
      title:"Girasole G30 - 2.4-inch Dual SIM Mobile Phone - Red, Earphone Free , 12 Months Warranty" ,
      rate:"4.9" ,oldPrice: "1199.00",newPrice: "144.00 "),
  ProductModel(imagePath:ImageManger.elc5 ,
      title:"24 Inch F24T350FHM 75hz 5ms Full HD IPS Monitor 24inch Black" ,
      rate:"4.5" ,oldPrice: "4299.00",newPrice: "3999.00 "),
  ProductModel(imagePath:ImageManger.elc6 ,
      title:"Wall Mounted TV Unit Cabinet with TV Stand Unit Wall Shelf for Living Room (White)" ,
      rate:"4.5" ,oldPrice: "7957.40 ",newPrice: "4957.40"),
];


List<ProductModel> favList=[];
