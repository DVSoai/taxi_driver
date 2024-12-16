import 'package:flutter/material.dart';
import 'package:taxi_driver/common/color_extension.dart';
import 'package:taxi_driver/common_widget/plan_row.dart';

class SubscriptionPlaneView extends StatefulWidget {
  const SubscriptionPlaneView({super.key});

  @override
  State<SubscriptionPlaneView> createState() => _SubscriptionPlaneViewState();
}

class _SubscriptionPlaneViewState extends State<SubscriptionPlaneView> {
  List planArr = [
    {
      "name": "Basic plan",
      "time": "1 Month",
      "rides": "10 rides Everyday",
      "cash_rides": "2 Cash rides",
      "km": "50 km travel rides",
      "price": "TRY FREE",
    },
    {
      "name": "Classic plan",
      "time": "3 Month",
      "rides": "10 rides Everyday",
      "cash_rides": "2 Cash rides",
      "km": "50 km travel rides",
      "price": "BUY AT \$20.50",
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColor.bg,
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
          "Subscription Plan",
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
      body: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          itemCount: planArr.length,
          itemBuilder: (context, index) {
            var planObj = planArr[index] as Map? ?? {};
            return PlanRow(pObj: planObj, onPressed: () {});
          }),
    );
  }
}
