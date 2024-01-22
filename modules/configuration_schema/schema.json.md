# Configuration data object

Type: `object`

<i id="https://example.com/configuration.schema.json">path: #https://example.com/configuration.schema.json</i>

&#36;schema: [https://json-schema.org/draft/2020-12/schema](https://json-schema.org/draft/2020-12/schema)

<b id="httpsexample.comconfiguration.schema.json">&#36;id: https://example.com/configuration.schema.json</b>

**_Properties_**

- <b id="#https://example.com/configuration.schema.json/properties/installed">installed</b> `required`
    - Type: `boolean`
    - <i id="https://example.com/configuration.schema.json/properties/installed">path: #https://example.com/configuration.schema.json/properties/installed</i>
- <b id="#https://example.com/configuration.schema.json/properties/private">private</b> `required`
    - Type: `object`
    - <i id="https://example.com/configuration.schema.json/properties/private">path: #https://example.com/configuration.schema.json/properties/private</i>
    - **_Properties_**
        - <b id="#https://example.com/configuration.schema.json/properties/private/properties/database">database</b>
            - Type: `object`
            - <i id="https://example.com/configuration.schema.json/properties/private/properties/database">path: #https://example.com/configuration.schema.json/properties/private/properties/database</i>
            - This schema accepts additional properties.
            - **_Properties_**
- <b id="#https://example.com/configuration.schema.json/properties/public">public</b> `required`
    - Type: `object`
    - <i id="https://example.com/configuration.schema.json/properties/public">path: #https://example.com/configuration.schema.json/properties/public</i>
    - **_Properties_**
        - <b id="#https://example.com/configuration.schema.json/properties/public/properties/sns">sns</b>
            - Type: `object`
            - <i id="https://example.com/configuration.schema.json/properties/public/properties/sns">path: #https://example.com/configuration.schema.json/properties/public/properties/sns</i>
            - This schema accepts additional properties.
            - **_Properties_**
        - <b id="#https://example.com/configuration.schema.json/properties/public/properties/sqs">sqs</b>
            - Type: `object`
            - <i id="https://example.com/configuration.schema.json/properties/public/properties/sqs">path: #https://example.com/configuration.schema.json/properties/public/properties/sqs</i>
            - This schema accepts additional properties.
            - **_Properties_**

_Generated with [json-schema-md-doc](https://brianwendt.github.io/json-schema-md-doc/)_