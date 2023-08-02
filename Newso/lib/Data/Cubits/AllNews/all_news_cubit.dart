import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_app/Data/Models/all_news/all_news.dart';
import 'package:news_app/Data/Repos/all_news_repo.dart';

part 'all_news_state.dart';

class AllNewsCubit extends Cubit<AllNewsState> {
  AllNewsCubit() : super(AllNewsInitial());
  Future<void> getallnews(String searchtext) async {
    emit(AllNewsLoading());

    AllNewsRepo().getAllNews(searchtext).then((value) {
      if (value != null) {
        emit(AllNewsSuccess(ourresponse: value));
      } else {
        emit(AllNewsFail());
      }
    });
  }
}
