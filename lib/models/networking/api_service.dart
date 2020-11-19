import 'package:chopper/chopper.dart';
import 'package:news_feed/models/model/news_model.dart';

part 'api_service.chopper.dart';

@ChopperApi()
abstract class ApiService extends ChopperService {
  static const BASE_URL = "http://newsapi.org/v2";
  static const API_KEY = "";

  static ApiService create() {
    final client = ChopperClient(
      baseUrl: BASE_URL,
      services: [
        _$ApiService()
      ],
      converter: JsonConverter(),
    );
    return _$ApiService(client);
  }

  @Get(path: "/top-headlines")
  Future<Response> getHeadLines({@Query("country") String country = "jp",
    @Query("pageSize") int pageSize = 10,
    @Query("apiKey") String apiKey = ApiService.API_KEY});

  @Get(path: "/top-headlines")
  Future<Response> getKeywordNews({
    @Query("country") String country = "jp",
    @Query("pageSize") int pageSize = 30,
    @Query("q") String keyword,
    @Query("apiKey") String apiKey = ApiService.API_KEY
  });

  @Get(path: "/top-headlines")
  Future<Response> getCategoryNews({
    @Query("country") String country = "jp",
    @Query("pageSize") int pageSize = 30,
    @Query("category") String category,
    @Query("apiKey") String apiKey = ApiService.API_KEY
  });
}

