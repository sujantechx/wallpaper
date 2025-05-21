import 'package:flutter/material.dart';
import 'package:wallpaper/Dataset/animal/animalWallpaper.dart';

class Animalui extends StatefulWidget {
  const Animalui({super.key});

  @override
  State<Animalui> createState() => _AnimaluiState();
}

class _AnimaluiState extends State<Animalui> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30,),
            Text("Animal",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),

            SizedBox(height: 30,),
            Text(' 3 Wallpaper available',style: TextStyle(),),

            Expanded(
              child: GridView.builder(
                itemCount: animalWallpaper.length,

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
                        image:DecorationImage(image: NetworkImage(animalWallpaper[index]['img']),fit: BoxFit.cover)
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
