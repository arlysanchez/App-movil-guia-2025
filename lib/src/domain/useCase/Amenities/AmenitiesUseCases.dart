import 'package:myfirstlove/src/domain/useCase/Amenities/DeleteAmenitiesUseCase.dart';
import 'package:myfirstlove/src/domain/useCase/Amenities/GetAmenitiesUseCase.dart';

class AmenitiesUseCases {
  GetAmenitiesUseCase getAmenities;
  DeleteAmenitiesUseCase deleteAmenities;

  AmenitiesUseCases(
    {
      required this.getAmenities,
      required this.deleteAmenities
      }
    );

}