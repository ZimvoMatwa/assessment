import 'package:busymed/services/listingdata.dart';
import 'package:busymed/view/components/colours.dart';
import 'package:flutter/material.dart';

stock({index}) {
  return Container(
    height: 30,
    width: 117,
    decoration: BoxDecoration(
      color: listingData[index].inStock ? inStock : noStock,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(10),
        bottomRight: Radius.circular(5),
      ),
    ),
    child: Align(
      child: Text(
        listingData[index].inStock ? 'In Stock' : 'Out of Stock',
        style: TextStyle(
            color: justWhite, fontSize: 18, fontWeight: FontWeight.w500),
      ),
    ),
  );
}
