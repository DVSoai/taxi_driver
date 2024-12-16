import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:taxi_driver/common/color_extension.dart';
import 'package:taxi_driver/common_widget/line_text_field.dart';

import 'package:taxi_driver/common_widget/round_button.dart';
import 'package:taxi_driver/core/constants/sized_box_constants.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  FlCountryCodePicker countryCodePicker = const FlCountryCodePicker();
  late CountryCode countryCode;
  TextEditingController txMobile = TextEditingController();
  TextEditingController txPassword = TextEditingController();

  @override
  void initState() {
    super.initState();
    countryCode = countryCodePicker.countryCodes
        .firstWhere((element) => element.code == "VN");
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Sign In",
                style: TextStyle(
                    color: TColor.primaryText,
                    fontSize: 25,
                    fontWeight: FontWeight.w800),
              ),
              SizedBoxConstants.sizedBoxH30,
              Text("Mobile Number",style: TextStyle(
                color: TColor.primaryText,
                fontSize: 25,
                fontWeight: FontWeight.w800
              ),),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () async {
                      final code =
                          await countryCodePicker.showPicker(context: context);
                      if (code != null) {
                        countryCode = code;
                        setState(() {});
                      }
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: 30,
                          height: 30,
                          child: countryCode.flagImage(),
                        ),
                        Text(
                          " ${countryCode.dialCode}",
                          style: TextStyle(
                            color: TColor.primaryText,
                            fontSize: 16,
                          ),
                        ),
                        SizedBoxConstants.sizedBoxW14,
                      ],
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      controller: txMobile,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        hintText: 'Enter your mobile number',
                      ),
                    ),
                  )
                ],
              ),
              const Divider(),
              SizedBoxConstants.sizedBoxH08,
              LineTextField(
                  title: "Password",
                  hintText: "Password",
                  controller: txPassword,
                obscureText: true,
                right: IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    "assets/img/password_show.png",
                    width: 25,
                    height: 25,
                  ),
                ),
              ),
              SizedBoxConstants.sizedBoxH30,
              RoundButton(title: "SIGN IN", onPressed: () {}),
              Center(
                child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "FORGOT PASSWORD",
                      style: TextStyle(
                        color: TColor.primary,
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                      ),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
