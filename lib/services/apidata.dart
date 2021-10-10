import 'dart:convert';

import 'package:busymed/services/listingdata.dart';
import 'package:http/http.dart' as http;

Future<List> getData() async {
  try {
    var url = Uri.parse('https://dev.busymed.com/api/products_top_20');
    var metdata = await http.get(url);

    Map data = jsonDecode(metdata.body);
    // print(data['products'][0]['product_type']);
    var products = data['products'];

    List stuff = [];
    products.forEach((product) {
      // if (product['product_type'] == 'Medicine')
      if (listingData.length != 20) {
        stuff.add(product['image']);
        listingData.add(listingClass(
            id: product['id'],
            adImg: 'https://dev.busymed.com/${product['image']}',
            companyName: product['name'],
            dosage: product['dosage'],
            quantity: product['quantity'],
            description: product['description'],
            inStock: product['active'] == 'Y' ? true : false));
      }
    });

    print(stuff[0]);
    print(stuff[1]);
    print(stuff[2]);
    print(stuff[3]);
    print(stuff[4]);
    print(stuff[5]);
    print(stuff[6]);
    print(stuff[7]);
    print(stuff[8]);
  } catch (e) {
    print('error caught at: $e');
  }

  return listingData;
}

void main() => getData();
