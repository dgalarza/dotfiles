# frozen_string_literal: true

# RSpec template for [COMPONENT_NAME]Component
# Place at: spec/components/[component_name]_component_spec.rb

require 'rails_helper'

describe [COMPONENT_NAME]Component, type: :component do
  describe 'rendering' do
    it 'renders the component' do
      render_inline(described_class.new)
      expect(page).to have_content('[Expected content]')
    end
  end

  describe 'variants' do
    it 'renders primary variant by default' do
      render_inline(described_class.new(variant: :primary))
      expect(rendered_component).to include('[Primary variant class]')
    end

    it 'renders secondary variant' do
      render_inline(described_class.new(variant: :secondary))
      expect(rendered_component).to include('[Secondary variant class]')
    end

    it 'defaults to primary variant for unknown variant' do
      render_inline(described_class.new(variant: :unknown))
      expect(rendered_component).to include('[Primary variant class]')
    end
  end

  describe 'sizes' do
    it 'renders small size' do
      render_inline(described_class.new(size: :sm))
      expect(rendered_component).to include('[Small size class]')
    end

    it 'renders medium size by default' do
      render_inline(described_class.new(size: :md))
      expect(rendered_component).to include('[Medium size class]')
    end

    it 'renders large size' do
      render_inline(described_class.new(size: :lg))
      expect(rendered_component).to include('[Large size class]')
    end

    it 'defaults to medium size for unknown size' do
      render_inline(described_class.new(size: :unknown))
      expect(rendered_component).to include('[Medium size class]')
    end
  end

  describe 'states' do
    it 'renders disabled state' do
      render_inline(described_class.new(disabled: true))
      expect(rendered_component).to include('opacity-50')
      expect(rendered_component).to include('cursor-not-allowed')
    end

    it 'renders enabled state by default' do
      render_inline(described_class.new(disabled: false))
      expect(rendered_component).not_to include('opacity-50')
    end
  end

  describe 'html options' do
    it 'applies additional CSS classes' do
      render_inline(described_class.new(class: 'custom-class'))
      expect(rendered_component).to include('custom-class')
    end

    it 'applies additional HTML attributes' do
      render_inline(described_class.new(data: { test: 'value' }))
      expect(rendered_component).to include('data-test="value"')
    end
  end
end
