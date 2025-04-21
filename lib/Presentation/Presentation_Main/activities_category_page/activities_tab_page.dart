import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import 'bloc/activities_category_bloc.dart';
import '../../Extra_Features/offers/bloc/offers_bloc.dart';
import '../../Extra_Features/offers/widgets/offers_grid.dart';
import '../../Extra_Features/offers/model/offer.dart';

class ActivitiesTabPage extends StatefulWidget {
  const ActivitiesTabPage({Key? key}) : super(key: key);

  @override
  ActivitiesTabPageState createState() => ActivitiesTabPageState();
}

class ActivitiesTabPageState extends State<ActivitiesTabPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16.h,
        vertical: 16.h,
      ),
      child: BlocBuilder<OffersBloc, OffersState>(
        builder: (context, offersState) {
          if (offersState is OffersLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (offersState is OffersLoaded) {
            final selectedCategory = context.select((ActivitiesCategoryBloc bloc) => bloc.state.selectedCategory);
            List<Offer> filteredOffers = offersState.allOffers;

            if (selectedCategory != null && selectedCategory.isNotEmpty) {
              filteredOffers = offersState.allOffers.where((offer) {
                // Determine the category based on offer properties
                String offerCategory;
                if (offer.offer != null) {
                  offerCategory = 'discounts';
                } else if (offer.price != null) {
                  offerCategory = 'activities'; // Or 'jobs', 'handy_work' based on price content
                } else {
                  offerCategory = 'news';
                }
                return offerCategory == selectedCategory;
              }).toList();
            }

            return OffersGrid(offers: filteredOffers);
          } else if (offersState is OffersError) {
            return Center(child: Text('Error: ${offersState.errorMessage}'));
          } else {
            return Center(child: Text('Something went wrong.'));
          }
        },
      ),
    );
  }
}