import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_support/providers/improved_in_provider.dart';
import 'package:social_support/models/improved_in.dart';
import './add_improvement_screen.dart';

import '../../../widgets/adaptive_floating_button.dart';
import 'improvement_details_screen.dart';

class ImproveListScreen extends StatelessWidget {
  const ImproveListScreen({Key? key}) : super(key: key);

  static const String screenRoute = "improve-list-screen";

  Widget _buildImprovementCard(BuildContext context, ImprovedIn improvement){
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        title: Text(
          improvement.title,
          style: Theme.of(context).textTheme.headline4,
        ),
        trailing: Icon(Icons.more_horiz),
        onTap: () => Navigator.of(context).pushNamed(ImprovementDetailsScreen.screenRoute, arguments: improvement),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ImprovedInProvider improvedInProvider = Provider.of<ImprovedInProvider>(context);
    return Scaffold(
      floatingActionButton: AdaptiveFloatingButton(onPressed: () {
        Navigator.of(context).pushNamed(AddImprovementScreen.screenRoute);
      }, icon: Icons.add,),
      appBar: AppBar(
        title: Text("השתפרנו ב..."),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 28.h, width: double.infinity,),
              Text(
                "רשימת שיפורים בעקבות 'התחברתי'",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline2,
              ),
              SizedBox(height: 10.h,),
              Text(
                "רשימת שיפורים אישיים וכיתתיים שנבעו מיישום כל חלקי מיזם 'התחברתי'"
                , style: Theme.of(context).textTheme.headline4,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40.h,),
              ...improvedInProvider.items.map((ImprovedIn improvement) => _buildImprovementCard(context, improvement)).toList()
            ],
          ),
        ),
      ),
    );
  }
}
