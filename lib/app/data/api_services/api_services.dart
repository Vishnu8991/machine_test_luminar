import 'package:dio/dio.dart';
import 'package:machine_test/app/modules/login/model/login_model.dart';
import 'package:machine_test/app/utils/api_links.dart';
import 'package:retrofit/retrofit.dart';

import '../../modules/home/model/leads_model.dart';
import '../../modules/lead_profile.dart/model/leads_profile_model.dart';
import '../../modules/profile/model/user_profile_model.dart';
part 'api_services.g.dart';

@RestApi(baseUrl: '')
abstract class ApiServices {
  factory ApiServices(Dio dio, {String? baseUrl}) = _ApiServices;

  @POST(ApiLinks.login)
  @FormUrlEncoded()
  Future<LoginResponseModel> login(
    @Field("email") String email,
    @Field("password") String password,
  );

  @GET(ApiLinks.leadList)
  Future<LeadsModel> leadList(
    @Query("search") String search,
    @Query("page") int page,
    @Query("lead_status") String leadStatus,
    @Query("lead_source") String leadSource,
  );

  @GET(ApiLinks.leadDetail)
  Future<LeadsProfileModel> leadProfileList(
    @Path("id") String id,
  );

  @GET(ApiLinks.userProfile)
  Future<UserProfileModel> userProfile();

  @PATCH(ApiLinks.userProfile)
  @FormUrlEncoded()
  Future<UserProfileModel> updateUserProfile(
    @Field("full_name") String fullName,
    @Field("email") String email,
    @Field("phone") String phone,
    @Field("whatsapp_number") String whatsappNumber,
  );
}
