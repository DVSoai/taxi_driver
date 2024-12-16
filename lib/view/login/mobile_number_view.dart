import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:taxi_driver/common/color_extension.dart';

import 'package:taxi_driver/common_widget/round_button.dart';
import 'package:taxi_driver/core/constants/sized_box_constants.dart';
import 'package:taxi_driver/view/login/otp_view.dart';

class MobileNumberView extends StatefulWidget {
  const MobileNumberView({super.key});

  @override
  State<MobileNumberView> createState() => _MobileNumberViewState();
}

class _MobileNumberViewState extends State<MobileNumberView> {
  FlCountryCodePicker countryCodePicker = const FlCountryCodePicker();
  late CountryCode countryCode;
  TextEditingController txMobile = TextEditingController();

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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Enter mobile number",
              style: TextStyle(
                  color: TColor.primaryText,
                  fontSize: 25,
                  fontWeight: FontWeight.w800),
            ),
            SizedBoxConstants.sizedBoxH30,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  onTap: ()async{
                 final code = await countryCodePicker.showPicker(context: context);
                 if(code !=null){
                   countryCode = code;
                   setState(() {

                   });
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
            RoundButton(title: "CONTINUE", onPressed: () {
              context.push( OTPView(number: txMobile.text, code: countryCode.dialCode));
            })
          ],
        ),
      ),
    );
  }
}
