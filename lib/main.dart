import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_n2/blocs/favorites_bloc/favorites_bloc.dart';
import 'package:news_app_n2/pages/initial/initial_page.dart';
import 'package:news_app_n2/service/api_service.dart';

import 'blocs/news_bloc/news_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NewsBloc>(
          create: (_) => NewsBloc(
            apiService: ApiService(),
          )..add(
              StartNewsEvent(),
            ),
        ),
        BlocProvider<FavoritesBloc>(
          create: (_) => FavoritesBloc()..add(StartFavoritesEvent()),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: InitialPage(),
      ),
    );
  }
}
