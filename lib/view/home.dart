import 'package:busymed/services/listingdata.dart';
import 'package:busymed/view/components/colours.dart';
import 'package:busymed/view/components/listing.dart';
import 'package:busymed/view/components/page_transitions.dart';
import 'package:busymed/view/fav.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class home extends StatelessWidget {
  const home({Key? key}) : super(key: key);
  static ValueNotifier<int> basket = ValueNotifier(favourited.length);
  static ValueNotifier<bool> isHomePage = ValueNotifier(false);
  // static bool isHome = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: noStock,
        appBar: AppBar(
          toolbarHeight: 55,
          elevation: 0,
          foregroundColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Stack(
                children: [
                  Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        print('${favourited.length}');
                        Navigator.push(
                            context, nordickTracks(child: favourites()));
                      },
                      child: SvgPicture.asset(
                        'assets/icons/Framefire.svg',
                        height: 40,
                        width: 40,
                      ),
                    ),
                  ),
                  ValueListenableBuilder<int>(
                    valueListenable: basket,
                    builder:
                        (BuildContext context, int noItems, Widget? child) {
                      return Container(
                        margin: const EdgeInsets.only(left: 30),
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: favourited.length > 0
                              ? Colors.red
                              : Colors.transparent,
                        ),
                        child: Align(
                          child: Text(
                            '${favourited.length}',
                            style: TextStyle(
                                color: favourited.length > 0
                                    ? justWhite
                                    : Colors.transparent,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              )
            ],
          ),
        ),
        body: Container(
          child: ListView.builder(
              shrinkWrap: true,
              controller: ScrollController(),
              itemCount: listingData.length,
              itemBuilder: (BuildContext context, index) {
                return listing(index: index, pagelocation: false);
              }),
        ),
      ),
    );
  }
}
