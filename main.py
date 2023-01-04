import config
import keyboards

from aiogram import Bot, Dispatcher, executor, types
from aiogram.types import ReplyKeyboardMarkup, KeyboardButton, InlineKeyboardMarkup, InlineKeyboardButton
from content import text

from db_map import get_movies

bot = Bot(token=config.TOKEN)
dp = Dispatcher(bot)


@dp.message_handler(commands=['start'])
async def welcome(message: types.Message):
    await message.answer(text['start_en'], reply_markup=keyboards.style_keyboard)


# sends help message
@dp.message_handler(commands=['help'])
async def help(message: types.Message):
    await message.answer('help')


@dp.callback_query_handler(lambda c: c.data == 'back')
async def process_callback_back(callback_query: types.CallbackQuery):
    await bot.answer_callback_query(callback_query.id)
    await bot.send_message(callback_query.from_user.id, text['start_en'], reply_markup=keyboards.style_keyboard)


@dp.callback_query_handler(lambda c: c.data != 'back')
async def process_callback_button(callback_query: types.CallbackQuery):
        movies = get_movies(callback_query.data)
        print(movies)
        # keyboard = keyboards.set_movie_data(movies)
        choice = InlineKeyboardMarkup()
        for item in movies:
            choice.add(InlineKeyboardButton(text=item[0], url=config.domen + item[1]))
        choice.add(InlineKeyboardButton(
            text=' К списку категорий',
            callback_data='back')
        )
        await bot.answer_callback_query(callback_query.id)
        await bot.send_message(
            callback_query.from_user.id,
            text='Вот что удалось найти по твоему запросу:',
            reply_markup=choice
        )


# conn = psycopg2.connect(
#     dbname=db_name,
#     user=db_user,
#     password=db_password,
#     host=db_host
# )
# cursor = conn.cursor()
# cursor.execute('SELECT name, link FROM movie WHERE style = %s', (style,))
# result = cursor.fetchall()
# cursor.close()
# conn.close()
# return

# Press the green button in the gutter to run the script.
if __name__ == '__main__':
    executor.start_polling(dispatcher=dp,
                           skip_updates=True)
