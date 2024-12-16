import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:otp_timer_button/otp_timer_button.dart';
import 'package:taxi_driver/common/common_extension.dart';
import 'package:taxi_driver/common/globs.dart';
import 'package:taxi_driver/cubit/login_cubit.dart';
import 'package:taxi_driver/view/login/controller/otp_controller.dart';
import 'package:taxi_driver/view/login/profile_image_view.dart';
import '../../common/color_extension.dart';
import '../../common_widget/round_button.dart';
import '../../core/constants/sized_box_constants.dart';

class OTPView extends StatefulWidget {
  final String number;
  final String code;

  const OTPView({super.key, required this.number, required this.code});

  @override
  State<OTPView> createState() => _OTPViewState();
}

class _OTPViewState extends State<OTPView> {
  FirebaseAuth auth = FirebaseAuth.instance;
  String vId = "";
  var otpCode = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    onSendSms();
  }

  onSendSms() async {
    try {
      await auth.verifyPhoneNumber(
        phoneNumber: "${widget.code} ${widget.number}",
        timeout: const Duration(seconds: 5),
        verificationCompleted: (PhoneAuthCredential credential) async {
          // ANDROID ONLY!

          // Sign the user in (or link) with the auto-generated credential
          await auth.signInWithCredential(credential);
        },
        verificationFailed: (error) {
          mdShowAlert("Fail", error.toString(), () {});
        },
        codeSent: (verificationId, forceResendingToken) {
          vId = verificationId;
        },
        codeAutoRetrievalTimeout: (verificationId) {
          vId = verificationId;
        },
      );
    } catch (e) {
      mdShowAlert("Fail", e.toString(), () {});
    }
  }
  void smsVerification() async {
    if (otpCode.length < 6) {
      mdShowAlert("Error", "Please enter valid code", () {});
      return;
    }

    try {
      final AuthCredential credential =
      PhoneAuthProvider.credential(verificationId: vId, smsCode: otpCode);

      final User? user = (await auth.signInWithCredential(credential)).user;

      if (user != null) {
        submitApiData(user.uid);
      } else {
        mdShowAlert("Fail", "invalid otp", () {});
      }
    } catch (e) {
      mdShowAlert("Fail", e.toString(), () {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Image.asset(
            "assets/img/back.png",
            width: 25,
            height: 25,
          ),
        ),
      ),
      body: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state){
          if(state is LoginHUDState){
            Globs.hideHUD();
          }else if(state is LoginApiResultState){
            Globs.hideHUD();
            mdShowAlert("Success", "Successfully signed in api calling done", (){});
            context.push(const ProfileImageView());
          }else if(state is LoginErrorState){
            Globs.hideHUD();
            mdShowAlert("Fail", state.errorMSG, (){});
          }
        },
        builder: (context, state){
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "OTP Verification",
                  style: TextStyle(
                      color: TColor.primaryText,
                      fontSize: 25,
                      fontWeight: FontWeight.w800),
                ),
                SizedBoxConstants.sizedBoxH04,
                Text(
                  "Enter the 6-digit code sent to you at",
                  style: TextStyle(
                    color: TColor.secondaryText,
                    fontSize: 16,
                  ),
                ),
                SizedBoxConstants.sizedBoxH04,
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "${widget.code} ${widget.number}",
                      style: TextStyle(
                        color: TColor.primaryText,
                        fontSize: 16,
                      ),
                    ),
                    SizedBoxConstants.sizedBoxW08,
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "Edit",
                          style: TextStyle(
                            color: TColor.secondary,
                            fontSize: 18,
                          ),
                        ))
                  ],
                ),
                OtpTextField(
                  numberOfFields: 6,
                  borderColor: TColor.placeholder,
                  focusedBorderColor: TColor.primary,
                  textStyle: TextStyle(
                    color: TColor.primaryText,
                    fontSize: 16,
                  ),
                  showFieldAsBox: false,
                  borderWidth: 1.0,
                  onCodeChanged: (String code) {
                    otpCode = code;
                  },
                  onSubmit: (String verificationCode) {
                    otpCode = verificationCode;
                    smsVerification();
                  },
                ),
                SizedBoxConstants.sizedBoxH20,
                RoundButton(title: "SUBMIT", onPressed: () {
                  smsVerification();
                }),
                Center(
                  child: OtpTimerButton(
                    height: 60,
                    onPressed: () {
                      onSendSms();
                    },
                    text: const Text(
                      "Resend OTP",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    duration: 60,
                    backgroundColor: TColor.primaryText,
                    buttonType: ButtonType.text_button,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
  void submitApiData(String uid) {
   context.read<LoginCubit>().submitLogin(widget.code, widget.number, "2");
  }
}
