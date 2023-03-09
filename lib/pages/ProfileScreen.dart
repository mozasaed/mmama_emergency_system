import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.person),
          title: const Text("Profile"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 150,
                        color: Colors.deepOrange,
                        width: 150,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Container(
                        // color: Colors.deepOrange,
                        height: 150,
                        // width: MediaQuery.of(context).size.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text("Abdulmajeed Hajji Hassan",style: TextStyle(fontWeight: FontWeight.bold),),
                            Text("abdulmajeedhajji@gmail.com"),
                            Text("+255778398441"),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Contacts",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                        TextButton(onPressed: (){}, child: const Text("Add"))
                      ],
                    ),
                    const Divider(indent: 10,endIndent: 10,),
                    Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(right: 15.0),
                          child: Text("Phone"),
                        ),
                        Text("+255778398441"),
                        Text(", "),
                        Text("+255778398441"),

                      ],
                    ),
                    Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(right: 15.0),
                          child: Text("Email"),
                        ),
                        Text("+abdulmajeedhaji@gmail.com"),

                      ],
                    ),
                    Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(right: 15.0),
                          child: Text("Phone"),
                        ),
                        Text("+255778398441"),

                      ],
                    )
                  ],
                ),
              ),


              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Educational Background",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                        TextButton(onPressed: (){}, child: const Text("Add"))
                      ],
                    ),
                    const Divider(indent: 10,endIndent: 10,),
                    Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(right: 15.0),
                          child: Text("Phone"),
                        ),
                        Text("+255778398441"),
                        Text(", "),
                        Text("+255778398441"),

                      ],
                    ),
                    Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(right: 15.0),
                          child: Text("Email"),
                        ),
                        Text("+abdulmajeedhaji@gmail.com"),

                      ],
                    ),
                    Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(right: 15.0),
                          child: Text("Phone"),
                        ),
                        Text("+255778398441"),

                      ],
                    )
                  ],
                ),
              ),


              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Working Experience",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                        TextButton(onPressed: (){}, child: const Text("Add"))
                      ],
                    ),
                    const Divider(indent: 10,endIndent: 10,),
                    Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(right: 15.0),
                          child: Text("Phone"),
                        ),
                        Text("+255778398441"),
                        Text(", "),
                        Text("+255778398441"),

                      ],
                    ),
                    Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(right: 15.0),
                          child: Text("Email"),
                        ),
                        Text("+abdulmajeedhaji@gmail.com"),

                      ],
                    ),
                    Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(right: 15.0),
                          child: Text("Phone"),
                        ),
                        Text("+255778398441"),

                      ],
                    ),
                  ],
                ),
              ),


              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Availability",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                        TextButton(onPressed: (){}, child: const Text("Add"))
                      ],
                    ),
                    const Divider(indent: 10,endIndent: 10,),
                    Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(right: 15.0),
                          child: Text("Phone"),
                        ),
                        Text("+255778398441"),
                        Text(", "),
                        Text("+255778398441"),

                      ],
                    ),
                  ],
                ),
              )
            ],

          ),
        ),
      ),
    );
  }
}
