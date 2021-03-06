require "rails_helper"

RSpec.describe UsersController, type: :controller do
  subject(:user) { create :user }

  describe "#show" do
    before(:each) do
      get :show, params: { id: user.id }
    end

    it "returns a status code of 200" do
      expect(response.status).to eq 200
    end

    it "renders the show template" do
      expect(response).to render_template("show")
    end
  end

  describe "#new" do
    before(:each) do
      get :new
    end

    it "assigns user record to user" do
      expect(assigns(:user)).to be_a_new(User)
    end

    it "returns a status code 200" do
      expect(response.status).to eq 200
    end

    it "renders the new template" do
      expect(response).to render_template("new")
    end
  end

  describe "#create" do
    context "with valid attributes" do
      let(:user_create_request) do
        post :create, params: { user: attributes_for(:user) }
      end

      it "creates new user" do
        expect { user_create_request }.to change(User, :count).by(1)
      end

      it "returns a status code of 302" do
        user_create_request
        expect(response.status).to eq 302
      end

      it "redirects to the log in view" do
        user_create_request
        expect(response).to redirect_to(flights_path)
      end
    end

    context "with invalid attributes" do
      let(:invalid_user_create_request) do
        post :create,
             params: {
               user: attributes_for(
                 :user,
                 first_name: nil,
                 middle_name: nil,
                 last_name: nil
               )
             }
      end

      it "does not create a new user" do
        expect { invalid_user_create_request }.to_not change(User, :count)
      end

      it "renders the new user template" do
        invalid_user_create_request
        expect(response).to render_template("new")
      end
    end
  end

  describe "#reset_password" do
    it "renders the passowrd reset view" do
      get :reset_password
      expect(response).to render_template("reset_password")
    end
  end

  describe "#send_reset_email" do
    context "with valid email" do
      before(:each) do
        post :send_reset_email, params: { email: user.email }
      end

      it "redirects to log in view" do
        expect(response).to redirect_to(login_path)
      end
    end

    context "with invalid email" do
      before(:each) do
        post :send_reset_email, params: { email: nil }
      end

      it "redirects to rest password view" do
        expect(response).to redirect_to(reset_password_path)
      end
    end
  end
end
