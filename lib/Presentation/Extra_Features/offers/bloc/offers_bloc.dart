import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart' show rootBundle;
import '../../../../core/utils/firestore_service.dart';
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
      final firestore = FirebaseFirestore.instance;
      final userId = FirebaseAuth.instance.currentUser?.uid;

      if (userId == null) {
        emit(const OffersError(errorMessage: 'User not logged in.'));
        return;
      }

      final likedSnapshot = await firestore.collection('users').doc(userId).get();
      final likedPostIds = List<String>.from(likedSnapshot.data()?['likedPosts'] ?? []);

      final postsSnapshot = await firestore.collection('posts').get();
      final List<Offer> allOffers = postsSnapshot.docs.map((doc) {
        final data = doc.data();
        final category = data['category'] ?? 'unknown';
        final offer = Offer.fromJson(data, category);
        if (likedPostIds.contains(offer.id)) {
          offer.isLiked = true;
        }
        return offer;
      }).toList();

      emit(OffersLoaded(allOffers: allOffers));
    } catch (e) {
      emit(OffersError(errorMessage: 'Failed to load offers: $e'));
    }
  }
}