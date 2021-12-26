import 'package:flutter/material.dart';
import 'package:motherclub/common/Constant/ColorConstants.dart';
import 'package:motherclub/common/Utils/Utils.dart';
import 'package:progress_state_button/progress_button.dart';

Widget progressButton({required String Lable,required onPressed,required BuildContext context}){
  ButtonState stateOnlyText = ButtonState.idle;
  ButtonState stateTextWithIcon = ButtonState.idle;
  ButtonState stateTextWithIconMinWidthState = ButtonState.idle;
  return ProgressButton(
    stateWidgets: {
      ButtonState.idle: Text("$Lable",style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),),
      ButtonState.loading: Text(Utils.labels!.loading,style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),),
      ButtonState.fail: Text("Fail",style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),),
      ButtonState.success: Text("Success",style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),)
    },
    stateColors: {
      ButtonState.idle: Colors.grey.shade400,
      ButtonState.loading: Colors.blue.shade300,
      ButtonState.fail: Colors.red.shade300,
      ButtonState.success: Colors.green.shade400,
    },
    onPressed: onPressed,
    state: stateOnlyText,
  );
}