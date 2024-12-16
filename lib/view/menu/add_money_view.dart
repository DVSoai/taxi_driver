import 'package:flutter/material.dart';
import 'package:taxi_driver/common/color_extension.dart';
import 'package:taxi_driver/common_widget/bank_row.dart';
import 'package:taxi_driver/common_widget/round_button.dart';
import 'package:taxi_driver/common_widget/tag_button.dart';
import 'package:taxi_driver/core/constants/img_constants.dart';

import '../../core/constants/sized_box_constants.dart';

class AddMoneyView extends StatefulWidget {
  const AddMoneyView({super.key});

  @override
  State<AddMoneyView> createState() => _AddMoneyViewState();
}

class _AddMoneyViewState extends State<AddMoneyView> {
  TextEditingController txtAdd = TextEditingController();

  @override
  void initState() {
    super.initState();
    txtAdd.text = "0";
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        backgroundColor: Colors.white,
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
        centerTitle: true,
        title: Text(
          "Add Money to Wallet",
          style: TextStyle(
            color: TColor.primaryText,
            fontSize: 18,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 12,
              color: TColor.lightWhite,
              width: double.maxFinite,
            ),
            SizedBoxConstants.sizedBoxH14,

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Available Balance",
                    style: TextStyle(
                      color: TColor.secondaryText,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    "\$54.57",
                    style: TextStyle(
                      color: TColor.primaryText,
                      fontSize: 16,
                    ),
                  ),


                ],
              ),
            ),
            SizedBoxConstants.sizedBoxH08,
            Padding(
               padding:const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              children: [
                Image.asset("${ImageConstants.imagesPath}/doller.png", width: 15),
                SizedBoxConstants.sizedBoxW08,
                Expanded(
                  child: TextField(
                    controller: txtAdd,
                    keyboardType: TextInputType.number,
                    style: TextStyle(
                      color: TColor.primaryText,
                      fontSize: 24,
                      fontWeight: FontWeight.w800
                    ),
                    decoration: InputDecoration(
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      hintText: "Enter Add Wallet Amount",
                      hintStyle: TextStyle(
                        color: TColor.placeholder,
                        fontSize: 14,
                        fontWeight: FontWeight.w800
                      ),
                    ),
                  ),
                )
              ],
            ),
            ),
            SizedBoxConstants.sizedBoxH14,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TagButton(title: "+10", onPressed: (){}),
                  TagButton(title: "+20", onPressed: (){}),
                  TagButton(title: "+50", onPressed: (){}),
                  TagButton(title: "+100", onPressed: (){}),
                ],
              ),
            ),
            SizedBoxConstants.sizedBoxH14,
            Container(
              height: 12,
              color: TColor.lightWhite,
              width: double.maxFinite,
            ),
            SizedBoxConstants.sizedBoxH14,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "From Bank Account",
                    style: TextStyle(
                      color: TColor.secondaryText,
                      fontSize: 18,
                    ),
                  ),
                  Image.asset("${ImageConstants.imagesPath}/next.png", width: 15,height: 15,color: TColor.primaryText,),


                ],
              ),
            ),
             ListView.separated(
               physics: const NeverScrollableScrollPhysics(),
               shrinkWrap: true,
               padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                 itemBuilder: (context, index){
                   return const BankRow(bObj: {
                     "icon": "${ImageConstants.imagesPath}/bank_logo.png",
                     "name": "Standard Chartered Bank",
                     "number": "**** **** **** 1234",
                   });
                 },
                 separatorBuilder: (context, index) => const Divider(),
                 itemCount: 1),
            SizedBoxConstants.sizedBoxH14,
            Container(
              height: 12,
              color: TColor.lightWhite,
              width: double.maxFinite,
            ),


            SizedBoxConstants.sizedBoxH14,
            Padding(padding: const EdgeInsets.symmetric(horizontal: 20),child: RoundButton(title: "SUBMIT REQUEST", onPressed: (){})),
            SizedBoxConstants.sizedBoxH14,
          ],
        ),
      ),
    );
  }
}
