# ronin-web

[![CI](https://github.com/ronin-rb/ronin-web/actions/workflows/ruby.yml/badge.svg)](https://github.com/ronin-rb/ronin-web/actions/workflows/ruby.yml)
[![Code Climate](https://codeclimate.com/github/ronin-rb/ronin-web.svg)](https://codeclimate.com/github/ronin-rb/ronin-web)
[![Gem Version](https://badge.fury.io/rb/ronin-web.svg)](https://badge.fury.io/rb/ronin-web)

* [Source](https://github.com/ronin-rb/ronin-web)
* [Issues](https://github.com/ronin-rb/ronin-web/issues)
* [Documentation](https://ronin-rb.dev/docs/ronin-web/frames)
* [Discord](https://discord.gg/6WAb3PsVX9) |
  [Mastodon](https://infosec.exchange/@ronin_rb)

## Description

ronin-web is a Ruby library that provides common web security commands and
additional libraries.

ronin-web is part of the [ronin-rb] project, a [Ruby] toolkit for security
research and development.

## Features

* HTML/XML parsing/building (using [Nokogiri][nokogiri]).
  * Also provides additional extensions to [Nokogiri][nokogiri] using
    [nokogiri-ext].
* Supports diffing HTML/XML documents using [nokogiri-diff].
* Supports random `User-Agent` generation using [ronin-web-user_agents].
* Provides an easy to use [Sinatra][sinatra] based web server using
  [ronin-web-server].
* Provides an easy to use web spider using [ronin-web-spider].
* Provides a CLI for common web related tasks.
* Has 98% documentation coverage.
* Has 89% test coverage.

## Synopsis

```
Usage: ronin-web [options] [COMMAND [ARGS...]]

Options:
    -h, --help                       Print help information

Arguments:
    [COMMAND]                        The command name to run
    [ARGS ...]                       Additional arguments for the command

Commands:
    completion
    diff
    help
    html
    irb
    new
    reverse-proxy
    screenshot
    server
    session-cookie
    spider
    user-agent
    vulns
    wordlist
    xml
```

Open the `ronin-web` Ruby REPL:

```shell
$ ronin-web irb
```

Diff two HTML files:

```shell
$ ronin-web diff index1.html index2.html
+

+ <div>hax</div>
```

Diff two URLs:

```shell
$ ronin-web diff http://example.com/index.html http://example.com/index2.html
```

Perform an XPath query on an HTML file:

```shell
$ ronin-web html --xpath //meta index.html
<meta charset="utf-8">
<meta http-equiv="Content-type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
```

Perform an XPath query on a URL:

```shell
$ ronin-web html --xpath //meta https://example.com/
<meta charset="utf-8">
<meta http-equiv="Content-type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
```

Dump all links from a web page:

```shell
$ ronin-web html --links https://www.google.com/
https://www.google.com/imghp?hl=en&tab=wi
https://maps.google.com/maps?hl=en&tab=wl
https://play.google.com/?hl=en&tab=w8
https://www.youtube.com/?tab=w1
https://news.google.com/?tab=wn
https://mail.google.com/mail/?tab=wm
https://drive.google.com/?tab=wo
https://www.google.com/intl/en/about/products?tab=wh
http://www.google.com/history/optout?hl=en
/preferences?hl=en
https://accounts.google.com/ServiceLogin?hl=en&passive=true&continue=https://www.google.com/&ec=GAZAAQ
/advanced_search?hl=en&authuser=0
https://www.google.com/url?q=https://blog.google/products/search/google-search-new-fact-checking-misinformation/&source=hpp&id=19034203&ct=3&usg=AOvVaw3UxG35a-5UX1Rl8M_VwPbd&sa=X&ved=0ahUKEwjM4Iq--JD-AhVtGTQIHXMBBaYQ8IcBCAU
/intl/en/ads/
/services/
/intl/en/about.html
/intl/en/policies/privacy/
/intl/en/policies/terms/
```

Spiders a host and print all visited URLs:

```shell
$ ronin-web spider --host www.ruby-lang.org
http://www.ruby-lang.org/
http://www.ruby-lang.org/en/
http://www.ruby-lang.org/en/downloads/
http://www.ruby-lang.org/en/documentation/
http://www.ruby-lang.org/en/libraries/
http://www.ruby-lang.org/en/community/
https://www.ruby-lang.org/en/news/
https://www.ruby-lang.org/en/security/
https://www.ruby-lang.org/en/about/
...
```

Spiders the domain and sub-domains and print every visited URL:

```shell
$ ronin-web spider --domain ruby-lang.org
http://ruby-lang.org/
https://www.ruby-lang.org/
https://www.ruby-lang.org/en/
https://www.ruby-lang.org/en/downloads/
https://www.ruby-lang.org/en/documentation/
https://www.ruby-lang.org/en/libraries/
https://www.ruby-lang.org/en/community/
https://www.ruby-lang.org/en/news/
https://www.ruby-lang.org/en/security/
https://www.ruby-lang.org/en/about/
...
```

Spiders a specific web-site and print every visited URL:

```shell
$ ronin-web spider --site https://www.ruby-lang.org/
https://www.ruby-lang.org/
https://www.ruby-lang.org/en/
https://www.ruby-lang.org/en/downloads/
https://www.ruby-lang.org/en/documentation/
https://www.ruby-lang.org/en/libraries/
https://www.ruby-lang.org/en/community/
https://www.ruby-lang.org/en/news/
https://www.ruby-lang.org/en/security/
https://www.ruby-lang.org/en/about/
...
```

Spider a host and print the response statuses:

```shell
200 http://www.ruby-lang.org/
200 http://www.ruby-lang.org/en/
200 http://www.ruby-lang.org/en/downloads/
200 http://www.ruby-lang.org/en/documentation/
200 http://www.ruby-lang.org/en/libraries/
200 http://www.ruby-lang.org/en/community/
200 http://www.ruby-lang.org/en/news/
200 http://www.ruby-lang.org/en/security/
200 http://www.ruby-lang.org/en/about/
...
```

Spider a host and print the response status and headers:

```shell
ronin-web spider --print-headers --host www.ruby-lang.org
200 http://www.ruby-lang.org/
    Connection: close
    Content-Length: 887
    Server: Cowboy
    Strict-Transport-Security: max-age=31536000
    Content-Type: text/html
    Etag: W/"496ac7fab29a6094e490da28025c5857"
    X-Frame-Options: SAMEORIGIN
    Via: 1.1 vegur, 1.1 varnish
    Accept-Ranges: bytes
    Date: Tue, 04 Apr 2023 19:42:51 GMT
    Age: 155
    X-Served-By: cache-pdx12330-PDX
    X-Cache: HIT
    X-Cache-Hits: 1
    X-Timer: S1680637372.808609,VS0,VE1
    Vary: Accept-Encoding
...
```

Start a debug web server on http://localhost:8000/:

```shell
$ ronin-web server
[2023-04-04 12:26:59] INFO  WEBrick 1.7.0
[2023-04-04 12:26:59] INFO  ruby 3.1.3 (2022-11-24) [x86_64-linux]
== Sinatra (v3.0.4) has taken the stage on 8000 for development with backup from WEBrick
[2023-04-04 12:26:59] INFO  WEBrick::HTTPServer#start: pid=8966 port=8000
```

Start a debug web server on a different address and port:

```shell
$ ronin-web server --host 0.0.0.0 --port 1337
```

Host the files in a directory on http://localhost:8000/:

```shell
$ ronin-web server --root .
```

Mount a specific file at a specific HTTP path:

```shell
$ ronin-web server --dir /dir/index.html:./index.html
```

Mount a specific directory at a specific HTTP path:

```shell
$ ronin-web server --dir /dir:.
```

Add a redirect to the web server:

```shell
$ ronin-web server --redirect /redirect:https://example.com/
```

Start a HTTP reverse proxy that rewrites HTTP responses on http://localhost:8080:

```shell
$ ronin-web reverse-proxy --rewrite-response Example:Hax
```

Test the reverse proxy:

```shell
$ curl -H "Host: example.com" http://localhost:8080/
```

Generate a new Ruby script for parsing HTML/XML:

```shell
$ ronin-web new nokogiri parse.rb
	erb	nokogiri.rb.erb	parse.rb
	chmod	parse.rb
```

Generate a new web spider script:

```shell
$ ronin-web new spider --host=www.example.com spider.rb
	erb	spider.rb.erb	spider.rb
	chmod	spider.rb
```

Generate a new web server script:

```shell
$ ronin-web new server server.rb
	erb	server.rb.erb	server.rb
	chmod	server.rb
```

Generate a new web app:

```shell
$ ronin-web new app myapp
	mkdir	myapp
	mkdir	myapp/lib
	mkdir	myapp/views
	mkdir	myapp/public
	erb	.ruby-version.erb	myapp/.ruby-version
	cp	Gemfile	myapp
	erb	app.rb.erb	myapp/app.rb
	cp	config.ru	myapp
```

Open the Ronin Web Ruby REPL:

```
$ ronin-web irb
                                                                   , Jµ     ▓▓█▓
                                                  J▌      ▐▓██▌ ████ ██    ▐███D
                                      ╓▄▓▓█████▌  ██µ     ████ ▄███ÖJ██▌   ███▌
        ,╓µ▄▄▄▄▄▄▄▄µ;,            ,▄▓██████████  ▐███    ▐███▀ ███▌ ████µ ▄███
¬∞MÆ▓███████████████████████▓M  ▄██████▀▀╙████▌  ████▌   ████ ▄███ J█████ ███▌
           `█████▀▀▀▀▀███████  -████▀└    ████  ▐█████n ▄███O ███▌ ██████████
           ▓████L       ████▀  ▓████     ▓███Ö  ███████ ███▌ ▓███ ▐█████████▀
          ▄████▀  ,╓▄▄▄█████  J████Ü    ,███▌  ▄███████████ J███▀ ████ █████
         J█████████████████─  ████▌     ████   ████`██████▌ ████ ▐███Ü ▐███Ü
         ███████████▀▀▀╙└    ▐████     J███▌  ▓███▌ ²█████ J███Ü ███▌   ▀█▌
        ▓██████████▌         ████▌     ████  ;████   ▀███▀ ███▌ J▀▀▀-    █
       ▄█████▀ ▀█████µ      ▐████  ,▄▓████▀  ████▀    ███ J███           `
      J█████-    ╙▀███▄     ████████████▀╙  J█▀▀▀      █U  ▀█▌
      ████▀         ▀███   ▄████████▀▀                 ╨    █
     ▓██▀             ²▀█▄ █▀▀▀╙└
    ▄██╜                 ╙W
   J█▀
   ▌└
  ┘

irb(ronin-web)>
```

## Examples

### HTML

Parse an HTML string:

```ruby
doc = html_parse("<html>\n  <body>\n    <p>Hello world</p>\n  </body>\n</html>\n")
# =>
# #(Document:0x6ab8 {
#   name = "document",
#   children = [
#     #(DTD:0x6be4 { name = "html" }),
#     #(Element:0x6cd4 {
#       name = "html",
#       children = [
#         #(Text "\n  "),
#         #(Element:0x6e64 {
#           name = "body",
#           children = [
#             #(Text "\n    "),
#             #(Element:0x6ff4 { name = "p", children = [ #(Text "Hello world")] }),
#             #(Text "\n  ")]
#           }),
#         #(Text "\n")]
#       })]
#   })
```

Parse a HTML file:

```ruby
doc = html_open("index.html")
# => #<Nokogiri::HTML::Document:...>
```

Searching an HTML document using [XPath] or CSS-path:

```ruby
nodes = doc.search('//div/p')
nodes = doc.search('div p.class')
# => [#<Nokogiri::HTML::Element:...>, ...]

node = doc.at('#id')
# => #<Nokogiri::HTML::Element:...>
```

Build a HTML document:

```ruby
doc = html_build do
  html {
    head {
      script(type: 'text/javascript', src: 'redirect.js')
    }
  }
end

puts doc.to_html
# <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" "http://www.w3.org/TR/REC-html40/loose.dtd">
# <html><head><script src="redirect.js" type="text/javascript"></script></head></html>
```

### XML

Parse an XML response body:

```ruby
xml_parse("<?xml version=\"1.0\"?>\n<users>\n  <user>\n    <name>admin</name>\n    <password>0mni</password>\n  <user>\n</users>\n")
# =>
# #(Document:0xdebc {
#   name = "document",
#   children = [
#     #(Element:0xdfe8 {
#       name = "users",
#       children = [
#         #(Text "\n  "),
#         #(Element:0xe178 {
#           name = "user",
#           children = [
#             #(Text "\n    "),
#             #(Element:0xe308 { name = "name", children = [ #(Text "admin")] }),
#             #(Text "\n    "),
#             #(Element:0xe538 { name = "password", children = [ #(Text "0mni")] }),
#             #(Text "\n  "),
#             #(Element:0xe768 { name = "user", children = [ #(Text "\n")] }),
#             #(Text "\n")]
#           })]
#       })]
#   })
```

Parse a XML file:

```ruby
doc = html_open("data.xml")
# => #<Nokogiri:XML:::Document:...>
```

Searching an XML document using [XPath]:

```ruby
users = doc.search('//user')
# => [#<Nokogiri::XML::Element:...>, ...]

admin = doc.at('//user[@name="admin"]')
# => #<Nokogiri::XML::Element:...>
```

Build a XML document:

```ruby
doc = xml_build do
  playlist {
    mp3 {
      file { text('02 THE WAIT.mp3') }
      artist { text('Evil Nine') }
      track { text('The Wait feat David Autokratz') }
      duration { text('1000000000') }
    }
  }
end

puts doc.to_xml
# <?xml version="1.0"?>
# <playlist>
#   <mp3>
#     <file>02 THE WAIT.mp3</file>
#     <artist>Evil Nine</artist>
#     <track>The Wait feat David Autokratz</track>
#     <duration>1000000000</duration>
#   </mp3>
# </playlist>
```

### Web Requests

Gets a URL and follows any redirects:

```ruby
get 'https://example.com/'
# => #<Net::HTTPResponse:...>
```

Gets a URL and parses the HTML response:

```ruby
get_html 'https://example.com/'
# => #<Nokogiri::HTML::Document:...>
```

Gets a URL and parses the XML response:

```ruby
get_xml 'https://example.com/sitemap.xml'
# => #<Nokogiri::XML::Document:...>
```

Gets a URL and parses the JSON response:

```ruby
get_json 'https://example.com/api/endpoint.json'
# => {...}
```

POSTs to a URL and follows any redirects:

```ruby
post 'https://example.com/form', form_data: {'foo' => 'bar'}
# => #<Net::HTTPResponse:...>
```

POSTs to a URL and parses the HTML response:

```ruby
post_html 'https://example.com/form', form_data: {'foo' => 'bar'}
# => #<Nokogiri::HTML::Document:...>
```

POSTs to a URL and parses the XML response:

```ruby
post_xml 'https://example.com/form', form_data: {'foo' => 'bar'}
# => #<Nokogiri::XML::Document:...>
```

POSTs to a URL and parses the JSON response:

```ruby
post_json 'https://example.com/api/endpoint.json', json: {foo: 'bar'}
# => {...}
```

### User Agents

Get a random `User-Agent` string:

```ruby
user_agent = UserAgents.random
# => "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.230 Safari/537.36"
```

For more examples, see [ronin-web-user_agents][ronin-web-user_agents-examples].

[ronin-web-user_agents-examples]: https://github.com/ronin-rb/ronin-web-user_agents#examples

### Session Cookie

Parse a Django JSON session cookie:

```ruby
SessionCookie.parse('sessionid=eyJmb28iOiJiYXIifQ:1pQcTx:UufiSnuPIjNs7zOAJS0UpqnyvRt7KET7BVes0I8LYbA')
# =>
# #<Ronin::Web::SessionCookie::Django:0x00007f29bb9c6b70
#  @hmac=
#   "R\xE7\xE2J{\x8F\"3l\xEF3\x80%-\x14\xA6\xA9\xF2\xBD\e{(D\xFB\x05W\xAC\xD0\x8F\va\xB0",
#  @params={"foo"=>"bar"},
#  @salt=1676070425>
```

For more examples, see [ronin-web-session_cookie][ronin-web-session_cookie-examples].

[ronin-web-session_cookie-examples]: https://github.com/ronin-rb/ronin-web-session_cookie#examples

### Spider

Spider a website and print out visited URLs:

```ruby
Spider.site('http://www.rubyinside.com/') do |spider|
  spider.every_url { |url| puts url }
end
```

For more examples, see [ronin-web-spider][ronin-web-spider-examples].

[ronin-web-spider-examples]: https://github.com/ronin-rb/ronin-web-spider#examples

### Browser

Open a visible web browser and intercept all requests:

```ruby
browser = Ronin::Web::Browser.new(visible: true)
browser.every_request do |request|
  puts "> #{request.method} #{request.url}"
end

browser.go_to("https://twitter.com/login")
```

For more examples, see [ronin-web-browser][ronin-web-browser-examples].

[ronin-web-browser-examples]: https://github.com/ronin-rb/ronin-web-browser#examples

## Requirements

* [Ruby] >= 3.0.0
* [nokogiri] ~> 1.4
* [nokogiri-diff] ~> 0.2
* [robots] ~> 0.10
* [open_namespace] ~> 0.4
* [wordlist] ~> 1.0, >= 1.0.1
* [ronin-support] ~> 1.1
* [ronin-support-web] ~> 0.1
* [ronin-web-browser] ~> 0.1
* [ronin-web-server] ~> 0.1
* [ronin-web-spider] ~> 0.2
* [ronin-web-user_agents] ~> 0.1
* [ronin-web-session_cookie] ~> 0.1
* [ronin-core] ~> 0.2
* [ronin-vulns] ~> 0.2

## Install

```shell
$ gem install ronin-web
```

## Development

1. [Fork It!](https://github.com/ronin-rb/ronin-web/fork)
2. Clone It!
3. `cd ronin-web`
4. `./scripts/setup`
5. `git checkout -b my_feature`
6. Code It!
7. `bundle exec rake spec`
8. `git push origin my_feature`

## License

ronin-web - A collection of useful web helper methods and commands.

Copyright (c) 2006-2025 Hal Brodigan (postmodern.mod3 at gmail.com)

ronin-web is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

ronin-web is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with ronin-web.  If not, see <https://www.gnu.org/licenses/>.

[ronin-rb]: https://ronin-rb.dev
[Ruby]: https://www.ruby-lang.org

[nokogiri]: https://nokogiri.org/
[nokogiri-diff]: https://github.com/postmodern/nokogiri-diff#readme
[open_namespace]: https://github.com/postmodern/open_namespace#readme
[ronin-support]: https://github.com/ronin-rb/ronin-support#readme
[ronin-support-web]: https://github.com/ronin-rb/ronin-support-web#readme
[ronin-core]: https://github.com/ronin-rb/ronin-core#readme
[ronin-web-browser]: https://github.com/ronin-rb/ronin-web-browser#readme
[ronin-web-server]: https://github.com/ronin-rb/ronin-web-server#readme
[ronin-web-spider]: https://github.com/ronin-rb/ronin-web-spider#readme
[ronin-web-user_agents]: https://github.com/ronin-rb/ronin-web-user_agents#readme
[ronin]: https://github.com/ronin-rb/ronin#readme
[sinatra]: https://sinatrarb.com/

[XPath]: https://developer.mozilla.org/en-US/docs/Web/XPath
