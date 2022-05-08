# frozen_string_literal: true

module Admin::CoursesHelper
  def options_for_category
    options_for_select(Course.categories.keys.map { |k| [t("course_category.#{k}"), k] }, @course.category)
  end

  def options_for_status
    options_for_select(Course.statuses.keys.map { |k| [t("course_status.#{k}"), k] }, @course.status)
  end

  def options_for_currency
    options_for_select(Course.currencies.keys.map { |k| [t("course_currency.#{k}"), k] }, @course.currency)
  end
end
