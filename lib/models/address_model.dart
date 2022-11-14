class Address {

  final String lineOne;
  final String lineTwo;
  final String city;
  final String state;
  final String zip;

  Address({this.lineOne, this.lineTwo, this.city, this.state, this.zip});

  factory Address.fromJson(Map<String, dynamic> json){
    return Address(
        lineOne: json["LineOne"],
        lineTwo: json["LineTwo"],
        city: json["City"],
        state: json["State"],
        zip: json["ZIP"]
    );
  }
}