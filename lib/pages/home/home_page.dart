import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_n2/blocs/news_bloc/news_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          const Text("Noticias do Brasil"),
          const Text("Veja as principais noticias do Brasil em um só clique!"),
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
              return ListView.builder(
                itemCount: state.articleList.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 80,
                    width: MediaQuery.of(context).size.width - 90,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  );
                },
              );
            } else {
              return const Center(
                child: Text("Algo de errado aconteceu......"),
              );
            }
          })
        ]),
      ),
    );
  }
}
