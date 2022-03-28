import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:zshop/authentication/otp_authentication_screen/otp_authentication_screen_view.dart';
import 'package:zshop/const/const.dart';


class LoginScreenController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController phone = TextEditingController();
  final TextEditingController otp = TextEditingController();
  String verificationId = "";
  bool isLoading = false;





void verfyPhoneNumber () async{

  isLoading = true;

  update();


  try {
    await _auth.verifyPhoneNumber(
    phoneNumber: "+880${phone.text}", 
    verificationCompleted: (PhoneAuthCredential credential) async{
      await _auth.signInWithCredential(credential);
      showAlert("Verifed");
    }, 
    verificationFailed: (FirebaseAuthException Exception){
          showAlert("Verification Failed");
    }, 
    codeSent: (String _verificationId, int? forceRespondToken){
      showAlert("Verification code sent");

      verificationId = _verificationId;
      Get.to(()=> const OtpVerficationScreen());

    }, 
    codeAutoRetrievalTimeout: (String __verificationId){

      verificationId = __verificationId;

    },);
    
  } catch (e) {
    showAlert("Error Occured : $e ");
  }
  
}

void signInWithphoneNumber()async{

  try {
    final AuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationId, 
      smsCode: otp.text);

      var signInUser = await _auth.signInWithCredential(credential);

      final User? user = signInUser.user;

      showAlert("Sign In Sucessfull, User UID : ${user!.uid}");
      print("Sign In Sucessfull, User UID : ${user!.uid}");


  } catch (e) {

    showAlert("Error Occured : $e ");
  }
}


}

