defmodule Thetypingtool.Repo do
  use Ecto.Repo,
    otp_app: :thetypingtool,
    adapter: Ecto.Adapters.Postgres
end
