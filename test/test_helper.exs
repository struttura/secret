ExUnit.start()

Application.put_env(:secret, :signing_secret, Secret.generate())