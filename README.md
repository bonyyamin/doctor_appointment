# Doctor Appointment App

Doctor Appointment App is a Flutter-based application that allows users to book appointments with doctors, track their medical history, and communicate with healthcare providers. The app provides a seamless experience for managing healthcare needs.

## Features

- **Onboarding**: Introduces the app's features to new users.
- **Authentication**: Sign up and log in securely.
- **Home Screen**: Browse doctors by category and specialty.
- **Appointment Booking**: Book appointments with doctors and view appointment details.
- **Messaging**: Chat with doctors or healthcare providers.
- **Profile Management**: View and edit user profile and medical history.

## Screenshots

![Onboarding](assets/screenshots/onboarding.png)
![Home Screen](assets/screenshots/home_screen.png)
![Appointment Booking](assets/screenshots/appointment_booking.png)

## Getting Started

### Prerequisites

- Flutter SDK (version 3.7.2 or higher)
- Android Studio or Visual Studio Code
- A device or emulator to run the app

### Installation

1. Clone the repository:
   ```sh
   git clone https://github.com/bonyyamin/doctor_appointment.git
   cd doctor_appointment
   flutter pub get
   ```
2. Install dependencies:
```sh
flutter pub get
```
3. Run the app:
   ```sh
   flutter run
   ```

### Project Structure

```markdown
lib/
├── feature/
│   ├── auth/
│   ├── appointments/
│   ├── doctor/
│   ├── home/
│   ├── message/
│   ├── onboarding/
│   └── profile/
├── models/
└── widgets/
```