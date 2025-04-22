import 'package:flutter/material.dart';
import 'package:student_den/core/app_export.dart';
import 'package:student_den/Presentation/Extra_Features/offers/model/offer.dart';
import 'package:student_den/Presentation/Extra_Features/offers/widgets/offer_card.dart';

class HomeCategorySection extends StatelessWidget {
  final String categoryTitle;
  final List<Offer> offers;
  final VoidCallback onCategoryTap;
  final Function(Offer) onOfferTap;

  const HomeCategorySection({
    Key? key,
    required this.categoryTitle,
    this.offers = const [],
    required this.onCategoryTap,
    required this.onOfferTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 26.h, top: 16.h, right: 26.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: onCategoryTap,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  categoryTitle,
                  style: theme.textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8.h),
                  child: Icon(Icons.arrow_forward_ios, size: 16),
                ),
              ],
            ),
          ),
          SizedBox(height: 12.h),
          SizedBox(
            height: 200.h, // Adjust height as needed
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: offers.length,
              separatorBuilder: (context, index) => SizedBox(width: 12.h),
              itemBuilder: (context, index) {
                final offer = offers[index];
                return OfferCard(
                  offer: offer,
                  onTap: () => onOfferTap(offer), onLikeToggle: (bool ) {  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}