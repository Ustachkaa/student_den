import 'package:flutter/material.dart';
import '../model/offer.dart'; // Import your Offer model
import '../offer_detail_page.dart';
import 'offer_card.dart'; // Import your OfferCard widget
import '../offer_storage_service.dart';

class OffersGrid extends StatefulWidget {
  final List<Offer> offers;

  const OffersGrid({Key? key, required this.offers}) : super(key: key);

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
          offer: offer,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => OfferDetailPage(offer: offer),
              ),
            );
          },
            onLikeToggle: (isNowLiked) async {
              setState(() {
                offer.isLiked = isNowLiked;
              });

              final path = await OfferStorageService().getLocalFilePath();
              print("📄 Using file: $path");

              await OfferStorageService().updateIsLiked(offer.id, isNowLiked);
            }
        );
      },
    );
  }
}