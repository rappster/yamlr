#' @title
#' Class: ObjectReferenceYamlProcessed.S3 
#'
#' @description
#' Class representing parsed YAML markup as returned by function 
#' \code{\link[yamlr]{parseYaml}}
#' in the context of reactive references and its constructor function.
#' 
#' 
#' @template intended-use
#'
#' @param .x \code{\link{ANY}}. An object of an arbitrary class whose class
#'    attribute should be updated so that it becomes an instance of class
#'    \code{ObjectReferenceYamlProcessed.S3}. Mainly intended for rapid prototyping 
#'    purposes
#'    
#' @field original \code{\link{character}}.
#'    YAML markup as identified by 
#'    \code{\link[yamlr]{getYaml}}
#'    Initial: \code{character()}.
#' @field parsed \code{\link{list}}.
#'    Parsed YAML markup as identified by 
#'    \code{\link[yamlr]{getYaml}} and parsed by \code{\link[yamlr]{parseYaml}}.
#'    Initial: \code{list(id = character, where = NULL, as = NULL)}.
#' @field index \code{\link{numeric}}.
#'    Index denoting the lines/expressions that where YAML was identified. 
#'    These lines/expressions will later be substituted by suitable expressions.
#'    Initial: \code{numeric()}. 
#' @field src \code{\link{ANY}}.
#'    Object in which YAML markup was identified. Typcially, this corresponds
#'    to a function or expression, but it can generally be any R object that
#'    can contain YAML markup and for which methods for 
#'    \code{\link[yamlr]{getYaml}} are defined.
#'    Initial: \code{NULL}.
#' @field expr \code{\link{environment}}.
#'    Necessary expressions in the context of processing YAML markup.
#'    Typically, these are \code{\link[base]{get}}, \code{\link[base]{exists}}
#'    and \code{\link[base]{assign}} expressions, but generally this field 
#'    can hold any valid R expression.
#'    Initial: \code{new.env(parent = emptyenv())}.
#' @return Instance of class \code{ObjectReferenceYamlProcessed.S3}.
#' @example inst/examples/ObjectReferenceYamlProcessed.S3.r
#' @seealso \code{
#'   	\link[yamlr]{ObjectReferenceYaml.S3},
#'     \link[yamlr]{ObjectReferenceYamlProcessed.S3},
#'     \link[yamlr]{getYaml},
#'     \link[yamlr]{parseYaml}
#' }
#' @template author
#' @template references
#' @export
ObjectReferenceYamlProcessed.S3 <- function(
  .x,
  original = character(),
  parsed = list(id = character, where = NULL, as = NULL),
  index = numeric(),
  src = NULL,
  expr = new.env(parent = emptyenv())
) {
  if (!missing(.x)) {
    class(.x) <- c("ObjectReferenceYamlProcessed.S3", class(.x))
    out <- .x
  } else {
    out <- new.env()
    out$original <- original
    out$parsed <- parsed
    out$index <- index
    out$src <- src
    out$expr <- expr
    class(out) <- c("ObjectReferenceYamlProcessed.S3", class(out))
  }
  return(out)
}

