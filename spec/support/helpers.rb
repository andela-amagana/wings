module Helpers
  def search_flights
    visit root_path
    find_all("div.select-wrapper input").first.click
    find("div.select-wrapper li", text: "Goroka").click
    find_all("div.select-wrapper input")[1].click
    find("div.select-wrapper li", text: "Madang").click
    find_all("div.select-wrapper input")[2].click
    find("div.select-wrapper li", text: "1").click
    page.execute_script("$('.datepicker').pickadate('picker')."\
                        "set('select', '22 October, 2016')")
    click_button("submit")
  end

  def add_booking_details
    sleep(0.3)
    selected_flight = find_all("input.flight_option").first
    sleep(0.3)
    selected_flight.click
    find("div.col #submit_option").click
    fill_in("booking_email", with: "gatobumalex@gmail.com")
    find_all("div.nested-fields div.field input").first.set("ANDREW WHITE")
    find_all("div.nested-fields div.field input")[1].set("WQ23DFG324D")
    sleep(0.3)
    find_all("div.actions input").first.click
    sleep(0.3)
  end

  def stub_current_user(user)
    allow_any_instance_of(ApplicationController).
      to receive(:current_user).and_return(user)
  end
end
