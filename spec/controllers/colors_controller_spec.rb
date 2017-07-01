require 'rails_helper'

RSpec.describe ColorsController, type: :controller do
  describe "GET index" do
    it "assigns @color" do
     color = Color.create(name: "blue")
     get :index
     expect(assigns(:colors)).to eq([color])
    end

    it "render the index template" do
      get :index
      expect(response).to have_http_status(200)
      expect(response).to render_template("index")
    end
  end

  describe "GET show" do
    it "render the show template" do
      get :show
      expect(response).to have_http_status(200)
      expect(response).to render_template("show")
    end
  end

  describe "GET new" do
    it "new @color" do
      color = Color.new
      get :new
      expect(assigns(:color)).to be_a_new(Color)
    end

    it "render the new template" do
      get :new
      expect(response).to have_http_status(200)
      expect(response).to render_template("new")
    end
  end
end
