import 'package:flutter/material.dart';
import '../../core/app_export.dart';

/// Define the ButtomBarEnum
enum ButtomBarEnum { Favorite, Home, Searchwhitea700, Lock }

//ignore_for_file: must_be_immutable
///Create a custom Bottom Navigation Bar
class CustomBottomBar extends StatefulWidget {
  /// Call when Bottom Navigation Bar has changed
  CustomBottomBar({Key? key, this.onChanged}) : super(key: key);

  /// Call when Bottom Navigation Bar has changed
  Function(ButtomBarEnum)? onChanged;

  @override
  CustomBottomBarState createState() => CustomBottomBarState();
}

// ignore: must_be_immutable
/// Implement the custom Bottom Navigation Bar
class CustomBottomBarState extends State<CustomBottomBar> {
  /// Set initial index
  int selectedIndex = 0;

  /// Add all the button navigation you want to implement
  List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
      icon: ImageConstant.favorite,
      activeIcon: ImageConstant.favorite,
      type: ButtomBarEnum.Favorite,
    ),
    BottomMenuModel(
      icon: ImageConstant.home,
      activeIcon: ImageConstant.home,
      type: ButtomBarEnum.Home,
    ),
    BottomMenuModel(
      icon: ImageConstant.searchwhitea700,
      activeIcon: ImageConstant.searchwhitea700,
      type: ButtomBarEnum.Searchwhitea700,
    ),
    BottomMenuModel(
      icon: ImageConstant.lock,
      activeIcon: ImageConstant.lock,
      type: ButtomBarEnum.Lock,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: appTheme.blueGray900,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.h),
        ),
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedFontSize: 0,
        elevation: 0,
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        items: List.generate(bottomMenuList.length, (index) {
          return BottomNavigationBarItem(
            icon: CustomImageView(
              imagePath: bottomMenuList[index].icon,
              height: 32.h,
              width: 34.h,
              color: appTheme.whiteA700,
            ),
            activeIcon: CustomImageView(
              imagePath: bottomMenuList[index].activeIcon,
              height: 22.h,
              width: 28.h,
              color: appTheme.whiteA700,
            ),
            label: "",
          );
        }),
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
          widget.onChanged?.call(bottomMenuList[index].type);
        },
      ),
    );
  }
}

/// Put properties needed on Bottom Navigation Bar
// ignore: must_be_immutable
class BottomMenuModel {
  /// Set the icon to unselected state
  String icon;

  /// Set the icon to selected state
  String activeIcon;

  /// The identifier that will be called
  ButtomBarEnum type;

  BottomMenuModel({
    required this.icon,
    required this.activeIcon,
    required this.type,
  });
}

/// Default widget if you don't have any
class DefaultWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffffffff),
      padding: const EdgeInsets.all(10),
      child: const Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Please replace the respective Widget here',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
