import 'package:flutter/material.dart';
import 'package:wallpaper/Dataset/Anime/animeui.dart';
import 'package:wallpaper/Dataset/Architecture/architecture_ui.dart';
import 'package:wallpaper/Dataset/abstract/abstractui.dart';
import 'package:wallpaper/Dataset/animal/animalui.dart';
import 'package:wallpaper/Dataset/bestwallpaper/bestWalpaper.dart';
import 'package:wallpaper/Dataset/category/category.dart';
import 'package:wallpaper/Dataset/colorton/colortone.dart';
import 'package:wallpaper/Dataset/nature/natureui.dart';

class Homepage extends StatefulWidget {
   const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Color(0xffEFF3F4),
      body: Padding(
        padding:  EdgeInsets.only(left: 18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 80,),
            Padding(
              padding:  EdgeInsets.only(right: 18.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: '  Find Wallpaper',
                    suffixIcon: Icon(Icons.search_rounded ,size: 30,),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                  ),
                  focusedBorder:OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),

                  ),
                  // filled: true
                ),
              ),
            ),
            SizedBox(height: 25,),
            Text("Best of the month",style: TextStyle(fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),
            SizedBox(height:260,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
                itemCount: bestWallpapers.length,
                itemBuilder: (context,index){
                  return Container(
                    width: 150,
                    margin: const EdgeInsets.only(right: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(image: NetworkImage(bestWallpapers[index]["img"]),
                      fit: BoxFit.cover)
                    ),
                  );
            }),

            ),
            SizedBox(height: 10,),
            Text("The Color tone",style: TextStyle(fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:colorTone.map((tone){
                  return Container(
                    width: 50,
                    height: 50,
                    margin: EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(

                      color: tone['ColorTone'],
                      borderRadius: BorderRadius.circular(10)
                    ),
                  );
                }).toList(),


              ),
            ),

            SizedBox(height:15 ,),
            Text("Category",style: TextStyle(fontWeight: FontWeight.bold),),
            Expanded(child: GridView.builder(
                itemCount:cateGory.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 16/9
                ),
              itemBuilder: ((_,index){
                return GestureDetector( /// its used in InkWell work for the gridview  its move another widget or new page
                  /// her code are its all container
                onTap: (){
                  print("Tapped on ${cateGory[index]['title']}");
                  String selectedTitle= cateGory[index]['title'];
                 navigateToPage(context, selectedTitle);
                },

                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(image: NetworkImage(cateGory[index]['img']),fit: BoxFit.cover),
                      // image: DecorationImage(image: cateGory[index]['img'],fit: BoxFit.cover),
                    color: cateGory[index]['color'],
                    ),
                    child: Center(child: Text(cateGory[index]['title'],style: TextStyle(
                  fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold
                    ),)),
                  ),
                );
              }),
            ),
            )
          ],
        ),
      ),

      bottomNavigationBar:BottomNavigationBar(
          currentIndex: 0,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.grid_view),label: 'Home'),
            
            BottomNavigationBarItem(icon: Icon(Icons.save),label: 'Saved'),
            BottomNavigationBarItem(icon: Icon(Icons.person),label: 'Profile')
      ])

    );

  }
}

///navigater function

  void navigateToPage(BuildContext context, String title){
  title=title.trim(); ///remove extra space
  if(title == 'Nature'){
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context)=>Natureui()));
  }
  else if(title == 'animal'){
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context)=>Animalui()));
  }
  else if(title == 'Abstract'){
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context)=>Abstractui()));
  }
  else if(title == 'Anime'){
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context)=>Animeui()));
  }
  else if(title == 'Architecher'){
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context)=>ArchitectureUi()));
  }
  else{
    ScaffoldMessenger.of(
        context).showSnackBar(
        SnackBar(content:Text('No page defined for $title'))
    );
  }
}