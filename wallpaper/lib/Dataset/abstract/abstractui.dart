import 'package:flutter/material.dart';
import 'package:wallpaper/Dataset/abstract/abstract.dart';
class Abstractui extends StatefulWidget {
  const Abstractui({super.key});

  @override
  State<Abstractui> createState() => _AbstractuiState();
}

class _AbstractuiState extends State<Abstractui> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30,),
            Text("Abstract",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),

            SizedBox(height: 30,),
            Text('4 Wallpaper available',style: TextStyle(),),

            Expanded(
              child: GridView.builder(
                itemCount: abstractWallpaper.length,

                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount:2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 9/16
                ),
                itemBuilder:((_,index){
                  return Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image:DecorationImage(image: NetworkImage(abstractWallpaper[index]['img']),fit: BoxFit.cover)
                    ),
                  );
                }
                ),

              ),
            )
          ],
        ),
      ),


    );
  }
}
