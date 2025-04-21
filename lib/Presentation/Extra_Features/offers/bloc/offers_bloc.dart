import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart' show rootBundle;
import '../model/offer.dart'; // Import your Offer model
import 'dart:convert';

part 'offers_event.dart';
part 'offers_state.dart';

class OffersBloc extends Bloc<OffersEvent, OffersState> {
  OffersBloc() : super(OffersLoading()) {
    on<LoadOffers>(_onLoadOffers);
  }

  Future<void> _onLoadOffers(LoadOffers event, Emitter<OffersState> emit) async {
    emit(OffersLoading());
    try {
      // Load the JSON data from the asset file
      final String jsonString = await rootBundle.loadString('lib/database/posts_data.json');
      final Map<String, dynamic> jsonData = json.decode(jsonString);

      final List<Offer> allOffers = [];

      jsonData.forEach((category, items) {
        if (items is List) {
          for (var item in items) {
            try {
              allOffers.add(Offer.fromJson(item as Map<String, dynamic>, category));
            } catch (e) {
              print('Error parsing item in $category: $e, item: $item');
            }
          }
        }
      });

      emit(OffersLoaded(allOffers: allOffers));
    } catch (e) {
      emit(OffersError(errorMessage: 'Failed to load offers: $e'));
    }
  }
}