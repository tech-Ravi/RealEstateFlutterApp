import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_real_estate_app/utils/asset_container.dart';
import 'package:flutter_real_estate_app/utils/colors.dart';
import 'package:flutter_real_estate_app/widgets/custom_dropdown.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/services.dart';
import 'dart:ui' as ui;

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? _mapController;
  BitmapDescriptor? _customIcon;
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(59.9501, 30.3519),
    zoom: 12,
  );

  @override
  void initState() {
    super.initState();

    // rootBundle.loadString('assets/map_style.json').then((string) {
    // });
    _loadCustomIcon();
  }

  Future<void> _loadCustomIcon() async {
    _customIcon = await createCustomMarkerIcon();
    setState(() {});
  }

  @override
  void dispose() {
    _mapController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.transparent, // Color for Android
        statusBarBrightness:
            Brightness.light // Dark == white status bar -- for IOS.
        ));
    return Scaffold(
      backgroundColor: AppColors.navBgBlack,
      body: Stack(
        children: [
          _buildMap(),
          _buildSearchBar(),
          _buildListButton(),
          _buildBottomFloatingButton(),
        ],
      ),
    );
  }

  Widget _buildMap() {
    return FutureBuilder<String>(
      future:
          DefaultAssetBundle.of(context).loadString('assets/map_style.json'),
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        if (snapshot.hasData) {
          //print('Data:-' + snapshot.data!);
          return GoogleMap(
            initialCameraPosition: _kGooglePlex,
            mapType: MapType.normal,
            myLocationEnabled:
                false, // Disable the blue dot for user's location
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,
            compassEnabled: false,
            markers: _createMarkers(),
            onMapCreated: (GoogleMapController controller) {
              _mapController = controller;
              _mapController?.setMapStyle(snapshot.data);
              //_mapController?.setMapStyle(_mapStyle);
            },
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Future<BitmapDescriptor> createCustomMarkerIcon() async {
    final ByteData bytes = await rootBundle.load(AssetConstants.icBuilding);
    final Uint8List list = bytes.buffer.asUint8List();
    final ui.Codec codec = await ui.instantiateImageCodec(list,
        targetWidth: 120, targetHeight: 120);
    final ui.FrameInfo fi = await codec.getNextFrame();
    final data = await fi.image.toByteData(format: ui.ImageByteFormat.png);
    // ignore: deprecated_member_use
    return BitmapDescriptor.fromBytes(data!.buffer.asUint8List());
  }

  Set<Marker> _createMarkers() {
    if (_customIcon == null) {
      return {}; // Return empty set if icon isn't loaded yet
    }

    return {
      Marker(
        markerId: const MarkerId('location1'),
        position: const LatLng(59.9111, 30.3609),
        icon: _customIcon!,
      ),
      Marker(
        markerId: const MarkerId('location2'),
        position: const LatLng(59.9500, 30.3800),
        icon: _customIcon!,
      ),

      Marker(
        markerId: const MarkerId('location3'),
        position: const LatLng(59.9200, 30.3300),
        icon: _customIcon!,
      ),
      Marker(
        markerId: const MarkerId('location4'),
        position: const LatLng(59.9600, 30.3200),
        icon: _customIcon!,
      ),
      Marker(
        markerId: const MarkerId('location5'),
        position: const LatLng(59.9410, 30.3500),
        icon: _customIcon!,
      ),
      Marker(
        markerId: const MarkerId('location6'),
        position: const LatLng(59.9800, 30.3800),
        icon: _customIcon!,
      ),
      // Add more markers as needed
    };
  }

  Widget _buildSearchBar() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 60,
      margin: const EdgeInsets.only(top: 60),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.7,
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: TextField(
              textAlign: TextAlign.left,
              enabled: false,
              decoration: InputDecoration(
                hintText: 'Saint Petersburg',
                hintStyle: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        color: AppColors.secondryBlack, fontSize: 14)),
                prefixIcon: Image.asset(
                  AssetConstants.icSearchOutlined,
                  color: AppColors.navBgBlack,
                  scale: 2.5,
                ),

                // suffixIcon: Icon(Icons.tune),
                border: InputBorder.none,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(30)),
            child: const Icon(
              Icons.tune,
              color: AppColors.secondryBlack,
              size: 20,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildListButton() {
    return Positioned(
      bottom: 90,
      right: 20,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 10),
        decoration: BoxDecoration(
            color: AppColors.btnColorGrey.withOpacity(0.9),
            borderRadius: const BorderRadius.all(Radius.circular(20))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              AssetConstants.icList,
              color: Colors.white,
              scale: 3,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              'List of variants',
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomFloatingButton() {
    return Positioned(
      bottom: 80,
      left: 10,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const CustomDropdown(),
            const SizedBox(
              height: 5,
            ),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: AppColors.btnColorGrey.withOpacity(0.9),
                  borderRadius: const BorderRadius.all(Radius.circular(30))),
              child: Image.asset(
                AssetConstants.icNavigation,
                color: Colors.white.withOpacity(0.7),
                scale: 5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
