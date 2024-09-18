---
layout: post
title: Scaling from zero to one million users
date: "2024-09-15"
categories: 
  - "System Design"
tags: 
  - "system design"
lang: en
lang-ref: intro
---

## Scaling from zero to one million users

In this post, I will discuss how to build a system from scratch that supports a single user and gradually scales to support one million users. I will use a classic example of a social networking site called **buiter** to illustrate the key concepts.

### Single server architecture

When you are starting a new project, you typically start with a single server architecture. This architecture is simple to set up and easy to maintain but everything is running on one server: web app, database, cache, etc. 

To understand how the single server architecture works, let's take a look at the following diagram and the request flow:

<div align="center">
    <img src="/assets/img/2024-09-15/single-server.png" alt="single server architecture" width="300" height="183">
</div>

 1. The user access the site through domain names, e.g., `api.buiter.com` or `www.buiter.com`. Usuallu, the Domain Name System (DNS) is a paid service provided by a third party.

 2. IP address of the server is resolved by the DNS server and returned to the client.

 3. Hypertext Transfer Protocol (HTTP) request is sent to the server.

 4. The server processes the request and sends back the response to the client.

The traffic source depends on web application or mobile application. Web application uses a combination of server-side languages like PHP, Ruby, Python, etc., and client-side languages like HTML, CSS, and JavaScript. Mobile application uses a combination of server-side languages like Java, Swift, Kotlin, etc., and client-side languages like React Native, Flutter, etc.

In general the communication process is the same for both web and mobile applications and the data received is in Javascript Object Notation (JSON) format. Here is an example of a JSON response:

```json
{
  "id": 1,
  "name": "Alice",
  "email": "alice@buiter.com"
}
```

### Adding a database

With the growth of the user base, the single server architecture will not be able to handle the load. To scale the system, we need multiple servers. The first step is to move the database to a separate server. This architecture is called a two-tier architecture allowing them to scale independently.

<div align="center">
    <img src="/assets/img/2024-09-15/two-tier.png" alt="two-tier architecture" width="300" height="183">
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
    <img src="/assets/img/2024-09-15/three-tier.png" alt="three-tier architecture" width="300" height="183">
</div>

### Database replication

The best way to achieve high availability for the database is to replicate it. Database replication is the process of copying data from one database to another database. The primary database is called the master database, which is responsible for writing data. The secondary database is called the slave database, which is responsible for reading data.

Most applications require a much higher ratio or reads to writes. This, the number of slaves databases is usually larger than the number of master databases.

<div align="center">
    <img src="/assets/img/2024-09-15/databases-replication.png" alt="database replication" width="300" height="183">
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
    <img src="/assets/img/2024-09-15/three-tier-with-database-replication.png" alt="three-tier architecture with database replication" width="300" height="183">
</div>

### Adding a cache