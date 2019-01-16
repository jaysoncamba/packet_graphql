# Helper for loading data from fixture files.
module FixtureHelper
  def load_fixture(path)
    File.read Rails.root.join('spec', 'fixtures', path)
  end
end
