require "test_helper"

class RipplesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ripple = ripples(:one)
  end

  test "should get index" do
    get ripples_url
    assert_response :success
  end

  test "should get new" do
    get new_ripple_url
    assert_response :success
  end

  test "should create ripple" do
    skip
    assert_difference('Ripple.count') do
      post ripples_url, params: { ripple: { message: @ripple.message, name: @ripple.name, url: @ripple.url } }
    end

    assert_redirected_to ripple_url(Ripple.last)
  end

  test "should show ripple" do
    get ripple_url(@ripple)
    assert_response :success
  end

  test "should get edit" do
    skip
    get edit_ripple_url(@ripple)
    assert_response :success
  end

  test "should update ripple" do
    skip
    patch ripple_url(@ripple), params: { ripple: { message: @ripple.message, name: @ripple.name, url: @ripple.url } }
    assert_redirected_to ripple_url(@ripple)
  end

  test "should destroy ripple" do
    skip
    assert_difference('Ripple.count', -1) do
      delete ripple_url(@ripple)
    end

    assert_redirected_to ripples_url
  end

  test "should validate url" do
    valid = %w{ https://www.google.com/ http://localhost:3000 https://youtu.be/WMkvkO8JpxI?t=29#video-title }
    invalid = %w{ ftp://www.totallylegitsite.com  https://ww.wikipedia.org https://en.be4.u%go }

    valid.each do |url|
      assert new_ripple_with_url(url).valid?, "#{url} should be considered valid"
    end

    invalid.each do |url|
      assert new_ripple_with_url(url).invalid?, "#{url} should be considered invalid"
    end
  end

  private
  
    def new_ripple_with_url(url)
      Ripple.new(name: @ripple.name,
        message: @ripple.message,
        url: url
        )
    end
end
