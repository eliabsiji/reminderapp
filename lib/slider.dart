import 'package:flutter/material.dart';
import 'package:introduction_slider/source/presentation/pages/introduction_slider.dart';
import 'package:introduction_slider/source/presentation/widgets/background_decoration.dart';
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
      items: const [
        IntroductionSliderItem(
        
          title: Text("Get all Items Packed for your Trip"),
          backgroundColor: Colors.white70,
          backgroundImageDecoration: BackgroundImageDecoration(
          image: AssetImage("images/packing-list.png"),
          
          // colorFilter: ColorFilter.mode(
          //   Colors.black.withOpacity(0.6),
          //   BlendMode.darken,
        ),
        ),
        
        IntroductionSliderItem(
          logo: FlutterLogo(),
          title: Text("Title 2"),
           backgroundColor: Colors.white70,
        ),
        IntroductionSliderItem(
          logo: FlutterLogo(),
          title: Text("Title 3"),
          backgroundColor: Colors.white70,
        ),
      ],
      done: const Done(
        curve: Curves.easeInOut,
        child: Icon(Icons.done),
        home: LogInScreen(),
      ),
      next: const Next(child: Icon(Icons.arrow_forward)),
      back: const Back(child: Icon(Icons.arrow_back)),
      dotIndicator: const DotIndicator(),
    );
  }
}

