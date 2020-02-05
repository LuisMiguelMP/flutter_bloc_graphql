import 'package:flutter/material.dart';
import 'package:blapp/src/control/home_bloc.dart';
import '../control/home_module.dart';
import 'establishment_view.dart';
import 'score_view.dart';
import 'reward_view.dart';

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
           title: new Text('Receber pontuação'),
         ),
         BottomNavigationBarItem(
           icon: Icon(Icons.attach_money),
           title: Text('Resgatar prêmios')
         )
       ],
     ),
    );
    
  }
}
