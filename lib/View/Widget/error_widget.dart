
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

onFailure(error,BuildContext context){
  if (kDebugMode) {
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('unable to connect to server please try again later'),
      behavior: SnackBarBehavior.floating,));
   // print("Some error ====> $error");
  }
}
