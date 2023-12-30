import 'package:flutter/material.dart';
import 'package:project_8_fav_places/model/place.dart';

class PlaceDetailScreen extends StatelessWidget {
  const PlaceDetailScreen({super.key, required this.place});

  final Place place;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(place.title),
        ),
        body: Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              child: Image.file(
                place.image,
                fit: BoxFit.cover,
                height: double.infinity,
                width: double.infinity,
              ),
            ),
          ],
        ));
  }
}
