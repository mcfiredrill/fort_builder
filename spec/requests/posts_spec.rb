require 'rails_helper'

RSpec.describe "Posts", type: :request do
  describe "GET /posts" do
    it "gets the posts" do
      name = "tony"
      body = "hi welcome to fortchan13"
      5.times do
        Post.create name: name, body: body
      end
      get posts_path
      expect(response).to have_http_status(200)
      json = JSON.parse response.body
      expect(json.length).to eq 5
    end
  end
  describe "GET /post" do
    it "gets a single post" do
      name = "tony"
      body = "hi welcome to fortchan13"
      post = Post.create name: name, body: body
      get post_path(post)
      expect(response).to have_http_status(200)
      json = JSON.parse response.body
      expect(json["name"]).to eq name
      expect(json["body"]).to eq body
    end
  end
  describe "POST /posts" do
    it "creates a new post" do
      name = "tony"
      body = "hi welcome to fortchan13"
      post posts_path, { post: { name: name, body: body } }
      expect(response).to have_http_status(200)
      json = JSON.parse response.body
      expect(json["name"]).to eq name
      expect(json["body"]).to eq body
    end
  end
end
