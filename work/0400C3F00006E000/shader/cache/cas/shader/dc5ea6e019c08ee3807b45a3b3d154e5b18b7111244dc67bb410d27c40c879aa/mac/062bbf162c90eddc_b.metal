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
    uint4 _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float4 _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    constant _16* fp_c9 [[id(1)]];
    constant _16* fp_c15 [[id(2)]];
    constant _16* fp_c8 [[id(3)]];
    texture2d<float> fp_t_tcb_8 [[id(4)]];
    sampler fp_t_tcb_8Smplr [[id(5)]];
    texture2d<float> fp_t_tcb_A [[id(6)]];
    sampler fp_t_tcb_ASmplr [[id(7)]];
    texturecube<float> fp_t_tcb_1E [[id(8)]];
    sampler fp_t_tcb_1ESmplr [[id(9)]];
    sampler fp_t_tcb_8Smplr_w [[id(10)]];
    sampler fp_t_tcb_ASmplr_w [[id(11)]];
    sampler fp_t_tcb_1ESmplr_w [[id(12)]];
    constant dm_border_t* dm_border [[id(13)]];
};

struct main0_out
{
    float4 m_51 [[color(0)]];
};

struct main0_in
{
    float4 m_42 [[user(locn0)]];
    float4 m_46 [[user(locn1)]];
    float4 m_48 [[user(locn2)]];
    float4 m_61 [[user(locn3)]];
    float4 m_44 [[user(locn4)]];
    float4 m_40 [[user(locn5)]];
    float4 m_67 [[user(locn6)]];
    float4 m_55 [[user(locn7)]];
    float4 m_59 [[user(locn8)]];
    float4 m_57 [[user(locn9)]];
    float4 m_63 [[user(locn10)]];
    float4 m_53 [[user(locn11)]];
    float4 m_65 [[user(locn12)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _74 = gl_FragCoord.w;
    float _76 = in.m_40.x;
    float _78 = gl_FragCoord.w;
    float _80 = _76 * _78;
    float _82 = in.m_40.y;
    float _84 = gl_FragCoord.w;
    float _86 = _82 * _84;
    float _88 = 1.0 / _74;
    float _90 = _88 * _80;
    float _92 = _88 * _86;
    float2 _746 = float2(_90, _92);
    float4 _95 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_746, float2(0.0), isnan(_746))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_746, float2(0.0), isnan(_746))).xyzw;
    float _97 = _95.x;
    float _99 = _95.y;
    float _101 = _95.z;
    float _103 = _95.w;
    float _105 = in.m_42.w;
    float _107 = gl_FragCoord.w;
    float _109 = _105 * _107;
    float _111 = in.m_44.w;
    float _113 = gl_FragCoord.w;
    float _115 = _111 * _113;
    float _117 = in.m_46.w;
    float _119 = gl_FragCoord.w;
    float _121 = _117 * _119;
    float _123 = in.m_48.x;
    float _125 = gl_FragCoord.w;
    float _127 = _123 * _125;
    float _129 = _88 * _109;
    float _131 = _88 * _115;
    float _133 = _88 * _121;
    float _135 = _88 * _127;
    float _137 = in.m_40.w;
    float _139 = gl_FragCoord.w;
    float _141 = _137 * _139;
    float _143 = _88 * _141;
    float _145 = -_129;
    float _147 = fma(_103, _131, _145);
    float _149 = _133 * _147;
    float _151 = 0.0 + _149;
    float _153 = precise::clamp(_151, 0.0, 1.0);
    float _155 = _153 * _135;
    bool _159 = _155 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _161 = isnan(_155);
    bool _163 = _159 || _161;
    bool _165 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _167 = _163 || _165;
    float _169 = in.m_40.z;
    float _171 = gl_FragCoord.w;
    float _173 = _169 * _171;
    if (!_167)
    {
        discard_fragment();
    }
    float _175 = _88 * _173;
    float2 _864 = float2(_175, _143);
    float2 _179 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_864, float2(0.0), isnan(_864))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_864, float2(0.0), isnan(_864))).xy;
    float _181 = _179.x;
    float _183 = _179.y;
    float _185 = in.m_42.x;
    float _187 = gl_FragCoord.w;
    float _189 = _185 * _187;
    float _191 = in.m_42.y;
    float _193 = gl_FragCoord.w;
    float _195 = _191 * _193;
    float _197 = in.m_46.x;
    float _199 = gl_FragCoord.w;
    float _201 = _197 * _199;
    float _203 = in.m_42.z;
    float _205 = gl_FragCoord.w;
    float _207 = _203 * _205;
    float _209 = in.m_46.y;
    float _211 = gl_FragCoord.w;
    float _213 = _209 * _211;
    float _215 = in.m_46.z;
    float _217 = gl_FragCoord.w;
    float _219 = _215 * _217;
    float _221 = in.m_44.x;
    float _223 = gl_FragCoord.w;
    float _225 = _221 * _223;
    float _227 = in.m_44.y;
    float _229 = gl_FragCoord.w;
    float _231 = _227 * _229;
    float _233 = in.m_44.z;
    float _235 = gl_FragCoord.w;
    float _237 = _233 * _235;
    float _239 = _88 * _189;
    float _241 = _88 * _195;
    float _243 = _88 * _201;
    float _245 = _88 * _207;
    float _247 = _88 * _213;
    float _249 = _88 * _219;
    float _251 = -_243;
    float _253 = _239 + _251;
    float _255 = -_247;
    float _257 = _241 + _255;
    float _259 = -_249;
    float _261 = _245 + _259;
    float _263 = fma(_97, _253, _243);
    float _265 = fma(_99, _257, _247);
    float _267 = fma(_101, _261, _249);
    float _269 = _88 * _225;
    float _271 = _88 * _231;
    float _273 = _88 * _237;
    float _275 = _263 * _269;
    float _277 = _265 * _271;
    float _279 = _267 * _273;
    if (!_167)
    {
        out.m_51.x = _275;
        out.m_51.y = _277;
        out.m_51.z = _279;
        out.m_51.w = _149;
        return out;
    }
    float _281 = in.m_53.w;
    float _283 = gl_FragCoord.w;
    float _285 = _281 * _283;
    float _287 = _88 * _285;
    bool _289 = _287 != 1.0;
    bool _291 = isnan(_287);
    bool _293 = _289 || _291;
    bool _295 = isnan(1.0);
    bool _297 = _293 || _295;
    bool _299 = !_297;
    if (!_299)
    {
        float _301 = gl_FragCoord.x;
        float _303 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _305 = _301 / _303;
        float _307 = gl_FragCoord.y;
        float _309 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _311 = _307 / _309;
        float _313 = _287 * 256.0;
        float _315 = trunc(_313);
        int _318 = int(_315);
        uint _321 = uint(int(uint(_318) >> uint(7)));
        int _323 = int(_321) + _318;
        float _325 = trunc(_305);
        int _327 = int(_325);
        float _329 = trunc(_311);
        int _331 = int(_329);
        int _333 = _327 + 2;
        int _335 = _333 >> 1;
        uint _337 = uint(int(uint(_331) >> uint(1)));
        int _339 = _335 ^ int(_337);
        int _341 = _339 << 16;
        int _343 = _341 ^ _335;
        int _345 = 983055 & _343;
        int _347 = _345 << 6;
        int _349 = _347 + _345;
        int _351 = _349 & 13369548;
        uint _353 = uint(int(uint(_351) >> uint(3)));
        int _355 = _351 | int(_353);
        int _357 = _355 & 5570560;
        int _359 = _355 & 85;
        uint _361 = uint(int(uint(_357) >> uint(15)));
        int _363 = int(_361) + _359;
        bool _365 = uint(_323) > uint(_363);
        if (!_365)
        {
            discard_fragment();
        }
        if (!_365)
        {
            out.m_51.x = _275;
            out.m_51.y = _277;
            out.m_51.z = _279;
            out.m_51.w = _155;
            return out;
        }
    }
    float _367 = in.m_55.y;
    float _369 = gl_FragCoord.w;
    float _371 = _367 * _369;
    float _373 = in.m_57.z;
    float _375 = gl_FragCoord.w;
    float _377 = _373 * _375;
    float _379 = in.m_55.x;
    float _381 = gl_FragCoord.w;
    float _383 = _379 * _381;
    float _385 = in.m_57.y;
    float _387 = gl_FragCoord.w;
    float _389 = _385 * _387;
    float _391 = in.m_55.z;
    float _393 = gl_FragCoord.w;
    float _395 = _391 * _393;
    float _397 = in.m_57.x;
    float _399 = gl_FragCoord.w;
    float _401 = _397 * _399;
    float _403 = in.m_59.y;
    float _405 = gl_FragCoord.w;
    float _407 = _403 * _405;
    float _409 = in.m_59.x;
    float _411 = gl_FragCoord.w;
    float _413 = _409 * _411;
    float _415 = in.m_59.z;
    float _417 = gl_FragCoord.w;
    float _419 = _415 * _417;
    float _421 = _183 * _183;
    float _423 = fma(_181, _181, _421);
    float _425 = precise::clamp(_423, 0.0, 1.0);
    float _427 = -_425;
    float _429 = _427 + 1.0;
    float _431 = sqrt(_429);
    float _433 = _88 * _371;
    float _435 = _88 * _377;
    float _437 = _88 * _383;
    float _439 = _88 * _389;
    float _441 = _433 * _433;
    float _443 = _88 * _395;
    float _445 = _88 * _401;
    float _447 = _439 * _439;
    float _449 = fma(_437, _437, _441);
    float _451 = _88 * _407;
    float _453 = _88 * _413;
    float _455 = fma(_445, _445, _447);
    float _457 = fma(_443, _443, _449);
    float _459 = _451 * _451;
    float _461 = _88 * _419;
    float _463 = fma(_435, _435, _455);
    float _465 = fma(_453, _453, _459);
    float _467 = rsqrt(_457);
    float _469 = fma(_461, _461, _465);
    float _471 = rsqrt(_463);
    float _473 = rsqrt(_469);
    float _475 = _467 * _183;
    float _477 = _433 * _475;
    float _479 = _471 * _181;
    float _481 = _437 * _475;
    float _483 = fma(_439, _479, _477);
    float _485 = fma(_445, _479, _481);
    float _487 = _473 * _431;
    float _489 = _443 * _475;
    float _491 = fma(_451, _487, _483);
    float _493 = fma(_435, _479, _489);
    float _495 = fma(_453, _487, _485);
    float _497 = in.m_53.x;
    float _499 = gl_FragCoord.w;
    float _501 = _497 * _499;
    float _503 = _491 * _491;
    float _505 = fma(_461, _487, _493);
    float _507 = fma(_495, _495, _503);
    float _509 = fma(_505, _505, _507);
    float _511 = rsqrt(_509);
    float _513 = _495 * _511;
    float _515 = _491 * _511;
    float _517 = _505 * _511;
    float _519 = abs(_513);
    float _521 = abs(_515);
    float _523 = precise::max(_519, _521);
    float _525 = abs(_517);
    float _527 = precise::max(_525, _523);
    float _529 = _88 * _501;
    float _531 = 1.0 / _527;
    float _533 = precise::min(_529, 1.0);
    float _535 = _513 * _531;
    float _537 = _515 * _531;
    float _539 = -_531;
    float _541 = _517 * _539;
    float3 _1397 = float3(_535, _537, _541);
    float3 _545 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1397, float3(0.0), isnan(_1397)), level(_533)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1397, float3(0.0), isnan(_1397)), level(_533)).xyz;
    float _547 = _545.x;
    float _549 = _545.y;
    float _551 = _545.z;
    float _553 = in.m_61.y;
    float _555 = gl_FragCoord.w;
    float _557 = _553 * _555;
    float _559 = in.m_63.y;
    float _561 = gl_FragCoord.w;
    float _563 = _559 * _561;
    float _565 = in.m_61.z;
    float _567 = gl_FragCoord.w;
    float _569 = _565 * _567;
    float _571 = in.m_61.x;
    float _573 = gl_FragCoord.w;
    float _575 = _571 * _573;
    float _577 = in.m_63.z;
    float _579 = gl_FragCoord.w;
    float _581 = _577 * _579;
    float _583 = in.m_63.x;
    float _585 = gl_FragCoord.w;
    float _587 = _583 * _585;
    float _589 = in.m_65.x;
    float _591 = gl_FragCoord.w;
    float _593 = _589 * _591;
    float _595 = in.m_65.w;
    float _597 = gl_FragCoord.w;
    float _599 = _595 * _597;
    float _601 = in.m_65.y;
    float _603 = gl_FragCoord.w;
    float _605 = _601 * _603;
    float _607 = in.m_65.z;
    float _609 = gl_FragCoord.w;
    float _611 = _607 * _609;
    float _613 = _88 * _557;
    float _615 = _88 * _569;
    float _617 = _88 * _575;
    float _619 = fma(_549, 0.20999999344348907470703125, _613);
    float _621 = _88 * _563;
    float _623 = fma(_551, 0.20999999344348907470703125, _615);
    float _625 = fma(_547, 0.20999999344348907470703125, _617);
    float _627 = _88 * _581;
    bool _629 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _631 = _88 * _587;
    float _633 = _619 + _621;
    float _635 = _623 + _627;
    float _637 = 0.0 + _155;
    float _639 = precise::clamp(_637, 0.0, 1.0);
    float _641 = _625 + _631;
    float _643 = _88 * _599;
    float _645 = _279 * _635;
    float _647 = _88 * _593;
    float _649 = _275 * _641;
    float _651 = _277 * _633;
    float _653 = _88 * _605;
    float _655 = _88 * _611;
    float _657 = fma(_649, _643, _647);
    float _659 = _647;
    if (!_629)
    {
        _659 = _639;
    }
    float _661 = _659;
    float _663 = fma(_651, _643, _653);
    float _665 = fma(_645, _643, _655);
    bool _667 = !_629;
    float _669 = _661;
    if (!_667)
    {
        float _671 = in.m_67.w;
        float _673 = gl_FragCoord.w;
        float _675 = _671 * _673;
        float _677 = in.m_67.z;
        float _679 = gl_FragCoord.w;
        float _681 = _677 * _679;
        float _683 = _88 * _675;
        float _685 = _88 * _681;
        float _687 = 1.0 / _683;
        float _689 = _685 * _687;
        float _691 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _693 = fma(_689, (*spvDescriptorSet0.fp_c8)._m0[30].w, _691);
        float _695 = 1.0 / _693;
        float _697 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _699 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _701 = fma(_695, _697, _699);
        float _703 = _701 * 8.0;
        float _705 = precise::clamp(_703, 0.0, 1.0);
        float _707 = _639 * _705;
        _669 = _707;
    }
    float _709 = _669;
    float _711 = 0.0 + _709;
    float _713 = precise::clamp(_711, 0.0, 1.0);
    out.m_51.x = _657;
    out.m_51.y = _663;
    out.m_51.z = _665;
    out.m_51.w = _713;
    return out;
}

