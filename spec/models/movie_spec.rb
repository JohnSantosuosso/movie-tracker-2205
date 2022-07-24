require 'rails_helper'

RSpec.describe Movie do
  describe 'relationships' do
    it { should belong_to :studio }
    it { should have_many :movie_actors }
    it { should have_many(:actors).through(:movie_actors) }
  end

  before(:each) do
    @studio_1 = Studio.create(name: "Universal Studios", location: "Hollywood")

    @movie_1 = @studio_1.movies.create(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure', studio_id: @studio_1.id)
    @movie_2 = @studio_1.movies.create(title: 'Indiana Jones', creation_year: 1977, genre: 'Action/Adventure', studio_id: @studio_1.id)

    @actor_1 = Actor.create(name: 'Harrison Ford', age: 35)
    @actor_2 = Actor.create(name: 'Sean Connery', age: 52)

    @movie_actors_1 = @movie_1.movie_actors.create(actor_id: @actor_1.id)
    @movie_actors_2 = @movie_1.movie_actors.create(actor_id: @actor_2.id)
  end

  describe 'instance methods' do
    it "should youngest_to_oldest_actors" do
      expect(@movie_1.youngest_to_oldest_actors).to eq([@actor_1, @actor_2])
    end

    it "should average_actor_age" do
      expect(@movie_1.average_actor_age).to eq(43.5)
    end
  end
end