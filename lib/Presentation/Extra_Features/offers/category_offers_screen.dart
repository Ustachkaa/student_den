import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/offers_bloc.dart';
import 'model/offer.dart'; // Import your Offer model
import 'widgets/offers_grid.dart'; // Import your OffersGrid widget

class CategoryOffersScreen extends StatelessWidget {
  final String category;

  const CategoryOffersScreen({Key? key, required this.category})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OffersBloc, OffersState>(
      builder: (context, state) {
        if (state is OffersLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is OffersLoaded) {
          final categoryOffers = _filterOffersByCategory(state.allOffers, category);

          // ✅ Get the current userId from Firebase Auth
          final userId = FirebaseAuth.instance.currentUser?.uid;

          if (userId == null) {
            // 👤 Handle unauthenticated users
            return const Center(child: Text('Please log in to view and like offers.'));
          }

          return Scaffold(
            appBar: AppBar(
              title: Text(_getCategoryTitle(category)),
            ),
            body: categoryOffers.isEmpty
                ? const Center(child: Text('No offers in this category yet.'))
                : OffersGrid(offers: categoryOffers, userId: userId),
          );
        } else if (state is OffersError) {
          return Center(child: Text('Error: ${state.errorMessage}'));
        } else {
          return const Center(child: Text('Something went wrong.'));
        }
      },
    );
  }

  String _getCategoryTitle(String category) {
    switch (category) {
      case 'discounts':
        return 'Discounts';
      case 'activities':
        return 'Activities';
      case 'jobs':
        return 'Jobs';
      case 'leisure_discounts':
        return 'Leisure Discounts';
      case 'handy_work':
        return 'Handy Work';
      case 'news':
        return 'News';
      default:
        return 'Offers';
    }
  }

  List<Offer> _filterOffersByCategory(List<Offer> allOffers, String category) {
    switch (category) {
      case 'discounts':
        return allOffers.where((offer) => offer.offer != null).toList();
      case 'activities':
        return allOffers.where((offer) => offer.price != null && offer.price!.startsWith('€')).toList(); // Example for activities with Euro price
      case 'jobs':
        return allOffers.where((offer) => offer.price != null && offer.price!.contains('/')).toList(); // Example for jobs with '/hour'
      case 'leisure_discounts':
        return allOffers.where((offer) => offer.offer != null).toList();
      case 'handy_work':
        return allOffers.where((offer) => offer.price != null && offer.price!.startsWith('€')).toList(); // Example for handy work with Euro rate
      case 'news':
        return allOffers.where((offer) => offer.description != null && offer.image != null).toList();
      default:
        return [];
    }
  }
}