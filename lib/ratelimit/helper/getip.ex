defmodule Ratelimit.IP do
  @doc """
  Get the IP address of the current user visiting the route.
  Formatted as a string: "123.456.78.9"
  """
  # {:ok, String.t()} | {:error, :api_down}
  @spec getIP() :: {String.t() | :api_down}
  def getIP() do
    ip_url = "https://api.ipify.org/"

    case Ratelimit.Base.get!(ip_url) do
      %HTTPoison.Response{body: body, status_code: 200} ->
        body

      %HTTPoison.Response{status_code: status_code} when status_code > 399 ->
        IO.inspect(status_code, label: "STATUS_CODE")
        :error

      _ ->
        raise "APi down"
    end
  end
end
