import 'package:bitroot_test/themes/theme.dart';
import 'package:bitroot_test/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  late TextEditingController searchController;

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _headerCard(),
              SizedBox(height: Utils.getScreenHeightByPercentage(1)),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                child: _searchBarWidget(
                  controller: searchController,
                  hintText: "Search Settings",
                ),
              ),
              SizedBox(height: Utils.getScreenHeightByPercentage(0.9)),
              _itemTileWidget(
                icon: Icons.account_circle,
                itemName: "Personal Info",
              ),
              SizedBox(height: Utils.getScreenHeightByPercentage(0.9)),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Divider(
                  thickness: 1.5,
                  color: AppTheme.primaryColor,
                ),
              ),
              _itemTileWidget(
                icon: Icons.qr_code_scanner,
                itemName: "My QR Code",
              ),
              SizedBox(height: Utils.getScreenHeightByPercentage(0.5)),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Divider(
                  thickness: 1.5,
                  color: AppTheme.primaryColor,
                ),
              ),
              _itemTileWidget(
                icon: Icons.apartment,
                itemName: "Banks and Cards",
              ),
              SizedBox(height: Utils.getScreenHeightByPercentage(0.9)),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Divider(
                  thickness: 1.5,
                  color: AppTheme.primaryColor,
                ),
              ),
              _itemTileWidget(
                icon: Icons.folder_copy,
                itemName: "Payment Preferences ",
              ),
              SizedBox(height: Utils.getScreenHeightByPercentage(0.9)),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Divider(
                  thickness: 1.5,
                  color: AppTheme.primaryColor,
                ),
              ),
              _itemTileWidget(
                icon: Icons.replay,
                itemName: "Automatic Payments",
              ),
              SizedBox(height: Utils.getScreenHeightByPercentage(0.9)),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Divider(
                  thickness: 1.5,
                  color: AppTheme.primaryColor,
                ),
              ),
              _itemTileWidget(
                icon: Icons.logout,
                itemName: "Login and Security ",
              ),
              SizedBox(height: Utils.getScreenHeightByPercentage(0.9)),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Divider(
                  thickness: 1.5,
                  color: AppTheme.primaryColor,
                ),
              ),
              _itemTileWidget(
                icon: Icons.notifications,
                itemName: "Notifications ",
              ),
              SizedBox(height: Utils.getScreenHeightByPercentage(0.9)),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Divider(
                  thickness: 1.5,
                  color: AppTheme.primaryColor,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Padding _itemTileWidget({required IconData icon, required String itemName}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: AppTheme.primaryDark,
              ),
              SizedBox(width: Utils.getScreenWidthByPercentage(1)),
              Text(
                itemName,
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      fontWeight: FontWeight.w400, color: Colors.grey[700]),
                ),
              )
            ],
          ),
          const Icon(
            Icons.arrow_forward_ios,
            size: 18,
            color: AppTheme.secondaryColor,
          )
        ],
      ),
    );
  }

// header card widget
  Container _headerCard() => Container(
        color: AppTheme.primaryColor,
        height: Get.height / 3,
        width: Get.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: Utils.getScreenHeightByPercentage(2),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Text(
                  "Log Out",
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.w500,
                      color: AppTheme.secondaryColor,
                    ),
                  ),
                ),
              ),
              const Hero(
                tag: "profile",
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 53,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(
                      "assets/images/Image-section.png",
                    ),
                  ),
                ),
              ),
              SizedBox(height: Utils.getScreenHeightByPercentage(1)),
              Text(
                "Vaneesa",
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Text(
                "vaneesa@email.com",
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
      );

//Custom search bar widget
  TextField _searchBarWidget({
    required String hintText,
    required TextEditingController controller,
  }) =>
      TextField(
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.blue,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 13.0,
            horizontal: 8,
          ),
          fillColor: const Color(0xffedebeb),
          hintText: hintText,
          hintStyle: GoogleFonts.poppins(
            color: Colors.grey,
          ),
          filled: true,
        ),
      );
}
