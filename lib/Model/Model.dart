import 'package:get/get_rx/src/rx_types/rx_types.dart';

class Product {
  RxString? name;
  RxString? image;
  RxInt? price;
  RxInt? unit;
  RxInt? total;
  RxBool? cart;

  Product(this.name, this.image, this.price, this.unit, this.total, this.cart);
}

List<Product> modal = [
  Product('Pineapple'.obs, 'Assets/Images/img.png'.obs, 50.obs, 1.obs, 50.obs,
      false.obs),
  Product('strawberry'.obs, 'Assets/Images/img_1.png'.obs, 5.obs, 1.obs, 5.obs,
      false.obs),
  Product('Banana'.obs, 'Assets/Images/img_2.png'.obs, 20.obs, 1.obs, 20.obs,
      false.obs),
  Product('Kivy'.obs, 'Assets/Images/img_3.png'.obs, 10.obs, 1.obs, 10.obs,
      false.obs),
  Product('Orange'.obs, 'Assets/Images/img_5.png'.obs, 30.obs, 1.obs, 10.obs,
      false.obs),
];
