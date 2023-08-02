part of 'all_news_cubit.dart';

@immutable
abstract class AllNewsState {}

class AllNewsInitial extends AllNewsState {}

class AllNewsLoading extends AllNewsState {}

class AllNewsSuccess extends AllNewsState {
  final AllNews ourresponse;
  AllNewsSuccess({required this.ourresponse});
}

class AllNewsFail extends AllNewsState {}
