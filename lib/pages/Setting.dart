import 'package:colorize_text_avatar/colorize_text_avatar.dart';
import 'package:flutter/material.dart';
import 'package:mmama/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  late String? name = "";
  late String? email = "";
  bool _isLoading = true;
  bool isSwitched = false;
  var textValue = 'Switch is OFF';



  void initState() {
    super.initState();
    getPrefence();

  }
  getPrefence() async {
    setState(() {
      _isLoading = true; //make loading true to show progressindicator
    });
    SharedPreferences preferences = await SharedPreferences.getInstance();
    name = preferences.getString("name");
    email = preferences.getString("email");
    setState(() {
      _isLoading = false; //make loading true to show progressindicator
    });
  }

  void toggleSwitch(bool value) {

    if(isSwitched == false)
    {
      setState(() {
        isSwitched = true;
        textValue = 'Switch Button is ON';
      });
      print('Switch Button is ON');
    }
    else
    {
      setState(() {
        isSwitched = false;
        textValue = 'Switch Button is OFF';
      });
      print('Switch Button is OFF');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color(0xFFeaebe9),
      appBar: AppBar(
        leading: const Icon(Icons.settings),
        title: const Text("Setting"),
        // backgroundColor: const Color(0xFFf5b91c),
      ),
      body: SingleChildScrollView(
        child: Container(
          // margin: EdgeInsets.only(top: 25,left: 20,right: 20),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Container(
                //   margin: EdgeInsets.only(top: 25,left: 20,right: 20),
                //   child: _isLoading?CircularProgressIndicator():Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                //     children: [
                //       Container(
                //         child: TextAvatar(
                //           shape: Shape.Circular,
                //           size: 85,
                //           fontSize: 30,
                //           text: "$name",
                //           numberLetters: 2,
                //         ),
                //       ),
                //       Container(
                //         // color: Colors.green,
                //         margin: const EdgeInsets.only(right: 70),
                //         child: Column(
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: [
                //             Text("${name}",style: TextStyle(fontSize: 17),),
                //             Text("${email}",textAlign: TextAlign.right,),
                //             Divider(
                //               thickness: 5,
                //               color: Colors.black,
                //             ),
                //           ],
                //         ),
                //
                //       )
                //     ],
                //   ),
                // ),
                Container(
                  margin: EdgeInsets.only(top: 20,left: 20,bottom: 15),
                  child: const Text("Preferences"),
                ),
                Container(

                  color: Colors.white,
                  child: Column(
                    children:  [
                      Row(
                        children: const [

                        ],
                      ),
                      const  SizedBox(
                        height: 50,
                        child: ListTile(
                          leading: Icon(Icons.language),
                          title: Text(
                            'Language',
                          ),
                          subtitle: Text("English"),
                          trailing: Icon(Icons.arrow_forward_ios),

                        ),
                      ),

                      // Divider(),
                      SizedBox(
                        height: 65,
                        child: ListTile(
                            leading: const Icon(Icons.looks),
                            title: const Text(
                              'Appearance',
                            ),
                            subtitle: const Text("White Mode"),
                            trailing: Switch(
                              onChanged: toggleSwitch,
                              value: isSwitched,
                              activeColor: Color(0xFFf5b91c),
                              activeTrackColor: Color(0xFFf5b91c),
                              inactiveThumbColor: Colors.green,
                              inactiveTrackColor: Colors.green,
                            )
                        ),
                      ),
                      // Divider(),
                      // const SizedBox(
                      //   height: 50,
                      //   child: ListTile(
                      //     leading: Icon(Icons.add),
                      //     title: Text(
                      //       'GFG title',
                      //     ),
                      //     trailing: Icon(Icons.done),
                      //   ),
                      // ),
                      // // Divider(),
                      // const SizedBox(
                      //   height: 50,
                      //   child: ListTile(
                      //     leading: Icon(Icons.add),
                      //     title: Text(
                      //       'GFG title',
                      //     ),
                      //     trailing: Icon(Icons.done),
                      //   ),
                      // ),
                      // // Divider(),
                      // const SizedBox(
                      //   height: 50,
                      //   child: ListTile(
                      //     leading: Icon(Icons.add),
                      //     title: Text(
                      //       'GFG title',
                      //     ),
                      //     trailing: Icon(Icons.done),
                      //   ),
                      // ),
                    ],
                  ),
                ),


                Container(
                  margin: const EdgeInsets.only(top: 20,left: 20,bottom: 15),
                  child: const Text("Notifications"),
                ),
                Container(
                  color: Colors.white,
                  child: Column(
                    children:  [
                      Row(
                        children: const [
                        ],
                      ),
                      const SizedBox(
                        height: 50,
                        child: ListTile(
                          leading: Icon(Icons.notification_add_outlined),
                          title: Text(
                            'Push Notifications',
                          ),
                          // trailing: Icon(Icons.done),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                        child: ListTile(
                          leading: Icon(Icons.notification_add_outlined),
                          title: Text(
                            'Push Notifications',
                          ),
                          // trailing: Icon(Icons.done),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                        child: ListTile(
                          leading: Icon(Icons.notification_add_outlined),
                          title: Text(
                            'Push Notifications',
                          ),
                          // trailing: Icon(Icons.done),
                        ),
                      ),

                      // Divider(),
                      const SizedBox(
                        height: 50,
                        child: ListTile(
                          leading: Icon(Icons.update_outlined),
                          title: Text(
                            'Update',
                          ),
                          // trailing: Icon(Icons.done),
                        ),
                      ),
                    ],
                  ),
                ),


                Container(
                  margin: EdgeInsets.only(top: 20,left: 20,bottom: 15),
                  child: const Text("Application"),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  color: Colors.white,
                  child: Column(
                    children:  [
                      Row(
                        children: const [

                        ],
                      ),
                      const SizedBox(
                        height: 50,
                        child: ListTile(
                          leading: Icon(Icons.language),
                          title: Text(
                            'Private Policy',
                          ),
                          // trailing: Icon(Icons.done),
                        ),
                      ),

                      // Divider(),
                      const SizedBox(
                        height: 50,
                        child: ListTile(
                          leading: Icon(Icons.policy_outlined),
                          title: Text(
                            'About App',
                          ),
                          // trailing: Icon(Icons.policy_outlined),
                        ),
                      ),

                      // Divider(),
                      SizedBox(
                        height: 50,
                        child: ListTile(
                          onTap: () async {
                            // print("clicked");

                            SharedPreferences preferences = await SharedPreferences.getInstance();
                            preferences.clear();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Home(),
                              ),
                            );
                          },
                          leading: const Icon(Icons.logout),
                          title: const Text(
                            'Sign Out',
                          ),
                          // trailing: Icon(Icons.done),
                        ),
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}


// class Settings extends StatelessWidget {
//   const Settings({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     getPrefence() async {
//       SharedPreferences preferences = await SharedPreferences.getInstance();
//       return preferences.getString("name");
//     }
//
//     return Scaffold(
//       backgroundColor:  Color(0xFFeaebe9),
//       appBar: AppBar(
//         leading: const Icon(Icons.settings),
//         title: const Text("Setting"),
//         backgroundColor: const Color(0xFFf5b91c),
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           // margin: EdgeInsets.only(top: 25,left: 20,right: 20),
//           child: Container(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Container(
//                   margin: EdgeInsets.only(top: 25,left: 20,right: 20),
//                 child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       Container(
//                         child: TextAvatar(
//                           shape: Shape.Circular,
//                           size: 85,
//                           text: "Deniz Çolak",
//                           numberLetters: 2,
//                         ),
//                       ),
//                       Container(
//                         margin: const EdgeInsets.only(right: 80),
//                         child: Column(
//                           children: const [
//                             Text("Zakaria Ng'ombe",style: TextStyle(fontSize: 17),),
//                             Text("zakaria@gmail.com"),
//                             Divider(
//                               thickness: 5,
//                               color: Colors.black,
//                             ),
//                           ],
//                         ),
//
//                       )
//                     ],
//                   ),
//                 ),
//                 Container(
//                   margin: EdgeInsets.only(top: 20,left: 20,bottom: 15),
//                   child: const Text("Preferences"),
//                 ),
//                 Container(
//
//                   color: Colors.white,
//                   child: Column(
//                     children:  [
//                       Row(
//                         children: const [
//
//                         ],
//                       ),
//                        const SizedBox(
//                          height: 50,
//                          child: ListTile(
//                           leading: Icon(Icons.language),
//                           title: Text(
//                             'Language',
//                           ),
//                           subtitle: Text("English"),
//                           trailing: Icon(Icons.arrow_forward_ios),
//                       ),
//                        ),
//
//                       // Divider(),
//                       const SizedBox(
//                         height: 50,
//                         child: ListTile(
//                           leading: Icon(Icons.add),
//                           title: Text(
//                             'GFG title',
//                           ),
//                           trailing: Icon(Icons.done),
//                         ),
//                       ),
//                       // Divider(),
//                       const SizedBox(
//                         height: 50,
//                         child: ListTile(
//                           leading: Icon(Icons.add),
//                           title: Text(
//                             'GFG title',
//                           ),
//                           trailing: Icon(Icons.done),
//                         ),
//                       ),
//                       // Divider(),
//                       const SizedBox(
//                         height: 50,
//                         child: ListTile(
//                           leading: Icon(Icons.add),
//                           title: Text(
//                             'GFG title',
//                           ),
//                           trailing: Icon(Icons.done),
//                         ),
//                       ),
//                       // Divider(),
//                       const SizedBox(
//                         height: 50,
//                         child: ListTile(
//                           leading: Icon(Icons.add),
//                           title: Text(
//                             'GFG title',
//                           ),
//                           trailing: Icon(Icons.done),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//
//
//                 Container(
//                   margin: EdgeInsets.only(top: 20,left: 20,bottom: 15),
//                   child: const Text("Notifications"),
//                 ),
//                 Container(
//                   color: Colors.white,
//                   child: Column(
//                     children:  [
//                       Row(
//                         children: const [
//
//                         ],
//                       ),
//                       const SizedBox(
//                         height: 50,
//                         child: ListTile(
//                           leading: Icon(Icons.notification_add_outlined),
//                           title: Text(
//                             'Push Notifications',
//                           ),
//                           // trailing: Icon(Icons.done),
//                         ),
//                       ),
//
//                       // Divider(),
//                       const SizedBox(
//                         height: 50,
//                         child: ListTile(
//                           leading: Icon(Icons.update_outlined),
//                           title: Text(
//                             'Update',
//                           ),
//                           // trailing: Icon(Icons.done),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//
//
//                 Container(
//                   margin: EdgeInsets.only(top: 20,left: 20,bottom: 15),
//                   child: const Text("Application"),
//                 ),
//                 Container(
//                   margin: EdgeInsets.only(bottom: 10),
//                   color: Colors.white,
//                   child: Column(
//                     children:  [
//                       Row(
//                         children: const [
//
//                         ],
//                       ),
//                       const SizedBox(
//                         height: 50,
//                         child: ListTile(
//                           leading: Icon(Icons.language),
//                           title: Text(
//                             'Private Policy',
//                           ),
//                           // trailing: Icon(Icons.done),
//                         ),
//                       ),
//
//                       // Divider(),
//                       const SizedBox(
//                         height: 50,
//                         child: ListTile(
//                           leading: Icon(Icons.policy_outlined),
//                           title: Text(
//                             'About E-Paper',
//                           ),
//                           // trailing: Icon(Icons.policy_outlined),
//                         ),
//                       ),
//
//                       // Divider(),
//                        SizedBox(
//                         height: 50,
//                         child: ListTile(
//                           onTap: () async {
//                             // print("clicked");
//                             SharedPreferences preferences = await SharedPreferences.getInstance();
//                             preferences.clear();
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => LoginScreen(),
//                               ),
//                             );
//                           },
//                           leading: const Icon(Icons.logout),
//                           title: const Text(
//                             'Sign Out',
//                           ),
//                           // trailing: Icon(Icons.done),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }