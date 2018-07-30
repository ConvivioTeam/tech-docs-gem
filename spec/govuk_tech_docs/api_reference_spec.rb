RSpec.describe GovukTechDocs::ApiReference do
  describe '#uri?' do
    it 'identifies a relative path' do
      app = FakeApp.new(generate_config);
      path = '../test.yml'
      uri = GovukTechDocs::ApiReference.new(app).uri?(path)

      expect(uri).to eql(false)
    end

    it 'identifies a uri path' do
      app = FakeApp.new(generate_config);
      path = 'https://gov.uk'
      uri = GovukTechDocs::ApiReference.new(app).uri?(path)

      expect(uri).to eql(true)
    end
  end

  class FakeApp
    attr_reader :config
    def initialize(config = {})
      @config = config
    end
  end

  def generate_config(config = {})
    {
      tech_docs: {
        host: "https://www.example.org",
        service_name: "Test Site",
        api_path: '../test.yml'
      }.merge(config)
    }
  end
end
