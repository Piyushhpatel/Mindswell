// import 'package:fitness_app_megahack/Mental/Chatbot/dialog_flow.dart';
// import 'package:fitness_app_megahack/Mental/video/youtube.dart';
// import 'package:fitness_app_megahack/map/map_view.dart';
import 'package:flutter/material.dart';
import 'package:mindswells/home/mental_health/audio_page.dart';
// import 'package:mindswells/home/chat/chat.dart';
import 'package:mindswells/theme/dimensions.dart';

class Fourth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Welcome to Fourth',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: Center(child: Text('Mental Fitness')),
        ),
        body: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  height: Dimensions.height200,
                  width: Dimensions.width300,
                  decoration: new BoxDecoration(
                    borderRadius:
                        BorderRadius.all(Radius.circular(Dimensions.height30)),
                    image: DecorationImage(
                      image: new AssetImage('assets/Mental/mental.png'),
                      fit: BoxFit.fill,
                    ),
                    shape: BoxShape.rectangle,
                  ),
                ),
                InkWell(
                    child: Container(
                      height: Dimensions.height150,
                      width: Dimensions.width410,
                      decoration: new BoxDecoration(
                        borderRadius: BorderRadius.all(
                            Radius.circular(Dimensions.height46)),
                        image: DecorationImage(
                          image: new AssetImage('assets/Mental/motivation.png'),
                          fit: BoxFit.contain,
                        ),
                        shape: BoxShape.rectangle,
                        border: Border.all(
                          width: 1,
                        ),
                      ),
                    ),
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) => YoutubePlayerDemoApp()),
                      // );
                    }),
                Text('Motivational Video',
                    style: TextStyle(fontSize: Dimensions.height20)),
                SizedBox(height: Dimensions.height20),
                InkWell(
                    child: Container(
                      height: Dimensions.height150,
                      width: Dimensions.width410,
                      decoration: new BoxDecoration(
                        borderRadius: BorderRadius.all(
                            Radius.circular(Dimensions.height46)),
                        image: DecorationImage(
                          image: new AssetImage('assets/Mental/music.png'),
                          fit: BoxFit.contain,
                        ),
                        shape: BoxShape.rectangle,
                        border: Border.all(
                          width: 1,
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AudioPlayerPage()),
                      );
                    }),
                Text('Music Therapy',
                    style: TextStyle(fontSize: Dimensions.height20)),
                SizedBox(height: Dimensions.height20),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
