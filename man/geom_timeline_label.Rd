% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/geom_timeline_label.R
\name{geom_timeline_label}
\alias{geom_timeline_label}
\title{Add Labels to Timeline}
\usage{
geom_timeline_label(mapping = NULL, data = NULL, n_max = NULL,
  stat = "timeline", position = "identity", na.rm = FALSE,
  show.legend = NA, inherit.aes = TRUE, ...)
}
\arguments{
\item{mapping}{Set of aesthetic mappings created by \code{\link{aes}} or
\code{\link{aes_}}. If specified and \code{inherit.aes = TRUE} (the
default), it is combined with the default mapping at the top level of the
plot. You must supply \code{mapping} if there is no plot mapping.}

\item{data}{The data to be displayed in this layer. There are three
   options:

   If \code{NULL}, the default, the data is inherited from the plot
   data as specified in the call to \code{\link{ggplot}}.

   A \code{data.frame}, or other object, will override the plot
   data. All objects will be fortified to produce a data frame. See
   \code{\link{fortify}} for which variables will be created.

   A \code{function} will be called with a single argument,
   the plot data. The return value must be a \code{data.frame.}, and
   will be used as the layer data.}

\item{n_max}{A integer which indicates the number of the largest earthquakes to have
the label}

\item{stat}{The default set is \code{"timeline"}}

\item{position}{Position adjustment, either as a string, or the result of
a call to a position adjustment function.}

\item{na.rm}{If \code{FALSE}, the default, missing values are removed with
a warning. If \code{TRUE}, missing values are silently removed.}

\item{show.legend}{logical. Should this layer be included in the legends?
\code{NA}, the default, includes if any aesthetics are mapped.
\code{FALSE} never includes, and \code{TRUE} always includes.}

\item{inherit.aes}{If \code{FALSE}, overrides the default aesthetics,
rather than combining with them. This is most useful for helper functions
that define both data and aesthetics and shouldn't inherit behaviour from
the default plot specification, e.g. \code{\link{borders}}.}

\item{...}{other arguments passed on to \code{\link{layer}}. These are
often aesthetics, used to set an aesthetic to a fixed value, like
\code{color = "red"} or \code{size = 3}. They may also be parameters
to the paired geom/stat.}
}
\description{
\code{geom_timeline_label()} is used together with \code{geom_timeline}
for adding the annotations to the timeline. The subset is taken
the \code{n_max} number of earthquakes. Aesthetics are x, as the date of
earthquakes and \code{label} would be taken from the column name.
}
\note{
The aes \code{xmin} and \code{xmax} as the starting and ending
points of the timeline, which should be clarified.

The aes \code{x} is the \code{date} of the earthquakes

The optiona aes \code{y} is the a factor indicating some stratification
in which case multiple time lines will be plotted for each level of
the factor (e.g. \code{COUNTRY})

The aes \code{label} is the column in the data frame to obtain
the text annotation
}
\examples{
\dontrun{
ggplot(input_data, aes (x = date, y = COUNTRY,
color = as.numeric(DEATHS), size = as.numeric(EQ_PRIMARY))) +
geom_timeline(aes(xmin = as.Date("1900-01-01"), xmax =  as.Date("1925-01-01")) +
geom_timeline_label(aes(label = LOCATION_NAME,
xmin = as.Date("1900-01-01"), xmax = as.Date("1925-01-01")),
n_max = 5) +
theme_timeline()}

}
