import 'package:busymed/services/listingdata.dart';
import 'package:busymed/view/components/listing.dart';
import 'package:busymed/view/fav.dart';
import 'package:busymed/view/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class addButton extends StatefulWidget {
  int gir;
  bool pagequickhack = false;
  addButton({Key? key, required this.gir, pagequickhack}) : super(key: key);

  @override
  _addButtonState createState() => _addButtonState();
}

class _addButtonState extends State<addButton> {
  List deleteList = [];
  void countDrac() {
    for (int i = 0; i < favourited.length;) {
      deleteList.add(i);
      i++;
    }
  }

  String mybiz = 'hi';
  invaderZim() {
    int i = 0;
    while (i < listingData.length) {
      favourited.removeWhere(
          (element) => favourited[i].id == listingData[widget.gir].id);
      i++;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.pagequickhack = !widget.pagequickhack;
        setState(() {
          widget.pagequickhack
              ? favourited.add(
                  listingClass(
                      id: listingData[widget.gir].id,
                      adImg: 'adImg',
                      companyName: 'companyName',
                      dosage: 'dosage',
                      quantity: 'quantity',
                      description: 'description',
                      inStock: true),
                )
              : favourited.removeLast();
        });
        home.basket.value = favourited.length;
        favourites.updateList.value = favourited.length;
        print(favourited.length);
        print(widget.gir);
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 140, top: 130),
        child: Material(
          elevation: 10,
          color: const Color.fromRGBO(44, 181, 200, 1),
          borderRadius: BorderRadius.circular(100),
          child: Container(
            height: 45,
            width: 45,
            child: Align(
              child: widget.pagequickhack
                  ? Transform.rotate(
                      angle: 40,
                      child: crosshair,
                    )
                  : crosshair,
            ),
          ),
        ),
      ),
    );
  }
}

SvgPicture crosshair =
    SvgPicture.asset('assets/icons/add.svg', width: 35, height: 35);
