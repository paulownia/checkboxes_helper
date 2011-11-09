require "checkboxes_helper/checkboxes_builder"

ActionView::Helpers::FormBuilder.class_eval { include CheckboxesHelper::CheckboxesBuilder }
