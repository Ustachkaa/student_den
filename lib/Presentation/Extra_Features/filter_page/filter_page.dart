// search_posts_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_den/core/app_export.dart';
import 'package:student_den/widgets/custom_bottom_bar.dart';
import 'package:student_den/Presentation/Extra_Features/offers/bloc/offers_bloc.dart';
import 'package:student_den/Presentation/Extra_Features/offers/widgets/offers_grid.dart';
import 'package:student_den/Presentation/Extra_Features/offers/model/offer.dart';

class SearchPostsScreen extends StatefulWidget {
  const SearchPostsScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider(
      create: (_) => OffersBloc()..add(LoadOffers()),
      child: const SearchPostsScreen(),
    );
  }

  @override
  State<SearchPostsScreen> createState() => _SearchPostsScreenState();
}

class _SearchPostsScreenState extends State<SearchPostsScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.whiteA700,
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(right: 15), // Add right spacing from edge
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              color: const Color(0xFFF0F0F0), // Light gray fill
              borderRadius: BorderRadius.circular(20), // Rounder edges
            ),
            child: TextField(
              controller: _searchController,
              onChanged: (value) {
                setState(() => _searchQuery = value.toLowerCase());
              },
              decoration: const InputDecoration(
                hintText: 'Search ...',
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                isDense: true,
              ),
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
        backgroundColor: appTheme.whiteA700,
        elevation: 0,
      ),
      body: BlocBuilder<OffersBloc, OffersState>(
        builder: (context, state) {
          if (state is OffersLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is OffersLoaded) {
            final List<Offer> results = _searchOffers(state.allOffers);
            return results.isEmpty
                ? const Center(child: Text('No matching posts.'))
                : OffersGrid(offers: results);
          } else if (state is OffersError) {
            return Center(child: Text('Error: ${state.errorMessage}'));
          } else {
            return const Center(child: Text('Something went wrong.'));
          }
        },
      ),
      bottomNavigationBar: CustomBottomBar(
        onChanged: (dynamic type) {
          Navigator.pushNamed(context, getCurrentRoute(type));
        },
      ),
    );
  }

  List<Offer> _searchOffers(List<Offer> offers) {
    if (_searchQuery.isEmpty) return [];
    return offers.where((offer) {
      final title = offer.title?.toLowerCase() ?? '';
      final description = offer.description?.toLowerCase() ?? '';
      return title.contains(_searchQuery) || description.contains(_searchQuery);
    }).toList();
  }

  String getCurrentRoute(ButtomBarEnum type) {
    switch (type) {
      case ButtomBarEnum.Favorite:
        return AppRoutes.likedScreen;
      case ButtomBarEnum.Searchwhitea700:
        return AppRoutes.filterPage;
      case ButtomBarEnum.Lock:
        return AppRoutes.personScreen;
      case ButtomBarEnum.Home:
      default:
        return AppRoutes.homePage;
    }
  }
}