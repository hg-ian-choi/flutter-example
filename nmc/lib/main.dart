import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  bool showTitle = true;

  void toggleTitle() {
    setState(() {
      showTitle = !showTitle;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            color: Colors.red,
          ),
        ),
      ),
      home: Scaffold(
        backgroundColor: const Color(0xFFF4EDDB),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            showTitle ? const Title() : const Text('Nothing'),
            IconButton(
              onPressed: toggleTitle,
              icon: const Icon(Icons.remove_red_eye),
            )
          ],
        )),
      ),
    );
  }
}

class Title extends StatefulWidget {
  const Title({
    super.key,
  });

  @override
  State<Title> createState() => _TitleState();
}

class _TitleState extends State<Title> {
  int count = 0;

  @override
  void initState() {
    super.initState();
    print('initState!');
  }

  @override
  void dispose() {
    super.dispose();
    print('dispose!');
  }

  @override
  Widget build(BuildContext context) {
    print('build!');
    return Text(
      'Title',
      style: TextStyle(
        fontSize: 30,
        color: Theme.of(context).textTheme.titleLarge!.color,
      ),
    );
  }
}
