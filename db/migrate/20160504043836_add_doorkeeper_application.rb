class AddDoorkeeperApplication < ActiveRecord::Migration[5.0]
  def up
    case Rails.env
      when "production"
        redirect_uri = "https://kin-arai-dee-staging.herokuapp.com/callback"

        origin_uid = "a9ecda448c7f532c211ed8c751712b87f29d29301045eb0f376674f14fea4e80c66f97482058e05297302c0ca720529ebd996f55ce374d3cffa7024427efff17"
        origin_secret = "0f4ada3be259f7dcce13b62f425f1009c4d55ad76c13d348e096c5b24b9a48a160facc8ad2de7107f90e19ca06e9dd003688d15f059866f0730223ee74f21e5f"
      when "staging"
        redirect_uri = "https://kin-arai-dee-staging.herokuapp.com/callback"

        origin_uid = "fd1f7c5546822643949f18a5482b62fc38c7f1458b5a15f044606e5b4ba3dfce06b22cc77f1c933ff182818f1244794126cba1343e8f5d16de13c0ea67c446a3"
        origin_secret = "73c2f7bfb89cfedc1d8fb0b491c3e3b3fb3477b8a44b4a9a1a50a0ba79bf96d01b7ed15e1b70bc3ea1b984ae4c86197fd517bb793c2b3da96dd8cfcdbf846e3b"
      else
        redirect_uri = "http://localhost:3000/callback"

        origin_uid = "df1dbfac2e75cab3bf4ea1708b57e27a931462b49910e8da1a27b485ef1613a27187cbb27e01c9b85165a542aa26ab8f588cfe3b64b1b8ff4aaa0db550b391ad"
        origin_secret = "502a12551930fbeef94271b88609937386cf4ce6bc27ef4e3d748ef4dd31e0351fb5128efee3d1d0d9441c1e43e07a43694dbb8cbcf9e53afc693eac307107f4"
    end

    Doorkeeper::Application.create(name: 'origin', uid: origin_uid, secret: origin_secret, redirect_uri: redirect_uri)
  end

  def down
    Doorkeeper::Application.destroy_all
  end
end
