import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_n2/blocs/favorites_bloc/favorites_bloc.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                return ListView.builder(
                  itemCount: state.articleList.length,
                  itemBuilder: (context, index) {
                    return Container();
                  },
                );
              } else {
                return const Center(
                  child: Text("Algo de errado aconteuce......"),
                );
              }
            },
          ),
        ],
      )),
    );
  }
}
