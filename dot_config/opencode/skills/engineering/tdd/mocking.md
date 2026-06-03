# When to Mock

Mock at **system boundaries** only: external APIs, databases (prefer test DB), time/randomness, file system.

Don't mock your own classes, internal collaborators, or anything you control.

## Prefer SDK-style interfaces over generic fetchers

```java
// GOOD: Each function independently mockable
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
