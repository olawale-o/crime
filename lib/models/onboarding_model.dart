import 'package:faker/faker.dart';

final faker = Faker();

class OnboardingModel {
  final String image;
  final String title;
  final String desc;
  const OnboardingModel({ required this.image, required this.title, required this.desc });
}

List<OnboardingModel> onboarding = [
  OnboardingModel(
      image: 'assets/location.png',
      title: faker.lorem.word(),
      desc: faker.lorem.sentence()
  ),
  OnboardingModel(
      image: 'assets/map.png',
      title: faker.lorem.word(),
      desc: faker.lorem.sentence(),
  ),
  OnboardingModel(
      image: 'assets/tracking.png',
      title: faker.lorem.word(),
      desc: faker.lorem.sentence(),
  ),
];