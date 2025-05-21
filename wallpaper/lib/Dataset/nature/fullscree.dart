import 'package:flutter/material.dart';
class FullscreeNature extends StatelessWidget {
  final String imageUrl;

  const FullscreeNature({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
    children: [
      ///image full screen
    Positioned.fill(
        child: Image.network(
          imageUrl,fit: BoxFit.cover,)
    ),
      ///Bottom Icon row
      Positioned(
        bottom: 20,
        left: 0,
        right: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildIconButtom(Icons.info,'info'),
            buildIconButtom(Icons.save_alt , "Save"),
            buildIconButtom(Icons.wallpaper,  "Apply")
          ],
        ),
      )

    ],
    )
    );
  }
  Widget buildIconButtom(IconData icon,String label){
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.4),
        borderRadius: BorderRadius.circular(12)
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon,color: Colors.white,),
          const SizedBox(height: 4,),Text(label,style:TextStyle(color: Colors.white,fontSize: 12),)
        ],
      ),
    );
  }
}
