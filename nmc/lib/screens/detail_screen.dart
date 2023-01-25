import 'package:flutter/material.dart';
import 'package:nmc/models/webtoon_detail_model.dart';
import 'package:nmc/models/webtoon_episode_model.dart';
import 'package:nmc/services/api_service.dart';
import 'package:nmc/widgets/episode.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DetailScreen extends StatefulWidget {
  final String id, title, thumbnail;

  const DetailScreen({
    super.key,
    required this.id,
    required this.title,
    required this.thumbnail,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late Future<WebtoonDetailModel> webtoon;
  late Future<List<WebtoonEpisodeModel>> episodes;
  late SharedPreferences prefs;
  bool isLiked = false;

  Future initPrefs() async {
    prefs = await SharedPreferences.getInstance();
    final likedWebtoons = prefs.getStringList('likedWebtoons');
    if (likedWebtoons != null) {
      if (likedWebtoons.contains(widget.id)) {
        setState(() {
          isLiked = true;
        });
      }
    } else {
      prefs.setStringList('likedWebtoons', []);
    }
  }

  onLikedTap() async {
    final likedWebtoons = prefs.getStringList('likedWebtoons');
    if (likedWebtoons != null) {
      if (isLiked) {
        likedWebtoons.remove(widget.id);
      } else {
        likedWebtoons.add(widget.id);
      }
      await prefs.setStringList('likedWebtoons', likedWebtoons);
      setState(() {
        isLiked = !isLiked;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    webtoon = ApiService.getWebtoonById(widget.id);
    episodes = ApiService.getWebtoonEpisodeById(widget.id);
    initPrefs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        title: Text(
          widget.title,
          style: const TextStyle(
            fontSize: 24,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              onLikedTap();
            },
            icon: Icon(isLiked
                ? Icons.favorite_outlined
                : Icons.favorite_outline_outlined),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(50),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Hero(
                    tag: widget.id,
                    child: Container(
                      width: 300,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            blurRadius: 15,
                            offset: const Offset(10, 10),
                            color: Colors.black.withOpacity(0.3),
                          ),
                        ],
                      ),
                      child: Image.network(widget.thumbnail),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              FutureBuilder(
                future: webtoon,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          snapshot.data!.about,
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          '${snapshot.data!.genre} / ${snapshot.data!.age}',
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    );
                  }
                  return const Text('...');
                },
              ),
              const SizedBox(
                height: 25,
              ),
              FutureBuilder(
                future: episodes,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: <Widget>[
                        for (var episode in snapshot.data!)
                          Episode(episode: episode, webtoonId: widget.id),
                      ],
                    );
                  }
                  return Container();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
