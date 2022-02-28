require "test_helper"

class RipplesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ripple = ripples(:one)
    @url = "https://thenumber#{rand(100)}iscool.com/"
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
    assert_difference('Ripple.count') do
      post ripples_url, params: {
        ripple: {
          message: @ripple.message,
          name: @ripple.name,
          url: @url
        }
      }
    end

    assert_redirected_to ripples_index_url
  end

  test "should show ripple" do
    get ripple_url(@ripple)
    assert_response :success
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
