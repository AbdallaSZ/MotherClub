import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:motherclub/app/language/LangaugeBloc.dart';
import 'package:motherclub/app/language/LanguageEvent.dart';
import 'package:motherclub/app/modules/Settings/UserRepo.dart';
import 'package:motherclub/common/Constant/ColorConstants.dart';
import 'package:motherclub/common/CustomWidget/CustomButton.dart';
import 'package:motherclub/common/CustomWidget/EditTextWithoutIcon.dart';
import 'package:motherclub/common/CustomWidget/statless/custom_appbar.dart';
import 'package:motherclub/common/Utils/Utils.dart';
import 'package:rxdart/rxdart.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  LanguageBloc? _bloc;
  TextEditingController passwordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  GlobalKey<FormState>formKey = GlobalKey();
  GlobalKey<ScaffoldState>scaffoldKey = GlobalKey();
  String _radioValue = Utils.locality == Locality.english
      ? "en"
      : Utils.locality == Locality.arabic
      ? "ar"
      : Utils.locality == Locality.spanish
      ? "es"
      : "ur"; //Initial definition of radio button value
  String? choice;

  void radioButtonChanges(String? value) {
    Navigator.pop(context);
    setState(() {
      _radioValue = value!;
      switch (value) {
        case 'en':
          choice = value;
          break;
        case 'ar':
          choice = value;
          break;
        default:
          choice = null;
      }
      debugPrint(choice); //Debug the choice in console
    });
    //      Strings.isEnglish = value;

    if (choice == "en") {
      _bloc!.add(LanguageEvent(Locale("en", "")));
      Get.updateLocale(Locale("en", ""));
    } else if (choice == "ar") {
      _bloc!.add(LanguageEvent(Locale("ar", "")));
      Get.updateLocale(Locale("ar", ""));
    }
    Future.delayed(Duration(milliseconds: 500)).then((value) {
      Utils.languageSubject.sink.add(true);
      setState(() {

      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    _bloc = BlocProvider.of<LanguageBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: CustomAppBar(title: Utils.labels!.settings,
        withBackButton: true,
        onBackButtonPressed: () {
          Navigator.pop(context);
        },),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 30,bottom: 30),
                  child: GestureDetector(
                    onTap: () {
                    },
                    child: Stack(
                      children: [
                        StreamBuilder<File>(
                          stream: imageSubject.stream,
                          builder: (context, snapshot) {
                            return Container(
                              height:100 ,
                              width:100 ,
                                child: CircleAvatar(
                                  foregroundImage:  getImage(snapshot)
                                  ,
                              )
                            );
                          }
                        ),
                        Positioned(
                          bottom: 0,
                          left: 30,
                            child: GestureDetector(
                              onTap: (){
                                openImagePicker();
                              },
                              child: Container(
                                padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.black12
                          ),
                          alignment: Alignment.center,
                          child: Icon(Icons.camera_alt_outlined, color: Colors.redAccent,),
                        ),
                            ))
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 30),
              child: GestureDetector(
                onTap: () {
                  showPasswordDialog();
                },
                child: Container(
                  child: Row(
                    children: [
                      Icon(Icons.password_outlined, size: 22),
                      SizedBox(width: 15),
                      Text(
                        Utils.labels!.change_password,
                        style: GoogleFonts.roboto(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                            color: Black_textColor),
                      ),
                    ],
                  ),
                ),
              ),
            ),


            GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (c) {
                      return Directionality(
                        textDirection: Utils.locality == Locality.english
                            ? TextDirection.ltr
                            : TextDirection.rtl,
                        child: AlertDialog(
                            title: Text(
                              Utils.labels!.change_language,
                            ),
                            content: Container(
                              alignment: Alignment.centerRight,
                              height: 120,
                              width: 200,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        radioButtonChanges("en");
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Expanded(
                                            flex: 6,
                                            child: Text(
                                              "English",
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Radio(
                                              value: 'en',
                                              groupValue: _radioValue,
                                              onChanged: radioButtonChanges,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        radioButtonChanges("ar");
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Expanded(
                                            flex: 6,
                                            child: Text(
                                              "اللغة العربية",
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Radio(
                                              value: 'ar',
                                              groupValue: _radioValue,
                                              onChanged: radioButtonChanges,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ), /*
                                   Row(
                                     mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                                     children: <Widget>[
                                       Expanded(
                                         flex:6,
                                         child: Text(
                                           "Spanish",
                                         ),
                                       ),
                                       Expanded(
                                         flex:1,
                                         child: Radio(
                                           value: 'es',
                                           groupValue: _radioValue,
                                           onChanged: radioButtonChanges,
                                         ),
                                       ),

                                     ],
                                   ),
                                   Row(
                                     mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                                     children: <Widget>[
                                       Expanded(
                                         flex:6,
                                         child: Text(
                                           "اللغة الأردية",
                                         ),
                                       ),
                                       Expanded(
                                         flex:1,
                                         child: Radio(
                                           value: 'ur',
                                           groupValue: _radioValue,
                                           onChanged: radioButtonChanges,
                                         ),
                                       ),

                                     ],
                                   ),*/
                                  ]),
                            )),
                      );
                    });
                if (choice == "en") {
                  _bloc!.add(LanguageEvent(Locale("en", "")));
                } else if (choice == "ar") {
                  _bloc!.add(LanguageEvent(Locale("ar", "")));
                }
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 20, top: 30),
                child: Container(
                  child: Row(
                    children: [
                      Icon(Icons.g_translate, size: 22),
                      SizedBox(width: 15),
                      Text(
                        Utils.labels!.select_language,
                        style: GoogleFonts.roboto(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                            color: Black_textColor),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  String imageText = "";
  String imageName = "Upload Profile Image" ;
  File? imageFile ;
  BehaviorSubject<File> imageSubject = BehaviorSubject();
  void openImagePicker() async{
    final ImagePicker _picker = ImagePicker();
    // Pick an image
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    final path = image!.path;
    imageName = image.name;
    imageFile  = File(path);
    final bytes = await imageFile!.readAsBytes();
    var result = base64Encode(bytes);
    imageText = result;
    showDialog(context: context, builder: (c){
      return AlertDialog(
        title: Text(Utils.labels!.warning),
        content: Text(Utils.labels!.are_you_sure_to_select_this_image ),
        actions: [
          FlatButton(onPressed: (){
            Navigator.pop(context);
          }, child: Text(Utils.labels!.no)),
          FlatButton(onPressed: (){
            Navigator.pop(context);
            imageSubject.sink.add(imageFile!);
            uploadImage();
          }, child: Text(Utils.labels!.yes, style: TextStyle(color: Colors.greenAccent),)),

        ],
      );
    });
  }
  String base64Encode(List<int> bytes) => base64.encode(bytes);

  submit() {
    if(formKey.currentState!.validate()){
    Navigator.pop(context);
    Utils.progressBar.showLoadingIndicator(Utils.labels!.change_password,context);

    UserRepo.changePassword(passwordController.text, newPasswordController.text).then((value)
    {
      Utils.progressBar.hideOpenDialog(context);
      if(value["status"]){
        scaffoldKey.currentState!.showSnackBar(SnackBar(content: Text(Utils.labels!.change_password),));
        passwordController.text= "";
        newPasswordController.text= "";
      }else
        scaffoldKey.currentState!.showSnackBar(SnackBar(content: Text(value["msg"]),));

    });
  }
  }

  void showPasswordDialog() {
    showDialog(context: context,

        builder: (e) {
          return Container(
            height: 210,
            child: AlertDialog(
              title: Text(Utils.labels!.change_password),
              content: Container(
                height: 210,
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      myTextFormField(
                          Utils.labels!.current_password, passwordController, context, validate: passwordValidate),
                      SizedBox(height: 20,),
                      myTextFormField(
                          Utils.labels!.new_password, newPasswordController, context,
                           validate: passwordValidate),
                      SizedBox(height: 20,),

                      InkWell(
                          onTap: () {
                            submit();
                          },
                          child: CustomBUttonWidget(
                              Utils.labels!.submit, 50, 100, context)),
                    ],
                  ),
                ),
              ),

            ),
          );
        }
    );
  }

  Widget myTextFormField(String Lable,
      TextEditingController textEditingController, BuildContext context,
       {String? Function(String? s)? validate,}) {
    return Container(
      height: 60,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Edit_textColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        border: Border.all(
          color: Edit_textColor,
        ),
      ),
      child: TextFormField(
        controller: textEditingController,
        keyboardType: TextInputType.text,
        onFieldSubmitted: (s){
          FocusScope.of(context).unfocus();
        },
        decoration: InputDecoration(
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          labelText: Lable,
          labelStyle: Theme
              .of(context)
              .textTheme
              .bodyText2,
          // suffixIcon:  Icon(IconButton,color: Black_textColor,),
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        ),

        validator: validate,
      ),
    );
  }

  String? passwordValidate(String? s) {
    if (s!.length < 8) return Utils.labels!.password_must_be_more_than;
    return null;
  }

  ImageProvider getImage(AsyncSnapshot<File> snapshot) {
    if(!snapshot.hasData) {
     return NetworkImage(Utils.prefs!
          .getString("imageUrl") ??
          "https://c0.klipartz.com/pngpicture/434/847/gratis-png-usuario-de-iconos-de-computadora-empresario-ejecutivo-de-negocios-s.png");
    }
    else return FileImage(snapshot.data!);
  }

  void uploadImage() {
    Utils.progressBar.showLoadingIndicator(Utils.labels!.change_password,context);

    UserRepo.uploadImage(imageText).then((value) {
      Utils.progressBar.hideOpenDialog(context);
      if(value['data']['success']){
        scaffoldKey.currentState!.showSnackBar(SnackBar(content: Text(Utils.labels!.image_uploaded_successfully),));
        Utils.prefs!.setString("imageUrl", value["data"]["avatar_url_thumb"]);
        print(Utils.prefs!.getString("imageUrl"));

      }
      else   scaffoldKey.currentState!.showSnackBar(SnackBar(content: Text(Utils.labels!.error),));

    });
  }


}