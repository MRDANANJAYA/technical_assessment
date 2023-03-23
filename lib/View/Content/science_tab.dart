


import 'package:flutter/material.dart';
import 'package:technical_assessment/Service/ViewModels/science_view_model.dart';

import '../../Util/media.dart';


class ScienceTab extends StatefulWidget {

  const ScienceTab({Key? key,}) : super(key: key);

  @override
  State<ScienceTab> createState() => _ScienceTabState();
}

class _ScienceTabState extends State<ScienceTab> {

  ScienceViewModel scienceViewModel = ScienceViewModel();
  @override
  void initState() {
    super.initState();
    getData('science'); //get response from api
  }

  List itemList =[];


  void getData(String category)async{
    await scienceViewModel.getScienceData(category).then((value) {

      if(value.data != null){
        value.data?.forEach((element) {
          if(mounted){
            setState(() {
              itemList.add(element);
            });
          }
          });
      }

    });



  }
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: height,
      width: width,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          const SizedBox(height: 50,),
          const Text('News' , style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white,)),
          const Spacer(),
          Container(
            padding: const EdgeInsets.only(left: 10, right: 10,top: 10),
            height: height /1.3,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),),
              color: Colors.white,),
            width: width,
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: itemList.length,
                shrinkWrap: true,
                itemBuilder: (context, index){
                  return Card(
                    elevation: 0,
                    child:Container(
                      decoration:  BoxDecoration(
                        border: Border.all(
                          color: Colors.red,),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      height: height/10,
                      width: width,
                    ) ,
                  );
                }),
          ),

        ],
      ),
    );
  }
}
