module Client
  class Moneywelfare
    class << self
      # 証明書が必要
      def get_user(user_id:, params: {}, headers: {})
        response_body = get_response(url_to_get_user(user_id))
        JSON.parse(response_body)
      end

      private

      def url_to_get_user(user_id)
        "#{ENV['MONEYWELFARE_HOST_URL']}/users/#{user_id}"
      end

      def get_response(url, params: {}, headers: {})
        Faraday.get(url, params, headers).body
      end
    end
  end
end