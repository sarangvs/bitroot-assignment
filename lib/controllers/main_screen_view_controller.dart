import 'package:bitroot_test/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreenViewController extends GetxController {
  int selectedIndex = 0;
  List<Widget> pages = [
    const HomeView(),
  ];

  void onItemTapped(int index) {
    selectedIndex = index;
    update();
  }
}
