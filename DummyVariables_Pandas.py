# How to create dummy variables in pandas?

import pandas as pd
train = pd.read_csv('http://bit.ly/kaggletrain')
print train.head()

## Create dummy variables

train = pd.get_dummies(train, columns = ['Sex','Embarked'], drop_first = True)

print train.head()




phone_brand_device_model['phone_brand_name'] = phone_brand_device_model.phone_brand.map(
{'三星':'samsung',
'天语':'Ktouch',
'海信':'hisense',
'联想':'lenovo',
'欧比','obi',
'爱派尔':'ipair',
'努比亚':'nubia',
'优米':'youmi',
'朵唯':'dowe',
'黑米':'heymi',
'锤子':'hammer'
'酷比魔方':'koobee',
'美图':'meitu',
'尼比鲁':'nibilu',
'一加':'oneplus',
'优购':'yougo',
'诺基亚':'nokia',
'糖葫芦':'candy',
'中国移动':'ccmc',
'语信':'yuxin',
'基伍':'kiwu',
'青橙':'greeno',
'华硕':'asus',
'夏新':'panasonic',
'维图':'weitu',
'艾优尼':'aiyouni',
'摩托罗拉':'moto',
'乡米':'xiangmi',
'米奇':'micky',
'大可乐':'bigcola',
'沃普丰':'wpf',
'神舟':'hasse',
'摩乐':'mole',
'飞秒':'fs',
'米歌':'mige',
'富可视':'fks',
'德赛':'desci',
'梦米':'mengmi',
'乐视':'Ishi',
'小杨树':'smallt',
'纽曼':'newman',
'邦华':'banghua',
'E派':'epai',
'易派':'epai',
'普耐尔':'pner',
'欧新':'ouxin',
'西米':'ximi',
'海尔':'haier',
'波导':'bodao',
'糯米':'nuomi',
'唯米':'weimi',
'酷珀':'kupo',
'谷歌':'google',
'昂达':'ada',
'聆韵':'lingyun'})