FactoryGirl.define do
  factory :movie do
     title 'Wrestler' # these are default values that we can chnge iwhile testing
     rating 'PG'
     release_date {8.years.ago}
  end
end