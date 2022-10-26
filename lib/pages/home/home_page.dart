import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_n2/blocs/news_bloc/news_bloc.dart';
import 'package:news_app_n2/models/article_model.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../blocs/favorites_bloc/favorites_bloc.dart';
import '../widgets/article_list_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("News App"),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.black,
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              height: 15,
            ),
            const Text(
              "Noticias do Brasil",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            const Text(
                "Veja as principais noticias do Brasil em um só clique!"),
            SizedBox(
              height: 25,
            ),
            BlocBuilder<NewsBloc, NewsState>(builder: (context, state) {
              if (state is NewsLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is NewsErrorState) {
                return Center(
                  child: Text(state.errorMessage),
                );
              } else if (state is NewsLoadedState) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height - 60,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: state.articleList.length,
                    itemBuilder: (context, index) {
                      final article = state.articleList[index];
                      return ArticleListTile(article: article);
                    },
                  ),
                );
              } else {
                return const Center(
                  child: Text("Algo de errado aconteceu......"),
                );
              }
            })
          ]),
        ),
      ),
    );
  }
}
