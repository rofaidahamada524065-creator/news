import 'package:flutter/material.dart';
import 'package:randumuser/Models/news_model.dart';
import 'package:randumuser/Services/news_services.dart';

class NewsProvider extends ChangeNotifier {
  NewsModel? news;
  Future<void> RequstNews() async {
    news = await NewsServices.Getdata();
    notifyListeners();
  }
}
