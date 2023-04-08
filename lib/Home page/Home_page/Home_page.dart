import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoping_getx/Cart/Cart_page/Cart_page.dart';
import 'package:shoping_getx/Home%20page/Controller/Homepage_Controller.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/';

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    HomepageController homepageController = Get.put(HomepageController());
    return GetBuilder(
      builder: (HomepageController controller) {
        return Scaffold(
          backgroundColor: Colors.grey.shade200,
          appBar: AppBar(
              actions: [
                GestureDetector(
                    onTap: () {
                      Get.to(const CartPage());
                    },
                    child: const Icon(Icons.shopping_cart)),
                const SizedBox(
                  width: 10,
                )
              ],
              title: const Text('Shopping app',
                  style: TextStyle(color: Colors.white)),
              centerTitle: true,
              backgroundColor: Colors.deepPurple),
          body: GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 2 / 2.8,
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20),
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Container(
                            height: 170,
                            width: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                    image: AssetImage(homepageController
                                        .modal[index].image!.value),
                                    fit: BoxFit.fill)),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, top: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(homepageController.modal[index].name!.value,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 17)),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                      '\$ ${homepageController.modal[index].total}.00',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15)),
                                  Padding(
                                    padding: EdgeInsets.only(right: 20),
                                    child: Obx(
                                      () => GestureDetector(
                                          onTap: () async {
                                            if (homepageController.unitcount(
                                                    homepageController
                                                        .modal[index].name) >
                                                0) {
                                            } else {
                                              homepageController
                                                  .modal[index].cart = true.obs;
                                              homepageController.increment(
                                                  homepageController
                                                      .modal[index].unit);
                                              homepageController.cart.add(Modal(
                                                  homepageController
                                                      .modal[index].name,
                                                  homepageController
                                                      .modal[index].image,
                                                  homepageController
                                                      .modal[index].price,
                                                  homepageController
                                                      .modal[index].unit,
                                                  homepageController
                                                      .modal[index].total,
                                                  homepageController
                                                      .modal[index].cart));
                                            }
                                            controller.update();
                                          },
                                          child: homepageController.unitcount(
                                                      homepageController
                                                          .modal[index].name) >
                                                  0
                                              ? Icon(
                                                  Icons.check_circle,
                                                  size: 35,
                                                )
                                              : Icon(
                                                  Icons.add_circle_sharp,
                                                  size: 35,
                                                )),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ]),
              );
            },
            itemCount: homepageController.modal.length,
          ),
        );
      },
    );
  }
}
