# SwiftUI Boilerplate App
This is a boilerplate app that can be forked to get you started with the Atomic SwiftUI SDK.

The code is based on the [Atomic SwiftUI SDK documentation](https://documentation.atomic.io/sdks/ios-swiftui) and designed to get you up and running as quickly as possible, not as an example of best practices.

This boilerplate is provided for demonstration and onboarding purposes only. It is not production-ready, and we do not recommend submitting it, or any modified version of it, to the App Store or using it in a production environment without your own review, testing, and hardening. You are responsible for any changes you make and for how you use this project. Atomic is not liable for any losses, damages, or issues that arise from using this boilerplate or any modifications derived from it.

## Quick Start

1. Install the latest stable version of Xcode. This project currently targets Xcode 26.4.1 (17E202).
2. Open `SwiftUI boilerplate/SwiftUI boilerplate.xcodeproj`.
3. In Xcode, choose File > Packages > Update to Latest Package Versions to resolve the Atomic SwiftUI SDK package.
4. For production apps, follow the official [Atomic SwiftUI SDK installation guide](https://documentation.atomic.io/sdks/ios-swiftui#installation) instead of copying this sample setup directly.

### SDK configuration
The app requires your Atomic Workbench settings before it can run. Add the following values to `AtomicSettings` in `SwiftUI boilerplate/SwiftUI boilerplate/SwiftUI_boilerplateApp.swift`:

- Open [Atomic Workbench](https://workbench.atomic.io/) and go to Configuration.
- `environmentId`: shown at the top of the page under Environment ID.
- `apiKey`: listed in SDK API Keys.
- `apiBaseUrl`: listed in SDK API Host.
- `containerId`: listed in Stream containers.

Return a valid JSON Web Token (JWT) from `TheSessionDelegate.cardSessionDidRequestAuthenticationToken()`. See [SDK Authentication](https://documentation.atomic.io/sdks/auth-SDK) for JWT generation details.

## Branches

### Main branch

The main branch is the minimal setup: it logs into the Atomic SwiftUI SDK with `AtomicSettings` and renders a default `StreamContainer`.

### Full variants

The [`full-variants`](https://github.com/atomic-app/boilerplate-swiftui-sdk/tree/full-variants) branch expands the boilerplate into a picker of focused container examples:

- Stream container: shows a navigation-based `StreamContainer`, plus a bell button that presents the stream container in a sheet.
- Single card view: shows `SingleCardContainer` inside a scroll page, with a secondary page and a bell-triggered sheet.
- Horizontal container: shows `HorizontalContainer` inside the same host layout, using a fixed card width.
- Fullscreen modal: shows the fullscreen `.modalContainer(...)` modifier attached to simple page content.

### Runtime variables

The [`runtime-variables`](https://github.com/atomic-app/boilerplate-swiftui-sdk/tree/runtime-variables) branch demonstrates how to resolve runtime variables while rendering a `StreamContainer`. It adds a `ContainerConfiguration` in `ContentView.swift` that resolves an `amount` runtime variable with the value `500`.

To test the runtime-variable example:

- In [Atomic Workbench](https://workbench.atomic.io/), open Action Flows, then open an action flow.
- In the Variables section, create a variable named `amount`, and ensure "Allow update at runtime" is turned on.
- Add this variable to a card.
- Publish the card and run the app from the `runtime-variables` branch.
