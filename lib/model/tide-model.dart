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
    required this.subComponents,
    required this.flashSaleComponentDetailS,
    required this.showForm,
    required this.commodityList,
    required this.hasNext,
    required this.pageNo,
    required this.title,
  });

  String backGroundUrl;
  int componentType;
  int sort;
  String activityId;
  String couponTemplateId;
  int directingPageType;
  String directingParam;
  int directingTypeCode;
  String pageTitle;
  String planId;
  int urlType;
  List<SubComponent> subComponents;
  List<FlashSaleComponentDetail> flashSaleComponentDetailS;
  int showForm;
  List<CommodityList> commodityList;
  int hasNext;
  int pageNo;
  String title;
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
    required this.shopName,
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

  String alreadySellNumber;
  String attribute;
  List<String> baseTagList;
  String clickUrl;
  String codeId;
  String commentCondition;
  String defaultPicUrl;
  double disCountPrice;
  int exactlySellNumber;
  bool flashSaleStockState;
  int imageHeight;
  int imageWidth;
  int inventoryQuantity;
  int isDiffSize;
  int isDiffTemper;
  int key;
  String limitCount;
  int merchantId;
  int merchantType;
  String name;
  double price;
  List<dynamic> productAdditionList;
  String productBarCode;
  int productId;
  List<dynamic> productSizeList;
  List<dynamic> productTemperList;
  int saleEndTime;
  int saleLimitCount;
  double salePrice;
  int saleStartTime;
  bool saleStockState;
  int saleType;
  ShopName shopName;
  int sizeId;
  String sizeName;
  double skillPrice;
  String skuCode;
  int skuCreateTime;
  bool skuState;
  List<dynamic> specTagList;
  int spikeActivityPrimaryId;
  String spuCode;
  int spuId;
  int startSellResidueTime;
  int temperCode;
  String temperName;
  int userLimitCount;
}

enum ShopName { EMPTY, SHOP_NAME }

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

  List<CommodityList> commodityList;
  int componentType;
  int endTimeCountdown;
  String flashSaleActivityId;
  String flashSaleActivityName;
  String labelName;
  int sort;
  int startTimeCountdown;
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

  String activityId;
  String backGroundUrl;
  int componentType;
  String couponTemplateId;
  int directingPageType;
  String directingParam;
  int directingTypeCode;
  String pageTitle;
  String planId;
  int sort;
  int urlType;
}
