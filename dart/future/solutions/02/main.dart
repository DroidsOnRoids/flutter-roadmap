import 'dart:math';

Future<void> main() async {
  print('Loading profile data...');
  print(await generateProfileData());
}

Future<String> generateProfileData() async {
  var profile = await randomProfileData();
  return 'Profile data: $profile';
}

Future<String> randomProfileData() => Future.delayed(
      Duration(seconds: 2),
      () {
        final random = new Random();
        final name = names[random.nextInt(names.length)];
        final lastName = lastNames[random.nextInt(lastNames.length)];

        return "$name $lastName";
      },
    );

List<String> names = ["Bob", "Michael", "Margaret", "Tom", "Olivia"];
List<String> lastNames = ["Smith", "Jones", "Brown", "Williams", "Taylor"];
