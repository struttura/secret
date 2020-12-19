ExUnit.start()

Application.put_env(:secret, "SIGNING_SECRET", Secret.generate())