import 'package:badges/badges.dart';
import 'package:bitroot_test/controllers/home_view_controller.dart';
import 'package:bitroot_test/themes/theme.dart';
import 'package:bitroot_test/utils/utils.dart';
import 'package:bitroot_test/views/payment_view.dart';
import 'package:bitroot_test/views/profile_view.dart';
import 'package:bitroot_test/views/search_screen_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late TextEditingController searchController;

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
  }

  final controller = Get.put(HomeViewController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: Theme.of(context).primaryColor,
                height: Get.height / 1.82,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _notificationBadge(),
                      _profileHeader(),
                      SizedBox(height: Utils.getScreenHeightByPercentage(2)),
                      _showBalanceCard(),
                      SizedBox(height: Utils.getScreenHeightByPercentage(2)),
                      Text(
                        "Send Again",
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(height: Utils.getScreenHeightByPercentage(1)),
                      _recentTransactionsList(controller)
                    ],
                  ),
                ),
              ),
              SizedBox(height: Utils.getScreenHeightByPercentage(3)),
              Hero(
                tag: "Search",
                child: Material(
                  child: InkWell(
                    onTap: () => Get.to(() => const SearchView()),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: _searchBarWidget(
                        controller: searchController,
                        hintText: "Search Transactions",
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: Utils.getScreenHeightByPercentage(3)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Your Activity",
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const Icon(
                      Icons.menu,
                      color: AppTheme.secondaryColor,
                    )
                  ],
                ),
              ),
              ...List.generate(
                controller.itemCount,
                (index) => Column(
                  children: [
                    _yourActivityList(),
                    if (index != controller.itemCount - 1)
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24),
                        child: Divider(
                          thickness: 1,
                          color: AppTheme.primaryDark,
                        ),
                      )
                  ],
                ),
              ).toList(),
            ],
          ),
        ),
      ),
    );
  }

// Your Activity Widget
  Column _yourActivityList() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: Utils.getScreenHeightByPercentage(2)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Apple Macbook pro 16'-silver",
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Text(
                  "\$3,234.03",
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              "Apple Store",
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          SizedBox(height: Utils.getScreenHeightByPercentage(0.5)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              "Return Time Remaining 2 Weeks",
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                  fontSize: 14,
                  color: AppTheme.primaryDark,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(height: Utils.getScreenHeightByPercentage(0.5)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              "1324 Colorado Street,Suite 32-92003",
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                  fontSize: 14,
                  color: AppTheme.primaryDark,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(height: Utils.getScreenHeightByPercentage(0.5)),
        ],
      );

// Custom Search Bar Widget
  TextField _searchBarWidget({
    required String hintText,
    required TextEditingController controller,
  }) =>
      TextField(
        enabled: false,
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.search,
            color: AppTheme.secondaryColor,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 13.0,
            horizontal: 8,
          ),
          fillColor: AppTheme.primaryColor,
          hintText: hintText,
          hintStyle: GoogleFonts.poppins(
            color: AppTheme.primaryDark,
          ),
          filled: true,
        ),
      );
}

// List of Recent Transcations
Expanded _recentTransactionsList(HomeViewController controller) => Expanded(
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: controller.personsPicture.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              Hero(
                tag: "paymentView$index",
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () => Get.to(() => PaymentView(
                          index: index,
                          person: controller.personsPicture[index],
                        )),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 33,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 30,
                        backgroundImage: controller.personsPicture[index],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: Utils.getScreenHeightByPercentage(1)),
              Text(
                "Jhony",
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 11,
                    color: Colors.grey[700],
                  ),
                ),
              ),
              Text(
                "Chimpo",
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 11,
                    color: Colors.grey[700],
                  ),
                ),
              )
            ],
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(width: Utils.getScreenWidthByPercentage(2));
        },
      ),
    );

// Card for showing the remaining balanace
Container _showBalanceCard() => Container(
      padding: const EdgeInsets.all(12),
      height: Utils.getScreenHeightByPercentage(15),
      width: Utils.getScreenWidthByPercentage(100),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "\$204.05",
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const Text("Your Balance")
            ],
          ),
          SizedBox(width: Utils.getScreenWidthByPercentage(5)),
          const VerticalDivider(
            color: AppTheme.primaryDark,
            thickness: 1,
          ),
          SizedBox(width: Utils.getScreenWidthByPercentage(5)),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "30",
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        color: AppTheme.secondaryColor,
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const Text("Last Days")
                ],
              ),
              const Icon(
                Icons.arrow_drop_down,
                size: 30,
                color: AppTheme.secondaryColor,
              )
            ],
          ),
        ],
      ),
    );

// Profile Header
Row _profileHeader() => Row(
      children: [
        Hero(
          tag: "profile",
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () => Get.to(() => const ProfileView()),
              child: const CircleAvatar(
                backgroundColor: Colors.white,
                radius: 33,
                child: CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(
                    "assets/images/Image-section.png",
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: Utils.getScreenWidthByPercentage(2)),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hi Vaneesa",
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                fontWeight: FontWeight.w600,
              )),
            ),
            Text(
              "Here's your spending dashboard",
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                  fontWeight: FontWeight.w300,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        )
      ],
    );

// Custom Notification Icon Widget
Row _notificationBadge() => Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: Badge(
            badgeColor: Colors.redAccent,
            padding: const EdgeInsets.all(8),
            badgeContent: const Text(
              "2",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            child: IconButton(
              icon: const Icon(
                Icons.notifications,
                color: Colors.grey,
                size: 30,
              ),
              onPressed: () {},
            ),
          ),
        )
      ],
    );
