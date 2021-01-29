defmodule FizzBuzz do
  def build(file_name) do
    file_name
    |> File.read()
    |> handle_file_read()
  end

  defp handle_file_read({:ok, result}) do
    result =
      result
      |> String.split(",")
      |> Enum.map(&convert_evaluate_numbers/1)

    {:ok, result}
  end

  defp handle_file_read({:error, reasons}), do: {:error, "Error reading the file: #{reasons}"}

  defp convert_evaluate_numbers(element) do
    element
    |> String.to_integer()
    |> evaluate_numbers
  end

  defp evaluate_numbers(number) when rem(number, 3) == 0 and rem(number, 5) == 0, do: :fizzBuzz
  defp evaluate_numbers(number) when rem(number, 3) == 0, do: :fizz
  defp evaluate_numbers(number) when rem(number, 5) == 0, do: :fizz
  defp evaluate_numbers(number), do: number
end
