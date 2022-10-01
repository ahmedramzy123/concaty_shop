import 'package:concaty_shop/layout/layout_screen.dart';
import 'package:concaty_shop/modules/login/cubit/cubits/cubit.dart';
import 'package:concaty_shop/modules/login/cubit/states/states.dart';
import 'package:concaty_shop/modules/login/login_screen/loginmodel/emailaddress.dart';
import 'package:concaty_shop/modules/login/login_screen/loginmodel/login_button.dart';
import 'package:concaty_shop/modules/login/login_screen/loginmodel/password.dart';
import 'package:concaty_shop/modules/login/login_screen/loginmodel/rigister_button.dart';
import 'package:concaty_shop/modules/login/login_screen/loginmodel/text%20forget.dart';
import 'package:concaty_shop/modules/login/login_screen/loginmodel/textLogin.dart';
import 'package:concaty_shop/modules/login/login_screen/loginmodel/topimage.dart';
import 'package:concaty_shop/shared/network/sharedprefrance/sharedprafrence.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';


class LoginScreen extends StatelessWidget {
var keyform =GlobalKey<FormState>();
TextEditingController email =TextEditingController();
TextEditingController password =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>LoginCubit(),
      child: BlocConsumer<LoginCubit,LoginStates>(
        listener: (context, state)
        {
          if(state is LoginSuccessState)
            {
             if(state.model.status!)
               {
                 Fluttertoast.showToast(
                     msg: "${state.model.message}",
                     toastLength: Toast.LENGTH_SHORT,
                     gravity: ToastGravity.BOTTOM,
                     timeInSecForIosWeb: 2,
                     backgroundColor: Colors.green,
                     textColor: Colors.white,
                     fontSize: 16.0
                 );
                 CatchHelper.saveData(key: "token", value: state.model.data!.token).then((value)
                 {
                   Navigator.pushAndRemoveUntil
                     (context, MaterialPageRoute(builder: (context)=>LayoutScreen()), (route) => false);
                 });
               }
             else
             {
               Fluttertoast.showToast(
                   msg: "${state.model.message}",
                   toastLength: Toast.LENGTH_SHORT,
                   gravity: ToastGravity.BOTTOM,
                   timeInSecForIosWeb: 2,
                   backgroundColor: Colors.red,
                   textColor: Colors.white,
                   fontSize: 16.0
               );
             }
            }
        },
        builder:  (context, state) {
          return  GestureDetector(
            onTap: ()=>FocusManager.instance.primaryFocus?.unfocus(),
            child: Scaffold(
              body: SingleChildScrollView(
                child: Form(
                  key: keyform,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 30,),
                      topimage(),
                      SizedBox(height: 10,),
                      TextLogin(),
                      SizedBox(height: 10,),
                      EmailAddress(prefixIcon: Icons.email_outlined,text: "Login ID", emailaddress: email,),
                      PasswordLogin(text: "Password", prefixIcon: Icons.lock, sucsesIcon: LoginCubit.get(context).suffix, password: password, method: ()
                      {
                        LoginCubit.get(context).changeObscure();
                      }, secure: LoginCubit.get(context).obscure,),
                      SizedBox(height: 10,),
                      TextForget(),
                      LoginButton(function: ()
                      {
                        LoginCubit.get(context).userLogin(email: email.text, password: password.text);
                      },),
                      SizedBox(height: 10,),
                      RigisterButton()








                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
