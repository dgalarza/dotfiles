# Template for ViewComponent wrapper around Tailwind Plus UI Block
# Replace [COMPONENT_NAME] and [ATTRIBUTES] with actual component details
# frozen_string_literal: true

class [COMPONENT_NAME]Component < ApplicationComponent
  VARIANT_MAPPINGS = {
    primary: "bg-blue-600 text-white hover:bg-blue-700",
    secondary: "bg-gray-200 text-gray-900 hover:bg-gray-300"
  }.freeze

  SIZE_MAPPINGS = {
    sm: "px-3 py-2 text-sm",
    md: "px-4 py-2 text-base",
    lg: "px-6 py-3 text-lg"
  }.freeze

  renders_one :icon, IconComponent  # Example slot - customize as needed
  renders_many :items, ItemComponent  # Example slot - customize as needed

  def initialize(
    # Common attributes - customize based on Tailwind Plus block
    variant: :primary,
    size: :md,
    disabled: false,
    **html_options
  )
    @variant = variant
    @size = size
    @disabled = disabled
    @html_options = html_options
  end

  private

  attr_reader :variant, :size, :disabled, :html_options

  def component_classes
    base_classes = "inline-flex items-center justify-center font-medium rounded-lg transition-colors"
    variant_classes = VARIANT_MAPPINGS.fetch(variant, VARIANT_MAPPINGS[:primary])
    size_classes = SIZE_MAPPINGS.fetch(size, SIZE_MAPPINGS[:md])
    state_classes = disabled ? "opacity-50 cursor-not-allowed" : ""
    custom_classes = html_options[:class] || ""

    "#{base_classes} #{variant_classes} #{size_classes} #{state_classes} #{custom_classes}".strip
  end
end
