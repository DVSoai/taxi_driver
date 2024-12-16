
import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:taxi_driver/common/color_extension.dart';
import 'package:taxi_driver/core/constants/sized_box_constants.dart';
import 'package:taxi_driver/view/home/run_ride_view.dart';

class TipRequestView extends StatefulWidget {
  const TipRequestView({super.key});

  @override
  State<TipRequestView> createState() => _TipRequestViewState();
}

class _TipRequestViewState extends State<TipRequestView> with OSMMixinObserver {
  late MapController controller;
  //23.02756018230479, 72.58131973941731
  //23.02726396414328, 72.5851928489523

  @override
  void initState() {
    super.initState();
    controller = MapController(
      initPosition: GeoPoint(
        latitude: 23.02756018230479,
        longitude:
        72.58131973941731
      ),
    );

    controller.addObserver(this);
  }
  bool isOpen = true;

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
                ]
            ),
            onMapIsReady: (isReady){
              if(isReady){
               print("Map is ready");
              }
            },
            onLocationChanged: (myLocation){
              print("Location changed: $myLocation");
            },
            onGeoPointClicked: (geoPoint){
              print("GeoPoint clicked: $geoPoint");
            },
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBoxConstants.sizedBoxH14,
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "25 min",
                          style: TextStyle(
                              color: TColor.primaryText,
                              fontSize: 25,
                              fontWeight: FontWeight.w800),
                        ),
                      ],
                    ),
                    SizedBoxConstants.sizedBoxH08,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: Text(
                            "\$12.5",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: TColor.secondaryText,
                                fontSize: 18,
                               ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "4.5 KM",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: TColor.secondaryText,
                                fontSize: 18,
                                ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 8),
                            child: Row(
                             mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset("assets/img/rate_tip.png",width: 20,height: 20,),
                                SizedBoxConstants.sizedBoxW02,
                                Text(
                                  "3.5",
                                  style: TextStyle(
                                      color: TColor.secondaryText,
                                      fontSize: 18,
                                     ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBoxConstants.sizedBoxH14,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                      child: Row(
                        children: [
                          Container(
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                              color: TColor.secondary,
                             borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          SizedBoxConstants.sizedBoxW14,
                          Text(
                            "1 Ash Park, Pembroke Dock, SA72",
                            style: TextStyle(
                                color: TColor.primaryText,
                                fontSize: 15
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                      child: Row(
                        children: [
                          Container(
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                              color: TColor.primary,
                            ),
                          ),
                          SizedBoxConstants.sizedBoxW14,
                          Text(
                            "54 Hollybank Rd, Southampton",
                            style: TextStyle(
                                color: TColor.primaryText,
                                fontSize: 15
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBoxConstants.sizedBoxH14,
                    InkWell(
                      onTap: (){
                        context.push(const RunRideView());
                      },
                      child: Container(
                        width: double.maxFinite,
                        padding: const EdgeInsets.all(6),
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          color: TColor.primary,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Stack(
                          alignment: Alignment.centerRight,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('TAP TO ACCEPT',
                                  style: TextStyle(
                                    color: TColor.primaryTextW,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: Colors.black12,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                '15',
                                style: TextStyle(
                                    color: TColor.primaryTextW,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBoxConstants.sizedBoxH24,

                  ],
                ),
              )
            ],
          ),
          SafeArea(child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: (){
                        context.pop();
                      },
                      child: Container(
                        padding:const EdgeInsets.symmetric(horizontal: 25,vertical: 15),
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
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                          Image.asset("assets/img/close.png",width: 25,height: 25,),
                            SizedBoxConstants.sizedBoxW08,
                            Text(
                              "No Thanks",
                              style: TextStyle(
                                  color: TColor.primaryText,
                                  fontSize: 16,
                              ),
                            ),
                          ],
                        ),

                      ),
                    ),

                  ],
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
          longitude:72.58131973941731,
      )], "pickup");

    await controller.setStaticPosition([
      GeoPoint(
          latitude: 23.02726396414328,
          longitude: 72.5851928489523 ,
      )], "dropoff");
    loadMapRoad();
  }
  void loadMapRoad() async {
    await controller.drawRoad(
        GeoPoint(
            latitude:23.02756018230479,
            longitude: 72.58131973941731),
        GeoPoint(
            latitude: 23.02726396414328,
            longitude: 72.5851928489523),
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

