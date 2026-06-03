# Good and Bad Tests

## Good Tests

**Integration-style**: Test through real interfaces, not mocks of internal parts.

```java
// GOOD: Tests observable behavior
@DisplayName("User can checkout with valid cart")
void userCanCheckoutWithValidCart () {
    var cart = createCart();
    cart.add(product);

    var result = checkout(cart, paymentMethod);

    assertThat(result.status).isEqualTo(OrderStatus.CONFIRMED);
}
```

Characteristics:

- Tests behavior users/callers care about
- Uses public API only
- Survives internal refactors
- Describes WHAT, not HOW
- One logical assertion per test

## Bad Tests

**Implementation-detail tests**: Coupled to internal structure.

```java
// BAD: Tests implementation details
@DisplayName("Checkout calls paymentService.process")
void checkoutCallsPaymentServiceProcess () {
    var mockPayment = mock(PaymentService.class);

    checkout(cart, payment);

    verify(mockPayment).process(eq(cart.total));
}
```

Red flags:

- Mocking internal collaborators
- Testing private methods
- Asserting on call counts/order
- Test breaks when refactoring without behavior change
- Test name describes HOW not WHAT
- Verifying through external means instead of interface

```java
// BAD: Bypasses interface to verify
@DisplayName("CreateUser saves to database")
void checkoutCallsPaymentServiceProcess () {
    createUser("Alice");

    var row = db.query("SELECT * FROM users WHERE name = %s".formatted("Alice"));

    expect(row).toBeDefined();
}

// GOOD: Verifies through interface
@DisplayName("CreateUser makes user retrievable")
void checkoutCallsPaymentServiceProcess () {
    var user = createUser("Alice");

    var retrieved = getUser(user.id);

    assertThat(retrieved.name).isEqualTo("Alice");
}
```
