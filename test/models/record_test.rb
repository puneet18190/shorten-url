require 'test_helper'

class RecordTest < ActiveSupport::TestCase

  test "check presence of shorten url on create" do
    obj = Record.create(url: 'http://github.com')
    assert obj.get_shorten_link
    assert_match /[a-zA-Z0-9]/, obj.get_shorten_link
  end

  test "validate presence of url on create" do
    obj = Record.create(url: 'http://github.com')
    assert obj.url, 'http://github.com'
  end

  test "existing records should have shorten url" do
    obj = Record.create(url: 'http://abc.com')
    find_obj = Record.find(obj.id)
    assert find_obj.get_shorten_link
    assert_equal find_obj.get_shorten_link, obj.get_shorten_link
    assert_match /[a-zA-Z0-9]/, obj.get_shorten_link
    assert_match /[a-zA-Z0-9]/, find_obj.get_shorten_link
  end

  test "should not save record without url" do
    record = Record.new
    assert_not record.save
  end

  test "should not save record with invalid url" do
    record = Record.new(url: 'example.com')
    assert_not record.save
  end

  test "encoder should return value" do
    obj = Record.create(url: 'http://abc.com')
    assert obj.encoder(obj.id)
    assert_match /[a-zA-Z0-9]/, obj.encoder(obj.id)
  end

  test "decoder should return original ID of record" do
    obj = Record.create(url: 'http://abc.com')
    encoder_val = obj.encoder(obj.id)
    decoder_val = Record.decoder(encoder_val)
    assert_equal decoder_val, obj.id
    assert_match /[a-zA-Z0-9]/, encoder_val
  end

  test 'should fetch original url from a shorten url' do
    obj = Record.create(url: 'http://google.com')
    encoder_val = obj.encoder(obj.id)
    decoder_val = Record.decoder(encoder_val)

    new_obj = Record.find_by(id: obj.id)
    assert_equal new_obj.url, obj.url
  end

end
