import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';

class DrawerMenu extends StatefulWidget {
  const DrawerMenu({super.key});

  @override
  State<DrawerMenu> createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  PageController page = PageController();

  @override
  void initState() {
    sideMenu.addListener((p0) {
      page.jumpToPage(p0);
    });
    super.initState();
  }

  SideMenuController sideMenu = SideMenuController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          buildHeader(context),
          buildMenuItems(context),
        ],
      ),
    );
  }
}

Widget buildHeader(BuildContext context) => Container(
      color: Colors.deepPurpleAccent.shade100,
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
      ),
      child: Column(
        children: const [
           CircleAvatar(
            radius: 52,
            // backgroundImage: AssetImage('assets/Images/files.png'),
          ),
           SizedBox(
            height: 12,
          ),
           Text(
            'Aya Alsaity',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 12,
          ),
        ],
      ),
    );
Widget buildMenuItems(BuildContext context) => Container(
      padding: const EdgeInsets.all(24),
      child: Wrap(
        runSpacing: 16,
        children: [
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Home'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.perm_identity),
            title: const Text('Profile'),
            onTap: () {},
          ),
          const Divider(
            color: Colors.black54,
          ),
          ListTile(
            leading: const Icon(
              Icons.output,
              color: Colors.red,
            ),
            title: const Text('Log out'),
            onTap: () {},
          ),
        ],
      ),
    );
