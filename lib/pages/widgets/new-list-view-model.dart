import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/Shared_component/network/api_manger.dart';

import '../../model/article_Model.dart';

class NewsListViewModel extends Cubit<NewsListViewState> {
  NewsListViewModel() : super(LoadingState());

  void loadArticles(String sourceId) async {
    try {
      var response = await ApiManger.fetchNews(sourceId);
      if (response.status == "error") {
        emit(ErrorState(errorMessage: response.message));
        return;
      }
      if (response.status == "ok") {
        emit(SuccessState(response.articles!));
        return;
      }
    } on TimeoutException catch (e) {
      emit(ErrorState(
          errorMessage: "Couldn't reach the server "
              "please check the connection"));
    } on Exception catch (e) {
      emit(ErrorState(errorMessage: "please try again"));
    }
  }
}

abstract class NewsListViewState {}

class LoadingState extends NewsListViewState {
  String? loadingMessage;

  LoadingState({this.loadingMessage});
}

class ErrorState extends NewsListViewState {
  String? errorMessage;
  Exception? exception;

  ErrorState({this.errorMessage, this.exception});
}

class SuccessState extends NewsListViewState {
  List<Article>? articles;

  SuccessState(this.articles);
}
