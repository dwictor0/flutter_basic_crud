import 'package:app_flutter/provider.dart';
import 'package:app_flutter/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class UserList extends StatelessWidget {
  const UserList({super.key});
  
  

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = UserProvider.of(context) as UserProvider;
    
    List<User> users = userProvider.users;
    int usersLenght = users.length;


    return Scaffold(
    appBar: AppBar(
    title: Text('User List'),
    leading: BackButton(
      onPressed: () {
        userProvider.indexUser = null;
        Navigator.popAndPushNamed(context, "/create");
      },
    ),
    ),     
    body: ListView.builder(
      itemCount: usersLenght,
      itemBuilder: (BuildContext contextBuilder, indexBuilder) =>
      Container(
        child: ListTile(
        title: Text(users[indexBuilder].name),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
           
            IconButton(
           onPressed: (){
            userProvider.userSelected = users[indexBuilder];
            userProvider.indexUser = indexBuilder;
           Navigator.popAndPushNamed(context, "/create");
           },
           icon: Icon(Icons.edit)
            ),
            
            IconButton(
           onPressed: (){
            userProvider.userSelected = users[indexBuilder];
            userProvider.indexUser = indexBuilder;
           Navigator.popAndPushNamed(context, "/view");
           },
           icon: Icon(Icons.visibility,color: Colors.blue)
            ),
          ],
        ),
        ),
      )
    ),
    );
  }
}
           

            