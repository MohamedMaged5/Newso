import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/Data/Models/all_news/all_news.dart';

class AllNewsRepo {
  Future<AllNews?> getAllNews(String searchtext) async {
    try {
      var response = await http.get(Uri.parse(
          "https://newsapi.org/v2/everything?domains=wsj.com&apiKey=d21df23ba8d34d948f613883539d3afa&q=$searchtext"));
      Map<String, dynamic> decoderesponse = json.decode(response.body);
      if (response.statusCode == 200) {
        AllNews data = AllNews.fromJson(decoderesponse);
        return data;
      } else {
        return null;
      }
    } catch (error) {
      print("Error : $error");
    }
    return null;
  }
}
