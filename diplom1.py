import diplom
import data

# Анна Бойкова, Финальный проект, Инженер по тестированию плюс

# Функция для позитивной проверки
def test_positive():

    # Выполнить запрос на создание заказа.
    create_order_response = diplom.create_order()

    # Сохранить номер трека заказа
    x = create_order_response.json()["track"]

    # Выполнить запрос на получения заказа по треку заказа.
    order_response = diplom.order_tracking_number(x)

    # Проверить, что код ответа равен 200
    assert order_response.status_code == 200