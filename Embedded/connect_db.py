import firebase_admin
from firebase_admin import credentials
from firebase_admin import firestore

cred = credentials.Certificate("secrets/serviceAccountKey.json")

firebase_admin.initialize_app(cred)

db = firestore.client()

reference_for_update = db.collection(u'Vendors').document(u'SRMT').collection('SRMT').document('iJ7GrgmV0y2o8K3r1WnU')

reference_for_read = db.collection(u'Vendors').document(u'SRMT').collection('SRMT')

def extract(ref):
    docs = ref.stream()
    for doc in docs:
        return int(f'{doc.to_dict()["Current_strength"]}')
        

def increment():
    value = extract(reference_for_read)
    print(value)
    value+=1
    reference_for_update.update({
        u'Current_strength':value
    })

increment()