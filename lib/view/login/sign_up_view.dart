import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:taxi_driver/common/color_extension.dart';
import 'package:taxi_driver/common_widget/line_text_field.dart';

import 'package:taxi_driver/common_widget/round_button.dart';
import 'package:taxi_driver/core/constants/sized_box_constants.dart';
import 'package:taxi_driver/view/login/bank_detail_view.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  FlCountryCodePicker countryCodePicker = const FlCountryCodePicker();
  late CountryCode countryCode;
  TextEditingController txMobile = TextEditingController();
  TextEditingController txFirstName = TextEditingController();
  TextEditingController txLastName = TextEditingController();
  TextEditingController txHomeAddress = TextEditingController();

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
                "Create Profile",
                style: TextStyle(
                    color: TColor.primaryText,
                    fontSize: 25,
                    fontWeight: FontWeight.w800),
              ),
              SizedBoxConstants.sizedBoxH30,

              LineTextField(
                title: "First Name",
                hintText: "First Name",
                controller: txFirstName,
              ),
              SizedBoxConstants.sizedBoxH08,
              LineTextField(
                title: "Last Name",
                hintText: "Last Name",
                controller: txLastName,
              ),
              SizedBoxConstants.sizedBoxH08,
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
                    child: LineTextField(
                      title: "Mobile Number",
                      isTitle: false,
                      controller: txMobile,
                      hintText: 'Enter your mobile number',
                      keyboardType: TextInputType.phone,
                      // decoration: const InputDecoration(
                      //   contentPadding: EdgeInsets.zero,
                      //   focusedBorder: InputBorder.none,
                      //   enabledBorder: InputBorder.none,
                      // ),
                    ),
                  )
                ],
              ),
              const Divider(),
              SizedBoxConstants.sizedBoxH08,
              LineTextField(
                title: "Home Address",
                hintText: "Home Address",
                controller: txHomeAddress,
              ),
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
              SizedBoxConstants.sizedBoxH14,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "By continuing, I confirm that i have read & agree to the",
                    style: TextStyle(
                      color: TColor.secondaryText,
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Terms & conditions",
                    style: TextStyle(
                      color: TColor.primaryText,
                      fontSize: 11,
                    ),
                  ),
                  Text(
                    " and ",
                    style: TextStyle(
                      color: TColor.secondaryText,
                      fontSize: 11,
                    ),
                  ),
                  Text(
                    "Privacy policy",
                    style: TextStyle(
                      color: TColor.primaryText,
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
              SizedBoxConstants.sizedBoxH14,
              RoundButton(title: "REGISTER", onPressed: () {
                context.push(const BankDetailView());
              }),
            ],
          ),
        ),
      ),
    );
  }
}
