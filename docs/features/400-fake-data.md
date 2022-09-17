---
sidebar_position: 40
---

# Fake data

Fake data can be used to generate random useful data for your API responses. Fake data can be injected into response header or body. For example:

```yaml title="fakedata.yaml"
name: "Example of mock server with fake data"
port: 3000
routes:
  -
    path: /hello
    responses:
      -
        body: "Hello {{faker.person.name}}"
        headers:
          Agent: "{{faker.useragent.useragent}}"
          Content-Type: application/json
```

```bash
http GET localhost:3000/hello

# HTTP/1.1 200 OK
# Agent: Mozilla/5.0 (X11; U; Linux i686; en-GB; rv:1.9.1.15) Gecko/20101027 Fedora/3.5.15-1.# # fc12 Firefox/3.5.15
# Content-Length: 20
# Content-Type: application/json
# Date: Sat, 17 Sep 2022 23:17:00 GMT

# Hello Vernon Douglas
```

## Supported fake data options

### Address

- {{faker.address.address}} - Full address
- {{faker.address.cityprefix}}
- {{faker.address.secondaryaddress}}
- {{faker.address.state}}
- {{faker.address.stateabbr}}
- {{faker.address.citysuffix}}
- {{faker.address.streetsuffix}}
- {{faker.address.buildingnumber}}
- {{faker.address.city}}
- {{faker.address.streetname}}
- {{faker.address.streetaddress}}
- {{faker.address.postcode}}
- {{faker.address.country}}
- {{faker.address.countryabbr}}
- {{faker.address.latitude}}
- {{faker.address.longitude}}

### Color

- {{faker.color.hex}}
- {{faker.color.rgb}}
- {{faker.color.rgbasarray}}
- {{faker.color.css}}
- {{faker.color.safecolorname}}
- {{faker.color.colorname}}

### Currency

- {{faker.currency.currency}}
- {{faker.currency.code}}
- {{faker.currency.number}}
- {{faker.currency.country}}
- {{faker.currency.currencyascode}}

### Car

- {{faker.car.maker}}
- {{faker.car.model}}
- {{faker.car.category}}
- {{faker.car.fueltype}}
- {{faker.car.plate}}

### Emoji

- {{faker.emoji.emoji}}
- {{faker.emoji.EmojiCode}}

### Food

- {{faker.food.fruit}}
- {{faker.emoji.EmojiCode}}

### Gender

- {{faker.gender.name}}
- {{faker.gender.abbr}}


### Genre

- {{faker.genre.name}}
- {{faker.genre.namewithdescription}}

### Hash

- {{faker.hash.sha256}}
- {{faker.hash.sha512}}
- {{faker.hash.md5}}

### Language

- {{faker.language.language}}
- {{faker.language.languageabbr}}
- {{faker.language.programminglanguage}}

### Lorem

- {{faker.lorem.word}}
- {{faker.lorem.words(10)}} # 10 or any number of characters
- {{faker.lorem.sentence(5)}} # 5 or any number of words
- {{faker.lorem.paragraph(2)}} # 2 or any number of sentences
- {{faker.lorem.paragraphs(2)}} # 2 or any number of paragraphs
- {{faker.lorem.text(10)}} # 10 or number of characters
- {{faker.lorem.bytes(10)}} # 10 or number of characters

### Mimetype

- {{faker.mimetype.mimetype}}


### Music

- {{faker.music.author}}
- {{faker.music.genre}}
- {{faker.music.length}} # Song duration

### Payment

- {{faker.payment.creditcardtype}}
- {{faker.payment.creditcardnumber}}
- {{faker.payment.creditcardexpirationdatestring}}

### Person

- {{faker.person.suffix}}
- {{faker.person.title}}
- {{faker.person.firstname}}
- {{faker.person.lastname}}
- {{faker.person.name}}
- {{faker.person.gender}}
- {{faker.person.ssn}}
- {{faker.person.contact}}

### Pet

- {{faker.pet.dog}}
- {{faker.pet.cat}}
- {{faker.pet.name}}

### Phone

- {{faker.phone.areacode}}
- {{faker.phone.exchangecode}}
- {{faker.phone.number}}
- {{faker.phone.tollfreenumber}}

### Time

- {{faker.time.ampm}}
- {{faker.time.dayofmonth}}
- {{faker.time.dayofweek}}
- {{faker.time.month}}
- {{faker.time.monthname}}
- {{faker.time.year}}
- {{faker.time.century}}
- {{faker.time.timezone}}

### User Agent

- {{faker.useragent.useragent}}
- {{faker.useragent.internetexplorer}}
- {{faker.useragent.chrome}}
- {{faker.useragent.firefox}}
- {{faker.useragent.opera}}
- {{faker.useragent.safari}}


### UUID

- {{faker.uuid.v4}}
