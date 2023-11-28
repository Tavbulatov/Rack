"Rack" - интерфейс который возвращает время в заданном формате в строке запросе.

В директории проета выполните команду 'rackup'

Выберите нужные элементы времени: day, month, year, hour, minute, second
Далее выполните запрос.

пример: 'curl --url "http://localhost:9292/time?format=year%2Cmonth%2Cday" -i'

Вернет:

HTTP/1.1 200 OK
Content-Type: text/plain

Content-Length: 10

29-11-2023%                 
