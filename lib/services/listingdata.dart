class listingClass {
  final int id;
  final String adImg;
  final String companyName;
  final String dosage;
  final String quantity;
  final String description;
  final bool inStock;

  listingClass(
      {required this.id,
      required this.adImg,
      required this.companyName,
      required this.dosage,
      required this.quantity,
      required this.description,
      required this.inStock});
}

List<listingClass> listingData = [
  // listingClass(
  //     id: 1,
  //     adImg: 'adImg',
  //     companyName: 'Strepsils',
  //     dosage: 'dosage',
  //     quantity: 'quantity',
  //     description: 'description',
  //     inStock: false),
  // listingClass(
  //     id: 2,
  //     adImg: 'adImg',
  //     companyName: 'Panado',
  //     dosage: 'dosage',
  //     quantity: 'quantity',
  //     description: 'description',
  //     inStock: true),
  // listingClass(
  //     id: 3,
  //     adImg: 'adImg',
  //     companyName: 'juice',
  //     dosage: 'dosage',
  //     quantity: 'quantity',
  //     description: 'description',
  //     inStock: false),
  // listingClass(
  //     id: 4,
  //     adImg: 'adImg',
  //     companyName: 'buns',
  //     dosage: 'dosage',
  //     quantity: 'quantity',
  //     description: 'description',
  //     inStock: true),
];

//FAVOURITES LIST BUILDER
List<listingClass> favourited = [];

List okay = ['hello', 'hi', 'hey', 'mholo'];
var mine = 0;
void main() {
  okay.forEach((element) {
    print('$element, $mine');
    mine++;
  });
}
