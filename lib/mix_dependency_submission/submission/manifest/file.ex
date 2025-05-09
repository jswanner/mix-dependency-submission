defmodule MixDependencySubmission.Submission.Manifest.File do
  @moduledoc """
  Represents a file entry in the submission manifest.

  See https://docs.github.com/en/rest/dependency-graph/dependency-submission?apiVersion=2022-11-28#create-a-snapshot-of-dependencies-for-a-repository
  """

  @type t :: %__MODULE__{
          source_location: Path.t() | nil
        }

  @enforce_keys []
  defstruct source_location: nil

  defimpl Jason.Encoder do
    @impl Jason.Encoder
    def encode(value, opts) do
      value
      |> Map.from_struct()
      |> Enum.reject(&match?({_key, nil}, &1))
      |> Map.new()
      |> Jason.Encode.map(opts)
    end
  end
end
