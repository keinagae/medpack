

Map<String,String> parseErrors(Map<String,dynamic> errors){
  Map<String,String> parsedErrors={};
  errors.keys.forEach((element) {
    final errorList =errors[element] as List<dynamic>;
    if(errorList.isNotEmpty){
      parsedErrors[element]=errorList[0].toString();
    }
  });
  return parsedErrors;
}