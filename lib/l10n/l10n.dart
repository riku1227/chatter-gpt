import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'l10n_en.dart';
import 'l10n_ja.dart';

/// Callers can lookup localized strings with an instance of L10n
/// returned by `L10n.of(context)`.
///
/// Applications need to include `L10n.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/l10n.dart';
///
/// return MaterialApp(
///   localizationsDelegates: L10n.localizationsDelegates,
///   supportedLocales: L10n.supportedLocales,
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
/// be consistent with the languages listed in the L10n.supportedLocales
/// property.
abstract class L10n {
  L10n(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static L10n? of(BuildContext context) {
    return Localizations.of<L10n>(context, L10n);
  }

  static const LocalizationsDelegate<L10n> delegate = _L10nDelegate();

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ja')
  ];

  /// No description provided for @main_chat_input_textfield.
  ///
  /// In en, this message translates to:
  /// **'Chat here.'**
  String get main_chat_input_textfield;

  /// No description provided for @main_chat_clear_memory.
  ///
  /// In en, this message translates to:
  /// **'Clear chat history/memory'**
  String get main_chat_clear_memory;

  /// No description provided for @settings_title.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings_title;

  /// No description provided for @settings_tile_general_settings.
  ///
  /// In en, this message translates to:
  /// **'General Settings'**
  String get settings_tile_general_settings;

  /// No description provided for @settings_change_api_key.
  ///
  /// In en, this message translates to:
  /// **'Change API Key'**
  String get settings_change_api_key;

  /// No description provided for @settings_tile_other_settings.
  ///
  /// In en, this message translates to:
  /// **'Other Settings'**
  String get settings_tile_other_settings;

  /// No description provided for @settings_application_info.
  ///
  /// In en, this message translates to:
  /// **'Application Information'**
  String get settings_application_info;

  /// No description provided for @drawer_tile_settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get drawer_tile_settings;

  /// No description provided for @drawer_tile_add_chat_session.
  ///
  /// In en, this message translates to:
  /// **'Add session'**
  String get drawer_tile_add_chat_session;

  /// No description provided for @dialog_api_key_title.
  ///
  /// In en, this message translates to:
  /// **'API Key'**
  String get dialog_api_key_title;

  /// No description provided for @dialog_api_key_textfield.
  ///
  /// In en, this message translates to:
  /// **'Enter your Open AI API key'**
  String get dialog_api_key_textfield;

  /// No description provided for @dialog_api_key_textfield_error.
  ///
  /// In en, this message translates to:
  /// **'The entered value is not an API key'**
  String get dialog_api_key_textfield_error;

  /// No description provided for @dialog_delete_chat_session_title.
  ///
  /// In en, this message translates to:
  /// **'Delete session'**
  String get dialog_delete_chat_session_title;

  /// No description provided for @dialog_delete_chat_session_message.
  ///
  /// In en, this message translates to:
  /// **'Do you want to delete {session}?'**
  String dialog_delete_chat_session_message(Object session);

  /// No description provided for @dialog_delete_chat_session_ok.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get dialog_delete_chat_session_ok;

  /// No description provided for @dialog_change_session_name_title.
  ///
  /// In en, this message translates to:
  /// **'Change Session Name'**
  String get dialog_change_session_name_title;

  /// No description provided for @dialog_change_session_name_textfield.
  ///
  /// In en, this message translates to:
  /// **'Session Name'**
  String get dialog_change_session_name_textfield;

  /// No description provided for @dialog_change_session_name_ok.
  ///
  /// In en, this message translates to:
  /// **'Change'**
  String get dialog_change_session_name_ok;

  /// No description provided for @main_chat_send.
  ///
  /// In en, this message translates to:
  /// **'Send chat'**
  String get main_chat_send;

  /// No description provided for @error_message.
  ///
  /// In en, this message translates to:
  /// **'An error has occurred'**
  String get error_message;

  /// No description provided for @loading_message.
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get loading_message;

  /// No description provided for @message_cancel.
  ///
  /// In en, this message translates to:
  /// **'キャンセル'**
  String get message_cancel;
}

class _L10nDelegate extends LocalizationsDelegate<L10n> {
  const _L10nDelegate();

  @override
  Future<L10n> load(Locale locale) {
    return SynchronousFuture<L10n>(lookupL10n(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'ja'].contains(locale.languageCode);

  @override
  bool shouldReload(_L10nDelegate old) => false;
}

L10n lookupL10n(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return L10nEn();
    case 'ja': return L10nJa();
  }

  throw FlutterError(
    'L10n.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
