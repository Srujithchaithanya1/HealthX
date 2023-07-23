import 'package:flutter/material.dart';

List<String> items = [];

class GridShow extends StatelessWidget
{
  
  static void clearAll()
  {
    items=[];
  }
  
  @override
  Widget build(BuildContext context) {
    
    return IconsGrid();
  }

}

class IconsGrid extends StatefulWidget{
  @override
  IconsGridState createState()=> IconsGridState();
}
class IconsGridState extends State<IconsGrid> {
  final List<IconData> icons = [
    
    
      Icons.travel_explore,
      Icons.phone_android_sharp,
      Icons.sports_gymnastics,
      Icons.local_movies,
      Icons.food_bank,
      Icons.music_note,
      Icons.bed,
      Icons.games,
      Icons.child_care,
      Icons.temple_hindu,
      Icons.tv,
      Icons.work
  ];
  final List<String> iconsNames = [
    
      "travel",
      "mobile",
      "sports",
      "movies",
      "Tasty Food",
      "music",
      "sleep",
      "games",
      "kids",
      "temple",
      "tv",
      "work"

  ];


  late List<Color> iconColors;
  
  @override
  void initState() {
    super.initState();
    iconColors = List.generate(icons.length, (index) => Color.fromARGB(255, 255, 255, 255));
  }

  void _onIconTapped(int index) {
    setState(() {
      if (iconColors[index] == Color.fromARGB(255, 255, 255, 255)) {
        iconColors[index] = Colors.black;
        // MaterialIcons.getIconName(icon.codePoint)
        // items.add(icons[index].codePoint.toString());
        items.add(iconsNames[index]);
      } else {
        iconColors[index] = Color.fromARGB(255, 255, 255, 255);
        items.remove(iconsNames[index]);
      }
    });
  }

  Widget _buildIconGrid() {
    return Container(
      decoration: const BoxDecoration(
                color: Color.fromARGB(222, 5, 238, 168),
                borderRadius:BorderRadius.vertical(bottom: Radius.circular(20),top: Radius.circular(20)) ),
    
      width: 300,
      child: GridView.builder(
        
        itemCount: icons.length,
        scrollDirection: Axis.horizontal,

        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //For Customizing Layout 
          crossAxisCount: 3,
        ),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            
            onTap: () {
              _onIconTapped(index);
            },
            child: Column(
              children: [
                SizedBox(height: 20,),
                Icon(
                  
                  icons[index],
                  color: iconColors[index],
                  size: 50.0,
                ),
                Text(iconsNames[index],style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),)
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Center(
        child: _buildIconGrid(),
      ),
    );
  }
  static List<String> getActivites()
  {
      return items;
  }
}
