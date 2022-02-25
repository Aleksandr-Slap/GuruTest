

Answer.destroy_all
Question.destroy_all
Test.destroy_all
Category.destroy_all  

categories = Category.create([
                              {title: "Backend"},
                              {title: "Frontend"}
                              ])

p "Created #{Category.count} categories"



tests = Test.create([
                     {title: "Ruby", category_id: categories[0].id},
                     {title: "Python", category_id: categories[0].id},
                     {title: "HTML", category_id: categories[1].id},
                     {title: "C++", category_id: categories[0].id},
                     {title: "CSS", category_id: categories[1].id}
                     ])

p "Created #{Test.count} tests"



questions = Question.create([
                             {body: "Кто создал Ruby?", test_id: tests[0].id},
                             {body: "Значение переменной Ruby по умолчанию", test_id: tests[0].id},
                             {body: "Что вернёт метод .upcase", test_id: tests[0].id},

                             {body: "Что такое Python", test_id: tests[1].id},
                             {body: "Что лучше, Ruby или Python?", test_id: tests[1].id},

                             {body: "С чем работает HTML?", test_id: tests[2].id},
                             {body: "Главный инструмент HTML это:", test_id: tests[2].id},

                             {body: "На сколько лёгкий язык С++ для начинающего?", test_id: tests[3].id},

                             {body: "Для чего нужен CSS?", test_id: tests[4].id}
                             ])

p "Created #{Question.count} questions"



Answer.create([
               {body: "Jo Rogan", question_id: questions[0].id},
               {body: "Matz", correct: true, question_id: questions[0].id},
               {body: "Sssha Sinihcin", question_id: questions[0].id},
               {body: "Moy Batya", question_id: questions[0].id},
               {body: "null", question_id: questions[1].id},
               {body: "nil", correct: true, question_id: questions[1].id},
               {body: "Table", question_id: questions[2].id},
               {body: "TABLE",correct: true, question_id: questions[2].id},
               {body: "table", question_id: questions[2].id},

               {body: "Высокоуровневый язык программирования общего назначения", correct: true, question_id: questions[3].id},
               {body: "Каскадные таблицы стилей", question_id: questions[3].id},
               {body: "Адинакава", question_id: questions[4].id},
               {body: "Конечно Ruby!", correct: true, question_id: questions[4].id},

               {body: "С текстом", correct: true, question_id: questions[5].id},
               {body: "Со стилями", question_id: questions[5].id},
               {body: "Тэг, в который HTML заключает текст", correct: true, question_id: questions[6].id},
               {body: "Методы ActiveRecord", question_id: questions[6].id},

               {body: "Очень лёгкий!", correct: true, question_id: questions[7].id},
               {body: "Не сложный", question_id: questions[7].id},
               ])


p "Created #{Answer.count} answers"


User.destroy_all

User.create([
             {email: "sasha@mail.ru"},
             {email: "pavel@mail.ru"}
             ])

p "Created #{User.count} users"



































