// import 'package:flutter/material.dart';
// import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
// import 'package:geolocator/geolocator.dart'; // Thêm thư viện này
//
// class HomeGeView extends StatefulWidget {
//   const HomeGeView({super.key});
//
//   @override
//   State<HomeGeView> createState() => _HomeGeViewState();
// }
//
// class _HomeGeViewState extends State<HomeGeView> {
//   MapController controller = MapController(
//     initPosition: GeoPoint(latitude: 20.8794977, longitude: 105.6705801),
//   );
//
//   @override
//   void initState() {
//     super.initState();
//     _getCurrentLocation();
//   }
//
//   Future<void> _getCurrentLocation() async {
//     // Kiểm tra quyền truy cập vị trí
//     LocationPermission permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//     }
//
//     if (permission == LocationPermission.whileInUse || permission == LocationPermission.always) {
//       // Lấy vị trí hiện tại
//       Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
//       // Cập nhật vị trí trên bản đồ
//       controller.changeLocation(GeoPoint(latitude: position.latitude, longitude: position.longitude));
//     } else {
//       // Xử lý trường hợp không có quyền truy cập
//       print('Không có quyền truy cập vị trí');
//     }
//   }
//
//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           OSMFlutter(
//               controller: controller,
//               osmOption: OSMOption(
//                 userTrackingOption: const UserTrackingOption(
//                   enableTracking: true,
//                   unFollowUser: false,
//                 ),
//                 zoomOption: const ZoomOption(
//                   initZoom: 8,
//                   minZoomLevel: 3,
//                   maxZoomLevel: 19,
//                   stepZoom: 1.0,
//                 ),
//                 userLocationMarker: UserLocationMaker(
//                   personMarker: const MarkerIcon(
//                     icon: Icon(
//                       Icons.location_history_rounded,
//                       color: Colors.red,
//                       size: 48,
//                     ),
//                   ),
//                   directionArrowMarker: const MarkerIcon(
//                     icon: Icon(
//                       Icons.double_arrow,
//                       size: 48,
//                     ),
//                   ),
//                 ),
//                 roadConfiguration: const RoadOption(
//                   roadColor: Colors.yellowAccent,
//                 ),
//                 markerOption: MarkerOption(
//                     defaultMarker: const MarkerIcon(
//                       icon: Icon(
//                         Icons.person_pin_circle,
//                         color: Colors.blue,
//                         size: 56,
//                       ),
//                     )),
//               )),
//         ],
//       ),
//     );
//   }
// }
