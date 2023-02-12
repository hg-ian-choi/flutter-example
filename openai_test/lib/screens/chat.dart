import 'package:flutter/material.dart';
import 'package:openai_test/components/bubble_modal.dart';
import 'package:openai_test/services/google_service.dart';
import 'dart:math' as math;


class Chat extends StatefulWidget {
  const Chat({Key? key, required this.imagePath}) : super(key: key);

  final String imagePath;

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final _googleService = GoogleService();
  bool showSignOut = false;

  final _controler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat GPT-3'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _controler,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(10),
                            ),
                          ),
                          hintText: 'Enter a search term',
                          suffixIcon: IconButton(
                            onPressed: () {
                              _controler.clear();
                            },
                            icon: const Icon(Icons.clear),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                      ),
                      child: Transform.rotate(
                        angle: -45 * math.pi / 180,
                        child: IconButton(
                          color: Colors.white,
                          icon: const Icon(Icons.send),
                          onPressed: () {
                            print('on Send Click!');
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
              // Stack(
              //   clipBehavior: Clip.none,
              //   children: [
              //     IconButton(
              //       onPressed: () {
              //         setState(() {
              //           showSignOut = !showSignOut;
              //         });
              //       },
              //       icon: Image.network(
              //         widget.imagePath,
              //       ),
              //     ),
              //     showSignOut
              //         ? Positioned(
              //             bottom: 55,
              //             right: 25,
              //             child: CustomPaint(
              //               painter: BubbleModal(),
              //               child: Container(
              //                 // decoration: BoxDecoration(
              //                 //   borderRadius: BorderRadius.only(
              //                 //     topLeft: Radius.circular(15),
              //                 //     topRight: Radius.circular(15),
              //                 //     bottomLeft: Radius.circular(15),
              //                 //   ),
              //                 //   border: Border.all(
              //                 //     width: 1,
              //                 //     color: Colors.black,
              //                 //   ),
              //                 // ),
              //                 // margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              //                 padding: const EdgeInsets.symmetric(horizontal: 5),
              //                 child: TextButton(
              //                   onPressed: () {
              //                     print('onButtonClick!!!');
              //                   },
              //                   style: TextButton.styleFrom(
              //                     backgroundColor: Colors.white,
              //                     padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              //                   ),
              //                   child: const Text(
              //                     'Hello, World!',
              //                     style: TextStyle(color: Colors.black),
              //                   ),
              //                 ),
              //               ),
              //             ),
              //           )
              //         : const SizedBox(height: 0),
              //   ],
              // ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 25, bottom: 5),
                    child: showSignOut
                        ? CustomPaint(
                            painter: BubbleModal(),
                            child: Container(
                              // decoration: BoxDecoration(
                              //   borderRadius: BorderRadius.only(
                              //     topLeft: Radius.circular(15),
                              //     topRight: Radius.circular(15),
                              //     bottomLeft: Radius.circular(15),
                              //   ),
                              //   border: Border.all(
                              //     width: 1,
                              //     color: Colors.black,
                              //   ),
                              // ),
                              // margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                              padding: const EdgeInsets.symmetric(horizontal: 5),
                              child: TextButton(
                                onPressed: () {
                                  print('onButtonClick!!!');
                                },
                                style: TextButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                ),
                                child: const Text(
                                  'Hello, World!',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
                          )
                        : const SizedBox(height: 0),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        showSignOut = !showSignOut;
                      });
                    },
                    icon: Image.network(
                      widget.imagePath,
                    ),
                  ),
                ],
              ),
              // Image.network(widget.imagePath),
            ],
          ),
        ),
      ),
    );
  }
}
