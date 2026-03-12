import 'package:dartz/dartz.dart';
import 'package:eventhub/core/validation_pipe/value_validators.dart';
import 'package:eventhub/core/value_failures/value_failures.dart';
import 'package:eventhub/core/value_object/abstract_value_objects.dart';

class EmailAddress extends AbstractValueObject<String> {

  factory EmailAddress(String input) {
    return EmailAddress._(
      validateEmailAddress(input),
    );
  }

  const EmailAddress._(this.value);
  @override
  final Either<ValueFailure<String>, String> value;
}

class Username extends AbstractValueObject<String> {
  factory Username(String input) {
    return Username._(
      validateUsername(input),
    );
  }

  const Username._(this.value);
  @override
  final Either<ValueFailure<String>, String> value;
}

class Password extends AbstractValueObject<String> {

  factory Password(String input) {
    return Password._(
      validatePassword(input),
    );
  }

  const Password._(this.value);
  @override
  final Either<ValueFailure<String>, String> value;
}

class ConfirmPassword extends AbstractValueObject<String> {

  factory ConfirmPassword(String input, String originalPassword) {
    return ConfirmPassword._(
      validateConfirmPassword(input, originalPassword),
    );
  }

  const ConfirmPassword._(this.value);
  @override
  final Either<ValueFailure<String>, String> value;
}


class FullName extends AbstractValueObject<String> {

  factory FullName(String input) {
    return FullName._(
      validateFullName(input),
    );
  }

  const FullName._(this.value);
  @override
  final Either<ValueFailure<String>, String> value;
}

class Name extends AbstractValueObject<String> {
  factory Name(String input) {
    return Name._(
      validateName(input),
    );
  }

  const Name._(this.value);
  @override
  final Either<ValueFailure<String>, String> value;
}

class PhoneNumber extends AbstractValueObject<String> {
  factory PhoneNumber(String input) {
    return PhoneNumber._(
      validatePhoneNumber(input),
    );
  }

  const PhoneNumber._(this.value);
  @override
  final Either<ValueFailure<String>, String> value;
}



class ReferralCode extends AbstractValueObject<String> {
  factory ReferralCode(String input) {
    return ReferralCode._(
      validateReferralCode(input),
    );
  }

  const ReferralCode._(this.value);
  @override
  final Either<ValueFailure<String>, String> value;
}

class TermsAcceptance extends AbstractValueObject<bool> {
  factory TermsAcceptance(bool input) {
    return TermsAcceptance._(
      validateTermsAcceptance(input),
    );
  }

  const TermsAcceptance._(this.value);
  @override
  final Either<ValueFailure<bool>, bool> value;
}

class ProfilePhoto extends AbstractValueObject<String?> {
  factory ProfilePhoto(String? input) {
    return ProfilePhoto._(
      validateProfilePhoto(input),
    );
  }

  const ProfilePhoto._(this.value);
  @override
  final Either<ValueFailure<String?>, String?> value;
}
class UserRole extends AbstractValueObject<String> {
  factory UserRole(String input) {
    return UserRole._(
      validateUserRole(input),
    );
  }

  const UserRole._(this.value);
  @override
  final Either<ValueFailure<String>, String> value;
}

// Event-related value objects
class EventTitle extends AbstractValueObject<String> {
  factory EventTitle(String input) {
    return EventTitle._(
      validateEventTitle(input),
    );
  }

  const EventTitle._(this.value);
  @override
  final Either<ValueFailure<String>, String> value;
}

class EventDescription extends AbstractValueObject<String> {
  factory EventDescription(String input) {
    return EventDescription._(
      validateEventDescription(input),
    );
  }

  const EventDescription._(this.value);
  @override
  final Either<ValueFailure<String>, String> value;
}

class EventLocation extends AbstractValueObject<String> {
  factory EventLocation(String input) {
    return EventLocation._(
      validateEventLocation(input),
    );
  }

  const EventLocation._(this.value);
  @override
  final Either<ValueFailure<String>, String> value;
}

class EventCapacity extends AbstractValueObject<int> {
  factory EventCapacity(int input) {
    return EventCapacity._(
      validateEventCapacity(input),
    );
  }

  const EventCapacity._(this.value);
  @override
  final Either<ValueFailure<int>, int> value;
}

class TicketPrice extends AbstractValueObject<double> {
  factory TicketPrice(double input) {
    return TicketPrice._(
      validateTicketPrice(input),
    );
  }

  const TicketPrice._(this.value);
  @override
  final Either<ValueFailure<double>, double> value;
}

class TicketQuantity extends AbstractValueObject<int> {
  factory TicketQuantity(int input) {
    return TicketQuantity._(
      validateTicketQuantity(input),
    );
  }

  const TicketQuantity._(this.value);
  @override
  final Either<ValueFailure<int>, int> value;
}

class TicketTypeName extends AbstractValueObject<String> {
  factory TicketTypeName(String input) {
    return TicketTypeName._(
      validateTicketTypeName(input),
    );
  }

  const TicketTypeName._(this.value);
  @override
  final Either<ValueFailure<String>, String> value;
}

class UniqueId extends AbstractValueObject<String> {
  factory UniqueId() {
    return UniqueId._(
      right(DateTime.now().millisecondsSinceEpoch.toString()),
    );
  }

  factory UniqueId.fromString(String id) {
    return UniqueId._(
      right(id),
    );
  }

  const UniqueId._(this.value);
  @override
  final Either<ValueFailure<String>, String> value;
}
