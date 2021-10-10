import 'package:busymed/services/listingdata.dart';
import 'package:busymed/view/components/addButton.dart';
import 'package:busymed/view/components/stock.dart';
import 'package:busymed/view/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'colours.dart';

// String? value;
invaderzim(index) {
  try {
    Image.network(listingData[index].adImg);
  } catch (e) {
    Image.asset('assets/images/caughSyrup.png');
  }
}

Widget listing({required index, required pagelocation}) {
  List name = listingData[index].companyName.split(' ');

  return Container(
    margin: const EdgeInsets.all(10),
    height: 200,
    width: double.infinity,
    decoration: BoxDecoration(
        color: justWhite, borderRadius: BorderRadius.circular(10)),
    child: Row(children: [
      Expanded(
        flex: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            stock(index: index),
            const Spacer(),
            Center(
              child: Container(
                  // padding: const EdgeInsets.only(right: 10),
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  child: Image.network(listingData[index].adImg)),
            ),
            const Spacer()
          ],
        ),
      ),
      Expanded(
        flex: 3,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          name.length > 2
                              ? name.sublist(0, 1).join()
                              : name.join(' '),
                          style: const TextStyle(
                              fontSize: 28,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          name.length > 2
                              ? name.sublist(2, name.length).join(' ')
                              : '',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              letterSpacing: -1.2222,
                              fontSize: 22,
                              color: Color.fromRGBO(165, 161, 161, 1),
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text(
                              'Qty:',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 18),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 5),
                              height: 30,
                              width: 70,
                              decoration: BoxDecoration(
                                  color: const Color.fromRGBO(163, 173, 164, 1),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Align(
                                child: Text(
                                  '${listingData[index].dosage.trim()}${listingData[index].quantity.trim()}',
                                  style: TextStyle(
                                      letterSpacing: -1.2222,
                                      fontSize: 22,
                                      color: justWhite,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            )
                          ],
                        ),
                        Flexible(
                          child: Container(
                            padding: const EdgeInsets.only(bottom: 10),
                            height: 50,
                            child: Text(
                              listingData[index].description,
                              overflow: TextOverflow.clip,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            addButton(gir: index, pagequickhack: pagelocation)
          ],
        ),
      )
    ]),
  );
}
