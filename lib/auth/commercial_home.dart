import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart' as geo;
import 'package:google_fonts/google_fonts.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

class CommercialHome extends StatefulWidget {
  const CommercialHome({super.key});

  @override
  State<CommercialHome> createState() => _CommercialHomeState();
}

class _CommercialHomeState extends State<CommercialHome> {
  MapboxMap? mapboxMap;

  CameraOptions? camera;

  geo.Position? position;

  Future<geo.Position> _determinePosition() async {
    bool serviceEnabled;
    geo.LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await geo.Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await geo.Geolocator.checkPermission();
    if (permission == geo.LocationPermission.denied) {
      permission = await geo.Geolocator.requestPermission();
      if (permission == geo.LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == geo.LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await geo.Geolocator.getCurrentPosition();
  }

  @override
  void initState() {
    super.initState();

    _determinePosition().then(
      (value) async {
        log("_determinePosition: $value");
        setState(() {
          position = value;
          camera = CameraOptions(
            center: Point(
                coordinates: Position(
              position!.longitude,
              position!.latitude,
            )),
            zoom: 10,
          );

          mapboxMap!.setCamera(camera!);

          mapboxMap!.annotations
              .createPointAnnotationManager()
              .then((PointAnnotationManager m) {
            rootBundle.load('assets/car.png').then(
              (ByteData bytes) {
                final Uint8List imageData = bytes.buffer.asUint8List();

                PointAnnotationOptions pointAnnotationOptions =
                    PointAnnotationOptions(
                  geometry: Point(
                    coordinates: Position(
                      position!.longitude,
                      position!.latitude,
                    ),
                  ),
                  image: imageData,
                  iconSize: 0.3,
                );

                m.create(pointAnnotationOptions);
              },
            );

            rootBundle.load('assets/map-marker-icon.png').then(
              (ByteData bytes) {
                final Uint8List imageData = bytes.buffer.asUint8List();

                PointAnnotationOptions pointAnnotationOptions =
                    PointAnnotationOptions(
                  geometry: Point(
                    coordinates: Position(
                      position!.longitude + 0.1,
                      position!.latitude,
                    ),
                  ),
                  image: imageData,
                  iconSize: 0.3,
                );

                m.create(pointAnnotationOptions);

                pointAnnotationOptions = PointAnnotationOptions(
                  geometry: Point(
                    coordinates: Position(
                      position!.longitude + 0.2,
                      position!.latitude,
                    ),
                  ),
                  image: imageData,
                  iconSize: 0.3,
                );

                m.create(pointAnnotationOptions);
              },
            );
          });
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height * 0.7,
            ),
            child: MapWidget(
              onMapCreated: (controller) {
                mapboxMap = controller;
              },
              cameraOptions: camera,
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 40,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFBE2831),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 50,
                      vertical: 14,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/commercial');
                  },
                  child: Text(
                    'Commencer le trajet',
                    style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
