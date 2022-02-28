/* groovylint-disable-next-line MethodReturnTypeRequired, NoDef */
def call(Map config = [:]) { 
  /* groovylint-disable-next-line NoDef, VariableTypeRequired */
  def scriptcontents = libraryResource "com/jjlahner/scripts/linux/${config.name}"
  writeFile file: "${config.name}", text: scriptcontents
  sh "chmod a+x ./${config.name}"
}
