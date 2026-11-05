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
    constant _16* fp_c13 [[id(1)]];
    constant _16* fp_c15 [[id(2)]];
    constant _16* fp_c8 [[id(3)]];
    texture2d<float> fp_t_tcb_C [[id(4)]];
    sampler fp_t_tcb_CSmplr [[id(5)]];
    texture2d<float> fp_t_tcb_8 [[id(6)]];
    sampler fp_t_tcb_8Smplr [[id(7)]];
    texture2d<float> fp_t_tcb_A [[id(8)]];
    sampler fp_t_tcb_ASmplr [[id(9)]];
    texturecube<float> fp_t_tcb_1E [[id(10)]];
    sampler fp_t_tcb_1ESmplr [[id(11)]];
    sampler fp_t_tcb_CSmplr_w [[id(12)]];
    sampler fp_t_tcb_8Smplr_w [[id(13)]];
    sampler fp_t_tcb_ASmplr_w [[id(14)]];
    sampler fp_t_tcb_1ESmplr_w [[id(15)]];
    constant dm_border_t* dm_border [[id(16)]];
};

struct main0_out
{
    float4 m_55 [[color(0)]];
};

struct main0_in
{
    float4 m_48 [[user(locn0)]];
    float4 m_50 [[user(locn1)]];
    float4 m_46 [[user(locn2)]];
    float4 m_73 [[user(locn3)]];
    float4 m_67 [[user(locn4)]];
    float4 m_52 [[user(locn5)]];
    float4 m_44 [[user(locn6)]];
    float4 m_59 [[user(locn7)]];
    float4 m_61 [[user(locn8)]];
    float4 m_57 [[user(locn9)]];
    float4 m_69 [[user(locn10)]];
    float4 m_65 [[user(locn11)]];
    float4 m_63 [[user(locn12)]];
    float4 m_71 [[user(locn13)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _80 = gl_FragCoord.w;
    float _82 = in.m_44.x;
    float _84 = gl_FragCoord.w;
    float _86 = _82 * _84;
    float _88 = in.m_46.x;
    float _90 = gl_FragCoord.w;
    float _92 = _88 * _90;
    float _94 = in.m_46.y;
    float _96 = gl_FragCoord.w;
    float _98 = _94 * _96;
    float _100 = in.m_44.y;
    float _102 = gl_FragCoord.w;
    float _104 = _100 * _102;
    float _106 = 1.0 / _80;
    float _108 = _106 * _86;
    float _110 = _106 * _92;
    float _112 = _106 * _98;
    float _114 = _106 * _104;
    float2 _718 = float2(_108, _114);
    float _116 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_718, float2(0.0), isnan(_718))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_718, float2(0.0), isnan(_718))).w;
    float2 _729 = float2(_110, _112);
    float4 _119 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_729, float2(0.0), isnan(_729))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_729, float2(0.0), isnan(_729))).xyzw;
    float _121 = _119.x;
    float _123 = _119.y;
    float _125 = _119.z;
    float _127 = _119.w;
    float _129 = in.m_48.w;
    float _131 = gl_FragCoord.w;
    float _133 = _129 * _131;
    float _135 = in.m_50.w;
    float _137 = gl_FragCoord.w;
    float _139 = _135 * _137;
    float _141 = in.m_52.x;
    float _143 = gl_FragCoord.w;
    float _145 = _141 * _143;
    float _147 = _106 * _133;
    float _149 = _106 * _139;
    float _151 = in.m_46.w;
    float _153 = gl_FragCoord.w;
    float _155 = _151 * _153;
    float _157 = _106 * _155;
    float _159 = -_147;
    float _161 = fma(_127, _116, _159);
    float _163 = _149 * _161;
    float _165 = _106 * _145;
    float _167 = 0.0 + _163;
    float _169 = precise::clamp(_167, 0.0, 1.0);
    float _171 = _169 * _165;
    bool _175 = _171 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _177 = isnan(_171);
    bool _179 = _175 || _177;
    bool _181 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _183 = _179 || _181;
    float _185 = in.m_46.z;
    float _187 = gl_FragCoord.w;
    float _189 = _185 * _187;
    if (!_183)
    {
        discard_fragment();
    }
    float _191 = _106 * _189;
    float2 _834 = float2(_191, _157);
    float2 _195 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_834, float2(0.0), isnan(_834))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_834, float2(0.0), isnan(_834))).xy;
    float _197 = _195.x;
    float _199 = _195.y;
    float _201 = in.m_48.x;
    float _203 = gl_FragCoord.w;
    float _205 = _201 * _203;
    float _207 = in.m_48.y;
    float _209 = gl_FragCoord.w;
    float _211 = _207 * _209;
    float _213 = in.m_50.x;
    float _215 = gl_FragCoord.w;
    float _217 = _213 * _215;
    float _219 = in.m_50.y;
    float _221 = gl_FragCoord.w;
    float _223 = _219 * _221;
    float _225 = in.m_48.z;
    float _227 = gl_FragCoord.w;
    float _229 = _225 * _227;
    float _231 = in.m_50.z;
    float _233 = gl_FragCoord.w;
    float _235 = _231 * _233;
    float _237 = _123 * _123;
    float _239 = _125 * _125;
    float _241 = _121 * _121;
    float _243 = _106 * _205;
    float _245 = _106 * _211;
    float _247 = _106 * _217;
    float _249 = _106 * _223;
    float _251 = _106 * _229;
    float _253 = _106 * _235;
    float _255 = -_247;
    float _257 = _243 + _255;
    float _259 = -_249;
    float _261 = _245 + _259;
    float _263 = -_253;
    float _265 = _251 + _263;
    float _267 = fma(_241, _257, _247);
    float _269 = fma(_237, _261, _249);
    float _271 = fma(_239, _265, _253);
    if (!_183)
    {
        out.m_55.x = _267;
        out.m_55.y = _269;
        out.m_55.z = _271;
        out.m_55.w = _163;
        return out;
    }
    float _273 = in.m_57.y;
    float _275 = gl_FragCoord.w;
    float _277 = _273 * _275;
    float _279 = in.m_57.x;
    float _281 = gl_FragCoord.w;
    float _283 = _279 * _281;
    float _285 = in.m_57.z;
    float _287 = gl_FragCoord.w;
    float _289 = _285 * _287;
    float _291 = in.m_59.y;
    float _293 = gl_FragCoord.w;
    float _295 = _291 * _293;
    float _297 = in.m_59.x;
    float _299 = gl_FragCoord.w;
    float _301 = _297 * _299;
    float _303 = in.m_59.z;
    float _305 = gl_FragCoord.w;
    float _307 = _303 * _305;
    float _309 = in.m_61.y;
    float _311 = gl_FragCoord.w;
    float _313 = _309 * _311;
    float _315 = in.m_61.x;
    float _317 = gl_FragCoord.w;
    float _319 = _315 * _317;
    float _321 = in.m_61.z;
    float _323 = gl_FragCoord.w;
    float _325 = _321 * _323;
    float _327 = _199 * _199;
    float _329 = fma(_197, _197, _327);
    float _331 = precise::clamp(_329, 0.0, 1.0);
    float _333 = -_331;
    float _335 = _333 + 1.0;
    float _337 = sqrt(_335);
    float _339 = _106 * _277;
    float _341 = _106 * _283;
    float _343 = _106 * _289;
    float _345 = _106 * _295;
    float _347 = _339 * _339;
    float _349 = _106 * _307;
    float _351 = _106 * _313;
    float _353 = _106 * _319;
    float _355 = fma(_341, _341, _347);
    float _357 = _106 * _301;
    float _359 = _345 * _345;
    float _361 = _351 * _351;
    float _363 = fma(_343, _343, _355);
    float _365 = _106 * _325;
    float _367 = fma(_357, _357, _359);
    float _369 = fma(_353, _353, _361);
    float _371 = fma(_349, _349, _367);
    float _373 = fma(_365, _365, _369);
    float _375 = rsqrt(_363);
    float _377 = rsqrt(_371);
    float _379 = rsqrt(_373);
    float _381 = _377 * _199;
    float _383 = _375 * _197;
    float _385 = in.m_63.x;
    float _387 = gl_FragCoord.w;
    float _389 = _385 * _387;
    float _391 = _345 * _381;
    float _393 = _357 * _381;
    float _395 = _349 * _381;
    float _397 = _379 * _337;
    float _399 = fma(_339, _383, _391);
    float _401 = fma(_341, _383, _393);
    float _403 = fma(_343, _383, _395);
    float _405 = fma(_351, _397, _399);
    float _407 = fma(_353, _397, _401);
    float _409 = fma(_365, _397, _403);
    float _411 = _405 * _405;
    float _413 = fma(_407, _407, _411);
    float _415 = fma(_409, _409, _413);
    float _417 = rsqrt(_415);
    float _419 = _407 * _417;
    float _421 = _405 * _417;
    float _423 = _409 * _417;
    float _425 = abs(_419);
    float _427 = abs(_421);
    float _429 = precise::max(_425, _427);
    float _431 = abs(_423);
    float _433 = precise::max(_431, _429);
    float _435 = _106 * _389;
    float _437 = 1.0 / _433;
    float _439 = _421 * _437;
    float _441 = _419 * _437;
    float _443 = -_437;
    float _445 = _423 * _443;
    float _447 = precise::min(_435, 1.0);
    float3 _1201 = float3(_441, _439, _445);
    float3 _451 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1201, float3(0.0), isnan(_1201)), level(_447)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1201, float3(0.0), isnan(_1201)), level(_447)).xyz;
    float _453 = _451.x;
    float _455 = _451.y;
    float _457 = _451.z;
    float _459 = in.m_65.x;
    float _461 = gl_FragCoord.w;
    float _463 = _459 * _461;
    float _465 = in.m_65.y;
    float _467 = gl_FragCoord.w;
    float _469 = _465 * _467;
    float _471 = in.m_67.x;
    float _473 = gl_FragCoord.w;
    float _475 = _471 * _473;
    float _477 = in.m_65.z;
    float _479 = gl_FragCoord.w;
    float _481 = _477 * _479;
    float _483 = in.m_67.y;
    float _485 = gl_FragCoord.w;
    float _487 = _483 * _485;
    float _489 = in.m_67.z;
    float _491 = gl_FragCoord.w;
    float _493 = _489 * _491;
    float _495 = in.m_69.x;
    float _497 = gl_FragCoord.w;
    float _499 = _495 * _497;
    float _501 = in.m_69.y;
    float _503 = gl_FragCoord.w;
    float _505 = _501 * _503;
    float _507 = in.m_69.z;
    float _509 = gl_FragCoord.w;
    float _511 = _507 * _509;
    float _513 = in.m_71.x;
    float _515 = gl_FragCoord.w;
    float _517 = _513 * _515;
    float _519 = in.m_71.w;
    float _521 = gl_FragCoord.w;
    float _523 = _519 * _521;
    float _525 = 0.0 + _171;
    float _527 = precise::clamp(_525, 0.0, 1.0);
    float _529 = in.m_71.y;
    float _531 = gl_FragCoord.w;
    float _533 = _529 * _531;
    float _535 = in.m_71.z;
    float _537 = gl_FragCoord.w;
    float _539 = _535 * _537;
    float _541 = _106 * _463;
    float _543 = -(*spvDescriptorSet0.fp_c13)._m0[0].y;
    float _545 = _543 + 1.0;
    float _547 = _106 * _469;
    float _549 = _106 * _481;
    float _551 = fma(_541, (*spvDescriptorSet0.fp_c13)._m0[0].y, _545);
    float _553 = fma(_547, (*spvDescriptorSet0.fp_c13)._m0[0].y, _545);
    float _555 = fma(_549, (*spvDescriptorSet0.fp_c13)._m0[0].y, _545);
    float _557 = _106 * _493;
    float _559 = _267 * _551;
    float _561 = precise::clamp(_559, 0.0, 1.0);
    float _563 = _269 * _553;
    float _565 = precise::clamp(_563, 0.0, 1.0);
    float _567 = _106 * _475;
    float _569 = _106 * _487;
    float _571 = _271 * _555;
    float _573 = precise::clamp(_571, 0.0, 1.0);
    float _575 = _106 * _499;
    float _577 = _106 * _505;
    float _579 = _106 * _511;
    float _581 = _106 * _517;
    float _583 = _106 * _523;
    float _585 = _106 * _539;
    float _587 = fma(_453, 0.20999999344348907470703125, _567);
    float _589 = fma(_455, 0.20999999344348907470703125, _569);
    float _591 = fma(_457, 0.20999999344348907470703125, _557);
    float _593 = _587 + _575;
    bool _595 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _597 = _589 + _577;
    float _599 = _591 + _579;
    float _601 = _561 * _593;
    float _603 = _106 * _533;
    float _605 = _565 * _597;
    float _607 = _573 * _599;
    float _609 = fma(_601, _583, _581);
    float _611 = fma(_605, _583, _603);
    float _613 = fma(_607, _583, _585);
    float _615 = _581;
    if (!_595)
    {
        _615 = _527;
    }
    float _617 = _615;
    bool _619 = !_595;
    float _621 = _617;
    if (!_619)
    {
        float _623 = in.m_73.w;
        float _625 = gl_FragCoord.w;
        float _627 = _623 * _625;
        float _629 = in.m_73.z;
        float _631 = gl_FragCoord.w;
        float _633 = _629 * _631;
        float _635 = _106 * _627;
        float _637 = _106 * _633;
        float _639 = 1.0 / _635;
        float _641 = _637 * _639;
        float _643 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _645 = fma(_641, (*spvDescriptorSet0.fp_c8)._m0[30].w, _643);
        float _647 = 1.0 / _645;
        float _649 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _651 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _653 = fma(_647, _649, _651);
        float _655 = _653 * 8.0;
        float _657 = precise::clamp(_655, 0.0, 1.0);
        float _659 = _527 * _657;
        _621 = _659;
    }
    float _661 = _621;
    float _663 = 0.0 + _661;
    float _665 = precise::clamp(_663, 0.0, 1.0);
    out.m_55.x = _609;
    out.m_55.y = _611;
    out.m_55.z = _613;
    out.m_55.w = _665;
    return out;
}

