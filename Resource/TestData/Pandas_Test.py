import pandas as pd

sheet1, sheet2 = None, None
with pd.ExcelFile("C:/Users/abhishek.jayalal/Desktop/NMS_AUTOMATION/Resource/TestData/CRMTestdata.xlsx") as reader:
    sheet1 = pd.read_excel(reader, sheet_name='Sheet1')



df = pd.read_csv("OrderId.csv", sep=",")

print(df)