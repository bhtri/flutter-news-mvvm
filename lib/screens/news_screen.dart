import 'package:flutter/material.dart';
import 'package:news_mvvm/viewmodels/news_article_list_view_model.dart.dart';
import 'package:provider/provider.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  void initState() {
    super.initState();

    Provider.of<NewArticleListViewModel>(context, listen: false).topHeadlines();
  }

  @override
  Widget build(BuildContext context) {
    // var listViewModel = Provide
    return const Scaffold();
  }
}
