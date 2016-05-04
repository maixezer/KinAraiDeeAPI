FactoryGirl.define do
  factory :food do
    name { FFaker::Food.ingredient }
    calories { Random.new.rand(100..700) }
    tags { %w(ผัก ข้าว อาหารฝรั่ง เผ็ด เส้น อาหารไทย อาหารว่าง จืด เค็ม แกง ต้ม ทอด นึ่ง ยำ).sample(4) }
  end
end
