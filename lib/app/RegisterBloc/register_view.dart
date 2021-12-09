import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
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
import 'package:image/image.dart' as img;



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
  BehaviorSubject<String> imageSubject = BehaviorSubject();
  RegisterBloc? _bloc;
  GlobalKey<ScaffoldState>_scaffoldKey = GlobalKey();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String imageText = "";
  String imageName = "Upload Profile Image" ;

@override
  void initState() {
    // TODO: implement initState
  _bloc = BlocProvider.of<RegisterBloc>(context);
  checkBoxSubject.sink.add(false);
  imageSubject.sink.add(imageName);
  super.initState();


}
@override
  void dispose() {
    // TODO: implement dispose
checkBoxSubject.close();
imageSubject.close();
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
              child: GestureDetector(
                onTap: (){
                  FocusScope.of(context).unfocus();
                },
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
                              Text(Utils.labels!.create_New_Account,style: Theme.of(context).textTheme.headline1),
                              SizedBox(width:10),
                              Text(Utils.labels!.create_New_Account_to_see,
                                style: GoogleFonts.roboto(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    color: Black_textColor),),
                              Divider(color: Colors.transparent, height: deviceHeight /25,),
                              EditTextwidget(Utils.labels!.first+" "+Utils.labels!.name,_nameController ,context,validate: firstNameValidate),
                              Divider(
                                color: Colors.transparent,
                                height: 10,
                              ),
                              EditTextwidget(Utils.labels!.last+" "+Utils.labels!.name, _lastnameController,context,validate:lastNameValidate),
                              Divider(
                                color: Colors.transparent,
                                height: 10,
                              ),
                              EditTextwidget("Username", _usernameController,context,validate:userNameValidate
                              ),Divider(
                                color: Colors.transparent,
                                height: 10,
                              ),
                              EditTextwidget(Utils.labels!.email, _emailController,context,validate: emailValidate
                              ),
                              Divider(
                                color: Colors.transparent,
                                height: 10,
                              ),
                              EditTextwidget(Utils.labels!.password, _passwordController,context,validate: passwordValidate
                             ),
                              Divider(
                                color: Colors.transparent,
                                height: 10,
                              ),
                              EditTextWidget(Lable: Utils.labels!.age+" "+Utils.labels!.your_baby, context: context, IconButton:  Icons.keyboard_arrow_down_outlined, textEditingController: _yourbabyController),
                              // EditTextWidget("Your Baby Age", context, Icons.keyboard_arrow_down_outlined),
                              Divider(
                                color: Colors.transparent,
                                height: 10,
                              ),
                              EditTextWidget(Lable: Utils.labels!.your_Pregnancy, context: context, IconButton:  Icons.keyboard_arrow_down_outlined, textEditingController: Baby_AgeController),

                              // EditTextWidget("Your Pregnancy", context, Icons.keyboard_arrow_down_outlined),
                              Divider(
                                color: Colors.transparent,
                                height: 10,
                              ),
                              GestureDetector(
                                  onTap: (){
                                  openImagePicker();
                                   },
                                  child: StreamBuilder<String>(
                                    stream: imageSubject.stream,
                                    builder: (context, snapshot) {
                                      return DottedContainerWidget(context,deviceHeight/8.2,deviceWidth/1.10,snapshot.data!);
                                    }
                                  )),
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
                                      Utils.labels!.agree_for_news,
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
                                      text: Utils.labels!.agree_to,
                                      style: GoogleFonts.roboto(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w400,
                                          fontStyle: FontStyle.normal,
                                          color: Black_textColor),
                                      children: <TextSpan>[
                                        TextSpan(text: Utils.labels!.terms_conditions, style: GoogleFonts.roboto(
                                            fontSize: 11,
                                            fontWeight: FontWeight.w400,
                                            fontStyle: FontStyle.normal,
                                            color: Text_color),),
                                        TextSpan(text:  Utils.labels!.and,style:  GoogleFonts.roboto(
                                            fontSize: 11,
                                            fontWeight: FontWeight.w400,
                                            fontStyle: FontStyle.normal,
                                            color: Black_textColor),),
                                        TextSpan(text: Utils.labels!.privacy_policy, style: GoogleFonts.roboto(
                                            fontSize: 11,
                                            fontWeight: FontWeight.w400,
                                            fontStyle: FontStyle.normal,
                                            color: Text_color),),
                                        TextSpan(text:Utils.labels!.to_mother_club,style:  GoogleFonts.roboto(
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
                                  child: CustomBUttonWidget(Utils.labels!.register, deviceHeight/17 , deviceWidth/1.1, context)),
                              Divider(
                                color: Colors.transparent,
                                height: deviceHeight/30,
                              ),



                            ],
                          ),
                        ),
                      ),
                  BlocListener<RegisterBloc, RegisterState>
                    (listener: (con , state )async{
                    if(state.resultState == ResultState.Loading){
                      Utils.progressBar.showLoadingIndicator("Registering",context);
                    }else if(state.resultState == ResultState.Success){
                      auth.login(_usernameController.text, _passwordController.text).then((value) {
                        print('loginAuth ${value['status']}');
                        if(value['status']==true)
                        {
                          Utils.progressBar.hideOpenDialog(context);
                          Get.offAllNamed(Routes.BOTTOM);
                        }

                      });



                    }else if(state.resultState == ResultState.Error){
                      Utils.progressBar.hideOpenDialog(context);
                      showSnackBar(state.errorMessage!);
                    }else{

                    }
                  },
                  child: Container(),)
                    ],
                  ),
                ),
              ))

      ),
    );
  }

  String? firstNameValidate(String? text) {
  return text!.length < 3 ?Utils.labels!.name_must_be_more_than: null;
  }
  String? lastNameValidate(String? text) {
  return text!.length < 3 ?Utils.labels!.name_must_be_more_than: null;
  }
  String? userNameValidate(String? text) {
  return text!.length < 3 ?Utils.labels!.username_must_be_more_than: null;
  }

 String? passwordValidate(String? text) {
  return text!.length < 8 ?Utils.labels!.password_must_be_more_than: null;
  }
  String? emailValidate(String? text) {
  return text!.isNotEmpty &&
      text.length > 0 &&
      RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\-*[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(text)? null:  Utils.labels!.email_must_be_more_than;
  }

  void submit() {
  var validated = checkOnInput();
  if(validated){
    fireRegisterEvent();
  }else {
    showSnackBar("Some fields are invalid ");
  }
  }

  bool checkOnInput() {
  if(!_checkbox){
    showSnackBar("You have to agree the terms  ");
        }else {
  if(_formKey.currentState!.validate()){
    return true;
  }}
  return false;
  }

  void fireRegisterEvent() {
    _bloc!.add(RegisterEvent(RegisterRequestModel(
      email: _emailController.text,customFieldsFirstName: _nameController.text,
      customFieldsLastName: _lastnameController.text,
      customFieldsBabyAge: Baby_AgeController.text,
      customFieldsWeeksUser: _yourbabyController.text,
      userPass: _passwordController.text,
      username: _usernameController.text,
      image: imageText,
      nonce: Utils.userPreferences.getNonce()
    )));
  }

  void openImagePicker() async{
    final ImagePicker _picker = ImagePicker();
    // Pick an image
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    final path = image!.path;
    imageName = image.name;
    final bytes = await File(path).readAsBytes();
      var result = base64Encode(bytes);
    imageText = result;
    imageSubject.sink.add(imageName);
  }
  String base64Encode(List<int> bytes) => base64.encode(bytes);

  void showSnackBar(String text) {
    _scaffoldKey.currentState!.showSnackBar(SnackBar(content: Text( text)));

  }

}

