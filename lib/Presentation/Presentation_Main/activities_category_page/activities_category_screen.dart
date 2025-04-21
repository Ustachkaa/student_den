import 'package:flutter/material.dart';
import 'package:student_den/Presentation/Presentation_Main/activities_category_page/activities_tab_page.dart';
import '../../../core/app_export.dart';
import '../../../widgets/custom_icon_button.dart';
import '../../../widgets/custom_search_view.dart';
import '../../../widgets/custom_bottom_bar.dart';
import 'bloc/activities_category_bloc.dart';
import 'models/activities_category_model.dart';
import '../../Extra_Features/offers/bloc/offers_bloc.dart';
import '../../Extra_Features/offers/widgets/offers_grid.dart';
import 'package:student_den/Presentation/Presentation_Main/job_category_page/job_category_page.dart';
import 'package:student_den/Presentation/Presentation_Main/leisure_category_page/leisure_category_page.dart';
import '../../Presentation_Main/news_category_page/news_category_page.dart';
import '../../Presentation_Main/handy_work_category_page/handy_work_category_page.dart';
import '../../Presentation_Main/discount_category_page/discount_category_page.dart';
import '../../Extra_Features/offers/model/offer.dart';


// Define IconButtonStyleHelper if missing
class IconButtonStyleHelper {
  static BoxDecoration get none => BoxDecoration(
    color: Colors.transparent,
  );
}

class ActivitiesCategoryScreen extends StatefulWidget {
  const ActivitiesCategoryScreen({Key? key}) : super(key: key);

  @override
  ActivitiesCategoryScreenState createState() => ActivitiesCategoryScreenState();

  static Widget builder(BuildContext context) {
    return BlocProvider<ActivitiesCategoryBloc>(
      create: (context) => ActivitiesCategoryBloc(ActivitiesCategoryState(
        activitiesCategoryModelObj: ActivitiesCategoryModel(),
      ))
        ..add(ActivitiesCategoryInitialEvent()),
      child: ActivitiesCategoryScreen(),
    );
  }
}

class ActivitiesCategoryScreenState extends State<ActivitiesCategoryScreen> {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<OffersBloc>(context).add(LoadOffers()); // Load offers when the screen initializes
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.whiteA700,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SizedBox(
          width: double.maxFinite,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              _buildColumnSearch(context),
              SizedBox(height: 30.h),
              _buildCategoryBubbles(context),
              Expanded(
                child: BlocBuilder<ActivitiesCategoryBloc, ActivitiesCategoryState>(
                  builder: (context, state) {
                    if (state.selectedCategory == 'activities') {
                      return ActivitiesTabPage();
                    } else if (state.selectedCategory == 'discounts') {
                      return _buildOffersGrid(context);
                    } else if (state.selectedCategory == 'jobs') {
                      return JobCategoryPage();
                    } else if (state.selectedCategory == 'leisure_discounts') {
                      return LeisureCategoryPage();
                    } else if (state.selectedCategory == 'handy_work') {
                      return HandyWorkCategoryPage();
                    } else if (state.selectedCategory == 'news') {
                      return NewsCategoryPage();
                    } else {
                      return ActivitiesTabPage();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      //bottomNavigationBar: _buildBottomBar(context), // Removed bottom bar
    );
  }

  /// Section Widget
  Widget _buildColumnSearch(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.only(right: 4.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: BlocSelector<ActivitiesCategoryBloc, ActivitiesCategoryState,
                TextEditingController?>(
              selector: (state) => state.searchController,
              builder: (context, searchController) {
                return CustomSearchView(
                  controller: searchController,
                  hintText: "lbl_search".tr,
                  contentPadding: EdgeInsets.fromLTRB(14.h, 6.h, 6.h, 6.h),
                );
              },
            ),
          ),
          CustomIconButton(
            height: 48.h,
            width: 48.h,
            padding: EdgeInsets.all(8.h),
            decoration: IconButtonStyleHelper.none,
            child: CustomImageView(
              imagePath: ImageConstant.thumbsUp,
            ),
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildCategoryBubbles(BuildContext context) {
    final categories = ['activities', 'discounts', 'jobs', 'leisure_discounts', 'handy_work', 'news'];
    return SizedBox(
      height: 60.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.h),
            child: CategoryBubble(
              category: category,
              onTap: () {
                context.read<ActivitiesCategoryBloc>().add(CategorySelected(category: category));
              },
            ),
          );
        },
      ),
    );
  }

  /// Section Widget
  // OR Option 2: Update the CustomBottomBar widget to work with your enum
  /*Widget _buildBottomBar(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: CustomBottomBar(
        onChanged: (dynamic type) {
          if (type is BottomBarEnum) {
            Navigator.pushNamed(
              navigatorKey.currentContext!,
              getCurrentRoute(type),
            );
          }
        },
      ),
    );
  }*/

  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(
      onChanged: (dynamic type) {
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

  Widget _buildOffersGrid(BuildContext context) {
    return BlocBuilder<OffersBloc, OffersState>(
      builder: (context, offersState) {
        if (offersState is OffersLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (offersState is OffersLoaded) {
          // Filter offers based on some criteria if needed
          List<Offer> filteredOffers = offersState.allOffers
              .where((offer) => offer.offer != null)
              .toList();

          return OffersGrid(offers: filteredOffers);
        } else if (offersState is OffersError) {
          return Center(child: Text('Error: ${offersState.errorMessage}'));
        } else {
          return Center(child: Text('Something went wrong.'));
        }
      },
    );
  }
}

class CategoryBubble extends StatelessWidget {
  final String category;
  final VoidCallback onTap;

  const CategoryBubble({Key? key, required this.category, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 8.h),
        decoration: BoxDecoration(
          color: appTheme.gray100,
          borderRadius: BorderRadius.circular(20.h),
          boxShadow: [
            BoxShadow(
              color: theme.colorScheme.secondaryContainer.withOpacity(0.25),
              spreadRadius: 2.h,
              blurRadius: 2.h,
              offset: Offset(0, 1.1),
            )
          ],
        ),
        child: Text(
          category.tr,
          style: TextStyle(
            fontSize: 16.0,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}