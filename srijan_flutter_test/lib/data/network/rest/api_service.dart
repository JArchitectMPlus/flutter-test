import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:srijan_flutter_test/data/entity/quotes_detail_response_entity.dart';
import 'package:srijan_flutter_test/data/entity/quotes_response_entity.dart';
import 'package:srijan_flutter_test/domain/model/quotes/quotes_response.dart';

part 'api_service.g.dart';

///flutter pub run build_runner build
@RestApi()
abstract class ApiService {
  factory ApiService(Dio dio, {String? baseUrl}) {
    return _ApiService(dio, baseUrl: baseUrl);
  }

  @GET("/quotes/random")
  Future<HttpResponse<List<QuotesResponseEntity>>> getQuotes(@Query("limit") int limit);

  @GET("/quotes/{:id}")
  Future<HttpResponse<QuotesDetailResponseEntity>> getQuoteDetails(@Path(":id") String id);
}
