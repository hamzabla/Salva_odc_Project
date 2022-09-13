import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';


class Map extends StatefulWidget {

  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {
  @override
  Widget build(BuildContext context) {

    LatLng currentLatLng= LatLng(33.9715904, -6.8498129);

    final markers = <Marker>[
      Marker(
        width: 80,
        height: 80,
        point: currentLatLng,
        builder: (ctx) => const FlutterLogo(
          textColor: Colors.blue,
          key: ObjectKey(Colors.blue),
        ),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Location',
            style: TextStyle( color: Color(0xff073983),)),
        backgroundColor: Colors.white70,
      ),
      body: FlutterMap(
        options: MapOptions(
          center: LatLng(33.9715904, -6.8498129),
          zoom: 12,
        ),
        layers: [
          TileLayerOptions(
            urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
            userAgentPackageName: 'com.example.app',
          ),
          MarkerLayerOptions(
            markers: [
              Marker(
                  width: 45.0,
                  height: 45.0,
                  point: currentLatLng,
                  builder: (context)=> Container(
                    child: IconButton(
                      icon: Icon(Icons.location_on),
                      color: Colors.indigo,
                      iconSize: 45.0,
                      onPressed: () { print('Marker Tapped');},),)),
            ]
          )
        ],
        nonRotatedChildren: [
          AttributionWidget.defaultWidget(
            source: 'OpenStreetMap contributors',
            onSourceTapped: null,
          ),
        ],

      ),
    );
  }
}
