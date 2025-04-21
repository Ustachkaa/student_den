import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:student_den/Presentation/Extra_Features/offers/model/offer.dart';
import '../models/home_page_model.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc() : super(HomePageLoading()) {
    on<HomePageInitialEvent>(_onHomePageInitialEvent);
  }

  Future<void> _onHomePageInitialEvent(
      HomePageInitialEvent event, Emitter<HomePageState> emit) async {
    emit(HomePageLoading());
    try {
      final String jsonString =
      await rootBundle.loadString('lib/database/posts_data.json');
      final Map<String, dynamic> jsonData = json.decode(jsonString);

      final List<HomeCategory> categoriesData = [];

      jsonData.forEach((categoryName, items) {
        if (items is List) {
          final List<Offer> categoryOffers = items.map((item) {
            try {
              return Offer.fromJson(item as Map<String, dynamic>, categoryName);
            } catch (e) {
              print('Error parsing $categoryName item: $e, item: $item');
              return null;
            }
          }).whereType<Offer>().toList();
          categoriesData.add(HomeCategory(title: _formatCategoryTitle(categoryName), offers: categoryOffers.take(4).toList())); // Take a limited number for the home page
        }
      });

      final homePageModel = HomePageModel(categories: categoriesData);
      emit(HomePageLoaded(homePageModelObj: homePageModel));
    } catch (e) {
      emit(HomePageError(errorMessage: 'Failed to load home page data: $e'));
    }
  }

  String _formatCategoryTitle(String categoryName) {
    return categoryName
        .replaceAll('_', ' ')
        .split(' ')
        .map((word) => word[0].toUpperCase() + word.substring(1))
        .join(' ');
  }
}