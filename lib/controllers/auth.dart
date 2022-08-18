import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:metachat/controllers/user.dart';
import 'package:metachat/screens/home/home.dart';
import 'package:metachat/screens/profile/profile_info.dart';
import 'package:metachat/screens/signin/otp_screen.dart';

class AuthController extends GetxController {
  final updated = false.obs;
  final id = Rx<String>("hello");
  final phoneno = "9835770844".obs;
  final ulocation = "Australia".obs;
  final userController = Get.put(UserController());

  Future phoneAuth(
      String number, String code, String location, BuildContext context) async {
    EasyLoading.show();
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '$code$number',
      verificationCompleted: (PhoneAuthCredential credential) async {
        await FirebaseAuth.instance.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int? resendToken) async {
        // Update the UI - wait for the user to enter the SMS code
        // Create a PhoneAuthCredential with the code
        Navigator.push(
            context, MaterialPageRoute(builder: ((context) => OtpScreen())));
        EasyLoading.dismiss();
        phoneno.value = '$code$number';
        ulocation.value = location;
        updated.value = true;
        id.value = verificationId;
        print(updated);
        print(id);
        // Sign the user in (or link) with the credential
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  Future verifyOtp(String otp, BuildContext context) async {
    try {
      EasyLoading.show();
      PhoneAuthCredential credential =
          PhoneAuthProvider.credential(verificationId: id.value, smsCode: otp);
      await FirebaseAuth.instance
          .signInWithCredential(credential)
          .whenComplete(() async {
        print(id.value);
        EasyLoading.dismiss();
        print(credential.smsCode);
        print(FirebaseAuth.instance.currentUser!.uid);
        await userController.getUser(FirebaseAuth.instance.currentUser!.uid).then((value) {
          if (value!.length == 0) {
            return Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProfileInfoScrenn(
                  phoneno: phoneno.value,
                  location: ulocation.value,
                ),
              ),
            );
          } else {
            Navigator.push(context,
                MaterialPageRoute(builder: ((context) => HomeScreen())));
          }
        });
      });
    } catch (e) {
      print(e);
    }
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance
        .signInWithCredential(credential)
        .whenComplete(() => EasyLoading.showToast("success"));
  }
}
