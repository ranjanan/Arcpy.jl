module Arcpy

using PyCall
@pyimport arcpy

include("toolbox.jl")

GetParameterAsText(x) = arcpy.GetParameterAsText(x)
GetRasterProperties_management(x, y) = arcpy.GetRasterProperties_management(x, y)
getOutput(x, i) = x[:getOutput](i)

AddMessage(str) = arcpy.AddMessage(str)
setenv(var, val) = (acrpy.env[Symbol(var)] = val)

for f in (:FeatureClassToFeatureClass_conversion, 
		:Dissolve_management, :Delete_management, 
		:Clip_management, :CreateFishnet_management, 
		:AddField_management, :CalculateField_management, 
		:AddFieldDelimiters)
	@eval ($f)(args...) = acrpy.($f)(args...)
end


end # module
