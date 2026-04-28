from sklearn.datasets import load_iris
from sklearn.model_selection import train_test_split
from sklearn.naive_bayes import GaussianNB
from sklearn.metrics import accuracy_score, classification_report

data = load_iris()
X = data.data
y = data.target

X_train, X_test, y_train, y_test = train_test_split(
    X, y, test_size=0.3, random_state=1
)

model = GaussianNB()

model.fit(X_train, y_train)

y_pred = model.predict(X_test)

print("Predicted Values:", y_pred)
print("Actual Values   :", y_test)
print("Accuracy:", accuracy_score(y_test, y_pred) * 100)

print("\nClassification Report:\n")
print(classification_report(y_test, y_pred))
