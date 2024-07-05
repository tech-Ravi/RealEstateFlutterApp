import 'package:flutter/material.dart';
import 'package:flutter_real_estate_app/utils/colors.dart';
import 'package:flutter_real_estate_app/views/home_page.dart';
import 'package:flutter_real_estate_app/views/map_screen.dart';
import 'package:flutter_real_estate_app/widgets/custom_bottom_nav.dart';
import 'package:google_fonts/google_fonts.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 2;

  final List<Widget> _pages = [
    const MapScreen(),
    Container(
      alignment: Alignment.center,
      child: Text(
        'Chat Page\n#TODO',
        textAlign: TextAlign.center,
        style: GoogleFonts.poppins(
            textStyle: const TextStyle(
                color: AppColors.secondryBlack,
                fontSize: 14,
                fontWeight: FontWeight.bold)),
      ),
    ),
    HomePage(), // Placeholder for Chat
    Container(
        alignment: Alignment.center,
        child: Text(
          'Favourite Page\n#TODO',
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                  color: AppColors.secondryBlack,
                  fontSize: 14,
                  fontWeight: FontWeight.bold)),
        )), // Placeholder for Favorites
    Container(
      alignment: Alignment.center,
      child: Text(
        'Account Page\n#TODO',
        textAlign: TextAlign.center,
        style: GoogleFonts.poppins(
            textStyle: const TextStyle(
                color: AppColors.secondryBlack,
                fontSize: 14,
                fontWeight: FontWeight.bold)),
      ),
    ), // Placeholder for Profile
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      maintainBottomViewPadding: true,
      child: Scaffold(
        extendBody: true,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: _pages[_selectedIndex],
        bottomNavigationBar: CustomBottomNavBar(
            selectedIndex: _selectedIndex, onItemTapped: _onItemTapped),
      ),
    );
  }
}
