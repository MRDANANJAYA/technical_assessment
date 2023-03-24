
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

onFailure(error,BuildContext context,onPressed){

    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: const Text('Unable to connect to server. Please try again later'),
      action: SnackBarAction(label: "Retry", onPressed: onPressed),
      behavior: SnackBarBehavior.floating,));
   // print("Some error ====> $error");

}
