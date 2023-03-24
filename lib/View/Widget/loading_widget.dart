
import 'package:flutter/material.dart';

import '../../Util/media.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});


  @override
  Widget build(BuildContext context) {
    return Center(
      heightFactor: 3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(),
          SizedBox(height: height/20,),
          const Text("Loading..."),
        ],
      ),
    );
  }
}
