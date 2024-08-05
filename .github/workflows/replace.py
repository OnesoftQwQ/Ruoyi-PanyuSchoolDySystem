import sys
import yaml

with open('./src/main/resources/application.yml','r',encoding='utf8') as f:
    read = yaml.load(f,yaml.FullLoader)
    # read = f.read()
read['server']['port'] = int(sys.argv[3])
with open('./src/main/resources/application.yml','w',encoding='utf8') as f:
    yaml.dump(stream=f,data=read,allow_unicode=True)

with open('./src/main/resources/application-druid.yml','r',encoding='utf8') as f:
    read = yaml.load(f,yaml.FullLoader)
    # read = f.read()
read['spring']['datasource']['druid']['master']['username'] = sys.argv[1]
read['spring']['datasource']['druid']['master']['password'] = sys.argv[2]
with open('./src/main/resources/application-druid.yml','w',encoding='utf8') as f:
    yaml.dump(stream=f,data=read,allow_unicode=True)