
class ProductModel {
  final dynamic id;
  final dynamic name;
  final dynamic desc;
  final dynamic brand;
  final String price;
  final dynamic stock;
  final dynamic image;
  final dynamic weight;
  final dynamic measuringUnit;
  final dynamic protein;
  final dynamic creatine;
  final dynamic salesCount;
  final dynamic viewCount;
  final dynamic expiredDate;
   dynamic isFavorite;
  dynamic count = 0;
  final List<ColorsModel> colors;
  final List<SizeModel> sizes;

  ProductModel(
      {required this.id,
      required this.name,
      required this.desc,
      required this.brand,
      required this.price,
      required this.stock,
      required this.image,
      required this.weight,
      required this.measuringUnit,
      required this.protein,
      required this.creatine,
      required this.salesCount,
      required this.viewCount,
      required this.expiredDate,
      required this.isFavorite,
      required this.colors,
      required this.sizes});

  factory ProductModel.fromJson(var json) {
    List<ColorsModel> tempColor = [];
    if (json['colors'] != null) {
      json['colors'].forEach((v) {
        tempColor.add(ColorsModel.fromJson(v));
      });
    }
    List<SizeModel> tempSizes = [];
    if (json['sizes'] != null) {
      json['sizes'].forEach((v) {
        tempSizes.add(SizeModel.fromJson(v));
      });
    }

    return ProductModel(
      id: json['id'].toString(),
      name: json['name'],
      desc: json['description'].toString(),
      brand: json['brand'].toString(),
      price: json['price'].toString(),
      stock: json['stock'].toString(),
      image: json['image'].toString(),
      weight: ['weight'].toString(),
      measuringUnit: ['measuring_unit'].toString(),
      protein: json['protein'].toString(),
      creatine: json['creatine'].toString(),
      salesCount: ['sales_count'].toString(),
      viewCount: json['view_count'].toString(),
      expiredDate: json['expiration_date'].toString(),
      isFavorite: json['isfavorite'],
      colors: tempColor,
      sizes: tempSizes,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProductModel && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}

class ColorsModel {
  final dynamic id;
  final dynamic color;

  ColorsModel({required this.id, required this.color});

  factory ColorsModel.fromJson(var json) {
    return ColorsModel(
        id: json['id'].toString(), color: json['color'].toString());
  }
}

class SizeModel {
  final dynamic id;
  final dynamic size;

  SizeModel({required this.id, required this.size});

  factory SizeModel.fromJson(var json) {
    return SizeModel(id: json['id'].toString(), size: json['size'].toString());
  }
}
