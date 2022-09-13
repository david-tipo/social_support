class StudentReport {

  int enterAmount;
  List<String> mostUsedProblems;
  List<String> mostUsedTips;
  int weekRate;

  StudentReport(
  {
    required this.enterAmount,
    required this.mostUsedProblems,
    required this.mostUsedTips,
    required this.weekRate,
}
      );

  /// returns String of the most used problems together
  String get stringProblems {
    String str = "";
    for (String problem in mostUsedProblems){
      str += problem + ", ";
    }
    // substring to get rid of the , in the end
    return str.trim().substring(0, str.length - 2);
  }

  /// returns String of the most used tips together
  String get stringTips {
    String str = "";
    for (String problem in mostUsedTips){
      str += problem + ", ";
    }
    return str.trim().substring(0, str.length - 2);
  }

}