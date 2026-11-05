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
    float4 m_58 [[color(0)]];
};

struct main0_in
{
    float4 m_51 [[user(locn0)]];
    float4 m_55 [[user(locn1)]];
    float4 m_64 [[user(locn2)]];
    float4 m_49 [[user(locn3)]];
    float4 m_41 [[user(locn4), flat]];
    float4 m_45 [[user(locn5)]];
    float4 m_53 [[user(locn6)]];
    float4 m_47 [[user(locn7)]];
    float4 m_60 [[user(locn8)]];
    float4 m_66 [[user(locn9)]];
    float4 m_62 [[user(locn10)]];
    float4 m_68 [[user(locn11)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _75 = in.m_41.x;
    float _77 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[22].x;
    float _79 = gl_FragCoord.w;
    float _81 = in.m_45.w;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = in.m_45.x;
    float _89 = gl_FragCoord.w;
    float _91 = _87 * _89;
    float _93 = in.m_47.x;
    float _95 = gl_FragCoord.w;
    float _97 = _93 * _95;
    float _99 = in.m_45.y;
    float _101 = gl_FragCoord.w;
    float _103 = _99 * _101;
    float _105 = fma((*spvDescriptorSet0.fp_c9)._m0[22].x, (*spvDescriptorSet0.fp_c9)._m0[22].w, -1.0);
    float _107 = in.m_47.y;
    float _109 = gl_FragCoord.w;
    float _111 = _107 * _109;
    float _113 = _75 * _105;
    float _115 = 1.0 / _79;
    float _117 = _113 * _77;
    float _119 = floor(_117);
    float _121 = _115 * _85;
    float _123 = _115 * _91;
    float _125 = _115 * _103;
    float _127 = 1.0 / _121;
    float _129 = -_119;
    float _131 = fma(_129, (*spvDescriptorSet0.fp_c9)._m0[22].x, _113);
    float _133 = _131 + 9.9999997473787516355514526367188e-05;
    float _135 = floor(_133);
    float _137 = _123 * _127;
    float _139 = _125 * _127;
    float _141 = _115 * _111;
    float _143 = _135 + 1.0;
    float _145 = rint(_135);
    float _147 = precise::max(_145, 0.0);
    uint _150 = uint(_147);
    uint _152 = clamp(_150, 0u, 65535u);
    float _154 = _143 * _77;
    float _156 = floor(_154);
    float _158 = -_156;
    float _160 = fma(_158, (*spvDescriptorSet0.fp_c9)._m0[22].x, _143);
    float _162 = _115 * _97;
    float _164 = rint(_160);
    float _166 = precise::max(_164, 0.0);
    uint _168 = uint(_166);
    uint _170 = clamp(_168, 0u, 65535u);
    float2 _766 = float2(_137, _139);
    float _172 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_766, float2(0.0), isnan(_766))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_766, float2(0.0), isnan(_766))).x;
    float3 _779 = float3(_162, _141, float(int(_152)));
    float3 _783 = select(_779, float3(0.0), isnan(_779));
    float4 _175 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _783.xy, uint(rint(_783.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _783.xy, uint(rint(_783.z))).xyzw;
    float _177 = _175.x;
    float _179 = _175.y;
    float _181 = _175.z;
    float _183 = _175.w;
    float3 _800 = float3(_162, _141, float(int(_170)));
    float3 _802 = select(_800, float3(0.0), isnan(_800));
    float4 _185 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _802.xy, uint(rint(_802.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _802.xy, uint(rint(_802.z))).xyzw;
    float _187 = _185.x;
    float _189 = _185.y;
    float _191 = _185.z;
    float _193 = _185.w;
    float _195 = in.m_45.z;
    float _197 = gl_FragCoord.w;
    float _199 = _195 * _197;
    float _201 = in.m_49.w;
    float _203 = gl_FragCoord.w;
    float _205 = _201 * _203;
    float _207 = in.m_51.w;
    float _209 = gl_FragCoord.w;
    float _211 = _207 * _209;
    float _213 = in.m_53.x;
    float _215 = gl_FragCoord.w;
    float _217 = _213 * _215;
    float _219 = -_135;
    float _221 = _133 + _219;
    float _223 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _225 = _115 * _199;
    float _227 = in.m_55.w;
    float _229 = gl_FragCoord.w;
    float _231 = _227 * _229;
    float _233 = _225 * _127;
    float _235 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _237 = fma(_233, (*spvDescriptorSet0.fp_c8)._m0[30].w, _235);
    float _239 = 1.0 / _237;
    float _241 = in.m_55.y;
    float _243 = gl_FragCoord.w;
    float _245 = _241 * _243;
    float _247 = in.m_55.z;
    float _249 = gl_FragCoord.w;
    float _251 = _247 * _249;
    float _253 = in.m_49.x;
    float _255 = gl_FragCoord.w;
    float _257 = _253 * _255;
    float _259 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _261 = fma(_172, (*spvDescriptorSet0.fp_c8)._m0[30].w, _259);
    float _263 = 1.0 / _261;
    float _265 = -_183;
    float _267 = _265 + _193;
    float _269 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _271 = _239 * _269;
    float _273 = _115 * _217;
    float _275 = fma(_221, _267, _183);
    float _277 = _115 * _205;
    float _279 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _281 = -_271;
    float _283 = fma(_263, _279, _281);
    float _285 = _275 * _277;
    float _287 = _115 * _211;
    float _289 = _283 * _223;
    float _291 = precise::clamp(_289, 0.0, 1.0);
    float _293 = _287 * _285;
    float _295 = _115 * _231;
    float _297 = _295 * _293;
    float _299 = 0.0 + _297;
    float _301 = precise::clamp(_299, 0.0, 1.0);
    float _303 = _301 * _291;
    float _305 = _303 * _273;
    bool _309 = _305 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _311 = isnan(_305);
    bool _313 = _309 || _311;
    bool _315 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _317 = _313 || _315;
    float _319 = in.m_51.y;
    float _321 = gl_FragCoord.w;
    float _323 = _319 * _321;
    float _325 = in.m_51.z;
    float _327 = gl_FragCoord.w;
    float _329 = _325 * _327;
    float _331 = in.m_51.x;
    float _333 = gl_FragCoord.w;
    float _335 = _331 * _333;
    float _337 = in.m_55.x;
    float _339 = gl_FragCoord.w;
    float _341 = _337 * _339;
    if (!_317)
    {
        discard_fragment();
    }
    float _343 = in.m_49.y;
    float _345 = gl_FragCoord.w;
    float _347 = _343 * _345;
    float _349 = in.m_49.z;
    float _351 = gl_FragCoord.w;
    float _353 = _349 * _351;
    float _355 = -_179;
    float _357 = _355 + _189;
    float _359 = -_177;
    float _361 = _359 + _187;
    float _363 = -_181;
    float _365 = _363 + _191;
    float _367 = fma(_221, _357, _179);
    float _369 = fma(_221, _361, _177);
    float _371 = fma(_221, _365, _181);
    float _373 = _115 * _323;
    float _375 = _115 * _329;
    float _377 = _115 * _335;
    float _379 = _115 * _245;
    float _381 = _115 * _251;
    float _383 = _115 * _341;
    float _385 = -_379;
    float _387 = _373 + _385;
    float _389 = -_381;
    float _391 = _375 + _389;
    float _393 = -_383;
    float _395 = _377 + _393;
    float _397 = fma(_367, _387, _379);
    float _399 = fma(_371, _391, _381);
    float _401 = fma(_369, _395, _383);
    float _403 = _115 * _257;
    float _405 = _115 * _347;
    float _407 = _115 * _353;
    float _409 = _401 * _403;
    float _411 = _397 * _405;
    float _413 = _399 * _407;
    if (!_317)
    {
        out.m_58.x = _409;
        out.m_58.y = _411;
        out.m_58.z = _413;
        out.m_58.w = _297;
        return out;
    }
    float _415 = in.m_60.y;
    float _417 = gl_FragCoord.w;
    float _419 = _415 * _417;
    float _421 = in.m_60.x;
    float _423 = gl_FragCoord.w;
    float _425 = _421 * _423;
    float _427 = in.m_60.z;
    float _429 = gl_FragCoord.w;
    float _431 = _427 * _429;
    float _433 = _115 * _419;
    float _435 = _115 * _425;
    float _437 = _115 * _431;
    float _439 = _433 * _433;
    float _441 = in.m_62.x;
    float _443 = gl_FragCoord.w;
    float _445 = _441 * _443;
    float _447 = fma(_435, _435, _439);
    float _449 = fma(_437, _437, _447);
    float _451 = rsqrt(_449);
    float _453 = _435 * _451;
    float _455 = _433 * _451;
    float _457 = _437 * _451;
    float _459 = _115 * _445;
    float _461 = abs(_453);
    float _463 = abs(_455);
    float _465 = precise::max(_461, _463);
    float _467 = precise::min(_459, 1.0);
    float _469 = abs(_457);
    float _471 = precise::max(_469, _465);
    float _473 = 1.0 / _471;
    float _475 = _453 * _473;
    float _477 = _455 * _473;
    float _479 = -_473;
    float _481 = _457 * _479;
    float3 _1224 = float3(_475, _477, _481);
    float3 _485 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1224, float3(0.0), isnan(_1224)), level(_467)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1224, float3(0.0), isnan(_1224)), level(_467)).xyz;
    float _487 = _485.x;
    float _489 = _485.y;
    float _491 = _485.z;
    float _493 = in.m_64.x;
    float _495 = gl_FragCoord.w;
    float _497 = _493 * _495;
    float _499 = in.m_64.z;
    float _501 = gl_FragCoord.w;
    float _503 = _499 * _501;
    float _505 = in.m_64.y;
    float _507 = gl_FragCoord.w;
    float _509 = _505 * _507;
    float _511 = in.m_66.z;
    float _513 = gl_FragCoord.w;
    float _515 = _511 * _513;
    float _517 = in.m_66.x;
    float _519 = gl_FragCoord.w;
    float _521 = _517 * _519;
    float _523 = in.m_66.y;
    float _525 = gl_FragCoord.w;
    float _527 = _523 * _525;
    float _529 = in.m_68.x;
    float _531 = gl_FragCoord.w;
    float _533 = _529 * _531;
    float _535 = in.m_68.y;
    float _537 = gl_FragCoord.w;
    float _539 = _535 * _537;
    float _541 = in.m_68.z;
    float _543 = gl_FragCoord.w;
    float _545 = _541 * _543;
    float _547 = in.m_68.w;
    float _549 = gl_FragCoord.w;
    float _551 = _547 * _549;
    bool _553 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _555 = _115 * _497;
    float _557 = _115 * _509;
    float _559 = _115 * _515;
    float _561 = _115 * _521;
    float _563 = _115 * _527;
    float _565 = _115 * _539;
    float _567 = _115 * _545;
    float _569 = fma(_487, 0.20999999344348907470703125, _555);
    float _571 = _115 * _503;
    float _573 = fma(_489, 0.20999999344348907470703125, _557);
    float _575 = _115 * _533;
    float _577 = _569 + _561;
    float _579 = fma(_491, 0.20999999344348907470703125, _571);
    float _581 = _571;
    if (_553)
    {
        float _583 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _585 = _271 + _583;
        _581 = _585;
    }
    float _587 = _581;
    float _589 = _573 + _563;
    float _591 = _115 * _551;
    float _593 = _579 + _559;
    float _595 = 0.0 + _305;
    float _597 = precise::clamp(_595, 0.0, 1.0);
    float _599 = _587;
    float _601 = _597;
    if (_553)
    {
        float _603 = _587 * 8.0;
        float _605 = precise::clamp(_603, 0.0, 1.0);
        _599 = _605;
    }
    float _607 = _599;
    float _609 = _409 * _577;
    float _611 = _411 * _589;
    float _613 = _413 * _593;
    if (_553)
    {
        float _615 = _597 * _607;
        _601 = _615;
    }
    float _617 = _601;
    float _619 = fma(_609, _591, _575);
    float _621 = fma(_611, _591, _565);
    float _623 = fma(_613, _591, _567);
    float _625 = 0.0 + _617;
    float _627 = precise::clamp(_625, 0.0, 1.0);
    out.m_58.x = _619;
    out.m_58.y = _621;
    out.m_58.z = _623;
    out.m_58.w = _627;
    return out;
}

