import 'package:flutter/material.dart';
import 'package:sales_app/routes/routes.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const _DrawerHeader(),
          ListTile(
            leading: const Icon(Icons.pages_outlined),
            title: const Text('Principal'),
            onTap: () =>
                Navigator.pushReplacementNamed(context, AppRoutes.homeScreen),
          ),
          ListTile(
            leading: const Icon(Icons.people_outlined),
            title: const Text('Personal'),
            onTap: () =>
                Navigator.pushReplacementNamed(context, AppRoutes.staffScreen),
          ),
          ListTile(
            leading: const Icon(Icons.settings_outlined),
            title: const Text('Settings'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class _DrawerHeader extends StatelessWidget {
  const _DrawerHeader({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(ImageRoutes.menu),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(),
    );
  }
}
