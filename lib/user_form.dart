import 'package:app_flutter/field_form.dart';
import 'package:app_flutter/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'provider.dart';

class UserForm extends StatefulWidget {
  const UserForm({super.key});

  @override
  State<UserForm> createState() => _UserFormState();

}

class _UserFormState extends State<UserForm> {
  String title = "Create User";
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
    setState(() {
      this.title = "Edit User";
    });
    
  }
   void save(){


   User user = User(

    name: controllerName.text,
    password: controllerPassword.text
   );
  if (index != null) {
    userProvider.users[index] = user;
  }else{

   int usersLength = userProvider.users.length;
   userProvider.users.insert(usersLength,user);
  }
   
   

   print(userProvider.users[0].name);
   Navigator.popAndPushNamed(context,"/list"); 
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
            controller: controllerName
            ),
            
            FieldForm(
            label: 'Password', 
            isPassword: true, 
            controller: controllerPassword
            ),
          SizedBox(
          width: double.infinity,
          child: TextButton(
            onPressed: save,
            child: Text('Salvar'),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Theme.of(context).primaryColor),
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