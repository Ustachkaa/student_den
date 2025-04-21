import 'package:equatable/equatable.dart';
import 'package:student_den/Presentation/Extra_Features/offers/model/offer.dart';

class HomePageModel extends Equatable {
  HomePageModel({this.categories = const []});

  final List<HomeCategory> categories;

  HomePageModel copyWith({List<HomeCategory>? categories}) {
    return HomePageModel(
      categories: categories ?? this.categories,
    );
  }

  @override
  List<Object?> get props => [categories];
}

class HomeCategory extends Equatable {
  const HomeCategory({required this.title, this.offers = const []});

  final String title;
  final List<Offer> offers;

  HomeCategory copyWith({String? title, List<Offer>? offers}) {
    return HomeCategory(
      title: title ?? this.title,
      offers: offers ?? this.offers,
    );
  }

  @override
  List<Object?> get props => [title, offers];
}