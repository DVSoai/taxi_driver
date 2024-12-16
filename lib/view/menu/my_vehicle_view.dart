import 'package:flutter/material.dart';
import 'package:taxi_driver/common/color_extension.dart';
import 'package:taxi_driver/common_widget/my_car_row.dart';
import 'package:taxi_driver/common_widget/round_button.dart';
import 'package:taxi_driver/core/constants/img_constants.dart';
import 'package:taxi_driver/core/constants/sized_box_constants.dart';
import 'package:taxi_driver/view/menu/my_car_details_view.dart';

import '../login/add_vehicle_view.dart';

class MyVehicleView extends StatefulWidget {
  const MyVehicleView({super.key});

  @override
  State<MyVehicleView> createState() => _MyVehicleViewState();
}

class _MyVehicleViewState extends State<MyVehicleView> {
  List arrVehicle = [
    {"name":"Toyota Prius", "no_plat":"AB 1234","image":"${ImageConstants.imagesPath}/user_car.png"},
    {"name":"Toyota Prius", "no_plat":"AB 1234","image":"${ImageConstants.imagesPath}/user_car.png"},
    {"name":"Toyota Prius", "no_plat":"AB 1234","image":"${ImageConstants.imagesPath}/user_car.png"},
    {"name":"Toyota Prius", "no_plat":"AB 1234","image":"${ImageConstants.imagesPath}/user_car.png"},
    {"name":"Toyota Prius", "no_plat":"AB 1234","image":"${ImageConstants.imagesPath}/user_car.png"},
  ];
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
          "My Vehicle",
          style: TextStyle(
            color: TColor.primaryText,
            fontSize: 18,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(child:
          ListView.separated(
            padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 20),
              itemBuilder: (context, index){
                var cObj = arrVehicle[index] as Map? ?? {};
                return MyCarRow(cObj: cObj, onPressed: (){});
              },
              separatorBuilder: (context, index) => const Divider(height: 0.5,),
              itemCount: arrVehicle.length
          )),
          Padding(padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 20)
          ,child: RoundButton(title: "ADD A VEHICLE",onPressed: ()async{
              await context.push(const AddVehicleView());
            // context.push(const MyCarDetailsView());
            },),),
          SizedBoxConstants.sizedBoxH14
        ],
      ),
    );
  }
}
