// To parse this JSON data, do
//
//     final menuModel = menuModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<MenuModel> menuModelFromJson(List<dynamic> productsRes) => List<MenuModel>.from(productsRes.map((x) => MenuModel.fromJson(x)));

String menuModelToJson(List<MenuModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MenuModel {
  MenuModel({
    required this.kindIconDisplay,
    required this.isPreviewStatus,
    required this.sortId,
    required this.kindDesc,
    required this.kindName,
    required this.twoProductList,
    required this.iconUrl,
    required this.isTimeDiscount,
    required this.kindId,
    this.timeDiscountInfo,
    required this.isPackage,
    this.advertisingInfo,
    this.bannerInfoMap,
    required this.kindBanner,
  });

  int kindIconDisplay;
  int isPreviewStatus;
  int sortId;
  String kindDesc;
  String kindName;
  List<TwoProductList> twoProductList;
  String iconUrl;
  int isTimeDiscount;
  String kindId;
  TimeDiscountInfo? timeDiscountInfo;
  int isPackage;
  AdvertisingInfo? advertisingInfo;
  BannerInfoMap? bannerInfoMap;
  String kindBanner;

  factory MenuModel.fromJson(Map<String, dynamic> json) => MenuModel(
        kindIconDisplay: json["kindIconDisplay"],
        isPreviewStatus: json["isPreviewStatus"],
        sortId: json["sortId"],
        kindDesc: json["kindDesc"],
        kindName: json["kindName"],
        twoProductList: List<TwoProductList>.from(json["twoProductList"].map((x) => TwoProductList.fromJson(x))),
        iconUrl: json["iconUrl"],
        isTimeDiscount: json["isTimeDiscount"],
        kindId: json["kindId"],
        timeDiscountInfo: json["timeDiscountInfo"] == null ? null : TimeDiscountInfo.fromJson(json["timeDiscountInfo"]),
        isPackage: json["isPackage"] == null ? null : json["isPackage"],
        advertisingInfo: json["advertisingInfo"] == null ? null : AdvertisingInfo.fromJson(json["advertisingInfo"]),
        bannerInfoMap: json["bannerInfoMap"] == null ? null : BannerInfoMap.fromJson(json["bannerInfoMap"]),
        kindBanner: json["kindBanner"] == null ? null : json["kindBanner"],
      );

  Map<String, dynamic> toJson() => {
        "kindIconDisplay": kindIconDisplay,
        "isPreviewStatus": isPreviewStatus,
        "sortId": sortId,
        "kindDesc": kindDesc,
        "kindName": kindName,
        "twoProductList": List<dynamic>.from(twoProductList.map((x) => x.toJson())),
        "iconUrl": iconUrl,
        "isTimeDiscount": isTimeDiscount,
        "kindId": kindId,
        "timeDiscountInfo": timeDiscountInfo == null ? null : timeDiscountInfo?.toJson(),
        "isPackage": isPackage == null ? null : isPackage,
        "advertisingInfo": advertisingInfo == null ? null : advertisingInfo?.toJson(),
        "bannerInfoMap": bannerInfoMap == null ? null : bannerInfoMap?.toJson(),
        "kindBanner": kindBanner == null ? null : kindBanner,
      };
}

class AdvertisingInfo {
  AdvertisingInfo({
    required this.sourceUrl,
    required this.needLogin,
    required this.needAuth,
  });

  String sourceUrl;
  int needLogin;
  int needAuth;

  factory AdvertisingInfo.fromJson(Map<String, dynamic> json) => AdvertisingInfo(
        sourceUrl: json["sourceUrl"],
        needLogin: json["needLogin"],
        needAuth: json["needAuth"],
      );

  Map<String, dynamic> toJson() => {
        "sourceUrl": sourceUrl,
        "needLogin": needLogin,
        "needAuth": needAuth,
      };
}

class BannerInfoMap {
  BannerInfoMap({
    required this.isLogin,
    required this.commodityLabel,
    required this.link,
    required this.isWechatAuthorized,
    required this.picture,
  });

  String isLogin;
  String commodityLabel;
  String link;
  String isWechatAuthorized;
  String picture;

  factory BannerInfoMap.fromJson(Map<String, dynamic> json) => BannerInfoMap(
        isLogin: json["isLogin"],
        commodityLabel: json["commodityLabel"],
        link: json["link"],
        isWechatAuthorized: json["isWechatAuthorized"],
        picture: json["picture"],
      );

  Map<String, dynamic> toJson() => {
        "isLogin": isLogin,
        "commodityLabel": commodityLabel,
        "link": link,
        "isWechatAuthorized": isWechatAuthorized,
        "picture": picture,
      };
}

class TimeDiscountInfo {
  TimeDiscountInfo({
    required this.bgColor,
    required this.nameColor,
    required this.name,
  });

  String bgColor;
  String nameColor;
  String name;

  factory TimeDiscountInfo.fromJson(Map<String, dynamic> json) => TimeDiscountInfo(
        bgColor: json["bgColor"],
        nameColor: json["nameColor"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "bgColor": bgColor,
        "nameColor": nameColor,
        "name": name,
      };
}

class TwoProductList {
  TwoProductList({
    required this.sortId,
    required this.twoKindName,
    required this.productList,
    required this.kindDesc,
    required this.twoKindId,
  });

  int sortId;
  String twoKindName;
  List<ProductList> productList;
  String kindDesc;
  String twoKindId;

  factory TwoProductList.fromJson(Map<String, dynamic> json) => TwoProductList(
        sortId: json["sortId"] == null ? null : json["sortId"],
        twoKindName: json["twoKindName"],
        productList: List<ProductList>.from(json["productList"].map((x) => ProductList.fromJson(x))),
        kindDesc: json["kindDesc"] == null ? null : json["kindDesc"],
        twoKindId: json["twoKindId"] == null ? null : json["twoKindId"],
      );

  Map<String, dynamic> toJson() => {
        "sortId": sortId == null ? null : sortId,
        "twoKindName": twoKindName,
        "productList": List<dynamic>.from(productList.map((x) => x.toJson())),
        "kindDesc": kindDesc == null ? null : kindDesc,
        "twoKindId": twoKindId == null ? null : twoKindId,
      };
}

class ProductList {
  ProductList({
    required this.firstOrderFlag,
    required this.discountPrice,
    required this.mode,
    required this.skuName,
    required this.supportSend,
    required this.sortId,
    required this.coffeeLabel,
    required this.commodityCode,
    required this.enName,
    required this.maxAmount,
    required this.multiSku,
    required this.productType,
    required this.inventoryType,
    required this.promotionMsg,
    required this.productId,
    required this.initialPrice,
    required this.whiteBackgroundUrl,
    required this.defaultPicUrl,
    required this.tagList,
    required this.eatway,
    required this.unit,
    required this.isHaveStorageStock,
    required this.name,
    required this.globalSortId,
    required this.multiProcessType,
    required this.promotionOrder,
    required this.skuCode,
    required this.promotion,
    required this.desc,
    required this.label,
    required this.detailDesc,
    required this.priceDesc,
    required this.stockSurplusAmount,
  });

  int firstOrderFlag;
  double discountPrice;
  int mode;
  String skuName;
  int supportSend;
  int sortId;
  CoffeeLabel? coffeeLabel;
  String commodityCode;
  String enName;
  int maxAmount;
  int multiSku;
  int productType;
  int inventoryType;
  CoffeeLabel? promotionMsg;
  String productId;
  double initialPrice;
  String whiteBackgroundUrl;
  String defaultPicUrl;
  List<TagList>? tagList;
  Eatway? eatway;
  Unit? unit;
  int isHaveStorageStock;
  String name;
  int globalSortId;
  int multiProcessType;
  int promotionOrder;
  String skuCode;
  int promotion;
  String desc;
  String label;
  String detailDesc;
  String priceDesc;
  int stockSurplusAmount;

  factory ProductList.fromJson(Map<String, dynamic> json) => ProductList(
        firstOrderFlag: json["firstOrderFlag"] == null ? null : json["firstOrderFlag"],
        discountPrice: json["discountPrice"] == null ? null : json["discountPrice"].toDouble(),
        mode: json["mode"] == null ? null : json["mode"],
        skuName: json["skuName"] == null ? null : json["skuName"],
        supportSend: json["supportSend"] == null ? null : json["supportSend"],
        sortId: json["sortId"] == null ? null : json["sortId"],
        coffeeLabel: json["coffeeLabel"] == null ? null : coffeeLabelValues.map[json["coffeeLabel"]],
        commodityCode: json["commodityCode"] == null ? null : json["commodityCode"],
        enName: json["enName"] == null ? null : json["enName"],
        maxAmount: json["maxAmount"] == null ? null : json["maxAmount"],
        multiSku: json["multiSku"] == null ? null : json["multiSku"],
        productType: json["productType"] == null ? null : json["productType"],
        inventoryType: json["inventoryType"] == null ? null : json["inventoryType"],
        promotionMsg: json["promotionMsg"] == null ? null : coffeeLabelValues.map[json["promotionMsg"]],
        productId: json["productId"] == null ? null : json["productId"],
        initialPrice: json["initialPrice"] == null ? null : json["initialPrice"].toDouble(),
        whiteBackgroundUrl: json["whiteBackgroundUrl"] == null ? null : json["whiteBackgroundUrl"],
        defaultPicUrl: json["defaultPicUrl"] == null ? null : json["defaultPicUrl"],
        tagList: json["tagList"] == null ? null : List<TagList>.from(json["tagList"].map((x) => TagList.fromJson(x))),
        eatway: json["eatway"] == null ? null : eatwayValues.map[json["eatway"]],
        unit: json["unit"] == null ? null : unitValues.map[json["unit"]],
        isHaveStorageStock: json["isHaveStorageStock"] == null ? null : json["isHaveStorageStock"],
        name: json["name"] == null ? null : json["name"],
        globalSortId: json["globalSortId"] == null ? null : json["globalSortId"],
        multiProcessType: json["multiProcessType"] == null ? null : json["multiProcessType"],
        promotionOrder: json["promotionOrder"] == null ? null : json["promotionOrder"],
        skuCode: json["skuCode"] == null ? null : json["skuCode"],
        promotion: json["promotion"] == null ? null : json["promotion"],
        desc: json["desc"] == null ? null : json["desc"],
        label: json["label"] == null ? null : json["label"],
        detailDesc: json["detailDesc"] == null ? null : json["detailDesc"],
        priceDesc: json["priceDesc"] == null ? null : json["priceDesc"],
        stockSurplusAmount: json["stockSurplusAmount"] == null ? null : json["stockSurplusAmount"],
      );

  Map<String, dynamic> toJson() => {
        "firstOrderFlag": firstOrderFlag == null ? null : firstOrderFlag,
        "discountPrice": discountPrice == null ? null : discountPrice,
        "mode": mode == null ? null : mode,
        "skuName": skuName == null ? null : skuName,
        "supportSend": supportSend == null ? null : supportSend,
        "sortId": sortId == null ? null : sortId,
        "coffeeLabel": coffeeLabel == null ? null : coffeeLabelValues.reverse[coffeeLabel],
        "commodityCode": commodityCode == null ? null : commodityCode,
        "enName": enName == null ? null : enName,
        "maxAmount": maxAmount == null ? null : maxAmount,
        "multiSku": multiSku == null ? null : multiSku,
        "productType": productType == null ? null : productType,
        "inventoryType": inventoryType == null ? null : inventoryType,
        "promotionMsg": promotionMsg == null ? null : coffeeLabelValues.reverse[promotionMsg],
        "productId": productId == null ? null : productId,
        "initialPrice": initialPrice == null ? null : initialPrice,
        "whiteBackgroundUrl": whiteBackgroundUrl == null ? null : whiteBackgroundUrl,
        "defaultPicUrl": defaultPicUrl == null ? null : defaultPicUrl,
        "tagList": tagList == null ? null : List<dynamic>.from(tagList!.map((x) => x.toJson())),
        "eatway": eatway == null ? null : eatwayValues.reverse[eatway],
        "unit": unit == null ? null : unitValues.reverse[unit],
        "isHaveStorageStock": isHaveStorageStock == null ? null : isHaveStorageStock,
        "name": name == null ? null : name,
        "globalSortId": globalSortId == null ? null : globalSortId,
        "multiProcessType": multiProcessType == null ? null : multiProcessType,
        "promotionOrder": promotionOrder == null ? null : promotionOrder,
        "skuCode": skuCode == null ? null : skuCode,
        "promotion": promotion == null ? null : promotion,
        "desc": desc == null ? null : desc,
        "label": label == null ? null : label,
        "detailDesc": detailDesc == null ? null : detailDesc,
        "priceDesc": priceDesc == null ? null : priceDesc,
        "stockSurplusAmount": stockSurplusAmount == null ? null : stockSurplusAmount,
      };
}

enum CoffeeLabel { THE_43 }

final coffeeLabelValues = EnumValues({"充4赠3": CoffeeLabel.THE_43});

enum Eatway { BOTH }

final eatwayValues = EnumValues({"both": Eatway.BOTH});

class TagList {
  TagList({
    required this.bgColor,
    required this.content,
    required this.pictureHeight,
    required this.pictureUrl,
    required this.pictureWidth,
  });

  String bgColor;
  String content;
  int pictureHeight;
  String pictureUrl;
  int pictureWidth;

  factory TagList.fromJson(Map<String, dynamic> json) => TagList(
        bgColor: json["bgColor"] == null ? null : json["bgColor"],
        content: json["content"] == null ? null : json["content"],
        pictureHeight: json["pictureHeight"] == null ? null : json["pictureHeight"],
        pictureUrl: json["pictureUrl"] == null ? null : json["pictureUrl"],
        pictureWidth: json["pictureWidth"] == null ? null : json["pictureWidth"],
      );

  Map<String, dynamic> toJson() => {
        "bgColor": bgColor,
        "content": content == null ? null : content,
        "pictureHeight": pictureHeight == null ? null : pictureHeight,
        "pictureUrl": pictureUrl == null ? null : pictureUrl,
        "pictureWidth": pictureWidth == null ? null : pictureWidth,
      };
}

enum Unit { EMPTY, UNIT, PURPLE, FLUFFY }

final unitValues = EnumValues({"杯": Unit.EMPTY, "瓶": Unit.FLUFFY, "袋": Unit.PURPLE, "个": Unit.UNIT});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
