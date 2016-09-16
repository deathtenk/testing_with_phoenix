# it's good practice to put the live db spec in a seperate folder

defmodule TestingWithPhoenix.UserRepoSpec do
  use ESpec.Phoenix, model: User, async: true
  alias TestingWithPhoenix.User
  
  @current_user %{ name: "a user", username: "henk", password: "secret" }

  describe "converting unique_constraint on username to error" do

    let :valid_user do
      struct(TestingWithPhoenix.User, @current_user)
    end

    let :changeset do
      attrs = Map.put(@current_user, :username, "henk")
      User.changeset(%User{}, attrs)
    end

    before do: valid_user |> TestingWithPhoenix.Repo.insert!

    it do: expect(changeset |> Repo.insert!).to be_error_result

    context "when name has been already taken" do
      let :new_changeset do
        {:error, changeset} = changeset |> Repo.insert
        changeset
      end

      it "has error" do
        error = {:username, {"has already been taken", []}}
        expect(new_changeset.errors).to have(error)
      end
    end
  end
end  
