import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:zshop/authentication/login_screen/login_screen_controller.dart';
import 'package:zshop/const/custom_button.dart';
class OtpVerficationScreen extends StatelessWidget {
  const OtpVerficationScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
      LoginScreenController controller = Get.find();



    return Container(
      color: Colors.blueAccent,
      child: SafeArea(
        child: Scaffold(
        body: GetBuilder<LoginScreenController>(
          init: LoginScreenController(),
          builder: (value){

            if (!value.isLoading) {
              return SizedBox(
          height: size.height,
          width: size.width,
          child: SingleChildScrollView(
            child: Column(children: [
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  height: size.height/7,
                  width: size.width/3,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(230, 233, 250, 1),
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(1000)
                    )
                  ),
                  child: InkWell(
                    onTap: (){
                      Get.back();
                    },
                    child: Icon(Icons.arrow_back,size: size.width/12,),
                  ),
                ),
              ),
              SizedBox(
                height: size.height/20,
              ),
              RichText(textAlign: TextAlign.center, text: TextSpan(
                           text: "Verify your\n Phone number\n",style: TextStyle(
                             color: Colors.black,
                             fontSize: size.width/12,
                             fontWeight: FontWeight.w500,
                           ),
                           children: [
                             TextSpan(
                               text: "Enter the OTP that you have\n recived through SMS",style: TextStyle(
                                 color: Color.fromRGBO(138, 132, 134, 1),
                                 fontSize: size.width/22,
                                 fontWeight: FontWeight.w500,
                               ),
                             )
                           ]
                         )),
             SizedBox(height: size.height/15,),
             SizedBox(
               height: size.height/18,
             width: size.width/1.2,
            child: PinCodeTextField(
              appContext: context, 
              length: 4, 
              onChanged: (val){},
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.circle,
                fieldHeight: size.height/18,
                fieldWidth: size.width/5,
                
              ),keyboardType: TextInputType.number,
              ),
             ),SizedBox(
               height: size.height/18,
             ),CustomButton(text: "Submit", 
             buttonWidth: 2.5, 
             function: (){
           controller.verfyPhoneNumber();
             }),
            ],
            ),
          ),
        );
            }else{
             return const Center(child: CircularProgressIndicator(),);
            }
          },
        ),
      ),),
    );
  }
}
