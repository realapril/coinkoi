import 'package:coinkoi/screen/calculator_screen.dart';
import 'package:coinkoi/screen/more_screen.dart';
import 'package:coinkoi/screen/portfolio_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class Home extends StatelessWidget {
  final BottomNavController navController = Get.put(BottomNavController());
  final List<Widget> bodyContent=[
    const PortfolioScreen(),
    const CalculatorScreen(),
    const MoreScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
          ()=>Center(
            child: bodyContent.elementAt(navController.selectedIndex),
          )
      ),
      bottomNavigationBar: Obx(
        ()=>BottomNavigationBar(
          selectedItemColor: const Color(0xFFcc5533),
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: 'Portfolio',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calculate_sharp),
              label: 'Calculator',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.keyboard_control),
              label: 'More',
            )
          ],
          currentIndex: navController.selectedIndex,
          onTap: (index)=> navController.selectedIndex = index,
        )
      ),
    );
  }
}

class BottomNavController extends GetxController {
  final _selectedIndex = 0.obs;

  get selectedIndex => _selectedIndex.value;
  set selectedIndex(index) => _selectedIndex.value= index;

}