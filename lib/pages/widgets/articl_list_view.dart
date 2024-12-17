import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:news/pages/widgets/article_view.dart';
import 'package:news/pages/widgets/new-list-view-model.dart';

class ArticlsListView extends StatelessWidget {
  String sourceId;

  ArticlsListView(this.sourceId, {super.key});

  var viewModel = NewsListViewModel();

  @override
  Widget build(BuildContext context) {
    viewModel.loadArticles(sourceId);
    return BlocBuilder<NewsListViewModel, NewsListViewState>(
      bloc: viewModel,
      builder: (context, state) {
        if (state is LoadingState) {
          return Center(
            child: Column(
              children: [
                const CircularProgressIndicator(),
                const SizedBox(),
                Text(state.loadingMessage ?? ""),
              ],
            ),
          );
        }
        if (state is ErrorState) {
          return Column(
            children: [
              Text(state.errorMessage ?? ""),
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.refresh_outlined))
            ],
          );
        }
        if (state is SuccessState) {
          var articleList = state.articles;
          if (articleList != null && articleList.isNotEmpty) {
            return Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return ArticleView(articleList[index]);
                },
                itemCount: articleList.length,
              ),
            );
          } else {
            return Column(children: [
              Lottie.asset("assets/images/empty.json"),
              const Text("No data found."),
            ]);
          }
        }
        return Container();
      },
    );
  }
}
