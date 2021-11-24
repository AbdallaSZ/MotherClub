import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:device_preview/device_preview.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motherclub/app/provider/AuthProvider.dart';
import 'package:motherclub/app/provider/UserProvider.dart';
import 'package:motherclub/app/routes/app_pages.dart';
import 'package:motherclub/common/Constant/ColorConstants.dart';
import 'package:motherclub/common/Utils/Utils.dart';
import 'package:provider/provider.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Utils.userPreferences.initialize();

  await Firebase.initializeApp();
  runApp(

       MyApp()
  );
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: GetMaterialApp(
        builder: DevicePreview.appBuilder,
        title: 'Application',
        debugShowCheckedModeBanner: false,
        defaultTransition:Transition.cupertino,
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
        theme: ThemeData(
          textTheme: TextTheme(
            headline1: GoogleFonts.roboto(fontSize: 22,fontWeight: FontWeight.w700,color: white_color,letterSpacing: 0.25) ,
            headline2: GoogleFonts.roboto(fontSize: 20,fontWeight: FontWeight.w700,color: white_color) ,
            bodyText1: GoogleFonts.roboto(fontSize: 14,fontWeight: FontWeight.w600,color: white_color),
            headline5: GoogleFonts.roboto(fontSize: 14,fontWeight: FontWeight.bold,color: Black_textColor),
            headline4: GoogleFonts.roboto(fontSize: 18,fontWeight: FontWeight.bold,color: Black_textColor),
            headline3: GoogleFonts.roboto(fontSize: 20,fontWeight: FontWeight.w700,color: Black_textColor),
            bodyText2: GoogleFonts.roboto(fontSize: 14,fontWeight: FontWeight.w500,color: Black_textColor),


          ),
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),

      ),
    );
  }
}


