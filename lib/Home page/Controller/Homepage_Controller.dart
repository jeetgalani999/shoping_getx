import 'package:get/get.dart';

class HomepageController extends GetxController {
  List<Modal> modal = [
    Modal('Pineapple'.obs, 'Assets/Images/img.png'.obs, 50.obs, 0.obs, 50.obs,
        false.obs),
    Modal('strawberry'.obs, 'Assets/Images/img_1.png'.obs, 15.obs, 0.obs, 5.obs,
        false.obs),
    Modal('Banana'.obs, 'Assets/Images/img_2.png'.obs, 20.obs, 0.obs, 20.obs,
        false.obs),
    Modal('Kivy'.obs, 'Assets/Images/img_3.png'.obs, 10.obs, 0.obs, 10.obs,
        false.obs),
    Modal('Orange'.obs, 'Assets/Images/img_5.png'.obs, 30.obs, 0.obs, 10.obs,
        false.obs),
    Modal('Apple'.obs, 'Assets/Images/img_6.png'.obs, 50.obs, 0.obs, 40.obs,
        false.obs),
  ];
  List<Modal> cart = [];

  addtocart(Modal modellist) {
    modellist.cart = true.obs;
    update();
    unitcount(modellist.name);
    print("Here add cart ");
    print(modellist.cart);
  }

  increment(unit) {
    unit++;
    update();
  }

  unitcount(var name) {
    int unitcount = 0;

    for (int i = 0; i < modal.length; i++) {
      if (name == modal[i].name) {
        unitcount = modal[i].unit!.value;
      }
    }
    print(unitcount);
    return unitcount;
  }

  remove(var name) {
    int unitcount = 0;

    for (int i = 0; i < modal.length; i++) {
      if (name == modal[i].name) {
        modal[i].cart = false.obs;
        unitcount = modal[i].unit!.value;
      }
    }
    print(unitcount);
    return unitcount;
  }

  decrement(Modal unit) {
    if (unit.unit!.value == 0 || unit.unit!.value <= 1) {
      unit.cart!.value = false;
    } else {
      unit.unit!.value--;
    }
    update();
  }
}

class Modal {
  RxString? name;
  RxString? image;
  RxInt? price;
  RxInt? unit;
  RxInt? total;
  RxBool? cart;

  Modal(this.name, this.image, this.price, this.unit, this.total, this.cart);
}

class Cartitemmodal {
  String? name;
  String? image;
  int? price;
  RxInt? unit;
  RxInt? total;
  RxBool? cart;

  Cartitemmodal(
      this.name, this.image, this.price, this.unit, this.total, this.cart);
}
