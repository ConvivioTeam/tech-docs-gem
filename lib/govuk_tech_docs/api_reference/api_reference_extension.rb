module GovukTechDocs
  class ApiReferenceExtension < Middleman::Extension
    expose_to_application api: :api
    def initialize(app, options_hash = {}, &block)
      super

      @api_reference = GovukTechDocs::ApiReference.new(app)
    end

    def api(text)
      @api_reference.api(text)
    end

  end
end

::Middleman::Extensions.register(:api_reference, GovukTechDocs::ApiReferenceExtension)
