require 'rails_helper'

RSpec.describe "Posts", type: :request do
  describe "GET /posts" do
    it "gets the posts" do
      name = "tony"
      body = "hi welcome to fortchan13"
      image_url = "http://s3.amazon.butt/frisk_the_frog.jpg"
      5.times do
        Post.create name: name, body: body, image_url: image_url
      end
      get posts_path
      expect(response).to have_http_status(200)
      json = JSON.parse response.body
      expect(json["posts"].length).to eq 5
    end
  end
  describe "GET /post" do
    it "gets a single post" do
      name = "tony"
      body = "hi welcome to fortchan13"
      image_url = "http://s3.amazon.butt/frisk_the_frog.jpg"
      post = Post.create name: name, body: body, image_url: image_url
      get post_path(post)
      expect(response).to have_http_status(200)
      json = JSON.parse response.body
      expect(json["post"]["name"]).to eq name
      expect(json["post"]["body"]).to eq body
      expect(json["post"]["image_url"]).to eq image_url
    end
  end
  describe "POST /posts" do
    it "creates a new post" do
      name = "tony"
      body = "hi welcome to fortchan13"
      image_url = "http://s3.amazon.butt/frisk_the_frog.jpg"
      post posts_path, { post: { name: name, body: body, image_url: image_url } }
      expect(response).to have_http_status(200)
      json = JSON.parse response.body
      expect(json["post"]["name"]).to eq name
      expect(json["post"]["body"]).to eq body
      expect(json["post"]["image_url"]).to eq image_url
    end
  end
end
