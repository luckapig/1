sudo convert save/blog.learnonly.xyz/*.png pdf/blog.learnonly.xyz.pdf
sudo convert save/todo.learnonly.xyz/*.png pdf/todo.learnonly.xyz.pdf
sudo convert save/space.bilibili.com/*.png pdf/space.bilibili.com.pdf
sudo convert save/pighog.vercel.app/*.png pdf/pighog.vercel.app.pdf
sudo convert save/one.pighog.repl.co/*.png pdf/one.pighog.repl.co.pdf
sudo convert save/alist.learnonly.xyz/*.png pdf/alist.learnonly.xyz.pdf
sudo convert save/img.pighog.repl.co/*.png pdf/img.pighog.repl.co.pdf
sudo convert save/news.pigp.repl.co/*.png pdf/news.pigp.repl.co.pdf
#magick convert合并转换文件夹中png为pdf，还没写自动获取文件夹，感觉没必要
sudo  rm -f pdf/keep
#在生成完pdf后删除keep文件，不然会进release，不好看。
