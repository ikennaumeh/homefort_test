import 'package:homefort_test/core/response_model/photo_model.dart';
import 'package:homefort_test/core/services/locator.dart';
import 'package:homefort_test/core/services/photo_service.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel{
  final PhotoService _service = serviceLocator<PhotoService>();

  List<PhotoModel> photo = [];
  bool _foundError = false;
  get foundError => _foundError;


  void getPhotos() async {
    setBusy(true);
    try{
      List<PhotoModel> _apiResponse = await _service.getPhotos();
      photo = _apiResponse;
      notifyListeners();
      setBusy(false);
    }catch (e){
      _foundError = true;
      notifyListeners();
      setBusy(false);
    }
    setBusy(false);
  }



}