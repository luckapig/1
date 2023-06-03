## 本项目来自：https://github.com/zkeq/Python-WebSite-Screenshot

## 预览AutoWebSnap View At https://blog.learnonly.xyz/gallery/snap

## 预览网页快照：https://alist.learnonly.xyz/!网页快照

## 我在原项目的基础上添加了：|

 1. 截图中文字体支持（默认鸿蒙）：https://github.com/zkeq/Python-WebSite-Screenshot/pull/1/files
 2. 截图自动生成 hexo 可识别的 MD 文件：https://github.com/valetzx/AutoWebSnap/blob/main/index.md
 3. 截图定时自动备份并删除仓库历史记录，为了避免平台审查，用这种方式缩小仓库大小，毕竟全是图片。
 
 ```bash
 daydel=$(date +"%Y-%m-%d" -d "-3 day")
 find save -type f -name "*$daydel*.png" -exec rm -rf {} \; 
 ```
 
 4. 使用 imagemagick 自动合并文件夹中的图片为 PDF 并发布 release 备份保存。（这玩意`mfinelli/setup-imagemagick@v1`在20220619坏掉了`Unexpected HTTP response: 404`）
 
 ```yml
 - name: Setup Imagemagick
   uses: mfinelli/setup-imagemagick@v1
 - name: Make PDF
   id: make_pdf
   run: sh pdf.sh
 ```

5. 由于仓库超过 1G 了有点害怕，重置一下这个项目，将 save 文件夹内容转到 onedrive 储存。20220622

6. 使用apt安装imagemagick `sudo apt-get install imagemagick -y` 并替换 `policy.xml` 文件。

7. 佛了 rclone 挂了，在本地新增 `rclone` 和 `imagemagick` 的 `deb` 安装包。

8. 20220622新增内容为：将saves储存转移到onedrive，更改 `rclone` 和 `imagemagick` 的安装方式。

9. 如果你要使用本仓库，请替换我的 `rclone.zip ` 压缩包，压缩包内容为 `rclone.conf` 文件并设置密码。

## 未来会做的：）

 1. 网页长截图（感觉没必要，因为可以手动设置截图网页长宽）
 2. 记得添加 ( `MY_GIT_TOKEN` < Github个人token需要repo权限 / `PASSWD` < rclone.zip 压缩包密码 ) 的环境变量

## 本仓库文件目录说明：

```
.main
├── .github
│   ├── workflows
│   │   ├── backup.yml  - 自动备份至onedrive
│   │   ├── make.yml    - 截图主要Action
│   │   └── release.yml - 自动release发布
├── pdf                 - 生成的pdf文件夹
│   └── keep            - 需要在Github保持存在
├── save                - 生成的截图文件夹
│   └── keep            - 打印网盘文件列表
│   ├── blog.learnonly.xyz
│   ├── space.bilibili.com
│   └── ...             - 文件夹中截图以时间命名
├── .gitignore          - Git忽略文件列表
├── HarmonyOS.ttf       - 华为鸿蒙字体（可更换）
├── del.sh              - 自动删除过期图片文件
├── del.time            - 记录删除文件时的时间
├── fonts.dir           - 扫描字体后残留的log
├── fonts.scale         - 扫描字体后残留的log
├── index.md            - 博客hexo展示图片网页
├── list.json           - 所需截图的网页列表i
├── lsf.log             - 备份onedrive根目录
├── main.py             - 截图程序主体运行文件
├── main.sh             - 用来生成博客index.md
├── name.md             - 生成index.md的残留
├── pdf.sh              - 用来生成所需的 PDF 
├── policy.xml          - imagemagick策略文件
├── rclone.zip          - 加密存放onedrive信息
│   └── rclone.conf     - 你的rclone配置文件
├── requirements.txt    - main.py需要的模块
├── test.py             - 截图程序测试运行文件
└── time.log            - 记录onedrive备份时间
```

### 本项目是由 `Python` 写成的网站截图工具。

> 支持中文网站截图，该功能由 [@valetzx](https://github.com/zkeq/Python-WebSite-Screenshot/pull/1) 开发。

#### 使用方法

1. 在 list.json 中填入你的网站列表。
2. 在 Github 生成一个 TOKEN 并且赋予 repo 权限
3. 在 环境变量中填入 `MY_GIT_TOKEN`，该环境变量用于将截好的图再次放回 GitHub。

#### 参数说明

| 参数 | 说明 |
| --- | --- |
| `url` | 网站网址 |
| `timeout` | sele 模块中等待时间，加载出网站后会停止（秒） |
| `real_time_out` | 强制等待时间，在上述 timeout 后休眠时间（秒） |
| `width` | 截图宽度 |
| `height` | 截图高度 |
| `daydel` | 截图的保存时间（天） |
