class Address {
  final String lineOne;
  final String lineTwo;
  final String city;
  final String state;
  final String zip;

  Address(
      {required this.lineOne,
      required this.lineTwo,
      required this.city,
      required this.state,
      required this.zip});

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
        lineOne: json["LineOne"],
        lineTwo: json["LineTwo"],
        city: json["City"],
        state: json["State"],
        zip: json["ZIP"]);
  }

  @override
  String toString() {
    return '{ $lineOne, $lineTwo, $city, $state, $zip }';
  }
}
