
# Restaurant Forum

# 安裝：

```
- $ git clone https://github.com/wakinglife/restaurant_forum.git
- $ cd restaurant_forum
- $ bundle install
- $ rails db:migrate
```
### Generate seed data and fake data
#### Seed file generate a admin role and category items
```
- $ rails db:seed
```
#### Fake data   
```
- $ rails dev:fake
```
# User stories
## 使用者認證
- 除了註冊和登入頁，使用者一定要登入才能使用網站
- 使用者能創建帳號、登入、登出 
## 後台管理介面
- 進入後台必須有管理員 (admin) 權限
- seed.rb，新增一組預設管理員，限定帳號：admin@example.com；密碼：87654321
- 網站管理者可以在後台 新增 / 瀏覽 / 編輯 / 刪除 餐廳的基本資料
- 網站管理者可以在後台上傳餐廳照片
- 瀏覽餐廳資料時，會有分頁功能，一頁只顯示 10 筆資料
- 後臺可以新增、修改和刪除餐廳分類
## 餐廳評論
- 使用者可以在餐廳個別資料下留下評論
- 使用者可以在餐廳個別資料下瀏覽其他人的評論
- 管理者可以刪除任何人的評論
## 餐廳分類
- 瀏覽餐廳總表時，可以看見分類
- 瀏覽餐廳個別頁面時，可以看見分類
- 新增或修改餐廳時可選擇分類
## 最新動態
- 使用者能在最新動態頁面上得知「最近新增的餐廳」以及「最新的評論」
- 使用者可以瀏覽收藏數前 10 名的人氣餐廳
## 收藏和追蹤
- 使用者可以收藏和取消收藏餐廳
- 使用者可以追蹤和取消追蹤美食達人
## Profile
- 在任何一個地方點擊使用者暱稱可以進行 Profile 頁，看到個人簡介
- 使用者可以在個人頁面查看和編輯個人資料 
- 使用者可以在個人頁面查看評論過的餐廳
- 使用者可以在個人頁面查看收藏過的餐廳
- 使用者可以在個人頁面查看自己去追蹤的人
- 使用者可以在個人頁面查看追蹤自己的人

* https://restaurant-forum-ph.herokuapp.com
