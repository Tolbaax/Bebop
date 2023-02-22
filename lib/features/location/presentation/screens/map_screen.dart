import 'dart:async';

import 'package:bebop/features/location/presentation/cubit/map_cubit.dart';
import 'package:bebop/features/location/presentation/cubit/map_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final Completer<GoogleMapController> _controller = Completer();

  static const CameraPosition _kGoogle = CameraPosition(
    target: LatLng(31.0409, 31.3785),
    zoom: 15,
  );

  Set<Marker> markers = {};

  Future<Position> getBabyCurrentLocation() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) async {
      await Geolocator.requestPermission();
    });
    return await Geolocator.getCurrentPosition();
  }

  @override
  void initState() {
    getBabyCurrentLocation().then(
      (value) async {
        markers.add(
          Marker(
            markerId: const MarkerId('1'),
            position: LatLng(value.latitude, value.longitude),
            infoWindow: const InfoWindow(
              title: 'Baby Current Location',
            ),
          ),
        );
        CameraPosition cameraPosition = CameraPosition(
          target: LatLng(value.latitude, value.longitude),
          zoom: 15.5,
        );
        final GoogleMapController controller = await _controller.future;
        controller
            .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
        setState(() {});
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MapCubit, MapStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: GoogleMap(
            mapType: MapType.normal,
            myLocationButtonEnabled: false,
            tiltGesturesEnabled: true,
            zoomGesturesEnabled: true,
            zoomControlsEnabled: false,
            mapToolbarEnabled: false,
            myLocationEnabled: true,
            compassEnabled: false,
            markers: markers,
            initialCameraPosition: _kGoogle,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          ),
        );
      },
    );
  }
}
