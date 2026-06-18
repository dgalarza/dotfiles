# frozen_string_literal: true

# Lookbook Preview Template for [COMPONENT_NAME]Component
# Place at: spec/components/previews/[component_name]_preview.rb

class [COMPONENT_NAME]Preview < ViewComponent::Preview
  # Default preview - basic usage
  def default
    render([COMPONENT_NAME]Component.new(
      variant: :primary,
      size: :md
    ))
  end

  # Variants preview
  def variants
    render_with_template
  end

  # Sizes preview
  def sizes
    render_with_template
  end

  # States preview (disabled, loading, etc)
  def states
    render_with_template
  end

  # Full showcase with all combinations
  def all_variants
    render_with_template
  end
end
