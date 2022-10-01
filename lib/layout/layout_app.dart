import 'package:concaty_shop/cubit/cubits/ShopAppCubit.dart';
import 'package:concaty_shop/cubit/states/ShopAppState.dart';
import 'package:concaty_shop/model/model_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class LayoutApp extends StatefulWidget {
  @override
  State<LayoutApp> createState() => _LayoutAppState();
}

class _LayoutAppState extends State<LayoutApp> {
  var boarderController = PageController();
bool theLast =false;
  List<ModelLayout> boarding=
  [
    ModelLayout("assets/shop1.webp", "On Boarder One Title", "On Boarder 1 body"),
    ModelLayout("assets/shop2.webp", "On Boarder Two Title", "On Boarder 2 body"),
    ModelLayout("assets/shop1.webp", "On Boarder One Title", "On Boarder 1 body"),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopAppCubit,ShopAppStates>(
      listener: (context,state){},
      builder: (context,state)
      {
        return  Scaffold(
            appBar: AppBar(
              actions: [
                TextButton(onPressed: ()
                {
                  ShopAppCubit.get(context).submit(context);
                }, child: Text("SKIB",style: TextStyle(color: HexColor("333793")),))
              ],
            ),
            body:Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    itemBuilder: (context,index)=>buildBoarding(boarding[index]),
                    controller: boarderController,
                    physics: BouncingScrollPhysics(),
                    onPageChanged: ( index)
                    {
                      if(index == boarding.length -1)
                        {setState(() {
                          theLast = true;
                        });

                        }else
                        {
                         setState(() {
                           theLast = false;
                         });

                        }
                    },
                    itemCount: boarding.length,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      SmoothPageIndicator(
                        controller: boarderController,
                        count: 3,
                        effect: ExpandingDotsEffect(
                            dotColor: Colors.red,
                            activeDotColor: Colors.blueAccent
                        ),
                      ),
                      Spacer(),
                      FloatingActionButton(onPressed: ()
                      {
                        if(theLast)
                          {
                            ShopAppCubit.get(context).submit(context);
                          }
                        else
                        {
                          boarderController.nextPage(
                              duration: Duration(
                                  milliseconds: 750
                              ),
                              curve: Curves.fastLinearToSlowEaseIn);
                        }
                      },backgroundColor: Colors.red,
                        child: Icon(Icons.arrow_forward_ios ),
                      )

                    ],
                  ),
                )
              ],
            )
        );
      },

    );
  }
}
Widget buildBoarding(ModelLayout model)=>Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Expanded(child: Image.asset("${model.image}",height: 400,fit: BoxFit.cover,)),
    SizedBox(height: 10,),
    Text("${model.title}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
    SizedBox(height: 10,),
    Text("${model.body}",style: TextStyle(fontSize: 15),),

  ],
);