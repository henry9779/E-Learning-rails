## 簡易線上課程平台
__基本帳號註冊登錄功能__
__非管理員進入管理頁面 CRUD 課程__
## 可使用 API
__購買課程__
__POST /api/v0/purchased_courses__

__查詢已購買課程__
__GET /api/v0/purchased_courses?user_id=1__

__查詢特定類型課程__
__GET /api/v0/courses/category?user_id&value=english__

__查詢未過期課程__
__GET /api/v0/courses/available?user_id=1__

## 使用套件:
__grape__
__grape-entity__

## heroku 網址: https://e-learning-rails.herokuapp.com/

## 測試帳密
__管理員__
__帳號: admin@admin.com__
__密碼: 1qaz2wsx__

__一般使用者__
__帳號: test@test.com__
__密碼: 1qaz2wsx__
