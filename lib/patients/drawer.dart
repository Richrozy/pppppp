
import 'package:flutter/material.dart';
import 'package:telemedicine/videocall/video_home.dart';
import 'package:telemedicine/patients/view_doctors.dart';

class DrawerMenu extends StatefulWidget {
  const DrawerMenu({super.key});

  @override
  State<DrawerMenu> createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 26, 23, 23),
              ),
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Color.fromARGB(255, 26, 23, 23)),
                accountName: Text(
                  "Ampeire Richard",
                  style: TextStyle(fontSize: 18),
                ),
                accountEmail: Text("richrozy670@gmail.com"),
                currentAccountPictureSize: Size.square(50),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 255, 253, 137),
                  child: Text(
                    "A",
                    style: TextStyle(fontSize: 30.0, color: Colors.blue),
                  ),
                ),
              ),
            ),
             ListTile(
              leading: const Icon(Icons.person),
              title: const Text(' View Profile '),
              onTap: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfilePage()));
              },
            ), 
            ListTile(
              leading: const Icon(Icons.video_camera_front_outlined),
              title: const Text(' Video Chat '),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => videoHome()));              },
            ),
            ListTile(
              leading: const Icon(Icons.library_books_sharp),
              title: const Text(' Appointments '),
              onTap: () {
                //  Navigator.push(context, MaterialPageRoute(builder: (context) => const Signup()));
              },
            ),
            
            ListTile(
              leading: const Icon(Icons.monetization_on),
              title: const Text(' Payments '),
              onTap: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context) => const Tracker()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.online_prediction_sharp),
              title: const Text(' Text Chat '),
              onTap: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context) => const Geofence()));
              },
            ),
            const Divider(color: Colors.black,),
            ListTile(
              leading: const Icon(Icons.health_and_safety),
              title: const Text(' View Doctors '),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => viewDoctors()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('LogOut'),
              onTap: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()));
              },
            ),
          ],
        ),
      
    );
  }
}