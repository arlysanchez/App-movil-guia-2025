import 'package:myfirstlove/src/data/dataSource/remote/service/AmenitiesService.dart';
import 'package:myfirstlove/src/domain/models/Amenities.dart';
import 'package:myfirstlove/src/domain/repository/AmenitiesRepository.dart';
import 'package:myfirstlove/src/domain/utils/Resource.dart';

class AmenitiesRepositoryimpl implements AmenitiesRepository {
  final AmenitiesService amenitiesService;

  AmenitiesRepositoryimpl(this.amenitiesService);

  @override
  Future<Resource<Amenities>> create(Amenities amenities) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future<Resource<bool>> delete(int id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<Resource<List<Amenities>>> getAmenities() {
    return amenitiesService.getAmenities();
  }

  @override
  Future<Resource<Amenities>> update(int id, Amenities amenities) {
    // TODO: implement update
    throw UnimplementedError();
  }
  

}