import 'package:celenote_app/database/dummy.dart';
import 'package:celenote_app/database/models/my_wedding/my_wedding_model.dart';

class MyWeddingRepository {
  MyWeddingRepository();

  List<MyWeddingModel> readMyWedding() {
    return Dummy.dummyMyWedding;
  }
}
