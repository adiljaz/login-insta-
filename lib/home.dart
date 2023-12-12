
import 'package:flutter/material.dart';
import 'package:my_first_app/kooi.dart';
import 'package:my_first_app/login.dart';
import 'package:shared_preferences/shared_preferences.dart';



class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text('home'),
      actions: [

        IconButton(onPressed:  () {


             showDialog(context: context, builder: (ctx1){

  return AlertDialog(title: Text('Logout'),
  content: Text(' are u sure ?'),
  actions: [
    TextButton(onPressed: (){ 

      
        SighnOut(context);
     
      
    }, child: Text('yes')),

    TextButton(onPressed: (){ 



      
      Navigator.of(ctx1).pop();
    }, child: Text('no'))
  ],
  );

});



         

        


        }, icon: Icon(Icons.logout))
      ],
      ),

      
      
       body: SafeArea(
        child: 
        ListView.separated(

          



          
          itemBuilder: (number, index){

           

            if (index % 2==0){

            return ListTile(


              onTap: (){
               Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Kooi(name:'Neymar' )));
              },
             
                

            

            leading:
            
             CircleAvatar(

              
              backgroundImage: AssetImage('images/njr.webp' ),
            ),
            


                  title: Text('Neymar'),

                  subtitle: Text('message $index'),

                  trailing: Text('$index :30 '),

            );
            }else{
                return ListTile(

            

            leading:
            
             ClipRRect(child: Image(image: AssetImage('images/messi.webp',  ),),),
            


                  title: Text('Messi'),

                  subtitle: Text('message $index'),

                  trailing: Text('$index :30 '),

            );

                

                  }

            
            

          }, separatorBuilder: (number, index){
            return Divider(thickness: 2, );
          }, itemCount: 30 )
          
          
          ),

      
    );


  




    
  }


  SighnOut(BuildContext ctx)async{

      final _sharedPrefs=  await SharedPreferences.getInstance();

      await _sharedPrefs.clear();


Navigator.of(ctx).pushAndRemoveUntil(MaterialPageRoute(builder: (ctx1)=> ScreenLogin()), (route) => false);






     // ignore: use_build_context_synchronously
  

  



  }
  


}