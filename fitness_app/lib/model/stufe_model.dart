import 'dart:convert';

StufeModel stufeModelFromJson(String str) => StufeModel.fromJson(json.decode(str));

String stufeModelToJson(StufeModel data) => json.encode(data.toJson());

class StufeModel {
    StufeModel({
        this.code,
        this.message,
        this.data,
    });

    String code;
    String message;
    List<ListData> data;

    factory StufeModel.fromJson(Map<String, dynamic> json) => StufeModel(
        code: json["code"],
        message: json["message"],
        data: List<ListData>.from(json["data"].map((x) => ListData.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class ListData {
    ListData({
        this.id,
        this.image,
        this.oriPrice,
        this.presentPrice,
        this.goodsName,
        this.goodsId,
    });

    int id;
    String image;
    double oriPrice;
    double presentPrice;
    String goodsName;
    String goodsId;

    factory ListData.fromJson(Map<String, dynamic> json) => ListData(
        id: json["id"],
        image: json["image"],
        oriPrice: json["oriPrice"].toDouble(),
        presentPrice: json["presentPrice"].toDouble(),
        goodsName: json["goodsName"],
        goodsId: json["goodsId"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "oriPrice": oriPrice,
        "presentPrice": presentPrice,
        "goodsName": goodsName,
        "goodsId": goodsId,
    };
}
