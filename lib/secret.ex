defmodule Secret do
  @moduledoc """
  Sugar for SimpleSecrets to pack/unpack base don env var
  """

  defp sender() do
    Application.get_env(:secret, "SIGNING_SECRET")
    |> SimpleSecrets.init()
  end

  def pack(data) do
    SimpleSecrets.pack(data, sender())
  end

  def pack!(data) do
    {:ok, secret} = SimpleSecrets.pack(data, sender())
    secret
  end

  def unpack(packet) do
    try do
      SimpleSecrets.unpack(packet, sender())
    rescue
      MatchError -> :error
      ArgumentError -> :error
    else
      payload -> payload
    end
  end

  def unpack!(packet) do
    unpack(packet)
    |> case do
      {:ok, payload} -> payload
      :error -> :error
    end
  end

  def generate() do
    :crypto.strong_rand_bytes(24)
    |> Base.encode64()
    |> String.replace("/", "_")
    |> String.replace("+", "-")
  end
end
