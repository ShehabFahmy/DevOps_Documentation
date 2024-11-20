When designing a system or applications, its important for teams to set specific measurable targets/goals to help organizations strike the right balance between product development and operation work.
These targets help customers & end users quantify the level of reliability they
should come to expect from a service.
- Example:
  *"Application should have 97% uptime in a rolling 30 day window"*
## Service Level Indicator (SLI)
- Quantitative measure of some aspect of the level of service that is provided.
- Common SLIs:
  - Request Latency
  - Error Rate
  - Saturation
  - Throughput
  - Availability
- Not all metrics make for good SLIs. You want to find metrics that accurately measure a user’s experience.
- Things like high-cpu/high-memory make for a poor SLI as a user might not see any impact on their end during these events.
## Service Level Object (SLO)
- Target value or range for an SLI.
- Example:

|     SLI      |       SLO       |
| :----------: | :-------------: |
|   Latency    | Latency < 100ms |
| Availability |  99.9% uptime   |
- SLOs should be directly related to the customer experience. The main purpose of the SLO is to quantify reliability of a product to a customer.
## Service Level Agreement (SLA)
- Contract between a vendor and a user that guarantees a certain SLO.
- The consequences for not meeting any SLO can be financial based but can also be variety of other things as well.