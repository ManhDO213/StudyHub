import 'package:du_an_fpt/configs/colors.dart';
import 'package:du_an_fpt/configs/images.dart';
import 'package:du_an_fpt/configs/string.dart';
import 'package:du_an_fpt/ui/dash_board/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  GlobalKey key = GlobalKey();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
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
      key: _scaffoldKey,
      backgroundColor: AppColors.sPrimaryColor,
      drawer: drawerMenu(),
      body: SafeArea(
        child: Column(
          children: [
            _selectedIndex == 0
                ? Padding(
                    padding:
                        EdgeInsets.only(left: 24.w, right: 24.w, top: 12.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            _scaffoldKey.currentState!.openDrawer();
                          },
                          child: Image.asset(
                            AppImages.imgDrawMenu,
                            height: 30.h,
                            width: 30.w,
                            fit: BoxFit.cover,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Image.asset(
                            AppImages.imgBell,
                            height: 30.h,
                            width: 30.w,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  )
                : SizedBox(),
            Expanded(child: pages[_selectedIndex]),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: AppColors.greenM,
        backgroundColor: AppColors.kPrimaryColor,
        iconSize: 34.sp,
        unselectedFontSize: 16,
        selectedFontSize: 16,
        selectedLabelStyle: const TextStyle(
          fontFamily: 'Rubik',
          fontWeight: FontWeight.w700,
        ),
        unselectedLabelStyle: const TextStyle(
          fontFamily: 'Rubik',
          fontWeight: FontWeight.w700,
        ),
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: AppStrings.stgHome,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: AppStrings.stgProfile,
          ),
        ],
      ),
    );
  }

  Widget drawerMenu() {
    return Drawer(
        backgroundColor: AppColors.green,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              // decoration: BoxDecoration(
              //   color: Colors.blue,
              // ),
              child: Text(
                'Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                // Navigate to home screen
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                // Navigate to settings screen
              },
            ),
            ListTile(
              leading: const Icon(Icons.help),
              title: const Text('Help'),
              onTap: () {
                // Navigate to help screen
              },
            ),
          ],
        ));
  }
}
