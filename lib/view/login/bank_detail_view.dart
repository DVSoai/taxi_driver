
import 'package:flutter/material.dart';
import 'package:taxi_driver/common/color_extension.dart';
import 'package:taxi_driver/common/common_extension.dart';
import 'package:taxi_driver/common/globs.dart';
import 'package:taxi_driver/common/service_call.dart';
import 'package:taxi_driver/common_widget/line_text_field.dart';

import 'package:taxi_driver/common_widget/round_button.dart';
import 'package:taxi_driver/core/constants/sized_box_constants.dart';

import 'document_upload_view.dart';

class BankDetailView extends StatefulWidget {
  const BankDetailView({super.key});

  @override
  State<BankDetailView> createState() => _BankDetailViewState();
}

class _BankDetailViewState extends State<BankDetailView> {

  TextEditingController txBankName = TextEditingController();
  TextEditingController txAccountHolderName = TextEditingController();
  TextEditingController txAccountNumber = TextEditingController();
  TextEditingController txSwiftCode = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getBankDetail();
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
        title: Text(
          "Bank Details",
          style: TextStyle(
            color: TColor.primaryText,
            fontSize: 25,
            fontWeight: FontWeight.w800,
          ),
        ),
        centerTitle: true,
        elevation: 1,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBoxConstants.sizedBoxH30,
              LineTextField(
                title: "Bank Name",
                hintText: "Bank Name",
                controller: txBankName,
              ),
              SizedBoxConstants.sizedBoxH08,
              LineTextField(
                title: "Account Holder Name",
                hintText: "Account Holder Name",
                controller: txAccountHolderName,
              ),
              SizedBoxConstants.sizedBoxH08,
              LineTextField(
                title: "Account Number",
                hintText: "Account Number",
                controller: txAccountNumber,
              ),
              SizedBoxConstants.sizedBoxH08,
              LineTextField(
                title: "Swift Code",
                hintText: "Swift Code",
                controller: txSwiftCode,

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
              RoundButton(title: "NEXT", onPressed: () {
                updateAction();
                // context.push(const DocumentUploadView(title: "Personal Document"));
              }),

            ],
          ),
        ),
      ),
    );
  }


  //TODO: Button Action

  void updateAction() {
    if (txBankName.text.isEmpty) {
      mdShowAlert("Error", "Please enter bank name", () {});
      return;
    }

    if (txAccountHolderName.text.isEmpty) {
      mdShowAlert("Error", "Please enter account holder name", () {});
      return;
    }

    if (txAccountNumber.text.isEmpty) {
      mdShowAlert("Error", "Please enter account number", () {});
      return;
    }

    if (txSwiftCode.text.isEmpty) {
      mdShowAlert("Error", "Please enter Bank Swift/IFSC Code", () {});
      return;
    }

    endEditing();

    updateBankDetail({
      "account_name": txAccountHolderName.text,
      "ifsc": txSwiftCode.text,
      "account_no": txAccountNumber.text,
      "bank_name": txBankName.text,
    });
  }
  //TODO:Service Call
  void getBankDetail() {
    Globs.showHUD();
    ServiceCall.post({}, SVKey.svBankDetail, isTokenApi: true,
        withSuccess: (responseObj) async {
          Globs.hideHUD();

          if (responseObj[KKey.status] == "1") {
            var payload = responseObj[KKey.payload] as Map? ?? {};
            setState(() {
              txAccountHolderName.text = payload["account_name"] as String? ?? "";
              txAccountNumber.text = payload["account_no"] as String? ?? "";
              txBankName.text = payload["bank_name"] as String? ?? "";
              txSwiftCode.text = payload["bsb"] as String? ?? "";
            });
          } else {
            mdShowAlert(
                "Error", responseObj[KKey.message] as String? ?? MSG.fail, () {});
          }
        }, failure: (err) async {
          Globs.hideHUD();
          mdShowAlert("Error", err, () {});
        });
  }

  void updateBankDetail(Map<String, dynamic> parameter) {
    Globs.showHUD();
    ServiceCall.post(parameter, SVKey.svDriverBankDetailUpdate, isTokenApi: true,
        withSuccess: (responseObj) async {
          Globs.hideHUD();

          if (responseObj[KKey.status] == "1") {
            mdShowAlert("Success",
                responseObj[KKey.message] as String? ?? MSG.success, () {});
          } else {
            mdShowAlert(
                "Error", responseObj[KKey.message] as String? ?? MSG.fail, () {});
          }
        }, failure: (err) async {
          Globs.hideHUD();
          mdShowAlert("Error", err, () {});
        });
  }
}
