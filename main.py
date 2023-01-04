from config import TOKEN
from aiogram import Bot, Dispatcher, executor, types
from aiogram.types import ReplyKeyboardMarkup, KeyboardButton
from content import text
from keyboards import lang_keyboard, style_keyboard

bot = Bot(token=TOKEN)
dp = Dispatcher(bot)


@dp.message_handler(commands=['start'])
async def welcome(message: types.Message):
    await message.answer(text['start_en'], reply_markup=style_keyboard)


# sends help message
@dp.message_handler(commands=['help'])
async def help(message: types.Message):
    await message.answer('help')


@dp.callback_query_handler(func=lambda c: c.data == 'back')
async def process_callback_back(callback_query: types.CallbackQuery):
    await bot.answer_callback_query(callback_query.id)
    await bot.send_message(callback_query.from_user.id, text['start_en'], reply_markup=style_keyboard)


@dp.callback_query_handler(lambda c: c.data != 'back')
async def process_callback_button(callback_query: types.CallbackQuery):
# movie = search_movie(data)
#         choice = InlineKeyboardMarkup()
#         for item in movie:
#             choice.add(InlineKeyboardButton(text=item[0], url=item[1]))
#         choice.add(InlineKeyboardButton(
#             text=emoji.emojize(':arrow_left:') + ' К списку категорий',
#             callback_data='back')
#         )
        await bot.answer_callback_query(callback_query.id)
#         await bot.send_message(
#             callback_query.from_user.id,
#             text='Вот что удалось найти по твоему запросу:',
#             reply_markup=choice
#         )


# Press the green button in the gutter to run the script.
if __name__ == '__main__':
    executor.start_polling(dispatcher=dp,
                           skip_updates=True)
