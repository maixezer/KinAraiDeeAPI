FactoryGirl.define do
  factory :origin_application, class: Doorkeeper::Application do
    name 'origin'
    uid 'fd8a0b5681d52811b045b0efacb04f401bf4a0fb5712514964204c718ce61323e3ec5ad97dd92c2f1d4208c9804bddf30ad278ba89ccc199e069f5102d74242a'
    secret '1ed3057c6614fb864eeb2164af02563a64890cb298798b43448badf22c10de4bb04979ae30010e4f1e06e11b3a3e1a8c02fd6da1712a3c07a3ef35482f8186bd'
    redirect_uri 'https://localhost:3000/callback'
  end
end