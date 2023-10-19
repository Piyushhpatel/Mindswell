import 'package:flutter/material.dart';
import 'package:mindswells/auth/login.dart';
import 'package:mindswells/theme/dimensions.dart';
// import 'package:flutter_fitness_app/HomeScreen.dart';
import 'package:mindswells/theme/my_colors.dart';

class IntroductionScreen extends StatelessWidget {
  const IntroductionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
        child: Scaffold(
          body: Container(
            padding: EdgeInsets.symmetric(horizontal: Dimensions.width20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset('assets/intro.png'),
                SizedBox(
                  height: Dimensions.height20,
                ),
                Container(
                  width: size.width * 0.75,
                  child: Text(
                    "Keep Your Mental And Physical Health In Check",
                    style: TextStyle(
                        fontSize: Dimensions.height25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: Dimensions.height10,
                ),
                Text(
                  "Track your Menatal and Physical Health by our smart Mobile App. Mood, sleep and training.",
                  style: TextStyle(
                      color: Colors.black54, height: Dimensions.height1_5),
                ),
                SizedBox(
                  height: Dimensions.height10,
                ),
                Row(
                  children: [
                    Spacer(),
                    RawMaterialButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()));
                      },
                      elevation: 2.0,
                      fillColor: MyColor.kPrimaryColor,
                      child: Icon(
                        Icons.arrow_forward_ios_sharp,
                        color: Colors.white,
                      ),
                      padding: EdgeInsets.all(Dimensions.height15),
                      shape: CircleBorder(),
                    )
                  ],
                ),
                SizedBox(
                  height: Dimensions.height60,
                )
              ],
            ),
          ),
        ),
        onWillPop: () async => false);
  }
}
