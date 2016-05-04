# god Account
god = FactoryGirl.create(:god)

# account onwer Account
account_owners = (0..2).map { FactoryGirl.create(:user) }

# food
foods = (0..10).map { FactoryGirl.create(:food) }

# stores
(0..3).map do
  store = FactoryGirl.create(:store)
  store.foods << foods.sample(5)
end

# histories
(0..2).map do |i|
  account_owners[i].foods << foods.sample(3)
end



