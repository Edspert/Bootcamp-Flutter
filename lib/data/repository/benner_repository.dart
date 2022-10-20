import 'package:flutter/foundation.dart';

import '../../core/values/urls.dart';
import '../model/banner_response.dart';

import '../services/dio_client.dart';

abstract class BannerRepository {
  Future<List<BannerData>> getBanners({int? limit});
}

class BannerRepositoryImpl implements BannerRepository {
  final DioClient dioClient;

  BannerRepositoryImpl(this.dioClient);

  @override
  Future<List<BannerData>> getBanners({int? limit}) async {
    try {
      Map<String, dynamic>? queryParams;
      if (limit != null) {
        queryParams = {"limit": limit};
      }
      final result = await dioClient.get(Urls.banners, queryParameters: queryParams);

      BannerResponse res = BannerResponse.fromJson(result);
      return res.data ?? [];
    } catch (e, stackTrace) {
      if (kDebugMode) {
        print('Err getBanners: $e, $stackTrace');
      }
      return [];
    }
  }
}
