import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../core/app_export.dart';
import '../../Extra_Features/offers/model/offer.dart';
import '../../Extra_Features/offers/widgets/offer_card.dart';

class LikedScreen extends StatefulWidget {
  const LikedScreen({Key? key}) : super(key: key);

  @override
  State<LikedScreen> createState() => _LikedScreenState();
}

class _LikedScreenState extends State<LikedScreen> {
  List<Offer> likedOffers = [];

  @override
  void initState() {
    super.initState();
    loadLikedOffersFromAsset();
  }

  Future<void> loadLikedOffersFromAsset() async {
    final jsonString = await rootBundle.loadString('lib/database/posts_data.json');
    final data = json.decode(jsonString);

    final List<Offer> allOffers = [];
    for (var category in [
      'discounts',
      'activities',
      'jobs',
      'leisure_discounts',
      'handy_work',
      'news'
    ]) {
      final items = data[category] ?? [];
      for (final item in items) {
        if (item['isLiked'] == true) {
          allOffers.add(Offer.fromJson(item, category));
        }
      }
    }

    setState(() {
      likedOffers = allOffers;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          '❤ Liked Posts',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      backgroundColor: appTheme.whiteA700,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: likedOffers.isEmpty
            ? const Center(child: Text("You haven’t liked anything yet."))
            : Wrap(
          spacing: 12,
          runSpacing: 12,
          children: likedOffers
              .map((offer) => OfferCard(
            offer: offer,
            onTap: () {},
            onLikeToggle: (isNowLiked) {}, // You can make this unlikable if needed
          ))
              .toList(),
        ),
      ),
    );
  }
}