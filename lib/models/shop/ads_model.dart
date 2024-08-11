class AdsModel {
  final num id;
  final String image;

  AdsModel({required this.id, required this.image});
  factory AdsModel.fromJson(json) {
    return AdsModel(id: json['id'], image: json['image']);
  }
}
