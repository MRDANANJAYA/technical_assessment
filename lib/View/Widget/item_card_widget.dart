import 'package:flutter/material.dart';

import '../../Service/Models/science_model.dart';
import '../../Util/media.dart';

class ItemCardWidget extends StatelessWidget {
  final CategoryDatum item;

  const ItemCardWidget({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.orange,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        height: height / 7,
        width: width,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              padding: const EdgeInsets.all(2),
              height: height / 11,
              width: height / 11,
              decoration: const ShapeDecoration(
                shape: CircleBorder(),
                color: Colors.blueGrey,
              ),
              child: CircleAvatar(
                backgroundImage: NetworkImage("${item.imageUrl}"),
                backgroundColor: Colors.transparent,
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.content ?? "",
                  style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Icon(Icons.access_time,color: Colors.grey[600],size: 20,),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'author - ${item.author}',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 12,color: Colors.grey[600],),
                      maxLines: 1,
                    )
                  ],
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
