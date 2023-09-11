import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:setting_screen/Screens/SecondScreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});


  @override
  State<MainScreen> createState() => _MainScreenState();
}
Query dbRef = FirebaseDatabase.instance.ref().child('');


class _MainScreenState extends State<MainScreen> {

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: height*0.06),
                    margin: EdgeInsets.all(width*0.04),
                    child: Text('Settings',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: height*0.04,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(left: width*0.017, right: width*0.027, bottom: height*0.03),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(height * 0.02),
                  color: Colors.grey.shade300,
                ),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: (){},
                      icon: Icon(EvaIcons.search,
                        color: Colors.grey,
                        size: height * 0.04,
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search',
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: height * 0.03,
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: (){},
                      icon: Icon(EvaIcons.mic,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              ///1st Card
              Container(
                height: height*0.21,
                width: width*10,
                child: Card(
                  elevation: 0,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(height*0.02), // Rounded corners
                  ),
                  margin: EdgeInsets.only(left: width * 0.02, right: height * 0.013),
                  // Add horizontal margin
                  child: Container(
                    padding: EdgeInsets.all(height*0.02),
                    child: FirebaseAnimatedList(
                      query: dbRef,
                      itemBuilder: (context, snapshot, animation, index) {
                        return  Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: const Color(0xFF9195A1),
                                      radius: height*0.05,
                                      child: Text(
                                        snapshot.child('firstName').value.toString()[0] +snapshot.child('lastName').value.toString()[0],
                                        style: TextStyle(fontSize: height*0.05, color: Colors.white),
                                      ),
                                    ),
                                    SizedBox(width: width*0.01), // Add space between the CircleAvatar and the Column
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${snapshot.child('firstName').value} ${snapshot.child('lastName').value}" ,
                                          style: TextStyle(color: Colors.black, fontSize: height * 0.03),
                                        ),
                                        Text(
                                          'Apple ID, iCloud+, Media',
                                          style: TextStyle(color: Colors.black, fontSize: height * 0.02),
                                        ),
                                        Text(
                                          '& Purchases',
                                          style: TextStyle(color: Colors.black, fontSize: height * 0.02),
                                        ),
                                      ],
                                    ),
                                    Spacer(), // Add spacer to push the chevron icon to the right
                                    Icon(Icons.arrow_forward_ios, color: Colors.grey[300], size: 18,), // Chevron icon on the right
                                  ],
                                ),
                                Positioned(
                                  top: 67, // Adjust the vertical position as needed
                                  left: 79, // Adjust the horizontal position as needed
                                  right: 0, // Adjust the horizontal position as needed
                                  child: Divider(
                                    color: Colors.grey[200],
                                    thickness: 01.0, // Change this to the desired thickness
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: height*0.03), // Add vertical spacing
                            Row(
                              children: [
                                Expanded(
                                  child: Text('iPhone Not Backed Up', style: TextStyle(fontSize: 16,),), // Text with red circle
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    shape: BoxShape.circle,
                                  ),
                                  padding: EdgeInsets.all(height*0.008),
                                  child: Text(
                                    '1',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                SizedBox(width: height*0.01), // Add space between circle and icon
                                Icon(Icons.arrow_forward_ios, color: Colors.grey[300], size: 18,), // Chevron icon on the right
                              ],
                            ),
                          ],
                        );
                      },
                    ),// Add padding to the container
                  ),
                ),
              ),
              SizedBox(height: 36),
              ///2nd Card
              Padding(
                padding: EdgeInsets.only(left: width * 0.01, right: width * 0.01),
                child: Container(
                  height: height*0.075, // Set your desired height here
                  child: Card(
                      elevation: 0,
                    color: Colors.white,
                   // margin: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(height * 0.02), // Rounded corners
                    ),
                    margin: EdgeInsets.only(left: width*0.01,right: width*0.02),
                    child: Container(
                      margin: EdgeInsets.all(height * 0.02),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Finish Setting Up Your iPhone',
                              style: TextStyle(fontSize: 16.0),
                            ), // Text with red circle
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                            padding: EdgeInsets.all(height * 0.008),
                            child: Text(
                              '1',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(width: height * 0.01), // Add space between circle and icon
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.grey[300],
                            size: 18,
                          ), // Chevron icon on the right
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 36),
              ///3nd Card
              Card(
                elevation: 0,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(height*0.02), // Rounded corners
                ),
                margin: EdgeInsets.only(left: width * 0.02, right: width*0.03),
                child: Container(
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          ListTile(
                            title: Text('Airplane Mode', style: TextStyle(color: Colors.black)),
                            leading: Container(
                              width: 40, // Adjust the width as needed
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.orange, // Orange color for the card
                                borderRadius: BorderRadius.all(Radius.circular(height*0.01)), // Rounded corners
                              ),
                              child: Center(
                                child: Image.asset('Assets/image/plane1.png',
                                  height: height*0.04,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            trailing: CupertinoSwitch(
                              value: false,
                              onChanged: (value) {},
                              activeColor: Colors.blue, // Change this to the desired active color
                            ),
                          ),
                          Positioned(
                            top: height*0.06, // Adjust the vertical position as needed
                            left: width*0.2, // Adjust the horizontal position as needed
                            right: 0, // Adjust the horizontal position as needed
                            child: Divider(
                              color: Colors.grey[200],
                              thickness: 01.0, // Change this to the desired thickness
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        children:[
                          ListTile(
                            title: Text('Wi-Fi', style: TextStyle(color: Colors.black)),
                            leading: Container(
                              width: 40, // Adjust the width as needed
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.blue, // Blue color for the card
                                borderRadius: BorderRadius.all(Radius.circular(height*0.01)), // Rounded corners
                              ),
                              child: Icon(Icons.wifi, color: Colors.white),
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Off',
                                  style: TextStyle(color: Colors.grey[300], fontSize: 18, fontWeight: FontWeight.w500),
                                ),
                                SizedBox(width: 8),
                                Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey[300]),
                              ],
                            ),
                            onTap: () {},
                          ),
                          Positioned(
                            top: height*0.05, // Adjust the vertical position as needed
                            left: width*0.2, // Adjust the horizontal position as needed
                            right: 0, // Adjust the horizontal position as needed
                            child: Divider(
                              color: Colors.grey[200],
                              thickness: 01.0, // Change this to the desired thickness
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          ListTile(
                            title: Text('Bluetooth', style: TextStyle(color: Colors.black)),
                            leading: Container(
                              width: 40, // Adjust the width as needed
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.blue, // Blue color for the card
                                borderRadius: BorderRadius.all(Radius.circular(height*0.01)), // Rounded corners
                              ),
                              child: Icon(Icons.bluetooth, color: Colors.white),
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'on',
                                  style: TextStyle(color: Colors.grey[300], fontSize: 18, fontWeight: FontWeight.w500),
                                ),
                                SizedBox(width: 8),
                                Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey[300]),
                              ],
                            ),
                            onTap: () {},
                          ),
                          Positioned(
                            top: height*0.05, // Adjust the vertical position as needed
                            left: width*0.2, // Adjust the horizontal position as needed
                            right: 0, // Adjust the horizontal position as needed
                            child: Divider(
                              color: Colors.grey[200],
                              thickness: 01.0, // Change this to the desired thickness
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          ListTile(
                            title: Text('Cellular', style: TextStyle(color: Colors.black)),
                            leading: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: Colors.green[300],
                                borderRadius: BorderRadius.circular(height*0.01),
                              ),
                              child: Icon(EvaIcons.radio, color: Colors.white),
                            ),
                            trailing: Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey[300]),
                            onTap: () {},
                          ),
                          Positioned(
                            top: height*0.05, // Adjust the vertical position as needed
                            left: width*0.2, // Adjust the horizontal position as needed
                            right: 0, // Adjust the horizontal position as needed
                            child: Divider(
                              color: Colors.grey[200],
                              thickness: 01.0, // Change this to the desired thickness
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          ListTile(
                            title: Text('Personal Hotspot', style: TextStyle(color: Colors.black)),
                            leading: Container(
                              width: 40, // Adjust the width as needed
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.green[300], // Blue color for the card
                                borderRadius: BorderRadius.all(Radius.circular(height*0.01)), // Rounded corners
                              ),
                              child: Center(
                                child: Image.asset('Assets/image/hotpot.png', color: Colors.white,
                                  width: 30,
                                  height: 30,
                                ),
                              ),
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Off',
                                  style: TextStyle(color: Colors.grey[300], fontSize: 18, fontWeight: FontWeight.w500),
                                ),
                                SizedBox(width: 8),
                                Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey[300]),
                              ],
                            ),
                            onTap: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 36),
              ///4th Card
              Card(
                elevation: 0,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(height*0.02), // Rounded corners
                ),
                margin: EdgeInsets.only(left: width * 0.02, right: width*0.03),
                child: Container(
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          ListTile(
                            title: Text('Notifications', style: TextStyle(color: Colors.black)),
                            leading: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(height*0.01),
                              ),
                              child: Image.asset('Assets/image/notification.jpg',),
                            ),
                            trailing: Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey[300]),
                            onTap: () {},
                          ),
                          Positioned(
                            top: height*0.05, // Adjust the vertical position as needed
                            left: width*0.2, // Adjust the horizontal position as needed
                            right: 0, // Adjust the horizontal position as needed
                            child: Divider(
                              color: Colors.grey[200],
                              thickness: 01.0, // Change this to the desired thickness
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          ListTile(
                            title: Text('Sounds & Haptics', style: TextStyle(color: Colors.black)),
                            leading: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: Colors.green[400],
                                borderRadius: BorderRadius.circular(height*0.01),
                              ),
                              child: Center(
                                  child: Image.asset('Assets/image/vol.png', color: Colors.white,
                                    width: 30,
                                    height: 30,
                                  )),
                            ),
                            trailing: Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey[300]),
                            onTap: () {},
                          ),
                          Positioned(
                            top: height*0.05, // Adjust the vertical position as needed
                            left: width*0.2, // Adjust the horizontal position as needed
                            right: 0, // Adjust the horizontal position as needed
                            child: Divider(
                              color: Colors.grey[200],
                              thickness: 01.0, // Change this to the desired thickness
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          ListTile(
                            title: Text('Focus', style: TextStyle(color: Colors.black)),
                            leading: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: Colors.blue[600],
                                borderRadius: BorderRadius.circular(height*0.01),
                              ),
                              child: Icon(EvaIcons.moon, color: Colors.white),
                            ),
                            trailing: Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey[300]),
                            onTap: () {},
                          ),
                          Positioned(
                            top: height*0.05, // Adjust the vertical position as needed
                            left: width*0.2, // Adjust the horizontal position as needed
                            right: 0, // Adjust the horizontal position as needed
                            child: Divider(
                              color: Colors.grey[200],
                              thickness: 01.0, // Change this to the desired thickness
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          ListTile(
                            title: Text('Screen Time', style: TextStyle(color: Colors.black)),
                            leading: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(height*0.01),
                              ),
                              child: Image.asset('Assets/image/glass.jpg',),
                            ),
                            trailing: Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey[300]),
                            onTap: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 36),
              ///5th Card
              Card(
                elevation: 0,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0), // Rounded corners
                ),
                margin: EdgeInsets.only(left: width * 0.02, right: width*0.03),
                child: Container(
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          ListTile(
                            title: Text('General', style: TextStyle(color: Colors.black)),
                            leading: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Image.asset('Assets/image/set.png', color: Colors.white,),
                            ),
                            trailing: Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey[300]),
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>SecondScreen()));
                            },
                          ),
                          Positioned(
                            top: 38, // Adjust the vertical position as needed
                            left: 70, // Adjust the horizontal position as needed
                            right: 0, // Adjust the horizontal position as needed
                            child: Divider(
                              color: Colors.grey[200],
                              thickness: 01.0, // Change this to the desired thickness
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          ListTile(
                            title: Text('Control Center', style: TextStyle(color: Colors.black)),
                            leading: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Center(
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10.0),
                                      child: Image.asset('Assets/image/controlcenter.png'))),
                            ),
                            trailing: Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey[300]),
                            onTap: () {},
                          ),
                          Positioned(
                            top: 38, // Adjust the vertical position as needed
                            left: 70, // Adjust the horizontal position as needed
                            right: 0, // Adjust the horizontal position as needed
                            child: Divider(
                              color: Colors.grey[200],
                              thickness: 01.0, // Change this to the desired thickness
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          ListTile(
                            title: Text('Display & Brightness', style: TextStyle(color: Colors.black)),
                            leading: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: Colors.deepPurpleAccent,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Center(
                                  child: Image.asset('Assets/image/text.png', color: Colors.white,
                                    width: 30,
                                    height: 30,
                                  )),
                            ),
                            trailing: Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey[300]),
                            onTap: () {},
                          ),
                          Positioned(
                            top: 38, // Adjust the vertical position as needed
                            left: 70, // Adjust the horizontal position as needed
                            right: 0, // Adjust the horizontal position as needed
                            child: Divider(
                              color: Colors.grey[200],
                              thickness: 01.0, // Change this to the desired thickness
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          ListTile(
                            title: Text('Home Screen', style: TextStyle(color: Colors.black)),
                            leading: Container(
                              height: 48,
                              width: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Center(
                                  child: Image.asset('Assets/image/homescreen.jpg',
                                    width: 40,
                                    height: 40,
                                  )),
                            ),
                            trailing: Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey[300]),
                            onTap: () {},
                          ),
                          Positioned(
                            top: 38, // Adjust the vertical position as needed
                            left: 70, // Adjust the horizontal position as needed
                            right: 0, // Adjust the horizontal position as needed
                            child: Divider(
                              color: Colors.grey[200],
                              thickness: 01.0, // Change this to the desired thickness
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          ListTile(
                            title: Text('Accessibility', style: TextStyle(color: Colors.black)),
                            leading: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: Colors.lightBlue,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Center(
                                  child: Image.asset('Assets/image/accessiblity.png', color: Colors.white,
                                    width: 30,
                                    height: 30,
                                  )),
                            ),
                            trailing: Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey[300]),
                            onTap: () {},
                          ),
                          Positioned(
                            top: 38, // Adjust the vertical position as needed
                            left: 70, // Adjust the horizontal position as needed
                            right: 0, // Adjust the horizontal position as needed
                            child: Divider(
                              color: Colors.grey[200],
                              thickness: 01.0, // Change this to the desired thickness
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          ListTile(
                            title: Text('Wallpaper', style: TextStyle(color: Colors.black)),
                            leading: Container(
                              height: 48,
                              width: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Center(
                                  child: Image.asset('Assets/image/wallpaper.jpg',
                                    width: 40,
                                    height: 40,
                                  )),
                            ),
                            trailing: Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey[300]),
                            onTap: () {},
                          ),
                          Positioned(
                            top: 38, // Adjust the vertical position as needed
                            left: 70, // Adjust the horizontal position as needed
                            right: 0, // Adjust the horizontal position as needed
                            child: Divider(
                              color: Colors.grey[200],
                              thickness: 01.0, // Change this to the desired thickness
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          ListTile(
                            title: Text('Siri & Search', style: TextStyle(color: Colors.black)),
                            leading: Container(
                              height: 48,
                              width: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Center(
                                  child: Image.asset('Assets/image/siri.jpg',
                                    width: 40,
                                    height: 40,
                                  )),
                            ),
                            trailing: Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey[300]),
                            onTap: () {},
                          ),
                          Positioned(
                            top: 38, // Adjust the vertical position as needed
                            left: 70, // Adjust the horizontal position as needed
                            right: 0, // Adjust the horizontal position as needed
                            child: Divider(
                              color: Colors.grey[200],
                              thickness: 01.0, // Change this to the desired thickness
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          ListTile(
                            title: Text('Touch ID & Passcode', style: TextStyle(color: Colors.black)),
                            leading: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: Colors.redAccent,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Center(
                                  child: Image.asset('Assets/image/fingerprint.png', color: Colors.white,
                                    width: 30,
                                    height: 30,
                                  )),
                            ),
                            trailing: Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey[300]),
                            onTap: () {},
                          ),
                          Positioned(
                            top: 38, // Adjust the vertical position as needed
                            left: 70, // Adjust the horizontal position as needed
                            right: 0, // Adjust the horizontal position as needed
                            child: Divider(
                              color: Colors.grey[200],
                              thickness: 01.0, // Change this to the desired thickness
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          ListTile(
                            title: Text('Emergency & SOS', style: TextStyle(color: Colors.black)),
                            leading: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: Colors.redAccent,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Center(
                                  child: Image.asset('Assets/image/sos-warning.png', color: Colors.white,
                                    width: 35,
                                    height: 35,
                                  )),
                            ),
                            trailing:Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey[300]),
                            onTap: () {},
                          ),
                          Positioned(
                            top: 38, // Adjust the vertical position as needed
                            left: 70, // Adjust the horizontal position as needed
                            right: 0, // Adjust the horizontal position as needed
                            child: Divider(
                              color: Colors.grey[200],
                              thickness: 01.0, // Change this to the desired thickness
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          ListTile(
                            title: Text('Exposure Notification', style: TextStyle(color: Colors.black)),
                            leading: Container(
                              height: 48, // Increase the height here
                              width: 40, // You can adjust the width as needed
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Center(
                                child: Image.asset(
                                  'Assets/image/expox.jpg',
                                  fit: BoxFit.contain,// Increase the height here
                                ),
                              ),
                            ),
                            trailing: Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey[300]),
                            onTap: () {},
                          ),
                          Positioned(
                            top: 38, // Adjust the vertical position as needed
                            left: 70, // Adjust the horizontal position as needed
                            right: 0, // Adjust the horizontal position as needed
                            child: Divider(
                              color: Colors.grey[200],
                              thickness: 1.0, // Change this to the desired thickness
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          ListTile(
                            title: Text('Battery', style: TextStyle(color: Colors.black)),
                            leading: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: Colors.green[300],
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Center(
                                  child: Image.asset('Assets/image/battery.png',
                                    color: Colors.white, height: 30, width: 30,)),
                            ),
                            trailing: Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey[300]),
                            onTap: () {},
                          ),
                          Positioned(
                            top: 38, // Adjust the vertical position as needed
                            left: 70, // Adjust the horizontal position as needed
                            right: 0, // Adjust the horizontal position as needed
                            child: Divider(
                              color: Colors.grey[200],
                              thickness: 01.0, // Change this to the desired thickness
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          ListTile(
                            title: Text('Privacy & Security', style: TextStyle(color: Colors.black)),
                            leading: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: Colors.blueAccent,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Icon(Icons.front_hand, color: Colors.white),
                            ),
                            trailing: Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey[300]),
                            onTap: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 36),
              ///6th Card
              Card(
                elevation: 0,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0), // Rounded corners
                ),
                margin: EdgeInsets.only(left: width * 0.02, right: width*0.03),
                child: Container(
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          ListTile(
                            title: Text('App Store', style: TextStyle(color: Colors.black)),
                            leading: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Image.asset(
                                'Assets/image/app-store.png', // Replace with your image asset path
                              ),
                            ),
                            trailing: Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey[300]),
                            onTap: () {},
                          ),
                          Positioned(
                            top: 38, // Adjust the vertical position as needed
                            left: 70, // Adjust the horizontal position as needed
                            right: 0, // Adjust the horizontal position as needed
                            child: Divider(
                              color: Colors.grey[200],
                              thickness: 01.0, // Change this to the desired thickness
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          ListTile(
                            title: Text('Wallet & Apple Pay', style: TextStyle(color: Colors.black)),
                            leading: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Image.asset('Assets/image/wallet.png',
                              ),
                            ),
                            trailing: Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey[300]),
                            onTap: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 36),
              ///7th Card
              Card(
                elevation: 0,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0), // Rounded corners
                ),
                margin: EdgeInsets.only(left: width * 0.02, right: width*0.03),
                child: Container(
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          ListTile(
                            title: Text('Password', style: TextStyle(color: Colors.black)),
                            leading: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Center(
                                  child: Image.asset('Assets/image/password.jpg',
                                    width:40,
                                    height: 40,
                                  )),
                            ),
                            trailing: Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey[300]),
                            onTap: () {},
                          ),
                          Positioned(
                            top: 38, // Adjust the vertical position as needed
                            left: 70, // Adjust the horizontal position as needed
                            right: 0, // Adjust the horizontal position as needed
                            child: Divider(
                              color: Colors.grey[200],
                              thickness: 01.0, // Change this to the desired thickness
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          ListTile(
                            title: Text('Mail', style: TextStyle(color: Colors.black)),
                            leading: Container(
                              height: 48,
                              width: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Center(
                                  child: Image.asset('Assets/image/mail.jpg',
                                    height: 40,
                                      width: 40,
                                  )),
                            ),
                            trailing: Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey[300]),
                            onTap: () {},
                          ),
                          Positioned(
                            top: 35, // Adjust the vertical position as needed
                            left: 70, // Adjust the horizontal position as needed
                            right: 0, // Adjust the horizontal position as needed
                            child: Divider(
                              color: Colors.grey[200],
                              thickness: 01.0, // Change this to the desired thickness
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          ListTile(
                            title: Text('Contacts', style: TextStyle(color: Colors.black)),
                            leading: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Center(
                                  child: Image.asset('Assets/image/contact.png',
                                  )),
                            ),
                            trailing: Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey[300]),
                            onTap: () {},
                          ),
                          Positioned(
                            top: 35, // Adjust the vertical position as needed
                            left: 70, // Adjust the horizontal position as needed
                            right: 0, // Adjust the horizontal position as needed
                            child: Divider(
                              color: Colors.grey[200],
                              thickness: 01.0, // Change this to the desired thickness
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          ListTile(
                            title: Text('Calender', style: TextStyle(color: Colors.black)),
                            leading: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Image.asset('Assets/image/calender.png',
                              ),
                            ),
                            trailing: Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey[300]),
                            onTap: () {},
                          ),
                          Positioned(
                            top: 35, // Adjust the vertical position as needed
                            left: 70, // Adjust the horizontal position as needed
                            right: 0, // Adjust the horizontal position as needed
                            child: Divider(
                              color: Colors.grey[200],
                              thickness: 01.0, // Change this to the desired thickness
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          ListTile(
                            title: Text('Notes', style: TextStyle(color: Colors.black)),
                            leading: Container(
                              height: 48,
                              width: 40,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Center(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: Image.asset('Assets/image/notes.jpg',
                                      height: 40,
                                      width: 40,
                                    ),
                                  )),
                            ),
                            trailing: Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey[300]),
                            onTap: () {},
                          ),
                          Positioned(
                            top: 35, // Adjust the vertical position as needed
                            left: 70, // Adjust the horizontal position as needed
                            right: 0, // Adjust the horizontal position as needed
                            child: Divider(
                              color: Colors.grey[200],
                              thickness: 01.0, // Change this to the desired thickness
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          ListTile(
                            title: Text('Reminders', style: TextStyle(color: Colors.black)),
                            leading: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Center(
                                  child: Image.asset('Assets/image/reminder.png',
                                  )),
                            ),
                            trailing: Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey[300]),
                            onTap: () {},
                          ),
                          Positioned(
                            top: 35, // Adjust the vertical position as needed
                            left: 70, // Adjust the horizontal position as needed
                            right: 0, // Adjust the horizontal position as needed
                            child: Divider(
                              color: Colors.grey[200],
                              thickness: 01.0, // Change this to the desired thickness
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          ListTile(
                            title: Text('Voice Memos', style: TextStyle(color: Colors.black)),
                            leading: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Center(
                                  child: Image.asset('Assets/image/voicememo.png',
                                  )),
                            ),
                            trailing: Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey[300]),
                            onTap: () {},
                          ),
                          Positioned(
                            top: 35, // Adjust the vertical position as needed
                            left: 70, // Adjust the horizontal position as needed
                            right: 0, // Adjust the horizontal position as needed
                            child: Divider(
                              color: Colors.grey[200],
                              thickness: 01.0, // Change this to the desired thickness
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          ListTile(
                            title: Text('Phone', style: TextStyle(color: Colors.black)),
                            leading: Container(
                              height: 48,
                              width: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Center(
                                  child: Image.asset('Assets/image/phone.jpg',
                                    height: 40,
                                      width: 40
                                  )),
                            ),
                            trailing: Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey[300]),
                            onTap: () {},
                          ),
                          Positioned(
                            top: 35, // Adjust the vertical position as needed
                            left: 70, // Adjust the horizontal position as needed
                            right: 0, // Adjust the horizontal position as needed
                            child: Divider(
                              color: Colors.grey[200],
                              thickness: 01.0, // Change this to the desired thickness
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          ListTile(
                            title: Text('Messages', style: TextStyle(color: Colors.black)),
                            leading: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Center(
                                  child: Image.asset('Assets/image/message.jpg',
                                  )),
                            ),
                            trailing: Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey[300]),
                            onTap: () {},
                          ),
                          Positioned(
                            top: 35, // Adjust the vertical position as needed
                            left: 70, // Adjust the horizontal position as needed
                            right: 0, // Adjust the horizontal position as needed
                            child: Divider(
                              color: Colors.grey[200],
                              thickness: 01.0, // Change this to the desired thickness
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          ListTile(
                            title: Text('FaceTime', style: TextStyle(color: Colors.black)),
                            leading: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Center(
                                  child: Image.asset('Assets/image/facetime.jpg',
                                  )),
                            ),
                            trailing: Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey[300]),
                            onTap: () {},
                          ),
                          Positioned(
                            top: 35, // Adjust the vertical position as needed
                            left: 70, // Adjust the horizontal position as needed
                            right: 0, // Adjust the horizontal position as needed
                            child: Divider(
                              color: Colors.grey[200],
                              thickness: 01.0, // Change this to the desired thickness
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          ListTile(
                            title: Text('Safari', style: TextStyle(color: Colors.black)),
                            leading: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Center(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: Image.asset('Assets/image/safari.jpg',
                                    ),
                                  )),
                            ),
                            trailing: Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey[300]),
                            onTap: () {},
                          ),
                          Positioned(
                            top: 35, // Adjust the vertical position as needed
                            left: 70, // Adjust the horizontal position as needed
                            right: 0, // Adjust the horizontal position as needed
                            child: Divider(
                              color: Colors.grey[200],
                              thickness: 01.0, // Change this to the desired thickness
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          ListTile(
                            title: Text('Weather', style: TextStyle(color: Colors.black)),
                            leading: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Center(
                                  child: Image.asset('Assets/image/weather.jpg',
                                  )),
                            ),
                            trailing: Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey[300]),
                            onTap: () {},
                          ),
                          Positioned(
                            top: 35, // Adjust the vertical position as needed
                            left: 70, // Adjust the horizontal position as needed
                            right: 0, // Adjust the horizontal position as needed
                            child: Divider(
                              color: Colors.grey[200],
                              thickness: 01.0, // Change this to the desired thickness
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          ListTile(
                            title: Text('Translate', style: TextStyle(color: Colors.black)),
                            leading: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Center(
                                  child: Image.asset('Assets/image/translate.jpg',
                                  )),
                            ),
                            trailing: Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey[300]),
                            onTap: () {},
                          ),
                          Positioned(
                            top: 35, // Adjust the vertical position as needed
                            left: 70, // Adjust the horizontal position as needed
                            right: 0, // Adjust the horizontal position as needed
                            child: Divider(
                              color: Colors.grey[200],
                              thickness: 01.0, // Change this to the desired thickness
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          ListTile(
                            title: Text('Health', style: TextStyle(color: Colors.black)),
                            leading: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Center(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: Image.asset('Assets/image/heart.jpg',
                                    ),
                                  )),
                            ),
                            trailing: Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey[300]),
                            onTap: () {},
                          ),
                          Positioned(
                            top: 35, // Adjust the vertical position as needed
                            left: 70, // Adjust the horizontal position as needed
                            right: 0, // Adjust the horizontal position as needed
                            child: Divider(
                              color: Colors.grey[200],
                              thickness: 01.0, // Change this to the desired thickness
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          ListTile(
                            title: Text('Home', style: TextStyle(color: Colors.black)),
                            leading: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Center(
                                  child: Image.asset('Assets/image/home.png',
                                  )),
                            ),
                            trailing: Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey[300]),
                            onTap: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 36),
              ///8th Card
              Card(
                elevation: 0,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0), // Rounded corners
                ),
                margin: EdgeInsets.only(left: width * 0.02, right: width*0.03),
                child: Container(
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          ListTile(
                            title: Text('Music', style: TextStyle(color: Colors.black)),
                            leading: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Center(
                                  child: Image.asset('Assets/image/music.png',
                                  )),
                            ),
                            trailing: Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey[300]),
                            onTap: () {},
                          ),
                          Positioned(
                            top: 35, // Adjust the vertical position as needed
                            left: 70, // Adjust the horizontal position as needed
                            right: 0, // Adjust the horizontal position as needed
                            child: Divider(
                              color: Colors.grey[200],
                              thickness: 01.0, // Change this to the desired thickness
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          ListTile(
                            title: Text('Photos', style: TextStyle(color: Colors.black)),
                            leading: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Center(
                                  child: Image.asset('Assets/image/photo.png',
                                    height: 40, width: 40,
                                  )),
                            ),
                            trailing: Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey[300]),
                            onTap: () {},
                          ),
                          Positioned(
                            top: 35, // Adjust the vertical position as needed
                            left: 70, // Adjust the horizontal position as needed
                            right: 0, // Adjust the horizontal position as needed
                            child: Divider(
                              color: Colors.grey[200],
                              thickness: 01.0, // Change this to the desired thickness
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          ListTile(
                            title: Text('Camera', style: TextStyle(color: Colors.black)),
                            leading: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Center(
                                  child: Image.asset('Assets/image/camera.png',
                                  )),
                            ),
                            trailing: Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey[300]),
                            onTap: () {},
                          ),
                          Positioned(
                            top: 35, // Adjust the vertical position as needed
                            left: 70, // Adjust the horizontal position as needed
                            right: 0, // Adjust the horizontal position as needed
                            child: Divider(
                              color: Colors.grey[200],
                              thickness: 01.0, // Change this to the desired thickness
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          ListTile(
                            title: Text('Books', style: TextStyle(color: Colors.black)),
                            leading: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Center(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: Image.asset('Assets/image/book.png',
                                      height: 40,
                                      width: 40,
                                    ),
                                  )),
                            ),
                            trailing: Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey[300]),
                            onTap: () {},
                          ),
                          Positioned(
                            top: 35, // Adjust the vertical position as needed
                            left: 70, // Adjust the horizontal position as needed
                            right: 0, // Adjust the horizontal position as needed
                            child: Divider(
                              color: Colors.grey[200],
                              thickness: 01.0, // Change this to the desired thickness
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          ListTile(
                            title: Text('Game Center', style: TextStyle(color: Colors.black)),
                            leading: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Center(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: Image.asset('Assets/image/gamecenter.jpg',
                                      height: 40,
                                      width: 40,
                                    ),
                                  )),
                            ),
                            trailing: Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey[300]),
                            onTap: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 36),
              ///9th Card
              Card(
                elevation: 0,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0), // Rounded corners
                ),
                margin: EdgeInsets.only(left: width * 0.02, right: width*0.03),
                child: Container(
                  child: Column(
                    children: [
                      Stack(
                        children:[
                          ListTile(
                            title: Text('TV Provider', style: TextStyle(color: Colors.black)),
                            leading: Container(
                              width: 40, // Adjust the width as needed
                              height: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(height*0.01)), // Rounded corners
                              ),
                              child: Center(
                                  child: Image.asset('Assets/image/cable.jpg',
                                    height: 40,
                                    width: 40,
                                  )),
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Optimum',
                                  style: TextStyle(color: Colors.grey.shade400, fontSize: 18, fontWeight: FontWeight.w500),
                                ),
                                SizedBox(width: 8),
                                Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey[300]),
                              ],
                            ),
                            onTap: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 36),
              ///10th Card
              Card(
                elevation: 0,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0), // Rounded corners
                ),
                margin: EdgeInsets.only(left: width * 0.02, right: width*0.03),
                child: Container(
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          ListTile(
                            title: Text('Amazon', style: TextStyle(color: Colors.black)),
                            leading: Container(
                              height: 48,
                              width: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Center(
                                  child: Image.asset('Assets/image/amazon.jpg',
                                    height: 40,
                                    width: 40,
                                  )),
                            ),
                            trailing: Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey[300]),
                            onTap: () {},
                          ),
                          Positioned(
                            top: 38, // Adjust the vertical position as needed
                            left: 70, // Adjust the horizontal position as needed
                            right: 0, // Adjust the horizontal position as needed
                            child: Divider(
                              color: Colors.grey[200],
                              thickness: 01.0, // Change this to the desired thickness
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          ListTile(
                            title: Text('Amex', style: TextStyle(color: Colors.black)),
                            leading: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Center(
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10.0),
                                      child: Image.asset('Assets/image/amex.jpg'))),
                            ),
                            trailing: Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey[300]),
                            onTap: () {},
                          ),
                          Positioned(
                            top: 38, // Adjust the vertical position as needed
                            left: 70, // Adjust the horizontal position as needed
                            right: 0, // Adjust the horizontal position as needed
                            child: Divider(
                              color: Colors.grey[200],
                              thickness: 01.0, // Change this to the desired thickness
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          ListTile(
                            title: Text('Aauthenticator', style: TextStyle(color: Colors.black)),
                            leading: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Center(
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10.0),
                                      child: Image.asset('Assets/image/auth.jpg'))),
                            ),
                            trailing: Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey[300]),
                            onTap: () {},
                          ),
                          Positioned(
                            top: 38, // Adjust the vertical position as needed
                            left: 70, // Adjust the horizontal position as needed
                            right: 0, // Adjust the horizontal position as needed
                            child: Divider(
                              color: Colors.grey[200],
                              thickness: 01.0, // Change this to the desired thickness
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          ListTile(
                            title: Text('BofA', style: TextStyle(color: Colors.black)),
                            leading: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Center(
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10.0),
                                      child: Image.asset('Assets/image/bofa.jpg'))),
                            ),
                            trailing: Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey[300]),
                            onTap: () {},
                          ),
                          Positioned(
                            top: 38, // Adjust the vertical position as needed
                            left: 70, // Adjust the horizontal position as needed
                            right: 0, // Adjust the horizontal position as needed
                            child: Divider(
                              color: Colors.grey[200],
                              thickness: 01.0, // Change this to the desired thickness
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          ListTile(
                            title: Text('Box ', style: TextStyle(color: Colors.black)),
                            leading: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Center(
                                  child: Image.asset('Assets/image/box.png', color: Colors.white,
                                    width: 30,
                                    height: 30,
                                  )),
                            ),
                            trailing: Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey[300]),
                            onTap: () {},
                          ),
                          Positioned(
                            top: 38, // Adjust the vertical position as needed
                            left: 70, // Adjust the horizontal position as needed
                            right: 0, // Adjust the horizontal position as needed
                            child: Divider(
                              color: Colors.grey[200],
                              thickness: 01.0, // Change this to the desired thickness
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          ListTile(
                            title: Text('Capital One', style: TextStyle(color: Colors.black)),
                            leading: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Image.asset('Assets/image/cap.png'),
                            ),
                            trailing: Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey[300]),
                            onTap: () {},
                          ),
                          Positioned(
                            top: 38, // Adjust the vertical position as needed
                            left: 70, // Adjust the horizontal position as needed
                            right: 0, // Adjust the horizontal position as needed
                            child: Divider(
                              color: Colors.grey[200],
                              thickness: 01.0, // Change this to the desired thickness
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          ListTile(
                            title: Text('Chase', style: TextStyle(color: Colors.black)),
                            leading: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Center(
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10.0),
                                      child: Image.asset('Assets/image/chase.jpg',))),
                            ),
                            trailing: Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey[300]),
                            onTap: () {},
                          ),
                          Positioned(
                            top: 38, // Adjust the vertical position as needed
                            left: 70, // Adjust the horizontal position as needed
                            right: 0, // Adjust the horizontal position as needed
                            child: Divider(
                              color: Colors.grey[200],
                              thickness: 01.0, // Change this to the desired thickness
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          ListTile(
                            title: Text('Coinbase', style: TextStyle(color: Colors.black)),
                            leading: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Center(
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10.0),
                                      child: Image.asset('Assets/image/coinbase.jpg'))),
                            ),
                            trailing: Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey[300]),
                            onTap: () {},
                          ),
                          Positioned(
                            top: 38, // Adjust the vertical position as needed
                            left: 70, // Adjust the horizontal position as needed
                            right: 0, // Adjust the horizontal position as needed
                            child: Divider(
                              color: Colors.grey[200],
                              thickness: 01.0, // Change this to the desired thickness
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          ListTile(
                            title: Text('CoinMarketCap', style: TextStyle(color: Colors.black)),
                            leading: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: Colors.deepPurpleAccent,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Center(
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10.0),
                                      child: Image.asset('Assets/image/coinmkt.jpg'))),
                            ),
                            trailing: Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey[300]),
                            onTap: () {},
                          ),
                          Positioned(
                            top: 38, // Adjust the vertical position as needed
                            left: 70, // Adjust the horizontal position as needed
                            right: 0, // Adjust the horizontal position as needed
                            child: Divider(
                              color: Colors.grey[200],
                              thickness: 01.0, // Change this to the desired thickness
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          ListTile(
                            title: Text('Fiverr', style: TextStyle(color: Colors.black)),
                            leading: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Center(
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10.0),
                                      child: Image.asset('Assets/image/fvr.png'))),
                            ),
                            trailing: Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey[300]),
                            onTap: () {},
                          ),
                          Positioned(
                            top: 38, // Adjust the vertical position as needed
                            left: 70, // Adjust the horizontal position as needed
                            right: 0, // Adjust the horizontal position as needed
                            child: Divider(
                              color: Colors.grey[200],
                              thickness: 01.0, // Change this to the desired thickness
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          ListTile(
                            title: Text('Gate.io', style: TextStyle(color: Colors.black)),
                            leading: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Image.asset('Assets/image/gateio.png'),
                            ),
                            trailing: Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey[300]),
                            onTap: () {},
                          ),
                          Positioned(
                            top: 38, // Adjust the vertical position as needed
                            left: 70, // Adjust the horizontal position as needed
                            right: 0, // Adjust the horizontal position as needed
                            child: Divider(
                              color: Colors.grey[200],
                              thickness: 01.0, // Change this to the desired thickness
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          ListTile(
                            title: Text('Google Maps', style: TextStyle(color: Colors.black)),
                            leading: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Center(
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10.0),
                                      child: Image.asset('Assets/image/maps.jpg'))),
                            ),
                            trailing: Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey[300]),
                            onTap: () {},
                          ),
                          Positioned(
                            top: 38, // Adjust the vertical position as needed
                            left: 70, // Adjust the horizontal position as needed
                            right: 0, // Adjust the horizontal position as needed
                            child: Divider(
                              color: Colors.grey[200],
                              thickness: 01.0, // Change this to the desired thickness
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          ListTile(
                            title: Text('Instagrame', style: TextStyle(color: Colors.black)),
                            leading: Container(
                              height: 48,
                              width: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Image.asset('Assets/image/insta.jpg'),
                            ),
                            trailing: Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey[300]),
                            onTap: () {},
                          ),
                          Positioned(
                            top: 38, // Adjust the vertical position as needed
                            left: 70, // Adjust the horizontal position as needed
                            right: 0, // Adjust the horizontal position as needed
                            child: Divider(
                              color: Colors.grey[200],
                              thickness: 01.0, // Change this to the desired thickness
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          ListTile(
                            title: Text('KuCoin', style: TextStyle(color: Colors.black)),
                            leading: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: Colors.redAccent,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Center(
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10.0),
                                      child: Image.asset('Assets/image/kucoin.png'))),
                            ),
                            trailing: Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey[300]),
                            onTap: () {},
                          ),
                          Positioned(
                            top: 38, // Adjust the vertical position as needed
                            left: 70, // Adjust the horizontal position as needed
                            right: 0, // Adjust the horizontal position as needed
                            child: Divider(
                              color: Colors.grey[200],
                              thickness: 01.0, // Change this to the desired thickness
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          ListTile(
                            title: Text('Messenger', style: TextStyle(color: Colors.black)),
                            leading: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: Colors.redAccent,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Image.asset('Assets/image/msngr.png'),
                            ),
                            trailing:Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey[300]),
                            onTap: () {},
                          ),
                          Positioned(
                            top: 38, // Adjust the vertical position as needed
                            left: 70, // Adjust the horizontal position as needed
                            right: 0, // Adjust the horizontal position as needed
                            child: Divider(
                              color: Colors.grey[200],
                              thickness: 01.0, // Change this to the desired thickness
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          ListTile(
                            title: Text('MetaMask', style: TextStyle(color: Colors.black)),
                            leading: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Image.asset('Assets/image/metamsk.png'),
                            ),
                            trailing: Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey[300]),
                            onTap: () {},
                          ),
                          Positioned(
                            top: 38, // Adjust the vertical position as needed
                            left: 70, // Adjust the horizontal position as needed
                            right: 0, // Adjust the horizontal position as needed
                            child: Divider(
                              color: Colors.grey[200],
                              thickness: 01.0, // Change this to the desired thickness
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          ListTile(
                            title: Text('Navy Fedral', style: TextStyle(color: Colors.black)),
                            leading: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Center(
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10.0),
                                      child: Image.asset('Assets/image/nvyfedrl.png'))),
                            ),
                            trailing: Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey[300]),
                            onTap: () {},
                          ),
                          Positioned(
                            top: 38, // Adjust the vertical position as needed
                            left: 70, // Adjust the horizontal position as needed
                            right: 0, // Adjust the horizontal position as needed
                            child: Divider(
                              color: Colors.grey[200],
                              thickness: 01.0, // Change this to the desired thickness
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          ListTile(
                            title: Text('Ring', style: TextStyle(color: Colors.black)),
                            leading: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Center(
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10.0),
                                      child: Image.asset('Assets/image/ring.png'))),
                            ),
                            trailing: Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey[300]),
                            onTap: () {},
                          ),
                          Positioned(
                            top: 38, // Adjust the vertical position as needed
                            left: 70, // Adjust the horizontal position as needed
                            right: 0, // Adjust the horizontal position as needed
                            child: Divider(
                              color: Colors.grey[200],
                              thickness: 01.0, // Change this to the desired thickness
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          ListTile(
                            title: Text('Rumble', style: TextStyle(color: Colors.black)),
                            leading: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Image.asset('Assets/image/rmbl.png'),
                            ),
                            trailing: Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey[300]),
                            onTap: () {},
                          ),
                          Positioned(
                            top: 38, // Adjust the vertical position as needed
                            left: 70, // Adjust the horizontal position as needed
                            right: 0, // Adjust the horizontal position as needed
                            child: Divider(
                              color: Colors.grey[200],
                              thickness: 01.0, // Change this to the desired thickness
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          ListTile(
                            title: Text('Shazam', style: TextStyle(color: Colors.black)),
                            leading: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Image.asset('Assets/image/shzm.png'),
                            ),
                            trailing: Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey[300]),
                            onTap: () {},
                          ),
                          Positioned(
                            top: 38, // Adjust the vertical position as needed
                            left: 70, // Adjust the horizontal position as needed
                            right: 0, // Adjust the horizontal position as needed
                            child: Divider(
                              color: Colors.grey[200],
                              thickness: 01.0, // Change this to the desired thickness
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          ListTile(
                            title: Text('Snapchat', style: TextStyle(color: Colors.black)),
                            leading: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Center(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: Image.asset('Assets/image/snapchat.jpg',
                                    ),
                                  )),
                            ),
                            trailing: Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey[300]),
                            onTap: () {},
                          ),
                          Positioned(
                            top: 38, // Adjust the vertical position as needed
                            left: 70, // Adjust the horizontal position as needed
                            right: 0, // Adjust the horizontal position as needed
                            child: Divider(
                              color: Colors.grey[200],
                              thickness: 01.0, // Change this to the desired thickness
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          ListTile(
                            title: Text('Spinrilla', style: TextStyle(color: Colors.black)),
                            leading: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Center(
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10.0),
                                      child: Image.asset('Assets/image/spinrilla.png'))),
                            ),
                            trailing: Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey[300]),
                            onTap: () {},
                          ),
                          Positioned(
                            top: 38, // Adjust the vertical position as needed
                            left: 70, // Adjust the horizontal position as needed
                            right: 0, // Adjust the horizontal position as needed
                            child: Divider(
                              color: Colors.grey[200],
                              thickness: 01.0, // Change this to the desired thickness
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          ListTile(
                            title: Text('Telegram', style: TextStyle(color: Colors.black)),
                            leading: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Center(
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10.0),
                                      child: Image.asset('Assets/image/telegram.jpg',))),
                            ),
                            trailing: Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey[300]),
                            onTap: () {},
                          ),
                          Positioned(
                            top: 38, // Adjust the vertical position as needed
                            left: 70, // Adjust the horizontal position as needed
                            right: 0, // Adjust the horizontal position as needed
                            child: Divider(
                              color: Colors.grey[200],
                              thickness: 01.0, // Change this to the desired thickness
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          ListTile(
                            title: Text('Tesla', style: TextStyle(color: Colors.black)),
                            leading: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Image.asset('Assets/image/tesla.jpg',),
                            ),
                            trailing: Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey[300]),
                            onTap: () {},
                          ),
                          Positioned(
                            top: 38, // Adjust the vertical position as needed
                            left: 70, // Adjust the horizontal position as needed
                            right: 0, // Adjust the horizontal position as needed
                            child: Divider(
                              color: Colors.grey[200],
                              thickness: 01.0, // Change this to the desired thickness
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          ListTile(
                            title: Text('Tiktok', style: TextStyle(color: Colors.black)),
                            leading: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Icon(Icons.tiktok_outlined, color: Colors.white),
                            ),
                            trailing: Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey[300]),
                            onTap: () {},
                          ),
                          Positioned(
                            top: 38, // Adjust the vertical position as needed
                            left: 70, // Adjust the horizontal position as needed
                            right: 0, // Adjust the horizontal position as needed
                            child: Divider(
                              color: Colors.grey[200],
                              thickness: 01.0, // Change this to the desired thickness
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          ListTile(
                            title: Text('Truist', style: TextStyle(color: Colors.black)),
                            leading: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Center(
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10.0),
                                      child: Image.asset('Assets/image/truist.jpg'))),
                            ),
                            trailing: Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey[300]),
                            onTap: () {},
                          ),
                          Positioned(
                            top: 38, // Adjust the vertical position as needed
                            left: 70, // Adjust the horizontal position as needed
                            right: 0, // Adjust the horizontal position as needed
                            child: Divider(
                              color: Colors.grey[200],
                              thickness: 01.0, // Change this to the desired thickness
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          ListTile(
                            title: Text('Whatsapp', style: TextStyle(color: Colors.black)),
                            leading: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Center(
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10.0),
                                      child: Image.asset('Assets/image/whtsap.png'))),
                            ),
                            trailing: Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey[300]),
                            onTap: () {},
                          ),
                          Positioned(
                            top: 38, // Adjust the vertical position as needed
                            left: 70, // Adjust the horizontal position as needed
                            right: 0, // Adjust the horizontal position as needed
                            child: Divider(
                              color: Colors.grey[200],
                              thickness: 01.0, // Change this to the desired thickness
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          ListTile(
                            title: Text('Youtube', style: TextStyle(color: Colors.black)),
                            leading: Container(
                              height: 48,
                              width: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Center(
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10.0),
                                      child: Image.asset('Assets/image/youtube.jpg', height: 40, width: 40,))),
                            ),
                            trailing: Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey[300]),
                            onTap: () {},
                          ),
                          Positioned(
                            top: 38, // Adjust the vertical position as needed
                            left: 70, // Adjust the horizontal position as needed
                            right: 0, // Adjust the horizontal position as needed
                            child: Divider(
                              color: Colors.grey[200],
                              thickness: 01.0, // Change this to the desired thickness
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          ListTile(
                            title: Text('Zoom', style: TextStyle(color: Colors.black)),
                            leading: Container(
                              height: 48,
                              width: 40,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Image.asset('Assets/image/zoom.jpg', height: 40,
                                width: 40,),
                            ),
                            trailing: Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey[300]),
                            onTap: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
