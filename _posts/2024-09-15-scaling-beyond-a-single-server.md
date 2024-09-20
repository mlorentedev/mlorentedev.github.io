---
layout: post
title: Scaling Beyond a Single Server
date: "2024-09-15"
categories: 
  - "System Design"
  - "Architecture"
tags: 
  - "system design"
  - "architecture"
lang: en
lang-ref: intro
---

In this post, I will discuss how to build a system from scratch that supports a single user and gradually scales to support one million users.

### Single server architecture

When you are starting a new project, you typically start with a single server architecture. This architecture is simple to set up and easy to maintain but everything is running on one server: web app, database, cache, etc.

To understand how the single server architecture works, let's take a look at the following diagram and the request flow:

<div align="center">
    <img src="/assets/img/2024-09-15/single-server.png" alt="single server architecture" width="380" height="232">
</div>

 1. The user access the site through domain names, e.g., `api.fullengineer.net` or `www.fullengineer.net`. Usually, the Domain Name System (DNS) is a paid service provided by a third party.

 2. IP address of the server is resolved by the DNS server and returned to the client.

 3. Hypertext Transfer Protocol (HTTP) request is sent to the server.

 4. The server processes the request and sends back the response to the client.

The traffic source depends on web application or mobile application. Web application uses a combination of server-side languages like PHP, Ruby, Python, etc., and client-side languages like HTML, CSS, and JavaScript. Mobile application uses a combination of server-side languages like Java, Swift, Kotlin, etc., and client-side languages like React Native, Flutter, etc.

In general the communication process is the same for both web and mobile applications and the data received is in Javascript Object Notation (JSON) format. Here is an example of a JSON response:

```json
{
  "id": 1,
  "name": "Manu",
  "email": "manu@fullengineer.net"
}
```

### Adding a database

With the growth of the user base, the single server architecture will not be able to handle the load. To scale the system, we need multiple servers. The first step is to move the database to a separate server. This architecture is called a two-tier architecture allowing them to scale independently.

<div align="center">
    <img src="/assets/img/2024-09-15/two-tier.png" alt="two-tier architecture" width="421" height="231">
</div>

Now the thing is which database to choose. There are two types of databases: SQL and NoSQL. SQL databases are good for complex queries and transactions since the represent and store data in tables and rows, where we can perform join operations using SQL accross diferent tables.The most popular SQL databases are MySQL, PostgreSQL, and Oracle. NoSQL databases are good for large amounts of data and are horizontally scalable and they are grouped into four categories: key-value stores, document stores, column-family stores, and graph databases. Where joins are not possible and data is stored in a non-tabular format. The most popular NoSQL databases are MongoDB, Cassandra, and Redis.

Usually the choice of database depends on the type of data and the type of queries that need to be performed. For example, if the data is structured and the queries are complex, then SQL databases are a good choice. On the other hand, non-relationa databases might be a good choice if:

- The data is unstructured or semi-structured.
- The application requires super-low latency.
- The application needs to handle a huge amount of data and traffic.
- The application only needs to serialize and deserialize data such us JSON, XML, YAML, etc.

We will talk about scaling: vertical and horizontal scaling. Vertical scaling is adding more resources to a single server, such as CPU, memory, storage, etc. But has the limitation of the hardware and does not have redundancy for high availability. So if the server goes down, the whole system goes down. Horizontal scaling is adding more servers to the system, such as load balancers, web servers, database servers, etc. It has redundancy for high availability and can handle more traffic.

### Adding a load-balancer

Once we definitely need to scale the system, we need to add a load balancer to distribute the incoming traffic across multiple servers. This architecture is called a three-tier architecture.

With this setup, web servers are not reachable anymore from the client side. The client communicates with the load balancer, which then forwards the request to one of the web servers. The web server processes the request and sends back the response to the client through the load balancer.

- If server 1 is down, the load balancer will forward the request to server 2. This is called high availability. We need to incluse a new healthy web server to pool to balance the load.
- If the traffic increases, we can add more web servers to the pool. This is called horizontal scaling.

<div align="center">
    <img src="/assets/img/2024-09-15/three-tier.png" alt="three-tier architecture" width="371" height="332">
</div>

### Database replication

The best way to achieve high availability for the database is to replicate it. Database replication is the process of copying data from one database to another database. The primary database is called the master database, which is responsible for writing data. The secondary database is called the slave database, which is responsible for reading data.

Most applications require a much higher ratio or reads to writes. This, the number of slaves databases is usually larger than the number of master databases.

<div align="center">
    <img src="/assets/img/2024-09-15/databases-replication.png" alt="database replication" width="416" height="375">
</div>

This model improves performance because more queries can be processed in parallel. It also improves fault tolerance because if the master database goes down, one of the slave databases can be promoted to the master database.

In production systems, promoting a new master is more complicated as the data in a slave database is not always up-to-date with the data in the master database. To solve this problem, we can use a distributed database like Cassandra, which is designed to handle large amounts of data across many commodity servers, providing high availability and fault tolerance.

Let's see how the system is working now:

1. A user gets the IP address of the load balancer from DNS.

2. The user ocnnects to load balancer with this IP address.

3. The load balancer forwards the HTTP request to one of the web servers.

4. The web server reads user data from a slave database.

5. The web server routes data-modyfing requests to the master database.

Now it is time to improve the load/response time of the system.

<div align="center">
    <img src="/assets/img/2024-09-15/three-tier-with-database-replication.png" alt="three-tier architecture with database replication" width="391" height="477">
</div>

### Adding a cache

A cache is a temporary storage that stores frequently accessed data. It is used to reduce the load on the database and improve the response time of the system.

After receiving a request, the web server checks the cache first. If the data is found in the cache, the web server returns the data to the client. If the data is not found in the cache, the web server reads the data from the database, stores it in the cache, and then returns the data to the client.

There are few consideration fo r using a cache:

- When to use a cache: Use a cache when the data is read frequently and the data is not updated frequently.

- Expiration policy: Set an expiration time for the data in the cache. This is to ensure that the data in the cache is not stale.

- Consistency: Make sure that the data in the cache is consistent with the data in the database. When the data in the database is updated, the data in the cache should be invalidated.

- Cache eviction policy: When the cache is full, the cache needs to evict some data to make room for new data. There are several cache eviction policies, such as Least Recently Used (LRU), Least Frequently Used (LFU), and First In First Out (FIFO).

- Mitigation failures: When the cache is down, the web server should still be able to serve the request. One way to achieve this is to use a write-through cache, where the web server writes the data to the cache and the database at the same time.

### Content Delivery Network (CDN)

a CDN is a network of servers distributed geographically that store cached content. It is used to reduce the load on the web server and improve the response time of the system.

When a user requests a file, the CDN checks if the file is in the cache. If the file is found in the cache, the CDN returns the file to the user. If the file is not found in the cache, the CDN requests the file from the web server, stores it in the cache with a HTTP heate Time-to-Live (TTL) describing how long the file is cached, and then returns the file to the user.

<div align="center">
    <img src="/assets/img/2024-09-15/content-delivery-network.png" alt="content delivery network" width="475" height="219">
</div>

The main constraint of the CDN is the cost since they are run by third-party companies and they charge based on the amount of data transferred. Also is importanto to set an appropriate TTL to avoid serving stale data even prepare some strategy when the CDN is down.

Below is the final architecture of the system where static assets (JS, CSS, images, etc.) are served by the CDN and dynamic content is served by the web server while the database liad is ligthened by caching the data.

<div align="center">
    <img src="/assets/img/2024-09-15/three-tier-with-database-replication-and-cache.png" alt="final architecture" width="570" height="476">
</div>

### Stateless web tier