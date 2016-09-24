# RuguoFan / 如果饭

A Ruby version of command line client for Fanfou. Now at a very initial stage

Ruby版的饭否命令行客户端，本人水平较烂，目前处于初初初级阶段

## Usage / 使用说明
Using for the first time needs to do a little configuration. In the current directory, type `bundle install`, and then create a file named `config.json` and with its content like below

初次使用时，在当前目录下输入`bundle install`，同时在当前目录下建立一个名为`config.json`的文件，其内容如下

```
{
  "CLIENT_KEY": "YOUR CONSUMER KEY"，
  "CLIENT_SECRET": "YOUR CONSUMER SECRET",
  "ACCESS_TOKEN": "YOUR ACCESS TOKEN"，
  "ACCESS_SECRET": "YOUR ACCESS SECRET"
}
```

1. Read - only supports reading home timeline / 阅读 - 目前仅支持阅读自己的TL，方法如下

 `ruby ruguofan.rb read`，will list the most recent 10 messages by default / 默认列出最近10条状态

 `ruby ruguofan.rb read <number>`，will list the specified amount of recent messages, e.g., `ruby ruguofan.rb read 30` will list the most recent 30 messages (no more than 60) / 列出指定数量的状态，如`ruby ruguofan.rb read 30`将会列出最近30条状态（最多不超过60条）

2. Post - only supports sending pure text / 发送 - 目前仅支持发送纯文本，方法如下

 `ruby ruguofan.rb post -m "Hello World"`，will post a status "Hello World" / 发送消息“Hello World”
