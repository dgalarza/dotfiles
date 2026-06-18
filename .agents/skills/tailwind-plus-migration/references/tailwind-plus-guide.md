# Tailwind Plus UI Blocks Integration Guide

## Overview

Tailwind Plus UI Blocks are production-ready, accessible HTML components built with Tailwind CSS. They can be accessed via context7 documentation and wrapped in Ruby ViewComponents.

## Key Integration Points

### 1. Context7 Documentation
- **Library ID**: `/tailwindlabs/tailwindcss-ui-blocks`
- **Usage**: Fetch component documentation, variants, and props
- **When to use**: To get the latest HTML structure, CSS classes, and configuration options

### 2. ViewComponent Wrapping
- **Location**: `app/components/[component_name]_component.rb`
- **Purpose**: Wrap Tailwind Plus HTML in a reusable, testable Ruby component
- **Benefits**: Type safety, slot rendering, prop validation

### 3. Lookbook Integration
- **Location**: `spec/components/previews/[component_name]_preview.rb`
- **Purpose**: Visual preview and documentation of component variants
- **Access**: Run `bin/lookbook` and navigate to preview
- **Benefits**: Interactive component playground, variant showcase

## Component Structure

```
Component Definition (ViewComponent)
    ↓
HTML Template (from Tailwind Plus)
    ↓
Slot Definitions (renders_one, renders_many)
    ↓
Prop Validation
    ↓
Test Coverage (RSpec)
    ↓
Lookbook Preview
```

## Standard Workflow

1. **Fetch Tailwind Plus docs** via context7
2. **Design ViewComponent interface** based on Block's props and slots
3. **Generate component scaffold** with proper structure
4. **Create RSpec tests** for prop validation and rendering
5. **Generate Lookbook preview** with variants
6. **Document usage** with examples

## Migration Considerations

- **Backwards Compatibility**: Old component may need deprecation period
- **Prop Mapping**: Document how old props map to new props
- **Breaking Changes**: Clearly list any API changes
- **Usage Patterns**: Identify all current usages in codebase
