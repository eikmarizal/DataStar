# helper_plots library of functions
#
import numpy
import numpy as np
import matplotlib.pyplot as plt

def plot_2d_classification(classifier, X, ax=None, eps=None, alpha=1, cm='jet'):	
	
	# get eps values automatically from distribution of feature values
    if eps is None:
        eps0 = X[:,0].std() / 2
        eps1 = X[:,1].std() / 2
    else:
        eps0, eps1 = eps

    # if no axes defined, get current axes
    if ax is None:
        ax = plt.gca()


    x_min, x_max = X[:, 0].min() - eps0, X[:, 0].max() + eps0
    y_min, y_max = X[:, 1].min() - eps1, X[:, 1].max() + eps1
    xx = np.linspace(x_min, x_max, 1000)
    yy = np.linspace(y_min, y_max, 1000)

    X1, X2 = np.meshgrid(xx, yy)
    X_grid = np.c_[X1.ravel(), X2.ravel()]
    decision_values = classifier.predict(X_grid)
		
	# plot class regions
    ax.imshow(decision_values.reshape(X1.shape), extent=(x_min, x_max,
                                                         y_min, y_max),
              aspect='auto', origin='lower', alpha=alpha, cmap=cm)
    
	# set axis properties
    ax.set_xlim(x_min, x_max)
    ax.set_ylim(y_min, y_max)
    ax.set_xticks(())
    ax.set_yticks(())

	

from sklearn.ensemble import BaggingClassifier
from sklearn.model_selection import cross_val_score, train_test_split
    
def ensemble_accuracy(base_clf, X, y, size_estimator):
    acc= []
    size_range = size_estimator

    for i in size_range:
        bag_me = BaggingClassifier(base_estimator=base_clf, n_estimators=i, max_samples=0.8, max_features=0.8)
    #    bag_me.fit(X_train, y_train)
    #    train_acc_me.append(bag_me.score(X_train, y_train))
    #    test_acc_me.append(bag_me.score(X_test, y_test))
        scores = cross_val_score(bag_me,X,y,cv=3,scoring='accuracy')
        acc.append(scores.mean())

    fig, ax = plt.subplots()
    ax.plot(size_range,acc,'r-')
    
    
    
    