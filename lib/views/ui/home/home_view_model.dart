import 'package:homefort_test/core/response_model/photo_model.dart';
import 'package:homefort_test/core/services/locator.dart';
import 'package:homefort_test/core/services/photo_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel{
  final PhotoService _service = serviceLocator<PhotoService>();

  List<PhotoModel> photo = [];
  List<PhotoModel> cachedList = [];
  bool _foundError = false;
  get foundError => _foundError;

  void initState(){
    getPhotos();
    cacheData();
    getCachedData();
  }
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

  void cacheData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    //encode and store
    final String encodeData = PhotoModel.encode(photo);
    await prefs.setString("list", encodeData);
  }
  void getCachedData() async {
    //fetch and encode
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? photoModelString = prefs.getString("list");
    cachedList = PhotoModel.decode(photoModelString!);
    photo = cachedList;
    notifyListeners();
  }



}