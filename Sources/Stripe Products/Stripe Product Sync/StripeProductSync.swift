//// MARK: - Stripe Product Sync
//// Reusable component for syncing local product definitions with Stripe.
//// This ensures your application's products match what's configured in Stripe.
//
//import Foundation
//import Stripe_Products_Live
//import Dependencies
//
///// A product definition that can be synced with Stripe
//public protocol StripeProductDefinition {
//    var id: String { get }
//    var name: String { get }
//    var description: String { get }
//    var prices: [PriceDefinition] { get }
//}
//
///// A price definition for a product
//public struct PriceDefinition {
//    public let amount: Int
//    public let currency: Stripe.Products.Price.Currency
//    public let recurring: Stripe.Products.Price.Recurring?
//    public let metadata: [String: String]?
//    
//    /// Create a one-time price
//    public init(
//        amount: Int,
//        currency: Stripe.Products.Price.Currency = .usd,
//        metadata: [String: String]? = nil
//    ) {
//        self.amount = amount
//        self.currency = currency
//        self.recurring = nil
//        self.metadata = metadata
//    }
//    
//    /// Create a recurring price
//    public init(
//        amount: Int,
//        currency: Stripe.Products.Price.Currency = .usd,
//        interval: Stripe.Products.Price.Recurring.Interval,
//        metadata: [String: String]? = nil
//    ) {
//        self.amount = amount
//        self.currency = currency
//        self.recurring = .init(interval: interval)
//        self.metadata = metadata
//    }
//}
//
///// Syncs product definitions with Stripe
//public struct StripeProductSync {
//    @Dependency(Stripe_Products.Stripe.Products.self) var products
//    @Dependency(Stripe_Products.Stripe.Products.Prices.self) var prices
//    
//    public init() {}
//    
//    /// Sync products with Stripe, creating or updating as needed
//    public func sync<Product: StripeProductDefinition>(
//        _ productDefinitions: [Product]
//    ) async throws {
//        print("🔄 Starting Stripe product sync...")
//        
//        // Get existing products from Stripe
//        let existingProducts = try await products.client.products.list(
//            .init(limit: 100)
//        )
//        
//        for definition in productDefinitions {
//            // Check if product exists
//            let existingProduct = existingProducts.data.first { product in
//                product.metadata?["app_product_id"] == definition.id
//            }
//            
//            // Create or get the Stripe product
//            let stripeProduct: Stripe.Products.Product
//            if let existing = existingProduct {
//                stripeProduct = existing
//                print("✅ Found existing product: \(definition.name)")
//            } else {
//                stripeProduct = try await products.client.products.create(
//                    .init(
//                        name: definition.name,
//                        description: definition.description,
//                        metadata: ["app_product_id": definition.id]
//                    )
//                )
//                print("✅ Created product: \(definition.name)")
//            }
//            
//            // Sync prices for this product
//            try await syncPrices(
//                for: stripeProduct,
//                definitions: definition.prices,
//                productId: definition.id
//            )
//        }
//        
//        print("✅ Product sync complete!")
//    }
//    
//    private func syncPrices(
//        for product: Stripe.Products.Product,
//        definitions: [PriceDefinition],
//        productId: String
//    ) async throws {
//        // Get existing prices for this product
//        let existingPrices = try await prices.client.list(
//            .init(limit: 100, product: product.id)
//        )
//        
//        for definition in definitions {
//            // Check if price already exists
//            let existingPrice = existingPrices.data.first { price in
//                price.unitAmount == definition.amount &&
//                price.currency == definition.currency &&
//                price.recurring?.interval == definition.recurring?.interval &&
//                price.active == true
//            }
//            
//            if existingPrice == nil {
//                // Create the price
//                var metadata = definition.metadata ?? [:]
//                metadata["app_product_id"] = productId
//                
//                if let recurring = definition.recurring {
//                    metadata["interval"] = recurring.interval.rawValue
//                }
//                
//                let price = try await prices.client.create(
//                    .init(
//                        currency: definition.currency,
//                        metadata: metadata,
//                        product: product.id,
//                        recurring: definition.recurring,
//                        unitAmount: definition.amount
//                    )
//                )
//                
//                let priceType = definition.recurring != nil ? 
//                    "recurring (\(definition.recurring!.interval.rawValue))" : 
//                    "one-time"
//                print("  ✅ Created \(priceType) price: \(price.id)")
//            }
//        }
//    }
//}
//
///// Convenience function to sync products on app startup
//public func syncStripeProducts<Product: StripeProductDefinition>(
//    _ products: [Product]
//) async throws {
//    let sync = StripeProductSync()
//    try await sync.sync(products)
//}
