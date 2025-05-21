import 'package:flutter/material.dart';
import 'package:wallpaper/Dataset/nature/fullscree.dart';
import 'package:wallpaper/Dataset/nature/nature.dart';

class Natureui extends StatefulWidget {
  const Natureui({super.key});

  @override
  State<Natureui> createState() => _NatureuiState();
}

class _NatureuiState extends State<Natureui> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30,),
            Text("Nature",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),

        SizedBox(height: 30,),
        Text('3 Wallpaper available',style: TextStyle(),),

            Expanded(
              child: GridView.builder(
                itemCount: natureWallpaper.length,

                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 9/16
                ),
                itemBuilder:((_,index){
                  return GestureDetector(
                    onTap: (){
                      String selectedImage=natureWallpaper[index]['imgNature'];
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context)=>FullscreeNature(imageUrl : selectedImage))
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                          image:DecorationImage(image: NetworkImage(natureWallpaper[index]['imgNature']),fit: BoxFit.cover)
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
