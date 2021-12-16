import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motherclub/app/modules/splash/controllers/splash_controllers.dart';
import 'package:motherclub/common/Constant/ColorConstants.dart';
import 'package:motherclub/common/Utils/Utils.dart';


class SplashView extends StatefulWidget {
  @override
  State<SplashView> createState() => _SplashViewState();
}



class _SplashViewState extends State<SplashView> with SingleTickerProviderStateMixin{

  late AnimationController _controller;

  late Animation<double> _animation;
  late Animation<double> _animation2;
  late Animation<double> _animation3;
  var _duration = const Duration(milliseconds: 1000);


  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: _duration,
    )..addListener(() {
      setState(() {});
    });
    _animation = new Tween<double>(begin: 0, end: 1).animate(_controller);
    _animation2 = new Tween<double>(begin: 0, end: 0).animate(_controller);
    _animation3 = new Tween<double>(begin: 0, end: 0).animate(_controller);
        _controller.forward();


      // _controller2 = AnimationController(
      //   vsync: this,
      //   duration: _duration,
      // )..addListener(() {
      //   setState(() {});
      // });
      // _animation2 = new Tween<double>(begin: 0, end: 1).animate(_controller2);
      // _controller2.forward();
      //     .then((value){
      //   _controller3 = AnimationController(
      //     vsync: this,
      //     duration: _duration,
      //   )..addListener(() {
      //     setState(() {});
      //   });
      //   _animation3 = new Tween<double>(begin: 0, end: 1).animate(_controller3);
      //   _controller3.forward();
      // });

  }

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    Utils.initializeLocality(context,myWidth: deviceWidth , myHeight: deviceHeight);
    Utils.initializePref();
    Utils.deviceHeight = MediaQuery.of(context).size.height;
    Utils.deviceWidth = MediaQuery.of(context).size.width;
    Utils.horizontalMargin = MediaQuery.of(context).size.height / 20;
    Utils.verticalMargin = MediaQuery.of(context).size.height / 70;


    return Scaffold(
        backgroundColor: Background_Color,
        body: Container(
          padding: EdgeInsets.only(top: deviceHeight/4.2),
          height: deviceHeight,
          width: deviceWidth,
          child: Column(
            children: [
              AnimatedOpacity(
                opacity: _animation.value,
                duration: _duration,
                child: Container(
                  width: deviceWidth,
                  height: deviceHeight/3.4,
                  child: Image.asset('assets/images/logo.png'),
                ),
                onEnd: (){
                  setState(() {
                    _animation2 = new Tween<double>(begin: 0, end: 1).animate(_controller);
                  });
                },
              ),
              AnimatedOpacity(
                opacity: _animation2.value,
                duration: _duration,
                child: Text('Your Arabic Guide for pregnancy and parenthood',
                  style: Theme.of(context).textTheme.bodyText2,
                  textAlign: TextAlign.center,
                ),
                onEnd: (){
                  setState(() {
                    _animation3 = new Tween<double>(begin: 0, end: 1).animate(_controller);
                  });
                },
              ),
              SizedBox(height: 30,),
              AnimatedOpacity(
                opacity: _animation3.value,
                duration: _duration,
                child: Text('رفيقك في رحلة الحمل والأمومة',
                  style: Theme.of(context).textTheme.bodyText2,
                  textAlign: TextAlign.center,
                ),
                onEnd: (){
                  setState(() {
                    _animation3 = new Tween<double>(begin: 0, end: 1).animate(_controller);
                  });
                },
              )

            ],
          ),

        )
    );
  }
}
