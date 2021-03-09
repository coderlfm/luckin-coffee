// To parse this JSON data, do
//
//     final tideModel = tideModelFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<TideModel> tideModelFromMap(List<dynamic> str) => List<TideModel>.from(str.map((x) => TideModel.fromMap(x)));

String tideModelToMap(List<TideModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class TideModel {
  TideModel({
    required this.backGroundUrl,
    required this.componentType,
    required this.sort,
    required this.activityId,
    required this.couponTemplateId,
    required this.directingPageType,
    required this.directingParam,
    required this.directingTypeCode,
    required this.pageTitle,
    required this.planId,
    required this.urlType,
    this.subComponents,
    this.flashSaleComponentDetailS,
    required this.showForm,
    this.commodityList,
    required this.hasNext,
    required this.pageNo,
    required this.title,
  });

  final String backGroundUrl;
  final int componentType;
  final int sort;
  final String activityId;
  final String couponTemplateId;
  final int directingPageType;
  final String directingParam;
  final int directingTypeCode;
  final String pageTitle;
  final String planId;
  final int urlType;
  final List<SubComponent>? subComponents;
  final List<FlashSaleComponentDetail>? flashSaleComponentDetailS;
  final int showForm;
  final List<CommodityList>? commodityList;
  final int hasNext;
  final int pageNo;
  final String title;

  factory TideModel.fromMap(Map<String, dynamic> json) => TideModel(
        backGroundUrl: json["backGroundUrl"] == null ? null : json["backGroundUrl"],
        componentType: json["componentType"] == null ? null : json["componentType"],
        sort: json["sort"] == null ? null : json["sort"],
        activityId: json["activityId"] == null ? null : json["activityId"],
        couponTemplateId: json["couponTemplateId"] == null ? null : json["couponTemplateId"],
        directingPageType: json["directingPageType"] == null ? null : json["directingPageType"],
        directingParam: json["directingParam"] == null ? null : json["directingParam"],
        directingTypeCode: json["directingTypeCode"] == null ? null : json["directingTypeCode"],
        pageTitle: json["pageTitle"] == null ? null : json["pageTitle"],
        planId: json["planId"] == null ? null : json["planId"],
        urlType: json["urlType"] == null ? null : json["urlType"],
        subComponents: json["subComponents"] == null ? null : List<SubComponent>.from(json["subComponents"].map((x) => SubComponent.fromMap(x))),
        flashSaleComponentDetailS: json["flashSaleComponentDetailS"] == null ? null : List<FlashSaleComponentDetail>.from(json["flashSaleComponentDetailS"].map((x) => FlashSaleComponentDetail.fromMap(x))),
        showForm: json["showForm"] == null ? null : json["showForm"],
        commodityList: json["commodityList"] == null ? null : List<CommodityList>.from(json["commodityList"].map((x) => CommodityList.fromMap(x))),
        hasNext: json["hasNext"] == null ? null : json["hasNext"],
        pageNo: json["pageNo"] == null ? null : json["pageNo"],
        title: json["title"] == null ? null : json["title"],
      );

  Map<String, dynamic> toMap() => {
        "backGroundUrl": backGroundUrl == null ? null : backGroundUrl,
        "componentType": componentType == null ? null : componentType,
        "sort": sort == null ? null : sort,
        "activityId": activityId == null ? null : activityId,
        "couponTemplateId": couponTemplateId == null ? null : couponTemplateId,
        "directingPageType": directingPageType == null ? null : directingPageType,
        "directingParam": directingParam == null ? null : directingParam,
        "directingTypeCode": directingTypeCode == null ? null : directingTypeCode,
        "pageTitle": pageTitle == null ? null : pageTitle,
        "planId": planId == null ? null : planId,
        "urlType": urlType == null ? null : urlType,
        "subComponents": subComponents == null ? null : List<dynamic>.from(subComponents!.map((x) => x.toMap())),
        "flashSaleComponentDetailS": flashSaleComponentDetailS == null ? null : List<dynamic>.from(flashSaleComponentDetailS!.map((x) => x.toMap())),
        "showForm": showForm == null ? null : showForm,
        "commodityList": commodityList == null ? null : List<dynamic>.from(commodityList!.map((x) => x.toMap())),
        "hasNext": hasNext == null ? null : hasNext,
        "pageNo": pageNo == null ? null : pageNo,
        "title": title == null ? null : title,
      };
}

class CommodityList {
  CommodityList({
    required this.alreadySellNumber,
    required this.attribute,
    required this.baseTagList,
    required this.clickUrl,
    required this.codeId,
    required this.commentCondition,
    required this.defaultPicUrl,
    required this.disCountPrice,
    required this.exactlySellNumber,
    required this.flashSaleStockState,
    required this.imageHeight,
    required this.imageWidth,
    required this.inventoryQuantity,
    required this.isDiffSize,
    required this.isDiffTemper,
    required this.key,
    required this.limitCount,
    required this.merchantId,
    required this.merchantType,
    required this.name,
    required this.price,
    required this.productAdditionList,
    required this.productBarCode,
    required this.productId,
    required this.productSizeList,
    required this.productTemperList,
    required this.saleEndTime,
    required this.saleLimitCount,
    required this.salePrice,
    required this.saleStartTime,
    required this.saleStockState,
    required this.saleType,
    this.shopName,
    required this.sizeId,
    required this.sizeName,
    required this.skillPrice,
    required this.skuCode,
    required this.skuCreateTime,
    required this.skuState,
    required this.specTagList,
    required this.spikeActivityPrimaryId,
    required this.spuCode,
    required this.spuId,
    required this.startSellResidueTime,
    required this.temperCode,
    required this.temperName,
    required this.userLimitCount,
  });

  final String alreadySellNumber;
  final String attribute;
  final List<BaseTagList> baseTagList;
  final String clickUrl;
  final String codeId;
  final String commentCondition;
  final String defaultPicUrl;
  final double disCountPrice;
  final int exactlySellNumber;
  final bool flashSaleStockState;
  final int imageHeight;
  final int imageWidth;
  final int inventoryQuantity;
  final int isDiffSize;
  final int isDiffTemper;
  final int key;
  final String limitCount;
  final int merchantId;
  final int merchantType;
  final String name;
  final double price;
  final List<dynamic> productAdditionList;
  final String productBarCode;
  final int productId;
  final List<dynamic> productSizeList;
  final List<dynamic> productTemperList;
  final int saleEndTime;
  final int saleLimitCount;
  final double salePrice;
  final int saleStartTime;
  final bool saleStockState;
  final int saleType;
  final ShopName? shopName;
  final int sizeId;
  final String sizeName;
  final double skillPrice;
  final String skuCode;
  final int skuCreateTime;
  final bool skuState;
  final List<dynamic> specTagList;
  final int spikeActivityPrimaryId;
  final String spuCode;
  final int spuId;
  final int startSellResidueTime;
  final int temperCode;
  final String temperName;
  final int userLimitCount;

  factory CommodityList.fromMap(Map<String, dynamic> json) => CommodityList(
        alreadySellNumber: json["alreadySellNumber"],
        attribute: json["attribute"],
        baseTagList: List<BaseTagList>.from(json["baseTagList"].map((x) => baseTagListValues.map[x])),
        clickUrl: json["clickUrl"],
        codeId: json["codeId"],
        commentCondition: json["commentCondition"],
        defaultPicUrl: json["defaultPicUrl"],
        disCountPrice: json["disCountPrice"].toDouble(),
        exactlySellNumber: json["exactlySellNumber"],
        flashSaleStockState: json["flashSaleStockState"],
        imageHeight: json["imageHeight"],
        imageWidth: json["imageWidth"],
        inventoryQuantity: json["inventoryQuantity"],
        isDiffSize: json["isDiffSize"],
        isDiffTemper: json["isDiffTemper"],
        key: json["key"],
        limitCount: json["limitCount"],
        merchantId: json["merchantId"],
        merchantType: json["merchantType"],
        name: json["name"],
        price: json["price"].toDouble(),
        productAdditionList: List<dynamic>.from(json["productAdditionList"].map((x) => x)),
        productBarCode: json["productBarCode"],
        productId: json["productId"],
        productSizeList: List<dynamic>.from(json["productSizeList"].map((x) => x)),
        productTemperList: List<dynamic>.from(json["productTemperList"].map((x) => x)),
        saleEndTime: json["saleEndTime"],
        saleLimitCount: json["saleLimitCount"],
        salePrice: json["salePrice"].toDouble(),
        saleStartTime: json["saleStartTime"],
        saleStockState: json["saleStockState"],
        saleType: json["saleType"],
        shopName: shopNameValues.map[json["shopName"]],
        sizeId: json["sizeId"],
        sizeName: json["sizeName"],
        skillPrice: json["skillPrice"].toDouble(),
        skuCode: json["skuCode"],
        skuCreateTime: json["skuCreateTime"] == null ? null : json["skuCreateTime"],
        skuState: json["skuState"],
        specTagList: List<dynamic>.from(json["specTagList"].map((x) => x)),
        spikeActivityPrimaryId: json["spikeActivityPrimaryId"],
        spuCode: json["spuCode"],
        spuId: json["spuId"],
        startSellResidueTime: json["startSellResidueTime"],
        temperCode: json["temperCode"],
        temperName: json["temperName"],
        userLimitCount: json["userLimitCount"],
      );

  Map<String, dynamic> toMap() => {
        "alreadySellNumber": alreadySellNumber,
        "attribute": attribute,
        "baseTagList": List<dynamic>.from(baseTagList.map((x) => baseTagListValues.reverse[x])),
        "clickUrl": clickUrl,
        "codeId": codeId,
        "commentCondition": commentCondition,
        "defaultPicUrl": defaultPicUrl,
        "disCountPrice": disCountPrice,
        "exactlySellNumber": exactlySellNumber,
        "flashSaleStockState": flashSaleStockState,
        "imageHeight": imageHeight,
        "imageWidth": imageWidth,
        "inventoryQuantity": inventoryQuantity,
        "isDiffSize": isDiffSize,
        "isDiffTemper": isDiffTemper,
        "key": key,
        "limitCount": limitCount,
        "merchantId": merchantId,
        "merchantType": merchantType,
        "name": name,
        "price": price,
        "productAdditionList": List<dynamic>.from(productAdditionList.map((x) => x)),
        "productBarCode": productBarCode,
        "productId": productId,
        "productSizeList": List<dynamic>.from(productSizeList.map((x) => x)),
        "productTemperList": List<dynamic>.from(productTemperList.map((x) => x)),
        "saleEndTime": saleEndTime,
        "saleLimitCount": saleLimitCount,
        "salePrice": salePrice,
        "saleStartTime": saleStartTime,
        "saleStockState": saleStockState,
        "saleType": saleType,
        "shopName": shopNameValues.reverse[shopName],
        "sizeId": sizeId,
        "sizeName": sizeName,
        "skillPrice": skillPrice,
        "skuCode": skuCode,
        "skuCreateTime": skuCreateTime == null ? null : skuCreateTime,
        "skuState": skuState,
        "specTagList": List<dynamic>.from(specTagList.map((x) => x)),
        "spikeActivityPrimaryId": spikeActivityPrimaryId,
        "spuCode": spuCode,
        "spuId": spuId,
        "startSellResidueTime": startSellResidueTime,
        "temperCode": temperCode,
        "temperName": temperName,
        "userLimitCount": userLimitCount,
      };
}

enum BaseTagList { EMPTY, BASE_TAG_LIST, PURPLE }

final baseTagListValues = EnumValues({"满减": BaseTagList.BASE_TAG_LIST, "满折": BaseTagList.EMPTY, "赠品": BaseTagList.PURPLE});

enum ShopName { EMPTY, SHOP_NAME, PURPLE }

final shopNameValues = EnumValues({"": ShopName.EMPTY, "茶里": ShopName.PURPLE, "瑞幸自营": ShopName.SHOP_NAME});

class FlashSaleComponentDetail {
  FlashSaleComponentDetail({
    required this.commodityList,
    required this.componentType,
    required this.endTimeCountdown,
    required this.flashSaleActivityId,
    required this.flashSaleActivityName,
    required this.labelName,
    required this.sort,
    required this.startTimeCountdown,
  });

  final List<CommodityList> commodityList;
  final int componentType;
  final int endTimeCountdown;
  final String flashSaleActivityId;
  final String flashSaleActivityName;
  final String labelName;
  final int sort;
  final int startTimeCountdown;

  factory FlashSaleComponentDetail.fromMap(Map<String, dynamic> json) => FlashSaleComponentDetail(
        commodityList: List<CommodityList>.from(json["commodityList"].map((x) => CommodityList.fromMap(x))),
        componentType: json["componentType"],
        endTimeCountdown: json["endTimeCountdown"],
        flashSaleActivityId: json["flashSaleActivityId"],
        flashSaleActivityName: json["flashSaleActivityName"],
        labelName: json["labelName"],
        sort: json["sort"],
        startTimeCountdown: json["startTimeCountdown"],
      );

  Map<String, dynamic> toMap() => {
        "commodityList": List<dynamic>.from(commodityList.map((x) => x.toMap())),
        "componentType": componentType,
        "endTimeCountdown": endTimeCountdown,
        "flashSaleActivityId": flashSaleActivityId,
        "flashSaleActivityName": flashSaleActivityName,
        "labelName": labelName,
        "sort": sort,
        "startTimeCountdown": startTimeCountdown,
      };
}

class SubComponent {
  SubComponent({
    required this.activityId,
    required this.backGroundUrl,
    required this.componentType,
    required this.couponTemplateId,
    required this.directingPageType,
    required this.directingParam,
    required this.directingTypeCode,
    required this.pageTitle,
    required this.planId,
    required this.sort,
    required this.urlType,
  });

  final String activityId;
  final String backGroundUrl;
  final int componentType;
  final String couponTemplateId;
  final int directingPageType;
  final String directingParam;
  final int directingTypeCode;
  final String pageTitle;
  final String planId;
  final int sort;
  final int urlType;

  factory SubComponent.fromMap(Map<String, dynamic> json) => SubComponent(
        activityId: json["activityId"],
        backGroundUrl: json["backGroundUrl"],
        componentType: json["componentType"],
        couponTemplateId: json["couponTemplateId"],
        directingPageType: json["directingPageType"],
        directingParam: json["directingParam"],
        directingTypeCode: json["directingTypeCode"],
        pageTitle: json["pageTitle"],
        planId: json["planId"],
        sort: json["sort"],
        urlType: json["urlType"],
      );

  Map<String, dynamic> toMap() => {
        "activityId": activityId,
        "backGroundUrl": backGroundUrl,
        "componentType": componentType,
        "couponTemplateId": couponTemplateId,
        "directingPageType": directingPageType,
        "directingParam": directingParam,
        "directingTypeCode": directingTypeCode,
        "pageTitle": pageTitle,
        "planId": planId,
        "sort": sort,
        "urlType": urlType,
      };
}

class EnumValues<T> {
  late Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
