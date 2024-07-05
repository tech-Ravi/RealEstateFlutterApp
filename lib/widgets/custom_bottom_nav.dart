import 'package:flutter/material.dart';
import 'package:flutter_real_estate_app/utils/asset_container.dart';
import 'package:flutter_real_estate_app/utils/colors.dart';

class CustomBottomNavBar extends StatefulWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;
  CustomBottomNavBar({required this.selectedIndex, required this.onItemTapped});

  @override
  _CustomBottomNavBarState createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    _selectedIndex = widget.selectedIndex;
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        // height: 80,

        margin: EdgeInsets.only(
          bottom: 15,
        ),
        decoration: BoxDecoration(
          color: AppColors.navBgBlack.withOpacity(0.9),
          borderRadius: BorderRadius.circular(40),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildNavItem(AssetConstants.icSearchOutlined, 0),
              _buildNavItem(AssetConstants.icChat, 1),
              _buildNavItem(AssetConstants.icHome, 2),
              _buildNavItem(AssetConstants.icFav, 3),
              _buildNavItem(AssetConstants.icPerson, 4),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(String icon_image, int index) {
    bool isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () => widget.onItemTapped(index),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: Container(
          width: isSelected ? 50 : 48,
          height: isSelected ? 50 : 48,
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
              color: isSelected
                  ? AppColors.tertiaryOrange
                  : AppColors.secondryBlack,
              borderRadius: const BorderRadius.all(
                Radius.circular(40),
              )),
          child: Image.asset(
            icon_image,
            color: Colors.white,
          ),

          // Icon(
          //   icon,
          //   color: Colors.white,
          //   size: 28,
          // ),
        ),
      ),
    );
  }
}
