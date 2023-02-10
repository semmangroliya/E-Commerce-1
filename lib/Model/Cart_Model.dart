import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'SingleProModel.dart';

class CartModel {
  static List list = [];

  get getData {
    return list;
  }
}

class total {
  static List ls = [];

  get getData {
    return ls;
  }
}

class Cart extends Equatable {
  final List<SingleProModel>? productPrice;

  const Cart({
    this.productPrice = const <SingleProModel>[],
  });

  @override
  // TODO: implement props
  List<Object?> get props => [productPrice];
  double get subtotal =>
      productPrice!.fold(0, (total, current) => total + current.productPrice);

  String get subtotalString => subtotal.toStringAsFixed(2);
}
