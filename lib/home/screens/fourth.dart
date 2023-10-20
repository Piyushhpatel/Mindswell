import 'package:flutter/material.dart';
import 'package:mindswells/home/mental_health/audio_page.dart';

class Fourth extends StatelessWidget {
  // Sample list of audio file paths
  final List<String> audioFilePaths = [
    'assets/audio/Instrumental.mp3',
    'assets/audio/MeditationMusicRingtone.mp3',
    'assets/audio/sleepmusic.mp3',
    'assets/audio/testaudio.mp3',
    'assets/audio/YogaandMeditation.mp3',
  ];

  final List<String> audioFileNames = [
    'Instrumental',
    'Meditation Music',
    'Sleep Music',
    'Midnight City',
    'Yoga & Meditation',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 110,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.only(bottom: 18),
            child: Text(
              "Music Therepy",
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
            decoration: BoxDecoration(
              color: Colors.deepPurple,
            ),
          ),
          Center(
            child: Container(
              height: 200,
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                image: DecorationImage(
                  image: AssetImage('assets/Mental/mental.png'),
                  fit: BoxFit.fill,
                ),
                shape: BoxShape.rectangle,
              ),
            ),
          ),
          Text('List of Songs', style: TextStyle(fontSize: 25)),
          Expanded(
            child: ListView.builder(
              itemCount: audioFilePaths.length,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.deepPurple),
                  margin: EdgeInsets.all(10),
                  child: ListTile(
                    // contentPadding: EdgeInsets.all(2),
                    tileColor: Colors.white,
                    title: Row(
                      children: [
                        // Image Placeholder
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                12), // Adjust the radius as needed
                            color: Colors.deepPurple[100], // Placeholder color
                          ),
                          child: Icon(
                            Icons
                                .music_note, // You can replace this with an image
                            color: Colors.deepPurple,
                            size: 40, // Adjust the size as needed
                          ),
                        ),
                        SizedBox(width: 16), // Space between image and title
                        // Title of the Song
                        Text(
                          audioFileNames[index],
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18, // Adjust the font size as needed
                          ),
                        ),
                      ],
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AudioPlayerPage(
                            fileName: audioFileNames[index],
                            musicUrl: audioFilePaths[index],
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
