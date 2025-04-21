import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/app_export.dart';
import '../../../widgets/custom_bottom_bar.dart';
import '../../Extra_Features/offers/bloc/offers_bloc.dart';
import '../../Extra_Features/offers/widgets/offers_grid.dart';
import 'bloc/job_category_bloc.dart';
import 'models/job_category_model.dart';
import '../../Extra_Features/offers/model/offer.dart';

// Import other category pages
import 'package:student_den/Presentation/Presentation_Main/activities_category_page/activities_tab_page.dart';
import 'package:student_den/Presentation/Presentation_Main/leisure_category_page/leisure_category_page.dart';
import 'package:student_den/Presentation/Presentation_Main/news_category_page/news_category_page.dart';
import 'package:student_den/Presentation/Presentation_Main/handy_work_category_page/handy_work_category_page.dart';
import 'package:student_den/Presentation/Presentation_Main/discount_category_page/discount_category_page.dart';



class JobCategoryPage extends StatefulWidget {
  const JobCategoryPage({Key? key}) : super(key: key);

  @override
  JobCategoryPageState createState() => JobCategoryPageState();

  static Widget builder(BuildContext context) {
    return BlocProvider<JobCategoryBloc>(
      create: (context) => JobCategoryBloc(JobCategoryState(
        jobCategoryModelObj: JobCategoryModel(),
      ))
        ..add(JobCategoryInitialEvent()),
      child: JobCategoryPage(),
    );
  }
}

class JobCategoryPageState extends State<JobCategoryPage>
    with AutomaticKeepAliveClientMixin<JobCategoryPage> {
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
        Navigator.pushNamed(context, getCurrentRoute(type));
      },
    );
  }

  /// Handling route based on bottom click actions
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