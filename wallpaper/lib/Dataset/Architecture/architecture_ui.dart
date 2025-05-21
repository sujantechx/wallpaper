import 'package:flutter/material.dart';
import 'package:wallpaper/Dataset/Architecture/architechureWallpaper.dart';

class ArchitectureUi extends StatefulWidget {
  const ArchitectureUi({super.key});

  @override
  State<ArchitectureUi> createState() => _ArchitectureUiState();
}

class _ArchitectureUiState extends State<ArchitectureUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30,),
            Text("Architecture",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),

            SizedBox(height: 30,),
            Text('1 Wallpaper available',style: TextStyle(),),

            Expanded(
              child: GridView.builder(
                itemCount: architecherWallpaper.length,

                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount:2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 9/16
                ),
                itemBuilder:((_,index){
                  return GestureDetector(
                    onTap: (){
                      // Navigator.push(context, MaterialPageRoute(builder: ()=>
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          image:DecorationImage(image: NetworkImage(architecherWallpaper[index]['img']),fit: BoxFit.cover)
                      ),
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
