# 🐶 DogSociety

**DogSociety** is a Flutter application created for AppNation Case Study.

---

## 📱 Features

### 🚀 Splash Screen
- Automatically shown at app launch.
- Concurrently fetches and caches all dog breeds using a Dog API.
- Transitions to the home screen once data is ready.

### 🏠 Home Screen
- Displays a list of all dog breeds.
- Includes a **dynamic BottomAppBar** with an expandable/collapsible textfield for filtering breeds.
- Clicking on a breed opens a **detail dialog** showing:
  - The breed name
  - A random image of the breed
  - Sub-breeds (if available)
  - A button to **generate a new random image**
  - An option to open the browser and search more images of breeds

### ⚙️ Settings Screen
- Displays the user's OS version via method channel communication.
- Clean and simple interface for general app settings.

### ⚡ UI/UX Extras
- Real-time **internet connectivity checks** before all data operations.
- **No connection dialogs** to notify users during offline usage.
- Support for zoomable breed images in dialogs.

---


## 🧱 Project Structure
```
├─ lib
│  ├─ core/ → Constants, DI, extensions, helpers, routing, themes
│  ├─ data/ → Entities, repositories, services
│  ├─ presentation/ → Screens, BLoCs, widgets
│  └─ main.dart
```
---

## 📦 Dependencies

| Package                        | Description                        |
|-------------------------------|------------------------------------|
| `bloc` / `flutter_bloc`       | State management                   |
| `dio`                         | HTTP client                        |
| `get_it`                      | Dependency injection               |
| `flutter_svg`                 | SVG asset support                  |

## 🧠 Architecture & Patterns

- **Clean Architecture** with a separation of concerns across `core`, `data`, and `presentation` layers.
- **BLoC pattern** to manage UI state in a reactive and testable way.
- Uses **Abstract Factory Pattern** for dynamic widget creation to access native widgets (`widget_factory` directory).

## 🐾 Credits

- [Dog API](https://dog.ceo/dog-api/) for providing dog breed data and images.

