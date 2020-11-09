# Getting Started with Shorten Url

Follow these steps to run app locally:

```shell
rvm install 2.6.3
```

```
git clone https://github.com/puneet18190/shorten-url.git
```

```
rake db:create
```

```
rake db:migrate
```

```
rails server
```

# To run test:

```
rails test
```

# Algo to generate Shorten Url

```
Use Ruby's SecureRandom method to generate unique random key of 8 digits.
```

```
Store URL and generated random key in Records table
```

```
Shorten URL link is /s/{KEY}
```

```
Once shorten URL is hit in browser, we find the original URL from table and redirect it.
```