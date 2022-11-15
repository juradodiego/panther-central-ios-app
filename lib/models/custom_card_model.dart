import 'package:panther_central_ios_app/models/address_model.dart';

class CustomCard {
  final String name;
  final String nameOnCard;
  final int number;
  final String exp;
  final int cvv;
  final Address billing;

  CustomCard(
      {required this.name,
      required this.nameOnCard,
      required this.number,
      required this.exp,
      required this.cvv,
      required this.billing});

  factory CustomCard.fromJson(Map<String, dynamic> json) {
    return CustomCard(
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
