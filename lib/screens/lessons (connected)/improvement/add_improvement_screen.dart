import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:social_support/models/improved_in.dart';

import '../../../providers/auth.dart';
import '../../../providers/improved_in_provider.dart';

class AddImprovementScreen extends StatelessWidget {

  static const String screenRoute = "/add-improvement-screen";

  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  String _title = "";
  String _body = "";

  String? _myValidator(String? value) {
    if (value == null || value.isEmpty){
      return "אנא הזן ערך";
    }
    if (value.length < 5){
      return "ערך קצר מדי, אנא פרט/י יותר";
    }
  }

  void _submitForm(BuildContext context) {
    bool isValid = _form.currentState!.validate();
    if (!isValid){
      return;
    }
    _form.currentState!.save();
    ImprovedInProvider improvedInProvider = Provider.of<ImprovedInProvider>(context, listen: false);
    Auth auth = Provider.of<Auth>(context, listen: false);

    ImprovedIn newImprovement = ImprovedIn(title: _title, username: auth.username!, details: _body);
    improvedInProvider.addItem(newImprovement);
    print("added improvement!");
    Navigator.of(context).pop();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("השיפור האישי נוסף בהצלחה!")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("הוספת שיפור אישי"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 35.w),
        child: Form(
          key: _form,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 28.h, width: double.infinity,),
                Text("במה השתפרנו בזכות שיעורי 'התחברתי'?", style: Theme.of(context).textTheme.headline2, textAlign: TextAlign.center,),
                SizedBox(height: 40.h),
                Text(
                  "כותרת:",
                  style: Theme.of(context).textTheme.headline3,
                ),
                SizedBox(height: 10.h),
                TextFormField(
                  maxLength: 100,
                  validator: _myValidator,
                  onSaved: (String? value) {
                    _title = value!.trim();
                  },
                ),
                SizedBox(height: 42.h),
                Text(
                  "תוכן השיפור:",
                  style: Theme.of(context).textTheme.headline3,
                ),
                SizedBox(height: 10.h),
                TextFormField(
                  maxLines: 5,
                  maxLength: 300,
                  validator: _myValidator,
                  onSaved: (String? value) {
                    _body = value!.trim();
                  },
                ),
                SizedBox(height: 50.h),
                ElevatedButton(onPressed: () => _submitForm(context), child: Text("שליחה"))
                ,SizedBox(height: 20.h),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
