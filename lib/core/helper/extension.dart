import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

extension Navigation on BuildContext {
  Future<dynamic> pushNamed(String routeName, {Object? args}) {
    return Navigator.of(this).pushNamed(routeName, arguments: args);
  }

  Future<dynamic> pushReplacementNamed(String routeName, {Object? args}) {
    return Navigator.of(this).pushReplacementNamed(routeName, arguments: args);
  }

  Future<dynamic> pushNamedAndRemoveUntile(String routeName,
      {required RoutePredicate predicate, Object? args}) {
    return Navigator.of(this)
        .pushNamedAndRemoveUntil(routeName, predicate, arguments: args);
  }

  void pop() {
    Navigator.of(this).pop();
  }

}
//"".isNullOrEmpty
extension StringExension on String?{
  bool isNullOrEmpty()=>this == null || this!.isEmpty;
}
//List.isNullOrEmty
extension ListExension<T> on List<T>?{
 bool isNullOrEmpty()=>this!.isEmpty || this==null;
}