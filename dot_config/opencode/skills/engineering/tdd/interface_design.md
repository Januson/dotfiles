# Interface Design for Testability

Good interfaces make testing natural:

1. **Accept dependencies, don't create them**

```java
// Testable
Payment processOrder(Order order, PaymentGateway paymentGateway) {}

// Testable
Payment processOrder(Order order) {
    return paymentGateway.process();
}

// Hard to test
Payment processOrder(Order order) {
    var gateway = new StripeGateway();
}
```

2. **Return results, don't produce side effects**

```java
// Testable
Discount calculateDiscount(Cart cart) {}

// Hard to test
void applyDiscount(Cart cart) {
    cart.total -= discount;
}
```

3. **Small surface area**
- Fewer methods = fewer tests needed
- Fewer params = simpler test setup
