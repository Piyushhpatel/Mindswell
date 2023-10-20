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
          SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: audioFilePaths.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.all(10),
                  child: ListTile(
                    tileColor: Colors.deepPurple,
                    title: Text('Song $index',
                        style: TextStyle(color: Colors.white)),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AudioPlayerPage(
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
