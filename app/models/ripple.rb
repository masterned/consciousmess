class Ripple < ApplicationRecord
    validates :name, :message, presence: true

    # BUG: urls w/o resource path w/ GET arguments allowed ('/' missing)
    validates :url, allow_blank: true, format: {
        with: %r{\A
            https?:\/\/                                     # encoding
            (en|www)\.\w+\.(com|net|io|xyz|org|gov|edu)     # host name
            (\/([a-zA-Z0-9_!,+-]|%[A-F0-9][A-F0-9])*)*      # resource path
            (\.(php|html|htm))?                             # file extension
            (\?\w+=\w+(&\w+=\w+)*)?                         # GET arguments
            \Z}ix,
        message: 'must be a valid url.'
    }
end
