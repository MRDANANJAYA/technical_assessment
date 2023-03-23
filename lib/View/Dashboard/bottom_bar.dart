import 'package:flutter/material.dart';
import 'package:technical_assessment/View/Content/science_tab.dart';

import '../../Util/media.dart';
import '../Content/technologyTab.dart';



class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {

  int selectedIndex = 1;
  final PageStorageBucket bucket = PageStorageBucket();
  List categories = [
    const ScienceTab(),
    const TechnologyTab(),
  ];

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.amber[700],
      bottomNavigationBar: BottomAppBar(
        elevation: 10,
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: SizedBox(
          height: height / 10,
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: MaterialButton(
                  padding: const EdgeInsets.all(0),
                  minWidth: 0,
                  shape: const CircleBorder(),
                  onPressed: () {
                    setState(
                          () {
                        selectedIndex = 0;
                      },
                    );
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      bottomMatBt(
                          Icons.science_outlined,
                          'Science',
                    selectedIndex == 0,
                      )

                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: MaterialButton(
                  padding: const EdgeInsets.all(0),
                  minWidth: 0,
                  shape: const CircleBorder(),
                  onPressed: () {
                    setState(
                          () {
                        selectedIndex = 1;
                      },
                    );
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      bottomMatBt(
                        Icons.list_alt_rounded,
                        'Technology',
                        selectedIndex == 1,
                      )

                    ],
                  ),
                ),
              ),

            ],
          ),
        ) ,
      ),
      body: PageStorage(
        bucket: bucket,
        child: categories[selectedIndex],
      ),

    );
  }

  Widget bottomMatBt(IconData icon, String title,bool isSelected) {
    return Column(
      children: [
        Icon(icon , color: isSelected? Colors.orange.withOpacity(0.5):Colors.grey.withOpacity(0.5),),
        SizedBox(
          height: height / 99,
        ),
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            title,
            style: TextStyle(
              fontSize: isSelected ? width /28 : width /33 ,
              fontWeight: isSelected? FontWeight.normal : FontWeight.bold ,
              color: isSelected? Colors.orange.withOpacity(0.5):Colors.grey.withOpacity(0.5),
            ),
          ),
        )
      ],
    );
  }

  /*
    BottomNavigationBarItem(
              icon: Icon(Icons.science_outlined),
              label: 'Science',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list_alt_rounded),
              label: 'Technology',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline_rounded),
              label: 'Business',
            ),
  */



}


