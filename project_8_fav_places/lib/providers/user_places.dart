import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_8_fav_places/model/place.dart';
import 'dart:io';

class UserPlacesNotifier extends StateNotifier<List<Place>> {
  UserPlacesNotifier() : super(const []);

  void addPlace(String title, File image, PlaceLocation location) {
    final newPlace = Place(title: title, image: image, location: location);
    state = [newPlace, ...state];
  }

  }

  final userPlacesProvider = StateNotifierProvider<UserPlacesNotifier, List<Place>>(
    (ref) => UserPlacesNotifier(),
  );

