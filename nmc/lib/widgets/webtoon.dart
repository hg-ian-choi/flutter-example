import 'package:flutter/material.dart';
import 'package:nmc/screens/detail_screen.dart';

class Webtoon extends StatelessWidget {
  final String id, title, thumbnail;

  const Webtoon({
    super.key,
    required this.id,
    required this.title,
    required this.thumbnail,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(
              id: id,
              title: title,
              thumbnail: thumbnail,
            ),
            fullscreenDialog: true,
          ),
        );
      },
      child: Column(
        children: <Widget>[
          Hero(
            tag: id,
            child: Container(
              width: 250,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    blurRadius: 15,
                    offset: const Offset(10, 10),
                    color: Colors.black.withOpacity(0.5),
                  ),
                ],
              ),
              child: Image.network(thumbnail),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 22,
            ),
          ),
        ],
      ),
    );
  }
}
