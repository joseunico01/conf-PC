import 'package:flutter/material.dart';
import 'package:lab4_unfv/src/bolc/login_bloc.dart';

class Provider extends InheritedWidget {
  final loginBloc = LoginBloc();

  Provider({Key? key, required child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;
  static LoginBloc of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<Provider>() as Provider)
        .loginBloc;
    /*
    return (context.dependOnInheritedWidgetOfExactType(aspect: Provider)
            as Provider)
        .loginBloc;
        */
    //return (context.inheritFromWidgetOfExactType(Provider) as Provider).loginBloc;
  }
}
