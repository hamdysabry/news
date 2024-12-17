import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/Shared_component/network/api_manger.dart';
import 'package:news/model/source_model.dart';

class CategoryViewModel extends Cubit<CategoryViewState> {
  CategoryViewModel() : super(LoadingState());

  void loadNewsSourse(String category) async {
    try {
      var response = await ApiManger.fetchSources(category);

      if (response.status == "error") {
        emit(ErrorState(errorMessage: response.message));
      }
      if (response.status == "ok") {
        emit(SuccessState(response.sources));
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

abstract class CategoryViewState {}

class LoadingState extends CategoryViewState {
  String? loadingMessage;

  LoadingState({this.loadingMessage});
}

class ErrorState extends CategoryViewState {
  String? errorMessage;
  Exception? exception;

  ErrorState({this.errorMessage, this.exception});
}

class SuccessState extends CategoryViewState {
  List<Source>? sources;

  SuccessState(this.sources);
}
