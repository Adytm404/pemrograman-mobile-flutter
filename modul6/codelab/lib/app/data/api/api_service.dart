import 'dart:convert';

import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:modul6/app/data/model/articles.dart';
import 'package:http/http.dart' as http;

class ApiService extends GetxController {
  static const String _baseUrl = 'https://newsapi.org/v2/';
  static const String _apiKey = 'd49a60d30c2441f099384095ad79ad4f';
  static const String _category = 'technology';
  static const String _country = 'us';
  RxList<Article> articles = RxList<Article>([]);
  RxBool isLoading = false.obs;
  static final http.Client _client = http.Client();
  Future<List<Article>> fetchArticles() async {
    try {
      isLoading.value = true;
      final response = await _client.get(Uri.parse(
          '${_baseUrl}top-headlines?country=$_country&category=$_category&apiKey=$_apiKey'));
      if (response.statusCode == 200) {
        final jsonData = response.body;
        final articlesResult = ArticlesResult.fromJson(json.decode(jsonData));
        articles.value = articlesResult.articles;
        return articlesResult.articles;
      } else {
        print('Request failed with status: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      print('An error occurred: $e');
      return [];
    } finally {
      isLoading.value = false;
    }
  }
}
