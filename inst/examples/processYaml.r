\dontrun{
  
##------------------------------------------------------------------------------
## From function //
##------------------------------------------------------------------------------

## Get //  
yaml <- processYaml(
  from = function() {
    "object-ref: {id: x_1, where: .GlobalEnv, as: ref_1}"
    ref_1 * 2
  },
  ctx = YamlContext.ObjectReference.S3()
)

## Inspect //
yaml$src
## --> note that the original YAML markup has been substituted by a 
## suitable expression for this specific context (`yaml$src$x_1$get_assign`).
## The processing is now complete and the source object can be used as is
## as it is now "self contained" in the sense that it contains all information
## that are needed in order for it to do its job.

## Actual use of the source object //
x_1 <- 10
eval(yaml$src())

## Clean up //
rm(x_1)
rm(yaml)

##------------------------------------------------------------------------------
## From expression //
##------------------------------------------------------------------------------

## Get //  
yaml <- processYaml(
  from = captureExpression({
    "object-ref: {id: x_1, where: .GlobalEnv, as: ref_1}"
    ref_1 * 2
  }),
  ctx = YamlContext.ObjectReference.S3()
)

## Inspect //
yaml$src

## Actual use of the source object //
x_1 <- 10
eval(yaml$src)

## Clean up //
rm(x_1)
rm(yaml)

}
