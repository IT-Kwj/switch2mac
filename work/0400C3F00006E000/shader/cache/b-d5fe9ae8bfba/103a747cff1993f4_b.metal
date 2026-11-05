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
    constant _16* fp_c8 [[id(0)]];
    constant _16* fp_c9 [[id(1)]];
    constant _16* fp_c10 [[id(2)]];
    constant _16* fp_c15 [[id(3)]];
    texture2d<float> fp_t_tcb_10 [[id(4)]];
    sampler fp_t_tcb_10Smplr [[id(5)]];
    texture2d<float> fp_t_tcb_A [[id(6)]];
    sampler fp_t_tcb_ASmplr [[id(7)]];
    texture2d_array<float> fp_t_tcb_8 [[id(8)]];
    sampler fp_t_tcb_8Smplr [[id(9)]];
    sampler fp_t_tcb_10Smplr_w [[id(10)]];
    sampler fp_t_tcb_ASmplr_w [[id(11)]];
    sampler fp_t_tcb_8Smplr_w [[id(12)]];
    constant dm_border_t* dm_border [[id(13)]];
};

struct main0_out
{
    float4 m_61 [[color(0)]];
};

struct main0_in
{
    float4 m_54 [[user(locn0)]];
    float4 m_52 [[user(locn1)]];
    float4 m_56 [[user(locn2)]];
    float4 m_46 [[user(locn3)]];
    float4 m_50 [[user(locn4)]];
    float4 m_48 [[user(locn5), flat]];
    float4 m_42 [[user(locn6)]];
    float4 m_44 [[user(locn7), flat]];
    float4 m_58 [[user(locn9)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _68 = gl_FragCoord.w;
    float _70 = in.m_42.w;
    float _72 = gl_FragCoord.w;
    float _74 = _70 * _72;
    float _76 = in.m_42.x;
    float _78 = gl_FragCoord.w;
    float _80 = _76 * _78;
    float _82 = in.m_42.y;
    float _84 = gl_FragCoord.w;
    float _86 = _82 * _84;
    float _88 = in.m_44.x;
    float _90 = in.m_46.z;
    float _92 = gl_FragCoord.w;
    float _94 = _90 * _92;
    float _96 = in.m_46.w;
    float _98 = gl_FragCoord.w;
    float _100 = _96 * _98;
    float _102 = in.m_46.y;
    float _104 = gl_FragCoord.w;
    float _106 = _102 * _104;
    float _108 = in.m_46.x;
    float _110 = gl_FragCoord.w;
    float _112 = _108 * _110;
    float _114 = 1.0 / _68;
    float _116 = rint(_88);
    float _118 = precise::max(_116, 0.0);
    uint _121 = uint(_118);
    uint _123 = clamp(_121, 0u, 65535u);
    float _125 = _114 * _74;
    float _127 = _114 * _80;
    float _129 = _114 * _86;
    float _131 = _114 * _94;
    float _133 = _114 * _106;
    float _135 = _114 * _112;
    float _137 = 1.0 / _125;
    float _139 = _127 * _137;
    float _141 = _129 * _137;
    float _143 = _114 * _100;
    float2 _715 = float2(_139, _141);
    float _145 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_715, float2(0.0), isnan(_715))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_715, float2(0.0), isnan(_715))).x;
    float2 _725 = float2(_131, _143);
    float _147 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_725, float2(0.0), isnan(_725))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_725, float2(0.0), isnan(_725))).w;
    float3 _737 = float3(_135, _133, float(int(_123)));
    float3 _741 = select(_737, float3(0.0), isnan(_737));
    float2 _151 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _741.xy, uint(rint(_741.z))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _741.xy, uint(rint(_741.z))).xw;
    float _153 = _151.x;
    float _155 = _151.y;
    float _157 = in.m_48.y;
    float _159 = in.m_48.x;
    float _161 = in.m_48.z;
    float _163 = in.m_42.z;
    float _165 = gl_FragCoord.w;
    float _167 = _163 * _165;
    float _169 = in.m_50.w;
    float _171 = gl_FragCoord.w;
    float _173 = _169 * _171;
    float _175 = in.m_52.w;
    float _177 = gl_FragCoord.w;
    float _179 = _175 * _177;
    float _181 = in.m_54.w;
    float _183 = gl_FragCoord.w;
    float _185 = _181 * _183;
    float _187 = -_157;
    float _189 = _187 + (*spvDescriptorSet0.fp_c8)._m0[29].y;
    float _191 = -_159;
    float _193 = _191 + (*spvDescriptorSet0.fp_c8)._m0[29].x;
    float _195 = -_161;
    float _197 = _195 + (*spvDescriptorSet0.fp_c8)._m0[29].z;
    float _199 = _189 * _189;
    float _201 = fma(_193, _193, _199);
    float _203 = 1.0 / (*spvDescriptorSet0.fp_c8)._m0[31].x;
    float _205 = fma(_197, _197, _201);
    float _207 = _114 * _167;
    float _209 = sqrt(_205);
    float _211 = _207 * _137;
    float _213 = _114 * _173;
    float _215 = _114 * _179;
    float _217 = in.m_56.x;
    float _219 = gl_FragCoord.w;
    float _221 = _217 * _219;
    float _223 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _225 = fma(_211, (*spvDescriptorSet0.fp_c8)._m0[30].w, _223);
    float _227 = _213 * _215;
    float _229 = _114 * _185;
    float _231 = _203 * (*spvDescriptorSet0.fp_c8)._m0[31].y;
    float _233 = 1.0 / _225;
    float _235 = fma(_229, 2.0, -1.0);
    float _237 = _209 * _231;
    float _239 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _241 = precise::max(_237, 30.0);
    float _243 = precise::min(_241, 60.0);
    float _245 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _247 = fma(_145, (*spvDescriptorSet0.fp_c8)._m0[30].w, _245);
    float _249 = _147 + _235;
    float _251 = precise::clamp(_249, 0.0, 1.0);
    float _253 = 1.0 / _247;
    float _255 = _251 * _251;
    float _257 = _155 * _255;
    float _259 = fma(_243, 0.0333333350718021392822265625, -1.0);
    float _261 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _263 = _233 * _261;
    float _265 = _257 * _227;
    float _267 = _265 * _259;
    float _269 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _271 = -_263;
    float _273 = fma(_253, _269, _271);
    float _275 = 0.0 + _267;
    float _277 = precise::clamp(_275, 0.0, 1.0);
    float _279 = _273 * _239;
    float _281 = precise::clamp(_279, 0.0, 1.0);
    float _283 = _114 * _221;
    float _285 = _277 * _281;
    float _287 = _285 * _283;
    bool _291 = _287 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _293 = isnan(_287);
    bool _295 = _291 || _293;
    bool _297 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _299 = _295 || _297;
    float _301 = in.m_58.x;
    float _303 = gl_FragCoord.w;
    float _305 = _301 * _303;
    float _307 = in.m_58.y;
    float _309 = gl_FragCoord.w;
    float _311 = _307 * _309;
    float _313 = _287;
    if (!_299)
    {
        discard_fragment();
    }
    float _315 = in.m_58.z;
    float _317 = gl_FragCoord.w;
    float _319 = _315 * _317;
    float _321 = (*spvDescriptorSet0.fp_c10)._m0[8].w + 292.277008056640625;
    float _323 = _114 * _305;
    float _325 = -_323;
    float _327 = _321 + _325;
    float _329 = _114 * _311;
    float _331 = (*spvDescriptorSet0.fp_c10)._m0[9].w + 74.10199737548828125;
    float _333 = -_329;
    float _335 = _331 + _333;
    float _337 = _114 * _319;
    float _339 = _335 * _335;
    float _341 = fma(_327, _327, _339);
    float _343 = -(*spvDescriptorSet0.fp_c9)._m0[107].w;
    float _345 = (*spvDescriptorSet0.fp_c9)._m0[108].w + _343;
    float _347 = (*spvDescriptorSet0.fp_c10)._m0[10].w + (-86.069000244140625);
    float _349 = -(*spvDescriptorSet0.fp_c9)._m0[108].w;
    float _351 = _349 + (*spvDescriptorSet0.fp_c9)._m0[109].w;
    float _353 = 1.0 / _345;
    float _355 = -_337;
    float _357 = _347 + _355;
    float _359 = fma(_357, _357, _341);
    float _361 = fma(_153, 0.699999988079071044921875, 0.300000011920928955078125);
    float _363 = 1.0 / _351;
    float _365 = -(*spvDescriptorSet0.fp_c9)._m0[107].y;
    float _367 = (*spvDescriptorSet0.fp_c9)._m0[108].y + _365;
    float _369 = -(*spvDescriptorSet0.fp_c9)._m0[107].x;
    float _371 = (*spvDescriptorSet0.fp_c9)._m0[108].x + _369;
    float _373 = sqrt(_359);
    float _375 = fma(_373, 0.0018918919377028942108154296875, -0.15135134756565093994140625);
    float _377 = precise::max(0.0, _375);
    float _379 = -(*spvDescriptorSet0.fp_c9)._m0[109].w;
    float _381 = (*spvDescriptorSet0.fp_c9)._m0[110].w + _379;
    float _383 = precise::min(_377, 0.699999988079071044921875);
    float _385 = 1.0 / _381;
    float _387 = -_383;
    float _389 = _387 + 1.0;
    float _391 = _389 * _389;
    float _393 = -(*spvDescriptorSet0.fp_c9)._m0[107].z;
    float _395 = (*spvDescriptorSet0.fp_c9)._m0[108].z + _393;
    float _397 = _391 * _361;
    float _399 = precise::clamp(_397, 0.0, 1.0);
    float _401 = -(*spvDescriptorSet0.fp_c9)._m0[107].w;
    float _403 = _399 + _401;
    bool _405 = _399 >= (*spvDescriptorSet0.fp_c9)._m0[109].w;
    bool _407 = isnan(_399);
    bool _409 = _405 || _407;
    bool _411 = isnan((*spvDescriptorSet0.fp_c9)._m0[109].w);
    bool _413 = _409 || _411;
    float _415 = float(_413);
    float _417 = _403 * _353;
    float _419 = -(*spvDescriptorSet0.fp_c9)._m0[108].w;
    float _421 = _399 + _419;
    float _423 = -_415;
    float _425 = _423 + 1.0;
    float _427 = fma(_367, _417, (*spvDescriptorSet0.fp_c9)._m0[107].y);
    float _429 = _421 * _363;
    float _431 = -(*spvDescriptorSet0.fp_c9)._m0[109].w;
    float _433 = _399 + _431;
    float _435 = fma(_371, _417, (*spvDescriptorSet0.fp_c9)._m0[107].x);
    float _437 = -(*spvDescriptorSet0.fp_c9)._m0[108].x;
    float _439 = _437 + (*spvDescriptorSet0.fp_c9)._m0[109].x;
    float _441 = -(*spvDescriptorSet0.fp_c9)._m0[108].y;
    float _443 = _441 + (*spvDescriptorSet0.fp_c9)._m0[109].y;
    float _445 = _433 * _385;
    bool _447 = _399 >= (*spvDescriptorSet0.fp_c9)._m0[108].w;
    bool _449 = isnan(_399);
    bool _451 = _447 || _449;
    bool _453 = isnan((*spvDescriptorSet0.fp_c9)._m0[108].w);
    bool _455 = _451 || _453;
    float _457 = float(_455);
    float _459 = -(*spvDescriptorSet0.fp_c9)._m0[108].z;
    float _461 = _459 + (*spvDescriptorSet0.fp_c9)._m0[109].z;
    bool _463 = _399 >= (*spvDescriptorSet0.fp_c9)._m0[110].w;
    bool _465 = isnan(_399);
    bool _467 = _463 || _465;
    bool _469 = isnan((*spvDescriptorSet0.fp_c9)._m0[110].w);
    bool _471 = _467 || _469;
    float _473 = float(_471);
    float _475 = fma(_395, _417, (*spvDescriptorSet0.fp_c9)._m0[107].z);
    bool _477 = _399 >= (*spvDescriptorSet0.fp_c9)._m0[107].w;
    bool _479 = isnan(_399);
    bool _481 = _477 || _479;
    bool _483 = isnan((*spvDescriptorSet0.fp_c9)._m0[107].w);
    bool _485 = _481 || _483;
    float _487 = float(_485);
    float _489 = -_457;
    float _491 = _489 + 1.0;
    float _493 = fma(_439, _429, (*spvDescriptorSet0.fp_c9)._m0[108].x);
    float _495 = -_473;
    float _497 = _495 + 1.0;
    float _499 = fma(_443, _429, (*spvDescriptorSet0.fp_c9)._m0[108].y);
    float _501 = _487 * _491;
    float _503 = _457 * _425;
    float _505 = _415 * _497;
    float _507 = fma(_461, _429, (*spvDescriptorSet0.fp_c9)._m0[108].z);
    float _509 = _435 * _501;
    float _511 = _427 * _501;
    float _513 = -_487;
    float _515 = _513 + 1.0;
    float _517 = _475 * _501;
    float _519 = -(*spvDescriptorSet0.fp_c9)._m0[109].x;
    float _521 = (*spvDescriptorSet0.fp_c9)._m0[110].x + _519;
    float _523 = -(*spvDescriptorSet0.fp_c9)._m0[109].y;
    float _525 = (*spvDescriptorSet0.fp_c9)._m0[110].y + _523;
    float _527 = fma(_515, (*spvDescriptorSet0.fp_c9)._m0[107].x, _509);
    float _529 = fma(_515, (*spvDescriptorSet0.fp_c9)._m0[107].y, _511);
    float _531 = -(*spvDescriptorSet0.fp_c9)._m0[109].z;
    float _533 = (*spvDescriptorSet0.fp_c9)._m0[110].z + _531;
    float _535 = fma(_515, (*spvDescriptorSet0.fp_c9)._m0[107].z, _517);
    float _537 = fma(_521, _445, (*spvDescriptorSet0.fp_c9)._m0[109].x);
    float _539 = fma(_525, _445, (*spvDescriptorSet0.fp_c9)._m0[109].y);
    float _541 = fma(_493, _503, _527);
    float _543 = fma(_499, _503, _529);
    float _545 = fma(_533, _445, (*spvDescriptorSet0.fp_c9)._m0[109].z);
    float _547 = fma(_507, _503, _535);
    float _549 = fma(_537, _505, _541);
    float _551 = fma(_539, _505, _543);
    float _553 = fma(_545, _505, _547);
    float _555 = fma(_473, (*spvDescriptorSet0.fp_c9)._m0[110].x, _549);
    float _557 = fma(_473, (*spvDescriptorSet0.fp_c9)._m0[110].y, _551);
    float _559 = fma(_473, (*spvDescriptorSet0.fp_c9)._m0[110].z, _553);
    float _561 = _549;
    if (!_299)
    {
        out.m_61.x = _555;
        out.m_61.y = _557;
        out.m_61.z = _559;
        out.m_61.w = _267;
        return out;
    }
    float _563 = _557 * 0.715200006961822509765625;
    float _565 = fma(_555, 0.2125999927520751953125, _563);
    float _567 = fma(_559, 0.072200000286102294921875, _565);
    bool _569 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _571 = 1.0 / _567;
    float _573 = 0.0 + _287;
    float _575 = precise::clamp(_573, 0.0, 1.0);
    float _577 = _575;
    if (_569)
    {
        float _579 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _581 = _263 + _579;
        _561 = _581;
    }
    float _583 = _561;
    float _585 = _571 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _587 = precise::clamp(_585, 0.0, 1.0);
    if (_569)
    {
        float _589 = _583 * 8.0;
        float _591 = precise::clamp(_589, 0.0, 1.0);
        _313 = _591;
    }
    float _593 = _313;
    float _595 = fma(_587, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    if (_569)
    {
        float _597 = _575 * _593;
        _577 = _597;
    }
    float _599 = _577;
    float _601 = _555 * _595;
    float _603 = _557 * _595;
    float _605 = _559 * _595;
    float _607 = 0.0 + _599;
    float _609 = precise::clamp(_607, 0.0, 1.0);
    out.m_61.x = _601;
    out.m_61.y = _603;
    out.m_61.z = _605;
    out.m_61.w = _609;
    return out;
}

