import 'dart:convert';

import 'package:http/http.dart' as http;

import 'get_data.dart';

class ApiClient {
  Future<AllData> fetchGithubApi() async {
    final response = await http.get(Uri.parse(
        "https://api.github.com/search/repositories?q=created:>2022-04-29&sort=stars&order=desc"));
    print("RESPONSE : " + response.body);
    Map<String, dynamic> data = jsonDecode(response.body);
    return AllData.fromJson(data);
  }
}
