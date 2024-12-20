import 'package:flutter/material.dart';
import 'package:taxi_driver/common_widget/car_document_row.dart';

import '../../common/color_extension.dart';

class MyCarDetailsView extends StatefulWidget {
  const MyCarDetailsView({super.key});

  @override
  State<MyCarDetailsView> createState() => _MyCarDetailsViewState();
}

class _MyCarDetailsViewState extends State<MyCarDetailsView> {
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
          title: Column(
            children: [
              Text(
                "Toyota Prius",
                style: TextStyle(
                  color: TColor.primaryText,
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Text(
                "AB 1234",
                style: TextStyle(
                  color: TColor.secondaryText,
                  fontSize: 14,
                ),
              ),
            ],
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarDocumentRow(
                title: "Vehicle Registration",
                date: "2024-5-11",
                status: "APPROVED",
                statusColor: Colors.green,
                onPressed: () {}),
            CarDocumentRow(
                title: "Vehicle Registration",
                date: "2024-5-11",
                status: "APPROVED",
                statusColor: Colors.green,
                onPressed: () {}),
            CarDocumentRow(
                title: "Vehicle Registration",
                date: "2024-5-11",
                status: "APPROVED",
                statusColor: Colors.green,
                onPressed: () {}),
            CarDocumentRow(
                title: "Vehicle Registration",
                date: "2024-5-11",
                status: "NOT APPROVED",
                statusColor: Colors.red,
                onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
