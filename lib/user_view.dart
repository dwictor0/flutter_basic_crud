import 'package:app_flutter/field_form.dart';
import 'package:app_flutter/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'provider.dart';



class UserView extends StatelessWidget{
  UserView({super.key});
  String title = "Show User";
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  
  @override
  Widget build(BuildContext context) {


  UserProvider userProvider = UserProvider.of(context) as UserProvider;
  int? index;
  if(userProvider.indexUser != null){
    index = userProvider.indexUser;
    controllerName.text = userProvider.userSelected!.name;
    controllerPassword.text = userProvider.userSelected!.password;
  }
   
  
   

    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      actions:[
        Container(
          child: TextButton(
          child: Text('User List'),
          onPressed: (){
          Navigator.popAndPushNamed(context, "/list");
          }
       ),
       decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.all(Radius.circular(8))
       ),
       margin: EdgeInsets.all(15),
      ),
      ],


        ),
      
      body: Center(
        child: Column(
          children: [
            FieldForm(label: 'Name', 
            isPassword: false, 
            controller: controllerName,
            isForm: false,
            ),
            
            FieldForm(
            label: 'Password', 
            isPassword: false, 
            controller: controllerPassword,
            isForm: false,
            ),
          SizedBox(
          width: double.infinity,
          child: TextButton(
            onPressed: (){
           Navigator.popAndPushNamed(context, "/create");
            },
            child: Text('Edit'),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Theme.of(context).primaryColor),
              foregroundColor: MaterialStateProperty.all(Colors.white),
      
      
            ),
          ),
          ),
          SizedBox(
          width: double.infinity,
          child: TextButton(
            onPressed: (){
            userProvider.indexUser = null;
            userProvider.users.removeAt(index!);
           Navigator.popAndPushNamed(context, "/create");
            },
            child: Text('Delete'),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.red),
              foregroundColor: MaterialStateProperty.all(Colors.white),
      
      
            ),
          ),
          ),
          ],
        ),
      ),
    );
  }
}