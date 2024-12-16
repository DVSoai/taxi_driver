import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// class OtpController {
//   final BuildContext context;
//   void mdShowAlert(String title, String message, VoidCallback onPressed,
//       {String buttonTitle = "OK",
//         TextAlign mainAxisAlignment = TextAlign.center, isForce = false }) {
//     showDialog(
//         context: context,
//         barrierDismissible: !isForce,
//         builder: (context) => CupertinoAlertDialog(
//           title: Text(title),
//           content: Text(message),
//           actions: [
//             CupertinoDialogAction(
//               isDefaultAction: true,
//               onPressed: () {
//                 Navigator.pop(context);
//                 onPressed();
//               },
//               child: Text(buttonTitle),
//             )
//           ],
//         ));
//   }
//
//
//   const OtpController({required this.context});
//
//   Future<void> handleSendSms(String verificationId, String phoneNumber) async {
//     FirebaseAuth auth = FirebaseAuth.instance;
//     try {
//       await auth?.verifyPhoneNumber(
//           phoneNumber: phoneNumber,
//           timeout: const Duration(seconds: 6),
//           verificationCompleted: (PhoneAuthCredential credential) async {
//             await auth.signInWithCredential(credential);
//           },
//           verificationFailed: (error) {
//             mdShowAlert("Fail", error.toString(), (){});
//           },
//           codeSent: (verificationId, forceResendingToken) {
//             verificationId = verificationId;
//           },
//           codeAutoRetrievalTimeout: (verificationId) {
//             verificationId = verificationId;
//           }
//       );
//     } catch (error) {
//       mdShowAlert("Fail", error.toString(), (){});
//     }
//   }
//
//   void smsVerification(String verificationId,String code) async{
//     if (code.length < 6) {
//       mdShowAlert("Error", "Please enter a valid OTP", (){});
//       return;
//
//     }
//     try{
//       FirebaseAuth auth = FirebaseAuth.instance;
//       final AuthCredential credential = PhoneAuthProvider.credential(
//           verificationId: verificationId, smsCode: code);
//       final User? user = (await auth.signInWithCredential(credential)).user;
//       if (user != null) {
//         mdShowAlert("Success", "OTP verified successfully signed in UID: ${user.uid}", (){});
//       } else {
//         mdShowAlert("Error", "Invalid OTP", (){});
//       }
//     }catch(e){
//       mdShowAlert("Error", e.toString(), (){});
//     }
//   }
// }

class OtpController {
  final BuildContext context;
  String? verificationId;
  void mdShowAlert(String title, String message, VoidCallback onPressed,
      {String buttonTitle = "OK",
        TextAlign mainAxisAlignment = TextAlign.center, isForce = false }) {
    showDialog(
        context: context,
        barrierDismissible: !isForce,
        builder: (context) => CupertinoAlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            CupertinoDialogAction(
              isDefaultAction: true,
              onPressed: () {
                Navigator.pop(context);
                onPressed();
              },
              child: Text(buttonTitle),
            )
          ],
        ));
  }
   OtpController({required this.context, this.verificationId});

  // Phương thức gửi SMS OTP
  Future<void> handleSendSms(String phoneNumber) async {
    FirebaseAuth auth = FirebaseAuth.instance;

    try {
      await auth.verifyPhoneNumber(
        phoneNumber: phoneNumber, // Đảm bảo định dạng đúng E.164 như "+91xxxxxxxxxx"
        timeout: const Duration(seconds: 60),
        verificationCompleted: (PhoneAuthCredential credential) async {
          await auth.signInWithCredential(credential);
        },
          verificationFailed: (error) {
            mdShowAlert("Fail", error.toString(), (){});
          },
          codeSent: (verificationId, forceResendingToken) {
            verificationId = verificationId;
          },
          codeAutoRetrievalTimeout: (verificationId) {
            verificationId = verificationId;
          }
      );
    } catch (error) {
      mdShowAlert("Fail", error.toString(), () {});
    }
  }

  void smsVerification(String otpCode) async{
    if (otpCode.length < 6) {
      mdShowAlert("Error", "Please enter a valid OTP", (){});
      return;

    }
    try{
      FirebaseAuth auth = FirebaseAuth.instance;
      final AuthCredential credential =
      PhoneAuthProvider.credential(verificationId: verificationId!, smsCode: otpCode);
      final User? user = (await auth.signInWithCredential(credential)).user;
      if (user != null) {
        mdShowAlert("Success", "OTP verified successfully signed in UID: ${user.uid}", (){});
      } else {
        mdShowAlert("Error", "Invalid OTP", (){});
      }
    }catch(e){
      mdShowAlert("Error", e.toString(), (){});
    }
  }
}