import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:setting_screen/Screens/AboutScreen.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    final scrSize = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.grey.shade200,
          body: SizedBox(
            width: double.maxFinite,
            height: scrSize.height,
            child: Column(
              children: [
                SizedBox(height: 15,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: (){
                          Navigator.of(context).pop();
                        },
                        child: Row(
                          children: [
                            Icon(Icons.arrow_back_ios_new_rounded,color: Colors.blue.shade800,size: 20,),
                            SizedBox(width: 10,),
                            Text("Setting",style: TextStyle(
                                color: Colors.blue.shade800,
                                fontWeight: FontWeight.w500,
                                fontSize: 18.0
                            ),),
                          ],
                        ),
                      ),
                      Text("General",style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.black
                      ),),
                      SizedBox.shrink(),
                      SizedBox.shrink(),
                    ],
                  ),
                ),
                SizedBox(height: 36,),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                        children: [
                          ///1st card
                          Card(
                            elevation: 0,
                            margin: EdgeInsets.zero,
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0), // Rounded corners
                            ),
                            child: Container(
                              child: Column(
                                children: [
                                  Stack(
                                    children: [
                                      ListTile(
                                        title: Text('About', style: TextStyle(color: Colors.black)),
                                        trailing: Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey[300]),
                                        onTap: () {
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>AboutScreen()));
                                        },
                                      ),
                                      Positioned(
                                        top: 40, // Adjust the vertical position as needed
                                        left: 15, // Adjust the horizontal position as needed
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
                                        title: Text('Software Update', style: TextStyle(color: Colors.black)),
                                        trailing: Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey[300]),
                                        onTap: () {},
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 36,),
                          ///2nd Card
                          Card(
                            elevation: 0,
                            margin: EdgeInsets.zero,
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0), // Rounded corners
                            ),
                            child: Container(
                              child: Column(
                                children: [
                                  Stack(
                                    children: [
                                      ListTile(
                                        title: Text('AirDrop', style: TextStyle(color: Colors.black)),
                                        trailing: Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey[300]),
                                        onTap: () {},
                                      ),
                                      Positioned(
                                        top: 40, // Adjust the vertical position as needed
                                        left: 15, // Adjust the horizontal position as needed
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
                                        title: Text('AirPlay & Handoff', style: TextStyle(color: Colors.black)),
                                        trailing: Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey[300]),
                                        onTap: () {},
                                      ),
                                      Positioned(
                                        top: 40, // Adjust the vertical position as needed
                                        left: 15, // Adjust the horizontal position as needed
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
                                        title: Text('Picture in Picture', style: TextStyle(color: Colors.black)),
                                        trailing:Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey[300]),
                                        onTap: () {},
                                      ),
                                      Positioned(
                                        top: 40, // Adjust the vertical position as needed
                                        left: 15, // Adjust the horizontal position as needed
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
                                        title: Text('CarPlay', style: TextStyle(color: Colors.black)),
                                        trailing:Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey[300]),
                                        onTap: () {},
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 36,),
                          ///3rd Card
                          Card(
                            elevation: 0,
                            margin: EdgeInsets.zero,
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0), // Rounded corners
                            ),
                            child: Container(
                              child: Column(
                                children: [
                                  Stack(
                                    children: [
                                      ListTile(
                                        title: Text('Home Button', style: TextStyle(color: Colors.black)),
                                        trailing: Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey[300]),
                                        onTap: () {},
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 36,),
                          ///4th Card
                          Card(
                            elevation: 0,
                            margin: EdgeInsets.zero,
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0), // Rounded corners
                            ),
                            child: Container(
                              child: Column(
                                children: [
                                  Stack(
                                    children: [
                                      ListTile(
                                        title: Text('iPhone Stroage', style: TextStyle(color: Colors.black)),
                                        trailing: Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey[300]),
                                        onTap: () {},
                                      ),
                                      Positioned(
                                        top: 40, // Adjust the vertical position as needed
                                        left: 15, // Adjust the horizontal position as needed
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
                                        title: Text('Background App Refresh', style: TextStyle(color: Colors.black)),
                                        trailing: Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey[300]),
                                        onTap: () {},
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 36,),
                          ///5th card
                          Card(
                            elevation: 0,
                            margin: EdgeInsets.zero,
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0), // Rounded corners
                            ),
                            child: Container(
                              child: Column(
                                children: [
                                  Stack(
                                    children: [
                                      ListTile(
                                        title: Text('Date & Time', style: TextStyle(color: Colors.black)),
                                        trailing: Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey[300]),
                                        onTap: () {},
                                      ),
                                      Positioned(
                                        top: 40, // Adjust the vertical position as needed
                                        left: 15, // Adjust the horizontal position as needed
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
                                        title: Text('Keyboard', style: TextStyle(color: Colors.black)),
                                        trailing: Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey[300]),
                                        onTap: () {},
                                      ),
                                      Positioned(
                                        top: 40, // Adjust the vertical position as needed
                                        left: 15, // Adjust the horizontal position as needed
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
                                        title: Text('Fonts', style: TextStyle(color: Colors.black)),
                                        trailing: Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey[300]),
                                        onTap: () {},
                                      ),
                                      Positioned(
                                        top: 40, // Adjust the vertical position as needed
                                        left: 15, // Adjust the horizontal position as needed
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
                                        title: Text('Language & Region', style: TextStyle(color: Colors.black)),
                                        trailing: Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey[300]),
                                        onTap: () {},
                                      ),
                                      Positioned(
                                        top: 40, // Adjust the vertical position as needed
                                        left: 15, // Adjust the horizontal position as needed
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
                                        title: Text('Dictionary', style: TextStyle(color: Colors.black)),
                                        trailing: Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey[300]),
                                        onTap: () {},
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 36,),
                          ///6th Card
                          Card(
                            elevation: 0,
                            margin: EdgeInsets.zero,
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0), // Rounded corners
                            ),
                            child: Container(
                              child: Column(
                                children: [
                                  Stack(
                                    children: [
                                      ListTile(
                                        title: Text('VPN and Device Management', style: TextStyle(color: Colors.black)),
                                        trailing:Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey[300]),
                                        onTap: () {},
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 36,),
                          ///7th Card
                          Card(
                            elevation: 0,
                            margin: EdgeInsets.zero,
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0), // Rounded corners
                            ),
                            child: Container(
                              child: Column(
                                children: [
                                  Stack(
                                    children: [
                                      ListTile(
                                        title: Text('Legal & Regulatory', style: TextStyle(color: Colors.black)),
                                        trailing: Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey[300]),
                                        onTap: () {},
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 36,),
                          ///8th card
                          Card(
                            elevation: 0,
                            margin: EdgeInsets.zero,
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0), // Rounded corners
                            ),
                            child: Container(
                              child: Column(
                                children: [
                                  Stack(
                                    children: [
                                      ListTile(
                                        title: Text('Transfer or Reset iPhone', style: TextStyle(color: Colors.black)),
                                        trailing:Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey[300]),
                                        onTap: () {},
                                      ),
                                      Positioned(
                                        top: 40, // Adjust the vertical position as needed
                                        left: 15, // Adjust the horizontal position as needed
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
                                        title: Text('Shutdown', style: TextStyle(color: Colors.blue)),
                                        onTap: () {},
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 36,),
                        ],),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

