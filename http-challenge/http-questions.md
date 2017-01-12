## HTTP Questions

These questions will help to reinforce your understanding of the HTTP protocol. Use the readings on HTTP, your notes, your peers, and good-old trusty Google to answer the following questions:

* * *
**Q: What are the five HTTP verbs we use to Create, Read, Update, and Delete resources on the web?**

A: POST, GET, PUT, PATCH and DELETE



* * *
**Q: Define each of the HTTP verbs in question #1.**

A:
1. The POST verb is most-often utilized to **create** new resources. In particular, it's used to create subordinate resources. That is, subordinate to some other (e.g. parent) resource. In other words, when creating a new resource, POST to the parent and the service takes care of associating the new resource with the parent, assigning an ID (new resource URI), etc.
2. The HTTP GET method is used to **read** (or retrieve) a representation of a resource. In the “happy” (or non-error) path, GET returns a representation in XML or JSON and an HTTP response code of 200 (OK). In an error case, it most often returns a 404 (NOT FOUND) or 400 (BAD REQUEST).
3. PUT is most-often utilized for **update** capabilities, PUT-ing to a known resource URI with the request body containing the newly-updated representation of the original resource.
4. PATCH is used for **modify** capabilities. The PATCH request only needs to contain the changes to the resource, not the complete resource.
5. DELETE - It is used to **delete** a resource identified by a URI.



* * *
**Q: What are the components of a HTTP request?**

A:
1. HTTP verb
2. path
3. protocol and version
4. headers


* * *
**Q: What are the components of a HTTP response?**

A:
1. protocol and version
2. status code and message
3. headers
4. body


* * *
**Q: What is a Status Code?**

A:
The Status-Code element in a server response, is a 3-digit integer where the first digit of the Status-Code defines the class of response and the last two digits do not have any categorization role.


* * *
**Q: What are the different types of Status Codes? List a few Status Codes which you think are important to remember.**

A:
1.	1xx: Informational
It means the request has been received and the process is continuing.

2.	2xx: Success
It means the action was successfully received, understood, and accepted. Most common:200 OK, 201 Created

3.	3xx: Redirection
It means further action must be taken in order to complete the request.
  Most common: 301 Moved Permanently, 303 See Other
4.	4xx: Client Error
It means the request contains incorrect syntax or cannot be fulfilled.
  Most common: 401 Unauthorized, 404 Not Found

5.	5xx: Server Error
It means the server failed to fulfill an apparently valid request.
  Most common: 500 Internal Server Error, 503 Service Unavailable


* * *
**Q: Can you draw the HTTP Request/Response cycle from memory?**

**Note:** It is **highly likely** someone will ask you to do this in an interview setting. Try it out on a whiteboard or on paper, now.

A:
yes


* * *
**Q: What is the difference between the `PUT` and `PATCH` HTTP verbs?**

A: They are both used to update but while PUT verb replaces the original resource, PATCH only modifies it



* * *
**Q: Name the different parts of the following URL**

```
-                      2                             4
            ┌──────────┴──────────┐         ┌────────┴────────┐
    https://learn.launchacademy.com/searches?utf8=✓&query=rspec
    └─┬─┘                          └───┬───┘
      1                                3
```

A:

    1. scheme

    2. hostname

    3. path

    4. fragment

* * *
