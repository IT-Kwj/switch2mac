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
    constant _16* fp_c5 [[id(0)]];
    constant _16* fp_c4 [[id(1)]];
    constant _16* fp_c3 [[id(2)]];
    texture2d<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    sampler fp_t_tcb_ASmplr_w [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    constant dm_border_t* dm_border [[id(9)]];
};

struct main0_out
{
    float4 m_44 [[color(0)]];
};

struct main0_in
{
    float4 m_39 [[user(locn0)]];
    float4 m_41 [[user(locn1)]];
    float4 m_37 [[user(locn2)]];
    float4 m_35 [[user(locn3)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _51 = gl_FragCoord.w;
    float _53 = in.m_35.y;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = in.m_35.x;
    float _61 = gl_FragCoord.w;
    float _63 = _59 * _61;
    float _65 = in.m_35.z;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = 1.0 / _51;
    float _73 = _71 * _57;
    float _75 = _71 * _63;
    float _77 = _71 * _69;
    float _79 = _73 * _73;
    float _81 = fma(_75, _75, _79);
    float _83 = fma(_77, _77, _81);
    float _85 = rsqrt(_83);
    float _87 = _73 * _85;
    float _89 = _75 * _85;
    float _91 = _77 * _85;
    float _93 = _87 * (*spvDescriptorSet0.fp_c5)._m0[2].y;
    float _95 = _87 * (*spvDescriptorSet0.fp_c4)._m0[14].x;
    float _97 = fma(_89, (*spvDescriptorSet0.fp_c5)._m0[2].x, _93);
    float _99 = fma(_91, (*spvDescriptorSet0.fp_c5)._m0[2].z, _97);
    float _101 = fma(_95, 0.5, 0.5);
    float _103 = fma(_99, 0.5, 0.5);
    float2 _552 = float2(_103, _101);
    float4 _106 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_552, float2(0.0), isnan(_552))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_552, float2(0.0), isnan(_552))).xyzw;
    float _108 = _106.x;
    float _110 = _106.y;
    float _112 = _106.z;
    float _114 = _106.w;
    float _116 = in.m_37.x;
    float _118 = gl_FragCoord.w;
    float _120 = _116 * _118;
    float _122 = 0.0 + _95;
    float _124 = precise::clamp(_122, 0.0, 1.0);
    float _126 = in.m_39.x;
    float _128 = gl_FragCoord.w;
    float _130 = _126 * _128;
    float _132 = abs(_124);
    float _134 = log2(_132);
    float _136 = -(*spvDescriptorSet0.fp_c4)._m0[10].w;
    float _138 = _136 + (*spvDescriptorSet0.fp_c4)._m0[10].z;
    float _140 = _71 * _120;
    float _142 = _134 * (*spvDescriptorSet0.fp_c4)._m0[10].y;
    bool _146 = _95 >= _140;
    float _148 = exp2(_142);
    float _150 = 0.0;
    float _152 = _134;
    float _154 = _140;
    if (!_146)
    {
        _150 = 0.0;
    }
    float _156 = _150;
    float _158 = _156;
    if (!_146)
    {
        _152 = 0.0;
        _154 = 0.0;
    }
    float _160 = _152;
    float _162 = _154;
    bool _164 = !_146;
    float _166 = _162;
    float _168 = _160;
    if (!_164)
    {
        float _170 = in.m_41.x;
        float _172 = gl_FragCoord.w;
        float _174 = _170 * _172;
        float _176 = -(*spvDescriptorSet0.fp_c3)._m0[8].x;
        float _178 = (*spvDescriptorSet0.fp_c3)._m0[8].y + _176;
        float _180 = fma(_95, 350.80767822265625, 53.62115478515625);
        float _182 = 1.0 / _178;
        float _184 = log2(_180);
        float _186 = _71 * _174;
        float _188 = -(*spvDescriptorSet0.fp_c3)._m0[8].x;
        float _190 = _186 + _188;
        float _192 = _190 * _182;
        float _194 = _184 * 0.1155245304107666015625;
        float _196 = sqrt(_192);
        float2 _674 = float2(_194, _196);
        float3 _200 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_674, float2(0.0), isnan(_674))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_674, float2(0.0), isnan(_674))).xyz;
        float _202 = _200.x;
        float _204 = _200.y;
        float _206 = _200.z;
        _166 = _202;
        _168 = _204;
        _158 = _206;
    }
    float _208 = _166;
    float _210 = _168;
    float _212 = _158;
    float _214 = _108 * (*spvDescriptorSet0.fp_c4)._m0[13].x;
    float _216 = -(*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _218 = fma(_99, (*spvDescriptorSet0.fp_c4)._m0[12].z, _216);
    float _220 = precise::clamp(_218, 0.0, 1.0);
    float _222 = _114 + (*spvDescriptorSet0.fp_c5)._m0[6].w;
    float _224 = precise::clamp(_222, 0.0, 1.0);
    float _226 = fma(_148, _138, (*spvDescriptorSet0.fp_c4)._m0[10].w);
    float _228 = -(*spvDescriptorSet0.fp_c5)._m0[6].x;
    float _230 = _214 + _228;
    float _232 = _214 * _208;
    float _234 = _220 * (*spvDescriptorSet0.fp_c4)._m0[12].x;
    float _236 = _110 * (*spvDescriptorSet0.fp_c4)._m0[13].x;
    float _238 = fma(_224, _230, (*spvDescriptorSet0.fp_c5)._m0[6].x);
    float _240 = _71 * _130;
    float _242 = -(*spvDescriptorSet0.fp_c5)._m0[6].y;
    float _244 = _236 + _242;
    float _246 = fma(_232, _234, _238);
    float _248 = _112 * (*spvDescriptorSet0.fp_c4)._m0[13].x;
    float _250 = _236 * _210;
    float _252 = fma(_224, _244, (*spvDescriptorSet0.fp_c5)._m0[6].y);
    float _254 = _226 * _240;
    float _256 = -(*spvDescriptorSet0.fp_c5)._m0[6].z;
    float _258 = _248 + _256;
    float _260 = _248 * _212;
    float _262 = fma(_250, _234, _252);
    float _264 = -_246;
    float _266 = _264 + (*spvDescriptorSet0.fp_c4)._m0[11].x;
    float _268 = fma(_224, _258, (*spvDescriptorSet0.fp_c5)._m0[6].z);
    float _270 = -_262;
    float _272 = _270 + (*spvDescriptorSet0.fp_c4)._m0[11].y;
    float _274 = fma(_254, _266, _246);
    float _276 = fma(_260, _234, _268);
    float _278 = fma(_254, _272, _262);
    float _280 = _274 * (*spvDescriptorSet0.fp_c4)._m0[13].z;
    float _282 = -_276;
    float _284 = _282 + (*spvDescriptorSet0.fp_c4)._m0[11].z;
    float _286 = _278 * (*spvDescriptorSet0.fp_c4)._m0[13].z;
    float _288 = fma(_254, _284, _276);
    bool _290 = _280 >= 1.41299998760223388671875;
    bool _292 = isnan(_280);
    bool _294 = _290 || _292;
    bool _296 = isnan(1.41299998760223388671875);
    bool _298 = _294 || _296;
    bool _300 = _286 >= 1.41299998760223388671875;
    bool _302 = isnan(_286);
    bool _304 = _300 || _302;
    bool _306 = isnan(1.41299998760223388671875);
    bool _308 = _304 || _306;
    float _310 = _288 * (*spvDescriptorSet0.fp_c4)._m0[13].z;
    bool _312 = _310 >= 1.41299998760223388671875;
    bool _314 = isnan(_310);
    bool _316 = _312 || _314;
    bool _318 = isnan(1.41299998760223388671875);
    bool _320 = _316 || _318;
    int _323 = as_type<int>(_278);
    float _325 = _288;
    int _327 = as_type<int>(_236);
    float _329 = _276;
    float _331 = _234;
    float _333 = _246;
    float _335 = _310;
    float _337 = _286;
    float _339 = _280;
    float _341 = _250;
    if (!_298)
    {
        float _343 = _280 * 0.38317000865936279296875;
        _323 = as_type<int>(_343);
    }
    int _345 = _323;
    if (_298)
    {
        float _347 = _280 * (-1.44269502162933349609375);
        _325 = _347;
    }
    float _349 = _325;
    int _351 = as_type<int>(_349);
    if (!_308)
    {
        float _353 = _286 * 0.38317000865936279296875;
        _327 = as_type<int>(_353);
    }
    int _355 = _327;
    if (_308)
    {
        float _357 = _286 * (-1.44269502162933349609375);
        _329 = _357;
    }
    float _359 = _329;
    if (_298)
    {
        float _361 = exp2(_349);
        _331 = _361;
    }
    float _363 = _331;
    if (!_320)
    {
        float _365 = _310 * 0.38317000865936279296875;
        _333 = _365;
    }
    float _367 = _333;
    if (_320)
    {
        float _369 = _310 * (-1.44269502162933349609375);
        _335 = _369;
    }
    float _371 = _335;
    int _373 = _355;
    if (!_308)
    {
        float _375 = abs(as_type<float>(_355));
        float _377 = log2(_375);
        _373 = as_type<int>(_377);
    }
    int _379 = _373;
    int _381 = _345;
    if (!_298)
    {
        float _383 = abs(as_type<float>(_345));
        float _385 = log2(_383);
        _381 = as_type<int>(_385);
    }
    int _387 = _381;
    float _389 = _367;
    if (!_320)
    {
        float _391 = abs(_367);
        float _393 = log2(_391);
        _389 = _393;
    }
    float _395 = _389;
    int _397 = _379;
    if (!_308)
    {
        float _399 = as_type<float>(_379) * 0.4545454680919647216796875;
        _337 = _399;
    }
    float _401 = _337;
    int _403 = _387;
    if (!_298)
    {
        float _405 = as_type<float>(_387) * 0.4545454680919647216796875;
        _339 = _405;
    }
    float _407 = _339;
    float _409 = _359;
    if (_308)
    {
        float _411 = exp2(_359);
        _409 = _411;
    }
    float _413 = _409;
    if (!_320)
    {
        float _415 = _395 * 0.4545454680919647216796875;
        _341 = _415;
    }
    float _417 = _341;
    if (!_308)
    {
        float _419 = exp2(_401);
        _403 = as_type<int>(_419);
    }
    int _421 = _403;
    float _423 = _371;
    int _425 = _421;
    if (_320)
    {
        float _427 = exp2(_371);
        _423 = _427;
    }
    float _429 = _423;
    if (!_298)
    {
        float _431 = exp2(_407);
        _351 = as_type<int>(_431);
    }
    int _433 = _351;
    int _435 = _433;
    if (_308)
    {
        float _437 = -_413;
        float _439 = _437 + 1.0;
        _425 = as_type<int>(_439);
    }
    int _441 = _425;
    if (!_320)
    {
        float _443 = exp2(_417);
        _397 = as_type<int>(_443);
    }
    int _445 = _397;
    int _447 = _445;
    if (_298)
    {
        float _449 = -_363;
        float _451 = _449 + 1.0;
        _435 = as_type<int>(_451);
    }
    int _453 = _435;
    if (_320)
    {
        float _455 = -_429;
        float _457 = _455 + 1.0;
        _447 = as_type<int>(_457);
    }
    int _459 = _447;
    out.m_44.x = as_type<float>(_453);
    out.m_44.y = as_type<float>(_441);
    out.m_44.z = as_type<float>(_459);
    out.m_44.w = 1.0;
    return out;
}


struct main0_out_u
{
    uint4 m_44 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _51 = gl_FragCoord.w;
    float _53 = in.m_35.y;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = in.m_35.x;
    float _61 = gl_FragCoord.w;
    float _63 = _59 * _61;
    float _65 = in.m_35.z;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = 1.0 / _51;
    float _73 = _71 * _57;
    float _75 = _71 * _63;
    float _77 = _71 * _69;
    float _79 = _73 * _73;
    float _81 = fma(_75, _75, _79);
    float _83 = fma(_77, _77, _81);
    float _85 = rsqrt(_83);
    float _87 = _73 * _85;
    float _89 = _75 * _85;
    float _91 = _77 * _85;
    float _93 = _87 * (*spvDescriptorSet0.fp_c5)._m0[2].y;
    float _95 = _87 * (*spvDescriptorSet0.fp_c4)._m0[14].x;
    float _97 = fma(_89, (*spvDescriptorSet0.fp_c5)._m0[2].x, _93);
    float _99 = fma(_91, (*spvDescriptorSet0.fp_c5)._m0[2].z, _97);
    float _101 = fma(_95, 0.5, 0.5);
    float _103 = fma(_99, 0.5, 0.5);
    float2 _552 = float2(_103, _101);
    float4 _106 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_552, float2(0.0), isnan(_552))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_552, float2(0.0), isnan(_552))).xyzw;
    float _108 = _106.x;
    float _110 = _106.y;
    float _112 = _106.z;
    float _114 = _106.w;
    float _116 = in.m_37.x;
    float _118 = gl_FragCoord.w;
    float _120 = _116 * _118;
    float _122 = 0.0 + _95;
    float _124 = precise::clamp(_122, 0.0, 1.0);
    float _126 = in.m_39.x;
    float _128 = gl_FragCoord.w;
    float _130 = _126 * _128;
    float _132 = abs(_124);
    float _134 = log2(_132);
    float _136 = -(*spvDescriptorSet0.fp_c4)._m0[10].w;
    float _138 = _136 + (*spvDescriptorSet0.fp_c4)._m0[10].z;
    float _140 = _71 * _120;
    float _142 = _134 * (*spvDescriptorSet0.fp_c4)._m0[10].y;
    bool _146 = _95 >= _140;
    float _148 = exp2(_142);
    float _150 = 0.0;
    float _152 = _134;
    float _154 = _140;
    if (!_146)
    {
        _150 = 0.0;
    }
    float _156 = _150;
    float _158 = _156;
    if (!_146)
    {
        _152 = 0.0;
        _154 = 0.0;
    }
    float _160 = _152;
    float _162 = _154;
    bool _164 = !_146;
    float _166 = _162;
    float _168 = _160;
    if (!_164)
    {
        float _170 = in.m_41.x;
        float _172 = gl_FragCoord.w;
        float _174 = _170 * _172;
        float _176 = -(*spvDescriptorSet0.fp_c3)._m0[8].x;
        float _178 = (*spvDescriptorSet0.fp_c3)._m0[8].y + _176;
        float _180 = fma(_95, 350.80767822265625, 53.62115478515625);
        float _182 = 1.0 / _178;
        float _184 = log2(_180);
        float _186 = _71 * _174;
        float _188 = -(*spvDescriptorSet0.fp_c3)._m0[8].x;
        float _190 = _186 + _188;
        float _192 = _190 * _182;
        float _194 = _184 * 0.1155245304107666015625;
        float _196 = sqrt(_192);
        float2 _674 = float2(_194, _196);
        float3 _200 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_674, float2(0.0), isnan(_674))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_674, float2(0.0), isnan(_674))).xyz;
        float _202 = _200.x;
        float _204 = _200.y;
        float _206 = _200.z;
        _166 = _202;
        _168 = _204;
        _158 = _206;
    }
    float _208 = _166;
    float _210 = _168;
    float _212 = _158;
    float _214 = _108 * (*spvDescriptorSet0.fp_c4)._m0[13].x;
    float _216 = -(*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _218 = fma(_99, (*spvDescriptorSet0.fp_c4)._m0[12].z, _216);
    float _220 = precise::clamp(_218, 0.0, 1.0);
    float _222 = _114 + (*spvDescriptorSet0.fp_c5)._m0[6].w;
    float _224 = precise::clamp(_222, 0.0, 1.0);
    float _226 = fma(_148, _138, (*spvDescriptorSet0.fp_c4)._m0[10].w);
    float _228 = -(*spvDescriptorSet0.fp_c5)._m0[6].x;
    float _230 = _214 + _228;
    float _232 = _214 * _208;
    float _234 = _220 * (*spvDescriptorSet0.fp_c4)._m0[12].x;
    float _236 = _110 * (*spvDescriptorSet0.fp_c4)._m0[13].x;
    float _238 = fma(_224, _230, (*spvDescriptorSet0.fp_c5)._m0[6].x);
    float _240 = _71 * _130;
    float _242 = -(*spvDescriptorSet0.fp_c5)._m0[6].y;
    float _244 = _236 + _242;
    float _246 = fma(_232, _234, _238);
    float _248 = _112 * (*spvDescriptorSet0.fp_c4)._m0[13].x;
    float _250 = _236 * _210;
    float _252 = fma(_224, _244, (*spvDescriptorSet0.fp_c5)._m0[6].y);
    float _254 = _226 * _240;
    float _256 = -(*spvDescriptorSet0.fp_c5)._m0[6].z;
    float _258 = _248 + _256;
    float _260 = _248 * _212;
    float _262 = fma(_250, _234, _252);
    float _264 = -_246;
    float _266 = _264 + (*spvDescriptorSet0.fp_c4)._m0[11].x;
    float _268 = fma(_224, _258, (*spvDescriptorSet0.fp_c5)._m0[6].z);
    float _270 = -_262;
    float _272 = _270 + (*spvDescriptorSet0.fp_c4)._m0[11].y;
    float _274 = fma(_254, _266, _246);
    float _276 = fma(_260, _234, _268);
    float _278 = fma(_254, _272, _262);
    float _280 = _274 * (*spvDescriptorSet0.fp_c4)._m0[13].z;
    float _282 = -_276;
    float _284 = _282 + (*spvDescriptorSet0.fp_c4)._m0[11].z;
    float _286 = _278 * (*spvDescriptorSet0.fp_c4)._m0[13].z;
    float _288 = fma(_254, _284, _276);
    bool _290 = _280 >= 1.41299998760223388671875;
    bool _292 = isnan(_280);
    bool _294 = _290 || _292;
    bool _296 = isnan(1.41299998760223388671875);
    bool _298 = _294 || _296;
    bool _300 = _286 >= 1.41299998760223388671875;
    bool _302 = isnan(_286);
    bool _304 = _300 || _302;
    bool _306 = isnan(1.41299998760223388671875);
    bool _308 = _304 || _306;
    float _310 = _288 * (*spvDescriptorSet0.fp_c4)._m0[13].z;
    bool _312 = _310 >= 1.41299998760223388671875;
    bool _314 = isnan(_310);
    bool _316 = _312 || _314;
    bool _318 = isnan(1.41299998760223388671875);
    bool _320 = _316 || _318;
    int _323 = as_type<int>(_278);
    float _325 = _288;
    int _327 = as_type<int>(_236);
    float _329 = _276;
    float _331 = _234;
    float _333 = _246;
    float _335 = _310;
    float _337 = _286;
    float _339 = _280;
    float _341 = _250;
    if (!_298)
    {
        float _343 = _280 * 0.38317000865936279296875;
        _323 = as_type<int>(_343);
    }
    int _345 = _323;
    if (_298)
    {
        float _347 = _280 * (-1.44269502162933349609375);
        _325 = _347;
    }
    float _349 = _325;
    int _351 = as_type<int>(_349);
    if (!_308)
    {
        float _353 = _286 * 0.38317000865936279296875;
        _327 = as_type<int>(_353);
    }
    int _355 = _327;
    if (_308)
    {
        float _357 = _286 * (-1.44269502162933349609375);
        _329 = _357;
    }
    float _359 = _329;
    if (_298)
    {
        float _361 = exp2(_349);
        _331 = _361;
    }
    float _363 = _331;
    if (!_320)
    {
        float _365 = _310 * 0.38317000865936279296875;
        _333 = _365;
    }
    float _367 = _333;
    if (_320)
    {
        float _369 = _310 * (-1.44269502162933349609375);
        _335 = _369;
    }
    float _371 = _335;
    int _373 = _355;
    if (!_308)
    {
        float _375 = abs(as_type<float>(_355));
        float _377 = log2(_375);
        _373 = as_type<int>(_377);
    }
    int _379 = _373;
    int _381 = _345;
    if (!_298)
    {
        float _383 = abs(as_type<float>(_345));
        float _385 = log2(_383);
        _381 = as_type<int>(_385);
    }
    int _387 = _381;
    float _389 = _367;
    if (!_320)
    {
        float _391 = abs(_367);
        float _393 = log2(_391);
        _389 = _393;
    }
    float _395 = _389;
    int _397 = _379;
    if (!_308)
    {
        float _399 = as_type<float>(_379) * 0.4545454680919647216796875;
        _337 = _399;
    }
    float _401 = _337;
    int _403 = _387;
    if (!_298)
    {
        float _405 = as_type<float>(_387) * 0.4545454680919647216796875;
        _339 = _405;
    }
    float _407 = _339;
    float _409 = _359;
    if (_308)
    {
        float _411 = exp2(_359);
        _409 = _411;
    }
    float _413 = _409;
    if (!_320)
    {
        float _415 = _395 * 0.4545454680919647216796875;
        _341 = _415;
    }
    float _417 = _341;
    if (!_308)
    {
        float _419 = exp2(_401);
        _403 = as_type<int>(_419);
    }
    int _421 = _403;
    float _423 = _371;
    int _425 = _421;
    if (_320)
    {
        float _427 = exp2(_371);
        _423 = _427;
    }
    float _429 = _423;
    if (!_298)
    {
        float _431 = exp2(_407);
        _351 = as_type<int>(_431);
    }
    int _433 = _351;
    int _435 = _433;
    if (_308)
    {
        float _437 = -_413;
        float _439 = _437 + 1.0;
        _425 = as_type<int>(_439);
    }
    int _441 = _425;
    if (!_320)
    {
        float _443 = exp2(_417);
        _397 = as_type<int>(_443);
    }
    int _445 = _397;
    int _447 = _445;
    if (_298)
    {
        float _449 = -_363;
        float _451 = _449 + 1.0;
        _435 = as_type<int>(_451);
    }
    int _453 = _435;
    if (_320)
    {
        float _455 = -_429;
        float _457 = _455 + 1.0;
        _447 = as_type<int>(_457);
    }
    int _459 = _447;
    out.m_44.x = as_type<float>(_453);
    out.m_44.y = as_type<float>(_441);
    out.m_44.z = as_type<float>(_459);
    out.m_44.w = 1.0;
    return main0_out_u{as_type<uint4>(out.m_44)};
}

