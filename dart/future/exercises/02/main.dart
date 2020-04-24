import 'dart:math';

void main() {
  print('Loading profile data...');
  print(generateProfileData());
}

String generateProfileData() {
  var profile = randomProfileData();
  return 'Profile data: $profile';
}

String randomProfileData() {
  final random = new Random();
  final name = names[random.nextInt(names.length)];
  final lastName = lastNames[random.nextInt(lastNames.length)];

  return "$name $lastName";
}

List<String> names = ["Bob", "Michael", "Margaret", "Tom", "Olivia"];
List<String> lastNames = ["Smith", "Jones", "Brown", "Williams", "Taylor"];
