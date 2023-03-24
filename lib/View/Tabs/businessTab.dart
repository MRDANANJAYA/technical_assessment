import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../Service/Models/science_model.dart';
import '../../Service/ViewModels/category_view_model.dart';
import '../../Util/media.dart';
import '../Widget/item_card_widget.dart';
import '../Widget/loading_widget.dart';

class BusinessTab extends StatefulWidget {

  const BusinessTab({Key? key,}) : super(key: key);

  @override
  State<BusinessTab> createState() => _BusinessTabState();
}

class _BusinessTabState extends State<BusinessTab> {

  CategoryViewModel categoryViewModel = CategoryViewModel();
  @override
  void initState() {
    super.initState();
    getData('business');
  }

  List<CategoryDatum> itemList =[];
  bool isLoading = true;

//get response from api
  void getData(String category)async{
    if(mounted){
      setState(() {
        isLoading = true;
      });
    }
    await categoryViewModel.getScienceData(category).then((value) {

      if(value.data != null){
        value.data?.forEach((element) {
          if(mounted){
            setState(() {
              itemList.add(element);
            });
          }


        });
      }
      if(mounted){
        setState(() {
          isLoading = false;
        });
      }
    }).onError((error, stackTrace) => onFailure(error));
  }

  onFailure(error){
    if (kDebugMode) {
      print("Some error ====> $error");
    }
  }

  @override
  void dispose() {
    isLoading = true;
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
            child: Flex(
              crossAxisAlignment: CrossAxisAlignment.start,
              direction: Axis.vertical,
              children: [
                Padding(padding: const EdgeInsets.only(left: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 30,),
                      const Text('Business',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                      Text("Here is Your business News",style: TextStyle(fontWeight: FontWeight.w400,color: Colors.black.withOpacity(0.6),fontSize: 14),),
                      const SizedBox(height: 30,),
                    ],
                  ),
                ),

                Visibility(
                    visible: isLoading,
                    child: const LoadingWidget()),

                Flexible(flex: 10,child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: itemList.length,
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) {
                      return ItemCardWidget(
                        item: itemList[index],
                      );
                    }),)
              ],
            ),
          ),

        ],
      ),
    );
  }
}