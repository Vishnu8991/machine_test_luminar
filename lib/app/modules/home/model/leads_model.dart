import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'leads_model.g.dart';

@JsonSerializable()
class LeadsModel {
    @JsonKey(name: "count")
    final int? count;
    @JsonKey(name: "next")
    final String? next;
    @JsonKey(name: "previous")
    final dynamic previous;
    @JsonKey(name: "results")
    final List<Result>? results;

    LeadsModel({
        this.count,
        this.next,
        this.previous,
        this.results,
    });

    factory LeadsModel.fromJson(Map<String, dynamic> json) => _$LeadsModelFromJson(json);

    Map<String, dynamic> toJson() => _$LeadsModelToJson(this);
}

@JsonSerializable()
class Result {
    @JsonKey(name: "id")
    final String? id;
    @JsonKey(name: "lead_status_details")
    final LeadStatusDetails? leadStatusDetails;
    @JsonKey(name: "lead_source_details")
    final LeadSourceDetails? leadSourceDetails;
    @JsonKey(name: "used_facebook_form_details")
    final UsedFacebookFormDetails? usedFacebookFormDetails;
    @JsonKey(name: "counselor_details")
    final CounselorDetails? counselorDetails;
    @JsonKey(name: "website_form_details")
    final WebsiteFormDetails? websiteFormDetails;
    @JsonKey(name: "qualification_details")
    final dynamic qualificationDetails;
    @JsonKey(name: "preferred_location_details")
    final dynamic preferredLocationDetails;
    @JsonKey(name: "course_details")
    final dynamic courseDetails;
    @JsonKey(name: "course_mode_details")
    final dynamic courseModeDetails;
    @JsonKey(name: "followup_count")
    final int? followupCount;
    @JsonKey(name: "pending_followups")
    final int? pendingFollowups;
    @JsonKey(name: "completed_followups")
    final int? completedFollowups;
    @JsonKey(name: "last_followup")
    final dynamic lastFollowup;
    @JsonKey(name: "next_followup")
    final dynamic nextFollowup;
    @JsonKey(name: "name")
    final String? name;
    @JsonKey(name: "phone_number")
    final String? phoneNumber;
    @JsonKey(name: "whatsapp_number")
    final dynamic whatsappNumber;
    @JsonKey(name: "email")
    final String? email;
    @JsonKey(name: "city")
    final String? city;
    @JsonKey(name: "reminder_date")
    final dynamic reminderDate;
    @JsonKey(name: "is_archived")
    final bool? isArchived;
    @JsonKey(name: "parent_name")
    final String? parentName;
    @JsonKey(name: "parent_phone_number")
    final dynamic parentPhoneNumber;
    @JsonKey(name: "leadgen_id")
    final String? leadgenId;
    @JsonKey(name: "pass_out_year")
    final int? passOutYear;
    @JsonKey(name: "college")
    final String? college;
    @JsonKey(name: "address")
    final String? address;
    @JsonKey(name: "how_did_you_hear_about_luminar")
    final String? howDidYouHearAboutLuminar;
    @JsonKey(name: "facebook_campaign")
    final String? facebookCampaign;
    @JsonKey(name: "created_at")
    final DateTime? createdAt;
    @JsonKey(name: "is_editable")
    final bool? isEditable;
    @JsonKey(name: "is_deletable")
    final bool? isDeletable;
    @JsonKey(name: "is_deleted")
    final bool? isDeleted;
    @JsonKey(name: "is_active")
    final bool? isActive;
    @JsonKey(name: "is_resubmission")
    final bool? isResubmission;
    @JsonKey(name: "lead_status")
    final int? leadStatus;
    @JsonKey(name: "lead_source")
    final String? leadSource;
    @JsonKey(name: "used_facebook_form")
    final String? usedFacebookForm;
    @JsonKey(name: "counselor")
    final int? counselor;
    @JsonKey(name: "website_form")
    final String? websiteForm;
    @JsonKey(name: "qualification")
    final dynamic qualification;
    @JsonKey(name: "preferred_location")
    final dynamic preferredLocation;
    @JsonKey(name: "course")
    final dynamic course;
    @JsonKey(name: "course_mode")
    final dynamic courseMode;

    Result({
        this.id,
        this.leadStatusDetails,
        this.leadSourceDetails,
        this.usedFacebookFormDetails,
        this.counselorDetails,
        this.websiteFormDetails,
        this.qualificationDetails,
        this.preferredLocationDetails,
        this.courseDetails,
        this.courseModeDetails,
        this.followupCount,
        this.pendingFollowups,
        this.completedFollowups,
        this.lastFollowup,
        this.nextFollowup,
        this.name,
        this.phoneNumber,
        this.whatsappNumber,
        this.email,
        this.city,
        this.reminderDate,
        this.isArchived,
        this.parentName,
        this.parentPhoneNumber,
        this.leadgenId,
        this.passOutYear,
        this.college,
        this.address,
        this.howDidYouHearAboutLuminar,
        this.facebookCampaign,
        this.createdAt,
        this.isEditable,
        this.isDeletable,
        this.isDeleted,
        this.isActive,
        this.isResubmission,
        this.leadStatus,
        this.leadSource,
        this.usedFacebookForm,
        this.counselor,
        this.websiteForm,
        this.qualification,
        this.preferredLocation,
        this.course,
        this.courseMode,
    });

    factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

    Map<String, dynamic> toJson() => _$ResultToJson(this);
}

enum College {
    @JsonValue("")
    EMPTY,
    @JsonValue("Kerala University")
    KERALA_UNIVERSITY
}

final collegeValues = EnumValues({
    "": College.EMPTY,
    "Kerala University": College.KERALA_UNIVERSITY
});

@JsonSerializable()
class CounselorDetails {
    @JsonKey(name: "id")
    final int? id;
    @JsonKey(name: "uid")
    final String? uid;
    @JsonKey(name: "full_name")
    final String? fullName;
    @JsonKey(name: "email")
    final String? email;
    @JsonKey(name: "phone")
    final String? phone;
    @JsonKey(name: "whatsapp_number")
    final String? whatsappNumber;
    @JsonKey(name: "is_active")
    final bool? isActive;
    @JsonKey(name: "created_at")
    final DateTime? createdAt;
    @JsonKey(name: "role_details")
    final RoleDetails? roleDetails;
    @JsonKey(name: "profile_pic")
    final String? profilePic;
    @JsonKey(name: "is_staff")
    final bool? isStaff;
    @JsonKey(name: "is_superuser")
    final bool? isSuperuser;

    CounselorDetails({
        this.id,
        this.uid,
        this.fullName,
        this.email,
        this.phone,
        this.whatsappNumber,
        this.isActive,
        this.createdAt,
        this.roleDetails,
        this.profilePic,
        this.isStaff,
        this.isSuperuser,
    });

    factory CounselorDetails.fromJson(Map<String, dynamic> json) => _$CounselorDetailsFromJson(json);

    Map<String, dynamic> toJson() => _$CounselorDetailsToJson(this);
}

@JsonSerializable()
class RoleDetails {
    @JsonKey(name: "id")
    final int? id;
    @JsonKey(name: "label")
    final String? label;
    @JsonKey(name: "value")
    final String? value;

    RoleDetails({
        this.id,
        this.label,
        this.value,
    });

    factory RoleDetails.fromJson(Map<String, dynamic> json) => _$RoleDetailsFromJson(json);

    Map<String, dynamic> toJson() => _$RoleDetailsToJson(this);
}

enum RoleDetailsLabel {
    @JsonValue("Admission Counsellor")
    ADMISSION_COUNSELLOR,
    @JsonValue("Super Admin")
    SUPER_ADMIN,
    @JsonValue("Team Lead")
    TEAM_LEAD,
    @JsonValue("trainer")
    TRAINER
}

final roleDetailsLabelValues = EnumValues({
    "Admission Counsellor": RoleDetailsLabel.ADMISSION_COUNSELLOR,
    "Super Admin": RoleDetailsLabel.SUPER_ADMIN,
    "Team Lead": RoleDetailsLabel.TEAM_LEAD,
    "trainer": RoleDetailsLabel.TRAINER,
});

enum RoleDetailsValue {
    @JsonValue("admission_counsellor")
    ADMISSION_COUNSELLOR,
    @JsonValue("superadmin")
    SUPERADMIN,
    @JsonValue("team_lead")
    TEAM_LEAD,
    @JsonValue("trainer")
    TRAINER
}

final roleDetailsValueValues = EnumValues({
    "admission_counsellor": RoleDetailsValue.ADMISSION_COUNSELLOR,
    "superadmin": RoleDetailsValue.SUPERADMIN,
    "team_lead": RoleDetailsValue.TEAM_LEAD,
    "trainer": RoleDetailsValue.TRAINER
});

@JsonSerializable()
class LeadSourceDetails {
    @JsonKey(name: "id")
    final String? id;
    @JsonKey(name: "created_at")
    final DateTime? createdAt;
    @JsonKey(name: "is_editable")
    final bool? isEditable;
    @JsonKey(name: "is_deletable")
    final bool? isDeletable;
    @JsonKey(name: "is_deleted")
    final bool? isDeleted;
    @JsonKey(name: "is_active")
    final bool? isActive;
    @JsonKey(name: "label")
    final String? label;
    @JsonKey(name: "value")
    final String? value;

    LeadSourceDetails({
        this.id,
        this.createdAt,
        this.isEditable,
        this.isDeletable,
        this.isDeleted,
        this.isActive,
        this.label,
        this.value,
    });

    factory LeadSourceDetails.fromJson(Map<String, dynamic> json) => _$LeadSourceDetailsFromJson(json);

    Map<String, dynamic> toJson() => _$LeadSourceDetailsToJson(this);
}

enum LeadSourceDetailsLabel {
    @JsonValue("Facebook")
    FACEBOOK,
    @JsonValue("Website")
    WEBSITE
}

final leadSourceDetailsLabelValues = EnumValues({
    "Facebook": LeadSourceDetailsLabel.FACEBOOK,
    "Website": LeadSourceDetailsLabel.WEBSITE
});

enum LeadSourceDetailsValue {
    @JsonValue("facebook")
    FACEBOOK,
    @JsonValue("website")
    WEBSITE
}

final leadSourceDetailsValueValues = EnumValues({
    "facebook": LeadSourceDetailsValue.FACEBOOK,
    "website": LeadSourceDetailsValue.WEBSITE
});

@JsonSerializable()
class LeadStatusDetails {
    @JsonKey(name: "id")
    final int? id;
    @JsonKey(name: "name")
    final String? name;
    @JsonKey(name: "value")
    final String? value;
    @JsonKey(name: "color")
    final String? color;
    @JsonKey(name: "is_active")
    final bool? isActive;
    @JsonKey(name: "provide_link")
    final bool? provideLink;

    LeadStatusDetails({
        this.id,
        this.name,
        this.value,
        this.color,
        this.isActive,
        this.provideLink,
    });

    factory LeadStatusDetails.fromJson(Map<String, dynamic> json) => _$LeadStatusDetailsFromJson(json);

    Map<String, dynamic> toJson() => _$LeadStatusDetailsToJson(this);
}

enum Color {
    @JsonValue("#0ae67f")
    THE_0_AE67_F
}

final colorValues = EnumValues({
    "#0ae67f": Color.THE_0_AE67_F
});

enum Name {
    @JsonValue("New Lead")
    NEW_LEAD
}

final nameValues = EnumValues({
    "New Lead": Name.NEW_LEAD
});

enum LeadStatusDetailsValue {
    @JsonValue("new_lead")
    NEW_LEAD
}

final leadStatusDetailsValueValues = EnumValues({
    "new_lead": LeadStatusDetailsValue.NEW_LEAD
});

@JsonSerializable()
class UsedFacebookFormDetails {
    @JsonKey(name: "id")
    final String? id;
    @JsonKey(name: "name")
    final String? name;
    @JsonKey(name: "page_id")
    final String? pageId;
    @JsonKey(name: "form_id")
    final String? formId;
    @JsonKey(name: "status")
    final String? status;
    @JsonKey(name: "created_at")
    final DateTime? createdAt;
    @JsonKey(name: "is_editable")
    final bool? isEditable;
    @JsonKey(name: "is_deletable")
    final bool? isDeletable;
    @JsonKey(name: "is_deleted")
    final bool? isDeleted;
    @JsonKey(name: "is_active")
    final bool? isActive;
    @JsonKey(name: "form_fields")
    final List<FormField>? formFields;
    @JsonKey(name: "counselors")
    final List<LastAssignedCounselorElement>? counselors;
    @JsonKey(name: "last_assigned_counselor")
    final LastAssignedCounselorElement? lastAssignedCounselor;

    UsedFacebookFormDetails({
        this.id,
        this.name,
        this.pageId,
        this.formId,
        this.status,
        this.createdAt,
        this.isEditable,
        this.isDeletable,
        this.isDeleted,
        this.isActive,
        this.formFields,
        this.counselors,
        this.lastAssignedCounselor,
    });

    factory UsedFacebookFormDetails.fromJson(Map<String, dynamic> json) => _$UsedFacebookFormDetailsFromJson(json);

    Map<String, dynamic> toJson() => _$UsedFacebookFormDetailsToJson(this);
}

@JsonSerializable()
class LastAssignedCounselorElement {
    @JsonKey(name: "id")
    final int? id;
    @JsonKey(name: "full_name")
    final String? fullName;
    @JsonKey(name: "email")
    final String? email;
    @JsonKey(name: "uid")
    final String? uid;

    LastAssignedCounselorElement({
        this.id,
        this.fullName,
        this.email,
        this.uid,
    });

    factory LastAssignedCounselorElement.fromJson(Map<String, dynamic> json) => _$LastAssignedCounselorElementFromJson(json);

    Map<String, dynamic> toJson() => _$LastAssignedCounselorElementToJson(this);
}

@JsonSerializable()
class FormField {
    @JsonKey(name: "id")
    final int? id;
    @JsonKey(name: "facebook_form_id")
    final String? facebookFormId;
    @JsonKey(name: "facebook_form_name")
    final String? facebookFormName;
    @JsonKey(name: "form_field_label")
    final String? formFieldLabel;
    @JsonKey(name: "form_field_key")
    final String? formFieldKey;
    @JsonKey(name: "form_field_type")
    final String? formFieldType;
    @JsonKey(name: "lead_field_mapping")
    final String? leadFieldMapping;
    @JsonKey(name: "created_at")
    final DateTime? createdAt;
    @JsonKey(name: "is_editable")
    final bool? isEditable;
    @JsonKey(name: "is_deletable")
    final bool? isDeletable;
    @JsonKey(name: "is_deleted")
    final bool? isDeleted;
    @JsonKey(name: "is_active")
    final bool? isActive;

    FormField({
        this.id,
        this.facebookFormId,
        this.facebookFormName,
        this.formFieldLabel,
        this.formFieldKey,
        this.formFieldType,
        this.leadFieldMapping,
        this.createdAt,
        this.isEditable,
        this.isDeletable,
        this.isDeleted,
        this.isActive,
    });

    factory FormField.fromJson(Map<String, dynamic> json) => _$FormFieldFromJson(json);

    Map<String, dynamic> toJson() => _$FormFieldToJson(this);
}

@JsonSerializable()
class WebsiteFormDetails {
    @JsonKey(name: "id")
    final String? id;
    @JsonKey(name: "name")
    final String? name;
    @JsonKey(name: "form_key")
    final String? formKey;
    @JsonKey(name: "page_url")
    final String? pageUrl;
    @JsonKey(name: "description")
    final String? description;
    @JsonKey(name: "is_active")
    final bool? isActive;
    @JsonKey(name: "created_at")
    final DateTime? createdAt;
    @JsonKey(name: "updated_at")
    final DateTime? updatedAt;
    @JsonKey(name: "tracker")
    final Tracker? tracker;
    @JsonKey(name: "counselors")
    final List<WebsiteFormDetailsCounselor>? counselors;

    WebsiteFormDetails({
        this.id,
        this.name,
        this.formKey,
        this.pageUrl,
        this.description,
        this.isActive,
        this.createdAt,
        this.updatedAt,
        this.tracker,
        this.counselors,
    });

    factory WebsiteFormDetails.fromJson(Map<String, dynamic> json) => _$WebsiteFormDetailsFromJson(json);

    Map<String, dynamic> toJson() => _$WebsiteFormDetailsToJson(this);
}

@JsonSerializable()
class WebsiteFormDetailsCounselor {
    @JsonKey(name: "id")
    final int? id;
    @JsonKey(name: "uid")
    final String? uid;
    @JsonKey(name: "full_name")
    final String? fullName;
    @JsonKey(name: "email")
    final String? email;
    @JsonKey(name: "phone")
    final String? phone;
    @JsonKey(name: "whatsapp_number")
    final String? whatsappNumber;
    @JsonKey(name: "is_active")
    final bool? isActive;
    @JsonKey(name: "created_at")
    final DateTime? createdAt;
    @JsonKey(name: "role_details")
    final RoleDetails? roleDetails;
    @JsonKey(name: "profile_pic")
    final String? profilePic;
    @JsonKey(name: "is_staff")
    final bool? isStaff;
    @JsonKey(name: "is_superuser")
    final bool? isSuperuser;

    WebsiteFormDetailsCounselor({
        this.id,
        this.uid,
        this.fullName,
        this.email,
        this.phone,
        this.whatsappNumber,
        this.isActive,
        this.createdAt,
        this.roleDetails,
        this.profilePic,
        this.isStaff,
        this.isSuperuser,
    });

    factory WebsiteFormDetailsCounselor.fromJson(Map<String, dynamic> json) => _$WebsiteFormDetailsCounselorFromJson(json);

    Map<String, dynamic> toJson() => _$WebsiteFormDetailsCounselorToJson(this);
}

enum WhatsappNumber {
    @JsonValue("")
    EMPTY,
    @JsonValue("+919747643209")
    THE_919747643209
}

final whatsappNumberValues = EnumValues({
    "": WhatsappNumber.EMPTY,
    "+919747643209": WhatsappNumber.THE_919747643209
});

@JsonSerializable()
class Tracker {
    @JsonKey(name: "id")
    final String? id;
    @JsonKey(name: "form_name")
    final String? formName;
    @JsonKey(name: "page_url")
    final String? pageUrl;
    @JsonKey(name: "last_lead_time")
    final DateTime? lastLeadTime;
    @JsonKey(name: "lead_count")
    final int? leadCount;
    @JsonKey(name: "updated_at")
    final DateTime? updatedAt;
    @JsonKey(name: "created_at")
    final DateTime? createdAt;

    Tracker({
        this.id,
        this.formName,
        this.pageUrl,
        this.lastLeadTime,
        this.leadCount,
        this.updatedAt,
        this.createdAt,
    });

    factory Tracker.fromJson(Map<String, dynamic> json) => _$TrackerFromJson(json);

    Map<String, dynamic> toJson() => _$TrackerToJson(this);
}

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}

