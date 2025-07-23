#模拟实现最小的区块链原理
##执行入口[MiniBlockChain.java](chain/src/t1/MiniBlockChain.java)
##运行日志
初始化创世区块
开始挖第2个区块
开始挖第3个区块
开始挖第4个区块
开始挖第5个区块
开始挖第6个区块
当前区块链有效
==================== Block 0 ====================
Index       : 0
Timestamp   : 1753240703931
Transactions:
jerry -> jerry: 0
Proof       : 0
PreviousHash: 0
Hash        : 7e6e0e8025d4588f48e08ef2e9c417d9f4f612a5c3f8d26a5568506d2ed62e8a
-------------------------------------------------

==================== Block 1 ====================
Index       : 1
Timestamp   : 1753240704001
Transactions:
Frank -> Bob: 763
Frank -> Charlie: 84
Alice -> Frank: 506
Alice -> Bob: 216
Bob -> David: 48
Alice -> Eve: 839
Frank -> Bob: 753
Charlie -> Charlie: 48
Eve -> Bob: 314
David -> David: 313
Proof       : 7569
PreviousHash: 7e6e0e8025d4588f48e08ef2e9c417d9f4f612a5c3f8d26a5568506d2ed62e8a
Hash        : 0000d5f6891818e5326e3dc256750d878521e3b8c2a1da255e8d3f4a97c22a87
-------------------------------------------------

==================== Block 2 ====================
Index       : 2
Timestamp   : 1753240704605
Transactions:
Eve -> Frank: 585
David -> Charlie: 703
Frank -> Alice: 118
Bob -> Charlie: 560
Bob -> David: 345
Bob -> Bob: 225
Alice -> Eve: 449
Alice -> Bob: 489
Eve -> Bob: 86
Charlie -> David: 313
Proof       : 14120
PreviousHash: 0000d5f6891818e5326e3dc256750d878521e3b8c2a1da255e8d3f4a97c22a87
Hash        : 00002d411e2a2956f63cee4060117279b79c35a577490da3bf1871e5fd61007e
-------------------------------------------------

==================== Block 3 ====================
Index       : 3
Timestamp   : 1753240705050
Transactions:
Eve -> David: 916
David -> Alice: 758
Alice -> Frank: 637
Frank -> Alice: 717
Charlie -> Alice: 50
Eve -> Charlie: 641
David -> Bob: 654
David -> Alice: 820
David -> Bob: 839
Frank -> Charlie: 128
Proof       : 269521
PreviousHash: 00002d411e2a2956f63cee4060117279b79c35a577490da3bf1871e5fd61007e
Hash        : 000067c828417c6f95b403b85c2c254a559556632bd7a8354a99aa6abf805454
-------------------------------------------------

==================== Block 4 ====================
Index       : 4
Timestamp   : 1753240711032
Transactions:
Alice -> Charlie: 161
David -> Charlie: 905
Eve -> Eve: 336
Alice -> Charlie: 889
Charlie -> Charlie: 681
Frank -> Charlie: 79
Frank -> Bob: 766
Eve -> Bob: 197
Eve -> Charlie: 301
Charlie -> Charlie: 124
Proof       : 124941
PreviousHash: 000067c828417c6f95b403b85c2c254a559556632bd7a8354a99aa6abf805454
Hash        : 0000d8cac39b59b3901eef1baed03f5924840aa34e447d2c428811ac46d1cbc7
-------------------------------------------------

==================== Block 5 ====================
Index       : 5
Timestamp   : 1753240713751
Transactions:
Bob -> Alice: 917
Alice -> Frank: 934
Bob -> Charlie: 244
Bob -> Frank: 776
David -> Frank: 975
David -> Bob: 218
David -> Charlie: 438
David -> Charlie: 204
Eve -> David: 251
Bob -> Charlie: 711
Proof       : 91774
PreviousHash: 0000d8cac39b59b3901eef1baed03f5924840aa34e447d2c428811ac46d1cbc7
Hash        : 0000db03acd266fd8d3548b8c6a003d1969e002b0fb592aec181beb3f25874aa
-------------------------------------------------

