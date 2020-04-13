import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

List<String> listaLocalizacao;
double localizacaoX;
double localizacaoY;
String localizacao;


setLocalizacao(String parametroLocalizacao) {
  listaLocalizacao = parametroLocalizacao.split(',');
  localizacaoX = double.parse(listaLocalizacao[0]);
  localizacaoY = double.parse(listaLocalizacao[1]);
  return MapsView();
}



String get getLocalizacao{
  return localizacao;
}

class MapsView extends StatefulWidget
{

  @override
 _MapState createState() =>_MapState(getLocalizacao);
  
}

class _MapState extends State<MapsView> {

  
  _MapState(String localizacao);

  GoogleMapController mapController;

  Set<Marker> markers = Set();

  
  final LatLng _center = LatLng(localizacaoX, localizacaoY);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void _updatePosition(CameraPosition _position) {
    print(
        'inside updatePosition ${_position.target.latitude} ${_position.target.longitude}');
    Marker marker = markers.firstWhere(
        (p) => p.markerId == MarkerId('marker_2'),
        orElse: () => null);

    markers.remove(marker);
    markers.add(
      Marker(
        markerId: MarkerId('marker_2'),
        position: LatLng(_position.target.latitude, _position.target.longitude),
        draggable: true,
      ),
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    markers.addAll([
  Marker(
    
      draggable: true,
      markerId: MarkerId('Estabelecimento'),
      position: LatLng(localizacaoX, localizacaoY),
          ),
          
]);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink,
          title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Visualização do mapa",
              style: TextStyle(color: Colors.white, fontSize: 16.0),
            ),
            Text(
              "Clique no marcador para liberar a opção de rota",
              style: TextStyle(color: Colors.white, fontSize: 14.0),
            )
          ],
        ),
        ),
        body: GoogleMap(
          //onCameraMove: ((_position) => _updatePosition(_position)),
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 16.14,
          ),
          markers: markers,
        ),
      ),
    );
  }
}