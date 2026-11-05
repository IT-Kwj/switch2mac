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
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_A [[id(7)]];
    sampler fp_t_tcb_ASmplr [[id(8)]];
    texturecube<float> fp_t_tcb_1E [[id(9)]];
    sampler fp_t_tcb_1ESmplr [[id(10)]];
    sampler fp_t_tcb_10Smplr_w [[id(11)]];
    sampler fp_t_tcb_8Smplr_w [[id(12)]];
    sampler fp_t_tcb_ASmplr_w [[id(13)]];
    sampler fp_t_tcb_1ESmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_55 [[color(0)]];
};

struct main0_in
{
    float4 m_46 [[user(locn0)]];
    float4 m_48 [[user(locn1)]];
    float4 m_44 [[user(locn2)]];
    float4 m_42 [[user(locn3)]];
    float4 m_63 [[user(locn4)]];
    float4 m_50 [[user(locn5)]];
    float4 m_57 [[user(locn6)]];
    float4 m_52 [[user(locn7)]];
    float4 m_59 [[user(locn8)]];
    float4 m_65 [[user(locn9)]];
    float4 m_61 [[user(locn10)]];
    float4 m_67 [[user(locn11)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _74 = gl_FragCoord.w;
    float _76 = in.m_42.w;
    float _78 = gl_FragCoord.w;
    float _80 = _76 * _78;
    float _82 = in.m_42.x;
    float _84 = gl_FragCoord.w;
    float _86 = _82 * _84;
    float _88 = in.m_42.y;
    float _90 = gl_FragCoord.w;
    float _92 = _88 * _90;
    float _94 = in.m_44.x;
    float _96 = gl_FragCoord.w;
    float _98 = _94 * _96;
    float _100 = in.m_44.y;
    float _102 = gl_FragCoord.w;
    float _104 = _100 * _102;
    float _106 = 1.0 / _74;
    float _108 = _106 * _80;
    float _110 = _106 * _86;
    float _112 = _106 * _92;
    float _114 = _106 * _98;
    float _116 = 1.0 / _108;
    float _118 = _106 * _104;
    float _120 = _110 * _116;
    float _122 = _112 * _116;
    float2 _738 = float2(_120, _122);
    float _124 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_738, float2(0.0), isnan(_738))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_738, float2(0.0), isnan(_738))).x;
    float2 _749 = float2(_114, _118);
    float4 _127 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_749, float2(0.0), isnan(_749))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_749, float2(0.0), isnan(_749))).xyzw;
    float _129 = _127.x;
    float _131 = _127.y;
    float _133 = _127.z;
    float _135 = _127.w;
    float _137 = in.m_42.z;
    float _139 = gl_FragCoord.w;
    float _141 = _137 * _139;
    float _143 = in.m_46.w;
    float _145 = gl_FragCoord.w;
    float _147 = _143 * _145;
    float _149 = in.m_48.w;
    float _151 = gl_FragCoord.w;
    float _153 = _149 * _151;
    float _155 = in.m_50.x;
    float _157 = gl_FragCoord.w;
    float _159 = _155 * _157;
    float _161 = _106 * _141;
    float _163 = _161 * _116;
    float _165 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _167 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _169 = fma(_163, (*spvDescriptorSet0.fp_c8)._m0[30].w, _167);
    float _171 = _106 * _147;
    float _173 = 1.0 / _169;
    float _175 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _177 = _173 * _175;
    float _179 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _181 = fma(_124, (*spvDescriptorSet0.fp_c8)._m0[30].w, _179);
    float _183 = -_171;
    float _185 = _135 + _183;
    float _187 = _106 * _153;
    float _189 = 1.0 / _181;
    float _191 = _187 * _185;
    float _193 = 0.0 + _191;
    float _195 = precise::clamp(_193, 0.0, 1.0);
    float _197 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _199 = -_177;
    float _201 = fma(_189, _197, _199);
    float _203 = _201 * _165;
    float _205 = precise::clamp(_203, 0.0, 1.0);
    float _207 = _106 * _159;
    float _209 = _195 * _205;
    float _211 = _209 * _207;
    bool _215 = _211 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _217 = isnan(_211);
    bool _219 = _215 || _217;
    bool _221 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _223 = _219 || _221;
    float _225 = in.m_44.z;
    float _227 = gl_FragCoord.w;
    float _229 = _225 * _227;
    float _231 = in.m_44.w;
    float _233 = gl_FragCoord.w;
    float _235 = _231 * _233;
    float _237 = _106;
    if (!_223)
    {
        discard_fragment();
    }
    float _239 = _106 * _229;
    float _241 = _106 * _235;
    float2 _915 = float2(_239, _241);
    float2 _245 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_915, float2(0.0), isnan(_915))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_915, float2(0.0), isnan(_915))).xy;
    float _247 = _245.x;
    float _249 = _245.y;
    float _251 = in.m_52.y;
    float _253 = gl_FragCoord.w;
    float _255 = _251 * _253;
    float _257 = in.m_52.x;
    float _259 = gl_FragCoord.w;
    float _261 = _257 * _259;
    float _263 = in.m_52.z;
    float _265 = gl_FragCoord.w;
    float _267 = _263 * _265;
    float _269 = in.m_48.x;
    float _271 = gl_FragCoord.w;
    float _273 = _269 * _271;
    float _275 = in.m_48.y;
    float _277 = gl_FragCoord.w;
    float _279 = _275 * _277;
    float _281 = in.m_48.z;
    float _283 = gl_FragCoord.w;
    float _285 = _281 * _283;
    float _287 = in.m_46.y;
    float _289 = gl_FragCoord.w;
    float _291 = _287 * _289;
    float _293 = in.m_46.x;
    float _295 = gl_FragCoord.w;
    float _297 = _293 * _295;
    float _299 = in.m_46.z;
    float _301 = gl_FragCoord.w;
    float _303 = _299 * _301;
    float _305 = _129 * _129;
    float _307 = _131 * _131;
    float _309 = _106 * _255;
    float _311 = _106 * _261;
    float _313 = _106 * _267;
    float _315 = _106 * _273;
    float _317 = _309 * _309;
    float _319 = -_305;
    float _321 = _319 + 1.0;
    float _323 = fma(_311, _311, _317);
    float _325 = _106 * _285;
    float _327 = _315 * _321;
    float _329 = _106 * _291;
    float _331 = fma(_313, _313, _323);
    float _333 = _133 * _133;
    float _335 = _106 * _279;
    float _337 = -_307;
    float _339 = _337 + 1.0;
    float _341 = _106 * _303;
    float _343 = -_333;
    float _345 = _343 + 1.0;
    float _347 = rsqrt(_331);
    float _349 = _335 * _339;
    float _351 = _325 * _345;
    float _353 = _106 * _297;
    float _355 = fma(_307, _329, _349);
    float _357 = fma(_333, _341, _351);
    float _359 = fma(_305, _353, _327);
    float _361 = _311 * _347;
    float _363 = _309 * _347;
    float _365 = _313 * _347;
    if (!_223)
    {
        out.m_55.x = _359;
        out.m_55.y = _355;
        out.m_55.z = _357;
        out.m_55.w = _191;
        return out;
    }
    float _367 = in.m_57.y;
    float _369 = gl_FragCoord.w;
    float _371 = _367 * _369;
    float _373 = in.m_57.x;
    float _375 = gl_FragCoord.w;
    float _377 = _373 * _375;
    float _379 = in.m_59.y;
    float _381 = gl_FragCoord.w;
    float _383 = _379 * _381;
    float _385 = in.m_59.x;
    float _387 = gl_FragCoord.w;
    float _389 = _385 * _387;
    float _391 = in.m_57.z;
    float _393 = gl_FragCoord.w;
    float _395 = _391 * _393;
    float _397 = in.m_59.z;
    float _399 = gl_FragCoord.w;
    float _401 = _397 * _399;
    float _403 = _106 * _371;
    float _405 = _106 * _377;
    float _407 = _106 * _383;
    float _409 = _106 * _389;
    float _411 = _403 * _403;
    float _413 = _106 * _395;
    float _415 = _407 * _407;
    float _417 = _106 * _401;
    float _419 = fma(_405, _405, _411);
    float _421 = fma(_409, _409, _415);
    float _423 = fma(_413, _413, _419);
    float _425 = _249 * _249;
    float _427 = fma(_417, _417, _421);
    float _429 = rsqrt(_423);
    float _431 = fma(_247, _247, _425);
    float _433 = precise::clamp(_431, 0.0, 1.0);
    float _435 = -_433;
    float _437 = _435 + 1.0;
    float _439 = rsqrt(_427);
    float _441 = sqrt(_437);
    float _443 = _249 * _429;
    float _445 = _403 * _443;
    float _447 = _405 * _443;
    float _449 = _413 * _443;
    float _451 = _247 * _439;
    float _453 = _363 * _363;
    float _455 = fma(_407, _451, _445);
    float _457 = fma(_409, _451, _447);
    float _459 = fma(_417, _451, _449);
    float _461 = in.m_61.x;
    float _463 = gl_FragCoord.w;
    float _465 = _461 * _463;
    float _467 = fma(_363, _441, _455);
    float _469 = fma(_361, _441, _457);
    float _471 = fma(_365, _441, _459);
    float _473 = fma(_361, _361, _453);
    float _475 = _467 * _467;
    float _477 = fma(_365, _365, _473);
    float _479 = fma(_469, _469, _475);
    float _481 = fma(_471, _471, _479);
    float _483 = rsqrt(_477);
    float _485 = rsqrt(_481);
    float _487 = -_363;
    float _489 = fma(_487, _483, 0.0);
    float _491 = precise::clamp(_489, 0.0, 1.0);
    float _493 = _106 * _465;
    float _495 = _491 + _493;
    float _497 = _469 * _485;
    float _499 = _467 * _485;
    float _501 = _471 * _485;
    float _503 = precise::min(_495, 1.0);
    float _505 = abs(_497);
    float _507 = abs(_499);
    float _509 = precise::max(_505, _507);
    float _511 = abs(_501);
    float _513 = precise::max(_511, _509);
    float _515 = 1.0 / _513;
    float _517 = _497 * _515;
    float _519 = _499 * _515;
    float _521 = -_515;
    float _523 = _501 * _521;
    float3 _1317 = float3(_517, _519, _523);
    float3 _527 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1317, float3(0.0), isnan(_1317)), level(_503)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1317, float3(0.0), isnan(_1317)), level(_503)).xyz;
    float _529 = _527.x;
    float _531 = _527.y;
    float _533 = _527.z;
    float _535 = in.m_63.x;
    float _537 = gl_FragCoord.w;
    float _539 = _535 * _537;
    float _541 = in.m_63.z;
    float _543 = gl_FragCoord.w;
    float _545 = _541 * _543;
    float _547 = in.m_63.y;
    float _549 = gl_FragCoord.w;
    float _551 = _547 * _549;
    float _553 = in.m_65.x;
    float _555 = gl_FragCoord.w;
    float _557 = _553 * _555;
    float _559 = in.m_65.y;
    float _561 = gl_FragCoord.w;
    float _563 = _559 * _561;
    float _565 = in.m_65.z;
    float _567 = gl_FragCoord.w;
    float _569 = _565 * _567;
    float _571 = in.m_67.x;
    float _573 = gl_FragCoord.w;
    float _575 = _571 * _573;
    float _577 = in.m_67.y;
    float _579 = gl_FragCoord.w;
    float _581 = _577 * _579;
    float _583 = in.m_67.z;
    float _585 = gl_FragCoord.w;
    float _587 = _583 * _585;
    float _589 = in.m_67.w;
    float _591 = gl_FragCoord.w;
    float _593 = _589 * _591;
    bool _595 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _597 = _106 * _539;
    float _599 = _106 * _545;
    float _601 = _106 * _557;
    float _603 = _106 * _569;
    float _605 = _106 * _581;
    float _607 = _106 * _587;
    float _609 = _106 * _593;
    float _611 = fma(_529, 0.20999999344348907470703125, _597);
    float _613 = _106 * _551;
    float _615 = _106 * _563;
    float _617 = _106 * _575;
    float _619 = fma(_533, 0.20999999344348907470703125, _599);
    float _621 = fma(_531, 0.20999999344348907470703125, _613);
    if (_595)
    {
        float _623 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _625 = _177 + _623;
        _237 = _625;
    }
    float _627 = _237;
    float _629 = _611 + _601;
    float _631 = _619 + _603;
    float _633 = _621 + _615;
    float _635 = 0.0 + _211;
    float _637 = precise::clamp(_635, 0.0, 1.0);
    float _639 = _627;
    float _641 = _637;
    if (_595)
    {
        float _643 = _627 * 8.0;
        float _645 = precise::clamp(_643, 0.0, 1.0);
        _639 = _645;
    }
    float _647 = _639;
    float _649 = _359 * _629;
    float _651 = _355 * _633;
    float _653 = _357 * _631;
    if (_595)
    {
        float _655 = _637 * _647;
        _641 = _655;
    }
    float _657 = _641;
    float _659 = fma(_649, _609, _617);
    float _661 = fma(_651, _609, _605);
    float _663 = fma(_653, _609, _607);
    float _665 = 0.0 + _657;
    float _667 = precise::clamp(_665, 0.0, 1.0);
    out.m_55.x = _659;
    out.m_55.y = _661;
    out.m_55.z = _663;
    out.m_55.w = _667;
    return out;
}

