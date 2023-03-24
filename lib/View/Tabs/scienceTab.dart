import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:technical_assessment/Service/ViewModels/category_view_model.dart';

import '../../Service/Models/science_model.dart';
import '../../Util/media.dart';
import '../Widget/error_widget.dart';
import '../Widget/item_card_widget.dart';
import '../Widget/loading_widget.dart';

class ScienceTab extends StatefulWidget {
  const ScienceTab({
    Key? key,
  }) : super(key: key);

  @override
  State<ScienceTab> createState() => _ScienceTabState();
}

class _ScienceTabState extends State<ScienceTab> {
  CategoryViewModel categoryViewModel = CategoryViewModel();

  @override
  void initState() {
    super.initState();
    getData('science'); //get response from api
  }
  bool isLoading = true;
  List<CategoryDatum> itemList = [];

  void getData(String category) async {
    if(mounted){
      setState(() {
        isLoading = true;
      });
    }
    await categoryViewModel.getScienceData(category).then((value) {
      if (value.data != null) {
        value.data?.forEach((element) {
          if (mounted) {
            setState(() {
              itemList.add(element);
            });
          }
        });
      }
    }).onError((error, stackTrace) {
      if(mounted){
        onFailure(error, context);
        setState(() {
          isLoading = false;
        });
      }
    }).whenComplete(() {
      if(mounted){
        setState(() {
          isLoading = false;
        });
      }
    });


  }



  @override
  void dispose() {
    isLoading = true;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          const SizedBox(
            height: 50,
          ),
          const Text('News',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              )),
          const Spacer(),
          Container(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
            height: height / 1.3,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              color: Colors.white,
            ),
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
                      const Text('Science',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                      Text("Here is Your science News",style: TextStyle(fontWeight: FontWeight.w400,color: Colors.black.withOpacity(0.6),fontSize: 14),),
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
