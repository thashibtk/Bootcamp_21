import 'package:bootcamp_sample/model/photos_model.dart';
import 'package:dio/dio.dart';
import 'package:bootcamp_sample/env/keys.dart' as config;

class PhotosAPI {
  Future<List<PhotosModel>> fetchPhotos() async {
    BaseOptions options = new BaseOptions(
      followRedirects: false,
      validateStatus: (status) => true,
    );
    try {
      final _dioInstance = Dio(options);

      _dioInstance.options.headers['Authorization'] =
          "Client-ID ${config.unsplashKey}";

      final _fetchData =
          await _dioInstance.get('https://api.unsplash.com/photos');

      final List<PhotosModel> _photosData = [];

      for (var _items in _fetchData.data) {
        _photosData.add(
            PhotosModel(id: _items['id'], imgURL: _items['urls']['regular']));
      }
      return _photosData;
    } catch (e) {
      throw (e);
    }
  }
}
