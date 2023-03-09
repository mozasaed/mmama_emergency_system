import 'package:flutter/material.dart';
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

  customeIcon() async {
    BitmapDescriptor customIcon = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(),
      'assets/custom_icon.png',
    );
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
                    }),
                Positioned(
                  top: 0,
                  right: 10,
                  left: 10,
                  child: Container(
                    width: 100,
                    height: 100,
                    // color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 35,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: const Text('Pregnant Woman',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),),
                          ),
                        ),
                        Container(
                          height: 35,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: const Text('Critical',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),),
                          ),
                        ),
                        Container(
                          height: 35,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: const Text('Critical',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                        ),
                        Container(
                          height: 35,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: const Text('Critical',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ],
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
            child: Text('This is my bottom sheet'),
          ),
        );
      },
    );
  }
}
