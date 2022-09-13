import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:social_support/models/main_tip.dart';
import 'package:social_support/providers/custom_problems.dart';

import '../providers/auth.dart';

class CustomTipItem extends StatefulWidget {
  final MainTip tip;
  final String problemID;
  bool _isLiked;

  CustomTipItem(this.tip, this.problemID, this._isLiked);

  @override
  State<CustomTipItem> createState() => _CustomTipItemState();
}

class _CustomTipItemState extends State<CustomTipItem> {

  @override
  Widget build(BuildContext context) {
    CustomProblems problems = Provider.of<CustomProblems>(context);
    Auth auth = Provider.of<Auth>(context);
    String username = auth.username!;
    widget._isLiked = widget.tip.didLike(username);
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      //random color
      child: ListTile(
        title: Text(widget.tip.text),
        trailing: SizedBox(
          width: 80.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(widget.tip.likes.toString(),),
              IconButton(
                icon: widget._isLiked
                    ? Icon(
                  Icons.thumb_up,
                  color: Theme.of(context).primaryColor,
                  size: 20.h,
                )
                    : Icon(
                  Icons.thumb_up_alt_outlined,
                  size: 20.h,
                ),
                // TODO: add likes count
                onPressed: () {
                  // if user want to remove like
                  if (widget._isLiked){
                    problems.removeLike(widget.problemID, widget.tip.id, username);
                    setState(() {
                      widget._isLiked = false;
                    });
                    return;
                  }
                  problems.addLike(widget.problemID, widget.tip.id, username);
                  setState(() {
                    widget._isLiked = true;
                  });
                  print("added like!");
                },
              ),

            ],
          ),
        ),
        // TODO: make fixed height (padding maybe) and set text style
      ),
    );
  }
}
