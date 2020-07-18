import 'package:flutter/material.dart';
import 'package:blapp/src/control/home_bloc.dart';
import '../control/home_module.dart';
import 'establishment_view.dart';
import 'score_view.dart';
import 'reward_view.dart';

final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  var _bloc = HomeModule.to.getBloc<HomeBloc>();
  int _currentIndex = 0;

  final List<Widget> _children = [

EstablishmentPage(),
ScoreScreen(),
RewardScreen()
    
  ];

  void onTabTapped(int index) {
   setState(() {
     _currentIndex = index;
   });
 }

  @override
  void initState() {
    _bloc.getEstabelecimentos();
    super.initState();
  }
    
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,

      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                
                gradient: LinearGradient(colors: <Color>[
                Colors.pink,
                Colors.pink,
                Colors.pink,
                ])),
              child: Text('Opções'),
            ),
            ListTile(title:Text('Acessar'),
            ),
            ListTile(title:Text('Como funciona'),
            ),
            ListTile(title:Text('Contato')
            ),
            ListTile(title:Text('Quem somos')
            ),
            ListTile(title:Text('Tornar-se parceiro')
            )
          ],
        ),
      ),
      body: 
  
      _children[_currentIndex],
           bottomNavigationBar: BottomNavigationBar(
                    onTap: onTabTapped,
       currentIndex: _currentIndex, 
       
       items: [
         
         BottomNavigationBarItem(
           icon: new Icon(Icons.gps_fixed),
           title: new Text('Estabelecimentos'),
         ),
         BottomNavigationBarItem(
           icon: new Icon(Icons.check),
           title: new Text('Pontuar'),
         ),
         BottomNavigationBarItem(
           icon: Icon(Icons.attach_money),
           title: Text('Recompensas')
         )
       ],
     ),
    );
    
  }
}
