import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motherclub/app/Models/RegisterRequestModel.dart';
import 'package:motherclub/app/RegisterBloc/RegisterBloc.dart';
import 'package:motherclub/app/RegisterBloc/RegisterState.dart';
import 'package:motherclub/app/StateEnum.dart';
import 'package:motherclub/app/modules/auth/controllers/auth_controller.dart';
import 'package:motherclub/app/provider/AuthProvider.dart';
import 'package:motherclub/app/routes/app_pages.dart';
import 'package:motherclub/common/Constant/ColorConstants.dart';
import 'package:motherclub/common/CustomWidget/CustomButton.dart';
import 'package:motherclub/common/CustomWidget/CustomLogoWidget.dart';
import 'package:motherclub/common/CustomWidget/CustomeToggleWidget.dart';
import 'package:motherclub/common/CustomWidget/DottedContainerWidget.dart';
import 'package:motherclub/common/CustomWidget/EditTextField.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:motherclub/common/CustomWidget/EditTextWithoutIcon.dart';
import 'package:motherclub/common/CustomWidget/SocialButtonWidget.dart';
import 'package:motherclub/common/Utils/Utils.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';



class RegisterView extends StatefulWidget {

  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  @override
  bool _checkbox = false;
  TextEditingController _yourbabyController=TextEditingController();
  TextEditingController Baby_AgeController=TextEditingController();
  TextEditingController _nameController=TextEditingController();
  TextEditingController _lastnameController=TextEditingController();
  TextEditingController _usernameController=TextEditingController();
  TextEditingController _emailController=TextEditingController();
  TextEditingController _passwordController=TextEditingController();

  // ============ check Box Behaviour ======
  BehaviorSubject<bool> checkBoxSubject = BehaviorSubject();
  RegisterBloc? _bloc;
  GlobalKey<ScaffoldState>_scaffoldKey = GlobalKey();
  GlobalKey<FormState>_formKey = GlobalKey();

@override
  void initState() {
    // TODO: implement initState
  _bloc = BlocProvider.of<RegisterBloc>(context);
    super.initState();
    checkBoxSubject.sink.add(false);

}
@override
  void dispose() {
    // TODO: implement dispose
checkBoxSubject.close();
    super.dispose();

}
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;


    AuthProvider auth = Provider.of<AuthProvider>(context);
    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
          child: Container(
              color: white_color,
              height: deviceHeight,
              width: deviceWidth,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomLogoWidget("Back to ",deviceHeight/4.3,deviceWidth,context),
                    Container(
                      padding: const EdgeInsets.only(left: 20,right: 20),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Create a New Account",style: Theme.of(context).textTheme.headline1),
                            SizedBox(width:10),
                            Text("Create an account to see all your information and alos you will be able to share your experience with others and learn other mothers experiment’s.",
                              style: GoogleFonts.roboto(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  color: Black_textColor),),
                            Divider(color: Colors.transparent, height: deviceHeight /25,),
                            EditTextwidget("First Name",_nameController ,context,validate: firstNameValidate),
                            Divider(
                              color: Colors.transparent,
                              height: 10,
                            ),
                            EditTextwidget("Last Name", _lastnameController,context,validate:lastNameValidate),
                            Divider(
                              color: Colors.transparent,
                              height: 10,
                            ),
                            EditTextwidget("Username", _usernameController,context,validate:userNameValidate
                            ),Divider(
                              color: Colors.transparent,
                              height: 10,
                            ),
                            EditTextwidget("Email", _emailController,context,validate: emailValidate
                            ),
                            Divider(
                              color: Colors.transparent,
                              height: 10,
                            ),
                            EditTextwidget("Password", _passwordController,context,validate: passwordValidate
                           ),
                            Divider(
                              color: Colors.transparent,
                              height: 10,
                            ),
                            EditTextWidget(Lable: 'Your Baby Age', context: context, IconButton:  Icons.keyboard_arrow_down_outlined, textEditingController: _yourbabyController),
                            // EditTextWidget("Your Baby Age", context, Icons.keyboard_arrow_down_outlined),
                            Divider(
                              color: Colors.transparent,
                              height: 10,
                            ),
                            EditTextWidget(Lable: 'Your Pragnancy Age', context: context, IconButton:  Icons.keyboard_arrow_down_outlined, textEditingController: Baby_AgeController),

                            // EditTextWidget("Your Pregnancy", context, Icons.keyboard_arrow_down_outlined),
                            Divider(
                              color: Colors.transparent,
                              height: 10,
                            ),
                            DottedContainerWidget(context,deviceHeight/8.2,deviceWidth/1.10),
                            Divider(
                              color: Colors.transparent,
                              height: deviceHeight/25,
                            ),
                            Container(
                              alignment: Alignment.center,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Agree for Newsletter?',
                                    style: GoogleFonts.roboto(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.normal,
                                        color: Black_textColor),

                                  ),
                                  // CustomToggleWidget(deviceHeight/23,deviceWidth/4,context),
                                ],
                              ),
                            ),
                            Divider(
                              color: Colors.transparent,
                              height: deviceHeight/23,
                            ),
                            Row(
                              children: [
                                StreamBuilder<bool>(
                                    stream: checkBoxSubject.stream,
                                    builder: (context, snapshot) {
                                      return Checkbox(
                                        value: snapshot.data,
                                        activeColor: pinkfavorite_Color,
                                        onChanged: (value) {
                                          checkBoxSubject.sink.add(value!);
                                          _checkbox = value;
                                        },
                                      );
                                    }
                                ),
                                RichText(
                                  text: TextSpan(
                                    text: 'I agree to the ',
                                    style: GoogleFonts.roboto(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                        color: Black_textColor),
                                    children: <TextSpan>[
                                      TextSpan(text: 'Terms and conditions', style: GoogleFonts.roboto(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w400,
                                          fontStyle: FontStyle.normal,
                                          color: Text_color),),
                                      TextSpan(text: ' and ',style:  GoogleFonts.roboto(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w400,
                                          fontStyle: FontStyle.normal,
                                          color: Black_textColor),),
                                      TextSpan(text: 'Privacy Policy', style: GoogleFonts.roboto(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w400,
                                          fontStyle: FontStyle.normal,
                                          color: Text_color),),
                                      TextSpan(text:' to\nMotherClub',style:  GoogleFonts.roboto(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w400,
                                          fontStyle: FontStyle.normal,
                                          color: Black_textColor),)
                                    ],
                                  ),
                                ),
                                //     Text(
                                //       'to\n MotherClub',
                                //       style:  GoogleFonts.roboto(
                                //         fontSize: 13,
                                //         fontWeight: FontWeight.w500,
                                //         fontStyle: FontStyle.normal,
                                //         color: Black_textColor),
                                //
                                // ),
                              ],
                            ),
                            Divider(
                              color: Colors.transparent,
                              height: deviceHeight/21,
                            ),
                            InkWell(
                                onTap: (){
                                  submit();                               // Get.to(Routes.)
                                },
                                child: CustomBUttonWidget("Register", deviceHeight/17 , deviceWidth/1.1, context)),
                            Divider(
                              color: Colors.transparent,
                              height: deviceHeight/30,
                            ),



                          ],
                        ),
                      ),
                    ),
                BlocListener<RegisterBloc, RegisterState>
                  (listener: (con , state ){
                  if(state.resultState == ResultState.Loading){
                    Utils.progressBar.showLoadingIndicator("Registering",context);
                  }else if(state.resultState == ResultState.Success){
                    Utils.progressBar.hideOpenDialog(context);


                  }else if(state.resultState == ResultState.Error){
                    Utils.progressBar.hideOpenDialog(context);

                  }else{

                  }
                },
                child: Container(),)
                  ],
                ),
              ))

      ),
    );
  }

  String? firstNameValidate(String? text) {
  return text!.length < 3 ?"Name Must be more than 3 characters": null;
  }
  String? lastNameValidate(String? text) {
  return text!.length < 3 ?"Name Must be more than 3 characters": null;
  }
  String? userNameValidate(String? text) {
  return text!.length < 3 ?"Name Must be more than 3 characters": null;
  }

 String? passwordValidate(String? text) {
  return text!.length < 8 ?"Password Must be more than 7 characters": null;
  }
  String? emailValidate(String? text) {
  return text!.isNotEmpty &&
      text.length > 0 &&
      RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\-*[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(text)? null:"Email is not valid "  ;
  }

  void submit() {
  var validated = checkOnInput();
  if(validated){
    fireEvent();
  }else {
    _scaffoldKey.currentState!.showSnackBar(SnackBar(content: Text("Some fields are invalid ")));
  }
  }

  bool checkOnInput() {
  if(!_checkbox){
    _scaffoldKey.currentState!.showSnackBar(SnackBar(content: Text("You have to agree the terms  ")));
        }else {
  if(_formKey.currentState!.validate()){
    return true;
  }}
  return false;
  }

  void fireEvent() {
    _bloc!.add(RegisterEvent(RegisterRequestModel(
      email: _emailController.text,customFieldsFirstName: _nameController.text,
      customFieldsLastName: _lastnameController.text,
      customFieldsBabyAge: Baby_AgeController.text,
      customFieldsWeeksUser: _yourbabyController.text,
      userPass: _passwordController.text,
      username: _usernameController.text,
      nonce: Utils.userPreferences.getNonce()
    )));
  }
}

