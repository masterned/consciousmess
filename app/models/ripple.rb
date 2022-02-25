class Ripple < ApplicationRecord
    validates :name, :message, presence: true

    validates :url, allow_blank: true, format: {
        with: %r{\A
            https?:\/\/     # scheme
            ((en|www)\.)?   # subdomain
            \w+             # domain
            (\.(com|net|io|xyz|org|gov|edu|co\.uk|be))?     # top-level domain
            (:\d{1,4})?     # port
            (\/(\w|[!,+-]|%\h\h)*)*     # path
            (\.(php|html|htm))?         # file extension
            (\?\w+=\w+(&\w+=\w+)*)?     # query string
            (\#(\w|[-])+)?              # fragment
            \Z}ix,
        message: 'must be a valid url.'
    }
end
