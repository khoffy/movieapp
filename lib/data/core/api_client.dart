import 'dart:convert';

import 'package:http/http.dart';

import 'api_constants.dart';

// 4e étape (bis), on regroupe dans cette classe le code répétitif de l'étape 4 
class ApiClient {
  final Client _client;

  ApiClient(this._client);

  dynamic get(String path) async {
    final response = await _client.get(
      '${ApiConstants.BASE_URL}$path?api_key=${ApiConstants.API_KEY}',
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
