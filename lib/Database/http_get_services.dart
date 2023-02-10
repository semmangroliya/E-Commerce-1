import 'dart:convert';
import 'package:http/http.dart';

import 'http_get_model.dart';

class HttpServices {
  Future<List<Model>> getData() async {
    var response =
        await get(Uri.https('jsonplaceholder.typicode.com', 'users'));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      List<Model> dataList = data
          .map(
            (e) => Model.fromJson(e),
          )
          .toList();
      return dataList;
    } else {
      throw "Can't Get Data...";
    }
  }
}
