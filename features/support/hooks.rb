Before do
    page.driver.browser.manage.window.maximize
end

After do
    Capybara.reset_sessions!
end

# time out
Capybara.default_max_wait_time = 05
