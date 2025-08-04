# frozen_string_literal: true

class ServiceComponent < ViewComponent::Base
 with_collection_parameter :service

 erb_template <<-ERB
    <li class="bg-gray-100 rounded-xl border border-gray-300 p-4 hover:bg-gray-200 transition">
      <h2 class="text-lg font-semibold text-gray-800"><%= @service.name %></h2>
      <p class="mt-1 text-gray-700"><%= @service.description.presence || "No description provided." %></p>

      <div class="mt-4">
        <%= button_to "Delete", @service,
          method: :delete,
          data: { turbo_confirm: "Are you sure?" },
          class: "text-sm  bg-red-500 hover:bg-red-600 px-3 py-1 rounded" %>
      </div>
    </li>
  ERB

  def initialize(service:)
    @service = service
  end
end
