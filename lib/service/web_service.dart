import 'dart:convert';
import 'package:panther_central_ios_app/models/user_model.dart';
import 'package:http/http.dart' as http;

class Webservice {
  Future<List<User>> fetchUsers(String username) async {
    final url = Uri.https('example.com',
        'fetchUsers/$username'); // TODO add actual URL Webservice connection
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final Iterable json = body["Search"];
      return json.map((user) => User.fromJson(user)).toList();
    } else {
      throw Exception("Unable to perform request!");
    }
  }
}
