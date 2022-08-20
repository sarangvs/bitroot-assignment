import 'package:bitroot_test/controllers/main_screen_view_controller.dart';
import 'package:bitroot_test/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainView extends StatelessWidget {
  MainView({Key? key}) : super(key: key);

  final controller = Get.put(MainScreenViewController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: controller.pages.elementAt(controller.selectedIndex),
      bottomNavigationBar:
          GetBuilder<MainScreenViewController>(builder: (controller) {
        return BottomNavigationBar(
          backgroundColor: Colors.white,
          unselectedItemColor: AppTheme.primaryDark,
          selectedFontSize: 12,
          unselectedLabelStyle: const TextStyle(color: AppTheme.primaryDark),
          showUnselectedLabels: false,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.dashboard,
                size: 20,
              ),
              label: 'Dashboard',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.qr_code_scanner,
                size: 20,
              ),
              label: 'Scan Receipt',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.folder_copy,
                size: 20,
              ),
              label: 'Send & Request',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle,
                size: 20,
              ),
              label: 'Settings',
            ),
          ],
          currentIndex: controller.selectedIndex,
          selectedItemColor: AppTheme.secondaryColor,
          onTap: controller.onItemTapped,
        );
      }),
    );
  }
}
