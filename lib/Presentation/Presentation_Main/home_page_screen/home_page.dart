import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_den/core/app_export.dart';
import 'package:student_den/widgets/custom_search_view.dart';
import 'package:student_den/widgets/custom_icon_button.dart';
import 'package:student_den/widgets/custom_bottom_bar.dart';
import 'package:student_den/Presentation/Extra_Features/offers/model/offer.dart';
import 'package:student_den/Presentation/Extra_Features/offers/widgets/offer_card.dart';
import 'package:student_den/Presentation/Extra_Features/offers/offer_detail_page.dart';
import 'bloc/home_page_bloc.dart';
import 'models/home_page_model.dart';
import 'widgets/home_category_section.dart';

// Define BottomBarEnum if missing
enum BottomBarEnum {
  Home,
  Favorite,
  SearchwhiteA700,
  Lock,
}

// Define IconButtonStyleHelper if missing
class IconButtonStyleHelper {
  static BoxDecoration fillPrimaryContainer = BoxDecoration(
    color: Colors.blue, // Replace with your color
    borderRadius: BorderRadius.circular(10), // Provide a default value or use BorderRadiusStyle
  );
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<HomePageBloc>(
      create: (context) => HomePageBloc()..add(HomePageInitialEvent()),
      child: HomePage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.whiteA700,
      resizeToAvoidBottomInset: false,
      appBar: _buildAppBar(context),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(bottom: 80.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSearchRow(context),
              SizedBox(height: 24.h),
              BlocBuilder<HomePageBloc, HomePageState>(
                builder: (context, state) {
                  if (state is HomePageLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is HomePageLoaded) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: state.homePageModelObj.categories.map((category) {
                        return HomeCategorySection(
                          categoryTitle: category.title,
                          offers: category.offers,
                          onCategoryTap: () {
                            _navigateToCategoryPage(context, category.title.toLowerCase().replaceAll(' ', '_'));
                          },
                          onOfferTap: (offer) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => OfferDetailPage(offer: offer),
                              ),
                            );
                          },
                        );
                      }).toList(),
                    );
                  } else if (state is HomePageError) {
                    return Center(child: Text('Error: ${state.errorMessage}'));
                  } else {
                    return const Center(child: Text('Something went wrong!'));
                  }
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomBar(context),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      elevation: 0,
      toolbarHeight: 60.h,
      title: Padding(
        padding: EdgeInsets.only(left: 26.h),
        child: CustomImageView(
          imagePath: "assets/images/Logo.png", // Replace with your actual logo path
          height: 30.h, // Use .h directly if adaptSize is not working
          width: 30.h, // Use .w directly if adaptSize is not working
        ),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 26.h),
          child: CustomImageView(
            imagePath: "assets/images/User-image.png", // Replace with your actual user profile image path
            height: 30.h,
            width: 30.h,
          ),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildSearchRow(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 26.h, right: 26.h),
      child: Row(
        children: [
          Expanded(
            child: CustomSearchView(
              controller: TextEditingController(),
              hintText: "Search",
              prefix: Padding(
                padding: EdgeInsets.all(10.h),
                child: CustomImageView(
                  imagePath: ImageConstant.search,
                  height: 20.h,
                  width: 20.h,
                ),
              ),
              prefixConstraints: BoxConstraints(
                maxHeight: 40.h,
              ),
              suffix: Padding(
                padding: EdgeInsets.only(right: 15.h),
                child: IconButton(
                  onPressed: () {
                    // Implement search functionality
                  },
                  icon: Icon(
                    Icons.clear,
                    color: Colors.grey.shade600,
                  ),
                ),
              ),
              suffixConstraints: BoxConstraints(
                maxHeight: 40.h,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 12.h),
            child: CustomIconButton(
              height: 40.h,
              width: 40.h,
              padding: EdgeInsets.all(8.h),
              decoration: IconButtonStyleHelper.fillPrimaryContainer,
              child: CustomImageView(
                imagePath: ImageConstant.user, // Replace with your filter icon path
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(
      onChanged: (dynamic type) {
        Navigator.pushNamed(context, getCurrentRoute(type));
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

  void _navigateToCategoryPage(BuildContext context, String categoryRoute) {
    Navigator.pushNamed(context, '/$categoryRoute'); // Define your category routes
  }
}