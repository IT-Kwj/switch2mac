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
    constant _16* fp_c9 [[id(0)]];
    constant _16* fp_c15 [[id(1)]];
    constant _16* fp_c8 [[id(2)]];
    texture2d_array<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    texturecube<float> fp_t_tcb_1E [[id(5)]];
    sampler fp_t_tcb_1ESmplr [[id(6)]];
    sampler fp_t_tcb_8Smplr_w [[id(7)]];
    sampler fp_t_tcb_1ESmplr_w [[id(8)]];
    constant dm_border_t* dm_border [[id(9)]];
};

struct main0_out
{
    float4 m_53 [[color(0)]];
};

struct main0_in
{
    float4 m_50 [[user(locn0)]];
    float4 m_59 [[user(locn1)]];
    float4 m_42 [[user(locn2), flat]];
    float4 m_44 [[user(locn3)]];
    float4 m_65 [[user(locn4)]];
    float4 m_48 [[user(locn5)]];
    float4 m_40 [[user(locn6), flat]];
    float4 m_38 [[user(locn7)]];
    float4 m_46 [[user(locn8)]];
    float4 m_55 [[user(locn9)]];
    float4 m_61 [[user(locn10)]];
    float4 m_57 [[user(locn11)]];
    float4 m_63 [[user(locn12)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _72 = gl_FragCoord.w;
    float _74 = in.m_38.x;
    float _76 = gl_FragCoord.w;
    float _78 = _74 * _76;
    float _80 = in.m_40.y;
    float _82 = in.m_42.y;
    float _84 = in.m_44.y;
    float _86 = gl_FragCoord.w;
    float _88 = _84 * _86;
    float _90 = in.m_44.x;
    float _92 = gl_FragCoord.w;
    float _94 = _90 * _92;
    float _96 = 1.0 / _72;
    float _98 = _96 * _78;
    float _100 = _96 * _94;
    float _102 = _98 * 78.233001708984375;
    float _104 = fma(_80, 12.98980045318603515625, _102);
    float _106 = _104 * 0.15915493667125701904296875;
    float _108 = _106 * 6.283185482025146484375;
    float _110 = sin(_108);
    float _112 = _110 * 43758.546875;
    float _114 = floor(_112);
    float _116 = -_114;
    float _118 = _112 + _116;
    float _120 = fma(_82, 0.0062500000931322574615478515625, _118);
    float _122 = floor(_120);
    float _124 = -_122;
    float _126 = _120 + _124;
    float _128 = _126 * 16.0;
    float _130 = _96 * _88;
    float _132 = rint(_128);
    float _134 = precise::max(_132, 0.0);
    uint _137 = uint(_134);
    uint _139 = clamp(_137, 0u, 65535u);
    float3 _692 = float3(_100, _130, float(int(_139)));
    float3 _696 = select(_692, float3(0.0), isnan(_692));
    float _141 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _696.xy, uint(rint(_696.z))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _696.xy, uint(rint(_696.z))).w;
    float _143 = in.m_46.y;
    float _145 = gl_FragCoord.w;
    float _147 = _143 * _145;
    float _149 = in.m_46.x;
    float _151 = gl_FragCoord.w;
    float _153 = _149 * _151;
    float _155 = in.m_48.x;
    float _157 = gl_FragCoord.w;
    float _159 = _155 * _157;
    float _161 = _96 * _147;
    float _163 = _96 * _153;
    float _165 = _161 + (-0.119999997317790985107421875);
    float _167 = in.m_50.w;
    float _169 = gl_FragCoord.w;
    float _171 = _167 * _169;
    float _173 = fma(_163, 0.699999988079071044921875, -0.3499999940395355224609375);
    float _175 = _165 * _165;
    float _177 = fma(_173, _173, _175);
    float _179 = sqrt(_177);
    float _181 = precise::max(_179, 0.3499999940395355224609375);
    float _183 = _96 * _171;
    float _185 = precise::min(_181, 0.60000002384185791015625);
    float _187 = fma(_185, -3.999999523162841796875, 2.3999998569488525390625);
    float _189 = _141 * _183;
    float _191 = _189 * _187;
    float _193 = _96 * _159;
    float _195 = 0.0 + _191;
    float _197 = precise::clamp(_195, 0.0, 1.0);
    float _199 = _197 * _193;
    bool _203 = _199 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _205 = isnan(_199);
    bool _207 = _203 || _205;
    bool _209 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _211 = _207 || _209;
    float _213 = -(*spvDescriptorSet0.fp_c9)._m0[107].w;
    float _215 = (*spvDescriptorSet0.fp_c9)._m0[108].w + _213;
    if (!_211)
    {
        discard_fragment();
    }
    float _217 = -(*spvDescriptorSet0.fp_c9)._m0[108].w;
    float _219 = _217 + (*spvDescriptorSet0.fp_c9)._m0[109].w;
    float _221 = 1.0 / _215;
    float _223 = 0.0 + _141;
    float _225 = precise::clamp(_223, 0.0, 1.0);
    float _227 = -(*spvDescriptorSet0.fp_c9)._m0[107].z;
    float _229 = (*spvDescriptorSet0.fp_c9)._m0[108].z + _227;
    float _231 = -(*spvDescriptorSet0.fp_c9)._m0[107].w;
    float _233 = _225 + _231;
    float _235 = -(*spvDescriptorSet0.fp_c9)._m0[108].w;
    float _237 = _225 + _235;
    bool _239 = _225 >= (*spvDescriptorSet0.fp_c9)._m0[108].w;
    bool _241 = isnan(_225);
    bool _243 = _239 || _241;
    bool _245 = isnan((*spvDescriptorSet0.fp_c9)._m0[108].w);
    bool _247 = _243 || _245;
    float _249 = float(_247);
    float _251 = 1.0 / _219;
    float _253 = -(*spvDescriptorSet0.fp_c9)._m0[107].y;
    float _255 = (*spvDescriptorSet0.fp_c9)._m0[108].y + _253;
    float _257 = _233 * _221;
    float _259 = -(*spvDescriptorSet0.fp_c9)._m0[107].x;
    float _261 = (*spvDescriptorSet0.fp_c9)._m0[108].x + _259;
    float _263 = fma(_255, _257, (*spvDescriptorSet0.fp_c9)._m0[107].y);
    float _265 = fma(_261, _257, (*spvDescriptorSet0.fp_c9)._m0[107].x);
    float _267 = fma(_229, _257, (*spvDescriptorSet0.fp_c9)._m0[107].z);
    float _269 = -(*spvDescriptorSet0.fp_c9)._m0[108].z;
    float _271 = _269 + (*spvDescriptorSet0.fp_c9)._m0[109].z;
    float _273 = _237 * _251;
    float _275 = -(*spvDescriptorSet0.fp_c9)._m0[108].x;
    float _277 = _275 + (*spvDescriptorSet0.fp_c9)._m0[109].x;
    bool _279 = _225 >= (*spvDescriptorSet0.fp_c9)._m0[107].w;
    bool _281 = isnan(_225);
    bool _283 = _279 || _281;
    bool _285 = isnan((*spvDescriptorSet0.fp_c9)._m0[107].w);
    bool _287 = _283 || _285;
    float _289 = float(_287);
    float _291 = -_249;
    float _293 = _291 + 1.0;
    float _295 = -(*spvDescriptorSet0.fp_c9)._m0[108].y;
    float _297 = _295 + (*spvDescriptorSet0.fp_c9)._m0[109].y;
    bool _299 = _225 >= (*spvDescriptorSet0.fp_c9)._m0[109].w;
    bool _301 = isnan(_225);
    bool _303 = _299 || _301;
    bool _305 = isnan((*spvDescriptorSet0.fp_c9)._m0[109].w);
    bool _307 = _303 || _305;
    float _309 = float(_307);
    float _311 = fma(_277, _273, (*spvDescriptorSet0.fp_c9)._m0[108].x);
    float _313 = _289 * _293;
    float _315 = fma(_297, _273, (*spvDescriptorSet0.fp_c9)._m0[108].y);
    float _317 = fma(_271, _273, (*spvDescriptorSet0.fp_c9)._m0[108].z);
    float _319 = -_289;
    float _321 = _319 + 1.0;
    float _323 = _265 * _313;
    float _325 = _263 * _313;
    float _327 = -_309;
    float _329 = _327 + 1.0;
    float _331 = _267 * _313;
    float _333 = fma(_321, (*spvDescriptorSet0.fp_c9)._m0[107].x, _323);
    float _335 = fma(_321, (*spvDescriptorSet0.fp_c9)._m0[107].y, _325);
    float _337 = _249 * _329;
    float _339 = fma(_321, (*spvDescriptorSet0.fp_c9)._m0[107].z, _331);
    float _341 = fma(_311, _337, _333);
    float _343 = fma(_315, _337, _335);
    float _345 = fma(_317, _337, _339);
    float _347 = fma(_309, (*spvDescriptorSet0.fp_c9)._m0[109].x, _341);
    float _349 = fma(_309, (*spvDescriptorSet0.fp_c9)._m0[109].y, _343);
    float _351 = fma(_309, (*spvDescriptorSet0.fp_c9)._m0[109].z, _345);
    if (!_211)
    {
        out.m_53.x = _347;
        out.m_53.y = _349;
        out.m_53.z = _351;
        out.m_53.w = _191;
        return out;
    }
    float _353 = in.m_55.y;
    float _355 = gl_FragCoord.w;
    float _357 = _353 * _355;
    float _359 = in.m_55.x;
    float _361 = gl_FragCoord.w;
    float _363 = _359 * _361;
    float _365 = in.m_55.z;
    float _367 = gl_FragCoord.w;
    float _369 = _365 * _367;
    float _371 = _96 * _357;
    float _373 = _96 * _363;
    float _375 = _96 * _369;
    float _377 = _371 * _371;
    float _379 = in.m_57.x;
    float _381 = gl_FragCoord.w;
    float _383 = _379 * _381;
    float _385 = fma(_373, _373, _377);
    float _387 = fma(_375, _375, _385);
    float _389 = rsqrt(_387);
    float _391 = _373 * _389;
    float _393 = _371 * _389;
    float _395 = _375 * _389;
    float _397 = _96 * _383;
    float _399 = abs(_391);
    float _401 = abs(_393);
    float _403 = precise::max(_399, _401);
    float _405 = abs(_395);
    float _407 = precise::max(_405, _403);
    float _409 = 1.0 / _407;
    float _411 = _393 * _409;
    float _413 = -_409;
    float _415 = _395 * _413;
    float _417 = precise::min(_397, 1.0);
    float _419 = _391 * _409;
    float3 _1141 = float3(_419, _411, _415);
    float3 _423 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1141, float3(0.0), isnan(_1141)), level(_417)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1141, float3(0.0), isnan(_1141)), level(_417)).xyz;
    float _425 = _423.x;
    float _427 = _423.y;
    float _429 = _423.z;
    float _431 = in.m_59.y;
    float _433 = gl_FragCoord.w;
    float _435 = _431 * _433;
    float _437 = in.m_59.z;
    float _439 = gl_FragCoord.w;
    float _441 = _437 * _439;
    float _443 = in.m_59.x;
    float _445 = gl_FragCoord.w;
    float _447 = _443 * _445;
    float _449 = in.m_61.y;
    float _451 = gl_FragCoord.w;
    float _453 = _449 * _451;
    float _455 = in.m_61.z;
    float _457 = gl_FragCoord.w;
    float _459 = _455 * _457;
    float _461 = in.m_61.x;
    float _463 = gl_FragCoord.w;
    float _465 = _461 * _463;
    float _467 = in.m_63.x;
    float _469 = gl_FragCoord.w;
    float _471 = _467 * _469;
    float _473 = in.m_63.w;
    float _475 = gl_FragCoord.w;
    float _477 = _473 * _475;
    float _479 = in.m_63.y;
    float _481 = gl_FragCoord.w;
    float _483 = _479 * _481;
    float _485 = in.m_63.z;
    float _487 = gl_FragCoord.w;
    float _489 = _485 * _487;
    float _491 = _96 * _435;
    float _493 = _96 * _441;
    float _495 = _96 * _447;
    bool _497 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _499 = fma(_427, 0.20999999344348907470703125, _491);
    float _501 = fma(_429, 0.20999999344348907470703125, _493);
    float _503 = fma(_425, 0.20999999344348907470703125, _495);
    float _505 = _96 * _453;
    float _507 = _96 * _459;
    float _509 = _96 * _465;
    float _511 = _499 + _505;
    float _513 = _501 + _507;
    float _515 = _503 + _509;
    float _517 = _96 * _477;
    float _519 = _349 * _511;
    float _521 = _351 * _513;
    float _523 = _347 * _515;
    float _525 = 0.0 + _199;
    float _527 = precise::clamp(_525, 0.0, 1.0);
    float _529 = _96 * _471;
    float _531 = _96 * _483;
    float _533 = _96 * _489;
    float _535 = fma(_523, _517, _529);
    float _537 = fma(_519, _517, _531);
    float _539 = fma(_521, _517, _533);
    float _541 = _529;
    if (!_497)
    {
        _541 = _527;
    }
    float _543 = _541;
    bool _545 = !_497;
    float _547 = _543;
    if (!_545)
    {
        float _549 = in.m_65.w;
        float _551 = gl_FragCoord.w;
        float _553 = _549 * _551;
        float _555 = in.m_65.z;
        float _557 = gl_FragCoord.w;
        float _559 = _555 * _557;
        float _561 = _96 * _553;
        float _563 = _96 * _559;
        float _565 = 1.0 / _561;
        float _567 = _563 * _565;
        float _569 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _571 = fma(_567, (*spvDescriptorSet0.fp_c8)._m0[30].w, _569);
        float _573 = 1.0 / _571;
        float _575 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _577 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _579 = fma(_573, _575, _577);
        float _581 = _579 * 8.0;
        float _583 = precise::clamp(_581, 0.0, 1.0);
        float _585 = _527 * _583;
        _547 = _585;
    }
    float _587 = _547;
    float _589 = 0.0 + _587;
    float _591 = precise::clamp(_589, 0.0, 1.0);
    out.m_53.x = _535;
    out.m_53.y = _537;
    out.m_53.z = _539;
    out.m_53.w = _591;
    return out;
}

