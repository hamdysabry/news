import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:news/Shared_component/constants/constant.dart';
import 'package:news/model/article_Model.dart';
import 'package:news/model/source_model.dart';

class ApiManger {
  static Future<SourceModel> fetchSources(String category) async {
    var query = {"apiKey": Constant.apiKey, "category": category};
    final response = await http.get(Uri.https(
      Constant.baseURL,
      "v2/top-headlines/sources",
      query,
    ));
    var sourceData = SourceModel.fromJson(jsonDecode(response.body));
    debugPrint(response.body);

    if (response.statusCode == 200 &&
        jsonDecode(response.body)["status"] == "ok") {
      return sourceData;
    } else {
      throw Exception("failed to load source");
    }
  }

  static Future<ArticleModel> fetchNews(String source) async {
    var qurey = {"sources": source, "apiKey": Constant.apiKey};
    var uri = Uri.https(
      Constant.baseURL,
      "/v2/everything",
      qurey,
    );
    final response = await http.get(uri);
    if (response.statusCode == 200 &&
        jsonDecode(response.body)["status"] == "ok") {
      var articls = ArticleModel.fromJson(jsonDecode(response.body));
      return articls;
    } else {
      throw Exception("failed to load source");
    }
  }
}
