# plottinglib :: personal library of plotting functions
#
import numpy
import numpy as np
import matplotlib.pyplot as plt

import warnings
warnings.filterwarnings('ignore')

def plot_estimator_boundaries(classifier, X, y, ax=None, eps=None, alpha=1, cm='jet', saveplot=True, title=None):	
	
	# get eps values automatically from distribution of feature values
    if eps is None:
        eps0 = X[:,0].std() / 2
        eps1 = X[:,1].std() / 2
    else:
        eps0, eps1 = eps

    # if no axes defined, get current axes
    if ax is None:
        ax = plt.gca()

    # create a million points on the 2D grid
    x_min, x_max = X[:, 0].min() - eps0, X[:, 0].max() + eps0
    y_min, y_max = X[:, 1].min() - eps1, X[:, 1].max() + eps1
    xx = np.linspace(x_min, x_max, 1000)
    yy = np.linspace(y_min, y_max, 1000)

    X1, X2 = np.meshgrid(xx, yy)
    X_grid = np.c_[X1.ravel(), X2.ravel()]
    
    # predict the class for all points
    decision_values = classifier.predict(X_grid)
		
	# plot boundaries for the estimator
    ax.imshow(decision_values.reshape(X1.shape), extent=(x_min, x_max,
                                                         y_min, y_max),
              aspect='auto', origin='lower', alpha=alpha, cmap=cm)
    
	# set axis properties
    ax.set_xlim(x_min, x_max)
    ax.set_ylim(y_min, y_max)
    ax.set_xticks(())
    ax.set_yticks(())
    plt.title(title)
    if saveplot is True:
        plt.savefig('boundary_plot.png')