import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'map_states.dart';

class MapCubit extends Cubit<MapStates> {
  MapCubit() : super(MapInitialState());

  static MapCubit get(context) => BlocProvider.of(context);

  //GET THE CURRENT LOCATION OF THE BABY
  late LatLng locationLatLng = const LatLng(31.0409, 31.3785);
  Set<Marker> markers = {};

  Future<Position> getCurrentLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        log('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      log('Location permissions are permanently denied, we cannot request permissions.');
    }
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    return position;
  }

  Future<void> getBabyLocation(mapController) async {
    emit(GetLocationLoadingState());

    await getCurrentLocation().then((currentLocation) async {
      locationLatLng =
          LatLng(currentLocation.latitude, currentLocation.longitude);

      final CameraPosition myCameraPosition = CameraPosition(
        target: locationLatLng,
        tilt: 59.440717697143555,
        zoom: 15,
      );

      await goToBabyLocation(myCameraPosition, mapController);

      emit(GetBabyLocationSuccessState());
    }).catchError((error) {
      log('Error getUserLocation : $error');
      emit(GetBabyLocationErrorState());
    });
  }

  Future<void> goToBabyLocation(myCameraPosition, mapController) async {
    try {
      final GoogleMapController controller = await mapController.future;
      controller
          .animateCamera(CameraUpdate.newCameraPosition(myCameraPosition));
    } catch (e) {
      log('Error goToBabyLocation : $e');
    }
  }
}
