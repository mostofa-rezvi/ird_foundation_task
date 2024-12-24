import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ird_foundation/pages/HomeScreen.dart';
import 'package:ird_foundation/pages/HouseDetails.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Navigation Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      getPages: [
        GetPage(name: '/', page: () => HomeScreen()),
        GetPage(name: '/propertyDetails', page: () => PropertyDetailsPage()),
      ],
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Get.to(HomeScreen());
          },
          child: Text('Go to Home Page'),
        ),
      ),
    );
  }
}


class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.blueAccent,
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.lightBlueAccent,
              ),
              child: Center(
                child: Text(
                  'Menu',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            _buildDrawerItem(
              context,
              icon: Icons.home,
              text: 'Home',
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomeScreen())),
            ),
            _buildDrawerItem(
              context,
              icon: Icons.person,
              text: 'Profile',
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BlackPage(title: 'Profile'))),
            ),
            _buildDrawerItem(
              context,
              icon: Icons.location_on,
              text: 'Nearby',
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BlackPage(title: 'Nearby'))),
            ),
            Divider(color: Colors.white70),
            _buildDrawerItem(
              context,
              icon: Icons.bookmark,
              text: 'Bookmark',
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BlackPage(title: 'Bookmark'))),
            ),
            _buildDrawerItem(
              context,
              icon: Icons.notifications,
              text: 'Notification',
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BlackPage(title: 'Notification'))),
            ),
            _buildDrawerItem(
              context,
              icon: Icons.message,
              text: 'Message',
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BlackPage(title: 'Message'))),
            ),
            Divider(color: Colors.white70),
            _buildDrawerItem(
              context,
              icon: Icons.settings,
              text: 'Setting',
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BlackPage(title: 'Setting'))),
            ),
            _buildDrawerItem(
              context,
              icon: Icons.help,
              text: 'Help',
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BlackPage(title: 'Help'))),
            ),
            _buildDrawerItem(
              context,
              icon: Icons.logout,
              text: 'Logout',
              onTap: () {
                Navigator.pop(context);
              },
            ),
            Divider(color: Colors.white70),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem(BuildContext context,
      {required IconData icon, required String text, required Function onTap}) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(
        text,
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
      onTap: () => onTap(),
    );
  }
}

class BlackPage extends StatelessWidget {
  final String title;

  BlackPage({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.lightBlueAccent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
