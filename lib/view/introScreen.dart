import 'dart:async';
import 'dart:convert';
import 'package:busymed/services/apidata.dart';
import 'package:http/http.dart' as http;

import 'package:busymed/services/listingdata.dart';
import 'package:busymed/view/components/page_transitions.dart';
import 'package:busymed/view/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class introScreen extends StatefulWidget {
  const introScreen({Key? key}) : super(key: key);

  @override
  _introScreenState createState() => _introScreenState();
}

class _introScreenState extends State<introScreen> {
  void buildData() async {
    await getData();

    Navigator.of(context).pushReplacement(
        nordickTracks(child: home(), direction: AxisDirection.up));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    buildData();

    // Timer(Duration(milliseconds: 500), () {
    //   Navigator.of(context).pushReplacement(
    //       nordickTracks(child: home(), direction: AxisDirection.up));
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white30,
      body: Center(
        child: SvgPicture.asset(
          'assets/icons/busymed.svg',
          colorBlendMode: BlendMode.srcIn,
          width: 200,
        ),
      ),
    );
  }
}
