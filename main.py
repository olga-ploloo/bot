import config
import keyboards
from aiogram import Bot, Dispatcher, executor, types
from content import text

from db_map import get_movies

bot = Bot(token=config.TOKEN)
dp = Dispatcher(bot)


@dp.message_handler(commands=['start'])
async def welcome(message: types.Message):
    await message.answer(
        text['start_en'],
        reply_markup=keyboards.get_style_keyboard())


@dp.message_handler(commands=['help'])
async def help(message: types.Message):
    await message.answer('help')


@dp.callback_query_handler(text='back')
async def back_button_handler(callback: types.CallbackQuery):
    # await bot.answer_callback_query(callback.id)
    # await bot.send_message(callback.from_user.id, text['start_en'], reply_markup=keyboards.get_style_keyboard())
    await callback.message.answer(
        text=text['start_en'],
        reply_markup=keyboards.get_style_keyboard())


@dp.callback_query_handler()
async def process_callback_button(callback: types.CallbackQuery):
    movies = get_movies(callback.data)
    # await bot.answer_callback_query(callback.id)
    await callback.message.answer(
        text=text['result_ru'],
        reply_markup=keyboards.set_movie_data(movies)
    )


if __name__ == '__main__':
    executor.start_polling(dispatcher=dp,
                           skip_updates=True)
