import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unimap_admin/controllers/bottom_nav_controller.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  BottomNavController controller = Get.put(BottomNavController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(


          backgroundColor: Colors.deepPurple,

          title: const Text('Uni Map Admin'),
          // actions: [
          //   IconButton(
          //     onPressed: (){ Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //           builder: (context) => const NotificationScreen()),
          //     );},
          //     icon: const Icon(Icons.notifications),
          //   )
          // ],
        ),
        body: Obx(() => IndexedStack(
          index: controller.selectedIndex,
          children: controller.screens,
        )),
        bottomNavigationBar:Obx(()=> BottomNavigationBar(
          currentIndex: controller.selectedIndex,
          onTap: (index) {
            controller.changeIndex(index);
          },
          backgroundColor: Colors.deepPurple,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white.withOpacity(.60),
          selectedFontSize: 14,
          unselectedFontSize: 14,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard_customize_outlined),
              label: 'Dashboard',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.update),
              label: 'Updates',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ))
    );
  }
}
