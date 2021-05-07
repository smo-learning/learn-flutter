import 'package:flutter/material.dart';
import 'package:great_places_app/providers/great_places.dart';
import 'package:great_places_app/screens/add_place_screen.dart';
import 'package:provider/provider.dart';

class PlacesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Places'),
        actions: [
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
              })
        ],
      ),
      body: Consumer<GreatPlaces>(
        builder: (ctx, greatPlaces, ch) {
          return greatPlaces.items.length <= 0
              ? ch
              : ListView.builder(
                  itemBuilder: (ctx, index) {
                    var item = greatPlaces.items[index];
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: FileImage(item.image),
                      ),
                      title: Text(item.title),
                      onTap: () {
                        // go to detail page
                      },
                    );
                  },
                  itemCount: greatPlaces.items.length);
        },
        child: Center(
          child: const Text('Got not places yet, start adding some!'),
        ),
      ),
    );
  }
}
