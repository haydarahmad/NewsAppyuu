import 'dart:convert';

import 'package:news_app_yuu/model/model.dart';
import 'package:http/http.dart'as http;

String apikey ='74a1fe56593549e09d98363d81a4c57a';
String baseurl = 'https://newsapi.org/v2';


class News{
  Future<List<Article>?> getNews() async{
    List<Article>? list;
    String url ='$baseurl/top-headlines?country=id&&apikey=$apikey';
    var response = await http.get(Uri.parse(url));
    if(response.statusCode == 200){
      var data = jsonDecode(response.body);
      var result = data['articles'] as List;
      list = result.map((json) => Article.fromJson(json)).toList();
      return list;
    } else{
      throw Exception('gak bisa ambil data lurde');
    }
  }

  Future<List<Article>?> getNewsByCategory(String category) async {
    List<Article>? list;
    String url ='$baseurl/top-headlines?country=id&category=$category&apikey=$apikey';
    var response = await http.get(Uri.parse(url));
    if(response.statusCode == 200){
      var data = jsonDecode(response.body);
      var result = data['articles'] as List;
      list = result.map((json) => Article.fromJson(json)).toList();
      return list;
    } else{
      throw Exception('gak bisa ambil data lurde');
    }
  }
}