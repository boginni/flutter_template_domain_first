import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_de.g.dart';
import 'app_localizations_en.g.dart';
import 'app_localizations_es.g.dart';
import 'app_localizations_fr.g.dart';
import 'app_localizations_ja.g.dart';
import 'app_localizations_pt.g.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen/app_localizations.g.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('fr'),
    Locale('ja'),
    Locale('pt')
  ];

  /// No description provided for @locale_name.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get locale_name;

  /// No description provided for @locale.
  ///
  /// In en, this message translates to:
  /// **'EN'**
  String get locale;

  /// No description provided for @error.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get error;

  /// No description provided for @required_field.
  ///
  /// In en, this message translates to:
  /// **'Required Field'**
  String get required_field;

  /// No description provided for @invalid_phone.
  ///
  /// In en, this message translates to:
  /// **'Invalid Phone'**
  String get invalid_phone;

  /// No description provided for @internal_auth_error.
  ///
  /// In en, this message translates to:
  /// **'An internal error occurred while authenticating'**
  String get internal_auth_error;

  /// No description provided for @too_many_requests_error.
  ///
  /// In en, this message translates to:
  /// **'You have made too many requests'**
  String get too_many_requests_error;

  /// No description provided for @invalid_email.
  ///
  /// In en, this message translates to:
  /// **'Invalid Email'**
  String get invalid_email;

  /// No description provided for @email_already_in_use.
  ///
  /// In en, this message translates to:
  /// **'Email Already in Use'**
  String get email_already_in_use;

  /// No description provided for @wrong_password.
  ///
  /// In en, this message translates to:
  /// **'Wrong Password'**
  String get wrong_password;

  /// No description provided for @welcome_back.
  ///
  /// In en, this message translates to:
  /// **'Welcome Back!'**
  String get welcome_back;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @leads.
  ///
  /// In en, this message translates to:
  /// **'Leads'**
  String get leads;

  /// No description provided for @featured.
  ///
  /// In en, this message translates to:
  /// **'Featured'**
  String get featured;

  /// No description provided for @i_wish.
  ///
  /// In en, this message translates to:
  /// **'I Wish'**
  String get i_wish;

  /// No description provided for @no_leads_yet.
  ///
  /// In en, this message translates to:
  /// **'No leads yet'**
  String get no_leads_yet;

  /// No description provided for @click_in_the_i_wish_button_inside_the_vehicle_card_to_add_a_lead.
  ///
  /// In en, this message translates to:
  /// **'Click in the \'I Wish\' button inside the vehicle card to add a lead'**
  String get click_in_the_i_wish_button_inside_the_vehicle_card_to_add_a_lead;

  /// No description provided for @sync.
  ///
  /// In en, this message translates to:
  /// **'Sync'**
  String get sync;

  /// No description provided for @enjoy_the_app_in_a_fancy_way.
  ///
  /// In en, this message translates to:
  /// **'Enjoy the app in a fancy way!'**
  String get enjoy_the_app_in_a_fancy_way;

  /// No description provided for @user_not_found_or_disabled_error.
  ///
  /// In en, this message translates to:
  /// **'User Not Found or Disabled'**
  String get user_not_found_or_disabled_error;

  /// No description provided for @credential_already_in_use_error.
  ///
  /// In en, this message translates to:
  /// **'Credential Already in Use'**
  String get credential_already_in_use_error;

  /// No description provided for @user_disabled.
  ///
  /// In en, this message translates to:
  /// **'User Disabled'**
  String get user_disabled;

  /// No description provided for @invalid_credentials_error.
  ///
  /// In en, this message translates to:
  /// **'Invalid Credentials'**
  String get invalid_credentials_error;

  /// No description provided for @wrong_credentials_error.
  ///
  /// In en, this message translates to:
  /// **'Wrong Credentials'**
  String get wrong_credentials_error;

  /// No description provided for @device_language.
  ///
  /// In en, this message translates to:
  /// **'Device Language'**
  String get device_language;

  /// No description provided for @password_must_have_at_least_6_characters.
  ///
  /// In en, this message translates to:
  /// **'Password must have at least 6 characters'**
  String get password_must_have_at_least_6_characters;

  /// No description provided for @passwords_do_not_match.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get passwords_do_not_match;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @sign_in.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get sign_in;

  /// No description provided for @sign_up.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get sign_up;

  /// No description provided for @google.
  ///
  /// In en, this message translates to:
  /// **'Google'**
  String get google;

  /// No description provided for @facebook.
  ///
  /// In en, this message translates to:
  /// **'Facebook'**
  String get facebook;

  /// No description provided for @anonymous.
  ///
  /// In en, this message translates to:
  /// **'Anonymous'**
  String get anonymous;

  /// No description provided for @open_mail_app.
  ///
  /// In en, this message translates to:
  /// **'Open Mail App'**
  String get open_mail_app;

  /// No description provided for @go_to_home.
  ///
  /// In en, this message translates to:
  /// **'Go to Home'**
  String get go_to_home;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @phone.
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get phone;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @confirm_password.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirm_password;

  /// No description provided for @welcome_to_ws_work_test_mobile.
  ///
  /// In en, this message translates to:
  /// **'Welcome to WS Work Test Mobile!'**
  String get welcome_to_ws_work_test_mobile;

  /// No description provided for @ws_work.
  ///
  /// In en, this message translates to:
  /// **'WS Work'**
  String get ws_work;

  /// No description provided for @doors_x.
  ///
  /// In en, this message translates to:
  /// **'{x} Doors'**
  String doors_x(Object x);

  /// No description provided for @i_want.
  ///
  /// In en, this message translates to:
  /// **'I want'**
  String get i_want;

  /// No description provided for @test_mobile.
  ///
  /// In en, this message translates to:
  /// **'Test Mobile'**
  String get test_mobile;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @delete_account.
  ///
  /// In en, this message translates to:
  /// **'Delete Account'**
  String get delete_account;

  /// No description provided for @info.
  ///
  /// In en, this message translates to:
  /// **'Info'**
  String get info;

  /// No description provided for @ws_work_test_mobile.
  ///
  /// In en, this message translates to:
  /// **'WS Work Test Mobile'**
  String get ws_work_test_mobile;

  /// No description provided for @please_sign_in_to_continue.
  ///
  /// In en, this message translates to:
  /// **'Please sign in to continue'**
  String get please_sign_in_to_continue;

  /// No description provided for @create_an_account.
  ///
  /// In en, this message translates to:
  /// **'Create an Account'**
  String get create_an_account;

  /// No description provided for @loading.
  ///
  /// In en, this message translates to:
  /// **'Loading'**
  String get loading;

  /// No description provided for @by_x.
  ///
  /// In en, this message translates to:
  /// **'By: {x}'**
  String by_x(Object x);

  /// No description provided for @enter_your_email_and_password_to_create_an_account.
  ///
  /// In en, this message translates to:
  /// **'Enter your email and password to create an account'**
  String get enter_your_email_and_password_to_create_an_account;

  /// No description provided for @you_dont_need_to_sign_up_when_using_google_phone_or_anonymous.
  ///
  /// In en, this message translates to:
  /// **'You don\'t need to sign up when using Google, Phone or Anonymous'**
  String get you_dont_need_to_sign_up_when_using_google_phone_or_anonymous;

  /// No description provided for @confirm_email.
  ///
  /// In en, this message translates to:
  /// **'Confirm Email'**
  String get confirm_email;

  /// No description provided for @forgot_password_ask.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password?'**
  String get forgot_password_ask;

  /// No description provided for @forgot_password.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password'**
  String get forgot_password;

  /// No description provided for @enter_your_email_to_reset_your_password.
  ///
  /// In en, this message translates to:
  /// **'Enter your email to reset your password'**
  String get enter_your_email_to_reset_your_password;

  /// No description provided for @reset_password.
  ///
  /// In en, this message translates to:
  /// **'Reset Password'**
  String get reset_password;

  /// No description provided for @no_mail_app_installed.
  ///
  /// In en, this message translates to:
  /// **'No mail app installed'**
  String get no_mail_app_installed;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;

  /// No description provided for @leaving_ask.
  ///
  /// In en, this message translates to:
  /// **'Leaving?'**
  String get leaving_ask;

  /// No description provided for @leaving.
  ///
  /// In en, this message translates to:
  /// **'Leaving'**
  String get leaving;

  /// No description provided for @leave.
  ///
  /// In en, this message translates to:
  /// **'Leave'**
  String get leave;

  /// No description provided for @are_you_sure_you_want_to_leave.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to leave?'**
  String get are_you_sure_you_want_to_leave;

  /// No description provided for @are_you_sure_you_want_to_logout.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to logout?'**
  String get are_you_sure_you_want_to_logout;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// No description provided for @delete_account_ask.
  ///
  /// In en, this message translates to:
  /// **'Delete Account?'**
  String get delete_account_ask;

  /// No description provided for @are_you_sure_you_want_to_delete_your_account.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete your account?'**
  String get are_you_sure_you_want_to_delete_your_account;

  /// No description provided for @we_are_sorry_to_see_you_go.
  ///
  /// In en, this message translates to:
  /// **'We are sorry to see you go'**
  String get we_are_sorry_to_see_you_go;

  /// No description provided for @rate_us.
  ///
  /// In en, this message translates to:
  /// **'Rate Us'**
  String get rate_us;

  /// No description provided for @rate_us_ask.
  ///
  /// In en, this message translates to:
  /// **'Rate Us?'**
  String get rate_us_ask;

  /// No description provided for @are_you_enjoying_ws_work_test_mobile.
  ///
  /// In en, this message translates to:
  /// **'Are you enjoying WS Work Test Mobile?'**
  String get are_you_enjoying_ws_work_test_mobile;

  /// No description provided for @please_take_a_moment_to_rate_us.
  ///
  /// In en, this message translates to:
  /// **'Please take a moment to rate us'**
  String get please_take_a_moment_to_rate_us;

  /// No description provided for @we_have_sent_an_email_to.
  ///
  /// In en, this message translates to:
  /// **'We have sent an email to'**
  String get we_have_sent_an_email_to;

  /// No description provided for @check_your_email_and_open_the_link_to_reset_your_password.
  ///
  /// In en, this message translates to:
  /// **'Check your email and click on the link to reset your password'**
  String get check_your_email_and_open_the_link_to_reset_your_password;

  /// No description provided for @check_your_email_and_open_the_link_to_confirm_your_email.
  ///
  /// In en, this message translates to:
  /// **'Check your email and click on the link to confirm your email'**
  String get check_your_email_and_open_the_link_to_confirm_your_email;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['de', 'en', 'es', 'fr', 'ja', 'pt'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fr':
      return AppLocalizationsFr();
    case 'ja':
      return AppLocalizationsJa();
    case 'pt':
      return AppLocalizationsPt();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
