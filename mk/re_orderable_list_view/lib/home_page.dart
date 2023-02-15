import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // list of tiles
  final List<String> tiles = ['A', 'B', 'C', 'D'];

  // reordeer method
  void updateTiles(int oldIndex, int newIndex) {
    setState(() {
      // an adjustment is needed whe nmoving the tile own the list
      if (oldIndex < newIndex) {
        newIndex--;
      }

      // get the tile which is going to moving
      final tile = tiles.removeAt(oldIndex);

      // place the tile in the new position
      tiles.insert(newIndex, tile);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Drag Drop List'),
      ),
      body: ReorderableListView(
        children: [
          for (final tile in tiles)
            Padding(
              key: ValueKey(tile),
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.grey.shade200,
                child: ListTile(
                  title: Text(tile.toString()),
                ),
              ),
            ),
        ],
        onReorder: (oldIndex, newIndex) => updateTiles(oldIndex, newIndex),
      ),
    );
  }
}
