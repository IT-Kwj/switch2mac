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
    constant _16* fp_c8 [[id(1)]];
    constant _16* fp_c15 [[id(2)]];
    texture2d<float> fp_t_tcb_10 [[id(3)]];
    sampler fp_t_tcb_10Smplr [[id(4)]];
    texture2d_array<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    texturecube<float> fp_t_tcb_1E [[id(7)]];
    sampler fp_t_tcb_1ESmplr [[id(8)]];
    sampler fp_t_tcb_10Smplr_w [[id(9)]];
    sampler fp_t_tcb_8Smplr_w [[id(10)]];
    sampler fp_t_tcb_1ESmplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
    float4 m_60 [[color(0)]];
};

struct main0_in
{
    float4 m_53 [[user(locn0)]];
    float4 m_57 [[user(locn1)]];
    float4 m_66 [[user(locn2)]];
    float4 m_51 [[user(locn3)]];
    float4 m_49 [[user(locn4), flat]];
    float4 m_45 [[user(locn5)]];
    float4 m_55 [[user(locn6)]];
    float4 m_47 [[user(locn7)]];
    float4 m_43 [[user(locn8), flat]];
    float4 m_62 [[user(locn9)]];
    float4 m_68 [[user(locn10)]];
    float4 m_64 [[user(locn11)]];
    float4 m_70 [[user(locn12)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _77 = gl_FragCoord.w;
    float _79 = in.m_43.x;
    float _81 = in.m_45.w;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[22].x;
    float _89 = in.m_45.x;
    float _91 = gl_FragCoord.w;
    float _93 = _89 * _91;
    float _95 = in.m_45.y;
    float _97 = gl_FragCoord.w;
    float _99 = _95 * _97;
    float _101 = in.m_47.x;
    float _103 = gl_FragCoord.w;
    float _105 = _101 * _103;
    float _107 = in.m_47.y;
    float _109 = gl_FragCoord.w;
    float _111 = _107 * _109;
    float _113 = 1.0 / _77;
    float _115 = _79 + 1.0;
    float _117 = _115 * _87;
    float _119 = rint(_79);
    float _121 = precise::max(_119, 0.0);
    uint _124 = uint(_121);
    uint _126 = clamp(_124, 0u, 65535u);
    float _128 = floor(_117);
    float _130 = _113 * _85;
    float _132 = _113 * _105;
    float _134 = 1.0 / _130;
    float _136 = -_128;
    float _138 = fma(_136, (*spvDescriptorSet0.fp_c9)._m0[22].x, _115);
    float _140 = _113 * _93;
    float _142 = _113 * _99;
    float _144 = rint(_138);
    float _146 = precise::max(_144, 0.0);
    uint _148 = uint(_146);
    uint _150 = clamp(_148, 0u, 65535u);
    float _152 = _140 * _134;
    float _154 = _142 * _134;
    float _156 = _113 * _111;
    float2 _740 = float2(_152, _154);
    float _158 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_740, float2(0.0), isnan(_740))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_740, float2(0.0), isnan(_740))).x;
    float3 _753 = float3(_132, _156, float(int(_126)));
    float3 _757 = select(_753, float3(0.0), isnan(_753));
    float4 _161 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _757.xy, uint(rint(_757.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _757.xy, uint(rint(_757.z))).xyzw;
    float _163 = _161.x;
    float _165 = _161.y;
    float _167 = _161.z;
    float _169 = _161.w;
    float3 _774 = float3(_132, _156, float(int(_150)));
    float3 _776 = select(_774, float3(0.0), isnan(_774));
    float4 _171 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _776.xy, uint(rint(_776.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _776.xy, uint(rint(_776.z))).xyzw;
    float _173 = _171.x;
    float _175 = _171.y;
    float _177 = _171.z;
    float _179 = _171.w;
    float _181 = in.m_49.y;
    float _183 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[22].y;
    float _185 = in.m_45.z;
    float _187 = gl_FragCoord.w;
    float _189 = _185 * _187;
    float _191 = in.m_51.w;
    float _193 = gl_FragCoord.w;
    float _195 = _191 * _193;
    float _197 = in.m_53.w;
    float _199 = gl_FragCoord.w;
    float _201 = _197 * _199;
    float _203 = in.m_55.x;
    float _205 = gl_FragCoord.w;
    float _207 = _203 * _205;
    float _209 = _181 * _183;
    float _211 = _209 * _183;
    float _213 = floor(_211);
    float _215 = _113 * _189;
    float _217 = _215 * _134;
    float _219 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _221 = fma(_217, (*spvDescriptorSet0.fp_c8)._m0[30].w, _219);
    float _223 = 1.0 / _221;
    float _225 = -_213;
    float _227 = fma(_225, (*spvDescriptorSet0.fp_c9)._m0[22].y, _209);
    float _229 = _227 + 9.9999997473787516355514526367188e-05;
    float _231 = floor(_229);
    float _233 = -_231;
    float _235 = _229 + _233;
    float _237 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _239 = in.m_53.z;
    float _241 = gl_FragCoord.w;
    float _243 = _239 * _241;
    float _245 = in.m_57.x;
    float _247 = gl_FragCoord.w;
    float _249 = _245 * _247;
    float _251 = in.m_57.z;
    float _253 = gl_FragCoord.w;
    float _255 = _251 * _253;
    float _257 = in.m_57.y;
    float _259 = gl_FragCoord.w;
    float _261 = _257 * _259;
    float _263 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _265 = fma(_158, (*spvDescriptorSet0.fp_c8)._m0[30].w, _263);
    float _267 = 1.0 / _265;
    float _269 = -_169;
    float _271 = _269 + _179;
    float _273 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _275 = _223 * _273;
    float _277 = fma(_235, _271, _169);
    float _279 = _113 * _195;
    float _281 = _277 * _279;
    float _283 = _113 * _201;
    float _285 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _287 = -_275;
    float _289 = fma(_267, _285, _287);
    float _291 = _283 * _281;
    float _293 = _113 * _207;
    float _295 = _289 * _237;
    float _297 = precise::clamp(_295, 0.0, 1.0);
    float _299 = 0.0 + _291;
    float _301 = precise::clamp(_299, 0.0, 1.0);
    float _303 = _301 * _297;
    float _305 = _303 * _293;
    bool _309 = _305 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _311 = isnan(_305);
    bool _313 = _309 || _311;
    bool _315 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _317 = _313 || _315;
    float _319 = in.m_53.x;
    float _321 = gl_FragCoord.w;
    float _323 = _319 * _321;
    float _325 = in.m_53.y;
    float _327 = gl_FragCoord.w;
    float _329 = _325 * _327;
    float _331 = in.m_51.x;
    float _333 = gl_FragCoord.w;
    float _335 = _331 * _333;
    float _337 = _113;
    if (!_317)
    {
        discard_fragment();
    }
    float _339 = in.m_51.y;
    float _341 = gl_FragCoord.w;
    float _343 = _339 * _341;
    float _345 = in.m_51.z;
    float _347 = gl_FragCoord.w;
    float _349 = _345 * _347;
    float _351 = -_163;
    float _353 = _351 + _173;
    float _355 = -_165;
    float _357 = _355 + _175;
    float _359 = -_167;
    float _361 = _359 + _177;
    float _363 = _113 * _243;
    float _365 = fma(_235, _353, _163);
    float _367 = fma(_235, _357, _165);
    float _369 = _113 * _255;
    float _371 = fma(_235, _361, _167);
    float _373 = _365 * _365;
    float _375 = _367 * _367;
    float _377 = -_369;
    float _379 = _363 + _377;
    float _381 = _371 * _371;
    float _383 = _113 * _323;
    float _385 = _113 * _249;
    float _387 = _113 * _329;
    float _389 = _113 * _261;
    float _391 = fma(_381, _379, _369);
    float _393 = -_385;
    float _395 = _383 + _393;
    float _397 = _113 * _335;
    float _399 = -_389;
    float _401 = _387 + _399;
    float _403 = fma(_373, _395, _385);
    float _405 = fma(_375, _401, _389);
    float _407 = _403 * _397;
    float _409 = _113 * _343;
    float _411 = _113 * _349;
    float _413 = _405 * _409;
    float _415 = _391 * _411;
    if (!_317)
    {
        out.m_60.x = _407;
        out.m_60.y = _413;
        out.m_60.z = _415;
        out.m_60.w = _291;
        return out;
    }
    float _417 = in.m_62.y;
    float _419 = gl_FragCoord.w;
    float _421 = _417 * _419;
    float _423 = in.m_62.x;
    float _425 = gl_FragCoord.w;
    float _427 = _423 * _425;
    float _429 = in.m_62.z;
    float _431 = gl_FragCoord.w;
    float _433 = _429 * _431;
    float _435 = _113 * _421;
    float _437 = _113 * _427;
    float _439 = _113 * _433;
    float _441 = _435 * _435;
    float _443 = in.m_64.x;
    float _445 = gl_FragCoord.w;
    float _447 = _443 * _445;
    float _449 = fma(_437, _437, _441);
    float _451 = fma(_439, _439, _449);
    float _453 = rsqrt(_451);
    float _455 = _437 * _453;
    float _457 = _435 * _453;
    float _459 = _439 * _453;
    float _461 = _113 * _447;
    float _463 = abs(_455);
    float _465 = abs(_457);
    float _467 = precise::max(_463, _465);
    float _469 = precise::min(_461, 1.0);
    float _471 = abs(_459);
    float _473 = precise::max(_471, _467);
    float _475 = 1.0 / _473;
    float _477 = _455 * _475;
    float _479 = _457 * _475;
    float _481 = -_475;
    float _483 = _459 * _481;
    float3 _1220 = float3(_477, _479, _483);
    float3 _487 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1220, float3(0.0), isnan(_1220)), level(_469)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1220, float3(0.0), isnan(_1220)), level(_469)).xyz;
    float _489 = _487.x;
    float _491 = _487.y;
    float _493 = _487.z;
    float _495 = in.m_66.x;
    float _497 = gl_FragCoord.w;
    float _499 = _495 * _497;
    float _501 = in.m_66.z;
    float _503 = gl_FragCoord.w;
    float _505 = _501 * _503;
    float _507 = in.m_66.y;
    float _509 = gl_FragCoord.w;
    float _511 = _507 * _509;
    float _513 = in.m_68.x;
    float _515 = gl_FragCoord.w;
    float _517 = _513 * _515;
    float _519 = in.m_68.y;
    float _521 = gl_FragCoord.w;
    float _523 = _519 * _521;
    float _525 = in.m_68.z;
    float _527 = gl_FragCoord.w;
    float _529 = _525 * _527;
    float _531 = in.m_70.x;
    float _533 = gl_FragCoord.w;
    float _535 = _531 * _533;
    float _537 = in.m_70.y;
    float _539 = gl_FragCoord.w;
    float _541 = _537 * _539;
    float _543 = in.m_70.z;
    float _545 = gl_FragCoord.w;
    float _547 = _543 * _545;
    float _549 = in.m_70.w;
    float _551 = gl_FragCoord.w;
    float _553 = _549 * _551;
    bool _555 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _557 = _113 * _499;
    float _559 = _113 * _511;
    float _561 = _113 * _517;
    float _563 = _113 * _523;
    float _565 = _113 * _529;
    float _567 = _113 * _541;
    float _569 = _113 * _547;
    float _571 = _113 * _553;
    float _573 = fma(_489, 0.20999999344348907470703125, _557);
    float _575 = _113 * _505;
    float _577 = _113 * _535;
    float _579 = fma(_491, 0.20999999344348907470703125, _559);
    if (_555)
    {
        float _581 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _583 = _275 + _581;
        _337 = _583;
    }
    float _585 = _337;
    float _587 = fma(_493, 0.20999999344348907470703125, _575);
    float _589 = _573 + _561;
    float _591 = _579 + _563;
    float _593 = _585;
    if (_555)
    {
        float _595 = _585 * 8.0;
        float _597 = precise::clamp(_595, 0.0, 1.0);
        _593 = _597;
    }
    float _599 = _593;
    float _601 = _587 + _565;
    float _603 = 0.0 + _305;
    float _605 = precise::clamp(_603, 0.0, 1.0);
    float _607 = _407 * _589;
    float _609 = _413 * _591;
    float _611 = _415 * _601;
    float _613 = _605;
    if (_555)
    {
        float _615 = _605 * _599;
        _613 = _615;
    }
    float _617 = _613;
    float _619 = fma(_607, _571, _577);
    float _621 = fma(_609, _571, _567);
    float _623 = fma(_611, _571, _569);
    float _625 = 0.0 + _617;
    float _627 = precise::clamp(_625, 0.0, 1.0);
    out.m_60.x = _619;
    out.m_60.y = _621;
    out.m_60.z = _623;
    out.m_60.w = _627;
    return out;
}

