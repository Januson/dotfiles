# When to Mock

Mock at **system boundaries** only:

- External APIs (payment, email, etc.)
- Databases (sometimes - prefer test DB)
- Time/randomness
- File system (sometimes)

Don't mock:

- Your own classes/modules
- Internal collaborators
- Anything you control

## Designing for Mockability

At system boundaries, design interfaces that are easy to mock:

**1. Use dependency injection**

Pass external dependencies in rather than creating them internally:

```java
// Easy to mock
public Payment processPayment(Order order, PaymentClient paymentClient) {
    return paymentClient.charge(order.total);
}

// Hard to mock
public Payment processPayment(Order order) {
    var client = new PaypalClient();
    return client.charge(order.total);
}
```

**2. Prefer SDK-style interfaces over generic fetchers**

Create specific functions for each external operation instead of one generic function with conditional logic:

```java
// GOOD: Each function is independently mockable
interface Api {
    User getUser(UUID id);
    List<Order> getOrders(UUID userId);
    Order createOrder(OrderData data);
}

// BAD: Mocking requires conditional logic inside the mock
interface Api {
    Response fetch(Endpoint endpoint, Options options);
}
```

The SDK approach means:

- Each mock returns one specific shape
- No conditional logic in test setup
- Easier to see which endpoints a test exercises
- Type safety per endpoint
