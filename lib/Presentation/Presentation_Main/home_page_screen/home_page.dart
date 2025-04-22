import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_den/core/app_export.dart';
import 'package:student_den/widgets/custom_search_view.dart';
import 'package:student_den/widgets/custom_icon_button.dart';
import 'package:student_den/widgets/custom_bottom_bar.dart';
import 'package:student_den/Presentation/Extra_Features/offers/model/offer.dart';
import 'package:student_den/Presentation/Extra_Features/offers/widgets/offer_card.dart';
import 'package:student_den/Presentation/Extra_Features/offers/offer_detail_page.dart';
import '../../../core/utils/firestore_service.dart';
import '../unified_category_screen.dart';
import 'bloc/home_page_bloc.dart';
import 'models/home_page_model.dart';
import 'widgets/home_category_section.dart';


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
    final userId = FirebaseAuth.instance.currentUser?.uid;

    if (userId == null) {
      return const Center(child: Text("Please log in to like posts."));
    }
    return Scaffold(
      backgroundColor: appTheme.whiteA700,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(bottom: 80.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Removed SizedBox(height: 24.h) -  AppBar already provides spacing
              BlocBuilder<HomePageBloc, HomePageState>(
                builder: (context, state) {
                  if (state is HomePageLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is HomePageLoaded) {
                    final userId = FirebaseAuth.instance.currentUser?.uid;

                    if (userId == null) {
                      return const Center(child: Text("Please log in to like posts."));
                    }
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: state.homePageModelObj.categories.map((category) {
                        return HomeCategorySection(
                          categoryTitle: category.title,
                          offers: category.offers,
                          onCategoryTap: () {
                            _navigateToCategoryPage(context, category.title.toLowerCase().replaceAll(' ', ''));
                          },
                          onOfferTap: (offer) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => OfferDetailPage(offer: offer),
                              ),
                            );
                          },
                          onLikeToggle: (offer, isNowLiked) async {
                            await FirestoreService().toggleLike(userId, offer.id, isNowLiked);
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
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(
      onChanged: (dynamic type) {
        Navigator.pushNamed(context, getCurrentRoute(type));
      },
    );
  }

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

  void _navigateToCategoryPage(BuildContext context, String categoryTitle) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => UnifiedCategoryScreen.builder(
          context,
          category: categoryTitle,
        ),
      ),
    );
  }

}