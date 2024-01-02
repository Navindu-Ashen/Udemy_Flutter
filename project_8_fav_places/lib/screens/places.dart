import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_8_fav_places/providers/user_places.dart';
import 'package:project_8_fav_places/screens/add_place.dart';
import 'package:project_8_fav_places/widgets/places_list.dart';

class PlacesScreen extends ConsumerStatefulElement {
  const PlacesScreen({super.key});
  
  @override
  State<PlacesScreen> createState() => _PlacesScreenState();
}


class _PlacesScreenState extends ConsumerState<PlacesScreen>{
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userPlaces = ref.watch(userPlacesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Places"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => const AddPlaceScreen(),
                ),
              );
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: FutureBuilder(
        future: future,
        builder: (context, snapshot) =>
            snapshot.connectionState == ConnectionState.waiting
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : PlacesList(
                    places: userPlaces,
                  ),
      ),
    );
  }
}
}
