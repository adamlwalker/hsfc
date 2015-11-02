require 'rails_helper'

describe SubmissionsController, type: :controller do
  describe "GET index" do
    it "assigns @submissions" do
      submission = create(:submission)
      get :index
      expect(assigns(:submissions)).to eq([submission])
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end
end
