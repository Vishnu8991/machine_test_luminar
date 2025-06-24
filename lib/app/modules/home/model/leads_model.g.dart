// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leads_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LeadsModel _$LeadsModelFromJson(Map<String, dynamic> json) => LeadsModel(
      count: (json['count'] as num?)?.toInt(),
      next: json['next'] as String?,
      previous: json['previous'],
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => Result.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LeadsModelToJson(LeadsModel instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      id: json['id'] as String?,
      leadStatusDetails: json['lead_status_details'] == null
          ? null
          : LeadStatusDetails.fromJson(
              json['lead_status_details'] as Map<String, dynamic>),
      leadSourceDetails: json['lead_source_details'] == null
          ? null
          : LeadSourceDetails.fromJson(
              json['lead_source_details'] as Map<String, dynamic>),
      usedFacebookFormDetails: json['used_facebook_form_details'] == null
          ? null
          : UsedFacebookFormDetails.fromJson(
              json['used_facebook_form_details'] as Map<String, dynamic>),
      counselorDetails: json['counselor_details'] == null
          ? null
          : CounselorDetails.fromJson(
              json['counselor_details'] as Map<String, dynamic>),
      websiteFormDetails: json['website_form_details'] == null
          ? null
          : WebsiteFormDetails.fromJson(
              json['website_form_details'] as Map<String, dynamic>),
      qualificationDetails: json['qualification_details'],
      preferredLocationDetails: json['preferred_location_details'],
      courseDetails: json['course_details'],
      courseModeDetails: json['course_mode_details'],
      followupCount: (json['followup_count'] as num?)?.toInt(),
      pendingFollowups: (json['pending_followups'] as num?)?.toInt(),
      completedFollowups: (json['completed_followups'] as num?)?.toInt(),
      lastFollowup: json['last_followup'],
      nextFollowup: json['next_followup'],
      name: json['name'] as String?,
      phoneNumber: json['phone_number'] as String?,
      whatsappNumber: json['whatsapp_number'],
      email: json['email'] as String?,
      city: json['city'] as String?,
      reminderDate: json['reminder_date'],
      isArchived: json['is_archived'] as bool?,
      parentName: json['parent_name'] as String?,
      parentPhoneNumber: json['parent_phone_number'],
      leadgenId: json['leadgen_id'] as String?,
      passOutYear: (json['pass_out_year'] as num?)?.toInt(),
      college: json['college'] as String?,
      address: json['address'] as String?,
      howDidYouHearAboutLuminar:
          json['how_did_you_hear_about_luminar'] as String?,
      facebookCampaign: json['facebook_campaign'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      isEditable: json['is_editable'] as bool?,
      isDeletable: json['is_deletable'] as bool?,
      isDeleted: json['is_deleted'] as bool?,
      isActive: json['is_active'] as bool?,
      isResubmission: json['is_resubmission'] as bool?,
      leadStatus: (json['lead_status'] as num?)?.toInt(),
      leadSource: json['lead_source'] as String?,
      usedFacebookForm: json['used_facebook_form'] as String?,
      counselor: (json['counselor'] as num?)?.toInt(),
      websiteForm: json['website_form'] as String?,
      qualification: json['qualification'],
      preferredLocation: json['preferred_location'],
      course: json['course'],
      courseMode: json['course_mode'],
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'id': instance.id,
      'lead_status_details': instance.leadStatusDetails,
      'lead_source_details': instance.leadSourceDetails,
      'used_facebook_form_details': instance.usedFacebookFormDetails,
      'counselor_details': instance.counselorDetails,
      'website_form_details': instance.websiteFormDetails,
      'qualification_details': instance.qualificationDetails,
      'preferred_location_details': instance.preferredLocationDetails,
      'course_details': instance.courseDetails,
      'course_mode_details': instance.courseModeDetails,
      'followup_count': instance.followupCount,
      'pending_followups': instance.pendingFollowups,
      'completed_followups': instance.completedFollowups,
      'last_followup': instance.lastFollowup,
      'next_followup': instance.nextFollowup,
      'name': instance.name,
      'phone_number': instance.phoneNumber,
      'whatsapp_number': instance.whatsappNumber,
      'email': instance.email,
      'city': instance.city,
      'reminder_date': instance.reminderDate,
      'is_archived': instance.isArchived,
      'parent_name': instance.parentName,
      'parent_phone_number': instance.parentPhoneNumber,
      'leadgen_id': instance.leadgenId,
      'pass_out_year': instance.passOutYear,
      'college': instance.college,
      'address': instance.address,
      'how_did_you_hear_about_luminar': instance.howDidYouHearAboutLuminar,
      'facebook_campaign': instance.facebookCampaign,
      'created_at': instance.createdAt?.toIso8601String(),
      'is_editable': instance.isEditable,
      'is_deletable': instance.isDeletable,
      'is_deleted': instance.isDeleted,
      'is_active': instance.isActive,
      'is_resubmission': instance.isResubmission,
      'lead_status': instance.leadStatus,
      'lead_source': instance.leadSource,
      'used_facebook_form': instance.usedFacebookForm,
      'counselor': instance.counselor,
      'website_form': instance.websiteForm,
      'qualification': instance.qualification,
      'preferred_location': instance.preferredLocation,
      'course': instance.course,
      'course_mode': instance.courseMode,
    };

CounselorDetails _$CounselorDetailsFromJson(Map<String, dynamic> json) =>
    CounselorDetails(
      id: (json['id'] as num?)?.toInt(),
      uid: json['uid'] as String?,
      fullName: json['full_name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      whatsappNumber: json['whatsapp_number'] as String?,
      isActive: json['is_active'] as bool?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      roleDetails: json['role_details'] == null
          ? null
          : RoleDetails.fromJson(json['role_details'] as Map<String, dynamic>),
      profilePic: json['profile_pic'] as String?,
      isStaff: json['is_staff'] as bool?,
      isSuperuser: json['is_superuser'] as bool?,
    );

Map<String, dynamic> _$CounselorDetailsToJson(CounselorDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'full_name': instance.fullName,
      'email': instance.email,
      'phone': instance.phone,
      'whatsapp_number': instance.whatsappNumber,
      'is_active': instance.isActive,
      'created_at': instance.createdAt?.toIso8601String(),
      'role_details': instance.roleDetails,
      'profile_pic': instance.profilePic,
      'is_staff': instance.isStaff,
      'is_superuser': instance.isSuperuser,
    };

RoleDetails _$RoleDetailsFromJson(Map<String, dynamic> json) => RoleDetails(
      id: (json['id'] as num?)?.toInt(),
      label: json['label'] as String?,
      value: json['value'] as String?,
    );

Map<String, dynamic> _$RoleDetailsToJson(RoleDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'label': instance.label,
      'value': instance.value,
    };

LeadSourceDetails _$LeadSourceDetailsFromJson(Map<String, dynamic> json) =>
    LeadSourceDetails(
      id: json['id'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      isEditable: json['is_editable'] as bool?,
      isDeletable: json['is_deletable'] as bool?,
      isDeleted: json['is_deleted'] as bool?,
      isActive: json['is_active'] as bool?,
      label: json['label'] as String?,
      value: json['value'] as String?,
    );

Map<String, dynamic> _$LeadSourceDetailsToJson(LeadSourceDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt?.toIso8601String(),
      'is_editable': instance.isEditable,
      'is_deletable': instance.isDeletable,
      'is_deleted': instance.isDeleted,
      'is_active': instance.isActive,
      'label': instance.label,
      'value': instance.value,
    };

LeadStatusDetails _$LeadStatusDetailsFromJson(Map<String, dynamic> json) =>
    LeadStatusDetails(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      value: json['value'] as String?,
      color: json['color'] as String?,
      isActive: json['is_active'] as bool?,
      provideLink: json['provide_link'] as bool?,
    );

Map<String, dynamic> _$LeadStatusDetailsToJson(LeadStatusDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'value': instance.value,
      'color': instance.color,
      'is_active': instance.isActive,
      'provide_link': instance.provideLink,
    };

UsedFacebookFormDetails _$UsedFacebookFormDetailsFromJson(
        Map<String, dynamic> json) =>
    UsedFacebookFormDetails(
      id: json['id'] as String?,
      name: json['name'] as String?,
      pageId: json['page_id'] as String?,
      formId: json['form_id'] as String?,
      status: json['status'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      isEditable: json['is_editable'] as bool?,
      isDeletable: json['is_deletable'] as bool?,
      isDeleted: json['is_deleted'] as bool?,
      isActive: json['is_active'] as bool?,
      formFields: (json['form_fields'] as List<dynamic>?)
          ?.map((e) => FormField.fromJson(e as Map<String, dynamic>))
          .toList(),
      counselors: (json['counselors'] as List<dynamic>?)
          ?.map((e) =>
              LastAssignedCounselorElement.fromJson(e as Map<String, dynamic>))
          .toList(),
      lastAssignedCounselor: json['last_assigned_counselor'] == null
          ? null
          : LastAssignedCounselorElement.fromJson(
              json['last_assigned_counselor'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UsedFacebookFormDetailsToJson(
        UsedFacebookFormDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'page_id': instance.pageId,
      'form_id': instance.formId,
      'status': instance.status,
      'created_at': instance.createdAt?.toIso8601String(),
      'is_editable': instance.isEditable,
      'is_deletable': instance.isDeletable,
      'is_deleted': instance.isDeleted,
      'is_active': instance.isActive,
      'form_fields': instance.formFields,
      'counselors': instance.counselors,
      'last_assigned_counselor': instance.lastAssignedCounselor,
    };

LastAssignedCounselorElement _$LastAssignedCounselorElementFromJson(
        Map<String, dynamic> json) =>
    LastAssignedCounselorElement(
      id: (json['id'] as num?)?.toInt(),
      fullName: json['full_name'] as String?,
      email: json['email'] as String?,
      uid: json['uid'] as String?,
    );

Map<String, dynamic> _$LastAssignedCounselorElementToJson(
        LastAssignedCounselorElement instance) =>
    <String, dynamic>{
      'id': instance.id,
      'full_name': instance.fullName,
      'email': instance.email,
      'uid': instance.uid,
    };

FormField _$FormFieldFromJson(Map<String, dynamic> json) => FormField(
      id: (json['id'] as num?)?.toInt(),
      facebookFormId: json['facebook_form_id'] as String?,
      facebookFormName: json['facebook_form_name'] as String?,
      formFieldLabel: json['form_field_label'] as String?,
      formFieldKey: json['form_field_key'] as String?,
      formFieldType: json['form_field_type'] as String?,
      leadFieldMapping: json['lead_field_mapping'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      isEditable: json['is_editable'] as bool?,
      isDeletable: json['is_deletable'] as bool?,
      isDeleted: json['is_deleted'] as bool?,
      isActive: json['is_active'] as bool?,
    );

Map<String, dynamic> _$FormFieldToJson(FormField instance) => <String, dynamic>{
      'id': instance.id,
      'facebook_form_id': instance.facebookFormId,
      'facebook_form_name': instance.facebookFormName,
      'form_field_label': instance.formFieldLabel,
      'form_field_key': instance.formFieldKey,
      'form_field_type': instance.formFieldType,
      'lead_field_mapping': instance.leadFieldMapping,
      'created_at': instance.createdAt?.toIso8601String(),
      'is_editable': instance.isEditable,
      'is_deletable': instance.isDeletable,
      'is_deleted': instance.isDeleted,
      'is_active': instance.isActive,
    };

WebsiteFormDetails _$WebsiteFormDetailsFromJson(Map<String, dynamic> json) =>
    WebsiteFormDetails(
      id: json['id'] as String?,
      name: json['name'] as String?,
      formKey: json['form_key'] as String?,
      pageUrl: json['page_url'] as String?,
      description: json['description'] as String?,
      isActive: json['is_active'] as bool?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      tracker: json['tracker'] == null
          ? null
          : Tracker.fromJson(json['tracker'] as Map<String, dynamic>),
      counselors: (json['counselors'] as List<dynamic>?)
          ?.map((e) =>
              WebsiteFormDetailsCounselor.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WebsiteFormDetailsToJson(WebsiteFormDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'form_key': instance.formKey,
      'page_url': instance.pageUrl,
      'description': instance.description,
      'is_active': instance.isActive,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'tracker': instance.tracker,
      'counselors': instance.counselors,
    };

WebsiteFormDetailsCounselor _$WebsiteFormDetailsCounselorFromJson(
        Map<String, dynamic> json) =>
    WebsiteFormDetailsCounselor(
      id: (json['id'] as num?)?.toInt(),
      uid: json['uid'] as String?,
      fullName: json['full_name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      whatsappNumber: json['whatsapp_number'] as String?,
      isActive: json['is_active'] as bool?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      roleDetails: json['role_details'] == null
          ? null
          : RoleDetails.fromJson(json['role_details'] as Map<String, dynamic>),
      profilePic: json['profile_pic'] as String?,
      isStaff: json['is_staff'] as bool?,
      isSuperuser: json['is_superuser'] as bool?,
    );

Map<String, dynamic> _$WebsiteFormDetailsCounselorToJson(
        WebsiteFormDetailsCounselor instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'full_name': instance.fullName,
      'email': instance.email,
      'phone': instance.phone,
      'whatsapp_number': instance.whatsappNumber,
      'is_active': instance.isActive,
      'created_at': instance.createdAt?.toIso8601String(),
      'role_details': instance.roleDetails,
      'profile_pic': instance.profilePic,
      'is_staff': instance.isStaff,
      'is_superuser': instance.isSuperuser,
    };

Tracker _$TrackerFromJson(Map<String, dynamic> json) => Tracker(
      id: json['id'] as String?,
      formName: json['form_name'] as String?,
      pageUrl: json['page_url'] as String?,
      lastLeadTime: json['last_lead_time'] == null
          ? null
          : DateTime.parse(json['last_lead_time'] as String),
      leadCount: (json['lead_count'] as num?)?.toInt(),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$TrackerToJson(Tracker instance) => <String, dynamic>{
      'id': instance.id,
      'form_name': instance.formName,
      'page_url': instance.pageUrl,
      'last_lead_time': instance.lastLeadTime?.toIso8601String(),
      'lead_count': instance.leadCount,
      'updated_at': instance.updatedAt?.toIso8601String(),
      'created_at': instance.createdAt?.toIso8601String(),
    };
