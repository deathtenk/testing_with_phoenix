
# example of a model spec in Phoenix
defmodule TestingWithPhoenix.UserSpec do
  use ESpec.Phoenix, model: User, async: true
  alias TestingWithPhoenix.User
  
  @valid_attrs %{name: "User", username: "henk", password: "secret"}
  # @bad_map = fn (attr,message) {attr, {message, []}}

  describe "user model" do
    context "for valid attributes" do
      it "changeset is valid when attributes are valid" do
        # passes some data to the User changeset function
        changeset = User.changeset(%User{}, @valid_attrs) 
        expect(changeset.valid?).to be_true
      end
    end

    context "for invalid attributes" do
      let(:blank_attrs) do
        %{}
      end
      let(:long_username_attrs) do 
        Map.put(@valid_attrs, :username, String.duplicate("a", 30))
      end
      

      it "changeset is invalid when attributes are blank" do
        # errors are actually given before we've even made a transaction
        # so we can validate an error by checking the changeset
        changeset = User.changeset(%User{}, blank_attrs)
        expect(changeset.valid?).to be_false
        
        {message, []} = changeset.errors[:username]
        expect(message).to be(~s|can't be blank|)
      end


      it "should be invalid when username is too long" do
        changeset = User.changeset(%User{}, long_username_attrs)
        expect(changeset.valid?).to be_false

        # note, pattern matching is very, VERY powerful
        {message, [count: count]} = changeset.errors[:username]
        expect(count).to be(20)
        expect(message).to be(~S|should be at most %{count} character(s)|)
      end
    end
  end
end
