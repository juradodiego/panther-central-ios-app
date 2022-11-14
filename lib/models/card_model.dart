import 'package:panther_central_ios_app/models/address_model.dart';

class Card {

  final String name;
  final String nameOnCard;
  final int number;
  final String exp;
  final int cvv;
  final Address billing;

  Card({this.name, this.nameOnCard, this.number, this.exp, this.cvv, this.billing});

  factory Card.fromJson(Map<String, dynamic> json){
    return Card(
        name: json["Name"],
        nameOnCard: json["NameOnCard"],
        number: json["Number"],
        exp: json["Exp"],
        cvv: json["CVV"],
        billing: Address.fromJson(json["Billing"])
    );
  }
}