import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:introduction_slider/source/presentation/pages/introduction_slider.dart';
import 'package:introduction_slider/source/presentation/widgets/buttons.dart';
import 'package:introduction_slider/source/presentation/widgets/dot_indicator.dart';
import 'package:introduction_slider/source/presentation/widgets/introduction_slider_item.dart';
import 'package:reminderapp/screens/login.dart';


class IntroSlider extends StatelessWidget {
  const IntroSlider({super.key});

   @override
  Widget build(BuildContext context) {
    return IntroductionSlider(
      showStatusBar: true,
      items:  [
        IntroductionSliderItem(
        
          title: AnimatedTextKit(
                animatedTexts: [
                  RotateAnimatedText('GET YOUR THINGS READY', textStyle: const TextStyle(color:Color.fromARGB(255, 35, 38, 192),fontSize: 25,fontWeight: FontWeight.w500  ),),
                  RotateAnimatedText('LEAVE NOTHING BEHIND', textStyle: const TextStyle(color:Color.fromARGB(255, 35, 38, 192),fontSize: 25,fontWeight: FontWeight.w500  )),
                  RotateAnimatedText('WITH YOUR TRAVEL APP',textStyle: const TextStyle(color:Color.fromARGB(255, 35, 38, 192),fontSize: 25,fontWeight: FontWeight.w500)),
                ],
                totalRepeatCount: 4,
                pause: const Duration(milliseconds: 1000),
                displayFullTextOnTap: true,
                stopPauseOnTap: true,
                onTap: () {
                  print("Tap Event");
                },
              ),
       
          backgroundColor: Colors.white70,
        //   backgroundImageDecoration: const BackgroundImageDecoration(
        //   image: AssetImage("images/packing-list.png"),
        //   fit:BoxFit.contain
          
        //   // colorFilter: ColorFilter.mode(
        //   //   Colors.black.withOpacity(0.6),
        //   //   BlendMode.darken, 
        // ),       
        ),
        
         IntroductionSliderItem(
          title: AnimatedTextKit(
                animatedTexts: [
                  WavyAnimatedText('Travel Now Now',textStyle: const TextStyle(color:Colors.blueAccent, fontSize: 25, fontWeight: FontWeight.w500)),
                ],
                isRepeatingAnimation: true,
                pause: const Duration(milliseconds: 1000),
                displayFullTextOnTap: true,
                stopPauseOnTap: true,
                // onTap: () {
                //   print("Tap Event");
                // },
              ),
           backgroundColor: Colors.white70,
           
        ),
       
      ],
      
      done: const Done(
        curve: Curves.bounceInOut,
        child: Icon(Icons.login_rounded),
        home: LogInScreen(),
      ),
      // next: const Next(child: Icon(Icons.arrow_forward)),
      // back: const Back(child: Icon(Icons.arrow_back)),
      dotIndicator: const DotIndicator(),
      
    );
  }
}