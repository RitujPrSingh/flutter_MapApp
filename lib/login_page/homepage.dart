import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map_assignment/services/Auth.dart';

class HomePage extends StatefulWidget {
  HomePage({
    @required this.auth,
  });

  final AuthBase auth;

  @override
  _HomePageState createState() => _HomePageState(auth: auth);
}

class _HomePageState extends State<HomePage> {
  Set<Marker> _markers = {};
  BitmapDescriptor mapMarker;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setCustomMarker();
  }

  void setCustomMarker() async {
    mapMarker = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(),
      'images/icon-3.png',
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    controller.setMapStyle(Utils.mapStyle);
    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId('id-1'),
          position: LatLng(25.3652, 83.0110),
          icon: mapMarker,
          infoWindow: InfoWindow(
            title: 'Raj Tower',
            snippet: 'Home , Co-ordinates -> 25.3652, 83.0110'  ,

          ),
        ),
      );
      _markers.add(Marker(
        markerId: MarkerId('id-2'),
        position: LatLng(25.3716,83.0252),
        icon: mapMarker,
        infoWindow: InfoWindow(
          title: 'Sarnath',
          snippet: 'A Historical place, Co-ordinates-> 25.3716,83.0252',
        ),
      ));
      _markers.add(Marker(
        markerId: MarkerId('id-3'),
        position: LatLng(25.2677,82.9913),
        icon: mapMarker,
        infoWindow: InfoWindow(
          title: 'BHU',
          snippet: 'Banaras Hindu University, Co-ordinates-> 25.2677,82.9913',
        ),
      ));
      _markers.add(Marker(
        markerId: MarkerId('id-4'),
        position: LatLng(25.3109,83.0107),
        icon: mapMarker,
        infoWindow: InfoWindow(
          title: 'Temple',
          snippet: 'Kashi Vishwanath Temple, Co-ordinates->25.3109,83.0107 ',
        ),
      ));
      _markers.add(Marker(
        markerId: MarkerId('id-5'),
        position: LatLng(25.3439, 82.9882),
        icon: mapMarker,
        infoWindow: InfoWindow(
          title: 'Hospital',
          snippet: 'Co-ordinates-> 25.3439,82.9882',
        ),
      ));
    });
  }

  _HomePageState({
    @required this.auth,
  });

  final AuthBase auth;

  Future<void> _signOut() async {
    try {
      await auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Maps Sample App'),
          backgroundColor: Colors.deepPurple,
          actions: [
            FlatButton(
              onPressed: _signOut,
              child: Text(
                'Logout',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          markers: _markers,
          initialCameraPosition: CameraPosition(
            target: LatLng(25.3652, 83.0110),
            zoom: 15,
          ),
        ),
      ),
    );
  }
}

class Utils {
  static String mapStyle = '''
  [
  {
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#212121"
      }
    ]
  },
  {
    "elementType": "labels.icon",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#757575"
      }
    ]
  },
  {
    "elementType": "labels.text.stroke",
    "stylers": [
      {
        "color": "#212121"
      }
    ]
  },
  {
    "featureType": "administrative",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#757575"
      }
    ]
  },
  {
    "featureType": "administrative.country",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#9e9e9e"
      }
    ]
  },
  {
    "featureType": "administrative.land_parcel",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "administrative.locality",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#bdbdbd"
      }
    ]
  },
  {
    "featureType": "poi",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#757575"
      }
    ]
  },
  {
    "featureType": "poi.park",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#181818"
      }
    ]
  },
  {
    "featureType": "poi.park",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#616161"
      }
    ]
  },
  {
    "featureType": "poi.park",
    "elementType": "labels.text.stroke",
    "stylers": [
      {
        "color": "#1b1b1b"
      }
    ]
  },
  {
    "featureType": "road",
    "elementType": "geometry.fill",
    "stylers": [
      {
        "color": "#2c2c2c"
      }
    ]
  },
  {
    "featureType": "road",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#8a8a8a"
      }
    ]
  },
  {
    "featureType": "road.arterial",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#373737"
      }
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#3c3c3c"
      }
    ]
  },
  {
    "featureType": "road.highway.controlled_access",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#4e4e4e"
      }
    ]
  },
  {
    "featureType": "road.local",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#616161"
      }
    ]
  },
  {
    "featureType": "transit",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#757575"
      }
    ]
  },
  {
    "featureType": "water",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#000000"
      }
    ]
  },
  {
    "featureType": "water",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#3d3d3d"
      }
    ]
  }
]
  ''';
}
