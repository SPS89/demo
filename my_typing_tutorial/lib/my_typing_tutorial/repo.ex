defmodule MyTypingTutorial.Repo do
  use Ecto.Repo,
    otp_app: :my_typing_tutorial,
    adapter: Ecto.Adapters.Postgres
end
