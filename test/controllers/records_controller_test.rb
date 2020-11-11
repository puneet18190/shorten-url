require 'test_helper'

class RecordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @record = records(:one)
  end

  test "should get index" do
    get records_url
    assert_response :success
  end

  test "should get new" do
    get new_record_url
    assert_response :success
  end

  test "should create record" do
    assert_difference('Record.count') do
      post records_url, params: { record: { count: @record.count, shorten_url: @record.shorten_url, url: @record.url } }
    end

    assert_redirected_to record_url(Record.last)
  end

  test "should show record" do
    get record_url(@record)
    assert_response :success
  end

  test "should get edit" do
    get edit_record_url(@record)
    assert_response :success
  end

  test "should update record" do
    patch record_url(@record), params: { record: { count: @record.count, shorten_url: @record.shorten_url, url: @record.url } }
    assert_redirected_to record_url(@record)
  end

  test "should destroy record" do
    assert_difference('Record.count', -1) do
      delete record_url(@record)
    end

    assert_redirected_to records_url
  end

  test "should redirect to original url using shorten url" do
    @record = Record.create(url: 'https://abc.com')
    get @record.get_shorten_link
    assert_response :redirect
    assert_redirected_to @record.url
    assert_equal @response.code, "302"
  end

  test "should increase click count after open shorten url" do
    @record = Record.create(url: 'https://abc.com')
    original_count = @record.count
    get @record.get_shorten_link
    assert_equal original_count+1, Record.find(@record.id).count
  end
end
