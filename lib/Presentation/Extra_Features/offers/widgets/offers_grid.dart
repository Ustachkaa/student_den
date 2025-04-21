import 'package:flutter/material.dart';
import '../model/offer.dart'; // Import your Offer model
import '../offer_detail_page.dart';
import 'offer_card.dart'; // Import your OfferCard widget

class OffersGrid extends StatelessWidget {
  final List<Offer> offers;

  const OffersGrid({Key? key, required this.offers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Adjust the number of columns as needed
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.8, // Adjust the aspect ratio of the cards
      ),
      itemCount: offers.length,
      itemBuilder: (context, index) {
        final offer = offers[index];
        return OfferCard(
          offer: offer,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => OfferDetailPage(offer: offer),
              ),
            );
          },
        );
      },
    );
  }
}