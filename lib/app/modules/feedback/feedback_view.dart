import 'package:flutter/material.dart';
import 'package:motherclub/common/CustomWidget/statless/custom_appbar.dart';
import 'package:motherclub/common/Utils/Utils.dart';

class FeedBack extends StatefulWidget {
  const FeedBack({Key? key}) : super(key: key);

  @override
  State<FeedBack> createState() => _FeedBackState();
}

final _formKey = GlobalKey<FormState>();

class _FeedBackState extends State<FeedBack> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        withBackButton: true,
        title: Utils.labels!.feedback,
        centerTitle: true,
        onBackButtonPressed: () {
          Navigator.pop(context);
        },
      ),
      body: SingleChildScrollView(
        child: Container(
          height: Utils.deviceHeight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text('Mother’s Club',style: TextStyle(color: Colors.pinkAccent,fontSize: 24),),
                        TextFormField(
                          decoration: const InputDecoration(
                            icon: const Icon(Icons.person_outline,color: Colors.pinkAccent,),
                            hintText: 'Enter your full name',
                            labelText: 'Name',
                          ),
                          validator: (value) {
                            if (value!.isEmpty && value.length<3) {
                              return 'Please enter valid name';
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            icon: const Icon(Icons.email_outlined,color: Colors.pinkAccent,),
                            hintText: 'Enter an Email',
                            labelText: 'Email',
                          ),
                          validator: (value) {
                            if (value!.contains('@')&& value.contains('com')) {
                              return 'Please enter valid phone number';
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          minLines: 5,
                          decoration: const InputDecoration(
                            icon: const Icon(Icons.message_outlined,color: Colors.pinkAccent,),
                            hintText: 'Enter your message',
                            labelText: 'Message',
                          ),
                          validator: (value) {
                            if (value!.length < 40) {
                              return 'Please enter valid Message';
                            }
                            return null;
                          },
                        ),
                        Container(

                            margin: const EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              color: Colors.pinkAccent,
                            ),
                            child: ElevatedButton(

                              style:  ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20,),primary: Colors.pinkAccent),

                              child: const Text('Submit'),
                              onPressed: () {
                                // It returns true if the form is valid, otherwise returns false
                                if (_formKey.currentState!.validate()) {
                                  // If the form is valid, display a Snackbar.

                                }
                              },
                            )),

                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: Utils.deviceWidth,
                height: Utils.deviceHeight/3.7,
                color: Colors.pinkAccent,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text(Utils.labels!.we_are_opened_to_suggestion,style: TextStyle(color: Colors.white,fontSize: 18),),
                      Row(
                        children: [
                          Icon(Icons.not_listed_location_sharp,color: Colors.white,),
                          Text(Utils.labels!.feedback_location,style: TextStyle(color: Colors.white)),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.phone,color: Colors.white,),
                          Text(' +971-45533869',style: TextStyle(color: Colors.white)),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.mail,color: Colors.white,),
                          Text('info@mothersclub.me',style: TextStyle(color: Colors.white)),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.reduce_capacity,color: Colors.white,),
                          Text(Utils.labels!.follow_us,style: TextStyle(color: Colors.white)),
                        ],
                      ),

                    ],),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
