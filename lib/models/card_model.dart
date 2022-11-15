import 'package:panther_central_ios_app/models/address_model.dart';

class Card {
  final String name;
  final String nameOnCard;
  final int number;
  final String exp;
  final int cvv;
  final Address billing;

  Card(
      {required this.name,
      required this.nameOnCard,
      required this.number,
      required this.exp,
      required this.cvv,
      required this.billing});

  factory Card.fromJson(Map<String, dynamic> json) {
    return Card(
        name: json["Name"],
        nameOnCard: json["NameOnCard"],
        number: json["Number"],
        exp: json["Exp"],
        cvv: json["CVV"],
        billing: Address.fromJson(json["Billing"]));
  }

  @override
  String toString() {
    return '{ $name, $nameOnCard, $number, $exp, $cvv, ${billing.toString()} }';
  }
}
