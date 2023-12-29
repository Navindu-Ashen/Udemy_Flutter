import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_8_fav_places/model/place.dart';

class UserPlacesNotifier extends StateNotifier<List<Place>> {
  UserPlacesNotifier() : super(const []);

  void addPlace(String title) {
    final newPlace = Place(title: title);
    state = [newPlace, ...state];
  }

  final userPlacesProvider = StateNotifierProvider(
    (ref) => UserPlacesNotifier(),
  );
}
