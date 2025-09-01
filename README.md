# swift-stripe

[![Swift](https://img.shields.io/badge/Swift-6.0-orange.svg)](https://swift.org)
[![License](https://img.shields.io/badge/License-AGPL%203.0-blue.svg)](LICENSE.md)
[![Version](https://img.shields.io/badge/version-0.1.0-green.svg)](https://github.com/coenttb/swift-stripe/releases)

A complete, production-ready Stripe API client for Swift server applications.

## Overview

`swift-stripe` provides a high-level, dependency-injected interface to Stripe's API with:

- 🎯 **Complete API Coverage**: 48 modules covering payments, billing, and more
- 🔌 **Clean Architecture**: Simple re-export design for ease of use
- 🧪 **Fully Testable**: Mock implementations for all operations
- 📊 **Production Ready**: Used in production at coenttb.com
- ⚡ **High Performance**: Async/await with efficient connection pooling
- 🔐 **Secure**: API key management with environment variables
- 🚀 **Zero Configuration**: Works out of the box with sensible defaults

## Installation

Add to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/coenttb/swift-stripe", from: "0.1.0")
]
```

Then add to your target:

```swift
.product(name: "Stripe", package: "swift-stripe")
```

## Quick Start

### Configuration

Set your Stripe API key:

```bash
export STRIPE_SECRET_KEY=sk_test_...
```

### Basic Usage

```swift
import Stripe
import Dependencies

// Access any Stripe API through dependency injection
@Dependency(\.stripe.client) var stripe

// Create a customer
let customer = try await stripe.customers.create(
    .init(
        email: "customer@example.com",
        name: "John Doe"
    )
)

// Create a payment intent
let intent = try await stripe.paymentIntents.create(
    .init(
        amount: 2000,
        currency: .usd,
        customer: customer.id
    )
)

// Confirm the payment
let confirmed = try await stripe.paymentIntents.confirm(
    intent.id,
    .init(paymentMethod: "pm_card_visa")
)
```

### Subscription Management

```swift
// Create a product and price
let product = try await stripe.products.create(
    .init(
        name: "Premium Plan",
        description: "Full access to all features"
    )
)

let price = try await stripe.prices.create(
    .init(
        product: product.id,
        unitAmount: 1999,
        currency: .usd,
        recurring: .init(interval: .month)
    )
)

// Create a subscription
let subscription = try await stripe.subscriptions.create(
    .init(
        customer: customer.id,
        items: [.init(price: price.id)],
        paymentBehavior: .defaultIncomplete
    )
)
```

### Webhook Handling

```swift
import Vapor

func handleStripeWebhook(req: Request) async throws -> Response {
    let signature = req.headers["Stripe-Signature"].first!
    let payload = try req.content.decode(String.self)
    
    // Verify webhook signature
    let event = try stripe.webhooks.constructEvent(
        payload: payload,
        signature: signature,
        secret: webhookSecret
    )
    
    switch event.type {
    case "payment_intent.succeeded":
        let intent = try event.data.object.decode(as: Stripe.PaymentIntent.self)
        // Handle successful payment
        
    case "customer.subscription.created":
        let subscription = try event.data.object.decode(as: Stripe.Subscription.self)
        // Handle new subscription
        
    default:
        break
    }
    
    return Response(status: .ok)
}
```

## Features

### Complete API Coverage

All essential Stripe features are supported:

**Payments & Processing**
- Payment Intents, Payment Methods, Setup Intents
- Charges, Refunds, Disputes
- Customer management

**Billing & Subscriptions**
- Subscriptions with schedules
- Invoices and credit notes
- Usage-based billing
- Customer portal

**Products & Pricing**
- Product catalog
- Dynamic pricing
- Coupons and discounts
- Tax rates and shipping

**Platform & Connect**
- Connected accounts
- Transfers and payouts
- Application fees

**Additional Features**
- Webhooks and events
- File uploads
- Balance transactions
- Terminal and in-person payments
- Tax calculations
- Fraud detection

### Testing

Easy testing with mock implementations:

```swift
import Testing
import Stripe
import Dependencies

@Test
func testPaymentFlow() async throws {
    await withDependencies {
        $0.stripe.client.customers.create = { _ in
            .init(id: "cus_test", email: "test@example.com")
        }
        $0.stripe.client.paymentIntents.create = { _ in
            .init(id: "pi_test", amount: 2000, status: .succeeded)
        }
    } operation: {
        let service = PaymentService()
        let result = try await service.processPayment()
        #expect(result.success == true)
    }
}
```

## Architecture

`swift-stripe` provides a clean, modular architecture:

```
swift-stripe (this package)
├── Re-exports swift-stripe-live modules
└── Provides unified Stripe namespace

swift-stripe-live
├── Live HTTP implementations
└── Depends on swift-stripe-types

swift-stripe-types
├── Type definitions and protocols
└── Apache 2.0 licensed for maximum compatibility
```

### Module Organization

Import individual modules for smaller binary size:

```swift
// Import everything
import Stripe

// Or import specific modules
import StripeCustomers
import StripePaymentIntents
import StripeSubscriptions
```

## Production Use

This package powers production Stripe integrations at:
- [coenttb.com](https://coenttb.com) - Payment processing
- E-commerce platforms
- SaaS subscription services
- Marketplace applications

## Migration from stripe-kit

If migrating from vapor-community/stripe-kit:

1. Update package dependency to swift-stripe
2. Replace `StripeKit` imports with `Stripe`
3. Update to new type-safe API calls
4. Use dependency injection instead of direct client instantiation

## Related Packages

- [swift-stripe-types](https://github.com/coenttb/swift-stripe-types): Core types (Apache 2.0)
- [swift-stripe-live](https://github.com/coenttb/swift-stripe-live): Live implementations
- [coenttb-com-server](https://github.com/coenttb/coenttb-com-server): Production example

## Requirements

- Swift 6.0+
- macOS 14+ / iOS 17+ / Linux
- Stripe account with API keys

## License

This package is licensed under the AGPL 3.0 License. See [LICENSE.md](LICENSE.md) for details.

For commercial licensing options, please contact the maintainer.

## Support

For issues, questions, or contributions, please visit the [GitHub repository](https://github.com/coenttb/swift-stripe).