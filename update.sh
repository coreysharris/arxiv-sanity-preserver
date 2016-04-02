rsync -v awsasp:~/www/as.db as.db
echo -e "\n\n\n   Starting fetch\n\n"
python fetch_papers.py
echo -e "\n\n\n   Starting download\n\n"
python download_pdfs.py
echo -e "\n\n\n   Starting pdftotext\n\n"
python parse_pdf_to_text.py
echo -e "\n\n\n   Starting thumb generation\n\n"
python thumb_pdf.py
echo -e "\n\n\n   Starting analysis\n\n"
python analyze.py
echo -e "\n\n\n   Starting svm\n\n"
python buildsvm.py
rsync -v db.p tfidf_meta.p sim_dict.p user_sim.p awsasp:~/www
rsync -vr static/thumbs awsasp:~/www/static
