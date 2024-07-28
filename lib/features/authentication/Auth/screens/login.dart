 import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:ma3ak_app/utils/constants/colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState>_key = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool _obsecurePassword =true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 25.h,),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                RichText(textAlign: TextAlign.start, text:TextSpan(
                  text: ' \n مرحبا بك',
                  style: TextStyle(fontSize: 36,fontWeight: FontWeight.bold,color: AppColors.black)
                )),
              ],
            ),
            SizedBox(height: 50.h,),
            Form(key: _key, child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
              children:[
                TextFormField(
                  validator: validationEmail,
                  controller: emailController,
                  decoration: InputDecoration(
                   enabledBorder: OutlineInputBorder(
                     borderRadius: BorderRadius.all(Radius.circular(10),),
                     borderSide: BorderSide(color: Color(0xff626262)),

                   ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10),),
                        borderSide: BorderSide(color: Color(0xff626262)),),

                      fillColor:Color(0xffffffff),
                    filled: true,
                    hintText: ' الايميل او رقم الهاتف',
                    hintStyle: TextStyle(color: Color(0xff676767)),
                  ),

                ),
                SizedBox(height: 40,),
                TextFormField(
                  validator: ValidationPassword,
                  controller: passwordController,
                  obscureText: _obsecurePassword,
                  decoration: InputDecoration(
                    suffixIcon: GestureDetector(
                      onTap: (){
                        setState(() {
                          _obsecurePassword =! _obsecurePassword;
                        });
                      },
                      child: Icon(_obsecurePassword ? Icons.visibility : Icons.visibility_off,color: Color(0xff626262),),
                    ),

                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10),),
                      borderSide: BorderSide(color: Color(0xff626262)),

                    ),
                      focusedBorder:OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10),),
                        borderSide: BorderSide(color: Color(0xff626262)),),
                    fillColor:Color(0xffffffff),
                    filled: true,
                    hintText: 'كلمة السر',
                    hintStyle: TextStyle(color: Color(0xff676767))),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: (){
                      // navigate to resetpassword
                    }, child: Text('نسيت كلمة السر؟',style: TextStyle(color: Colors.red,fontSize:12.sp),),
                  ),
                ),
                SizedBox(height: 40.h,),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  margin: EdgeInsets.symmetric(horizontal: 5,
                ),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(8)

                  ),
                  child: Center(child: Text('تسجيل الدخول',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20.sp,color: Colors.white),),),


                ),
              SizedBox(height: 80.h,),],

            ))

            // Add your widgets here
          ],
        ),
      ),
    );
  }


}
String? validationEmail(String? formEmail){
 if(formEmail == null || formEmail.isEmpty) {
   return 'ادخال الايميل مطلوب';}
 String pattern =r'\w+@\w+\.\w';
 RegExp regExp = RegExp(pattern);
 if(!regExp.hasMatch(formEmail)) return 'هذا الايميل غير متاح';
}
String? ValidationPassword(String? formPassword){
  if(formPassword == null || formPassword.isEmpty) {
    return 'يرجي ادخال الباسوورد';}

}