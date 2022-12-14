import 'package:animate_do/animate_do.dart';
import 'package:concaty_shop/modules/login/register_screen/signupscreen.dart';
import 'package:flutter/material.dart';

class RigisterButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return FadeInDown(
      delay: Duration(
        milliseconds: 3000
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("New To Logistic ?",style: TextStyle(
              fontSize: 20,
              color: Colors.grey[500]
          ),),
          TextButton(onPressed: ()
          {
            // Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpScreen()));
          }, child: Text("Rigister",style: TextStyle(
            fontSize: 20,
          )))
        ],
      ),
    );
  }
}
