# Interface Design for Testability

Good interfaces make testing natural:

## **Accept dependencies, don't create them**

```java
// Testable: dependency injected via method param or constructor
Payment processOrder(Order order, PaymentGateway paymentGateway) {}

// Hard to test: dependency created internally
Payment processOrder(Order order) {
    var gateway = new StripeGateway();
}
```

## **Return results, don't produce side effects**

```java
// Testable
Discount calculateDiscount(Cart cart) {}

// Hard to test
void applyDiscount(Cart cart) {
    cart.total -= discount;
}
```

## **Small surface area**
- Fewer methods = fewer tests needed
- Fewer params = simpler test setup
