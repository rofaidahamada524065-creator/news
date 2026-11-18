import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:randumuser/Provider/news_provider.dart';
import 'package:randumuser/Widget/news_custom.dart';

class NewsScreen extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<NewsProvider>(
        builder: (context, value, child) {
          final data = value.news?.datas;
          if (data == null) {
            value.RequstNews();
            return Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) => NewsCustom(dataa: data[index]),
            );
          }
        },
      ),
    );
  }
}
