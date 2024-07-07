#!/usr/bin/env python
# coding: utf-8

# In[ ]:


# memanggil module
import tkinter as tk
from tkinter import ttk
from tkinter import filedialog
import pandas as pd
import matplotlib.pyplot as plt
import math
import numpy as np
from pandas import DataFrame
from tkinter.messagebox import showinfo

# membuat window GUI
window = tk.Tk() #mendefinisikan window sebagai papan GUI
window.configure(bg="brown") #mendefinisikan warna background window yang dipakai
window.geometry("650x650") #menentukan ukuran window
window.title("Perhitungan Value at Risk Obligasi") #memberi judul pada GUI

# mendefinifikan suatu nilai sebagai string
varstd = tk.StringVar() 
HASILVAR = tk.StringVar()
PERSENVAR = tk.StringVar()
HOLDING_PERIOD = tk.StringVar()
NILAI_OUTSTANDING = tk.StringVar()
DURASI_MODIFIKASI = tk.StringVar()

# label judul
label_0 = tk.Label(window, text="Perhitungan Value at Risk Obligasi", bg="white",font=('Times',14,'bold'))
label_0.pack(padx=10,pady=2,fill="x",expand=True)

# membuat frame
input_frame = ttk.Frame(window)
input_frame.pack(padx=10,pady=2,fill="x",expand=True)

# label input data
label_04 = ttk.Label(input_frame,text="Input Data",font=('Times New Roman',10,'bold'))
label_04.pack(padx=5,fill="x",expand=True)

# label nama untuk url data yang dipilih
label_file = ttk.Label(input_frame, text="No File Selected")
label_file.pack(padx=10,fill="x",expand=True)

# membuat pushbutton choose file
button_ambil_Data= ttk.Button(input_frame, text="Pilih File Excel",command=lambda: dapatkan_excel())
button_ambil_Data.pack(padx=200,fill="x",expand=True)

# syntax untuk mengambil file excel dari folder komputer
def dapatkan_excel():
    global df
    import_file = filedialog.askopenfilename()
    read_file = pd.read_excel(import_file)
    df = DataFrame(read_file)
    label_file["text"] = import_file
    
# membuat pushbutton tampilkan data
button_tampilkan_Data= ttk.Button(input_frame, text="Tampilkan Data",command=lambda: tampilkan_data())
button_tampilkan_Data.pack(padx=200,fill="x",expand=True)

def tampilkan_data():
        file_path = label_file["text"]
        try:
            excel_filename = r"{}".format(file_path)
            if excel_filename[-4:] == ".csv":
                df = pd.read_csv(excel_filename)
            else:
                df = pd.read_excel(excel_filename)

        except ValueError:
            tk.messagebox.showerror("Information", "The file you have chosen is invalid")
            return None
        except FileNotFoundError:
            tk.messagebox.showerror("Information", f"No such file as {file_path}")
            return None

        clear_data()
        tv1["column"] = list(df.columns)
        tv1["show"] = "headings"
        for column in tv1["columns"]:
            tv1.heading(column, text=column)

        df_rows = df.to_numpy().tolist() 
        for row in df_rows:
            tv1.insert("", "end", values=row)
        return None

def clear_data():
        tv1.delete(*tv1.get_children())
        return None

# Membuat scrollbar untuk menampilkan data excel yang telah dipilih 
tv1 = ttk.Treeview(input_frame)
tv1.pack(padx=10,pady=10,fill="x") 

treescrolly = ttk.Scrollbar(tv1, orient="vertical", command=tv1.yview) 
treescrollx = ttk.Scrollbar(tv1, orient="horizontal", command=tv1.xview) 
tv1.configure(xscrollcommand=treescrollx.set, yscrollcommand=treescrolly.set) 
treescrollx.pack(side="bottom", fill="x") 
treescrolly.pack(side="right", fill="y") 
       
# label nilai outstanding
label_1 = ttk.Label(input_frame,text="Nilai Outstanding",font=('Times',10,'bold'))
label_1.pack(padx=10,fill="x",expand=True)
# input besaran nilai outstanding
nilai_label_1 = ttk.Entry(input_frame, textvariable=NILAI_OUTSTANDING)
nilai_label_1.pack(padx=10,fill="x",expand=True)

# label holding periode
label_2 = ttk.Label(input_frame,text="Holding Period (Hari)",font=('Times',10,'bold'))
label_2.pack(padx=10,fill="x",expand=True)
# input holding periode
nilai_label_2 = ttk.Entry(input_frame, textvariable=HOLDING_PERIOD)
nilai_label_2.pack(padx=10,fill="x",expand=True)

# label durasi modifikasi
label_3 = ttk.Label(input_frame,text="Durasi Modifikasi",font=('Times',10,'bold'))
label_3.pack(padx=10,fill="x",expand=True)
# input durasi modifikasi
nilai_label_3 = ttk.Entry(input_frame, textvariable=DURASI_MODIFIKASI)
nilai_label_3.pack(padx=10,fill="x",expand=True)

# label standar deviasi
label_4 = ttk.Label(input_frame,text="Standar Deviasi",font=('Times',10,'bold'))
label_4.pack(padx=10,fill="x",expand=True)

# letak hasil standar deviasi
hasil_Stdev = ttk.Label(input_frame,textvariable=varstd)
hasil_Stdev.pack(padx=10,fill="x",expand=True)

# label hasil VaR
label_5 = ttk.Label(input_frame,text="Hasil Value at Risk",font=('Times',10,'bold'))
label_5.pack(padx=10,fill="x",expand=True)

# letak hasil VaR
hasil_VaR = ttk.Label(input_frame,textvariable=HASILVAR)
hasil_VaR.pack(padx=10,fill="x",expand=True)

# label persentase VaR
label_5 = ttk.Label(input_frame,text="Persentase Value at Risk (%)",font=('Times',10,'bold'))
label_5.pack(padx=10,fill="x",expand=True)

# letak persentase VaR
persen_VaR = ttk.Label(input_frame,textvariable=PERSENVAR)
persen_VaR.pack(padx=10,fill="x",expand=True)

# label Plot
label_6=ttk.Label(input_frame, text="Grafik Return Obligasi",font=('Times',10,'bold'))
label_6.pack(padx=10,fill="x",expand=True)

# letak Plot
hasil_label_6 = ttk.Label(input_frame,text="")
hasil_label_6.pack(padx=10,fill="x",expand=True)

# rumus menghitung value at risk obligasi 
# rumus VaR = standar deviasi return obligasi x Z tabel dengan alpha 0.05 x nilai outstanding x durasi modifikasi x akar holding periode
# Z tabel dengan alfa 0.05 adalah -1.64485 
def hitung():
    file_excel = label_file["text"]
    read_file = pd.read_excel (file_excel)
    df = DataFrame(read_file)
    a = np.array(df.Return)
    
    #standar deviasi
    standar_deviasi=np.std(a)
    varstd.set(standar_deviasi)
    
    #hasil var
    hasil_VaR = -1*(standar_deviasi*(-1.64485)*int(nilai_label_1.get())*float(nilai_label_3.get())*math.sqrt(int(nilai_label_2.get())))
    HASILVAR.set(hasil_VaR)
    
    #persen var
    persen_VaR = (hasil_VaR/int(nilai_label_1.get()))*100
    PERSENVAR.set(persen_VaR)
    
    #plot
    fig = plt.figure(figsize=(5,4), dpi=80)
    ax1 = fig.add_subplot()
    ax1.plot(df.Return, color='blue')
    ax1.set_title('Grafik Return Obligasi')
    ax1.grid(True)
    from matplotlib.figure import Figure
    from matplotlib.backends.backend_tkagg import(FigureCanvasTkAgg, NavigationToolbar2Tk)
    canvas = FigureCanvasTkAgg(fig, hasil_label_6)
    canvas.draw()
    canvas.get_tk_widget().pack(side=tk.TOP, fill=tk.BOTH,expand=1)

# membuat pushbutton untuk menampilkan VaR
button_hasil_VaR = ttk.Button(input_frame, text="Hitung VaR", command=hitung)
button_hasil_VaR.pack(padx=200,fill="x",expand=True)

#Mainloop untuk menjalankan GUI 
window.mainloop()


# In[ ]:




