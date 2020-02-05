import 'package:hasura_connect/hasura_connect.dart';
import 'package:blapp/src/app_bloc.dart';
import 'package:blapp/src/control/home_repository.dart';
import 'package:blapp/src/control/home_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:blapp/src/view/home_view.dart';
import 'package:blapp/src/state/add_state_bloc.dart';
import 'package:blapp/src/state/state_bloc.dart';
import 'package:blapp/src/state/state_repository.dart';

class HomeModule extends ModuleWidget {
  final String _url = 'https://fidapp.herokuapp.com/v1/graphql';

  @override
  List<Bloc> get blocs => [
        Bloc((i) => HomeBloc()),
        Bloc((i) => AddStateBloc()),
        Bloc((i) => StateBloc()),
        Bloc((i) => AppBloc()),
      ];

  @override
  List<Dependency> get dependencies => [
        Dependency((i) => HomeRepository(i.get<HasuraConnect>())),
        Dependency((i) => HasuraConnect(_url)),
        Dependency((i) => StateRepository(i.get<HasuraConnect>())),
      ];

  @override
  Widget get view => HomePage();

  static Inject get to => Inject<HomeModule>.of();
}
