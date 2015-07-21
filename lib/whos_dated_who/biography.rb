require 'date'

class Biography < Hashie::Trash
  include Hashie::Extensions::IgnoreUndeclared

  @split_on_comma = ->(i) { i.is_a?(Array) ? i : i.split(', ') }
  @parse_date     = ->(i) { Date.parse(i) }

  property :first_name
  property :middle_name
  property :last_name
  property :maiden_name
  property :full_name_at_birth
  property :other_names # array
  property :age, transform_with: ->(i) { i.to_i }
  property :born_on, from: :date_of_birth, transform_with: @parse_date
  property :born_at, from: :birthplace
  property :height
  property :weight
  property :description
  property :build
  property :eye_color
  property :hair_color
  property :distinctive_features # array
  property :star_sign
  property :sexuality
  property :religion
  property :ethnicity
  property :nationality
  property :high_school
  property :occupation
  property :occupation_category
  property :claim_to_fame # array
  property :talent_agency
  property :brand_endorsements # array
  property :measurements_inches
  property :dress_size
  property :shoe_size
  property :websites, from: :official_website # array
  property :father
  property :mother
  property :brothers # array
  property :sisters # array
  property :friends, transform_with: @split_on_comma
  property :pets # array
  property :favorite_movies, transform_with: @split_on_comma
  property :favorite_places
  property :favorite_foods,  transform_with: @split_on_comma
  property :favorite_colors, transform_with: @split_on_comma
  property :favorite_accessories
end
