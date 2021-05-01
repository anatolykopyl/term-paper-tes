input_code = {1, 0, 1, 1, 1, 1, 0, 0, 1}

-- Logical sum
function m2s(a, b)
  if a+b == 2 then
    return 0
  else
    return a+b
  end
end

function coder(input_code)
  register = {0, 0, 0}
  result = {}
  states = {}

  for i, code_digit in ipairs(input_code) do
    register[#register+1] = code_digit
    state = register[#register-1]..register[#register-2]
    states[#states + 1] = state

    result1 = m2s(m2s(register[#register], register[#register-1]), register[#register-2])
    result2 = m2s(register[#register], register[#register-2])

    result[#result+1] = result1..result2
  end

  return result, states
end

result, states = coder(input_code)

for _, v in ipairs(states) do print(v..' ') end
print('Код на выходе кодера:')
for _, v in ipairs(result) do io.write(v..' ') end
