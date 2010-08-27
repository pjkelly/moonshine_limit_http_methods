# Limit HTTP Methods

## A plugin for [Moonshine](http://github.com/railsmachine/moonshine)

A plugin for limiting the HTTP methods Apache will allow.  By default, it denies requests using the following methods.

* `CONNECT`
* `OPTIONS`
* `PATCH`
* `PROPFIND`
* `PROPPATCH`
* `MKCOL`
* `COPY`
* `MOVE`
* `LOCK`
* `UNLOCK`

If you want to specify a different list, configure as specified below.

## Instructions

* `script/plugin install git://github.com/pjkelly/moonshine_limit_http_methods.git`
* Configure settings (if needed):

    `configure(:limit_http_methods => {:methods => ['PUT', 'DELETE']})`
* Invoke the recipe in your Moonshine manifest:

    `recipe :limit_http_methods`
