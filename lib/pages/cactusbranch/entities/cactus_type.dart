import 'dart:core';

import 'package:cactus_app/values/images.dart';
import 'package:cactus_app/values/strings.dart';

enum CactusType { BUNNY_EARS, CHIN_CACTUS, SAGUARO, OLD_LADY, STAR_CACTUS, EASTER, CHRISTMAS, MOON, BARREL_CACTUS }

const Map<CactusType, String> cactusTxt = {
  CactusType.BUNNY_EARS: StringUtils.cactusTypeBunnyEars,
  CactusType.CHIN_CACTUS: StringUtils.cactusTypeChinCactus,
  CactusType.SAGUARO: StringUtils.cactusTypeSaguaro,
  CactusType.OLD_LADY: StringUtils.cactusTypeOldLady,
  CactusType.STAR_CACTUS: StringUtils.cactusTypeStarCactus,
  CactusType.EASTER: StringUtils.cactusTypeEaster,
  CactusType.CHRISTMAS: StringUtils.cactusTypeChristmas,
  CactusType.MOON: StringUtils.cactusTypeMoon,
  CactusType.BARREL_CACTUS: StringUtils.cactusTypeBarrelCactus,
};

const Map<CactusType, String> cactusImg = {
  CactusType.BUNNY_EARS: ImageUtils.icCactusTypeBunnyEars,
  CactusType.CHIN_CACTUS: ImageUtils.icCactusTypeChinCactus,
  CactusType.SAGUARO: ImageUtils.icCactusTypeSaguaro,
  CactusType.OLD_LADY: ImageUtils.icCactusTypeOldLady,
  CactusType.STAR_CACTUS: ImageUtils.icCactusTypeStarCactus,
  CactusType.EASTER: ImageUtils.icCactusTypeEaster,
  CactusType.CHRISTMAS: ImageUtils.icCactusTypeChristmas,
  CactusType.MOON: ImageUtils.icCactusTypeMoon,
  CactusType.BARREL_CACTUS: ImageUtils.icCactusTypeBarrelCactus,
};
