import '../../../../core/resources/image_manger/image_manger.dart';
import '../control/product_model.dart';

List<String> imageListTopAddis = [
  ImageManger.addis,
  ImageManger.imageValue,
  ImageManger.imageMold,

];

List<List<ProductModel>> productList=[mobileList,clothList,mobileList,mobileList];

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
