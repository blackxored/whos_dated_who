# WhosDatedWho

[![Gem Version](https://badge.fury.io/rb/whos_dated_who.png)](http://badge.fury.io/rb/whos_dated_who) [![Build Status](https://travis-ci.org/blackxored/whos_dated_who.png)](https://travis-ci.org/blackxored/whos_dated_who) [![Coverage Status](https://coveralls.io/repos/blackxored/whos_dated_who/badge.png?branch=master)](https://coveralls.io/r/blackxored/whos_dated_who) [![Dependency Status](https://gemnasium.com/blackxored/whos_dated_who.png)](https://gemnasium.com/blackxored/whos_dated_who) [![Code Climate](https://codeclimate.com/github/blackxored/whos_dated_who.png)](https://codeclimate.com/github/blackxored/whos_dated_who)

Unofficial API for http://whosdatedwho.com

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
2.1.1 (main):0> require 'whos_dated_who'
=> true
2.1.1 (main):0> WhosDatedWho::Client.new.fetch('Scarlett Johansson')
=> {:biography=>
  {:first_name=>"Scarlett",
   :middle_name=>"Ingrid",
   :last_name=>"Johansson",
   :full_name_at_birth=>"Scarlett Ingrid Johansson",
   :other_names=>["Scarlett Johanssen", "ScarJo", "Scar"],
   :age=>29,
   :born_on=>#<Date: 1984-11-22 ((2446027j,0s,0n),+0s,2299161j)>,
   :born_at=>"New York, USA",
   :height=>"5' 3\" (160 cm)",
   :weight=>"120 lbs (54.4 kg)",
   :build=>"Voluptuous",
   :eye_color=>"Green",
   :hair_color=>"Dyed Blonde",
   :distinctive_features=>["Bust", "Skin", "Big Lips"],
   :star_sign=>"Scorpio",
   :sexuality=>"Straight",
   :religion=>"Jewish",
   :ethnicity=>"White",
   :nationality=>"American",
   :high_school=>"Professional Children`s School in Manhattan, New York City, New York, USA",
   :occupation=>"Actress, Model, Singer",
   :occupation_category=>"Actress",
   :claim_to_fame=>"Ghost World, Lost in Translation, Match Point, The Black Dahlia",
   :talent_agency=>"Creative Artist Agency",
   :brand_endorsements=>
    ["Gap (2002)", "L'Oreal (2006)", "LVMH (2006)", "Disney Land Disney Park (2007)", "Walt Disney World Disney Park (2007)", "Dolce & Gabbana (2010)"],
   :measurements_inches=>"36D-25-36",
   :dress_size=>"6",
   :shoe_size=>"9",
   :websites=>["scarlett-fan.com", "scarlettjohansson.org", "scarlett-online.com", "scarlettalbum.com", "scarlett-web.net"],
   :father=>"Karsten Johansson",
   :mother=>"Melanie Sloan (manager)",
   :brothers=>["Hunter Johansson", "Adrian Johansson", "Christian Johansson"],
   :sisters=>["Vanessa Johansson", "Fenan Sloan Johansson"],
   :friends=>["Domingo Zapata", "Jeremy Renner", "Clark Gregg", "Sam Claflin"],
   :pets=>["Trooper (Cat)", "Maggie (Dog - Chihuahua)"],
   :favorite_movies=>["Heat [1995]"],
   :favorite_places=>["Paris", "London"],
   :favorite_foods=>["Fried Rice"],
   :favorite_colors=>["Blue"],
   :favorite_accessories=>["D&G Handbags", "Sunglasses"]},
 :status=>:engaged,
 :current_relationship=>
  {"human"=>"Scarlett Johansson is engaged to Romain Dauriac.", "dates"=>["Commenced Dating: November 2012", "Date Engaged: September 2013"]}}
~
```

Or get a summary through the command line:

```shell
$ whos_dated_who query "Scarlett Johansson"
engaged: Scarlett Johansson is engaged to Romain Dauriac.
Commenced Dating: November 2012, Date Engaged: September 2013
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/whos_dated_who/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
