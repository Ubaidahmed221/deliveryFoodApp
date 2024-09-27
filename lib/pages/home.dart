import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/widget/widget_support.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  bool icecream  = false, pizza = false, salad = false, burger = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          margin: EdgeInsets.only(top: 20.0,left: 20.0, right: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Hello Dear,", style: AppWidget.boldTextFeildStyle(),),
                  Container(
                    padding: EdgeInsets.all(3),
              decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(8)),
              child: Icon(Icons.shopping_cart, color: Colors.white),
            ),
              ],
            ),
            SizedBox(height: 20.0,),  
             Text("Delicious Food,", style: AppWidget.HeadLineTextFeildStyle(),),
           Text("Discover and Get Great Food,", style: AppWidget.LightTextFeildStyle()),
           SizedBox(height: 20.0,),
          showItem(),
          SizedBox(height: 30.0,),
          Row(children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Image.asset("images/salad2.png", height: 150, width: 150, fit: BoxFit.cover,),
                Text("Veggie Taco Hash", style: AppWidget.SemiBoldTextFeildStyle(),),
                SizedBox(height: 5.0,),
                   Text("Fresh And Healthy", style: AppWidget.LightTextFeildStyle(),),
                    SizedBox(height: 5.0,),
                   Text("\$25", style: AppWidget.SemiBoldTextFeildStyle(),)
              ],),
            )
          ],)
          ],
        ),
      ),
    );
  }
  Widget showItem(){
    return  Row(
            mainAxisAlignment:  MainAxisAlignment.spaceBetween,
            children: [
            GestureDetector(
              onTap: (){
                icecream = true;
                pizza = false;
                 salad = false;
                  burger = false;
                  setState(() {
                    
                  });
              },
              child: Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  decoration: BoxDecoration(color: icecream?Colors.black: Colors.white, borderRadius: BorderRadius.circular(10)),
                  padding: EdgeInsets.all(8),
                  child: Image.asset("images/ice-cream.png", height: 40, width: 40, fit: BoxFit.cover,color: icecream? Colors.white: Colors.black,),
                ),
              ),
            ),
             GestureDetector(
              onTap: (){
                icecream = false;
                pizza = true;
                 salad = false;
                  burger = false;
                  setState(() {
                    
                  });
              },
              child: Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  decoration: BoxDecoration(color: pizza?Colors.black: Colors.white, borderRadius: BorderRadius.circular(10)),
                  padding: EdgeInsets.all(8),
                  child: Image.asset("images/pizza.png", height: 40, width: 40, fit: BoxFit.cover,color: pizza? Colors.white: Colors.black,),
                ),
              ),
            ),
             GestureDetector(
              onTap: (){
                icecream = false;
                pizza = false;
                 salad = true;
                  burger = false;
                  setState(() {
                    
                  });
              },
              child: Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  decoration: BoxDecoration(color: salad?Colors.black: Colors.white, borderRadius: BorderRadius.circular(10)),
                  padding: EdgeInsets.all(8),
                  child: Image.asset("images/salad.png", height: 40, width: 40, fit: BoxFit.cover,color: salad? Colors.white: Colors.black,),
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                icecream = false;
                pizza = false;
                 salad = false;
                  burger = true;
                  setState(() {
                    
                  });
              },
              child: Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  decoration: BoxDecoration(color: burger?Colors.black: Colors.white, borderRadius: BorderRadius.circular(10)),
                  padding: EdgeInsets.all(8),
                  child: Image.asset("images/burger.png", height: 40, width: 40, fit: BoxFit.cover,color: burger? Colors.white: Colors.black,),
                ),
              ),
            ),

           ],);
  }
}