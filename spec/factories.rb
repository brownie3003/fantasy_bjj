FactoryGirl.define do
    factory :user do
        name    "AndyBrown"
        email   "andy@example.com"
        password    "testing"
        password_confirmation   "testing"
    end    
end