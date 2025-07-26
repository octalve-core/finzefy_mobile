extension StringExtensions on String{

String capitalizeFirstLetter() {
final capitalized =  this[0].toUpperCase() + substring(1);

  return capitalized ;
}

}