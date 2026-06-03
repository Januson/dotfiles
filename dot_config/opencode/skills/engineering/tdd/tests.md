# Good and Bad Tests

## Beck's Test Desiderata

Isolated · Composable · Deterministic · Fast · Writable · Readable · Behavioral · Structure-insensitive · Automated · Specific · Predictive · Inspiring

## Good vs Bad

```java
// BAD: Tests implementation — violates Behavioral, Structure-insensitive, Specific
@DisplayName("Checkout calls paymentService.process")
void checkoutCallsPaymentServiceProcess() {
    var mockPayment = mock(PaymentService.class);
    checkout(cart, payment);
    verify(mockPayment).process(eq(cart.total));
}

// GOOD: Tests observable behavior — Behavioral, Structure-insensitive, Readable, Specific
@DisplayName("User can checkout with valid cart")
void userCanCheckoutWithValidCart() {
    var cart = createCart();
    cart.add(product);
    var result = checkout(cart, paymentMethod);
    assertThat(result.status).isEqualTo(OrderStatus.CONFIRMED);
}
```
