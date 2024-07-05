import 'package:countup/countup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_real_estate_app/utils/asset_container.dart';
import 'package:flutter_real_estate_app/utils/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent, // Color for Android
        statusBarBrightness:
            Brightness.dark // Dark == white status bar -- for IOS.
        ));
    return Scaffold(
      //backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Container(
            // margin: EdgeInsets.only(top: 60),
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              // tileMode: TileMode.clamp,
              stops: const [0.0, 0.5, 1.0],
              colors: [
                Colors.white.withOpacity(0.0),
                AppColors.tertiaryOrange.withOpacity(0.2),
                AppColors.tertiaryOrange.withOpacity(0.5),
              ],
            )),
          ),
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Wrap(direction: Axis.horizontal, spacing: 10, children: [
              Container(
                margin: const EdgeInsets.only(top: 60),
                // padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                // width: MediaQuery.of(context).size.width * 0.5,

                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      offset: const Offset(0.0, 1.0), //(x,y)
                                      blurRadius: 6.0,
                                    ),
                                  ],
                                ),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      height: 20,
                                      child: Image.asset(
                                        AssetConstants.icLocation,
                                        color: AppColors.secondary,
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      'Saint Petersburg',
                                      style: GoogleFonts.poppins(
                                        textStyle: const TextStyle(
                                            color: AppColors.secondary,
                                            fontSize: 12,
                                            fontWeight: FontWeight.normal),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.9),
                                      offset: const Offset(0.0, 1.0), //(x,y)
                                      blurRadius: 6.0,
                                    ),
                                  ],
                                ),
                                child: const CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      'https://media.istockphoto.com/id/1393872009/photo/african-american-man-with-african-hairstyle-standing-over-isolated-pink-background.jpg?s=2048x2048&w=is&k=20&c=YVvb6OWQwo_VxBjRCT0W3zXJ3q_Oz6kn9NSmC6zc0Y4='),
                                ),
                              ),
                              // SizedBox(width: 16),
                            ],
                          ),
                          const SizedBox(height: 50),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Hi, Marina',
                              //textAlign: TextAlign.right,
                              style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.normal,
                                    color: AppColors.secondary),
                              ),
                            ),
                          ),
                          Text(
                            'let\'s select your perfect place',
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  fontSize: 35, color: Colors.black),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                height: 150,
                                width: 150,
                                decoration: BoxDecoration(
                                    color: AppColors.tertiaryOrange,
                                    borderRadius: BorderRadius.circular(100)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'BUY',
                                      style: GoogleFonts.poppins(
                                        textStyle: const TextStyle(
                                            fontSize: 16, color: Colors.white),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Countup(
                                      begin: 100,
                                      end: 1030,
                                      duration: const Duration(seconds: 3),
                                      separator: '',
                                      style: GoogleFonts.poppins(
                                        textStyle: const TextStyle(
                                            fontSize: 36, color: Colors.white),
                                      ),
                                    ),
                                    Text(
                                      'offer',
                                      style: GoogleFonts.poppins(
                                        textStyle: const TextStyle(
                                            fontSize: 14, color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 150,
                                width: 150,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'RENT',
                                      style: GoogleFonts.poppins(
                                        textStyle: const TextStyle(
                                            fontSize: 16,
                                            color: AppColors.secondary),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Countup(
                                        begin: 100,
                                        end: 2212,
                                        duration: const Duration(seconds: 3),
                                        separator: '',
                                        style: GoogleFonts.poppins(
                                          textStyle: const TextStyle(
                                              fontSize: 36,
                                              color: AppColors.secondary),
                                        )),
                                    Text('offer',
                                        style: GoogleFonts.poppins(
                                          textStyle: const TextStyle(
                                              fontSize: 14,
                                              color: AppColors.secondary),
                                        )),
                                  ],
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 16),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30))),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                Container(
                                  height: 200,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                      color: Colors.amber.withOpacity(0.2),
                                      image: const DecorationImage(
                                        image: NetworkImage(
                                            'https://images.unsplash.com/photo-1560184897-67f4a3f9a7fa?q=80&w=2071&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
                                        fit: BoxFit.fill,
                                      ),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(25))),
                                ),
                                customButtonOverCardView(
                                    context, 'Gladkova St. 25', true)
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  child: Stack(
                                    alignment: Alignment.bottomCenter,
                                    children: [
                                      Container(
                                        height: 310,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                            color:
                                                Colors.amber.withOpacity(0.2),
                                            image: const DecorationImage(
                                              image: NetworkImage(
                                                  'https://images.unsplash.com/photo-1502005097973-6a7082348e28?q=80&w=3387&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
                                              fit: BoxFit.fill,
                                            ),
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(25))),
                                      ),
                                      Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: customButtonOverCardView(
                                              context, 'Klad St. 5', false))
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  children: [
                                    Container(
                                      height: 150,
                                      width: MediaQuery.of(context).size.width *
                                          0.4,
                                      child: Stack(
                                        children: [
                                          Container(
                                            height: 150,
                                            decoration: BoxDecoration(
                                                color: Colors.amber
                                                    .withOpacity(0.1),
                                                image: const DecorationImage(
                                                  image: NetworkImage(
                                                      'https://plus.unsplash.com/premium_photo-1711464867479-a7401b18eea9?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDV8fHByb3BlcnR5fGVufDB8fDB8fHww'),
                                                  fit: BoxFit.fill,
                                                ),
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(20))),
                                          ),
                                          Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10),
                                              child: customButtonOverCardView(
                                                  context, 'AB St. 1', false))
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    SizedBox(
                                      height: 150,
                                      width: MediaQuery.of(context).size.width *
                                          0.4,
                                      child: Stack(
                                        children: [
                                          Container(
                                            height: 150,
                                            decoration: BoxDecoration(
                                                color: Colors.amber
                                                    .withOpacity(0.1),
                                                image: const DecorationImage(
                                                  image: NetworkImage(
                                                      'https://images.unsplash.com/photo-1494526585095-c41746248156?q=80&w=3270&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
                                                  fit: BoxFit.fill,
                                                ),
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(20))),
                                          ),
                                          Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10),
                                              child: customButtonOverCardView(
                                                  context, 'DC St. 1', false))
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 80,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }

  Widget customButtonOverCardView(
      BuildContext context, String strBtnTitle, bool isLargeCard) {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Container(
              height: 50,
              width: MediaQuery.of(context).size.width * 0.9,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: AppColors.cardBtnBG.withOpacity(0.9),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      offset: const Offset(0.0, 1.0), //(x,y)
                      blurRadius: 6.0,
                    ),
                  ],
                  borderRadius: const BorderRadius.all(Radius.circular(25))),
              child: Stack(
                children: [
                  Align(
                    alignment:
                        (isLargeCard) ? Alignment.center : Alignment.centerLeft,
                    child: Padding(
                      padding: isLargeCard
                          ? const EdgeInsets.all(0)
                          : const EdgeInsets.only(left: 20.0),
                      child: Text(
                        strBtnTitle,
                        style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                          color: AppColors.secondryBlack,
                        )),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 4.0),
                      child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  offset: const Offset(0.0, 1.0), //(x,y)
                                  blurRadius: 6.0,
                                ),
                              ],
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(25))),
                          child: Image.asset(
                            AssetConstants.icRight,
                            color: AppColors.navBgBlack,
                            scale: 10,
                          )),
                    ),
                  ),
                ],
              )),
        ));
  }
}
