require "application_system_test_case"

class ProductCartsTest < ApplicationSystemTestCase
  setup do
    @cart_product = cart_products(:one)
  end

  test "visiting the index" do
    visit cart_products_url
    assert_selector "h1", text: "Product Carts"
  end

  test "creating a Product cart" do
    visit cart_products_url
    click_on "New Product Cart"

    fill_in "Cart", with: @cart_product.cart_id
    fill_in "Products", with: @cart_product.products_id
    click_on "Create Product cart"

    assert_text "Product cart was successfully created"
    click_on "Back"
  end

  test "updating a Product cart" do
    visit cart_products_url
    click_on "Edit", match: :first

    fill_in "Cart", with: @cart_product.cart_id
    fill_in "Products", with: @cart_product.products_id
    click_on "Update Product cart"

    assert_text "Product cart was successfully updated"
    click_on "Back"
  end

  test "destroying a Product cart" do
    visit cart_products_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Product cart was successfully destroyed"
  end
end
