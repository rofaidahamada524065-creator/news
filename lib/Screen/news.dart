import 'package:flutter/widgets.dart';
import 'package:material_ui/material_ui.dart';

class News extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(backgroundColor: const Color.fromARGB(255, 230, 133, 165),centerTitle: true,title: Text("News",style: TextStyle(color: Colors.white,fontWeight: .bold),),),
    );
  }
}