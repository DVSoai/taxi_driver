import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:taxi_driver/common/color_extension.dart';
import 'package:taxi_driver/common_widget/icon_title_button.dart';
import 'package:taxi_driver/common_widget/round_button.dart';
import 'package:taxi_driver/core/constants/sized_box_constants.dart';
import 'package:taxi_driver/view/home/reason_view.dart';
import 'package:taxi_driver/view/home/tip_detail_view.dart';

import '../../common_widget/line_text_field.dart';

class RunRideView extends StatefulWidget {
  const RunRideView({super.key});

  @override
  State<RunRideView> createState() => _RunRideViewState();
}

class _RunRideViewState extends State<RunRideView> with OSMMixinObserver {
  late MapController controller;

  //23.02756018230479, 72.58131973941731
  //23.02726396414328, 72.5851928489523

  @override
  void initState() {
    super.initState();
    controller = MapController(
      initPosition:
      GeoPoint(latitude: 23.02756018230479, longitude: 72.58131973941731),
    );

    controller.addObserver(this);
  }

  bool isOpen = true;
  int rideStatus = 0;
  bool isCompleteRide = false;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          OSMFlutter(
            controller: controller,
            osmOption: OSMOption(
                enableRotationByGesture: true,
                zoomOption: const ZoomOption(
                  initZoom: 8,
                  minZoomLevel: 3,
                  maxZoomLevel: 19,
                  stepZoom: 1.0,
                ),
                roadConfiguration: const RoadOption(
                  roadColor: Colors.blueAccent,
                ),
                showDefaultInfoWindow: false,
                markerOption: MarkerOption(
                  defaultMarker: const MarkerIcon(
                    icon: Icon(
                      Icons.person_pin_circle,
                      color: Colors.blue,
                      size: 56,
                    ),
                  ),
                ),
                staticPoints: [
                  // StaticPositionGeoPoint(
                  //     '1',
                  //     const MarkerIcon(
                  //       icon: Icon(
                  //         Icons.person_pin_circle,
                  //         color: Colors.blue,
                  //         size: 56,
                  //       ),
                  //     ),
                  //     [
                  //       GeoPoint(latitude: 23.02756018230479, longitude: 72.58131973941731),
                  //       GeoPoint(latitude: 23.02726396414328, longitude:  72.5851928489523),
                  //     ]
                  // )
                ]),
            onMapIsReady: (isReady) {
              if (isReady) {
                print("Map is ready");
              }
            },
            onLocationChanged: (myLocation) {
              print("Location changed: $myLocation");
            },
            onGeoPointClicked: (geoPoint) {
              print("GeoPoint clicked: $geoPoint");
            },
          ),
          if(!isCompleteRide) ... [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                if (rideStatus == 1)
                  Container(
                      margin: const EdgeInsets.all(20),
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(35),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black12,
                                blurRadius: 10,
                                offset: Offset(0, -5))
                          ]),
                      child: Column(mainAxisSize: MainAxisSize.min, children: [
                        Stack(
                          alignment: AlignmentDirectional.bottomCenter,
                          children: [
                            TimerCountdown(
                              format: CountDownTimerFormat.minutesSeconds,
                              endTime: DateTime.now().add(
                                const Duration(
                                  minutes: 2,
                                ),
                              ),
                              onEnd: () {
                                print("Timer finished");
                              },
                              timeTextStyle: TextStyle(
                                color: TColor.secondary,
                                fontWeight: FontWeight.w300,
                                fontSize: 25,
                              ),
                              colonsTextStyle: TextStyle(
                                color: TColor.secondary,
                                fontWeight: FontWeight.w300,
                                fontSize: 25,
                              ),
                              spacerWidth: 0,
                              daysDescription: "",
                              hoursDescription: "",
                              minutesDescription: "",
                              secondsDescription: "",
                            ),
                            Text(
                              "Waiting for rider",
                              style: TextStyle(
                                color: TColor.secondaryText,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ])),
                if (rideStatus == 2)
                  Container(
                      margin: const EdgeInsets.all(20),
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(35),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black12,
                                blurRadius: 10,
                                offset: Offset(0, -5))
                          ]),
                      child: Column(mainAxisSize: MainAxisSize.min, children: [
                        Stack(
                          alignment: AlignmentDirectional.bottomCenter,
                          children: [
                            TimerCountdown(
                              format: CountDownTimerFormat.minutesSeconds,
                              endTime: DateTime.now().add(
                                const Duration(
                                  minutes: 2,
                                ),
                              ),
                              onEnd: () {
                                print("Timer finished");
                              },
                              timeTextStyle: TextStyle(
                                color: TColor.secondary,
                                fontWeight: FontWeight.w300,
                                fontSize: 25,
                              ),
                              colonsTextStyle: TextStyle(
                                color: TColor.secondary,
                                fontWeight: FontWeight.w300,
                                fontSize: 25,
                              ),
                              spacerWidth: 0,
                              daysDescription: "",
                              hoursDescription: "",
                              minutesDescription: "",
                              secondsDescription: "",
                            ),
                            Text(
                              "Arrived at dropoff",
                              style: TextStyle(
                                color: TColor.secondaryText,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ])),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            blurRadius: 10,
                            offset: Offset(0, -5))
                      ]),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    isOpen = !isOpen;
                                  });
                                },
                                icon: Image.asset(
                                  isOpen
                                      ? "assets/img/open_btn.png"
                                      : "assets/img/close_btn.png",
                                  width: 15,
                                  height: 15,
                                )),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "2 min",
                                  style: TextStyle(
                                      color: TColor.primaryText,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w800),
                                ),
                                SizedBoxConstants.sizedBoxW14,
                                Image.asset(
                                  "assets/img/ride_user_profile.png",
                                  width: 35,
                                  height: 35,
                                ),
                                SizedBoxConstants.sizedBoxW14,
                                Text(
                                  "0.5 min",
                                  style: TextStyle(
                                      color: TColor.primaryText,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w800),
                                ),
                              ],
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: Image.asset(
                                  "assets/img/call.png",
                                  width: 25,
                                  height: 25,
                                )),
                          ],
                        ),
                      ),
                      Text(
                        "Picking up James smith",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: TColor.secondaryText,
                          fontSize: 18,
                        ),
                      ),
                      if (isOpen) ...[
                        SizedBoxConstants.sizedBoxH08,
                        const Divider(
                          height: 0.5,
                          endIndent: 20,
                          indent: 20,
                        ),
                        SizedBoxConstants.sizedBoxH08,
                        Row(
                          children: [
                            Expanded(
                              child: IconTitleButton(
                                icon: "assets/img/chat.png",
                                title: "Chat",
                                onPressed: () {},
                              ),
                            ),
                            Expanded(
                              child: IconTitleButton(
                                icon: "assets/img/message.png",
                                title: "Message",
                                onPressed: () {},
                              ),
                            ),
                            Expanded(
                                child: IconTitleButton(
                                  icon: "assets/img/cancel_trip.png",
                                  title: "Cancel Tip",
                                  onPressed: () async {
                                    await showModalBottomSheet(
                                        backgroundColor: Colors.transparent,
                                        barrierColor: Colors.transparent,
                                        isScrollControlled: true,
                                        context: context,
                                        builder: (context) {
                                          return Stack(
                                            alignment:
                                            AlignmentDirectional.bottomCenter,
                                            children: [
                                              BackdropFilter(
                                                filter: ImageFilter.blur(
                                                  sigmaX: 5,
                                                  sigmaY: 5,
                                                ),
                                                child: Container(
                                                  color: Colors.black38,
                                                ),
                                              ),
                                              Container(
                                                padding: const EdgeInsets
                                                    .symmetric(
                                                    vertical: 15,
                                                    horizontal: 20),
                                                decoration: const BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius: BorderRadius
                                                        .only(
                                                        topRight: Radius
                                                            .circular(10),
                                                        topLeft: Radius
                                                            .circular(10)),
                                                    boxShadow: [
                                                      BoxShadow(
                                                          color: Colors.black12,
                                                          blurRadius: 10,
                                                          offset: Offset(0, -5))
                                                    ]),
                                                child: Column(
                                                  mainAxisSize: MainAxisSize
                                                      .min,
                                                  children: [
                                                    Text(
                                                      "Cancel Rockdean's trip?",
                                                      style: TextStyle(
                                                          color: TColor
                                                              .primaryText,
                                                          fontSize: 18,
                                                          fontWeight:
                                                          FontWeight.w800),
                                                    ),
                                                    SizedBoxConstants
                                                        .sizedBoxH14,
                                                    const Divider(),
                                                    SizedBoxConstants
                                                        .sizedBoxH14,
                                                    RoundButton(
                                                      title: 'YES, Cancel',
                                                      onPressed: () {
                                                        context
                                                            .push(
                                                            const ReasonView());
                                                      },
                                                      type: RoundButtonType.red,
                                                    ),
                                                    SizedBoxConstants
                                                        .sizedBoxH14,
                                                    RoundButton(
                                                      title: 'NO',
                                                      onPressed: () {
                                                        context.pop();
                                                      },
                                                      type: RoundButtonType
                                                          .boarded,
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          );
                                        });
                                  },
                                ))
                          ],
                        )
                      ],
                      SizedBoxConstants.sizedBoxH14,
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: RoundButton(
                          title: rideStatus == 0
                              ? "ARRIVED"
                              : rideStatus == 1
                              ? "START"
                              : "COMPLETE",
                          onPressed: () async {
                            if (rideStatus == 0) {
                              rideStatus = 1;
                              setState(() {});
                            } else if (rideStatus == 1) {
                              rideStatus = 2;
                              setState(() {});
                            } else if (rideStatus == 2) {
                              await showDialog(
                                  context: context,
                                  barrierColor: const Color(0xff32384D)
                                      .withOpacity(0.4),
                                  builder: (context) {
                                    return Dialog(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Container(
                                        padding: const EdgeInsets.all(15),
                                        width: context.width - 50,
                                        height: 180,
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Enter Toll Amount",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: TColor.primaryText,
                                                  fontSize: 23,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            Text(
                                              "Please enter Toll Amount",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: TColor.secondaryText,
                                                fontSize: 8,
                                              ),
                                            ),
                                            const LineTextField(
                                              isTitle: false,
                                              title: '',
                                              hintText: '\$250',
                                              keyboardType: TextInputType
                                                  .number,
                                            ),
                                            SizedBoxConstants.sizedBoxH08,
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment
                                                  .end,
                                              children: [
                                                TextButton(
                                                  onPressed: () {
                                                    context.pop();
                                                  },
                                                  child: Text(
                                                    "CANCEL",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color: TColor.primary,
                                                        fontSize: 16,
                                                        fontWeight: FontWeight
                                                            .w600
                                                    ),
                                                  ),
                                                ),
                                                TextButton(
                                                  onPressed: () {
                                                    context.pop();
                                                    setState(() {
                                                      isCompleteRide = true;
                                                    });
                                                  },
                                                  child: Text(
                                                    "DONE",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color: TColor.primary,
                                                        fontSize: 16,
                                                        fontWeight: FontWeight
                                                            .w600
                                                    ),
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  });
                            }
                          },
                        ),
                      ),
                      SizedBoxConstants.sizedBoxH24,
                    ],
                  ),
                )
              ],
            ),
          ],
          if(isCompleteRide)...[
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            blurRadius: 10,
                            offset: Offset(0, -5))
                      ]),
                  child: Column(
                    children: [
                      SizedBoxConstants.sizedBoxH14,
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                          "How was your rider?",
                          style: TextStyle(
                            color: TColor.primaryText,
                            fontSize: 18,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBoxConstants.sizedBoxH08,
                      Text(
                        "Rockdean",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: TColor.primaryText,
                          fontSize: 25,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      SizedBoxConstants.sizedBoxH14,
                      RatingBar.builder(
                        initialRating: 3,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) =>
                           const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
                      SizedBoxConstants.sizedBoxH30,

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: RoundButton(
                          title: "RATE RIDER",
                          onPressed: () {
                            context.push(const TipDetailView());
                          },
                        ),
                      ),
                      SizedBoxConstants.sizedBoxH24,
                    ],
                  ),
                )
              ],
            ),
          ],
          SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: InkWell(
                      onTap: () {
                        context.pop();
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25, vertical: 15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 10,
                            )
                          ],
                        ),
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/img/pickup_pin_1.png",
                              width: 30,
                              height: 30,
                            ),
                            SizedBoxConstants.sizedBoxW08,
                            Expanded(
                              child: Text(
                                "1 Ash Park, Pembroke Dock, SA72 ",
                                style: TextStyle(
                                    color: TColor.primaryText, fontSize: 15),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }

  void addMarker() async {
    await controller.setMarkerOfStaticPoint(
      id: "pickup",
      markerIcon: MarkerIcon(
        iconWidget: Image.asset(
          "assets/img/pickup_pin.png",
          width: 80,
          height: 80,
        ),
      ),
    );

    await controller.setMarkerOfStaticPoint(
      id: "dropoff",
      markerIcon: MarkerIcon(
        iconWidget: Image.asset(
          "assets/img/drop_pin.png",
          width: 80,
          height: 80,
        ),
      ),
    );

    //23.02756018230479, 72.58131973941731
    //23.02726396414328, 72.5851928489523
    await controller.setStaticPosition([
      GeoPoint(
        latitude: 23.02756018230479,
        longitude: 72.58131973941731,
      )
    ], "pickup");

    await controller.setStaticPosition([
      GeoPoint(
        latitude: 23.02726396414328,
        longitude: 72.5851928489523,
      )
    ], "dropoff");
    loadMapRoad();
  }

  void loadMapRoad() async {
    await controller.drawRoad(
        GeoPoint(latitude: 23.02756018230479, longitude: 72.58131973941731),
        GeoPoint(latitude: 23.02726396414328, longitude: 72.5851928489523),
        roadType: RoadType.car,
        roadOption: const RoadOption(
          roadColor: Colors.blueAccent,
          roadBorderWidth: 3,
        ));
  }

  @override
  Future<void> mapIsReady(bool isReady) async {
    if (isReady) {
      addMarker();
    }
  }
}
