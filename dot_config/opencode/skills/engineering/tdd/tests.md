# Good and Bad Tests

## Beck's Test Desiderata

Good tests are:

- **Isolated** — don't affect each other
- **Composable** — properties combine cleanly
- **Deterministic** — same input, same result
- **Fast** — quick feedback
- **Writable** — cheap to author
- **Readable** — clear intent
- **Behavioral** — sensitive to behavior changes, not implementation
- **Structure-insensitive** — survive refactors
- **Automated** — no manual steps
- **Specific** — failure points to cause
- **Predictive** — pass means code works
- **Inspiring** — confidence on green

## Good Tests

```java
// GOOD: Tests observable behavior
// Behavioral, Structure-insensitive, Readable, Specific
@DisplayName("User can checkout with valid cart")
void userCanCheckoutWithValidCart () {
    var cart = createCart();
    cart.add(product);

    var result = checkout(cart, paymentMethod);

    assertThat(result.status).isEqualTo(OrderStatus.CONFIRMED);
}
```

## Bad Tests

```java
// BAD: Tests implementation details
// Violates: Behavioral, Structure-insensitive, Specific
@DisplayName("Checkout calls paymentService.process")
void checkoutCallsPaymentServiceProcess () {
    var mockPayment = mock(PaymentService.class);

    checkout(cart, payment);

    verify(mockPayment).process(eq(cart.total));
}
```

```java
// BAD: Bypasses interface to verify
// Violates: Behavioral, Structure-insensitive, Readable
@DisplayName("CreateUser saves to database")
void createUserSavesToDatabase () {
    createUser("Alice");

    var row = db.query("SELECT * FROM users WHERE name = %s".formatted("Alice"));

    assertThat(row).isNotNull();
}

// GOOD: Verifies through interface
// Behavioral, Structure-insensitive, Readable
@DisplayName("CreateUser makes user retrievable")
void createUserMakesUserRetrievable () {
    var user = createUser("Alice");

    var retrieved = getUser(user.id);

    assertThat(retrieved.name).isEqualTo("Alice");
}
```
