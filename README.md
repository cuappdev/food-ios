# food-ios

# Setting up GraphQL Codegen with Apollo
To automate recompiling the `API.swift` file after making modifications to any `*.graphql` query files, here's what to do: 
1. Go to the Build Phases tab in the Food target, and add a New Run Script Phase with the following script: 
  ```
  SCRIPT_PATH="${PODS_ROOT}/Apollo/scripts"
  cd "${SRCROOT}/${TARGET_NAME}"
  #"${SCRIPT_PATH}"/run-bundled-codegen.sh schema:download --endpoint="https://graphql.anilist.co/"
  "${SCRIPT_PATH}"/run-bundled-codegen.sh codegen:generate --target=swift --includes=./**/*.graphql --localSchemaFile="schema.json" API.swift
  ``` 
  Change the "https://graphql.anilist.co/" to the endpoint of our GraphQL server. 

2. The third line of the script downloads the schema from a GraphQL server. Uncomment this line, rebuild the project, then comment this line out again for future build efficiency. 
3. The fourth line of the script updates `API.swift` with any changes to your `*.graphql` query files. Keep this line uncommented. 
