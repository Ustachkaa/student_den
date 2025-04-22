import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/firestore_service.dart';
import '../bloc/offers_bloc.dart';
import '../model/offer.dart'; // Import your Offer model
import '../offer_detail_page.dart';
import 'offer_card.dart'; // Import your OfferCard widget
import '../offer_storage_service.dart';

class OffersGrid extends StatefulWidget {
  final List<Offer> offers;
  final String userId;

  const OffersGrid({Key? key, required this.offers, required this.userId}) : super(key: key);

  @override
  State<OffersGrid> createState() => _OffersGridState();
}

class _OffersGridState extends State<OffersGrid> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.8,
      ),
      itemCount: widget.offers.length,
      itemBuilder: (context, index) {
        final offer = widget.offers[index];
        return OfferCard(
          key: ValueKey(offer.id),
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