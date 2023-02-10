import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CART_Conroller extends GetxController {
   var items = 0.obs;

  increment() {
    items.value++;
  }
  decrement() {
    if (items.value <= 0) {
      Get.snackbar(
        'Buying Items',
        'Can not be less than Zero',
        icon: Icon(Icons.alarm),
        barBlur: 20,
        isDismissible: true,
        duration: Duration(
          seconds: 3,
        ),
      );
    }
    else{
      items.value--;
    }
  }
}
