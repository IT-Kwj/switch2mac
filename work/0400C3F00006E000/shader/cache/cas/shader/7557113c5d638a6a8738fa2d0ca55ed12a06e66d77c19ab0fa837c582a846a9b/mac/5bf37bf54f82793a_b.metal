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
    constant _16* fp_c10 [[id(2)]];
    constant _16* fp_c15 [[id(3)]];
    texture2d<float> fp_t_tcb_8 [[id(4)]];
    sampler fp_t_tcb_8Smplr [[id(5)]];
    texture2d<float> fp_t_tcb_A [[id(6)]];
    sampler fp_t_tcb_ASmplr [[id(7)]];
    texture2d<float> fp_t_tcb_C [[id(8)]];
    sampler fp_t_tcb_CSmplr [[id(9)]];
    sampler fp_t_tcb_8Smplr_w [[id(10)]];
    sampler fp_t_tcb_ASmplr_w [[id(11)]];
    sampler fp_t_tcb_CSmplr_w [[id(12)]];
    constant dm_border_t* dm_border [[id(13)]];
};

struct main0_out
{
    float4 m_58 [[color(0)]];
};

struct main0_in
{
    float4 m_39 [[user(locn0)]];
    float4 m_55 [[user(locn1)]];
    float4 m_41 [[user(locn2)]];
    float4 m_49 [[user(locn3), flat]];
    float4 m_47 [[user(locn4), flat]];
    float4 m_62 [[user(locn5)]];
    float4 m_43 [[user(locn6)]];
    float4 m_53 [[user(locn7), flat]];
    float4 m_51 [[user(locn8)]];
    float4 m_45 [[user(locn10)]];
    float4 m_60 [[user(locn11)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _69 = gl_FragCoord.w;
    float _71 = in.m_39.w;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = in.m_41.w;
    float _79 = gl_FragCoord.w;
    float _81 = _77 * _79;
    float _83 = in.m_43.x;
    float _85 = gl_FragCoord.w;
    float _87 = _83 * _85;
    float _89 = 1.0 / _69;
    float _91 = _89 * _75;
    float _93 = _89 * _81;
    float _95 = _91 * _93;
    float _97 = _89 * _87;
    float _99 = 0.0 + _95;
    float _101 = precise::clamp(_99, 0.0, 1.0);
    float _103 = _101 * _97;
    bool _107 = _103 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _109 = isnan(_103);
    bool _111 = _107 || _109;
    bool _113 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _115 = _111 || _113;
    float _117 = in.m_45.y;
    float _119 = gl_FragCoord.w;
    float _121 = _117 * _119;
    float _123 = in.m_45.x;
    float _125 = gl_FragCoord.w;
    float _127 = _123 * _125;
    float _129 = in.m_45.z;
    float _131 = gl_FragCoord.w;
    float _133 = _129 * _131;
    if (!_115)
    {
        discard_fragment();
    }
    float _135 = in.m_47.y;
    float _137 = in.m_47.x;
    float _139 = in.m_49.x;
    float _141 = in.m_51.y;
    float _143 = gl_FragCoord.w;
    float _145 = _141 * _143;
    float _147 = in.m_51.x;
    float _149 = gl_FragCoord.w;
    float _151 = _147 * _149;
    float _153 = _89 * _121;
    float _155 = _89 * _127;
    float _157 = _89 * _133;
    float _159 = in.m_47.z;
    float _161 = -(*spvDescriptorSet0.fp_c8)._m0[29].y;
    float _163 = _153 + _161;
    float _165 = -(*spvDescriptorSet0.fp_c8)._m0[29].x;
    float _167 = _155 + _165;
    float _169 = -(*spvDescriptorSet0.fp_c8)._m0[29].z;
    float _171 = _157 + _169;
    float _173 = _163 * _163;
    float _175 = fma(_167, _167, _173);
    float _177 = fma(_171, _171, _175);
    float _179 = -_135;
    float _181 = _153 + _179;
    float _183 = -_137;
    float _185 = _155 + _183;
    float _187 = fma(_139, 0.599999964237213134765625, 0.100000001490116119384765625);
    float _189 = rsqrt(_177);
    float _191 = _181 * (*spvDescriptorSet0.fp_c10)._m0[9].x;
    float _193 = _181 * (*spvDescriptorSet0.fp_c10)._m0[9].z;
    float _195 = _89 * _145;
    float _197 = _89 * _151;
    float _199 = fma(_185, (*spvDescriptorSet0.fp_c10)._m0[8].x, _191);
    float _201 = fma(_185, (*spvDescriptorSet0.fp_c10)._m0[8].z, _193);
    float _203 = in.m_53.x;
    float _205 = -_159;
    float _207 = _157 + _205;
    float _209 = _163 * _189;
    float _211 = _167 * _189;
    float _213 = _171 * _189;
    float _215 = fma(_207, (*spvDescriptorSet0.fp_c10)._m0[10].x, _199);
    float _217 = _209 * (*spvDescriptorSet0.fp_c10)._m0[9].x;
    float _219 = _209 * (*spvDescriptorSet0.fp_c10)._m0[9].z;
    float _221 = fma(_207, (*spvDescriptorSet0.fp_c10)._m0[10].z, _201);
    float _223 = in.m_53.y;
    float _225 = fma(_211, (*spvDescriptorSet0.fp_c10)._m0[8].x, _217);
    float _227 = fma(_211, (*spvDescriptorSet0.fp_c10)._m0[8].z, _219);
    float _229 = _215 * 2.150000095367431640625;
    float _231 = _221 * 2.150000095367431640625;
    float _233 = fma(_213, (*spvDescriptorSet0.fp_c10)._m0[10].x, _225);
    float _235 = fma(_213, (*spvDescriptorSet0.fp_c10)._m0[10].z, _227);
    float _237 = floor(_229);
    float _239 = fma(_233, _187, _229);
    float _241 = fma(_235, _187, _231);
    float _243 = floor(_239);
    float _245 = floor(_241);
    float _247 = fma(_237, 0.20000000298023223876953125, _203);
    float _249 = floor(_231);
    float _251 = fma(_243, 0.20000000298023223876953125, _203);
    float _253 = fma(_245, 0.20000000298023223876953125, _223);
    float _255 = fma(_249, 0.20000000298023223876953125, _223);
    float2 _880 = float2(_239, _241);
    float _257 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_880, float2(0.0), isnan(_880))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_880, float2(0.0), isnan(_880))).w;
    float2 _890 = float2(_229, _231);
    float _259 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_890, float2(0.0), isnan(_890))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_890, float2(0.0), isnan(_890))).w;
    float2 _898 = float2(_251, _253);
    float _261 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_898, float2(0.0), isnan(_898))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_898, float2(0.0), isnan(_898))).w;
    float2 _906 = float2(_247, _255);
    float _263 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_906, float2(0.0), isnan(_906))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_906, float2(0.0), isnan(_906))).w;
    float2 _914 = float2(_197, _195);
    float _265 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_914, float2(0.0), isnan(_914))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_914, float2(0.0), isnan(_914))).w;
    float _267 = _249 + 0.5;
    float _269 = _237 + 0.5;
    float _271 = fma(_235, 4.0, _231);
    bool _273 = _237 < 5.0;
    float _275 = _267 * _267;
    bool _277 = _243 < 5.0;
    float _279 = _271 + 0.5;
    bool _281 = _249 < 5.0;
    bool _283 = _281 && _273;
    float _285 = fma(_269, _269, _275);
    float _287 = _245 + 0.5;
    float _289 = fma(_233, 4.0, _229);
    float _291 = _243 + 0.5;
    float _293 = in.m_55.w;
    float _295 = gl_FragCoord.w;
    float _297 = _293 * _295;
    float _299 = _287 * _287;
    float _301 = sqrt(_285);
    float _303 = _289 + 0.5;
    float _305 = _279 * _279;
    float _307 = fma(_291, _291, _299);
    bool _309 = _245 < 5.0;
    bool _311 = _309 && _277;
    float _313 = in.m_39.x;
    float _315 = gl_FragCoord.w;
    float _317 = _313 * _315;
    float _319 = fma(_303, _303, _305);
    bool _321 = _237 >= (-5.0);
    bool _323 = isnan(_237);
    bool _325 = _321 || _323;
    bool _327 = isnan(-5.0);
    bool _329 = _325 || _327;
    bool _331 = _329 && _283;
    float _333 = in.m_39.y;
    float _335 = gl_FragCoord.w;
    float _337 = _333 * _335;
    float _339 = sqrt(_307);
    bool _341 = _243 >= (-5.0);
    bool _343 = isnan(_243);
    bool _345 = _341 || _343;
    bool _347 = isnan(-5.0);
    bool _349 = _345 || _347;
    bool _351 = _349 && _311;
    float _353 = in.m_39.z;
    float _355 = gl_FragCoord.w;
    float _357 = _353 * _355;
    float _359 = _301 * 0.20000000298023223876953125;
    float _361 = precise::clamp(_359, 0.0, 1.0);
    float _363 = sqrt(_319);
    bool _365 = _249 >= (-5.0);
    bool _367 = isnan(_249);
    bool _369 = _365 || _367;
    bool _371 = isnan(-5.0);
    bool _373 = _369 || _371;
    bool _375 = _373 && _331;
    float _377 = float(_375);
    bool _379 = _245 >= (-5.0);
    bool _381 = isnan(_245);
    bool _383 = _379 || _381;
    bool _385 = isnan(-5.0);
    bool _387 = _383 || _385;
    bool _389 = _387 && _351;
    float _391 = float(_389);
    float _393 = _339 * 0.20000000298023223876953125;
    float _395 = precise::clamp(_393, 0.0, 1.0);
    float _397 = fma(_363, -0.16666667163372039794921875, 1.0);
    float _399 = precise::clamp(_397, 0.0, 1.0);
    float _401 = _89 * _357;
    float _403 = fma(_395, 0.5, _257);
    float _405 = fma(_361, 0.5, _259);
    float _407 = fma(_261, -0.25, 1.0);
    float _409 = fma(_263, -0.25, 1.0);
    float _411 = _89 * _297;
    float _413 = _403 * _407;
    float _415 = _405 * _409;
    float _417 = _413 * _391;
    float _419 = _415 * _377;
    float _421 = _411 + 0.5;
    float _423 = fma(_399, -2.0, 3.0);
    float _425 = _399 * _399;
    float _427 = -_265;
    float _429 = _427 + 1.0;
    float _431 = _411 + 0.550000011920928955078125;
    float _433 = precise::max(_421, _417);
    float _435 = fma(_423, _425, _429);
    float _437 = precise::clamp(_435, 0.0, 1.0);
    float _439 = precise::max(_421, _419);
    float _441 = precise::min(_431, _433);
    float _443 = _437 * 3.0;
    float _445 = precise::min(_431, _439);
    float _447 = -_421;
    float _449 = _447 + _441;
    float _451 = -_421;
    float _453 = _451 + _445;
    float _455 = _89 * _317;
    float _457 = fma(_449, 19.999996185302734375, _443);
    float _459 = _89 * _337;
    float _461 = _453 * 19.999996185302734375;
    float _463 = _461 * 4.0;
    float _465 = fma(_455, _457, _455);
    float _467 = fma(_459, _457, _459);
    float _469 = fma(_401, _457, _401);
    float _471 = fma(_455, _463, _465);
    float _473 = fma(_459, _463, _467);
    float _475 = fma(_401, _463, _469);
    if (!_115)
    {
        out.m_58.x = _471;
        out.m_58.y = _473;
        out.m_58.z = _475;
        out.m_58.w = _95;
        return out;
    }
    float _477 = _473 * 0.715200006961822509765625;
    float _479 = in.m_60.w;
    float _481 = gl_FragCoord.w;
    float _483 = _479 * _481;
    float _485 = in.m_60.z;
    float _487 = gl_FragCoord.w;
    float _489 = _485 * _487;
    float _491 = in.m_60.x;
    float _493 = gl_FragCoord.w;
    float _495 = _491 * _493;
    float _497 = fma(_471, 0.2125999927520751953125, _477);
    float _499 = in.m_60.y;
    float _501 = gl_FragCoord.w;
    float _503 = _499 * _501;
    float _505 = fma(_475, 0.072200000286102294921875, _497);
    bool _507 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _509 = 1.0 / _505;
    float _511 = _509 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _513 = precise::clamp(_511, 0.0, 1.0);
    float _515 = _89 * _483;
    float _517 = fma(_513, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _519 = _89 * _489;
    float _521 = _517 * _515;
    float _523 = 0.0 + _103;
    float _525 = precise::clamp(_523, 0.0, 1.0);
    float _527 = _89 * _495;
    float _529 = _89 * _503;
    float _531 = fma(_475, _521, _519);
    float _533 = fma(_471, _521, _527);
    float _535 = fma(_473, _521, _529);
    float _537 = _519;
    if (!_507)
    {
        _537 = _525;
    }
    float _539 = _537;
    bool _541 = !_507;
    float _543 = _539;
    if (!_541)
    {
        float _545 = in.m_62.w;
        float _547 = gl_FragCoord.w;
        float _549 = _545 * _547;
        float _551 = in.m_62.z;
        float _553 = gl_FragCoord.w;
        float _555 = _551 * _553;
        float _557 = _89 * _549;
        float _559 = _89 * _555;
        float _561 = 1.0 / _557;
        float _563 = _559 * _561;
        float _565 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _567 = fma(_563, (*spvDescriptorSet0.fp_c8)._m0[30].w, _565);
        float _569 = 1.0 / _567;
        float _571 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _573 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _575 = fma(_569, _571, _573);
        float _577 = _575 * 8.0;
        float _579 = precise::clamp(_577, 0.0, 1.0);
        float _581 = _525 * _579;
        _543 = _581;
    }
    float _583 = _543;
    float _585 = 0.0 + _583;
    float _587 = precise::clamp(_585, 0.0, 1.0);
    out.m_58.x = _533;
    out.m_58.y = _535;
    out.m_58.z = _531;
    out.m_58.w = _587;
    return out;
}

