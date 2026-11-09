# Message and URL model training

## What this adds
- A reproducible scikit-learn training pipeline with separate message and URL classifiers.
- Word and character TF-IDF features plus balanced logistic regression.
- Stratified held-out test split, classification report, confusion matrix and saved model files.
- Bundled fictional demonstration CSVs (2,000 messages and 2,000 URLs).

## Important data limitation
The bundled examples are **synthetic**, generated for testing the pipeline. They are not a collection of real user messages, confirmed scams, or verified malicious URLs. Their scores cannot establish real-world accuracy. No live reputation feed or production-grade trained model is included. The existing scanner remains a heuristic scanner until a separately validated inference integration is built.

## Train on the bundled demo data
On Windows, double-click `TRAIN-MESSAGE-URL-MODELS-WINDOWS.bat`, or run:
```powershell
py -3 -m venv .venv-message-url
.\.venv-message-url\Scripts\Activate.ps1
python -m pip install -r training/message_url_requirements.txt
python training/train_message_url.py
```
Output: `models/message-url/message_classifier.joblib`, `url_classifier.joblib`, and `training_metrics.json`.

## Use a larger vetted dataset
Prepare two CSV files:
- Messages: columns `label,text`
- URLs: columns `label,url`
- Labels must be exactly `legitimate` or `scam`.
- Include a balanced, diverse set; deduplicate; remove personal information; document source, license, collection date, and labeling method.
- Split by source/campaign/time where possible to avoid near-duplicate leakage.
- Keep a separate, source-disjoint final test set. Never tune against it.
- Do not label a URL malicious solely because it looks unusual. Confirm labels from trustworthy, dated sources. Avoid storing full personal communications.

Run:
```powershell
python training/train_message_url.py --messages path\to\messages.csv --urls path\to\urls.csv
```

## Safety and limitations
- Training only saves models; it does not yet connect them to `scanner.html` or replace its heuristic scoring.
- Never open submitted URLs as part of training. Treat URLs as inert text.
- A low score is not proof of safety; a high score is not definitive proof of fraud.
- Do not upload private chats, passwords, one-time codes, financial details, or other people's personal information.
- Before deployment, evaluate precision/recall, false positives, false negatives, drift, and robustness on independently sourced data. Have a human review uncertain cases.
