import 'dart:convert';
import 'package:http/http.dart';

import '../model.dart';

class UserRepository {
  String endpoint = "https://jsonplaceholder.typicode.com/users";

  Future<List<Model>> getUsers() async {
    Response response = await get(Uri.parse(endpoint));
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body);
      print(result);
      return result.map((e) {
        Model var1 = Model.fromjson(e);
        //print(var1);
        return var1;
      }).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
