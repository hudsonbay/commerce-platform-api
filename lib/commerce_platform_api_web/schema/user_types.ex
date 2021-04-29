defmodule CommercePlatformApiWeb.Schema.UserTypes do
  use Absinthe.Schema.Notation

  import AbsintheErrorPayload.Payload
  alias CommercePlatformApiWeb.Resolvers
  import_types(AbsintheErrorPayload.ValidationMessageTypes)

  @desc "A user"
  object :user do
    field :email, :string
    field :name, :string
    field :id, :id
  end

  payload_object(:user_payload, :user)
  payload_object(:session_payload, :session)

  object :create_user_mutation do
    @desc """
    create user
    """

    @desc "Create a user"
    field :create_user, :user_payload do
      arg(:email, non_null(:string))
      arg(:password, non_null(:string))
      arg(:name, non_null(:string))

      resolve(&Resolvers.Accounts.create_user/3)
      middleware(&build_payload/2)
    end
  end

  object :login_mutation do
    @desc """
    login with the params
    """

    field :create_session, :session_payload do
      arg(:email, non_null(:string))
      arg(:password, non_null(:string))

      resolve(&Resolvers.Accounts.login/2)
      middleware(&build_payload/2)
    end
  end

  @desc "session value"
  object :session do
    field(:token, :string)
    field(:user, :user)
  end
end
