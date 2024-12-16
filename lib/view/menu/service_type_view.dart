import 'package:flutter/material.dart';
import 'package:taxi_driver/common/color_extension.dart';
import 'package:taxi_driver/common_widget/switch_row.dart';

class ServiceTypeView extends StatefulWidget {
  const ServiceTypeView({super.key});

  @override
  State<ServiceTypeView> createState() => _ServiceTypeViewState();
}

class _ServiceTypeViewState extends State<ServiceTypeView> {
  List listArr = [
    {"name": "Executive", "detail": "Luxury cars for VIPs", "value": false},
    {
      "name": "Standard",
      "detail": "Affordable cars for everyone",
      "value": true
    },
    {"name": "Bike", "detail": "Fast and affordable bikes", "value": true},
    {"name": "Delivery", "detail": "Fast delivery service", "value": false},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
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
          "Switch Service Type",
          style: TextStyle(
              color: TColor.primaryText,
              fontSize: 18,
              fontWeight: FontWeight.w800),
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(20),
          itemBuilder:(context,index){
            return SwitchRow(sObj: listArr[index] as Map? ?? {}, didChange: (isView){});
          },
          separatorBuilder: (context, index) {
            return  Divider(
              color: TColor.lightGray,
            );
          },
          itemCount: listArr.length
      ),
    );
  }
}
