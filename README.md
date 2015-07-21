# WhosDatedWho

[![Gem Version](https://img.shields.io/gem/v/whos_dated_who.svg)](http://badge.fury.io/rb/whos_dated_who)
[![Build Status](https://img.shields.io/travis/blackxored/whos_dated_who.svg)](https://travis-ci.org/blackxored/whos_dated_who)
[![Coverage Status](https://img.shields.io/coveralls/blackxored/whos_dated_who.svg)](https://coveralls.io/r/blackxored/whos_dated_who)
[![Dependency Status](https://img.shields.io/gemnasium/blackxored/whos_dated_who.svg)](https://gemnasium.com/blackxored/whos_dated_who)
[![Code Climate](https://img.shields.io/codeclimate/github/blackxored/whos_dated_who.svg)](https://codeclimate.com/github/blackxored/whos_dated_who)
[![Downloads](https://img.shields.io/gem/dt/whos_dated_who.svg)](https://rubygems.org/gems/whos_dated_who)

Unofficial API for http://whosdatedwho.com (now http://famousfix.com).

This client provides an unofficial client to the service which allows to discover
a celebrity's dating status, biography, and more things about their personality
and likes.

## Installation

Add this line to your application's Gemfile:

    gem 'whos_dated_who'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install whos_dated_who

## Usage

Fetch a person:

```ruby

2.2.2 (main):0 > client = WhosDatedWho::Client.new
=> #<WhosDatedWho::Client:0x007fd0739ded10>
2.2.2 (main):0 > client.fetch('Scarlett Johansson')
=> {
             "biography" => {
                     :age => 30,
                 :born_at => "New York City, New York",
                 :born_on => #<Date: 1984-11-22 ((2446027j,0s,0n),+0s,2299161j)>,
      :brand_endorsements => [
      [ 0] "Gap (2002)",
      [ 1] "L'Oreal (2006)",
      [ 2] "LVMH (2006)",
      [ 3] "Disney Land Disney Park (2007)",
      [ 4] "Walt Disney World Disney Park (2007)",
      [ 5] "Dolce & Gabbana (2010)",
      [ 6] "(2004) Commercial for Calvin Klein fragrance, \"Eternity Moment\"",
      [ 7] "(2004) Print ad, Estée Lauder.",
      [ 8] "(2004-07) Print ads for Louis Vuitton.",
      [ 9] "(2010) Print ads for Moet Champagne.",
      [10] "(2011) Print ads for Mango fashion line.",
      [11] "(November 2013) TV commercial, with Matthew McConaughey, for Dolce & Gabbana The One perfume/colognes."
    ],
                :brothers => [
      [0] "Hunter Johansson",
      [1] "Adrian Johansson",
      [2] "Christian Johansson"
    ],
                   :build => "Athletic",
           :claim_to_fame => "Ghost World, Lost in Translation, Match Point, The Black Dahlia",
             :description => "Scarlett Johansson (dʒoʊˈhænsən joh-HAN-sən; born November 22, 1984) is an American actress, model, and singer. She made her film debut in North (1994)
    :distinctive_features => [
      [0] "Her Lips",
      [1] "Husky Voice"
    ],
              :dress_size => "6",
               :ethnicity => "White",
               :eye_color => "Green",
                  :father => "Karsten Johansson",
    :favorite_accessories => [
      [0] "D&G Handbags",
      [1] "Sunglasses"
    ],
         :favorite_colors => [
      [0] "Blue"
    ],
          :favorite_foods => [
      [0] "Fried Rice"
    ],
         :favorite_movies => [
      [0] "Heat",
      [1] " [1995]",
      [2] "Goodfellas",
      [3] " [1990]",
      [4] "Mean Streets",
      [5] " [1973]"
    ],
         :favorite_places => [
      [0] "Paris",
      [1] "London"
    ],
              :first_name => "Scarlett",
                 :friends => [
      [0] "Domingo Zapata",
      [1] "Jeremy Renner",
      [2] "Clark Gregg",
      [3] "Sam Claflin"
    ],
      :full_name_at_birth => "Scarlett Ingrid Johansson",
              :hair_color => "Dyed Blonde",
                  :height => 1.6,
             :high_school => "Professional Children`s School in Manhattan, New York City, New York, USA",
               :last_name => "Johansson",
     :measurements_inches => "32C-25-36",
             :middle_name => "Ingrid",
                  :mother => "Melanie Sloan (manager)",
             :nationality => "American",
              :occupation => "Actress, Model, Singer, and Director",
     :occupation_category => "Actress",
             :other_names => [
      [0] "Scar",
      [1] "ScarJo"
    ],
                    :pets => [
      [0] "Trooper (Cat)",
      [1] "Maggie (Dog - Chihuahua)"
    ],
                :religion => "Jewish",
               :sexuality => "Straight",
               :shoe_size => "9.5",
                 :sisters => [
      [0] "Vanessa Johansson",
      [1] "Fenan Sloan Johansson"
    ],
               :star_sign => "Scorpio",
           :talent_agency => [
      [0] "Creative Artist Agency",
      [1] "Bailey Brand Management, Inc."
    ],
    ],
=> {
             "biography" => {
                     :age => 30,
                 :born_at => "New York City, New York",
                 :born_on => #<Date: 1984-11-22 ((2446027j,0s,0n),+0s,2299161j)>,
      :brand_endorsements => [
      [ 0] "Gap (2002)",
      [ 1] "L'Oreal (2006)",
      [ 2] "LVMH (2006)",
      [ 3] "Disney Land Disney Park (2007)",
      [ 4] "Walt Disney World Disney Park (2007)",
      [ 5] "Dolce & Gabbana (2010)",
      [ 6] "(2004) Commercial for Calvin Klein fragrance, \"Eternity Moment\"",
      [ 7] "(2004) Print ad, Estée Lauder.",
      [ 8] "(2004-07) Print ads for Louis Vuitton.",
      [ 9] "(2010) Print ads for Moet Champagne.",
      [10] "(2011) Print ads for Mango fashion line.",
      [11] "(November 2013) TV commercial, with Matthew McConaughey, for Dolce & Gabbana The One perfume/colognes."
    ],
                :brothers => [
      [0] "Hunter Johansson",
      [1] "Adrian Johansson",
      [2] "Christian Johansson"
    ],
                   :build => "Athletic",
           :claim_to_fame => "Ghost World, Lost in Translation, Match Point, The Black Dahlia",
             :description => "Scarlett Johansson (dʒoʊˈhænsən joh-HAN-sən; born November 22, 1984) is an American actress, model, and singer. She made her film debut in North (1994)
    :distinctive_features => [
      [0] "Her Lips",
      [1] "Husky Voice"
    ],
              :dress_size => "6",
               :ethnicity => "White",
               :eye_color => "Green",
                  :father => "Karsten Johansson",
    :favorite_accessories => [
      [0] "D&G Handbags",
      [1] "Sunglasses"
    ],
         :favorite_colors => [
      [0] "Blue"
    ],
          :favorite_foods => [
      [0] "Fried Rice"
    ],
         :favorite_movies => [
      [0] "Heat",
      [1] " [1995]",
      [2] "Goodfellas",
      [3] " [1990]",
      [4] "Mean Streets",
      [5] " [1973]"
    ],
         :favorite_places => [
      [0] "Paris",
      [1] "London"
    ],
              :first_name => "Scarlett",
                 :friends => [
      [0] "Domingo Zapata",
      [1] "Jeremy Renner",
      [2] "Clark Gregg",
      [3] "Sam Claflin"
    ],
      :full_name_at_birth => "Scarlett Ingrid Johansson",
              :hair_color => "Dyed Blonde",
                  :height => 1.6,
             :high_school => "Professional Children`s School in Manhattan, New York City, New York, USA",
               :last_name => "Johansson",
     :measurements_inches => "32C-25-36",
             :middle_name => "Ingrid",
                  :mother => "Melanie Sloan (manager)",
             :nationality => "American",
              :occupation => "Actress, Model, Singer, and Director",
     :occupation_category => "Actress",
             :other_names => [
      [0] "Scar",
      [1] "ScarJo"
    ],
                    :pets => [
      [0] "Trooper (Cat)",
      [1] "Maggie (Dog - Chihuahua)"
    ],
                :religion => "Jewish",
               :sexuality => "Straight",
               :shoe_size => "9.5",
                 :sisters => [
      [0] "Vanessa Johansson",
      [1] "Fenan Sloan Johansson"
    ],
               :star_sign => "Scorpio",
           :talent_agency => [
      [0] "Creative Artist Agency",
      [1] "Bailey Brand Management, Inc."
    ],
                :websites => [
      [0] "scarlett-fan.com",
      [1] "scarlettjohansson.org",
      [2] "scarlett-online.com",
      [3] "scarlettalbum.com",
      [4] "scarlett-web.net",
      [5] "nndb.com",
```

Or get a summary through the command line:

```shell
$ whos_dated_who query "Scarlett Johansson"
arried: Scarlett Johansson is married to Romain Dauriac.
Commenced Dating: November 2012, Date Engaged: September 2013, Date Married: 1 October 2014
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/whos_dated_who/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
