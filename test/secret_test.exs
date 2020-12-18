defmodule SecretTest do
  use ExUnit.Case
  doctest Secret

  test "paylod packs and unpacks properly" do
    string = :crypto.strong_rand_bytes(24)
      |> Base.encode64()

    result = %{"data" => string}
    |> Secret.pack!()
    |> Secret.unpack!()

    assert result["data"] == string
  end
end
