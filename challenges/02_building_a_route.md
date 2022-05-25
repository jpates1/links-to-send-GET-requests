# Building a Route

_**This is a Makers Vine.** Vines are designed to gradually build up sophisticated skills. They contain a mixture of text and video, and may contain some challenge exercises without proposed solutions. [Read more about how to use Makers
Vines.](https://github.com/makersacademy/course/blob/main/labels/vines.md)_

Learn to build a "route" to respond to HTTP requests.

## Routing

Remember that a web server receives HTTP requests, execute some code depending on the received request, and returns a response. To know which code to execute depending on the request, internally Sinatra keeps a "routing" table, which associates a request **method and path** to a block of Ruby code:

|Method|Path|Ruby code|
|-|-|-|
|GET|/|`# some code to execute`
|POST|/|`# other code to execute`

For example, receiving a `GET` request on the path `/hello` will execute some code. Receiving a different `POST` request on the same path (or perhaps a different one) will execute different code (and in turn lead to a different returned response).  

Here is an example of a minimal Sinatra application, configuring a single **route**:

```ruby
# file: app.rb
require 'sinatra/base'

class WebApplication < Sinatra::Base 

  # Declares a route that responds to a request with:
  #  - a GET method
  #  - the path /
  get '/' do
    # The code here is executed when a request is received,
    # and need to send a response. 

    # We can simply return a string which
    # will be used as the response content.
    # Unless specified, the response status code
    # will be 200 (OK).
    return 'Some response data'
  end
end
```

The Ruby block between the `do` and `end` associated with a route is called a "route" or "route block". The code in this block is executed _only_ is the received request matches the method and path.

When Sinatra received a request, it looks through all the route blocks configured in that class, and execute the code of the first one matching the request.

```ruby
# Example when Sinatra receives a request
# GET /

class WebApplication < Sinatra::Base 
  # This route is not executed (the method doesn't match).
  post '/' do

  end

  # This route is not executed (the path doesn't match).
  get '/hello' do
    
  end

  # This route matches! The code inside the block will be executed now.
  get '/' do

  end

  # This route matches, but is not executed - only the first one matching (above) is.
  get '/' do

  end
end
```

_In the following sections, we will use the shorthand notation `GET /some_path` to designate a route which responds to `GET` requests to the path `/some_path`._ 

## Accessing request parameters

We can use the `params` hash inside a route block to access the request _query parameters._

If a client sends a request with a query parameter with key `name` and value `David`, this parameter will be present in the `params` hash, and we can access the value like this:

```ruby
# Request:
# GET /?name=David

get '/' do
  name = params[:name] # The value is 'David'

  # Do something with `name`...

  return "Hello #{name}"
end
```

We can also use `params` to retrieve _body parameters_ sent with `POST` request — it works exactly the same way.

## Demonstration

@TODO

## Exercise

Work through the following in the project `hello_web_project`.

Create a new route that responds to `GET` requests sent to the path `/hello`. It should return the text `'Hello [NAME]'`, where `[NAME]` is replaced by the value of the `name` _query parameter_.

Using Postman, send a request to the correct URL, by adding a query parameter `name` with your own name, and check the received response is correct.

```
# Request:
GET /hello?name=Leo

# Expected response (200 OK):
Hello Leo
```

## Challenge

Work through the following in the project `hello_web_project`.

Create a new route that responds to `POST` requests sent to the path `/submit`.

It should return the text `'Thanks [NAME], you sent this message: "[MESSAGE]"'`, where:
  * `[NAME]` is replaced by the value of the `name` _body parameter_
  * `[MESSAGE]` is replaced by the value of the `message` _body parameter_

Using Postman, send a request to the correct URL, by adding _body parameters_ `name` and `message`, and check the received response is correct.

```
# Request:
POST /submit

# With body parameters:
name=Leo
message=Hello world

# Expected response (2OO OK):
Thanks Leo, you sent this message: "Hello world"
```

[Next Challenge](03_test_driving_a_route.md)

<!-- BEGIN GENERATED SECTION DO NOT EDIT -->

---

**How was this resource?**  
[😫](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy/web-applications&prefill_File=challenges/02_building_a_route.md&prefill_Sentiment=😫) [😕](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy/web-applications&prefill_File=challenges/02_building_a_route.md&prefill_Sentiment=😕) [😐](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy/web-applications&prefill_File=challenges/02_building_a_route.md&prefill_Sentiment=😐) [🙂](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy/web-applications&prefill_File=challenges/02_building_a_route.md&prefill_Sentiment=🙂) [😀](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy/web-applications&prefill_File=challenges/02_building_a_route.md&prefill_Sentiment=😀)  
Click an emoji to tell us.

<!-- END GENERATED SECTION DO NOT EDIT -->