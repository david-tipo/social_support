import 'package:social_support/models/personal_solution.dart';

class PersonalProblem {

  final String id;
  final String title;
  final String details;
  List<PersonalSolution> solutions = [];

  PersonalProblem({
    required this.id,
    required this.title,
    required this.details,
    List<PersonalSolution>? solutions,
}){
    if (solutions != null){
      this.solutions = solutions;
    }
  }

  /// gets PersonalSolution solution and adds it to the problem
  void addSolution(PersonalSolution solution) {
    solutions.add(solution);
  }


}