import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:news/model/categgorie_model.dart';
import 'package:news/pages/category-viewmodel.dart';
import 'package:news/pages/tab_view.dart';

class CategoryView extends StatelessWidget {
  CategoryModel selected;

  CategoryView({Key? key, required this.selected}) : super(key: key);

  var viewModel = CategoryViewModel();

  @override
  Widget build(BuildContext context) {
    viewModel.loadNewsSourse(selected.id);
    return BlocBuilder<CategoryViewModel, CategoryViewState>(
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
          final sources = state.sources;
          if (sources != null && sources.isNotEmpty) {
            return TabBarListView(sources);
          } else {
            return Column(children: [
              Lottie.asset("assets/images/empty.json"),
              const Text("No sources available."),
            ]);
          }
        }
        return Container();
      },
    );
  }
}
