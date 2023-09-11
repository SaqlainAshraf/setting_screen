import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}


class _AboutScreenState extends State<AboutScreen> {
  @override

  Query dbRef = FirebaseDatabase.instance.ref().child('');


  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final scrSize = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.grey.shade200,
          body: FirebaseAnimatedList(
            query: dbRef,
            itemBuilder: (context, snapshot, animation, index) {
              return SizedBox(
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
                            onTap: () {
                              // Use Navigator to go back to the previous screen
                              Navigator.of(context).pop();
                            },
                            child: Row(
                              children: [
                                Icon(Icons.arrow_back_ios_new_rounded,color: Colors.blue.shade800,size: 20,),
                                SizedBox(width: 10,),
                                Text("General",style: TextStyle(
                                    color: Colors.blue.shade800,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18.0
                                ),),
                              ],
                            ),
                          ),
                          Text("About",style: TextStyle(
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
                          padding: const EdgeInsets.symmetric(horizontal: 8,),
                          child: Column(
                            children: [
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
                                            title: Text('Name', style: TextStyle(color: Colors.black, fontSize: 16.0)),
                                            trailing: SizedBox(
                                              width: 150, // Adjust the width as needed
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  Text(snapshot.child('phoneName').value.toString(), style: TextStyle(color: Colors.grey, fontSize: 17.0,fontWeight: FontWeight.w400 )),
                                                  Icon(Icons.arrow_forward_ios,size: 18, color: Colors.grey[300]),
                                                ],
                                              ),
                                            ),
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
                                            title: Text('iOS Version', style: TextStyle(color: Colors.black, fontSize: 16.0)),
                                            trailing: SizedBox(
                                              width: 100, // Adjust the width as needed
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  Text(snapshot.child('iosVersion').value.toString(), style: TextStyle(color: Colors.grey, fontSize: 17.0, fontWeight: FontWeight.w400)),
                                                  Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey[300]),
                                                ],
                                              ),
                                            ),
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
                                            title: Text('Model Number', style: TextStyle(color: Colors.black, fontSize: 16.0)),
                                            trailing: Container(
                                                child: Text(snapshot.child('modelNumber').value.toString(),overflow: TextOverflow.ellipsis,
                                                  style: TextStyle(color: Colors.grey, fontSize: 17.0, fontWeight: FontWeight.w400 ),)),
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
                                            title: Text('Model Name',overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.black, fontSize: 16.0)),
                                            trailing: Container(
                                                child: Text(snapshot.child('modelName').value.toString(),overflow: TextOverflow.ellipsis,
                                                  style: TextStyle(color: Colors.grey, fontSize: 17.0,fontWeight: FontWeight.w400 ),)),
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
                                            title: Text('Serial Number',overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.black, fontSize: 16.0)),
                                            trailing: Container(
                                                child: Text(snapshot.child('serialNumber').value.toString(),overflow: TextOverflow.ellipsis,
                                                  style: TextStyle(color: Colors.grey, fontSize: 17.0,fontWeight: FontWeight.w400 ),)),
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
                                            title: Text('Coverage', style: TextStyle(color: Colors.black, fontSize: 17.0)),
                                            trailing: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey[300],
                                                ),
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
                                            title: Text('Network',overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.black, fontSize: 16.0)),
                                            trailing: Container(
                                                child: Text(snapshot.child('network').value.toString(),overflow: TextOverflow.ellipsis,
                                                  style: TextStyle(color: Colors.grey, fontSize: 17.0, fontWeight: FontWeight.w400 ),)),
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
                                            title: Text('Songs',overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.black, fontSize: 16.0)),
                                            trailing: Container(
                                                child: Text(snapshot.child('songs').value.toString(),overflow: TextOverflow.ellipsis,
                                                  style: TextStyle(color: Colors.grey, fontSize: 17.0, fontWeight: FontWeight.w400 ),)),
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
                                            title: Text('Videos',overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.black, fontSize: 16.0)),
                                            trailing: Container(
                                                child: Text(snapshot.child('videos').value.toString(),overflow: TextOverflow.ellipsis,
                                                  style: TextStyle(color: Colors.grey, fontSize: 17.0,fontWeight: FontWeight.w400 ),)),
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
                                            title: Text('Photos',overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.black, fontSize: 16.0)),
                                            trailing: Container(
                                                child: Text(snapshot.child('photos').value.toString(),overflow: TextOverflow.ellipsis,
                                                  style: TextStyle(color: Colors.grey, fontSize: 17.0, fontWeight: FontWeight.w400 ),)),
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
                                            title: Text('Applications',overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.black, fontSize: 16.0)),
                                            trailing: Container(
                                                child: Text(snapshot.child('applications').value.toString(),overflow: TextOverflow.ellipsis,
                                                  style: TextStyle(color: Colors.grey, fontSize: 17.0,fontWeight: FontWeight.w400 ),)),
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
                                            title: Text('Capacity',overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.black, fontSize: 16.0)),
                                            trailing: Container(
                                                child: Text(snapshot.child('capacity').value.toString(),overflow: TextOverflow.ellipsis,
                                                  style: TextStyle(color: Colors.grey, fontSize: 17.0,fontWeight: FontWeight.w400 ),)),
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
                                            title: Text('Available',overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.black, fontSize: 16.0)),
                                            trailing: Container(
                                                child: Text(snapshot.child('available').value.toString(),overflow: TextOverflow.ellipsis,
                                                  style: TextStyle(color: Colors.grey, fontSize: 17.0, fontWeight: FontWeight.w400 ),)),
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
                                            title: Text('Carrier',overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.black, fontSize: 16.0)),
                                            trailing: Container(
                                                child: Text(snapshot.child('carrier').value.toString(),overflow: TextOverflow.ellipsis,
                                                  style: TextStyle(color: Colors.grey, fontSize: 17.0, fontWeight: FontWeight.w400 ),)),
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
                                            title: Text('Wi-Fi Address',overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.black, fontSize: 16.0)),
                                            trailing: Container(
                                                child: Text(snapshot.child('wifiAddress').value.toString(),overflow: TextOverflow.ellipsis,
                                                  style: TextStyle(color: Colors.grey, fontSize: 17.0, fontWeight: FontWeight.w400 ),)),
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
                                            title: Text('Bluetooth',overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.black, fontSize: 16.0)),
                                            trailing: Container(
                                                child: Text(snapshot.child('bluetooth').value.toString(),overflow: TextOverflow.ellipsis,
                                                  style: TextStyle(color: Colors.grey, fontSize: 17.0, fontWeight: FontWeight.w400 ),)),
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
                                            title: Text('IMEI',overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.black, fontSize: 16.0)),
                                            trailing: Container(
                                                child: Text(snapshot.child('imei').value.toString(),overflow: TextOverflow.ellipsis,
                                                  style: TextStyle(color: Colors.grey, fontSize: 17.0, fontWeight: FontWeight.w400 ),)),
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
                                            title: Text('ICCID',overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.black, fontSize: 16.0)),
                                            trailing: Container(
                                                child: Text(snapshot.child('iccid').value.toString(),overflow: TextOverflow.ellipsis,
                                                  style: TextStyle(color: Colors.grey, fontSize: 17.0, fontWeight: FontWeight.w400 ),)),
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
                                            title: Text('MEID',overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.black, fontSize: 16.0)),
                                            trailing: Container(
                                                child: Text(snapshot.child('meid').value.toString(),overflow: TextOverflow.ellipsis,
                                                  style: TextStyle(color: Colors.grey, fontSize: 17.0, fontWeight: FontWeight.w400 ),)),
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
                                            title: Text('Modem Firmware',overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.black, fontSize: 16.0)),
                                            trailing: Container(
                                                child: Text(snapshot.child('modemFirmware').value.toString(),overflow: TextOverflow.ellipsis,
                                                  style: TextStyle(color: Colors.grey, fontSize: 17.0, fontWeight: FontWeight.w400 ),)),
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
                                            title: Text('SEID', style: TextStyle(color: Colors.black, fontSize: 16.0)),
                                            trailing: Container(
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey[300]),
                                                ],
                                              ),
                                            ),
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
                                            title: Text('Carrier Lock',overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.black, fontSize: 16.0)),
                                            trailing: Container(
                                                child: Text(snapshot.child('carrierLock').value.toString(),overflow: TextOverflow.ellipsis,
                                                  style: TextStyle(color: Colors.grey, fontSize: 17.0, fontWeight: FontWeight.w400 ),)),
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
                                            title: Text('Certificate Trust Settings', style: TextStyle(color: Colors.black, fontSize: 16.0)),
                                            trailing: Container(
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey[300]),
                                                ],
                                              ),
                                            ),
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
              );
            },
          ),


        ));
  }
}

