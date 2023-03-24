import 'package:chopper/chopper.dart';
import 'recipe_model.dart';
import 'model_response.dart';
import 'model_converter.dart';

// 2
const String apiKey = '41e2556d975c885b8b6f41643ebc4ef0	';
const String apiId = '0fa9d527';
// 3
const String apiUrl = 'https://api.edamam.com';

@ChopperApi()
abstract class RecipeService extends ChopperService {
  @Get(path: 'search')
  Future<Response<Result<APIRecipeQuery>>> queryRecipes(
      @Query('q') String query, @Query('from') int from, @Query('to') int to);
// TODO: Add create()
}
// TODO: Add _addQuery()
