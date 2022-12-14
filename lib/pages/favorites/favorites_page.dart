import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:news_app_n2/blocs/favorites_bloc/favorites_bloc.dart';
import 'package:news_app_n2/models/article_model.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/article_list_tile.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Favoritos"),
          centerTitle: true,
          backgroundColor: Colors.black,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              BlocBuilder<FavoritesBloc, FavoritesState>(
                builder: (context, state) {
                  if (state is FavoritesLoadingState) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is FavoritesErrorState) {
                    return Center(
                      child: Text(state.errorMessage),
                    );
                  } else if (state is FavoritesLoadedState) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height - 60,
                      child: ListView.builder(
                        itemCount: state.favorites.articles.length,
                        itemBuilder: (context, index) {
                          Article article = state.favorites.articles[index];
                          return Slidable(
                              key: ValueKey(index),
                              endActionPane: ActionPane(
                                  motion: const ScrollMotion(),
                                  children: [
                                    SlidableAction(
                                      backgroundColor: Colors.red,
                                      icon: Icons.delete,
                                      label: "Deletar",
                                      onPressed: (_) {
                                        context.read<FavoritesBloc>().add(
                                              RemoveNewsFavoritesEvent(
                                                article: article,
                                              ),
                                            );
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            backgroundColor: Colors.red,
                                            content: Text(
                                              "Removido dos favoritos",
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ]),
                              child: ArticleListTile(article: article));
                        },
                      ),
                    );
                  } else {
                    return const Center(
                      child: Text("Algo de errado aconteuce......"),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
