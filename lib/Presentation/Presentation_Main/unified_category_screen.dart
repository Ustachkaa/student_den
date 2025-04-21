// unified_category_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_den/core/app_export.dart';
import 'package:student_den/widgets/custom_bottom_bar.dart';
import 'package:student_den/Presentation/Extra_Features/offers/bloc/offers_bloc.dart';
import 'package:student_den/Presentation/Extra_Features/offers/widgets/offers_grid.dart';
import 'package:student_den/Presentation/Extra_Features/offers/model/offer.dart';

class UnifiedCategoryScreen extends StatefulWidget {
  final String initialCategory;

  const UnifiedCategoryScreen({Key? key, required this.initialCategory}) : super(key: key);

  @override
  State<UnifiedCategoryScreen> createState() => _UnifiedCategoryScreenState();

  static Widget builder(BuildContext context, {required String category}) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => OffersBloc()..add(LoadOffers()),
        ),
      ],
      child: UnifiedCategoryScreen(initialCategory: category),
    );
  }
}

class _UnifiedCategoryScreenState extends State<UnifiedCategoryScreen> {
  late String selectedCategory;

  final List<String> categories = [
    'activities',
    'discounts',
    'jobs',
    'leisure_discounts',
    'handy_work',
    'news'
  ];

  @override
  void initState() {
    super.initState();
    selectedCategory = widget.initialCategory;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.whiteA700,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            _buildCategoryBubbles(context),
            Expanded(child: _buildFilteredOffers(context)),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomBar(context),
    );
  }

  Widget _buildCategoryBubbles(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: SizedBox(
        height: 64.h,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: 16.h),
          itemCount: categories.length,
          separatorBuilder: (_, __) => SizedBox(width: 12.h),
          itemBuilder: (context, index) {
            final category = categories[index];
            return GestureDetector(
              onTap: () => setState(() => selectedCategory = category),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 12.h),
                decoration: BoxDecoration(
                  color: category == selectedCategory ? appTheme.lightBlue900 : appTheme.gray100,
                  borderRadius: BorderRadius.circular(30.h),
                ),
                child: Center(
                  child: Text(
                    category.tr,
                    style: TextStyle(
                      fontSize: 16,
                      color: category == selectedCategory ? Colors.white : Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildFilteredOffers(BuildContext context) {
    return BlocBuilder<OffersBloc, OffersState>(
      builder: (context, state) {
        if (state is OffersLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is OffersLoaded) {
          final List<Offer> filteredOffers = _filterByCategory(state.allOffers);
          return filteredOffers.isEmpty
              ? const Center(child: Text("No results found."))
              : OffersGrid(offers: filteredOffers);
        } else if (state is OffersError) {
          return Center(child: Text('Error: ${state.errorMessage}'));
        } else {
          return const Center(child: Text('Something went wrong.'));
        }
      },
    );
  }

  List<Offer> _filterByCategory(List<Offer> offers) {
    return offers.where((offer) {
      final id = offer.id?.toLowerCase() ?? '';
      switch (selectedCategory) {
        case 'discounts':
          return offer.offer != null && id.startsWith('disc');
        case 'activities':
          return offer.price != null && id.startsWith('act');
        case 'jobs':
          return offer.price != null && id.startsWith('job');
        case 'leisure_discounts':
          return offer.offer != null && id.startsWith('leis');
        case 'handy_work':
          return offer.price != null && id.startsWith('handy');
        case 'news':
          return offer.description != null && id.startsWith('news');
        default:
          return false;
      }
    }).toList();
  }
}

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
