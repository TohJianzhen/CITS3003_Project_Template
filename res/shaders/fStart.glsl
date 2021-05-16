varying vec4 color;
varying vec2 texCoord;  // The third coordinate is always 0.0 and is discarded

//Part A
uniform float texScale;

//Part G
varying vec4 position;
varying vec3 normal;

uniform vec3 AmbientProduct, DiffuseProduct, SpecularProduct;
uniform mat4 ModelView;
uniform mat4 Projection;
uniform float Shininess;

//Light 1
uniform vec4 LightPosition;
uniform float LightBrightness;
uniform vec3 LightRGB;

//Part I Light2
uniform vec4 LightPosition2;
uniform float LightBrightness2;
uniform vec3 LightRGB2;

void main()
{
    // Transform vertex position into eye coordinates
    vec3 pos = (ModelView * position).xyz;

    // The vector to the light from the vertex    
    vec3 Lvec = LightPosition.xyz - pos;

    // Unit direction vectors for Blinn-Phong shading calculation
    vec3 L = normalize( Lvec );   // Direction to the light source
    vec3 E = normalize( -pos );   // Direction to the eye/camera
    vec3 H = normalize( L + E );  // Halfway vector

    // Transform vertex normal into eye coordinates (assumes scaling
    // is uniform across dimensions)
    vec3 N = normalize( (ModelView*vec4(normal, 0.0)).xyz );

    // Compute terms in the illumination equation
    vec3 ambient = LightRGB * LightBrightness * AmbientProduct;

    float Kd = max( dot(L, N), 0.0 );
    vec3  diffuse = LightRGB * LightBrightness * Kd * DiffuseProduct;

    float Ks = pow( max(dot(N, H), 0.0), Shininess );
    vec3  specular = LightBrightness * Ks * SpecularProduct;
    
    if (dot(L, N) < 0.0 ) {
	specular = vec3(0.0, 0.0, 0.0);
    } 

    //Part I Light2

     // The vector to the light from the vertex    
    vec3 Lvec2 = LightPosition2.xyz;

    // Unit direction vectors for Blinn-Phong shading calculation
    vec3 L2 = normalize( Lvec2 );   // Direction to the light source
    vec3 H2 = normalize( L2 + E );  // Halfway vector Light2

    vec3 ambient2 = LightRGB2 * LightBrightness2 * AmbientProduct;

    float Kd2 = max( dot(L2, N), 0.0 );
    vec3  diffuse2 = LightRGB2 * LightBrightness2 * Kd2 * DiffuseProduct;

    float Ks2 = pow( max(dot(N, H2), 0.0), Shininess );
    vec3  specular2 = LightBrightness2 * Ks2 * SpecularProduct;
    
    if (dot(L2, N) < 0.0 ) {
	specular2 = vec3(0.0, 0.0, 0.0);
    } 

    // globalAmbient is independent of distance from the light source
    vec3 globalAmbient = vec3(0.1, 0.1, 0.1);
    
    //part f - scale light sources by distance
    float lightScale = 0.01 + length(Lvec);

    color.rgb = globalAmbient  + ((ambient + diffuse ) / lightScale) + ambient2 + diffuse2;
    color.a = 1.0;

    gl_FragColor = color * texture2D( texture, texCoord * texScale ) + vec4(specular / lightScale + specular2, 1.0);
}
