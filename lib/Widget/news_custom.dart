import 'package:flutter/material.dart';
import 'package:randumuser/Models/news_model.dart';
import 'package:randumuser/Screen/details.dart';

class NewsCustom extends StatelessWidget {
  data dataa;
  NewsCustom({super.key, required this.dataa});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      height: 300,

      child: TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Details()),
          );
        },
        child: Card(
          elevation: 8,
          shape: BeveledRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(20),
          ),
          child: Column(
            crossAxisAlignment: .center,
            mainAxisAlignment: .center,
            mainAxisSize: .min,
            children: [
              Image.network(
                dataa.urlToImage,
                errorBuilder: (context, error, stackTrace) =>
                    Icon(Icons.broken_image),
              ),
              Text(dataa.name, style: TextStyle(fontWeight: .bold)),
              Text(dataa.description),
            ],
          ),
        ),
      ),
    );
  }
}
