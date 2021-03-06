#' @title
#' Process YAML Markup (generic)
#'
#' @description 
#' Convenience wrapper. Processes YAML markup in the sense that the complete 
#' workflow associated to a given application context is executed. 
#' 
#' @details 
#' Currently, this means that all processing steps associated with the context 
#' \code{\link[yamlr]{YamlContext.ObjectReference.S3}} are executed:
#' 
#' \itemize{
#'    \item{\code{\link[yamlr]{getYaml}}}
#'    \item{\code{\link[yamlr]{parseYaml}}}
#'    \item{\code{\link[yamlr]{buildExpressionFromYaml}}}
#'    \item{\code{\link[yamlr]{updateYamlSource}}}
#' }
#' 
#' @template yaml-syntax
#'   	
#' @param from \strong{Signature argument}.
#'    Object containing YAML markup.
#' @param ctx \strong{Signature argument}.
#'    Markup proecessing context.
#' @param where \code{\link{environment}}.
#'    Environment in which to assign the function in the \code{src} field of 
#'    class \code{\link[yamlr]{ObjectReferenceYaml.S3}}. Only relevant 
#'    in case the YAML has been provided via comments instead of an 
#'    inline string as this involves some additional transformation steps.
#' @param strict \code{\link{logical}}.
#'    \code{TRUE}: error if no YAML markup could be identified (which in turn
#'    results in field \code{original} in class 
#'    \code{\link[yamlr]{ObjectReferencedYaml.S3}} being empty);
#'    \code{FALSE}: no error if no YAML markup could be identified.
#' @template threedots
#' @example inst/examples/processYaml.r
#' @seealso \code{
#'   	\link[yamlr]{processYaml-function-YamlContext.ObjectReference.S3-method},
#'    \link[yamlr]{getYaml},
#'    \link[yamlr]{parseYaml},
#'    \link[yamlr]{buildExpressionFromYaml},
#'    \link[yamlr]{updateYamlSource}
#' }
#' @template author
#' @template references
setGeneric(
  name = "processYaml",
  signature = c(
    "from",
    "ctx"
  ),
  def = function(
    from,
    ctx = NULL,
    where = parent.frame(),
    strict = FALSE,
    ...
  ) {
    standardGeneric("processYaml")       
  }
)

#' @title
#' Process YAML Markup (ANY-YamlContext.ObjectReference.S3)
#'
#' @description 
#' See generic: \code{\link[yamlr]{processYaml}}
#'      
#' @inheritParams processYaml
#' @param from \code{\link{ANY}}.
#' @return \code{\link{character}}. Identified YAML markup.
#' @example inst/examples/processYaml.r
#' @seealso \code{
#'    \link[yamlr]{processYaml},
#'    \link[yamlr]{getYaml},
#'    \link[yamlr]{parseYaml},
#'    \link[yamlr]{buildExpressionFromYaml},
#'    \link[yamlr]{updateYamlSource}
#' }
#' @template author
#' @template references
#' @aliases processYaml-ANY-YamlContext.ObjectReference.S3-method
#' @export
setMethod(
  f = "processYaml", 
  signature = signature(
    from = "ANY",
    ctx = "YamlContext.ObjectReference.S3"
  ), 
  definition = function(
    from,
    ctx,
    where,
    strict,
    ...
  ) {
    
  ## Get //  
  yaml <- getYaml(from = from, ctx = ctx, where = where, strict = strict)
  
  ## Parse //
  yaml <- parseYaml(yaml = yaml)

  ## Build //
  yaml <- buildExpressionFromYaml(yaml = yaml, where = where)

  ## Update //
  yaml <- updateYamlSource(yaml = yaml)

  return(yaml)
  
  }
)
