*DBC, 9.1 Release 9.1*

#1.  What are some common HTTP status codes?

From smartlabsoftware.com

**List of Common HTTP Status Codes:**

* 200 OK
* 300 Multiple Choices
* 301 Moved Permanently
* 302 Found
* 304 Not Modified
* 307 Temporary Redirect
* 400 Bad Request
* 401 Unauthorized
* 403 Forbidden
* U404 Not Found
* 410 Gone
* 500 Internal Server Error
* 501 Not Implemented
* 503 Service Unavailable
* 550 Permission denied

#2.  What is the difference between a GET request and a POST request? When might each be used?

GET is best employed to retrieve remote data and POST is best used to update data.  If you have data that needs security, one has to be very careful not to use GET based forms for HTTP Protocol, or you could be unwittingly sharing some of your data in a public URI log location.

#3.  What is a cookie?  How does it relate to HTTP requests?

A cookie is a small text file stored locally on a user's computer, as received by their webbrowser.  Cookies are just text-files and are not harmful.  When you connect to a webpage for the first time, the page gives instructions to your browser to store this information and to give it back upon each following request.  What this allows the webserver to do is to identify an individual user.

A web server creates a cookie by commanding it to be sent via an HTTP header called 'Set-Cookie'.  It is a long string of characters, including often a name=value, expires, domain, etc.  Once a cookie is established on a machine, this cookie is communicated from your browser back to the server each time the site is accessed.  This lets the site know that every time you visit the site it is a unique individual user initiating the HTTP requests.

To prevent abuse with cookies, there are restrictions placed on them.  Many domains set a maximum number of cookies placed per domain, such as 50 cookies (firefox and IE 8), but Chrome & Safari have no cookie limits per domain.

For those sites who do not set a maximum number of cookies, it does not matter.  The maximum size for a cookie to be sent to the server is a mere 4 kb.  If the cookie is larger, it will not reach the server.

If you want to create and edit cookies, you can do so in JavaScript with the 'document.cookie' property.

*HTTP-Only cookies cannot be accessed via Javascript.
