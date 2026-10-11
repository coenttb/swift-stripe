// MARK: - Typed Event Helper
// Combines Stripe event types with their associated typed data for ergonomic pattern matching

import Stripe_Events_Types
import Stripe_Types_Shared

extension Stripe.Events.Event {
    /// A helper enum that combines event type with typed data for ergonomic pattern matching
    /// Nested enums are marked as indirect to allocate large Stripe objects on the heap
    public indirect enum Typed: Codable, Hashable, Sendable {
        // Payment Intent events with associated PaymentIntent
        case paymentIntent(PaymentIntentEvent)

        // Charge events with associated Charge
        case charge(ChargeEvent)

        // Customer events with associated Customer
        case customer(CustomerEvent)

        // Subscription events with associated Subscription
        case subscription(SubscriptionEvent)

        // Invoice events with associated Invoice
        case invoice(InvoiceEvent)

        // Checkout Session events
        case checkoutSession(CheckoutSessionEvent)

        // Setup Intent events
        case setupIntent(SetupIntentEvent)

        // Payment Method events
        case paymentMethod(PaymentMethodEvent)

        // Product events
        case product(ProductEvent)

        // Price events
        case price(PriceEvent)

        // Payout events
        case payout(PayoutEvent)

        // Refund events
        case refund(RefundEvent)

        // Payment Link events
        case paymentLink(PaymentLinkEvent)

        // Mandate events
        case mandate(MandateEvent)

        // Account events
        case account(AccountEvent)

        // Application Fee events
        case applicationFee(ApplicationFeeEvent)

        // Balance events
        case balance(BalanceEvent)

        // Billing Portal events
        case billingPortal(BillingPortalEvent)

        // Capability events
        case capability(CapabilityEvent)

        // Cash Balance events
        case cashBalance(CashBalanceEvent)

        // Coupon events
        case coupon(CouponEvent)

        // Credit Note events
        case creditNote(CreditNoteEvent)

        // Discount events (on customers)
        case discount(DiscountEvent)

        // File events
        case file(FileEvent)

        // Financial Connections events
        case financialConnections(FinancialConnectionsEvent)

        // Identity Verification events
        case identity(IdentityEvent)

        // Invoice Item events
        case invoiceItem(InvoiceItemEvent)

        // Issuing events
        case issuing(IssuingEvent)

        // Person events
        case person(PersonEvent)

        // Plan events
        case plan(PlanEvent)

        // Promotion Code events
        case promotionCode(PromotionCodeEvent)

        // Quote events
        case quote(QuoteEvent)

        // Radar events
        case radar(RadarEvent)

        // Reporting events
        case reporting(ReportingEvent)

        // Review events
        case review(ReviewEvent)

        // Sigma events
        case sigma(SigmaEvent)

        // Source events
        case source(SourceEvent)

        // Subscription Schedule events
        case subscriptionSchedule(SubscriptionScheduleEvent)

        // Tax events
        case tax(TaxEvent)

        // Terminal events
        case terminal(TerminalEvent)

        // Test Helpers events
        case testHelpers(TestHelpersEvent)

        // Top-up events
        case topup(TopupEvent)

        // Transfer events
        case transfer(TransferEvent)

        // Unhandled events (for events we don't have specific handling for yet)
        case unhandled(Stripe.Events.Event)

        // MARK: - Event Sub-types

        public indirect enum PaymentIntentEvent: Codable, Hashable, Sendable {
            case succeeded(Stripe.PaymentIntents.PaymentIntent)
            case paymentFailed(Stripe.PaymentIntents.PaymentIntent)
            case created(Stripe.PaymentIntents.PaymentIntent)
            case canceled(Stripe.PaymentIntents.PaymentIntent)
            case processing(Stripe.PaymentIntents.PaymentIntent)
            case requiresAction(Stripe.PaymentIntents.PaymentIntent)
            case amountCapturableUpdated(Stripe.PaymentIntents.PaymentIntent)
            case partiallyFunded(Stripe.PaymentIntents.PaymentIntent)
        }

        public indirect enum ChargeEvent: Codable, Hashable, Sendable {
            case succeeded(Stripe.Charges.Charge)
            case failed(Stripe.Charges.Charge)
            case captured(Stripe.Charges.Charge)
            case refunded(Stripe.Charges.Charge)
            case updated(Stripe.Charges.Charge)
            case pending(Stripe.Charges.Charge)
            case expired(Stripe.Charges.Charge)
            case disputeCreated(Stripe.Charges.Charge)
            case disputeClosed(Stripe.Charges.Charge)
            case disputeFundsReinstated(Stripe.Charges.Charge)
            case disputeFundsWithdrawn(Stripe.Charges.Charge)
            case disputeUpdated(Stripe.Charges.Charge)
        }

        public indirect enum CustomerEvent: Codable, Hashable, Sendable {
            case created(Stripe.Customers.Customer)
            case updated(Stripe.Customers.Customer)
            case deleted(Stripe.Customers.Customer)
            case discountCreated(Stripe.Customers.Customer)
            case discountDeleted(Stripe.Customers.Customer)
            case discountUpdated(Stripe.Customers.Customer)
            case sourceCreated(Stripe.Customers.Customer)
            case sourceDeleted(Stripe.Customers.Customer)
            case sourceExpiring(Stripe.Customers.Customer)
            case sourceUpdated(Stripe.Customers.Customer)
            case subscriptionCreated(Stripe.Billing.Subscription)
            case subscriptionDeleted(Stripe.Billing.Subscription)
            case subscriptionPaused(Stripe.Billing.Subscription)
            case subscriptionPendingUpdateApplied(Stripe.Billing.Subscription)
            case subscriptionPendingUpdateExpired(Stripe.Billing.Subscription)
            case subscriptionResumed(Stripe.Billing.Subscription)
            case subscriptionTrialWillEnd(Stripe.Billing.Subscription)
            case subscriptionUpdated(Stripe.Billing.Subscription)
            case taxIdCreated(Stripe.Customers.Customer)
            case taxIdDeleted(Stripe.Customers.Customer)
            case taxIdUpdated(Stripe.Customers.Customer)
        }

        public indirect enum SubscriptionEvent: Codable, Hashable, Sendable {
            case created(Stripe.Billing.Subscription)
            case deleted(Stripe.Billing.Subscription)
            case paused(Stripe.Billing.Subscription)
            case pendingUpdateApplied(Stripe.Billing.Subscription)
            case pendingUpdateExpired(Stripe.Billing.Subscription)
            case resumed(Stripe.Billing.Subscription)
            case trialWillEnd(Stripe.Billing.Subscription)
            case updated(Stripe.Billing.Subscription)
        }

        public indirect enum InvoiceEvent: Codable, Hashable, Sendable {
            case created(Stripe.Billing.Invoice)
            case deleted(Stripe.Billing.Invoice)
            case finalizationFailed(Stripe.Billing.Invoice)
            case finalized(Stripe.Billing.Invoice)
            case markedUncollectible(Stripe.Billing.Invoice)
            case overdue(Stripe.Billing.Invoice)
            case paid(Stripe.Billing.Invoice)
            case paymentActionRequired(Stripe.Billing.Invoice)
            case paymentFailed(Stripe.Billing.Invoice)
            case paymentSucceeded(Stripe.Billing.Invoice)
            case sent(Stripe.Billing.Invoice)
            case upcoming(Stripe.Billing.Invoice)
            case updated(Stripe.Billing.Invoice)
            case voidInvoice(Stripe.Billing.Invoice)
            case willBeDue(Stripe.Billing.Invoice)
        }

        public indirect enum CheckoutSessionEvent: Codable, Hashable, Sendable {
            case asyncPaymentFailed(Stripe.Checkout.Session)
            case asyncPaymentSucceeded(Stripe.Checkout.Session)
            case completed(Stripe.Checkout.Session)
            case expired(Stripe.Checkout.Session)
        }

        public indirect enum SetupIntentEvent: Codable, Hashable, Sendable {
            case canceled(Stripe.Setup.Intent)
            case created(Stripe.Setup.Intent)
            case requiresAction(Stripe.Setup.Intent)
            case setupFailed(Stripe.Setup.Intent)
            case succeeded(Stripe.Setup.Intent)
        }

        public indirect enum PaymentMethodEvent: Codable, Hashable, Sendable {
            case attached(Stripe.PaymentMethods.PaymentMethod)
            case automaticallyUpdated(Stripe.PaymentMethods.PaymentMethod)
            case detached(Stripe.PaymentMethods.PaymentMethod)
            case updated(Stripe.PaymentMethods.PaymentMethod)
        }

        public indirect enum ProductEvent: Codable, Hashable, Sendable {
            case created(Stripe.Products.Product)
            case deleted(Stripe.Products.Product)
            case updated(Stripe.Products.Product)
        }

        public indirect enum PriceEvent: Codable, Hashable, Sendable {
            case created(Stripe.Products.Price)
            case deleted(Stripe.Products.Price)
            case updated(Stripe.Products.Price)
        }

        public indirect enum PayoutEvent: Codable, Hashable, Sendable {
            case canceled(Stripe.Payouts.Payout)
            case created(Stripe.Payouts.Payout)
            case failed(Stripe.Payouts.Payout)
            case paid(Stripe.Payouts.Payout)
            case reconciliationCompleted(Stripe.Payouts.Payout)
            case updated(Stripe.Payouts.Payout)
        }

        public indirect enum RefundEvent: Codable, Hashable, Sendable {
            case created(Stripe.Refunds.Refund)
            case updated(Stripe.Refunds.Refund)
        }

        public indirect enum PaymentLinkEvent: Codable, Hashable, Sendable {
            case created(Stripe.PaymentLink)
            case updated(Stripe.PaymentLink)
        }

        public indirect enum MandateEvent: Codable, Hashable, Sendable {
            case updated(Stripe.Mandates.Mandate)
        }

        public indirect enum AccountEvent: Codable, Hashable, Sendable {
            case applicationAuthorized(Stripe.Connect.Account)
            case applicationDeauthorized(Stripe.Connect.Account)
            case externalAccountCreated(Stripe.Connect.Account)
            case externalAccountDeleted(Stripe.Connect.Account)
            case externalAccountUpdated(Stripe.Connect.Account)
            case updated(Stripe.Connect.Account)
        }

        public indirect enum ApplicationFeeEvent: Codable, Hashable, Sendable {
            case created(Stripe.Connect.Application.Fee)
            case refunded(Stripe.Connect.Application.Fee)
            case refundUpdated(Stripe.Connect.Application.Fee.Refund)
        }

        public indirect enum BalanceEvent: Codable, Hashable, Sendable {
            case available(Stripe.Balance)
        }

        public indirect enum BillingPortalEvent: Codable, Hashable, Sendable {
            case configurationCreated(Stripe.Billing.Customer.Portal.Configuration)
            case configurationUpdated(Stripe.Billing.Customer.Portal.Configuration)
            case sessionCreated(Stripe.Billing.Customer.Portal.Session)
        }

        public indirect enum CapabilityEvent: Codable, Hashable, Sendable {
            case updated(Stripe.Connect.Capability)
        }

        public indirect enum CashBalanceEvent: Codable, Hashable, Sendable {
            case fundsAvailable(Stripe_Types_Models.CashBalance)
        }

        public indirect enum CouponEvent: Codable, Hashable, Sendable {
            case created(Stripe.Products.Coupon)
            case deleted(Stripe.Products.Coupon)
            case updated(Stripe.Products.Coupon)
        }

        public indirect enum CreditNoteEvent: Codable, Hashable, Sendable {
            case created(Stripe.Billing.Credit.Note)
            case updated(Stripe.Billing.Credit.Note)
            case voided(Stripe.Billing.Credit.Note)
        }

        public indirect enum DiscountEvent: Codable, Hashable, Sendable {
            case customerDiscountCreated(Stripe.Products.Discount)
            case customerDiscountDeleted(Stripe.Products.Discount)
            case customerDiscountUpdated(Stripe.Products.Discount)
        }

        public indirect enum FileEvent: Codable, Hashable, Sendable {
            case created(Stripe.Files.File)
        }

        public indirect enum FinancialConnectionsEvent: Codable, Hashable, Sendable {
            case accountCreated(FinancialConnections.Account)
            case accountDeactivated(FinancialConnections.Account)
            case accountDisconnected(FinancialConnections.Account)
            case accountReactivated(FinancialConnections.Account)
            case accountRefreshedBalance(FinancialConnections.Account)
        }

        public indirect enum IdentityEvent: Codable, Hashable, Sendable {
            case verificationSessionCanceled(Stripe_Types_Models.VerificationSession)
            case verificationSessionCreated(Stripe_Types_Models.VerificationSession)
            case verificationSessionProcessing(Stripe_Types_Models.VerificationSession)
            case verificationSessionRedacted(Stripe_Types_Models.VerificationSession)
            case verificationSessionRequiresInput(Stripe_Types_Models.VerificationSession)
            case verificationSessionVerified(Stripe_Types_Models.VerificationSession)
        }

        public indirect enum InvoiceItemEvent: Codable, Hashable, Sendable {
            case created(Stripe.Billing.Invoice.Item)
            case deleted(Stripe.Billing.Invoice.Item)
        }

        public indirect enum IssuingEvent: Codable, Hashable, Sendable {
            case authorizationCreated(Stripe_Types_Models.Authorization)
            case authorizationRequest(Stripe_Types_Models.Authorization)
            case authorizationUpdated(Stripe_Types_Models.Authorization)
            case cardCreated(Stripe_Types_Models.IssuingCard)
            case cardUpdated(Stripe_Types_Models.IssuingCard)
            case cardholderCreated(Stripe_Types_Models.Cardholder)
            case cardholderUpdated(Stripe_Types_Models.Cardholder)
            case disputeClosed(Stripe_Types_Models.IssuingDispute)
            case disputeCreated(Stripe_Types_Models.IssuingDispute)
            case disputeFundsReinstated(Stripe_Types_Models.IssuingDispute)
            case disputeSubmitted(Stripe_Types_Models.IssuingDispute)
            case disputeUpdated(Stripe_Types_Models.IssuingDispute)
            case transactionCreated(Stripe_Types_Models.Transaction)
            case transactionUpdated(Stripe_Types_Models.Transaction)
        }

        public indirect enum PersonEvent: Codable, Hashable, Sendable {
            case created(Stripe.Connect.Person)
            case deleted(Stripe.Connect.Person)
            case updated(Stripe.Connect.Person)
        }

        public indirect enum PlanEvent: Codable, Hashable, Sendable {
            case created(Stripe.Billing.Plan)
            case deleted(Stripe.Billing.Plan)
            case updated(Stripe.Billing.Plan)
        }

        public indirect enum PromotionCodeEvent: Codable, Hashable, Sendable {
            case created(Stripe_Types_Models.Promotion.Code)
            case updated(Stripe_Types_Models.Promotion.Code)
        }

        public indirect enum QuoteEvent: Codable, Hashable, Sendable {
            case accepted(Stripe.Billing.Quote)
            case canceled(Stripe.Billing.Quote)
            case created(Stripe.Billing.Quote)
            case finalized(Stripe.Billing.Quote)
        }

        public indirect enum RadarEvent: Codable, Hashable, Sendable {
            case earlyFraudWarningCreated(Stripe.Fraud.EarlyFraudWarnings.EarlyFraudWarning)
            case earlyFraudWarningUpdated(Stripe.Fraud.EarlyFraudWarnings.EarlyFraudWarning)
        }

        public indirect enum ReportingEvent: Codable, Hashable, Sendable {
            case reportRunFailed(Stripe_Types_Models.ReportRun)
            case reportRunSucceeded(Stripe_Types_Models.ReportRun)
            case reportTypeUpdated(Stripe_Types_Models.ReportType)
        }

        public indirect enum ReviewEvent: Codable, Hashable, Sendable {
            case closed(Stripe.Fraud.Reviews.Review)
            case opened(Stripe.Fraud.Reviews.Review)
        }

        public indirect enum SigmaEvent: Codable, Hashable, Sendable {
            case scheduledQueryRunCreated(Stripe_Types_Models.ScheduledQueryRun)
        }

        public indirect enum SourceEvent: Codable, Hashable, Sendable {
            case canceled(Stripe_Types_Models.Source)
            case chargeable(Stripe_Types_Models.Source)
            case failed(Stripe_Types_Models.Source)
            case mandateNotification(Stripe_Types_Models.Source)
            case refundAttributesRequired(Stripe_Types_Models.Source)
            case transactionCreated(Stripe_Types_Models.Source)
            case transactionUpdated(Stripe_Types_Models.Source)
        }

        public indirect enum SubscriptionScheduleEvent: Codable, Hashable, Sendable {
            case aborted(Stripe.Billing.Subscription.Schedule)
            case canceled(Stripe.Billing.Subscription.Schedule)
            case completed(Stripe.Billing.Subscription.Schedule)
            case created(Stripe.Billing.Subscription.Schedule)
            case expiring(Stripe.Billing.Subscription.Schedule)
            case released(Stripe.Billing.Subscription.Schedule)
            case updated(Stripe.Billing.Subscription.Schedule)
        }

        public indirect enum TaxEvent: Codable, Hashable, Sendable {
            case rateCreated(Stripe.Tax.Rate)
            case rateUpdated(Stripe.Tax.Rate)
        }

        public indirect enum TerminalEvent: Codable, Hashable, Sendable {
            case readerActionFailed(Stripe.Terminal.Readers.Reader)
            case readerActionSucceeded(Stripe.Terminal.Readers.Reader)
        }

        public indirect enum TestHelpersEvent: Codable, Hashable, Sendable {
            case testClockAdvancing(Stripe.Billing.TestClocks.TestClock)
            case testClockCreated(Stripe.Billing.TestClocks.TestClock)
            case testClockDeleted(Stripe.Billing.TestClocks.TestClock)
            case testClockInternalFailure(Stripe.Billing.TestClocks.TestClock)
            case testClockReady(Stripe.Billing.TestClocks.TestClock)
        }

        public indirect enum TopupEvent: Codable, Hashable, Sendable {
            case canceled(Stripe.Connect.TopUp)
            case created(Stripe.Connect.TopUp)
            case failed(Stripe.Connect.TopUp)
            case reversed(Stripe.Connect.TopUp)
            case succeeded(Stripe.Connect.TopUp)
        }

        public indirect enum TransferEvent: Codable, Hashable, Sendable {
            case created(Stripe.Connect.Transfer)
            case reversed(Stripe.Connect.Transfer)
            case updated(Stripe.Connect.Transfer)
        }
    }
}

extension Stripe.Events.Event.Typed {
    // MARK: - Initialization from Event

    /// Create a TypedEvent from an Event
    public init(from event: Stripe.Events.Event) {

        guard let type = event.type,
            let data = event.data?.object
        else {
            self = .unhandled(event)
            return
        }

        switch type {
        // Payment Intent events
        case .paymentIntentSucceeded:
            if case .paymentIntent(let paymentIntent) = data {
                self = .paymentIntent(.succeeded(paymentIntent))
                return
            }

        case .paymentIntentPaymentFailed:
            if case .paymentIntent(let paymentIntent) = data {
                self = .paymentIntent(.paymentFailed(paymentIntent))
                return
            }

        case .paymentIntentCreated:
            if case .paymentIntent(let paymentIntent) = data {
                self = .paymentIntent(.created(paymentIntent))
                return
            }

        case .paymentIntentCanceled:
            if case .paymentIntent(let paymentIntent) = data {
                self = .paymentIntent(.canceled(paymentIntent))
                return
            }

        case .paymentIntentProcessing:
            if case .paymentIntent(let paymentIntent) = data {
                self = .paymentIntent(.processing(paymentIntent))
                return
            }

        case .paymentIntentRequiresAction:
            if case .paymentIntent(let paymentIntent) = data {
                self = .paymentIntent(.requiresAction(paymentIntent))
                return
            }

        case .paymentIntentAmountCapturableUpdated:
            if case .paymentIntent(let paymentIntent) = data {
                self = .paymentIntent(.amountCapturableUpdated(paymentIntent))
                return
            }

        case .paymentIntentPartiallyFunded:
            if case .paymentIntent(let paymentIntent) = data {
                self = .paymentIntent(.partiallyFunded(paymentIntent))
                return
            }

        // Charge events
        case .chargeSucceeded:
            if case .charge(let charge) = data {
                self = .charge(.succeeded(charge))
                return
            }

        case .chargeFailed:
            if case .charge(let charge) = data {
                self = .charge(.failed(charge))
                return
            }

        case .chargeCaptured:
            if case .charge(let charge) = data {
                self = .charge(.captured(charge))
                return
            }

        case .chargeRefunded:
            if case .charge(let charge) = data {
                self = .charge(.refunded(charge))
                return
            }

        case .chargeUpdated:
            if case .charge(let charge) = data {
                self = .charge(.updated(charge))
                return
            }

        case .chargePending:
            if case .charge(let charge) = data {
                self = .charge(.pending(charge))
                return
            }

        case .chargeExpired:
            if case .charge(let charge) = data {
                self = .charge(.expired(charge))
                return
            }

        case .chargeDisputeCreated:
            if case .charge(let charge) = data {
                self = .charge(.disputeCreated(charge))
                return
            }

        case .chargeDisputeClosed:
            if case .charge(let charge) = data {
                self = .charge(.disputeClosed(charge))
                return
            }

        case .chargeDisputeFundsReinstated:
            if case .charge(let charge) = data {
                self = .charge(.disputeFundsReinstated(charge))
                return
            }

        case .chargeDisputeFundsWithdrawn:
            if case .charge(let charge) = data {
                self = .charge(.disputeFundsWithdrawn(charge))
                return
            }

        case .chargeDisputeUpdated:
            if case .charge(let charge) = data {
                self = .charge(.disputeUpdated(charge))
                return
            }

        // Customer events
        case .customerCreated:
            if case .customer(let customer) = data {
                self = .customer(.created(customer))
                return
            }

        case .customerUpdated:
            if case .customer(let customer) = data {
                self = .customer(.updated(customer))
                return
            }

        case .customerDeleted:
            if case .customer(let customer) = data {
                self = .customer(.deleted(customer))
                return
            }

        case .customerDiscountCreated:
            if case .customer(let customer) = data {
                self = .customer(.discountCreated(customer))
                return
            }

        case .customerDiscountDeleted:
            if case .customer(let customer) = data {
                self = .customer(.discountDeleted(customer))
                return
            }

        case .customerDiscountUpdated:
            if case .customer(let customer) = data {
                self = .customer(.discountUpdated(customer))
                return
            }

        case .customerSourceCreated:
            if case .customer(let customer) = data {
                self = .customer(.sourceCreated(customer))
                return
            }

        case .customerSourceDeleted:
            if case .customer(let customer) = data {
                self = .customer(.sourceDeleted(customer))
                return
            }

        case .customerSourceExpiring:
            if case .customer(let customer) = data {
                self = .customer(.sourceExpiring(customer))
                return
            }

        case .customerSourceUpdated:
            if case .customer(let customer) = data {
                self = .customer(.sourceUpdated(customer))
                return
            }

        case .customerSubscriptionCreated:
            if case .subscription(let subscription) = data {
                self = .customer(.subscriptionCreated(subscription))
                return
            }

        case .customerSubscriptionDeleted:
            if case .subscription(let subscription) = data {
                self = .customer(.subscriptionDeleted(subscription))
                return
            }

        case .customerSubscriptionPaused:
            if case .subscription(let subscription) = data {
                self = .customer(.subscriptionPaused(subscription))
                return
            }

        case .customerSubscriptionPendingUpdateApplied:
            if case .subscription(let subscription) = data {
                self = .customer(.subscriptionPendingUpdateApplied(subscription))
                return
            }

        case .customerSubscriptionPendingUpdateExpired:
            if case .subscription(let subscription) = data {
                self = .customer(.subscriptionPendingUpdateExpired(subscription))
                return
            }

        case .customerSubscriptionResumed:
            if case .subscription(let subscription) = data {
                self = .customer(.subscriptionResumed(subscription))
                return
            }

        case .customerSubscriptionTrialWillEnd:
            if case .subscription(let subscription) = data {
                self = .customer(.subscriptionTrialWillEnd(subscription))
                return
            }

        case .customerSubscriptionUpdated:
            if case .subscription(let subscription) = data {
                self = .customer(.subscriptionUpdated(subscription))
                return
            }

        case .customerTaxIdCreated:
            if case .customer(let customer) = data {
                self = .customer(.taxIdCreated(customer))
                return
            }

        case .customerTaxIdDeleted:
            if case .customer(let customer) = data {
                self = .customer(.taxIdDeleted(customer))
                return
            }

        case .customerTaxIdUpdated:
            if case .customer(let customer) = data {
                self = .customer(.taxIdUpdated(customer))
                return
            }

        // Invoice events
        case .invoiceCreated:
            if case .invoice(let invoice) = data {
                self = .invoice(.created(invoice))
                return
            }

        case .invoiceDeleted:
            if case .invoice(let invoice) = data {
                self = .invoice(.deleted(invoice))
                return
            }

        case .invoiceFinalizationFailed:
            if case .invoice(let invoice) = data {
                self = .invoice(.finalizationFailed(invoice))
                return
            }

        case .invoiceFinalized:
            if case .invoice(let invoice) = data {
                self = .invoice(.finalized(invoice))
                return
            }

        case .invoiceMarkedUncollectible:
            if case .invoice(let invoice) = data {
                self = .invoice(.markedUncollectible(invoice))
                return
            }

        case .invoiceOverdue:
            if case .invoice(let invoice) = data {
                self = .invoice(.overdue(invoice))
                return
            }

        case .invoicePaid:
            if case .invoice(let invoice) = data {
                self = .invoice(.paid(invoice))
                return
            }

        case .invoicePaymentActionRequired:
            if case .invoice(let invoice) = data {
                self = .invoice(.paymentActionRequired(invoice))
                return
            }

        case .invoicePaymentFailed:
            if case .invoice(let invoice) = data {
                self = .invoice(.paymentFailed(invoice))
                return
            }

        case .invoicePaymentSucceeded:
            if case .invoice(let invoice) = data {
                self = .invoice(.paymentSucceeded(invoice))
                return
            }

        case .invoicePaymentPaid:
            // Legacy event type - treat as payment succeeded
            if case .invoice(let invoice) = data {
                self = .invoice(.paymentSucceeded(invoice))
                return
            }

        case .invoiceSent:
            if case .invoice(let invoice) = data {
                self = .invoice(.sent(invoice))
                return
            }

        case .invoiceUpcoming:
            if case .invoice(let invoice) = data {
                self = .invoice(.upcoming(invoice))
                return
            }

        case .invoiceUpdated:
            if case .invoice(let invoice) = data {
                self = .invoice(.updated(invoice))
                return
            }

        case .invoiceVoided:
            if case .invoice(let invoice) = data {
                self = .invoice(.voidInvoice(invoice))
                return
            }

        case .invoiceWillBeDue:
            if case .invoice(let invoice) = data {
                self = .invoice(.willBeDue(invoice))
                return
            }

        // Checkout Session events
        case .checkoutSessionAsyncPaymentFailed:
            if case .checkoutSession(let checkoutSession) = data {
                self = .checkoutSession(.asyncPaymentFailed(checkoutSession))
                return
            }

        case .checkoutSessionAsyncPaymentSucceeded:
            if case .checkoutSession(let checkoutSession) = data {
                self = .checkoutSession(.asyncPaymentSucceeded(checkoutSession))
                return
            }

        case .checkoutSessionCompleted:
            if case .checkoutSession(let checkoutSession) = data {
                self = .checkoutSession(.completed(checkoutSession))
                return
            }

        case .checkoutSessionExpired:
            if case .checkoutSession(let checkoutSession) = data {
                self = .checkoutSession(.expired(checkoutSession))
                return
            }

        // Setup Intent events
        case .setupIntentCanceled:
            if case .setupIntent(let setupIntent) = data {
                self = .setupIntent(.canceled(setupIntent))
                return
            }

        case .setupIntentCreated:
            if case .setupIntent(let setupIntent) = data {
                self = .setupIntent(.created(setupIntent))
                return
            }

        case .setupIntentRequiresAction:
            if case .setupIntent(let setupIntent) = data {
                self = .setupIntent(.requiresAction(setupIntent))
                return
            }

        case .setupIntentSetupFailed:
            if case .setupIntent(let setupIntent) = data {
                self = .setupIntent(.setupFailed(setupIntent))
                return
            }

        case .setupIntentSucceeded:
            if case .setupIntent(let setupIntent) = data {
                self = .setupIntent(.succeeded(setupIntent))
                return
            }

        // Payment Method events
        case .paymentMethodAttached:
            if case .paymentMethod(let paymentMethod) = data {
                self = .paymentMethod(.attached(paymentMethod))
                return
            }

        case .paymentMethodAutomaticallyUpdated:
            if case .paymentMethod(let paymentMethod) = data {
                self = .paymentMethod(.automaticallyUpdated(paymentMethod))
                return
            }

        case .paymentMethodDetached:
            if case .paymentMethod(let paymentMethod) = data {
                self = .paymentMethod(.detached(paymentMethod))
                return
            }

        case .paymentMethodUpdated:
            if case .paymentMethod(let paymentMethod) = data {
                self = .paymentMethod(.updated(paymentMethod))
                return
            }

        // Product events
        case .productCreated:
            if case .product(let product) = data {
                self = .product(.created(product))
                return
            }

        case .productDeleted:
            if case .product(let product) = data {
                self = .product(.deleted(product))
                return
            }

        case .productUpdated:
            if case .product(let product) = data {
                self = .product(.updated(product))
                return
            }

        // Price events
        case .priceCreated:
            if case .price(let price) = data {
                self = .price(.created(price))
                return
            }

        case .priceDeleted:
            if case .price(let price) = data {
                self = .price(.deleted(price))
                return
            }

        case .priceUpdated:
            if case .price(let price) = data {
                self = .price(.updated(price))
                return
            }

        // Payout events
        case .payoutCanceled:
            if case .payout(let payout) = data {
                self = .payout(.canceled(payout))
                return
            }

        case .payoutCreated:
            if case .payout(let payout) = data {
                self = .payout(.created(payout))
                return
            }

        case .payoutFailed:
            if case .payout(let payout) = data {
                self = .payout(.failed(payout))
                return
            }

        case .payoutPaid:
            if case .payout(let payout) = data {
                self = .payout(.paid(payout))
                return
            }

        case .payoutReconciliationCompleted:
            if case .payout(let payout) = data {
                self = .payout(.reconciliationCompleted(payout))
                return
            }

        case .payoutUpdated:
            if case .payout(let payout) = data {
                self = .payout(.updated(payout))
                return
            }

        // Refund events
        case .refundCreated:
            if case .refund(let refund) = data {
                self = .refund(.created(refund))
                return
            }

        case .refundUpdated:
            if case .refund(let refund) = data {
                self = .refund(.updated(refund))
                return
            }

        // Payment Link events
        case .paymentLinkCreated:
            if case .paymentLink(let paymentLink) = data {
                self = .paymentLink(.created(paymentLink))
                return
            }

        case .paymentLinkUpdated:
            if case .paymentLink(let paymentLink) = data {
                self = .paymentLink(.updated(paymentLink))
                return
            }

        // Mandate events
        case .mandateUpdated:
            if case .mandate(let mandate) = data {
                self = .mandate(.updated(mandate))
                return
            }

        // Account events
        case .accountApplicationAuthorized:
            if case .account(let account) = data {
                self = .account(.applicationAuthorized(account))
                return
            }

        case .accountApplicationDeauthorized:
            if case .account(let account) = data {
                self = .account(.applicationDeauthorized(account))
                return
            }

        case .accountExternalAccountCreated:
            if case .account(let account) = data {
                self = .account(.externalAccountCreated(account))
                return
            }

        case .accountExternalAccountDeleted:
            if case .account(let account) = data {
                self = .account(.externalAccountDeleted(account))
                return
            }

        case .accountExternalAccountUpdated:
            if case .account(let account) = data {
                self = .account(.externalAccountUpdated(account))
                return
            }

        case .accountUpdated:
            if case .account(let account) = data {
                self = .account(.updated(account))
                return
            }

        // Application Fee events
        case .applicationFeeCreated:
            if case .applicationFee(let applicationFee) = data {
                self = .applicationFee(.created(applicationFee))
                return
            }

        case .applicationFeeRefunded:
            if case .applicationFee(let applicationFee) = data {
                self = .applicationFee(.refunded(applicationFee))
                return
            }

        case .applicationFeeRefundUpdated:
            if case .applicationFeeRefund(let applicationFeeRefund) = data {
                self = .applicationFee(.refundUpdated(applicationFeeRefund))
                return
            }

        // Balance events
        case .balanceAvailable:
            if case .balance(let balance) = data {
                self = .balance(.available(balance))
                return
            }

        // Billing Portal events
        case .billingPortalConfigurationCreated:
            if case .configuration(let configuration) = data {
                self = .billingPortal(.configurationCreated(configuration))
                return
            }

        case .billingPortalConfigurationUpdated:
            if case .configuration(let configuration) = data {
                self = .billingPortal(.configurationUpdated(configuration))
                return
            }

        case .billingPortalSessionCreated:
            if case .billingPortalSession(let billingPortalSession) = data {
                self = .billingPortal(.sessionCreated(billingPortalSession))
                return
            }

        // Capability events
        case .capabilityUpdated:
            if case .capability(let capability) = data {
                self = .capability(.updated(capability))
                return
            }

        // Cash Balance events
        case .cashBalanceFundsAvailable:
            if case .cashBalance(let cashBalance) = data {
                self = .cashBalance(.fundsAvailable(cashBalance))
                return
            }

        // Coupon events
        case .couponCreated:
            if case .coupon(let coupon) = data {
                self = .coupon(.created(coupon))
                return
            }

        case .couponDeleted:
            if case .coupon(let coupon) = data {
                self = .coupon(.deleted(coupon))
                return
            }

        case .couponUpdated:
            if case .coupon(let coupon) = data {
                self = .coupon(.updated(coupon))
                return
            }

        // Credit Note events
        case .creditNoteCreated:
            if case .creditNote(let creditNote) = data {
                self = .creditNote(.created(creditNote))
                return
            }

        case .creditNoteUpdated:
            if case .creditNote(let creditNote) = data {
                self = .creditNote(.updated(creditNote))
                return
            }

        case .creditNoteVoided:
            if case .creditNote(let creditNote) = data {
                self = .creditNote(.voided(creditNote))
                return
            }

        // File events
        case .fileCreated:
            if case .file(let file) = data {
                self = .file(.created(file))
                return
            }

        // Financial Connections events - FinancialConnections.Account type is not available in Event.Object, fallback to unhandled
        case .financialConnectionsAccountCreated,
            .financialConnectionsAccountDeactivated,
            .financialConnectionsAccountDisconnected,
            .financialConnectionsAccountReactivated,
            .financialConnectionsAccountRefreshedBalance:
            self = .unhandled(event)

        // Identity Verification events
        case .identityVerificationSessionCanceled:
            if case .verificationSession(let verificationSession) = data {
                self = .identity(.verificationSessionCanceled(verificationSession))
                return
            }

        case .identityVerificationSessionCreated:
            if case .verificationSession(let verificationSession) = data {
                self = .identity(.verificationSessionCreated(verificationSession))
                return
            }

        case .identityVerificationSessionProcessing:
            if case .verificationSession(let verificationSession) = data {
                self = .identity(.verificationSessionProcessing(verificationSession))
                return
            }

        case .identityVerificationSessionRedacted:
            if case .verificationSession(let verificationSession) = data {
                self = .identity(.verificationSessionRedacted(verificationSession))
                return
            }

        case .identityVerificationSessionRequiresInput:
            if case .verificationSession(let verificationSession) = data {
                self = .identity(.verificationSessionRequiresInput(verificationSession))
                return
            }

        case .identityVerificationSessionVerified:
            if case .verificationSession(let verificationSession) = data {
                self = .identity(.verificationSessionVerified(verificationSession))
                return
            }

        // Invoice Item events
        case .invoiceitemCreated:
            if case .invoiceItem(let invoiceItem) = data {
                self = .invoiceItem(.created(invoiceItem))
                return
            }

        case .invoiceitemDeleted:
            if case .invoiceItem(let invoiceItem) = data {
                self = .invoiceItem(.deleted(invoiceItem))
                return
            }

        // Issuing events
        case .issuingAuthorizationCreated:
            if case .issuingAuthorization(let issuingAuthorization) = data {
                self = .issuing(.authorizationCreated(issuingAuthorization))
                return
            }

        case .issuingAuthorizationRequest:
            if case .issuingAuthorization(let issuingAuthorization) = data {
                self = .issuing(.authorizationRequest(issuingAuthorization))
                return
            }

        case .issuingAuthorizationUpdated:
            if case .issuingAuthorization(let issuingAuthorization) = data {
                self = .issuing(.authorizationUpdated(issuingAuthorization))
                return
            }

        case .issuingCardCreated:
            if case .issuingCard(let issuingCard) = data {
                self = .issuing(.cardCreated(issuingCard))
                return
            }

        case .issuingCardUpdated:
            if case .issuingCard(let issuingCard) = data {
                self = .issuing(.cardUpdated(issuingCard))
                return
            }

        case .issuingCardholderCreated:
            if case .issuingCardHolder(let issuingCardHolder) = data {
                self = .issuing(.cardholderCreated(issuingCardHolder))
                return
            }

        case .issuingCardholderUpdated:
            if case .issuingCardHolder(let issuingCardHolder) = data {
                self = .issuing(.cardholderUpdated(issuingCardHolder))
                return
            }

        case .issuingDisputeClosed:
            if case .issuingDispute(let issuingDispute) = data {
                self = .issuing(.disputeClosed(issuingDispute))
                return
            }

        case .issuingDisputeCreated:
            if case .issuingDispute(let issuingDispute) = data {
                self = .issuing(.disputeCreated(issuingDispute))
                return
            }

        case .issuingDisputeFundsReinstated:
            if case .issuingDispute(let issuingDispute) = data {
                self = .issuing(.disputeFundsReinstated(issuingDispute))
                return
            }

        case .issuingDisputeSubmitted:
            if case .issuingDispute(let issuingDispute) = data {
                self = .issuing(.disputeSubmitted(issuingDispute))
                return
            }

        case .issuingDisputeUpdated:
            if case .issuingDispute(let issuingDispute) = data {
                self = .issuing(.disputeUpdated(issuingDispute))
                return
            }

        case .issuingTransactionCreated:
            if case .issuingTransaction(let issuingTransaction) = data {
                self = .issuing(.transactionCreated(issuingTransaction))
                return
            }

        case .issuingTransactionUpdated:
            if case .issuingTransaction(let issuingTransaction) = data {
                self = .issuing(.transactionUpdated(issuingTransaction))
                return
            }

        // Person events
        case .personCreated:
            if case .person(let person) = data {
                self = .person(.created(person))
                return
            }

        case .personDeleted:
            if case .person(let person) = data {
                self = .person(.deleted(person))
                return
            }

        case .personUpdated:
            if case .person(let person) = data {
                self = .person(.updated(person))
                return
            }

        // Plan events
        case .planCreated:
            if case .plan(let plan) = data {
                self = .plan(.created(plan))
                return
            }

        case .planDeleted:
            if case .plan(let plan) = data {
                self = .plan(.deleted(plan))
                return
            }

        case .planUpdated:
            if case .plan(let plan) = data {
                self = .plan(.updated(plan))
                return
            }

        // Promotion Code events
        case .promotionCodeCreated:
            if case .promotionCode(let promotionCode) = data {
                self = .promotionCode(.created(promotionCode))
                return
            }

        case .promotionCodeUpdated:
            if case .promotionCode(let promotionCode) = data {
                self = .promotionCode(.updated(promotionCode))
                return
            }

        // Quote events
        case .quoteAccepted:
            if case .quote(let quote) = data {
                self = .quote(.accepted(quote))
                return
            }

        case .quoteCanceled:
            if case .quote(let quote) = data {
                self = .quote(.canceled(quote))
                return
            }

        case .quoteCreated:
            if case .quote(let quote) = data {
                self = .quote(.created(quote))
                return
            }

        case .quoteFinalized:
            if case .quote(let quote) = data {
                self = .quote(.finalized(quote))
                return
            }

        // Radar events
        case .radarEarlyFraudWarningCreated:
            if case .earlyFraudWarning(let earlyFraudWarning) = data {
                self = .radar(.earlyFraudWarningCreated(earlyFraudWarning))
                return
            }

        case .radarEarlyFraudWarningUpdated:
            if case .earlyFraudWarning(let earlyFraudWarning) = data {
                self = .radar(.earlyFraudWarningUpdated(earlyFraudWarning))
                return
            }

        // Reporting events
        case .reportingReportRunFailed:
            if case .reportRun(let reportRun) = data {
                self = .reporting(.reportRunFailed(reportRun))
                return
            }

        case .reportingReportRunSucceeded:
            if case .reportRun(let reportRun) = data {
                self = .reporting(.reportRunSucceeded(reportRun))
                return
            }

        case .reportingReportTypeUpdated:
            if case .reportType(let reportType) = data {
                self = .reporting(.reportTypeUpdated(reportType))
                return
            }

        // Review events
        case .reviewClosed:
            if case .review(let review) = data {
                self = .review(.closed(review))
                return
            }

        case .reviewOpened:
            if case .review(let review) = data {
                self = .review(.opened(review))
                return
            }

        //            // Sigma events
        case .sigmaScheduledQueryRunCreated:
            if case .scheduledQueryRun(let scheduledQueryRun) = data {
                self = .sigma(.scheduledQueryRunCreated(scheduledQueryRun))
                return
            }
        //
        // Source events - Source type is not available in Event.Object, fallback to unhandled
        case .sourceCanceled,
            .sourceChargeable,
            .sourceFailed,
            .sourceMandateNotification,
            .sourceRefundAttributesRequired,
            .sourceTransactionCreated,
            .sourceTransactionUpdated:
            self = .unhandled(event)

        // Subscription Schedule events
        case .subscriptionScheduleAborted:
            if case .subscriptionSchedule(let subscriptionSchedule) = data {
                self = .subscriptionSchedule(.aborted(subscriptionSchedule))
                return
            }

        case .subscriptionScheduleCanceled:
            if case .subscriptionSchedule(let subscriptionSchedule) = data {
                self = .subscriptionSchedule(.canceled(subscriptionSchedule))
                return
            }

        case .subscriptionScheduleCompleted:
            if case .subscriptionSchedule(let subscriptionSchedule) = data {
                self = .subscriptionSchedule(.completed(subscriptionSchedule))
                return
            }

        case .subscriptionScheduleCreated:
            if case .subscriptionSchedule(let subscriptionSchedule) = data {
                self = .subscriptionSchedule(.created(subscriptionSchedule))
                return
            }

        case .subscriptionScheduleExpiring:
            if case .subscriptionSchedule(let subscriptionSchedule) = data {
                self = .subscriptionSchedule(.expiring(subscriptionSchedule))
                return
            }

        case .subscriptionScheduleReleased:
            if case .subscriptionSchedule(let subscriptionSchedule) = data {
                self = .subscriptionSchedule(.released(subscriptionSchedule))
                return
            }

        case .subscriptionScheduleUpdated:
            if case .subscriptionSchedule(let subscriptionSchedule) = data {
                self = .subscriptionSchedule(.updated(subscriptionSchedule))
                return
            }

        // Tax events
        case .taxRateCreated:
            if case .taxRate(let taxRate) = data {
                self = .tax(.rateCreated(taxRate))
                return
            }

        case .taxRateUpdated:
            if case .taxRate(let taxRate) = data {
                self = .tax(.rateUpdated(taxRate))
                return
            }

        //            // Terminal events
        case .terminalReaderActionFailed:
            if case .reader(let reader) = data {
                self = .terminal(.readerActionFailed(reader))
                return
            }
        //
        case .terminalReaderActionSucceeded:
            if case .reader(let reader) = data {
                self = .terminal(.readerActionSucceeded(reader))
                return
            }
        //
        //            // Test Helpers events
        case .testHelpersTestClockAdvancing:
            if case .testClock(let testClock) = data {
                self = .testHelpers(.testClockAdvancing(testClock))
                return
            }

        case .testHelpersTestClockCreated:
            if case .testClock(let testClock) = data {
                self = .testHelpers(.testClockCreated(testClock))
                return
            }

        case .testHelpersTestClockDeleted:
            if case .testClock(let testClock) = data {
                self = .testHelpers(.testClockDeleted(testClock))
                return
            }

        case .testHelpersTestClockInternalFailure:
            if case .testClock(let testClock) = data {
                self = .testHelpers(.testClockInternalFailure(testClock))
                return
            }

        case .testHelpersTestClockReady:
            if case .testClock(let testClock) = data {
                self = .testHelpers(.testClockReady(testClock))
                return
            }

        //             Top-up events
        case .topupCanceled:
            if case .topup(let topup) = data {
                self = .topup(.canceled(topup))
                return
            }

        case .topupCreated:
            if case .topup(let topup) = data {
                self = .topup(.created(topup))
                return
            }

        case .topupFailed:
            if case .topup(let topup) = data {
                self = .topup(.failed(topup))
                return
            }

        case .topupReversed:
            if case .topup(let topup) = data {
                self = .topup(.reversed(topup))
                return
            }

        case .topupSucceeded:
            if case .topup(let topup) = data {
                self = .topup(.succeeded(topup))
                return
            }

        // Transfer events
        case .transferCreated:
            if case .transfer(let transfer) = data {
                self = .transfer(.created(transfer))
                return
            }

        case .transferReversed:
            if case .transfer(let transfer) = data {
                self = .transfer(.reversed(transfer))
                return
            }

        case .transferUpdated:
            if case .transfer(let transfer) = data {
                self = .transfer(.updated(transfer))
                return
            }

        case .billingAlertTriggered:
            self = .unhandled(event)
            return

        case .chargeRefundUpdated:
            self = .unhandled(event)
            return

        case .customerCashBalanceTransactionCreated:
            self = .unhandled(event)
            return

        case .unknownEvent:
            self = .unhandled(event)
            return

        }
        self = .unhandled(event)
        return
    }
}
