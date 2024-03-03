class DatabaseApi {
//static String mainUrl = "https://app.field360.in";
  static String mainUrl = "https://default-v1-7h7eea7icq-el.a.run.app";
  static String signup = "$mainUrl/api/v1/user/signup/";
  static String sendOtp = "$mainUrl/api/v1/user/otp/generate/";
  static String verifyOtp = "$mainUrl/api/v1/user/otp/";
  static String forgotOtp =
      "$mainUrl/api/v1/user/forgot-password/otp/generate/";
  static String forgotverifyOtp = "$mainUrl/api/v1/user/forgot-password/otp/";
  static String changePassword = "$mainUrl/api/v1/user/change-password/";
  static String signIn = "$mainUrl/api/v1/user/login/";
  static String signOut = "$mainUrl/api/v1/user/logout/";
  static String getUserProfile = "$mainUrl/api/v1/user/profile/";
  static String editProfile = "$mainUrl/api/v1/user/profile/";
  static String deleteMember = "$mainUrl/api/v1/projects/members/";
  static String deleteAccount = "$mainUrl/api/v1/user/account/delete/";
  static String getCountry = "$mainUrl/api/v1/common/countries/";
  static String getStates = "$mainUrl/api/v1/common/countries/states/?country=";
  static String getCity =
      "$mainUrl/api/v1/common/countries/states/cities/?country=";
  static String getDesignation = "$mainUrl/api/v1/common/designations/";
  static String createProject = "$mainUrl/api/v1/projects/";
  static String updateProject = "$mainUrl/api/v1/projects/";
  static String getProject = "$mainUrl/api/v1/projects/";
  static String getMember = "$mainUrl/api/v1/projects/members/?project_id=";
  static String addMember = "$mainUrl/api/v1/projects/members/";
  static String updateMember = "$mainUrl/api/v1/projects/members/";
  static String getDashboard = "$mainUrl/api/v1/tasks/dashboard/?project_id=";
  static String createTask = "$mainUrl/api/v1/tasks/";
  static String getResources = "$mainUrl/api/v1/common/resources/";
  static String getManPower = "$mainUrl/api/v1/common/manpower/";
  static String getUnits = "$mainUrl/api/v1/common/units/";
  static String getTasks = "$mainUrl/api/v1/tasks/?project_id=";
  static String getTasksInProgress = "$mainUrl/api/v1/tasks/?project_id=";
  static String getTasksDetails = "$mainUrl/api/v1/tasks/";
  static String getDocumentById = "$mainUrl/api/v1/storage/documents/";

//static String getTasksInProgress = "$mainUrl/api/v1/tasks/?project_id=";
  static String getTasksInPending = "$mainUrl/api/v1/tasks/?project_id=";
  static String getTasksCompleted = "$mainUrl/api/v1/tasks/?project_id=";
  static String getTaskUpdates = "$mainUrl/api/v1/tasks/update/?task_id=";
  static String getTaskApprover = "$mainUrl/api/v1/tasks/?project_id=";
  static String taskApproveorReject = "$mainUrl/api/v1/tasks/update/";
  static String createDprReport = "$mainUrl/api/v1/dpr/";
  static String getDPRReport = "$mainUrl/api/v1/dpr/?project_id=";
  static String downloadReport = "$mainUrl/api/v1/dpr/";
  static String getProjectMember =
      "$mainUrl/api/v1/projects/members/?project_id=";
  static String createTaskUpdates = "$mainUrl/api/v1/tasks/update/";
  static String createDocument = "$mainUrl/api/v1/storage/documents/";
  static String allProjects = "$mainUrl/api/v1/projects/";
  static String getSubFoldersDrpDown =
      "$mainUrl/api/v1/storage/subfolders/dropdown-list/?project_id=";
  static String getSubFolder =
      "$mainUrl/api/v1/storage/subfolders/?project_id=";
  static String getThreadsDropDown =
      "$mainUrl/api/v1/storage/threads/dropdown-list/?subfolder_id=";
  static String getDocument = "$mainUrl/api/v1/storage/documents/?thread_id=";
  static String updateDocument = "$mainUrl/api/v1/storage/documents/";
  static String getThread = "$mainUrl/api/v1/storage/threads/?subfolder_id=";
  static String sendFeed = "$mainUrl/api/v1/chats/feed/";
  static String registerToken = "$mainUrl/api/v1/user/notification-token/";
  static String getFeed = "$mainUrl/api/v1/chats/feed/?project_id=";
  static String getUserDashBoard =
      "$mainUrl/api/v1/tasks/dashboard/?project_id=";
  static String getOngoingTasks = "$mainUrl/api/v1/tasks/?project_id=";
  static String getRecentUploads = "$mainUrl/api/v1/storage/documents/";
  static String replyToMessage = "$mainUrl/api/v1/chats/feed/";
  static String reactToMessage = "$mainUrl/api/v1/chats/feed/";
  static String deleteReact = "$mainUrl/api/v1/chats/feed/";
  static String createIndividualChat = "$mainUrl/api/v1/chats/";
  static String getChats = "$mainUrl/api/v1/chats/?project_id=";
  static String sendMessage = "$mainUrl/api/v1/chats/messages/";
  static String getMessage = "$mainUrl/api/v1/chats/messages/?chat_id=";
  static String getChatDetails = "$mainUrl/api/v1/chats/";
  static String updateChat = "$mainUrl/api/v1/chats/";
  static String imageUpload = "$mainUrl/api/v1/common/file/upload/";
  static String deleteProject = "$mainUrl/api/v1/projects/";
  static String deleteNotification = "$mainUrl/api/v1/user/notification/";
  static String deleteGroups = "$mainUrl/api/v1/chats/";
  static String deletedocument = "$mainUrl/api/v1/storage/documents/";
  static String anotationDocument = "$mainUrl/api/v1/storage/documents/";
  static String editTask = "$mainUrl/api/v1/tasks/";
  static var headerOptions = {'Content-Type': 'application/json'};
  static String deleteBudge   = "$mainUrl/api/v1/user/notification-token/badge/";
  static String notificans   = "$mainUrl/api/v1/user/notification/";
}
