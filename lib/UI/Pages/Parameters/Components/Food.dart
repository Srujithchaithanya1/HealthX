import 'package:flutter/material.dart';
List<String> _tags=[];
class Food extends StatelessWidget
{
  static void clearAll()
  {
     _tags=[];
  }
  @override
  Widget build(BuildContext context) {
    
    return InputTags();
  }

}
class InputTags extends StatefulWidget
{
  State <InputTags> createState()=>InputTagsState();

}

class InputTagsState extends State<InputTags> {
  final food=TextEditingController();
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        decoration:
          const BoxDecoration(
            color: Color.fromARGB(222, 5, 238, 168),
            borderRadius:BorderRadius.vertical(bottom: Radius.circular(20),top: Radius.circular(20)) ),
        
        child: Column(
          children: [
            SizedBox(height: 20,),
            SizedBox(
              width: 200,
              child: TextField(
                controller:food , 
                
                decoration:  
                  const InputDecoration( 
                  contentPadding: EdgeInsets.symmetric(vertical: 18.0,horizontal: 30),           
                  border: OutlineInputBorder(),
                  labelText:'Food'),
                
                onSubmitted:(value) {
                  food.clear();
                  setState(() {
                    _tags.add(value);
                  });
                },
           ),
            ),

            Container(
              
              child: Expanded(
              
                child: 
                ListView.builder(
                  scrollDirection:Axis.horizontal,
                  itemCount: _tags.length,
                  itemBuilder: (BuildContext context,int index){
                    return Row(
                      children: [

                        Chip(
                          
                        backgroundColor: Color.fromARGB(255, 162, 236, 212),
                        label: Text(_tags[index]),
                        onDeleted: (() {
                          setState(() {
                            _tags.removeAt(index);
                          });
                        }),
                        ),
                        SizedBox(width: 2,)
                      ],
                    );
                  },
                                 
                  )
              ),
            )


          ],
        ),
      ),
    );
  }
  static List<String> getFood()
  {
    return _tags;
  }
  
}
