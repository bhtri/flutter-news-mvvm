import 'package:flutter/material.dart';
import 'package:news_mvvm/screens/news_screen.dart';
import 'package:news_mvvm/viewmodels/news_article_list_view_model.dart.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => NewArticleListViewModel(),
          ),
        ],
        child: const NewsScreen(),
      ),
    );
  }
}
