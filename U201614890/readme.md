# 完成内容

要求 | 内容
- | -
服务端 | Openstack Swift （Docker版本）
客户端 | [python-swiftclient命令行客户端](https://github.com/openstack/python-swiftclient), [CloudBerry图形化客户端](https://www.cloudberrylab.com/), 根据python-swiftclient API基于Flask编写的[Web客户端Swiftclient-Flask](https://github.com/GrayXu/Swiftclient-Flask)（支持CURD，生成临时下载URL）
评测 |  [COS Bench](https://github.com/intel-cloud/cosbench), [Swift-Bench](https://github.com/openstack/swift-bench), 在Jupyter Notebook上单线程测试
优化 | 多个小文件打包传输

# 文件解释

文件名 | 详细
- | -
U201614890_徐光磊.doc | 实验报告
Swift-Bench测试数据.xlsx | 使用Swift-Bench并发测速得到的数据
Jupyter Notebook测试数据.xlsx | 在Jupyter Notebook上使用Swift的Python API进行单线程测速以及多文件打包传输测速的数据
Swift-MyTest.ipynb | Jupyter Notebook源文件
Swift-MyTest.html | Jupyter Notebook导出HTML

*U201614890 徐光磊*