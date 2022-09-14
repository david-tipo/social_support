import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_support/models/take_for_life.dart';
import 'package:social_support/providers/takes_for_life_provider.dart';
import 'package:provider/provider.dart';
import './take_details_screen.dart';
import '../../../widgets/adaptive_floating_button.dart';
import 'add_take_screen.dart';
class TakesListScreen extends StatelessWidget {
  const TakesListScreen({Key? key}) : super(key: key);

  static const String screenRoute = "/takes-list-screen";

  Widget _buildImprovementCard(BuildContext context, TakeForLife take){
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        title: Text(
          take.title,
          style: Theme.of(context).textTheme.headline4,
        ),
        trailing: Icon(Icons.more_horiz),
        onTap: () => Navigator.of(context).pushNamed(TakeDetailsScreen.screenRoute, arguments: take),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    TakesForLifeProvider takesForLifeProvider = Provider.of<TakesForLifeProvider>(context);
    return Scaffold(
      floatingActionButton: AdaptiveFloatingButton(onPressed: () {
        Navigator.of(context).pushNamed(AddTakeScreen.screenRoute);
      }, icon: Icons.add,),
      appBar: AppBar(
        title: Text("לקחתי איתי"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 28.h, width: double.infinity,),
              Text(
                "דברים חיוביים שלקחתי איתי",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline2,
              ),
              SizedBox(height: 10.h,),
              Text(
                "רשימת ערכים או דברים חיוביים שתלמידים לקחו איתם בחיי היומיום מאז שנחשפו ל'התחברתי'"
                , style: Theme.of(context).textTheme.headline4,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40.h,),
              ...takesForLifeProvider.items.map((TakeForLife take) => _buildImprovementCard(context, take)).toList()
            ],
          ),
        ),
      ),
    );
  }
}
