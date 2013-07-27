describe Spree::Admin::UsersController do
  setup do
    @user = FactoryGirl.new(:user)
  end
  it "should create a user and seller_user given a seller" do
    post 'create', {:seller_id => 1}
    response.should_redirect_to admin_sellers_path
  end
end
