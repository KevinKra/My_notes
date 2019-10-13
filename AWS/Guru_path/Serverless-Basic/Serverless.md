# Serverless

## What is Serverless?

- Leveraging FaaS technologies like Lamba, we are able to create serverless functions that only cost us money when the code is called. This is the fundamental aspect of lamba where we don't need to have EC2 instances idling while inactive. It is a huge step forward for cloud compute. You cannot under-provision or over-provision S3, the same rules apply to Lamba.
- Function is the unit of scale.

### Five Principles of Serverless

- Use a compute service to execute code on demand.
- Write single-purpose stateless functions.
- Design push-based, event-driven pipelines.
- Create thicker, more powerful front ends.
- Embrace third party services.

#### Pros

- No servers
- Versatile
- Scalable
- Manageable migration
- Low cost
- Less code

#### Cons

- Public Cloud (mission critical applications should not be based on it.)
- Reliance on Service Level Agreements (SLA)
- Limited customization
- Vendor lock-in
- Decentralized challenges

---

### Compute as a Backend

> I may update these with details eventually ...

- Command pattern
- Messaging pattern
- Priority queue pattern
- Fan-out pattern
- Pipes and filters pattern
