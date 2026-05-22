---
name: tailwind-plus-migration
description: This skill should be used when creating ViewComponent wrappers for Tailwind Plus UI Blocks. It guides the process of fetching Tailwind Plus component documentation, designing a ViewComponent interface, generating component code with proper variant handling, creating unit tests, and setting up Lookbook previews with automatically generated variants.
---

# Tailwind Plus Migration Skill

## Purpose

Streamline the migration from home-grown UI components to Tailwind Plus UI Blocks by automating the creation of well-structured, tested, and documented ViewComponent wrappers.

## When to Use This Skill

Use this skill when:
- Creating a new ViewComponent wrapper for a Tailwind Plus UI Block
- You have a component name (e.g., "Button", "Select") or HTML example
- You need the component in `app/components/`
- You need unit tests in `spec/components/`
- You need a Lookbook preview in `spec/components/previews/`

**Do NOT use for:**
- Modifying existing components (use normal editing)
- Refactoring without a Tailwind Plus migration goal
- Creating entirely custom components without a Tailwind Plus basis

## Workflow

### Phase 1: Component Definition (User Input)

The user provides:
- **Component name** (e.g., "Button", "Modal", "Select") OR
- **HTML example** (paste the Tailwind Plus HTML block)
- **Project-specific requirements** (optional, e.g., "needs to support a loading state")

### Phase 2: Fetch Tailwind Plus Documentation

Use context7 to retrieve the Tailwind Plus UI Block documentation:

1. Resolve the library ID for Tailwind Plus UI Blocks
2. Fetch the component documentation with focus on:
   - HTML structure and class requirements
   - Available variants and states
   - Props/attributes supported
   - Slot/content areas available
   - Accessibility features (ARIA, roles)

**Key information to extract:**
- All variant options (e.g., primary, secondary, ghost, etc.)
- All size options (e.g., sm, md, lg, xl)
- All state combinations (disabled, loading, active, etc.)
- Required vs. optional content/slots
- Customization points (colors, icons, etc.)

### Phase 3: Design ViewComponent Interface

Analyze the Tailwind Plus documentation and design a Ruby interface:

1. **Props**: Map HTML attributes to Ruby parameters
   - Variants as symbol enums
   - Sizes as symbol enums
   - Boolean flags for states
   - **Always include `**html_options`** for flexibility

2. **Slots**: Identify content areas that map to `renders_one` or `renders_many`
   - Icon slots (typically `renders_one`)
   - List items (typically `renders_many`)
   - Footer/header actions
   - Custom content areas

3. **Class Mappings**: Create constant hashes for variants and sizes
   - Use `VARIANT_MAPPINGS` hash with symbols as keys
   - Use `SIZE_MAPPINGS` hash with symbols as keys
   - Extract base classes that apply to all variants
   - Use `.fetch(key, default)` to safely handle unknown values

4. **Helper Methods**: Identify any conditional logic
   - Methods that return CSS classes based on state
   - Methods that determine visibility (e.g., `show_icon?`)
   - Private methods for computed values

### Phase 4: Generate ViewComponent

Create the ViewComponent file using the structure from `assets/viewcomponent_template.rb`:

```ruby
# app/components/[component_name]_component.rb
class [COMPONENT_NAME]Component < ApplicationComponent
  VARIANT_MAPPINGS = {
    # variant_name: "tailwind classes"
  }.freeze

  SIZE_MAPPINGS = {
    # size_name: "tailwind classes"
  }.freeze

  # renders_one and renders_many declarations

  def initialize(
    # All props with sensible defaults
    **html_options
  )
    # Store all parameters
  end

  private

  # attr_reader for all instance variables

  def component_classes
    # Combine base, variant, size, and state classes
  end

  # Additional helper methods as needed
end
```

**Important patterns:**
- Always use `attr_reader` in private section for all instance variables
- Use `.freeze` on constant hashes
- Build CSS classes by combining base + variant + size + state + custom
- Use `strip` to clean up final class string
- Handle unknown variant/size values with sensible defaults using `.fetch()`

### Phase 5: Create Component Template

Create the ERB template at `app/components/[component_name]_component.html.erb`:

1. Use the HTML structure from Tailwind Plus docs
2. Replace hardcoded classes with `component_classes` method
3. Implement `renders_one` and `renders_many` slots
4. Add accessibility attributes (aria-*, role, etc.)
5. Add `data-testid` attributes for testing

Example structure:
```erb
<button class="<%= component_classes %>" <%= html_attributes %>>
  <% if icon.present? %>
    <%= render icon %>
  <% end %>
  <%= content %>
</button>
```

### Phase 6: Generate Unit Tests

Create RSpec tests at `spec/components/[component_name]_component_spec.rb`:

Use the template from `assets/rspec_template.rb`. Generate test cases for:

1. **Basic rendering**: Component renders without errors
2. **Variants**: Each variant renders with correct classes
   - Test each variant in VARIANT_MAPPINGS
   - Verify correct classes are applied
   - Test default variant behavior
3. **Sizes**: Each size renders with correct classes
   - Test each size in SIZE_MAPPINGS
   - Verify correct classes are applied
   - Test default size behavior
4. **States**: Disabled/loading/active states work
   - Test each state that has class changes
   - Verify classes appear/disappear correctly
5. **HTML options**: Custom classes and attributes are applied
   - Test passing custom `class:` option
   - Test passing custom `data:` attributes
   - Verify they're appended correctly

**Test patterns to follow:**
```ruby
# For variant testing
it 'renders [variant] variant' do
  render_inline(described_class.new(variant: :[variant]))
  expect(rendered_component).to include('[Expected class]')
end

# For state testing
it 'applies disabled state' do
  render_inline(described_class.new(disabled: true))
  expect(rendered_component).to include('opacity-50')
  expect(rendered_component).to include('cursor-not-allowed')
end
```

### Phase 7: Generate Lookbook Preview

Create Lookbook preview files:

1. **Preview class** at `spec/components/previews/[component_name]_preview.rb`
   - Use template from `assets/lookbook_template.rb`
   - Create preview methods for each section

2. **Preview template** at `spec/components/previews/[component_name]_preview/[method].html.erb`
   - Use template from `assets/lookbook_template.html.erb`
   - Show all variants automatically
   - Show all sizes automatically
   - Show all states automatically
   - Create organized sections with clear labels

**Lookbook preview methods:**
- `default`: Basic usage example
- `variants`: All variant combinations
- `sizes`: All size options
- `states`: Disabled, loading, active, etc.
- `all_variants`: Optional—comprehensive showcase

### Phase 8: Document Usage

Add inline documentation to the component for LLM consumption:

```ruby
# At the top of the component class:
# [COMPONENT_NAME]Component
#
# A Tailwind Plus wrapper for the [Component] UI block.
#
# Variants: :primary, :secondary, :ghost (default: :primary)
# Sizes: :sm, :md, :lg (default: :md)
# States: disabled boolean
#
# Usage:
#   <%= render ButtonComponent.new(
#     variant: :primary,
#     size: :lg,
#     class: 'my-custom-class'
#   ) %>
#
# With slots:
#   <%= render ButtonComponent.new do |c| %>
#     <% c.with_icon { icon_svg } %>
#   <% end %>
```

## Input Examples

### Example 1: By Component Name

**User says:**
> Create a Button component from Tailwind Plus

**Skill does:**
1. Looks up "Button" in Tailwind Plus UI Blocks docs via context7
2. Extracts variants (primary, secondary, ghost, danger)
3. Extracts sizes (sm, md, lg)
4. Generates ViewComponent with VARIANT_MAPPINGS and SIZE_MAPPINGS
5. Creates RSpec tests for all variants and sizes
6. Creates Lookbook preview with variant showcase
7. Documents the component with usage examples

### Example 2: By HTML Example

**User pastes:**
```html
<div class="relative inline-flex group">
  <select class="peer h-12 w-full border border-gray-200 px-4 py-2 text-black focus:border-blue-400">
    <option>Option 1</option>
    <option>Option 2</option>
  </select>
  <!-- Custom arrow icon -->
</div>
```

**Skill does:**
1. Identifies this as a custom Select component
2. Fetches Tailwind Plus Select documentation
3. Maps the HTML structure to a ViewComponent
4. Creates variant mappings for states (default, error, disabled)
5. Generates full component with tests and preview

## Output Artifacts

For each component created, generate:

1. **ViewComponent** (`app/components/[component_name]_component.rb`)
   - 50-100 lines with proper structure
   - VARIANT_MAPPINGS and SIZE_MAPPINGS constants
   - Clear private methods for class building
   - Inline documentation

2. **Template** (`app/components/[component_name]_component.html.erb`)
   - Direct translation of Tailwind Plus HTML
   - All slots implemented
   - Accessibility attributes present
   - data-testid attributes for testing

3. **RSpec Tests** (`spec/components/[component_name]_component_spec.rb`)
   - Tests for variants, sizes, states, HTML options
   - Clear test descriptions
   - Ready to run (fill in exact class names)

4. **Lookbook Preview**
   - Preview class at `spec/components/previews/[component_name]_preview.rb`
   - Preview templates showing all variants
   - Organized sections with descriptions
   - Screenshot-ready

5. **Documentation** (inline in component)
   - Component purpose
   - Available variants
   - Available sizes
   - Usage examples
   - Slot documentation (if applicable)

## Reference Material

- See `references/tailwind-plus-guide.md` for integration overview
- See `assets/viewcomponent_template.rb` for component structure pattern
- See `assets/rspec_template.rb` for test patterns
- See `assets/lookbook_template.rb` and `lookbook_template.html.erb` for preview patterns

## Success Criteria

A successful component migration should result in:

- ✅ ViewComponent renders correctly with all variants and sizes
- ✅ RSpec tests pass with 100% of variants and states tested
- ✅ Lookbook preview displays all variants and states visually
- ✅ Component can be used in templates: `<%= render ButtonComponent.new(variant: :primary) %>`
- ✅ Inline documentation explains props, variants, and usage
- ✅ VARIANT_MAPPINGS and SIZE_MAPPINGS use constant hashes (frozen)
- ✅ No hardcoded class strings in helper methods—all classes from mappings or methods

## Example Output Structure

```
Created: app/components/button_component.rb
Created: app/components/button_component.html.erb
Created: spec/components/button_component_spec.rb
Created: spec/components/previews/button_preview.rb
Created: spec/components/previews/button_preview/default.html.erb
Created: spec/components/previews/button_preview/variants.html.erb
Created: spec/components/previews/button_preview/sizes.html.erb
Created: spec/components/previews/button_preview/states.html.erb

Next steps:
1. Run tests: bundle exec rspec spec/components/button_component_spec.rb
2. View in Lookbook: bin/lookbook
3. Update any test assertions with correct class names
4. Commit files and create PR
```
