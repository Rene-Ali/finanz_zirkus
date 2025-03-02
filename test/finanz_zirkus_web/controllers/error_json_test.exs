defmodule FinanzZirkusWeb.ErrorJSONTest do
  use FinanzZirkusWeb.ConnCase, async: true

  test "renders 404" do
    assert FinanzZirkusWeb.ErrorJSON.render("404.json", %{}) == %{errors: %{detail: "Not Found"}}
  end

  test "renders 500" do
    assert FinanzZirkusWeb.ErrorJSON.render("500.json", %{}) ==
             %{errors: %{detail: "Internal Server Error"}}
  end
end
