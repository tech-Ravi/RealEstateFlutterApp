import 'package:flutter/material.dart';
import 'package:flutter_real_estate_app/utils/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomDropdown extends StatefulWidget {
  const CustomDropdown({super.key});

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  final GlobalKey _buttonKey = GlobalKey();
  late OverlayEntry _overlayEntry;
  bool _isDropdownOpen = false;
  String _selectedOption = 'Price';

  List<Map<String, dynamic>> options = [
    {'label': 'Cosy areas', 'icon': Icons.shield_rounded},
    {'label': 'Price', 'icon': Icons.wallet_rounded},
    {'label': 'Infrastructure', 'icon': Icons.shopping_bag},
    {'label': 'Without any layer', 'icon': Icons.layers},
  ];

  void _toggleDropdown() {
    if (_isDropdownOpen) {
      _closeDropdown();
    } else {
      _openDropdown();
    }
  }

  void _openDropdown() {
    final RenderBox renderBox =
        _buttonKey.currentContext!.findRenderObject() as RenderBox;
    final Offset offset = renderBox.localToGlobal(Offset.zero);
    final Size size = renderBox.size;

    _overlayEntry = OverlayEntry(
      builder: (context) {
        return Positioned(
          left: offset.dx,
          top: offset.dy - (options.length * size.height),
          width: MediaQuery.of(context).size.width * 0.5,
          child: Material(
            color: Colors.transparent,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: options.map((option) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedOption = option['label'];
                      _closeDropdown();
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(11.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.vertical(
                        top: option == options.first
                            ? const Radius.circular(20.0)
                            : Radius.zero,
                        bottom: option == options.last
                            ? const Radius.circular(20.0)
                            : Radius.zero,
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          option['icon'],
                          color: _selectedOption == option['label']
                              ? AppColors.tertiaryOrange
                              : AppColors.btnColorGrey,
                          size: 20,
                        ),
                        const SizedBox(width: 10.0),
                        Text(option['label'],
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: _selectedOption == option['label']
                                      ? AppColors.tertiaryOrange
                                      : AppColors.btnColorGrey,
                                  fontSize: 13),
                            )),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        );
      },
    );

    Overlay.of(context).insert(_overlayEntry);
    setState(() {
      _isDropdownOpen = true;
    });
  }

  void _closeDropdown() {
    _overlayEntry.remove();
    setState(() {
      _isDropdownOpen = false;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _overlayEntry.remove();
    setState(() {
      _isDropdownOpen = false;
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: _buttonKey,
      onTap: _toggleDropdown,
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: AppColors.btnColorGrey.withOpacity(0.9),
            borderRadius: const BorderRadius.all(Radius.circular(30))),
        child: Row(
          children: [
            Icon(
              options.firstWhere(
                  (option) => option['label'] == _selectedOption)['icon'],
              color: Colors.white,
              size: 19,
            ),
          ],
        ),
      ),
    );
  }
}
