part of 'home_page_bloc.dart';

abstract class HomePageState extends Equatable {
  const HomePageState();

  @override
  List<Object> get props => [];
}

class HomePageLoading extends HomePageState {}

class HomePageLoaded extends HomePageState {
  final HomePageModel homePageModelObj;

  const HomePageLoaded({required this.homePageModelObj});

  @override
  List<Object> get props => [homePageModelObj];
}

class HomePageError extends HomePageState {
  final String errorMessage;

  const HomePageError({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}