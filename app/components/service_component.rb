# frozen_string_literal: true

class ServiceComponent < ViewComponent::Base
 with_collection_parameter :service


  def initialize(service:)
    @service = service
  end
end
