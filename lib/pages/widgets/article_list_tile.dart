import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_n2/blocs/favorites_bloc/favorites_bloc.dart';
import 'package:news_app_n2/models/article_model.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleListTile extends StatelessWidget {
  const ArticleListTile({
    Key? key,
    required this.article,
  }) : super(key: key);

  final Article article;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (await canLaunchUrl(Uri.parse(article.url!))) {
          await launchUrl(Uri.parse(article.url!));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: Text(
                "Não foi possivel acessar a URL ${article.url}",
                style: const TextStyle(color: Colors.white),
              ),
            ),
          );
        }
      },
      child: Container(
        margin: const EdgeInsets.all(12.0),
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 3.0,
              ),
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                    height: 200.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: article.urlToImage == null
                          ? "https://igp.rs.gov.br/themes/modelo-noticias/images/outros/GD_imgSemImagem.png"
                          : article.urlToImage!,
                      placeholder: (context, url) =>
                          const Center(child: CircularProgressIndicator()),
                      fit: BoxFit.cover,
                    )),
                Positioned(
                  top: 10,
                  right: 10,
                  child: IconButton(
                    onPressed: () {
                      context.read<FavoritesBloc>().add(
                            AddNewsFavoritesEvent(article: article),
                          );
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: Colors.green,
                          content: Text(
                            "Adicionado aos favoritos",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.favorite,
                      size: 41,
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8.0,
            ),
            Container(
              padding: const EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Text(
                article.author == null ? "Sem autor" : article.author!,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Text(
              article.title == null ? "Sem Titulo" : article.title!,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
