import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:eventhub/core/presentation/widgets/app_button.dart';
import 'package:eventhub/core/presentation/widgets/app_text_field.dart';
import 'package:eventhub/core/presentation/widgets/auth_scaffold.dart';
import 'package:eventhub/core/presentation/widgets/app_back_button.dart';
import 'package:eventhub/core/theme/app_theme.dart';
import 'package:eventhub/features/attendee/event_discovery/domain/entities/event_discovery_entity.dart';
import 'package:eventhub/features/attendee/event_discovery/presentation/widgets/discover/discover_event_card.dart';
import 'package:eventhub/features/attendee/event_discovery/presentation/widgets/home/attendee_categories_section.dart';
import 'package:eventhub/features/attendee/event_discovery/presentation/widgets/home/attendee_event_card.dart';
import 'package:eventhub/features/attendee/event_discovery/presentation/widgets/home/attendee_home_header.dart';
import 'package:eventhub/features/attendee/event_discovery/presentation/widgets/home/attendee_search_bar.dart';
import 'package:eventhub/features/attendee/event_discovery/presentation/widgets/home/featured_event_card.dart';
import 'package:eventhub/features/attendee/ticket_purchase/domain/entities/ticket_entity.dart';
import 'package:eventhub/features/attendee/ticket_purchase/presentation/widgets/ticket_purchase_summary.dart';
import 'package:eventhub/features/attendee/ticket_purchase/presentation/widgets/ticket_type_selection_card.dart';
import 'package:eventhub/features/attendee/ticket_wallet/presentation/widgets/attendee_ticket_card.dart';
import 'package:eventhub/features/attendee/ticket_wallet/presentation/widgets/ticket_wallet_summary_card.dart';
import 'package:eventhub/features/attendee/profile/presentation/widgets/attendee_profile_header.dart';
import 'package:eventhub/features/attendee/profile/presentation/widgets/attendee_profile_menu.dart';
import 'package:eventhub/features/attendee/profile/presentation/widgets/attendee_logout_card.dart';
import 'package:eventhub/features/auth/presentation/pages/onboarding/onboarding_screen.dart';
import 'package:eventhub/features/organizer/event_management/domain/entities/event_entity.dart';
import 'package:eventhub/core/presentation/widgets/confirm_sheet.dart';
import 'package:eventhub/features/organizer/event_management/presentation/widgets/create/event_basic_info_section.dart';
import 'package:eventhub/features/organizer/event_management/presentation/widgets/create/event_banner_section.dart';
import 'package:eventhub/features/organizer/event_management/presentation/widgets/create/event_location_date_time_section.dart';
import 'package:eventhub/features/organizer/event_management/presentation/widgets/create/ticket_types_section.dart';
import 'package:eventhub/features/organizer/event_management/presentation/widgets/create/event_capacity_section.dart';
import 'package:eventhub/features/organizer/event_management/presentation/widgets/create/ticket_type_data.dart';
import 'package:eventhub/features/attendee/ticket_wallet/presentation/widgets/attendee_tickets/attendee_tickets_loading.dart';
import 'package:eventhub/features/organizer/event_management/presentation/widgets/details/event_detail_shimmer.dart';
import 'package:eventhub/features/organizer/profile/presentation/widgets/organizer_profile_shimmer.dart';
import 'package:eventhub/features/attendee/profile/presentation/widgets/attendee_profile_shimmer.dart';
import 'package:eventhub/features/attendee/event_discovery/presentation/widgets/discover/discover_shimmer_card.dart';
import 'package:eventhub/features/shared/event_details/presentation/widgets/event_detail_get_tickets_button.dart';
import 'package:eventhub/features/shared/event_details/presentation/widgets/event_detail_info_card.dart';
import 'package:eventhub/features/shared/profile/domain/entities/user_profile_entity.dart';

final _event = EventDiscoveryEntity(
  id: 'e1',
  organizerId: 'o1',
  organizerName: 'Addis Live',
  title: 'Addis Jazz Night with the Ethio Quartet',
  description: 'A night of jazz.',
  location: 'Skylight Hotel, Addis Ababa',
  dateTime: DateTime(2026, 10, 12, 20),
  category: EventCategory.music,
  ticketTypes: const [
    TicketTypeInfo(
      id: 't1',
      name: 'VIP',
      description: 'Front row seats and a drink',
      price: 1200,
      availableQuantity: 20,
      totalQuantity: 50,
      isActive: true,
    ),
  ],
  maxCapacity: 200,
  availableTickets: 120,
  minPrice: 300,
  maxPrice: 1200,
  status: EventStatus.active,
  createdAt: DateTime(2026, 9, 1),
);

final _ticket = TicketEntity(
  id: 'tk1',
  eventId: 'e1',
  userId: 'u1',
  eventTitle: 'Addis Jazz Night with the Ethio Quartet',
  eventLocation: 'Skylight Hotel, Addis Ababa',
  eventDateTime: DateTime.now().add(const Duration(days: 10)),
  ticketTypeId: 't1',
  ticketTypeName: 'VIP',
  ticketTypeDescription: 'Front row',
  ticketPrice: 1200,
  status: TicketStatus.confirmed,
  qrCode: 'abc',
  purchaseDate: DateTime.now(),
  createdAt: DateTime.now(),
  updatedAt: DateTime.now(),
);

ThemeData _withFont(ThemeData t) =>
    t.copyWith(textTheme: t.textTheme.apply(fontFamily: 'Seg'));

Future<void> _loadFonts() async {
  final loader = FontLoader('Seg');
  for (final p in const [
    'C:/Windows/Fonts/segoeui.ttf',
    'C:/Windows/Fonts/segoeuib.ttf',
    'C:/Windows/Fonts/seguisb.ttf',
  ]) {
    loader.addFont(Future.value(
        ByteData.sublistView(File(p).readAsBytesSync())));
  }
  await loader.load();
  final icons = FontLoader('MaterialIcons');
  icons.addFont(Future.value(ByteData.sublistView(File(
          'C:/src/flutter/bin/cache/artifacts/material_fonts/MaterialIcons-Regular.otf')
      .readAsBytesSync())));
  await icons.load();
}

Widget _host(Widget child, {bool dark = false}) {
  return ScreenUtilInit(
    designSize: const Size(375, 812),
    builder: (_, __) => MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _withFont(dark ? AppTheme.darkTheme() : AppTheme.lightTheme()),
      home: child,
    ),
  );
}

void main() {
  setUpAll(() async {
    GoogleFonts.config.allowRuntimeFetching = false;
    await _loadFonts();
  });

  Future<void> shoot(WidgetTester tester, String name, Widget w,
      {bool dark = false}) async {
    tester.view.devicePixelRatio = 1.0;
    tester.view.physicalSize = const Size(375, 812);
    addTearDown(tester.view.reset);
    await tester.pumpWidget(RepaintBoundary(child: _host(w, dark: dark)));
    await tester.pump(const Duration(milliseconds: 400));
    final ex = tester.takeException();
    if (ex != null) debugPrint('EXC $name: $ex');
    await expectLater(
      find.byType(RepaintBoundary).first,
      matchesGoldenFile('_shots/$name.png'),
    );
  }

  testWidgets('home', (tester) async {
    await shoot(
      tester,
      'home',
      Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(20, 50, 20, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AttendeeHomeHeader(),
              SizedBox(height: 20),
              AttendeeSearchBar(onTap: () {}),
              SizedBox(height: 20),
              FeaturedEventCard(event: _event, onTap: () {}),
              SizedBox(height: 28),
              AttendeeCategoriesSection(onCategoryTap: (_) {}),
              SizedBox(height: 28),
              AttendeeEventCard(event: _event, onTap: () {}),
            ],
          ),
        ),
      ),
    );
  });

  testWidgets('explore-cards', (tester) async {
    await shoot(
      tester,
      'explore',
      Scaffold(
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              DiscoverEventCard(event: _event),
              SizedBox(height: 16),
              DiscoverEventCard(event: _event),
            ],
          ),
        ),
      ),
    );
  });

  testWidgets('tickets', (tester) async {
    await shoot(
      tester,
      'tickets',
      Scaffold(
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                children: [
                  for (final t in const ['Total', 'Active', 'Upcoming'])
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: TicketWalletSummaryCard(
                          title: t,
                          value: '3',
                          icon: Icons.check,
                          tint: const Color(0xFFDCEAF2),
                        ),
                      ),
                    ),
                ],
              ),
              SizedBox(height: 16),
              AttendeeTicketCard(
                  ticket: _ticket, onTap: () {}, onShowQR: () {}),
            ],
          ),
        ),
      ),
    );
  });

  testWidgets('purchase', (tester) async {
    await shoot(
      tester,
      'purchase',
      Scaffold(
        body: Column(
          children: [
            SizedBox(height: 60),
            Padding(
              padding: EdgeInsets.all(20),
              child: TicketTypeSelectionCard(
                ticketType: _event.ticketTypes.first,
                quantity: 2,
                onQuantityChanged: (_) {},
              ),
            ),
            const Spacer(),
            TicketPurchaseSummary(
                totalTickets: 2, totalAmount: 2400, onProceed: () {}),
          ],
        ),
      ),
    );
  });

  testWidgets('detail-bits', (tester) async {
    await shoot(
      tester,
      'detail',
      Scaffold(
        body: Padding(
          padding: EdgeInsets.fromLTRB(20, 60, 20, 0),
          child: const EventDetailInfoCard(
            icon: Icons.calendar_today_rounded,
            title: 'Date & time',
            subtitle: '12 Oct 2026 • 20:00',
          ),
        ),
        bottomNavigationBar: EventDetailGetTicketsButton(event: _event),
      ),
    );
  });

  testWidgets('profile', (tester) async {
    await shoot(
      tester,
      'profile',
      Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(20, 60, 20, 20),
          child: Column(
            children: [
              AttendeeProfileHeader(
                profile: UserProfileEntity(
                  id: 'u1',
                  email: 'sam@example.com',
                  name: 'Samrawit Bekele',
                  role: UserRole.attendee,
                ),
              ),
              SizedBox(height: 20),
              AttendeeProfileMenu(onAboutTap: () {}),
              SizedBox(height: 20),
              AttendeeLogoutCard(onLogoutTap: () {}),
            ],
          ),
        ),
      ),
    );
  });

  testWidgets('auth-sheet', (tester) async {
    await shoot(
      tester,
      'auth',
      AuthScaffold(
        eyebrow: 'Welcome back!', title: 'Sign in',
        leading: const AppBackButton(),
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(24, 32, 24, 24),
          child: Column(
            children: [
              const AppTextField(
                label: 'Email address',
                hintText: 'Enter your email',
                prefixIcon: Icons.mail_outline_rounded,
              ),
              SizedBox(height: 20),
              const AppTextField(
                label: 'Password',
                hintText: 'Enter your password',
                prefixIcon: Icons.lock_outline_rounded,
                obscureText: true,
                errorText: 'Password is required',
              ),
              SizedBox(height: 28),
              AppButton(
                  label: 'Sign in',
                  icon: Icons.arrow_forward_rounded,
                  onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  });

  testWidgets('onboarding', (tester) async {
    await shoot(tester, 'onboarding', const OnboardingPage());
  });

  testWidgets('shimmers', (tester) async {
    await shoot(tester, 'sh_wallet', const Scaffold(body: Padding(padding: EdgeInsets.only(top: 60), child: AttendeeTicketsLoading())));
    await shoot(tester, 'sh_profile', const Scaffold(body: Padding(padding: EdgeInsets.only(top: 60), child: AttendeeProfileShimmer())));
    await shoot(tester, 'sh_discover', const Scaffold(body: Padding(padding: EdgeInsets.all(20), child: DiscoverShimmerCard())));
  });

  testWidgets('org-shimmers', (tester) async {
    await shoot(tester, 'sh_org_detail', const Scaffold(body: EventDetailShimmer()));
    await shoot(tester, 'sh_org_profile', const Scaffold(body: Padding(padding: EdgeInsets.only(top: 60), child: OrganizerProfileShimmer())));
  });

  testWidgets('create-form', (tester) async {
    final t = TextEditingController(text: 'Addis Jazz Night');
    final d = TextEditingController();
    final l = TextEditingController();
    final c = TextEditingController();
    final tickets = [TicketTypeData(name: 'General', description: 'Standard', price: 0, quantity: 100, isActive: true)];
    await shoot(
      tester,
      'create_form',
      Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 60, 20, 20),
          child: Column(children: [
            EventBasicInfoSection(
              titleController: t,
              descriptionController: d,
              selectedCategory: 'Music',
              categories: EventCategory.values.map((e) => e.displayName).toList(),
              onCategoryChanged: (_) {},
            ),
            const SizedBox(height: 16),
            EventBannerSection(selectedImagePath: null, onImageSelected: (_) {}),
            const SizedBox(height: 16),
            EventLocationDateTimeSection(
              locationController: l,
              selectedDate: DateTime(2026, 10, 12),
              selectedTime: null,
              onSelectDate: () {},
              onSelectTime: () {},
            ),
            const SizedBox(height: 16),
            TicketTypesSection(ticketTypes: tickets, onAddTicketType: () {}, onRemoveTicketType: (_) {}),
            const SizedBox(height: 16),
            EventCapacitySection(capacityController: c),
          ]),
        ),
      ),
    );
  });

  testWidgets('sheet', (tester) async {
    tester.view.devicePixelRatio = 1.0;
    tester.view.physicalSize = const Size(375, 812);
    addTearDown(tester.view.reset);
    await tester.pumpWidget(RepaintBoundary(
      child: _host(Builder(builder: (context) => Scaffold(
        body: Center(child: ElevatedButton(
          onPressed: () => showConfirmSheet(context, title: 'Sign out?', message: 'You will need to sign in again to see your account.', confirmLabel: 'Sign out', icon: Icons.logout_rounded, destructive: true),
          child: const Text('go'),
        )),
      ))),
    ));
    await tester.tap(find.text('go'));
    await tester.pumpAndSettle();
    await expectLater(find.byType(RepaintBoundary).first, matchesGoldenFile('_shots/sheet.png'));
  });
}
