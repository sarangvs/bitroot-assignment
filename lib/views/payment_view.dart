import 'package:bitroot_test/utils/utils.dart';
import 'package:bitroot_test/widgets/custom_elevation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../themes/theme.dart';

class PaymentView extends StatelessWidget {
  final int index;
  final AssetImage person;
  const PaymentView({Key? key, required this.index, required this.person})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.secondaryColor,
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: SizedBox(
          height: Get.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: Utils.getScreenHeightByPercentage(1),
              ),
              Stack(
                children: [
                  Lottie.asset(
                    "assets/animation/payment-animation.json",
                  ),
                  Positioned(
                    bottom: Get.height * 0.17,
                    left: Get.width * 0.35,
                    child: Align(
                      alignment: Alignment.center,
                      child: Hero(
                        tag: "paymentView$index",
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 57,
                          child: CircleAvatar(
                            radius: 50,
                            backgroundImage: person,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    "Paying",
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Text(
                    "Marcus Cabatappi",
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Utils.getScreenHeightByPercentage(6),
                  ),
                  _customElevatedButtomWidget(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  CustomElevation _customElevatedButtomWidget() => CustomElevation(
        height: 50,
        child: ElevatedButton(
          onPressed: () async {
            Get.back();
          },
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            )),
            backgroundColor: MaterialStateProperty.all(Colors.white),
          ),
          child: Text(
            'Cancel Payment',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: AppTheme.secondaryDark,
            ),
          ),
        ),
      );
}
