import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class DocDashboard extends StatefulWidget {
  const DocDashboard({Key? key}) : super(key: key);

  @override
  State<DocDashboard> createState() => _DocDashboardState();
}

class _DocDashboardState extends State<DocDashboard> {
  late GoogleMapController mapController;
  final Location _location = Location();
  late LatLng _currentPosition;
  // late LatLng no = ();

  late LatLng _center;
  bool isLoading = false;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  void initState() {
    super.initState();
    // getUserCurrentLocation();
    getUserCurrentLocation().then((value) async {
      print(value.latitude.toString() + " " + value.longitude.toString());
      _center = LatLng(value.latitude, value.longitude);
      setState(() {
        _center = LatLng(value.latitude, value.longitude);
        isLoading = false;
      });
    });
  }

  Future<Position> getUserCurrentLocation() async {
    setState(() {
      isLoading = true;
    });
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) async {
      await Geolocator.requestPermission();
      print("ERROR" + error.toString());
    });
    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.home),
          title: const Text("Home"),
        ),
        body: isLoading
            ? const Center(child: CircularProgressIndicator())
            : Stack(children: [
                GoogleMap(
                    onMapCreated: _onMapCreated,
                    initialCameraPosition: CameraPosition(
                      target: _center,
                      zoom: 14.0,
                    ),
                    markers: {
                      // Marker(
                      //   markerId: MarkerId('Doctor Makker'),
                      //   position: _center,
                      // ),
                      Marker(
                        markerId: MarkerId('patient'),
                        position: LatLng(-6.186286, 39.221033),
                        onTap: () {
                          _showBottomSheet();
                        },
                      ),
                      Marker(
                        markerId: MarkerId('patients'),
                        position: LatLng(-6.185832, 39.220613),
                        onTap: () {
                          _showBottomSheet();
                        },
                        // icon: iconss
                      ),
                    }),
                Positioned(
                  top: 0,
                  right: 10,
                  left: 10,
                  child: Container(
                    width: 100,
                    height: 100,
                    // color: Colors.white,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 35,
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 4.0, right: 0),
                                    child: Image.asset(
                                      'assets/images/preg_woman.png',
                                      width: 20,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 5.0),
                                    child: const Text(
                                      'Pregnant Woman',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 35,
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 4.0, right: 0),
                                    child: Image.asset(
                                      'assets/images/elderly.png',
                                      width: 20,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: const Text(
                                      'Very Eldery',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 35,
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 4.0, right: 0),
                                    child: Image.asset(
                                      'assets/images/critical.png',
                                      width: 20,
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text('Critical',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 35,
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: const Text('Critical',
                                    textAlign: TextAlign.center,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ]),
      ),
    );
  }

  void _showBottomSheet() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 500,
          color: Colors.white,
          child: Center(
            child: Column(
              children: [
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        height: 100,
                        width: 100,
                        color: Colors.deepOrange,
                        child: Text("Pict"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        height: 100,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: const [
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    "Name:",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Text("Ismail Sarr Benzema"),
                              ],
                            ),
                            Row(
                              children: const [
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    "Age:",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Text("85"),
                              ],
                            ),
                            Row(
                              children: const [
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    "Contact:",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Text("+255778398441"),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Text("data"),
                    ],
                  ),
                )
                // Text('This is my bottom sheet'),
              ],
            ),
          ),
        );
      },
    );
  }
}
