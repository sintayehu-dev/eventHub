class RouteName {
  RouteName._();
  
  // Main routes
  static const splash = 'splash';
  static const mainScreen = 'mainScreen';
  static const login = 'login';
  static const onboarding = 'onboarding';

  // Auth routes
  static const registrationScreen = 'registrationScreen';
  static const signIn = 'sign-in';
  static const signUp = 'sign-up';
  static const otpVerification = 'otpVerification';
  static const termsAndConditionsScreen = 'termsAndConditionsScreen';
  static const terms = 'terms';

  // Main app routes (legacy)
  static const home = 'home';
  static const events = 'events';
  static const createEvent = 'createEvent';
  static const tickets = 'tickets';
  static const profile = 'profile';

  // Attendee routes
  static const attendeeHome = 'attendee_home';
  static const attendeeDiscover = 'attendee_discover';
  static const attendeeTickets = 'attendee_tickets';
  static const attendeeProfile = 'attendee_profile';
  
  // Ticket purchase routes
  static const ticketSelection = 'ticket_selection';
  static const purchaseConfirmation = 'purchase_confirmation';
  static const purchaseSuccess = 'purchase_success';

  // Ticket wallet routes
  static const ticketWallet = 'ticket_wallet';
  static const ticketDetails = 'ticket_details';
  static const ticketQR = 'ticket_qr';

  // Organizer routes
  static const organizerHome = 'organizer_home';
  static const organizerEvents = 'organizer_events';
  static const organizerAnalytics = 'organizer_analytics';
  static const organizerProfile = 'organizer_profile';
  static const createEventScreen = 'create_event_screen';
  static const editEventScreen = 'edit_event_screen';
  static const eventAttendees = 'event_attendees';
  static const organizerEventDetail = 'organizer_event_detail';
  static const attendeeList = 'attendee_list';

  // Staff routes
  static const staffScanner = 'staff_scanner';
  static const staffAttendees = 'staff_attendees';
  static const staffReports = 'staff_reports';
  static const staffSettings = 'staff_settings';
  static const qrScanner = 'qr_scanner';

  // Shared routes
  static const eventDetail = 'event_detail';
}
