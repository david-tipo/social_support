import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:social_support/models/personal_solution.dart';
import 'package:social_support/providers/personal_problems.dart';

import '../providers/auth.dart';

class PersonalSolutionItem extends StatefulWidget {
  final PersonalSolution solution;
  bool _isLiked = false;

  PersonalSolutionItem(this.solution);

  @override
  State<PersonalSolutionItem> createState() => _PersonalSolutionItemState();
}

class _PersonalSolutionItemState extends State<PersonalSolutionItem> {
  @override
  Widget build(BuildContext context) {
    // PersonalProblems personalProblems = Provider.of<PersonalProblems>(context);
    Auth auth = Provider.of<Auth>(context);
    String username = auth.username!;
    widget._isLiked = widget.solution.didLike(username);
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        title: Text(
          widget.solution.text,
          style: Theme.of(context).textTheme.headline4,
        ),
        trailing: SizedBox(
          width: 80.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                widget.solution.likes.toString(),
              ),
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
                onPressed: () {
                  // if user want to remove like
                  if (widget._isLiked) {
                    widget.solution.removeLike(username);
                    setState(() {
                      widget._isLiked = false;
                    });
                    return;
                  }
                  widget.solution.addLike(username);

                  setState(() {
                    widget._isLiked = true;
                  });
                  print("added like!");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
