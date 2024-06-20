class ChallengeModel {
  final int? id;
  final String? name;
  final String? timer;
  final String? counter;
  final String? type;
  final String? image;
  final String? secondryImage;
  final String? gif;

  ChallengeModel(
      {required this.id,
      required this.name,
      required this.timer,
      required this.counter,
      required this.type,
      required this.image,
      required this.secondryImage,
      required this.gif});
  factory ChallengeModel.fromJson(json) {
    return ChallengeModel(
        id: json['id'],
        name: json['challenge_name'],
        timer: json['timer'],
        counter: json['challenge_name'],
        type: json['type'],
        image: json['image'],
        gif: json['gif'],
        secondryImage: json['secondry_image']);
  }
}
