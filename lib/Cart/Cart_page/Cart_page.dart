import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoping_getx/Home%20page/Controller/Homepage_Controller.dart';

class CartPage extends StatelessWidget {
  static const routeName = '/CartPage';

  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart_page = Get.find<HomepageController>();
    return GetBuilder(
      init: HomepageController(),
      builder: (GetxController controller) {
        return Scaffold(
          appBar: AppBar(
              title:
                  const Text('My Cart', style: TextStyle(color: Colors.white)),
              centerTitle: true,
              backgroundColor: Colors.deepPurple),
          body: ListView.separated(
              itemBuilder: (context, index) {
                return SizedBox(
                  height: 130,
                  child: Card(
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                    image: AssetImage(
                                        cart_page.cart[index].image!.value),
                                    fit: BoxFit.fill)),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 160,
                                child: Text(cart_page.cart[index].name!.value,
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500)),
                              ),
                              Text(
                                '\$${cart_page.cart[index].total.toString()}.00',
                                style: const TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w400),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  cart_page.cart[index].unit!.value++;
                                  cart_page.refresh();
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    shape: BoxShape.circle,
                                  ),
                                  height: 40,
                                  width: 40,
                                  child:
                                      const Icon(Icons.add, color: Colors.grey),
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(cart_page.cart[index].unit.toString(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20,
                                      color: Colors.grey)),
                              const SizedBox(
                                width: 5,
                              ),
                              GestureDetector(
                                onTap: () {
                                  if (cart_page.cart[index].unit == 0 ||
                                      cart_page.cart[index].unit!.value < 0) {
                                    cart_page.cart.removeAt(index);
                                    // cart_page
                                    //     .remove(cart_page.modal[index].name);
                                  } else {
                                    cart_page.cart[index].unit!.value--;
                                  }
                                  cart_page.update();
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    shape: BoxShape.circle,
                                  ),
                                  height: 40,
                                  width: 40,
                                  child: const Icon(Icons.remove,
                                      color: Colors.grey),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              itemCount: cart_page.cart.length),
        );
      },
    );
  }
}
