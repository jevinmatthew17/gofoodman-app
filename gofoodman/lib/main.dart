import 'package:flutter/material.dart';
import 'package:gofoodman/screens/profilescreen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: ProfileScreen(),
            body:Center(
              child: FutureBuilder{
                future: _checkLoginState(),
              builder:(context.snapshot){
                  if(snapshot.hasError)
                    return Text('${snapshot.error}');
                  else if(snapshot.hasData)
                    {
                      var user = snapshot.data as FirebaseAuth.User;
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children:[
                          snapshot.hasData
                              ? Text('logged in user is : ${user.phoneNumber ?? ''}')
                              : Text('Tap below button to Login'),
                    Container(
                      margin: const EdgeInsects.only(top:10,bottom: 10),
                      child: RaisedButton(child: Text(snapshot.hasData ? 'Logout' : 'Login'),
                      onPressed: _processLogin,),
                    )
                        ]
                      );
                    }
                  else
                    return CircularProgressIndicator();
            }
            }
            )
          );

  }
}

