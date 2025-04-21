import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/app_export.dart';
import '../../../widgets/custom_bottom_bar.dart';
import '../../Extra_Features/offers/bloc/offers_bloc.dart';
import '../../Extra_Features/offers/widgets/offers_grid.dart';
import 'bloc/handy_work_bloc.dart';
import 'models/handy_work_model.dart';
import '../../Extra_Features/offers/model/offer.dart';

// Import other category pages
import 'package:student_den/Presentation/Presentation_Main/activities_category_page/activities_tab_page.dart';
import 'package:student_den/Presentation/Presentation_Main/job_category_page/job_category_page.dart';
import 'package:student_den/Presentation/Presentation_Main/leisure_category_page/leisure_category_page.dart';
import 'package:student_den/Presentation/Presentation_Main/news_category_page/news_category_page.dart';
import 'package:student_den/Presentation/Presentation_Main/discount_category_page/discount_category_page.dart';

// Define BottomBarEnum if missing
enum BottomBarEnum { Favorite, Home, SearchwhiteA700, Lock }

class HandyWorkCategoryPage extends StatefulWidget {
  const HandyWorkCategoryPage({Key? key}) : super(key: key);

  @override
  HandyWorkCategoryPageState createState() => HandyWorkCategoryPageState();

  static Widget builder(BuildContext context) {
    return BlocProvider<HandyWorkCategoryBloc>(
      create: (context) => HandyWorkCategoryBloc(HandyWorkState(
        handyWorkCategoryModelObj: HandyWorkCategoryModel(),
      ))
        ..add(HandyWorkInitialEvent()),
      child: HandyWorkCategoryPage(),
    );
  }
}

class HandyWorkCategoryPageState extends State<HandyWorkCategoryPage>
    with AutomaticKeepAliveClientMixin<HandyWorkCategoryPage> {
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<OffersBloc>(context).add(LoadOffers()); // Load offers when the screen initializes
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: appTheme.whiteA700,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 24.h,
            vertical: 30.h,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: BlocBuilder<OffersBloc, OffersState>(
                  builder: (context, offersState) {
                    if (offersState is OffersLoading) {
                      return Center(child: CircularProgressIndicator());
                    } else if (offersState is OffersLoaded) {
                      List<Offer> filteredOffers = offersState.allOffers
                          .where((offer) => offer.price != null && offer.title != null)
                          .toList();

                      return OffersGrid(offers: filteredOffers);
                    } else if (offersState is OffersError) {
                      return Center(child: Text('Error: ${offersState.errorMessage}'));
                    } else {
                      return Center(child: Text('Something went wrong.'));
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomBar(context),
    );
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(
      onChanged: (ButtomBarEnum type) {
        Navigator.pushNamed(context, getCurrentRoute(type as BottomBarEnum));
      },
    );
  }

  /// Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Favorite:
        return AppRoutes.likedScreen; // Replace with your favorite route
      case BottomBarEnum.SearchwhiteA700:
        return AppRoutes.filterPage; // Replace with your search route
      case BottomBarEnum.Lock:
        return AppRoutes.personScreen; // Replace with your profile route
      case BottomBarEnum.Home:
      default:
        return AppRoutes.homePage;
    }
  }
}