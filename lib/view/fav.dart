import 'package:busymed/services/listingdata.dart';
import 'package:busymed/view/components/colours.dart';
import 'package:busymed/view/components/listing.dart';
import 'package:busymed/view/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class favourites extends StatelessWidget {
  const favourites({Key? key}) : super(key: key);

  static ValueNotifier<int> updateList = ValueNotifier(favourited.length);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.green,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          shadowColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
        ),
        body: ValueListenableBuilder<int>(
          valueListenable: home.basket,
          builder: (BuildContext context, int favUpdate, Widget? child) {
            return Container(
              child: ListView.builder(
                shrinkWrap: true,
                controller: ScrollController(),
                itemCount: updateList.value,
                itemBuilder: (BuildContext context, index) {
                  return listing(index: index, pagelocation: false);
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
