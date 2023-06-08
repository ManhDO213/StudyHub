import 'package:du_an_fpt/configs/colors.dart';
import 'package:du_an_fpt/configs/string.dart';
import 'package:du_an_fpt/ui/dash_board/home_screen.dart';
import 'package:du_an_fpt/ui/login/login_screen.dart';
import 'package:flutter/material.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  GlobalKey key = GlobalKey();
  int _selectedIndex = 0;
  List<Widget> pages = [
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
  ];
  int totalUnseen = 0;
  double widthItemMessage = 18;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (pages.isEmpty) return Container();
    return Scaffold(
      backgroundColor: AppColors.kPrimaryColor,
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: AppColors.greenM,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: AppStrings.stgHome,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: AppStrings.stgSearch,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: AppStrings.stgProfile,
          ),
        ],
      ),
    );
  }
}
