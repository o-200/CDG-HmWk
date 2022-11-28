def greeting(firstname, secondname, age)
  if age >= 18
    "Привет, #{firstname} #{secondname}. Самое время заняться делом!"
  else
    "Привет, #{firstname} #{secondname}. Тебе меньше 18 лет, но начать учиться программировать никогда не рано"
  end
end

def foobar(num1, num2)
  num1 == 20 || num2 == 20 ? num2 : num1 + num2
end
