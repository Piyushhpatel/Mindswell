import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

final List<String> imgList = [
  'assets/images/Exercise/B1.jpg',
  'assets/images/Exercise/B2.jpg',
  'assets/images/Exercise/B3.jpg',
  'assets/images/Exercise/B4.jpg',
];

final List<String> imgList2 = [
  'assets/images/Exercise/I1.jpg',
  'assets/images/Exercise/I2.jpg',
  'assets/images/Exercise/I3.jpg',
  'assets/images/Exercise/I4.jpg',
];

final List<String> imgList3 = [
  'assets/images/Exercise/A1.jpg',
  'assets/images/Exercise/A2.jpg',
  'assets/images/Exercise/A3.jpg',
];

final List<String> imgList4 = [
  'assets/images/Exercise/E1.jpg',
  'assets/images/Exercise/E2.jpg',
  'assets/images/Exercise/E3.jpg',
];

class Exercise extends StatefulWidget {
  const Exercise({Key? key}) : super(key: key);

  @override
  _ExerciseState createState() => _ExerciseState();
}

class _ExerciseState extends State<Exercise> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Center(child: Text('Exercises')),
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Text(
                'Exercise For Beginners',
                style: TextStyle(
                  fontSize: 20, // Adjust the font size
                ),
              ),
              Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 0.0),
                    child: CarouselSlider(
                      options: CarouselOptions(
                        autoPlay: true,
                        aspectRatio: 2.0,
                        enlargeCenterPage: true,
                      ),
                      items: imgList.map((i) {
                        return Container(
                          height: 200, // Adjust the height
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(i),
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
              Text(
                'Exercise For Intermediate',
                style: TextStyle(
                  fontSize: 20, // Adjust the font size
                ),
              ),
              Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 0.0),
                    child: CarouselSlider(
                      options: CarouselOptions(
                        autoPlay: true,
                        aspectRatio: 2.0,
                        enlargeCenterPage: true,
                      ),
                      items: imgList2.map((i) {
                        return Container(
                          height: 200, // Adjust the height
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(i),
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
              Text(
                'Exercise For Advance',
                style: TextStyle(
                  fontSize: 20, // Adjust the font size
                ),
              ),
              Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 0.0),
                    child: CarouselSlider(
                      options: CarouselOptions(
                        autoPlay: true,
                        aspectRatio: 2.0,
                        enlargeCenterPage: true,
                      ),
                      items: imgList3.map((i) {
                        return Container(
                          height: 200, // Adjust the height
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(i),
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
              Text(
                'Exercise For Expert',
                style: TextStyle(
                  fontSize: 20, // Adjust the font size
                ),
              ),
              Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 0.0),
                    child: CarouselSlider(
                      options: CarouselOptions(
                        autoPlay: true,
                        aspectRatio: 2.0,
                        enlargeCenterPage: true,
                      ),
                      items: imgList4.map((i) {
                        return Container(
                          height: 200, // Adjust the height
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(i),
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
