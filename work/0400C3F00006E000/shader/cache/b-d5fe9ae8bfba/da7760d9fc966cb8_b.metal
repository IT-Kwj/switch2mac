#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

struct dm_border_t { uint mask; float4 k[32]; };
static inline __attribute__((always_inline)) float4 dm_bmix(float4 r, float4 w, float4 k) { return r + (w - r) * k; }
static inline __attribute__((always_inline)) float dm_bmix(float r, float w, float4 k) { return r + (w - r) * k.x; }
template<typename V, typename T, typename... A> static inline __attribute__((always_inline)) V dm_bs(V r, constant dm_border_t* b, uint i, T t, sampler w, A... a)
{
    if (b->mask >> i & 1u) r = dm_bmix(r, t.sample(w, a...), b->k[i]);
    return r;
}

struct _10
{
    uint _m0;
    uint _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _16* fp_c3 [[id(0)]];
    texture2d<float> fp_t_tcb_8 [[id(1)]];
    sampler fp_t_tcb_8Smplr [[id(2)]];
    sampler fp_t_tcb_8Smplr_w [[id(3)]];
    constant dm_border_t* dm_border [[id(4)]];
};

struct main0_out
{
    float4 m_32 [[color(0)]];
};

struct main0_in
{
    float4 m_34 [[user(locn0)]];
    float4 m_29 [[user(locn1)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _41 = gl_FragCoord.w;
    float _43 = in.m_29.z;
    float _45 = gl_FragCoord.w;
    float _47 = _43 * _45;
    float _49 = in.m_29.w;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = in.m_29.x;
    float _57 = gl_FragCoord.w;
    float _59 = _55 * _57;
    float _61 = in.m_29.y;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = 1.0 / _41;
    float _69 = _67 * _47;
    float _71 = _67 * _53;
    float _73 = _67 * _59;
    float _75 = _67 * _65;
    float2 _460 = float2(_69, _71);
    float3 _79 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_460, float2(0.0), isnan(_460))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_460, float2(0.0), isnan(_460))).xyz;
    float _81 = _79.x;
    float _83 = _79.y;
    float _85 = _79.z;
    float2 _477 = float2(_69, _71);
    float3 _87 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_477, float2(0.0), isnan(_477)), int2(0, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_477, float2(0.0), isnan(_477)), int2(0, 1)).xyz;
    float _89 = _87.x;
    float _91 = _87.y;
    float _93 = _87.z;
    float2 _493 = float2(_69, _71);
    float3 _95 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_493, float2(0.0), isnan(_493)), int2(1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_493, float2(0.0), isnan(_493)), int2(1, 0)).xyz;
    float _97 = _95.x;
    float _99 = _95.y;
    float _101 = _95.z;
    float2 _508 = float2(_69, _71);
    float3 _103 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_508, float2(0.0), isnan(_508)), int2(1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_508, float2(0.0), isnan(_508)), int2(1)).xyz;
    float _105 = _103.x;
    float _107 = _103.y;
    float _109 = _103.z;
    float2 _523 = float2(_73, _75);
    float4 _112 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_523, float2(0.0), isnan(_523))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_523, float2(0.0), isnan(_523))).xyzw;
    float _114 = _112.x;
    float _116 = _112.y;
    float _118 = _112.z;
    float _120 = _112.w;
    float _122 = _83 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _124 = _91 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _126 = _99 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _128 = fma(_81, (*spvDescriptorSet0.fp_c3)._m0[2].x, _122);
    float _130 = _107 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _132 = fma(_89, (*spvDescriptorSet0.fp_c3)._m0[2].x, _124);
    float _134 = fma(_97, (*spvDescriptorSet0.fp_c3)._m0[2].x, _126);
    float _136 = fma(_85, (*spvDescriptorSet0.fp_c3)._m0[2].z, _128);
    float _138 = fma(_105, (*spvDescriptorSet0.fp_c3)._m0[2].x, _130);
    float _140 = fma(_93, (*spvDescriptorSet0.fp_c3)._m0[2].z, _132);
    float _142 = _116 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _144 = fma(_101, (*spvDescriptorSet0.fp_c3)._m0[2].z, _134);
    float _146 = fma(_109, (*spvDescriptorSet0.fp_c3)._m0[2].z, _138);
    float _148 = fma(_114, (*spvDescriptorSet0.fp_c3)._m0[2].x, _142);
    float _150 = precise::min(_136, _140);
    float _152 = precise::max(_136, _140);
    float _154 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[2].z, _148);
    float _156 = precise::min(_144, _146);
    float _158 = precise::max(_144, _146);
    float _160 = precise::min(_150, _156);
    float _162 = precise::max(_152, _158);
    float _164 = precise::min(_154, _160);
    float _166 = precise::max(_154, _162);
    float _168 = _162 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _170 = -_164;
    float _172 = _170 + _166;
    float _174 = precise::max(_168, (*spvDescriptorSet0.fp_c3)._m0[3].y);
    bool _178 = _172 > _174;
    if (!_178)
    {
        out.m_32.x = _114;
        out.m_32.y = _116;
        out.m_32.z = _118;
        out.m_32.w = _120;
        return out;
    }
    float _180 = -_144;
    float _182 = _180 + _140;
    float _184 = -_136;
    float _186 = _184 + _146;
    float _188 = in.m_34.z;
    float _190 = gl_FragCoord.w;
    float _192 = _188 * _190;
    float _194 = in.m_34.x;
    float _196 = gl_FragCoord.w;
    float _198 = _194 * _196;
    float _200 = in.m_34.w;
    float _202 = gl_FragCoord.w;
    float _204 = _200 * _202;
    float _206 = -_186;
    float _208 = _182 + _206;
    float _210 = _182 + _186;
    float _212 = _208 * _208;
    float _214 = fma(_210, _210, _212);
    float _216 = _214 + 0.00260416674427688121795654296875;
    float _218 = rsqrt(_216);
    float _220 = _67 * _198;
    float _222 = _210 * _218;
    float _224 = _208 * _218;
    float _226 = in.m_34.y;
    float _228 = gl_FragCoord.w;
    float _230 = _226 * _228;
    float _232 = -_220;
    float _234 = fma(_222, _232, _73);
    float _236 = fma(_222, _220, _73);
    float _238 = abs(_222);
    float _240 = abs(_224);
    float _242 = precise::min(_238, _240);
    float _244 = _242 * 2.0;
    float _246 = 1.0 / _244;
    float _248 = _246 * (*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _250 = _67 * _230;
    float _252 = _67 * _192;
    float _254 = _67 * _204;
    float _256 = _248 * 0.5;
    float _258 = -_250;
    float _260 = fma(_224, _258, _75);
    float _262 = fma(_222, _256, 0.5);
    float _264 = precise::clamp(_262, 0.0, 1.0);
    float _266 = fma(_224, _256, 0.5);
    float _268 = precise::clamp(_266, 0.0, 1.0);
    float _270 = fma(_224, _250, _75);
    float _272 = _264 + (-0.5);
    float _274 = _268 + (-0.5);
    float _276 = -_252;
    float _278 = fma(_272, _276, _73);
    float _280 = -_254;
    float _282 = fma(_274, _280, _75);
    float _284 = fma(_272, _252, _73);
    float _286 = fma(_274, _254, _75);
    float2 _815 = float2(_234, _260);
    float4 _288 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_815, float2(0.0), isnan(_815))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_815, float2(0.0), isnan(_815))).xyzw;
    float _290 = _288.x;
    float _292 = _288.y;
    float _294 = _288.z;
    float _296 = _288.w;
    float2 _831 = float2(_236, _270);
    float4 _298 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_831, float2(0.0), isnan(_831))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_831, float2(0.0), isnan(_831))).xyzw;
    float _300 = _298.x;
    float _302 = _298.y;
    float _304 = _298.z;
    float _306 = _298.w;
    float2 _847 = float2(_278, _282);
    float4 _308 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_847, float2(0.0), isnan(_847))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_847, float2(0.0), isnan(_847))).xyzw;
    float _310 = _308.x;
    float _312 = _308.y;
    float _314 = _308.z;
    float _316 = _308.w;
    float2 _863 = float2(_284, _286);
    float4 _318 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_863, float2(0.0), isnan(_863))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_863, float2(0.0), isnan(_863))).xyzw;
    float _320 = _318.x;
    float _322 = _318.y;
    float _324 = _318.z;
    float _326 = _318.w;
    float _328 = _292 + _302;
    float _330 = _290 + _300;
    float _332 = _294 + _304;
    float _334 = _312 + _322;
    float _336 = _310 + _320;
    float _338 = _314 + _324;
    float _340 = _296 + _306;
    float _342 = _328 + _334;
    float _344 = _330 + _336;
    float _346 = _332 + _338;
    float _348 = _340 * 0.5;
    float _350 = _342 * 0.25;
    float _352 = _344 * 0.25;
    float _354 = _346 * 0.25;
    float _356 = _350 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _358 = fma(_352, (*spvDescriptorSet0.fp_c3)._m0[2].x, _356);
    float _360 = fma(_354, (*spvDescriptorSet0.fp_c3)._m0[2].z, _358);
    bool _362 = _360 >= _162;
    bool _364 = isnan(_360);
    bool _366 = _362 || _364;
    bool _368 = isnan(_162);
    bool _370 = _366 || _368;
    bool _372 = _160 < _360;
    bool _374 = !_370;
    bool _376 = _372 && _374;
    float _378 = _316 + _326;
    float _380 = _340 + _378;
    int _383 = as_type<int>(_352);
    int _385 = as_type<int>(_350);
    int _387 = as_type<int>(_354);
    int _389 = as_type<int>(_348);
    if (!_376)
    {
        float _391 = _330 * 0.5;
        _383 = as_type<int>(_391);
    }
    int _393 = _383;
    if (!_376)
    {
        float _395 = _328 * 0.5;
        _385 = as_type<int>(_395);
    }
    int _397 = _385;
    if (!_376)
    {
        float _399 = _332 * 0.5;
        _387 = as_type<int>(_399);
    }
    int _401 = _387;
    if (_376)
    {
        float _403 = _380 * 0.25;
        _389 = as_type<int>(_403);
    }
    int _405 = _389;
    out.m_32.x = as_type<float>(_393);
    out.m_32.y = as_type<float>(_397);
    out.m_32.z = as_type<float>(_401);
    out.m_32.w = as_type<float>(_405);
    return out;
}


struct main0_out_u
{
    uint4 m_32 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _41 = gl_FragCoord.w;
    float _43 = in.m_29.z;
    float _45 = gl_FragCoord.w;
    float _47 = _43 * _45;
    float _49 = in.m_29.w;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = in.m_29.x;
    float _57 = gl_FragCoord.w;
    float _59 = _55 * _57;
    float _61 = in.m_29.y;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = 1.0 / _41;
    float _69 = _67 * _47;
    float _71 = _67 * _53;
    float _73 = _67 * _59;
    float _75 = _67 * _65;
    float2 _460 = float2(_69, _71);
    float3 _79 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_460, float2(0.0), isnan(_460))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_460, float2(0.0), isnan(_460))).xyz;
    float _81 = _79.x;
    float _83 = _79.y;
    float _85 = _79.z;
    float2 _477 = float2(_69, _71);
    float3 _87 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_477, float2(0.0), isnan(_477)), int2(0, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_477, float2(0.0), isnan(_477)), int2(0, 1)).xyz;
    float _89 = _87.x;
    float _91 = _87.y;
    float _93 = _87.z;
    float2 _493 = float2(_69, _71);
    float3 _95 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_493, float2(0.0), isnan(_493)), int2(1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_493, float2(0.0), isnan(_493)), int2(1, 0)).xyz;
    float _97 = _95.x;
    float _99 = _95.y;
    float _101 = _95.z;
    float2 _508 = float2(_69, _71);
    float3 _103 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_508, float2(0.0), isnan(_508)), int2(1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_508, float2(0.0), isnan(_508)), int2(1)).xyz;
    float _105 = _103.x;
    float _107 = _103.y;
    float _109 = _103.z;
    float2 _523 = float2(_73, _75);
    float4 _112 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_523, float2(0.0), isnan(_523))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_523, float2(0.0), isnan(_523))).xyzw;
    float _114 = _112.x;
    float _116 = _112.y;
    float _118 = _112.z;
    float _120 = _112.w;
    float _122 = _83 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _124 = _91 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _126 = _99 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _128 = fma(_81, (*spvDescriptorSet0.fp_c3)._m0[2].x, _122);
    float _130 = _107 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _132 = fma(_89, (*spvDescriptorSet0.fp_c3)._m0[2].x, _124);
    float _134 = fma(_97, (*spvDescriptorSet0.fp_c3)._m0[2].x, _126);
    float _136 = fma(_85, (*spvDescriptorSet0.fp_c3)._m0[2].z, _128);
    float _138 = fma(_105, (*spvDescriptorSet0.fp_c3)._m0[2].x, _130);
    float _140 = fma(_93, (*spvDescriptorSet0.fp_c3)._m0[2].z, _132);
    float _142 = _116 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _144 = fma(_101, (*spvDescriptorSet0.fp_c3)._m0[2].z, _134);
    float _146 = fma(_109, (*spvDescriptorSet0.fp_c3)._m0[2].z, _138);
    float _148 = fma(_114, (*spvDescriptorSet0.fp_c3)._m0[2].x, _142);
    float _150 = precise::min(_136, _140);
    float _152 = precise::max(_136, _140);
    float _154 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[2].z, _148);
    float _156 = precise::min(_144, _146);
    float _158 = precise::max(_144, _146);
    float _160 = precise::min(_150, _156);
    float _162 = precise::max(_152, _158);
    float _164 = precise::min(_154, _160);
    float _166 = precise::max(_154, _162);
    float _168 = _162 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _170 = -_164;
    float _172 = _170 + _166;
    float _174 = precise::max(_168, (*spvDescriptorSet0.fp_c3)._m0[3].y);
    bool _178 = _172 > _174;
    if (!_178)
    {
        out.m_32.x = _114;
        out.m_32.y = _116;
        out.m_32.z = _118;
        out.m_32.w = _120;
        return main0_out_u{as_type<uint4>(out.m_32)};
    }
    float _180 = -_144;
    float _182 = _180 + _140;
    float _184 = -_136;
    float _186 = _184 + _146;
    float _188 = in.m_34.z;
    float _190 = gl_FragCoord.w;
    float _192 = _188 * _190;
    float _194 = in.m_34.x;
    float _196 = gl_FragCoord.w;
    float _198 = _194 * _196;
    float _200 = in.m_34.w;
    float _202 = gl_FragCoord.w;
    float _204 = _200 * _202;
    float _206 = -_186;
    float _208 = _182 + _206;
    float _210 = _182 + _186;
    float _212 = _208 * _208;
    float _214 = fma(_210, _210, _212);
    float _216 = _214 + 0.00260416674427688121795654296875;
    float _218 = rsqrt(_216);
    float _220 = _67 * _198;
    float _222 = _210 * _218;
    float _224 = _208 * _218;
    float _226 = in.m_34.y;
    float _228 = gl_FragCoord.w;
    float _230 = _226 * _228;
    float _232 = -_220;
    float _234 = fma(_222, _232, _73);
    float _236 = fma(_222, _220, _73);
    float _238 = abs(_222);
    float _240 = abs(_224);
    float _242 = precise::min(_238, _240);
    float _244 = _242 * 2.0;
    float _246 = 1.0 / _244;
    float _248 = _246 * (*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _250 = _67 * _230;
    float _252 = _67 * _192;
    float _254 = _67 * _204;
    float _256 = _248 * 0.5;
    float _258 = -_250;
    float _260 = fma(_224, _258, _75);
    float _262 = fma(_222, _256, 0.5);
    float _264 = precise::clamp(_262, 0.0, 1.0);
    float _266 = fma(_224, _256, 0.5);
    float _268 = precise::clamp(_266, 0.0, 1.0);
    float _270 = fma(_224, _250, _75);
    float _272 = _264 + (-0.5);
    float _274 = _268 + (-0.5);
    float _276 = -_252;
    float _278 = fma(_272, _276, _73);
    float _280 = -_254;
    float _282 = fma(_274, _280, _75);
    float _284 = fma(_272, _252, _73);
    float _286 = fma(_274, _254, _75);
    float2 _815 = float2(_234, _260);
    float4 _288 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_815, float2(0.0), isnan(_815))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_815, float2(0.0), isnan(_815))).xyzw;
    float _290 = _288.x;
    float _292 = _288.y;
    float _294 = _288.z;
    float _296 = _288.w;
    float2 _831 = float2(_236, _270);
    float4 _298 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_831, float2(0.0), isnan(_831))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_831, float2(0.0), isnan(_831))).xyzw;
    float _300 = _298.x;
    float _302 = _298.y;
    float _304 = _298.z;
    float _306 = _298.w;
    float2 _847 = float2(_278, _282);
    float4 _308 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_847, float2(0.0), isnan(_847))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_847, float2(0.0), isnan(_847))).xyzw;
    float _310 = _308.x;
    float _312 = _308.y;
    float _314 = _308.z;
    float _316 = _308.w;
    float2 _863 = float2(_284, _286);
    float4 _318 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_863, float2(0.0), isnan(_863))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_863, float2(0.0), isnan(_863))).xyzw;
    float _320 = _318.x;
    float _322 = _318.y;
    float _324 = _318.z;
    float _326 = _318.w;
    float _328 = _292 + _302;
    float _330 = _290 + _300;
    float _332 = _294 + _304;
    float _334 = _312 + _322;
    float _336 = _310 + _320;
    float _338 = _314 + _324;
    float _340 = _296 + _306;
    float _342 = _328 + _334;
    float _344 = _330 + _336;
    float _346 = _332 + _338;
    float _348 = _340 * 0.5;
    float _350 = _342 * 0.25;
    float _352 = _344 * 0.25;
    float _354 = _346 * 0.25;
    float _356 = _350 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _358 = fma(_352, (*spvDescriptorSet0.fp_c3)._m0[2].x, _356);
    float _360 = fma(_354, (*spvDescriptorSet0.fp_c3)._m0[2].z, _358);
    bool _362 = _360 >= _162;
    bool _364 = isnan(_360);
    bool _366 = _362 || _364;
    bool _368 = isnan(_162);
    bool _370 = _366 || _368;
    bool _372 = _160 < _360;
    bool _374 = !_370;
    bool _376 = _372 && _374;
    float _378 = _316 + _326;
    float _380 = _340 + _378;
    int _383 = as_type<int>(_352);
    int _385 = as_type<int>(_350);
    int _387 = as_type<int>(_354);
    int _389 = as_type<int>(_348);
    if (!_376)
    {
        float _391 = _330 * 0.5;
        _383 = as_type<int>(_391);
    }
    int _393 = _383;
    if (!_376)
    {
        float _395 = _328 * 0.5;
        _385 = as_type<int>(_395);
    }
    int _397 = _385;
    if (!_376)
    {
        float _399 = _332 * 0.5;
        _387 = as_type<int>(_399);
    }
    int _401 = _387;
    if (_376)
    {
        float _403 = _380 * 0.25;
        _389 = as_type<int>(_403);
    }
    int _405 = _389;
    out.m_32.x = as_type<float>(_393);
    out.m_32.y = as_type<float>(_397);
    out.m_32.z = as_type<float>(_401);
    out.m_32.w = as_type<float>(_405);
    return main0_out_u{as_type<uint4>(out.m_32)};
}

