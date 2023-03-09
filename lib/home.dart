import 'package:flutter/material.dart';
import 'package:mmama/Landing.dart';
import 'package:mmama/components/MyTextFields.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final unameController = TextEditingController();
  final psdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
      child: SafeArea(
        child: Center(
        child: Column(
          children:  [
            const SizedBox(height: 60,),
          //logo
            Center(child: Image.asset('assets/images/mama_logo.jpeg',width: 150,)),

            const SizedBox(height: 25,),

          //welcome back
          const Text(
            'Street Emergency App',
            style: TextStyle(color: Colors.blueAccent, fontSize: 20, fontWeight: FontWeight.w400),
          ),

            const SizedBox(height: 25,),
          //uname
          MyTextFields(
            controller: unameController,
            hintText: 'Username',
            obscureText: false,
          ),
            const SizedBox(height: 20,),
          //psd
            MyTextFields(
              controller: psdController,
              hintText: 'Password',
              obscureText: true,
            ),

          //4gt psd
            const SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Text(
                    'Forgot Password?',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
            const SizedBox(height: 20,),
          //login btn
          GestureDetector(
            onTap: (){ Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const Landing()));},
            child: Container(
              padding: const EdgeInsets.all(25),
              margin: const EdgeInsets.symmetric(horizontal: 25),
              decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(8)
              ),
              child: const Center(
                child: Text(
                  'Sign In',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 17
                  ),),
              ),
            ),

          ),
            const SizedBox(height: 30,),
          Row(
            children: const [
              Expanded(child:
              Divider(thickness: 0.5,color: Colors.grey,),
              ),
              
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Text('Or Continue With'),
              ),

              Expanded(child:
              Divider(thickness: 0.5,color: Colors.grey,),
              )

            ],
          ),
            const SizedBox(height: 15,),
       Center(
         child: Padding(
           padding: const EdgeInsets.symmetric(horizontal: 30),

           child: Center(

              child: Image.asset('assets/images/google.png', height: 40,),

           ),
         ),
       )

          //google sign

          //not a member register
        ],
      ),
      ),
      ),
    ),
    );
  }
}
