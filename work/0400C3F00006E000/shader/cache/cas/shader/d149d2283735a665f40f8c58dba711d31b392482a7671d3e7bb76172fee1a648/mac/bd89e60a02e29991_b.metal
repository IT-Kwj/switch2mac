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
    constant _16* vp_c9 [[id(0)]];
    constant _16* vp_c10 [[id(1)]];
    constant _16* vp_c8 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c13 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    texture2d<float> vp_t_tcb_20 [[id(7)]];
    sampler vp_t_tcb_20Smplr [[id(8)]];
    texture2d<float> vp_t_tcb_24 [[id(9)]];
    sampler vp_t_tcb_24Smplr [[id(10)]];
    texture3d<float> vp_t_tcb_32 [[id(11)]];
    sampler vp_t_tcb_32Smplr [[id(12)]];
    texture3d<float> vp_t_tcb_30 [[id(13)]];
    sampler vp_t_tcb_30Smplr [[id(14)]];
    texture2d<float> vp_t_tcb_1C [[id(15)]];
    sampler vp_t_tcb_1CSmplr [[id(16)]];
    sampler vp_t_tcb_20Smplr_w [[id(17)]];
    sampler vp_t_tcb_24Smplr_w [[id(18)]];
    sampler vp_t_tcb_32Smplr_w [[id(19)]];
    sampler vp_t_tcb_30Smplr_w [[id(20)]];
    sampler vp_t_tcb_1CSmplr_w [[id(21)]];
    constant dm_border_t* dm_border [[id(22)]];
};

struct main0_out
{
    float4 m_70 [[user(locn0)]];
    float4 m_64 [[user(locn1)]];
    float4 m_57 [[user(locn2)]];
    float4 m_90 [[user(locn3)]];
    float4 m_55 [[user(locn4)]];
    float4 m_66 [[user(locn5)]];
    float4 m_82 [[user(locn6)]];
    float4 m_72 [[user(locn7)]];
    float4 m_76 [[user(locn8)]];
    float4 m_88 [[user(locn9)]];
    float4 m_78 [[user(locn10)]];
    float4 m_84 [[user(locn11)]];
    float4 m_86 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_80 [[attribute(0)]];
    float4 m_68 [[attribute(1)]];
    float4 m_50 [[attribute(2)]];
    float4 m_52 [[attribute(3)]];
    float4 m_62 [[attribute(4)]];
    float4 m_74 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2923 = false;
    bool _1984 = false;
    bool _207 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _104 = in.m_50.w;
    float _106 = in.m_52.w;
    float _108 = trunc(_104);
    int _111 = int(_108);
    float _113 = -_106;
    float _115 = _113 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_55.y = _115;
    bool _119 = _111 >= 1;
    float _121 = 0.0;
    float _123 = as_type<float>(_111);
    float _125 = _115;
    if (!_119)
    {
        _121 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _127 = _121;
    if (!_119)
    {
        out.m_57.x = 0.0;
    }
    int _129 = 0;
    if (!_119)
    {
        float _131 = _127 * 5.0;
        _129 = as_type<int>(_131);
    }
    int _133 = _129;
    int _135 = _133;
    if (!_119)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3240 = as_type<float>(_133);
        out.gl_Position.z = _3240;
    }
    if (!_119)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _137 = _106 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _139 = isnan(_106);
    bool _141 = _137 || _139;
    bool _143 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _145 = _141 || _143;
    float _147 = float(_111);
    bool _149 = _115 >= _147;
    bool _151 = !_145;
    bool _153 = _149 || _151;
    if (_153)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _155 = _123;
    if (_153)
    {
        out.m_57.x = 0.0;
    }
    if (_153)
    {
        float _157 = _155 * 5.0;
        _135 = as_type<int>(_157);
    }
    int _159 = _135;
    if (_153)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3295 = as_type<float>(_159);
        out.gl_Position.z = _3295;
    }
    if (_153)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _161 = as_type<float>(int(gl_VertexIndex));
    float _163 = 1.0 / _147;
    bool _165 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _167 = _115 * _163;
    int _169 = as_type<int>(_161) & 1;
    bool _171 = _169 != 0;
    int _173 = as_type<int>(_161) & 2;
    bool _175 = _173 != 0;
    bool _177 = !_171;
    float _179 = _177 ? (-0.5) : 0.5;
    bool _181 = !_175;
    float _183 = _181 ? (-0.5) : 0.5;
    bool _185 = !_165;
    float _187 = _167;
    float _205;
    if (!_185)
    {
        float _189 = in.m_62.x;
        float _191 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _193 = _189 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _195 = fma(_193, (*spvDescriptorSet0.vp_c9)._m0[12].x, _115);
        float _197 = _195 * _191;
        float _199 = floor(_197);
        float _201 = -_199;
        float _203 = _197 + _201;
        _205 = _203;
        _207 = true;
    }
    else
    {
        _205 = _167;
    }
    _207 = false;
    float _209 = _205;
    float _211 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _213 = _209 + _211;
    float _215 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _217 = _209 + _215;
    float _219 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _221 = _209 + _219;
    float _223 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _225 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _223;
    float _227 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _229 = _227 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _231 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _233 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _231;
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _237 = _235 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _239 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _241 = isnan(_209);
    bool _243 = _239 || _241;
    bool _245 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _247 = _243 || _245;
    float _249 = float(_247);
    float _251 = 1.0 / _225;
    bool _253 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _255 = 1.0 / _229;
    float _257 = 1.0 / _233;
    float _259 = _213 * _251;
    float _261 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _263 = _209 + _261;
    float _265 = 1.0 / _237;
    float _267 = _217 * _255;
    bool _269 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _271 = isnan(_209);
    bool _273 = _269 || _271;
    bool _275 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _277 = _273 || _275;
    float _279 = float(_277);
    bool _281 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _283 = isnan(_209);
    bool _285 = _281 || _283;
    bool _287 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _289 = _285 || _287;
    float _291 = float(_289);
    float _293 = _221 * _257;
    float _295 = -_249;
    float _297 = _295 + 1.0;
    float _299 = -_279;
    float _301 = _299 + 1.0;
    float _303 = _279 * _297;
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _307 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _305;
    float _309 = _263 * _265;
    float _311 = _291 * _301;
    bool _313 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _315 = isnan(_209);
    bool _317 = _313 || _315;
    bool _319 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _321 = _317 || _319;
    float _323 = float(_321);
    float _325 = -_291;
    float _327 = _325 + 1.0;
    float _329 = fma(_307, _259, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _333 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _331;
    bool _335 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _337 = isnan(_209);
    bool _339 = _335 || _337;
    bool _341 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _343 = _339 || _341;
    float _345 = float(_343);
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _349 = _347 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _353 = _351 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _355 = fma(_333, _259, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _357 = _323 * _327;
    float _359 = -_323;
    float _361 = _359 + 1.0;
    float _363 = -_345;
    float _365 = _363 + 1.0;
    float _367 = fma(_353, _267, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _369 = fma(_349, _267, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _371 = _345 * _361;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _375 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _373;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _377;
    float _381 = _355 * _371;
    float _383 = _329 * _371;
    float _385 = fma(_375, _293, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _387 = fma(_379, _293, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _389 = fma(_365, (*spvDescriptorSet0.vp_c9)._m0[143].x, _381);
    float _391 = fma(_365, (*spvDescriptorSet0.vp_c9)._m0[143].y, _383);
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _395 = _393 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _399 = _397 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _401 = fma(_367, _357, _389);
    float _403 = fma(_369, _357, _391);
    float _405 = fma(_395, _309, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _407 = fma(_399, _309, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _409 = fma(_385, _311, _401);
    float _411 = fma(_387, _311, _403);
    float _413 = fma(_405, _303, _409);
    float _415 = fma(_407, _303, _411);
    float _417 = fma(_249, (*spvDescriptorSet0.vp_c9)._m0[147].x, _413);
    float _419 = fma(_249, (*spvDescriptorSet0.vp_c9)._m0[147].y, _415);
    bool _421 = !_253;
    if (!_421)
    {
        float _423 = in.m_62.x;
        float _425 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _427 = _423 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _429 = fma(_427, (*spvDescriptorSet0.vp_c9)._m0[11].y, _115);
        float _431 = _429 * _425;
        float _433 = floor(_431);
        float _435 = -_433;
        float _437 = _431 + _435;
        _187 = _437;
    }
    float _439 = _187;
    float _441 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _443 = int(_441);
    bool _445 = _439 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _447 = isnan(_439);
    bool _449 = _445 || _447;
    bool _451 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _453 = _449 || _451;
    float _455 = float(_453);
    float _457 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _459 = int(_457);
    float _461 = float(_443);
    float _463 = 1.0 / _461;
    float _465 = float(uint(_459));
    int _467 = ~_459;
    int _469 = _467 + 1;
    bool _471 = _459 == 0;
    float _473 = 1.0 / _465;
    int _475 = ~_459;
    int _477 = _475 + 1;
    int _479 = ~_459;
    int _481 = _479 + 1;
    float _483 = _463 * _115;
    float _485 = trunc(_483);
    int _487 = int(_485);
    int _489 = as_type<int>(_473) + (-2);
    float _491 = float(uint(_487));
    float _493 = float(_487);
    float _495 = as_type<float>(_489) * _491;
    int _497 = ~_459;
    int _499 = _497 + 1;
    float _501 = trunc(_495);
    float _503 = precise::max(_501, 0.0);
    uint _506 = uint(_503);
    int _508 = _499 * int(_506);
    int _510 = _508 + _487;
    float _512 = in.m_62.x;
    float _514 = in.m_62.y;
    float _516 = in.m_62.z;
    float _518 = in.m_62.w;
    float _520 = float(uint(_510));
    float _522 = as_type<float>(_489) * _520;
    int _524 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _526 = _524 != 0;
    float _528 = trunc(_522);
    float _530 = precise::max(_528, 0.0);
    uint _532 = uint(_530);
    bool _534 = !_526;
    float _536 = _534 ? 7.345489978790283203125 : 1.0;
    float _538 = _536 * _512;
    float _540 = floor(_538);
    int _542 = int(_506) + int(_532);
    float _544 = float(_459);
    int _546 = _469 * _542;
    int _548 = _546 + _487;
    bool _550 = _493 >= _544;
    bool _552 = isnan(_493);
    bool _554 = _550 || _552;
    bool _556 = isnan(_544);
    bool _558 = _554 || _556;
    float _560 = float(_558);
    bool _562 = uint(_548) >= uint(_459);
    float _564 = trunc(_560);
    int _566 = int(_564);
    bool _568 = !_562;
    int _570 = _568 ? 0 : (-1);
    float _572 = -_540;
    float _574 = _538 + _572;
    int _576 = ~_542;
    int _578 = _576 + _570;
    int _580 = _578 + 1;
    float _582 = _574 * _544;
    float _584 = _544 * _115;
    int _586 = _459 * _580;
    int _588 = _586 + _487;
    float _590 = _584 * _163;
    float _592 = trunc(_582);
    int _594 = int(_592);
    int _596 = ~_566;
    int _598 = _596 + 1;
    int _600 = _598 + 1;
    bool _602 = !_471;
    int _604 = _602 ? _588 : (-1);
    float _606 = trunc(_590);
    int _608 = int(_606);
    int _610 = _604 * _600;
    int _612 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _614 = _612 != 0;
    int _616 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _618 = _616 != 0;
    int _620 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _622 = _620 != 0;
    int _624 = _459 + (-1);
    int _626 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _628 = _626 != 0;
    bool _630 = !_618;
    int _632 = _630 ? 0 : 1;
    int _634 = _566 * _624;
    int _636 = _634 + _610;
    bool _638 = !_614;
    int _640 = _638 ? 0 : 1;
    bool _642 = !_628;
    int _644 = _642 ? 0 : 1;
    int _646 = abs(_632);
    int _648 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _650 = _648 != 0;
    bool _652 = !_622;
    int _654 = _652 ? 0 : 1;
    int _656 = _636 * _646;
    int _658 = abs(_640);
    int _660 = abs(_644);
    bool _662 = !_650;
    int _664 = _662 ? 0 : 1;
    int _666 = abs(_654);
    int _668 = _594 * _660;
    int _670 = _668 + _487;
    int _672 = abs(_664);
    int _674 = _608 * _658;
    int _676 = _674 + _656;
    int _678 = ~_459;
    int _680 = _678 + 1;
    int _682 = _670 * _666;
    int _684 = _682 + _676;
    int _686 = ~_459;
    int _688 = _686 + 1;
    int _690 = _594 * _672;
    int _692 = _690 + _684;
    bool _694 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _696 = isnan(0.0);
    bool _698 = _694 || _696;
    bool _700 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _702 = _698 || _700;
    float _704 = float(uint(_692));
    float _706 = as_type<float>(_489) * _704;
    float _708 = trunc(_706);
    float _710 = precise::max(_708, 0.0);
    uint _712 = uint(_710);
    float _714 = _512 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _716 = _688 * int(_712);
    int _718 = _716 + _692;
    float _720 = float(uint(_718));
    float _722 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _724 = log2(_722);
    float _726 = as_type<float>(_489) * _720;
    float _728 = trunc(_726);
    float _730 = precise::max(_728, 0.0);
    uint _732 = uint(_730);
    float _734 = _724 * _115;
    int _736 = int(_712) + int(_732);
    float _738 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _740 = exp2(_734);
    float _742 = _512 * 2.0;
    int _744 = _680 * _736;
    int _746 = _744 + _692;
    float _748 = -_738;
    float _750 = fma(_714, 2.0, _748);
    float _752 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _754 = _514 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _756 = floor(_742);
    bool _758 = uint(_746) >= uint(_459);
    float _760 = fma(_754, -2.0, _752);
    bool _762 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _764 = isnan(1.0);
    bool _766 = _762 || _764;
    bool _768 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _770 = _766 || _768;
    float _772 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _774 = 1.0 + _772;
    bool _776 = !_758;
    int _778 = _776 ? 0 : (-1);
    float _780 = -_115;
    float _782 = fma(_780, (*spvDescriptorSet0.vp_c9)._m0[76].x, _750);
    float _784 = 1.0 / _774;
    int _786 = ~_736;
    int _788 = _786 + _778;
    int _790 = _788 + 1;
    float _792 = -_740;
    float _794 = _792 + 1.0;
    int _796 = _459 * _790;
    int _798 = _796 + _692;
    float _800 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _802 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _804 = _702 ? _794 : 0.0;
    float _806 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[76].y, _760);
    bool _808 = !_471;
    int _810 = _808 ? _798 : (-1);
    float _812 = fma(_514, (*spvDescriptorSet0.vp_c9)._m0[78].w, _800);
    float _814 = float(uint(_670));
    float _816 = fma(_512, (*spvDescriptorSet0.vp_c9)._m0[78].z, _802);
    int _818 = _810 & 3;
    bool _820 = _818 != 0;
    float _822 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[77].w, _812);
    int _824 = _810 & 3;
    bool _826 = _824 != 0;
    float _828 = as_type<float>(_489) * _814;
    int _830 = _820 ? 0 : 1;
    float _832 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[77].z, _816);
    bool _834 = _756 > 0.0;
    if (_770)
    {
        float _836 = _804 * _784;
        _125 = _836;
    }
    float _838 = _125;
    bool _840 = uint(_824) > 1u;
    float _842 = trunc(_828);
    float _844 = precise::max(_842, 0.0);
    uint _846 = uint(_844);
    bool _848 = _824 != 3;
    float _850 = -_832;
    float _852 = _850 + 1.0;
    bool _854 = _756 >= 0.0;
    bool _856 = isnan(_756);
    bool _858 = _854 || _856;
    bool _860 = isnan(0.0);
    bool _862 = _858 || _860;
    float _864 = -_822;
    float _866 = _864 + 1.0;
    bool _868 = uint(_824) >= 2u;
    int _870 = _862 ? 0 : 1;
    int _872 = _868 ? 0 : 1;
    bool _874 = _518 > 0.5;
    float _876 = _514 * 2.0;
    int _878 = ~_870;
    int _880 = _878 + 1;
    int _882 = _880 + 1;
    int _884 = ~_830;
    int _886 = _884 + 1;
    int _888 = _886 + 1;
    float _890 = floor(_876);
    int _892 = ~_872;
    int _894 = _892 + 1;
    int _896 = _894 + 1;
    int _898 = _882;
    int _900 = _888;
    int _902 = _896;
    if (!_834)
    {
        int _904 = ~_870;
        int _906 = _904 + 1;
        _898 = _906;
    }
    int _908 = _898;
    if (!_840)
    {
        int _910 = ~_830;
        int _912 = _910 + 1;
        _900 = _912;
    }
    int _914 = _900;
    if (_848)
    {
        int _916 = ~_872;
        int _918 = _916 + 1;
        _902 = _918;
    }
    int _920 = _902;
    float _922 = in.m_50.x;
    float _924 = in.m_50.y;
    float _926 = in.m_50.z;
    bool _928 = _512 > 0.5;
    int _930 = _477 * int(_846);
    int _932 = _930 + _670;
    int _934 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _936 = _934 != 0;
    float _938 = -_179;
    int _940 = _928 ? as_type<int>(_938) : as_type<int>(_179);
    bool _942 = _514 > 0.5;
    bool _944 = !_936;
    float _946 = _944 ? _179 : as_type<float>(_940);
    float _948 = float(uint(_932));
    float _950 = -_183;
    int _952 = _942 ? as_type<int>(_950) : as_type<int>(_183);
    float _954 = _946 + 0.5;
    bool _956 = _890 >= 0.0;
    bool _958 = isnan(_890);
    bool _960 = _956 || _958;
    bool _962 = isnan(0.0);
    bool _964 = _960 || _962;
    float _966 = as_type<float>(_489) * _948;
    float _968 = fma(_954, (*spvDescriptorSet0.vp_c9)._m0[80].x, _782);
    int _970 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _972 = _970 != 0;
    float _974 = trunc(_966);
    float _976 = precise::max(_974, 0.0);
    uint _978 = uint(_976);
    int _980 = _964 ? 0 : 1;
    float _982 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _984 = _982 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _986 = _924 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _988 = _890 > 0.0;
    float _990 = _924 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _992 = !_972;
    int _994 = _992 ? 0 : 1;
    float _996 = _924 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _998 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1000 = _998 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    int _1002 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1004 = _1002 != 0;
    float _1006 = 1.0 / _984;
    int _1008 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1010 = _1008 != 0;
    float _1012 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _1014 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1016 = _1014 != 0;
    float _1018 = fma(_922, (*spvDescriptorSet0.vp_c10)._m0[4].x, _986);
    float _1020 = _1012 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1022 = 1.0 / _1000;
    float _1024 = fma(_922, (*spvDescriptorSet0.vp_c10)._m0[5].x, _990);
    float _1026 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1028 = fma(_922, (*spvDescriptorSet0.vp_c10)._m0[6].x, _996);
    float _1030 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1032 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1034 = _1026 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1036 = int(_846) + int(_978);
    float _1038 = _1030 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1040 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1042 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1040;
    float _1044 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1046 = _1044 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1048 = _514 + _516;
    out.m_64.x = _1020;
    out.m_64.y = _1034;
    out.m_64.z = _1038;
    out.m_64.w = _1032;
    int _1050 = _481 * _1036;
    int _1052 = _1050 + _670;
    int _1054 = ~_980;
    int _1056 = _1054 + 1;
    int _1058 = _1056 + 1;
    float _1060 = _1046 * _1022;
    int _1062 = _1058;
    if (!_988)
    {
        int _1064 = ~_980;
        int _1066 = _1064 + 1;
        _1062 = _1066;
    }
    int _1068 = _1062;
    float _1070 = _516 * 2.0;
    bool _1072 = !_1004;
    float _1074 = _1072 ? _183 : as_type<float>(_952);
    float _1076 = _1048 + (-1.0);
    bool _1078 = uint(_1052) >= uint(_459);
    float _1080 = _514 + _512;
    float _1082 = _1042 * _1006;
    bool _1084 = !_1078;
    int _1086 = _1084 ? 0 : (-1);
    float _1088 = _1080 + (-1.0);
    int _1090 = _810 >> 31;
    float _1092 = floor(_1070);
    float _1094 = fma(_1076, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1096 = _1090 & 3;
    float _1098 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1100 = _439 + _1098;
    bool _1102 = !_826;
    int _1104 = _1102 ? 0 : 1;
    float _1106 = fma(_926, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1018);
    int _1108 = _810 + _1096;
    float _1110 = fma(_1060, _1100, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _1112 = _439 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1114 = isnan(_439);
    bool _1116 = _1112 || _1114;
    bool _1118 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1120 = _1116 || _1118;
    float _1122 = float(_1120);
    float _1124 = fma(_1088, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1126 = _1108 >> 2;
    float _1128 = fma(_926, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1024);
    int _1130 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1132 = _1130 != 0;
    int _1134 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1136 = _1134 != 0;
    int _1138 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1140 = _1138 != 0;
    float _1142 = -_1122;
    float _1144 = _1142 + 1.0;
    bool _1146 = _439 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1148 = isnan(_439);
    bool _1150 = _1146 || _1148;
    bool _1152 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1154 = _1150 || _1152;
    float _1156 = float(_1154);
    float _1158 = _1074 + (-0.5);
    int _1160 = _1126 << 4;
    int _1162 = _1160 + 368;
    float _1164 = _514 + (-0.5);
    bool _1166 = !_1136;
    int _1168 = _1166 ? 0 : 1;
    float _1170 = _1156 * _1144;
    float _1172 = -_1156;
    float _1174 = _1172 + 1.0;
    bool _1176 = !_1132;
    int _1178 = _1176 ? 0 : 1;
    uint _1180 = uint(int(uint(_1162) >> uint(2)));
    uint _1182 = uint(int(uint(int(_1180)) >> uint(2)));
    int _1184 = int(_1180) & 3;
    float _1186 = (*spvDescriptorSet0.vp_c9)._m0[int(_1182)][_1184];
    int _1188 = int(_1180) + 1;
    uint _1190 = uint(int(uint(_1188) >> uint(2)));
    int _1192 = _1188 & 3;
    float _1194 = (*spvDescriptorSet0.vp_c9)._m0[int(_1190)][_1192];
    bool _1196 = _1092 > 0.0;
    float _1198 = -_1158;
    float _1200 = -_806;
    float _1202 = fma(_1198, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1200);
    bool _1204 = _1092 >= 0.0;
    bool _1206 = isnan(_1092);
    bool _1208 = _1204 || _1206;
    bool _1210 = isnan(0.0);
    bool _1212 = _1208 || _1210;
    float _1214 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1216 = _439 + _1214;
    float _1218 = _455 * _1174;
    float _1220 = -_455;
    float _1222 = _1220 + 1.0;
    float _1224 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _1226 = _1162 + 8;
    uint _1228 = uint(int(uint(_1226) >> uint(2)));
    uint _1230 = uint(int(uint(int(_1228)) >> uint(2)));
    int _1232 = int(_1228) & 3;
    float _1234 = (*spvDescriptorSet0.vp_c9)._m0[int(_1230)][_1232];
    int _1236 = int(_1228) + 1;
    uint _1238 = uint(int(uint(_1236) >> uint(2)));
    int _1240 = _1236 & 3;
    float _1242 = (*spvDescriptorSet0.vp_c9)._m0[int(_1238)][_1240];
    float _1244 = fma(_1082, _1216, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1246 = fma(_926, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1028);
    int _1248 = _1212 ? 0 : 1;
    float _1250 = fma(_1074, _866, _1202);
    float _1252 = _1244 * _1218;
    bool _1254 = _516 > 0.5;
    float _1256 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _1258 = ~_1248;
    int _1260 = _1258 + 1;
    int _1262 = _1260 + 1;
    float _1264 = fma(_1222, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1252);
    int _1266 = _1262;
    if (!_1196)
    {
        int _1268 = ~_1248;
        int _1270 = _1268 + 1;
        _1266 = _1270;
    }
    int _1272 = _1266;
    float _1274 = -_179;
    int _1276 = _1254 ? as_type<int>(_1274) : as_type<int>(_179);
    float _1278 = fma(_1110, _1170, _1264);
    float _1280 = -_183;
    int _1282 = _874 ? as_type<int>(_1280) : as_type<int>(_183);
    float _1284 = -_852;
    float _1286 = fma(_946, _1284, _968);
    int _1288 = abs(_1168);
    bool _1290 = !_1010;
    float _1292 = _1290 ? _179 : as_type<float>(_1276);
    bool _1294 = !_1016;
    float _1296 = _1294 ? _183 : as_type<float>(_1282);
    float _1298 = float(_908);
    float _1300 = _1292 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1302 = float(_1288);
    float _1304 = _1296 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _1306 = ~_1036;
    int _1308 = _1306 + _1086;
    int _1310 = _1308 + 1;
    float _1312 = _1300 * _1224;
    int _1314 = abs(_914);
    float _1316 = _1302 * _1298;
    float _1318 = _1304 * _1256;
    int _1320 = _459 * _1310;
    int _1322 = _1320 + _670;
    float _1324 = _1128 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1326 = abs(_1104);
    out.m_66.x = _1286;
    out.m_66.y = _1250;
    out.m_66.z = _1312;
    out.m_66.w = _1318;
    int _1328 = ~_1314;
    int _1330 = _1328 + 1;
    int _1332 = _1330 + 1;
    float _1334 = _1106 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1336 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1338 = _1324 + _1336;
    float _1340 = _1246 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1342 = fma(_1122, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1278);
    float _1344 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1346 = _1334 + _1344;
    int _1348 = _1332 * as_type<int>(_1194);
    int _1350 = abs(_920);
    float _1352 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1354 = _1340 + _1352;
    float _1356 = float(_1272);
    float _1358 = _1342 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1360 = _1338 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1362 = _512 + (-0.5);
    int _1364 = ~_1326;
    int _1366 = _1364 + 1;
    int _1368 = _1366 + 1;
    float _1370 = fma(_1346, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1360);
    bool _1372 = !_471;
    int _1374 = _1372 ? _1322 : (-1);
    float _1376 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _1378 = _824 != 3;
    int _1380 = _1368 * as_type<int>(_1186);
    int _1382 = _1380 + _1348;
    int _1384 = ~_1350;
    int _1386 = _1384 + 1;
    int _1388 = _1386 + 1;
    float _1390 = fma(_1354, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1370);
    bool _1392 = !_1378;
    int _1394 = _1392 ? 0 : (-1);
    float _1396 = _1376 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1398 = _1388 * as_type<int>(_1234);
    int _1400 = _1398 + _1382;
    int _1402 = abs(_1394);
    float _1404 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _1406 = _1390 >= 0.0;
    float _1408 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _1410 = abs(_1178);
    float _1412 = in.m_68.x;
    float _1414 = in.m_68.y;
    float _1416 = in.m_68.z;
    int _1418 = abs(_994);
    float _1420 = _1404 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1422 = ~_1402;
    int _1424 = _1422 + 1;
    int _1426 = _1424 + 1;
    float _1428 = _1408 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1430 = _1338 * _1338;
    int _1432 = ~_1418;
    int _1434 = _1432 + 1;
    int _1436 = _1434 + 1;
    int _1438 = _1426 * as_type<int>(_1242);
    int _1440 = _1438 + _1400;
    float _1442 = float(_1410);
    float _1444 = fma(_1346, _1346, _1430);
    out.m_70.x = _1396;
    out.m_70.y = _1428;
    out.m_70.z = _1420;
    out.m_70.w = _1358;
    int _1446 = _1440 * _1436;
    float _1448 = fma(_1354, _1354, _1444);
    float _1450 = _1442 * _1356;
    int _1452 = _1374 * _1418;
    int _1454 = _1452 + _1446;
    float _1456 = _1450;
    if (_1406)
    {
        out.m_57.x = 0.0;
    }
    float _1458 = _1450 * (-2.0);
    float _1460 = rsqrt(_1448);
    if (_1406)
    {
        _1456 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1462 = _1456;
    float _1464 = float(_1454);
    float _1466 = fma(_1458, _1412, _1412);
    float _1468 = fma(_1124, _1458, _1124);
    int _1470 = as_type<int>(_1462);
    if (_1406)
    {
        float _1472 = _1462 * 5.0;
        _1470 = as_type<int>(_1472);
    }
    int _1474 = _1470;
    bool _1476 = !_1140;
    int _1478 = _1476 ? 0 : 1;
    float _1480 = fma(_1362, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1466);
    out.m_72.x = _1464;
    int _1482 = abs(_1478);
    float _1484 = fma(_1468, _838, _1480);
    if (_1406)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5298 = as_type<float>(_1474);
        out.gl_Position.z = _5298;
    }
    float _1486 = _1338 * _1460;
    float _1488 = _1346 * _1460;
    if (_1406)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1490 = -_1486;
    float _1492 = fma(_1490, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1324);
    float _1494 = _1354 * _1460;
    float _1496 = -_1488;
    float _1498 = fma(_1496, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1334);
    float _1500 = _1316 * (-2.0);
    float _1502 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1504 = _1492 + _1502;
    float _1506 = -_1494;
    float _1508 = fma(_1506, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1340);
    float _1510 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1512 = _1498 + _1510;
    float _1514 = fma(_1500, _1414, _1414);
    float _1516 = _1504 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1518 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1520 = _1508 + _1518;
    float _1522 = float(_1068);
    float _1524 = fma(_1094, _1500, _1094);
    float _1526 = fma(_1512, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1516);
    float _1528 = float(_1482);
    float _1530 = -_1486;
    float _1532 = fma(_1530, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1338);
    float _1534 = fma(_1164, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1514);
    float _1536 = fma(_1520, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1526);
    float _1538 = -_1488;
    float _1540 = fma(_1538, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1346);
    float _1542 = _1528 * _1522;
    float _1544 = _1532 * _1532;
    float _1546 = fma(_1524, _838, _1534);
    bool _1548 = _1536 >= 0.0;
    float _1550 = in.m_74.x;
    float _1552 = in.m_74.y;
    float _1554 = fma(_1540, _1540, _1544);
    float _1556 = _1542 * (-2.0);
    float _1558 = -_1494;
    float _1560 = fma(_1558, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1354);
    float _1562 = _516 + _512;
    float _1564 = fma(_1556, _1416, _1416);
    float _1566 = fma(_1560, _1560, _1554);
    float _1568 = _1562 + (-1.0);
    float _1570 = _516 + (-0.5);
    float _1572 = _1484 * 0.15915493667125701904296875;
    float _1574 = _1546 * 0.15915493667125701904296875;
    float _1576 = fma(_1568, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1578 = _1560;
    int _1580 = as_type<int>(_1570);
    float _1582 = _1492;
    float _1584 = _1512;
    if (_1548)
    {
        _1578 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1586 = _1578;
    float _1588 = fma(_1570, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1564);
    float _1590 = _1572 * 6.283185482025146484375;
    float _1592 = sin(_1590);
    float _1594 = fma(_1576, _1556, _1576);
    if (_1548)
    {
        out.m_57.x = 0.0;
    }
    if (_1548)
    {
        float _1596 = _1586 * 5.0;
        _1580 = as_type<int>(_1596);
    }
    int _1598 = _1580;
    float _1600 = fma(_1594, _838, _1588);
    float _1602 = _1572 * 6.283185482025146484375;
    float _1604 = cos(_1602);
    if (_1548)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5505 = as_type<float>(_1598);
        out.gl_Position.z = _5505;
    }
    float _1606 = _419 * _1552;
    float _1608 = _1600 * 0.15915493667125701904296875;
    float _1610 = _1574 * 6.283185482025146484375;
    float _1612 = sin(_1610);
    float _1614 = sqrt(_1566);
    float _1616 = _1574 * 6.283185482025146484375;
    float _1618 = cos(_1616);
    if (_1548)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1620 = _1606 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1622 = _1460 * _1614;
    float _1624 = _1608 * 6.283185482025146484375;
    float _1626 = cos(_1624);
    float _1628 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _183);
    float _1630 = _417 * _1550;
    float _1632 = _1620 * _1622;
    float _1634 = _1592 * _1612;
    float _1636 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _179);
    float _1638 = _1604 * _1612;
    float _1640 = _1628 * _1632;
    float _1642 = _1608 * 6.283185482025146484375;
    float _1644 = sin(_1642);
    float _1646 = _1630 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1648 = _1604 * _1618;
    float _1650 = _1592 * _1618;
    float _1652 = _1646 * _1622;
    float _1654 = _1604 * _1626;
    float _1656 = _1636 * _1652;
    float _1658 = _1618 * _1626;
    float _1660 = _1592 * _1626;
    float _1662 = _1654 * _1640;
    float _1664 = _1612 * _1626;
    float _1666 = _1622 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1668 = _1666 * 0.5;
    float _1670 = fma(_1644, _1648, _1634);
    float _1672 = -_1650;
    float _1674 = fma(_1644, _1638, _1672);
    float _1676 = -_1640;
    float _1678 = _1644 * _1676;
    float _1680 = _1660 * _1640;
    float _1682 = fma(_1670, _1656, _1662);
    float _1684 = -_1638;
    float _1686 = fma(_1644, _1650, _1684);
    float _1688 = fma(_1658, _1656, _1678);
    float _1690 = fma(_1644, _1634, _1648);
    float _1692 = fma(_1674, _1668, _1682);
    float _1694 = fma(_1686, _1656, _1680);
    float _1696 = fma(_1664, _1668, _1688);
    float _1698 = _1692 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1700 = _1692 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1702 = fma(_1690, _1668, _1694);
    float _1704 = _1692 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1706 = fma(_1696, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1698);
    float _1708 = fma(_1696, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1700);
    float _1710 = fma(_1696, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1704);
    float _1712 = fma(_1702, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1706);
    float _1714 = fma(_1702, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1708);
    float _1716 = fma(_1702, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1710);
    float _1718 = _1712 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1720 = _1714 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1722 = _1716 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1724 = _1334 + _1718;
    float _1726 = _1340 + _1720;
    float _1728 = _1324 + _1722;
    float _1730 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1732 = _1724 + _1730;
    float _1734 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1736 = _1726 + _1734;
    float _1738 = _1732 * _1732;
    float _1740 = _1736 * _1736;
    float _1742 = _1738 + _1740;
    float _1744 = sqrt(_1742);
    bool _1746 = _1744 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1748 = _1702;
    float _1750 = _1696;
    float _1752 = _1656;
    float _1754 = _1726;
    float _1756 = _1740;
    if (!_1746)
    {
        _1748 = _1738;
    }
    float _1758 = _1748;
    float _1760 = _1758;
    if (!_1746)
    {
        _1750 = _1724;
    }
    float _1762 = _1750;
    float _1764 = _1762;
    if (!_1746)
    {
        _1752 = _1728;
    }
    float _1766 = _1752;
    bool _1768 = !_1746;
    float _1770 = _1766;
    if (!_1768)
    {
        float _1772 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1774 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1776 = _1744 + _1774;
        float _1778 = rsqrt(_1742);
        float _1780 = _1776 * _1772;
        float _1782 = _1728 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1784 = _1780 * 0.15915493667125701904296875;
        float _1786 = _1784 * 6.283185482025146484375;
        float _1788 = sin(_1786);
        float _1790 = _1784 * 6.283185482025146484375;
        float _1792 = cos(_1790);
        float _1794 = fma(_1788, _1782, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1796 = _1778 * _1794;
        float _1798 = _1792 + (-1.0);
        float _1800 = fma(_1732, _1796, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1802 = fma(_1736, _1796, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1804 = _1798 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1806 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1808 = _1800 + _1806;
        float _1810 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1812 = _1802 + _1810;
        float _1814 = fma(_1728, _1792, _1804);
        float _1816 = _1808 * _1808;
        float _1818 = _1812 * _1812;
        _1764 = _1800;
        _1754 = _1802;
        _1770 = _1814;
        _1760 = _1816;
        _1756 = _1818;
    }
    float _1820 = _1764;
    float _1822 = _1754;
    float _1824 = _1770;
    float _1826 = _1760;
    float _1828 = _1756;
    float _1830 = fma(_1820, 6.2500002968590706586837768554688e-05, 0.5);
    float _1832 = fma(_1822, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _5870 = float2(_1830, _1832);
    float3 _1836 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_5870, float2(0.0), isnan(_5870)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_5870, float2(0.0), isnan(_5870)), level(0.0)).xyz;
    float _1838 = _1836.x;
    float _1840 = _1836.y;
    float _1842 = _1836.z;
    float _1844 = _1670 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1846 = _1670 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1848 = _1670 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1850 = _1674 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1852 = fma(_1658, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1844);
    float _1854 = fma(_1658, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1846);
    float _1856 = _1654 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1858 = _1654 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1860 = fma(_1658, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1848);
    float _1862 = _1654 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1864 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1866 = _1824 + _1864;
    float _1868 = _1674 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1870 = _1674 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1872 = -_1644;
    float _1874 = fma(_1872, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1856);
    float _1876 = -_1644;
    float _1878 = fma(_1876, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1858);
    float _1880 = -_1644;
    float _1882 = fma(_1880, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1862);
    float _1884 = fma(_1866, _1866, _1826);
    float _1886 = fma(_1664, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1850);
    float _1888 = fma(_1664, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1868);
    float _1890 = fma(_1664, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1870);
    float _1892 = fma(_1660, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1874);
    float _1894 = fma(_1660, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1878);
    float _1896 = _183 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1898 = fma(_1660, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1882);
    float _1900 = _1884 + _1828;
    float _1902 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1886);
    float _1904 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1888);
    float _1906 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1890);
    float _1908 = fma(_1686, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1852);
    float _1910 = fma(_1686, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1854);
    float _1912 = _1896 * _1892;
    float _1914 = _1896 * _1894;
    float _1916 = fma(_1686, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1860);
    float _1918 = _179 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1920 = _1896 * _1898;
    float _1922 = sqrt(_1900);
    float _1924 = fma(_1918, _1908, _1912);
    float _1926 = fma(_1918, _1910, _1914);
    float _1928 = fma(_1918, _1916, _1920);
    float _1930 = _1902 + _1924;
    float _1932 = _1904 + _1926;
    float _1934 = _1906 + _1928;
    out.m_76.x = _1930;
    out.m_76.y = _1932;
    out.m_76.z = _1934;
    bool _1936 = _1922 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1938 = isnan(_1922);
    bool _1940 = _1936 || _1938;
    bool _1942 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1944 = _1940 || _1942;
    float _1946 = _1928;
    float _1948 = _1922;
    if (!_1944)
    {
        _1946 = 1.0;
    }
    float _1950 = _1946;
    out.m_78.x = _1838;
    out.m_78.y = _1840;
    out.m_78.z = _1842;
    bool _1952 = !_1944;
    float _1954 = _1950;
    if (!_1952)
    {
        bool _1956 = _1922 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1958 = isnan(_1922);
        bool _1960 = _1956 || _1958;
        bool _1962 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1964 = _1960 || _1962;
        if (!_1964)
        {
            float _1966 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1968 = _1922 + _1966;
            float _1970 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1972 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1970;
            float _1974 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1976 = _1974 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1978 = 1.0 / _1972;
            float _1980 = _1968 * _1978;
            float _1982 = fma(_1980, _1976, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1954 = _1982;
            _1984 = true;
        }
        else
        {
            bool _1986 = _1922 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1988 = isnan(_1922);
            bool _1990 = _1986 || _1988;
            bool _1992 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1994 = _1990 || _1992;
            if (!_1994)
            {
                float _1996 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1998 = _1922 + _1996;
                float _2000 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2002 = _2000 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2004 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2006 = _2004 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2008 = 1.0 / _2002;
                float _2010 = _1998 * _2008;
                float _2012 = fma(_2010, _2006, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1954 = _2012;
                _1984 = true;
            }
            else
            {
                _1954 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1984 = false;
    float _2014 = _1954;
    float _2016 = _1492 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2018 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2020 = _1824 + _2018;
    float _2022 = fma(_1498, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2016);
    bool _2024 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2026 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2028 = _2024 || _2026;
    bool _2030 = isnan(0.5);
    bool _2032 = _2028 || _2030;
    bool _2034 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2036 = isnan(0.5);
    bool _2038 = _2034 || _2036;
    bool _2040 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2042 = _2038 || _2040;
    float _2044 = fma(_1508, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2022);
    float _2046 = _1492 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2048 = _2044 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2050 = fma(_1498, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2046);
    float _2052 = 1.0 / _2048;
    float _2054 = fma(_1508, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2050);
    if (_2042)
    {
        _1948 = 1.0;
    }
    float _2056 = _1948;
    float _2058 = _2054 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2060 = _2058 + _2048;
    float _2062 = _2060 * _2052;
    float _2064 = _2062 * 0.5;
    float _2066 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2068 = _1820 + _2066;
    float _2070 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2072 = fma(_2064, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2070);
    float _2074 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2076 = _1822 + _2074;
    float _2078 = fma(_2068, _2014, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2080 = fma(_2020, _2014, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2082 = 1.0 / _2072;
    float _2084 = fma(_2076, _2014, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2086 = -_1488;
    float _2088 = fma(_2086, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2078);
    float _2090 = -_1486;
    float _2092 = fma(_2090, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2080);
    float _2094 = -_1494;
    float _2096 = fma(_2094, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2084);
    float _2098 = _2092;
    float _2100 = _2088;
    float _2102 = _2096;
    float _2104 = _2082;
    float _2106 = _2056;
    if (!_2032)
    {
        float _2108 = _1504 * _1504;
        float _2110 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2112 = -_1340;
        float _2114 = _2112 + _2084;
        float _2116 = -_1324;
        float _2118 = _2116 + _2080;
        float _2120 = fma(_1512, _1512, _2108);
        float _2122 = fma(_1520, _1520, _2120);
        float _2124 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2126 = sqrt(_2122);
        float _2128 = 1.0 / _1622;
        float _2130 = _2124 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2132 = precise::min(_2126, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2134 = _2132 * _2110;
        float _2136 = _2134 * _2128;
        float _2138 = -_1334;
        float _2140 = _2138 + _2078;
        float _2142 = _2130 * _2136;
        float _2144 = _2114 * _2136;
        float _2146 = fma(_2118, _2142, _1492);
        float _2148 = fma(_2140, _2142, _1498);
        float _2150 = fma(_2130, _2144, _1508);
        _2098 = _2146;
        _2100 = _2148;
        _2102 = _2150;
    }
    float _2152 = _2098;
    float _2154 = _2100;
    float _2156 = _2102;
    if (_2042)
    {
        _1582 = 1.0;
    }
    float _2158 = _1582;
    float _2160 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2162 = _2082 * _2160;
    float _2164 = _2158;
    if (!_2042)
    {
        float _2166 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2168 = _2166 * 0.15915493667125701904296875;
        float _2170 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2172 = _2168 * 6.283185482025146484375;
        float _2174 = cos(_2172);
        float _2176 = _2170 * 0.15915493667125701904296875;
        float _2178 = _2168 * 6.283185482025146484375;
        float _2180 = sin(_2178);
        float _2182 = 1.0 / _2174;
        float _2184 = _2176 * 6.283185482025146484375;
        float _2186 = cos(_2184);
        float _2188 = _2180 * _2182;
        float _2190 = _2176 * 6.283185482025146484375;
        float _2192 = sin(_2190);
        float _2194 = _2186 * _2188;
        float _2196 = 1.0 / _2194;
        float _2198 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2200 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2198;
        float _2202 = 1.0 / _2200;
        float _2204 = _2192 * _2196;
        float _2206 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2208 = fma(_2162, _2204, _2206);
        float _2210 = _2208 * _2202;
        float _2212 = precise::clamp(_2210, 0.0, 1.0);
        _1584 = _2176;
        _2104 = _2168;
        _2106 = _2212;
    }
    float _2214 = _1584;
    float _2216 = _2104;
    float _2218 = _2106;
    float _2220 = _2214;
    float _2222 = _2216;
    if (!_2042)
    {
        float _2224 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2226 = _2224 * 0.15915493667125701904296875;
        float _2228 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2230 = _2226 * 6.283185482025146484375;
        float _2232 = cos(_2230);
        float _2234 = _2228 * 0.15915493667125701904296875;
        float _2236 = _2226 * 6.283185482025146484375;
        float _2238 = sin(_2236);
        float _2240 = 1.0 / _2232;
        float _2242 = _2234 * 6.283185482025146484375;
        float _2244 = cos(_2242);
        float _2246 = _2238 * _2240;
        float _2248 = _2234 * 6.283185482025146484375;
        float _2250 = sin(_2248);
        float _2252 = _2244 * _2246;
        float _2254 = 1.0 / _2252;
        float _2256 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2258 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2256;
        float _2260 = 1.0 / _2258;
        float _2262 = _2250 * _2254;
        float _2264 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2266 = fma(_2162, _2262, _2264);
        float _2268 = _2266 * _2260;
        float _2270 = precise::clamp(_2268, 0.0, 1.0);
        float _2272 = -_2270;
        float _2274 = _2272 + 1.0;
        _2220 = _2232;
        _2164 = _2274;
    }
    float _2276 = _2220;
    float _2278 = _2164;
    float _2280 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2282 = _2152 + _2280;
    float _2284 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2286 = _2154 + _2284;
    float _2288 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2290 = _2156 + _2288;
    float _2292 = _2282 * _2282;
    float _2294 = fma(_2286, _2286, _2292);
    float _2296 = fma(_2290, _2290, _2294);
    float _2298 = rsqrt(_2296);
    float _2300 = _2298 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2302 = _2286 * _2300;
    float _2304 = _2290 * _2300;
    float _2306 = _2302 * _2302;
    float _2308 = _2304 * _2304;
    float _2310 = _2306 + _2308;
    float _2312 = sqrt(_2310);
    bool _2314 = _2312 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2316 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2318 = _2312 + _2316;
    float _2320 = _1324;
    float _2322 = _2276;
    float _2324 = _2318;
    float _2326 = _2282;
    float _2328 = _2300;
    float _2330 = _2310;
    if (_2314)
    {
        float _2332 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2320 = _2332;
    }
    float _2334 = _2320;
    if (_2314)
    {
        float _2336 = rsqrt(_2310);
        _2322 = _2336;
    }
    float _2338 = _2322;
    float _2340 = _2338;
    if (_2314)
    {
        float _2342 = _2318 * _2334;
        _2324 = _2342;
    }
    float _2344 = _2324;
    float _2346 = sqrt(_2296);
    if (_2314)
    {
        float _2348 = _2344 * 0.15915493667125701904296875;
        _2222 = _2348;
    }
    float _2350 = _2222;
    float _2352 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2354 = _2290;
    float _2356 = _2350;
    if (_2314)
    {
        float _2358 = _2350 * 6.283185482025146484375;
        float _2360 = sin(_2358);
        _2354 = _2360;
    }
    float _2362 = _2354;
    float _2364 = precise::max(0.0, _2352);
    float _2366 = _2298;
    if (_2314)
    {
        float _2368 = _2350 * 6.283185482025146484375;
        float _2370 = cos(_2368);
        _2366 = _2370;
    }
    float _2372 = _2366;
    float _2374 = -_2300;
    float _2376 = -_2364;
    float _2378 = fma(_2282, _2374, _2376);
    float _2380 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_2314)
    {
        float _2382 = _2378 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2326 = _2382;
    }
    float _2384 = _2326;
    float _2386 = fma(_1498, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2388 = _2384;
    float _2390 = _2362;
    if (_2314)
    {
        float _2392 = fma(_2362, _2384, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2388 = _2392;
    }
    float _2394 = _2388;
    float _2396 = _2394;
    if (!_2314)
    {
        _2356 = _2378;
    }
    float _2398 = _2356;
    float _2400 = _2398;
    if (!_2314)
    {
        _2390 = _2304;
    }
    float _2402 = _2390;
    float _2404 = _2402;
    if (_2314)
    {
        float _2406 = _2338 * _2394;
        _2328 = _2406;
    }
    float _2408 = _2328;
    if (!_2314)
    {
        _2340 = _2302;
    }
    float _2410 = _2340;
    float _2412 = _2410;
    if (_2314)
    {
        float _2414 = _2372 + (-1.0);
        _2380 = _2414;
    }
    float _2416 = _2380;
    float _2418 = _2416;
    if (_2314)
    {
        float _2420 = _2302 * _2408;
        _2412 = _2420;
    }
    float _2422 = _2412;
    if (!_2314)
    {
        _2396 = _2306;
    }
    float _2424 = _2396;
    float _2426 = _2424;
    if (_2314)
    {
        float _2428 = _2304 * _2408;
        _2404 = _2428;
    }
    float _2430 = _2404;
    if (_2314)
    {
        float _2432 = _2416 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2330 = _2432;
    }
    float _2434 = _2330;
    if (_2314)
    {
        float _2436 = _2422 * _2422;
        _2426 = _2436;
    }
    float _2438 = _2426;
    if (!_2314)
    {
        _2418 = _2308;
    }
    float _2440 = _2418;
    float _2442 = _2440;
    if (_2314)
    {
        float _2444 = _2430 * _2430;
        _2442 = _2444;
    }
    float _2446 = _2442;
    if (_2314)
    {
        float _2448 = fma(_2378, _2372, _2434);
        _2400 = _2448;
    }
    float _2450 = _2400;
    float _2452 = _2152 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2454 = floor(_2386);
    float _2456 = fma(_2450, _2450, _2438);
    float _2458 = fma(_2154, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2452);
    float _2460 = _2456 + _2446;
    float _2462 = fma(_2156, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2458);
    float _2464 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2466 = fma(_2346, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2464);
    float _2468 = precise::clamp(_2466, 0.0, 1.0);
    float _2470 = rsqrt(_2460);
    float _2472 = _2462 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2474 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2476 = -_2468;
    float _2478 = _2476 + 1.0;
    float _2480 = _2472 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2482 = fma(_1508, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2484 = _2152 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2486 = _2152 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2488 = -_2480;
    float _2490 = fma(_2488, _2474, 1.0);
    float _2492 = _2152 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2494 = abs(_2478);
    float _2496 = log2(_2494);
    float _2498 = fma(_2154, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2486);
    float _2500 = fma(_2154, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2484);
    float _2502 = fma(_2154, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2492);
    float _2504 = _2470 * _2422;
    float _2506 = _2470 * _2450;
    float _2508 = _2470 * _2430;
    float _2510 = fma(_2156, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2498);
    float _2512 = _2504 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2514 = fma(_2156, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2502);
    float _2516 = floor(_2482);
    float _2518 = _2510 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2520 = -_2512;
    float _2522 = fma(_2506, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2520);
    float _2524 = _2514 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2526 = -_2454;
    float _2528 = _2386 + _2526;
    float _2530 = _2518 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2532 = -_2508;
    float _2534 = fma(_2532, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2522);
    float _2536 = fma(_2156, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2500);
    float _2538 = _2496 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2540 = fma(_2524, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2530);
    float _2542 = fma(_2534, -0.5, 0.5);
    float _2544 = _2536 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2546 = exp2(_2538);
    float _2548 = fma(_2472, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2540);
    float _2550 = _2518 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2552 = _2518 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2554 = fma(_2534, 0.5, 0.5);
    float _2556 = fma(_2544, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2548);
    float _2558 = fma(_2524, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2550);
    float _2560 = fma(_2524, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2552);
    float _2562 = log2(_2490);
    float _2564 = -_2516;
    float _2566 = _2482 + _2564;
    float _2568 = fma(_2554, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2570 = fma(_2472, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2558);
    float _2572 = fma(_2472, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2560);
    float _2574 = _2506 + 1.0;
    float _2576 = fma(_2554, _2568, -0.212114393711090087890625);
    float _2578 = fma(_2544, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2570);
    float _2580 = 1.0 / _2556;
    float _2582 = fma(_2544, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2572);
    float _2584 = -_2506;
    float _2586 = fma(_2546, _2574, _2584);
    float _2588 = fma(_2554, _2576, 1.570728778839111328125);
    float _2590 = sqrt(_2542);
    float _2592 = _2562 * 0.693147182464599609375;
    float2 _7127 = float2(_2528, _2566);
    float _2594 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7127, float2(0.0), isnan(_7127)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7127, float2(0.0), isnan(_7127)), level(0.0)).x;
    float _2596 = fma(_2586, 0.5, 0.5);
    float _2598 = _2592 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2600 = _2578 * _2580;
    float _2602 = _2582 * _2580;
    float _2604 = fma(_2600, 0.5, 0.5);
    float _2606 = fma(_2602, -0.5, 0.5);
    float _2608 = _2590 * 0.636619746685028076171875;
    float3 _7155 = float3(_2604, _2606, _2598);
    float _2610 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7155, float3(0.0), isnan(_7155)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7155, float3(0.0), isnan(_7155)), level(0.0)).x;
    float _2612 = -_2588;
    float _2614 = fma(_2608, _2612, 1.0);
    float3 _7171 = float3(_2604, _2606, _2598);
    float4 _2617 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7171, float3(0.0), isnan(_7171)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7171, float3(0.0), isnan(_7171)), level(0.0)).xyzw;
    float _2619 = _2617.x;
    float _2621 = _2617.y;
    float _2623 = _2617.z;
    float _2625 = _2617.w;
    float2 _7187 = float2(_2614, _2596);
    float3 _2627 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7187, float2(0.0), isnan(_7187)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7187, float2(0.0), isnan(_7187)), level(0.0)).xyz;
    float _2629 = _2627.x;
    float _2631 = _2627.y;
    float _2633 = _2627.z;
    float _2635 = _1932 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2637 = _1932 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2639 = _1932 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2641 = abs(_2162);
    float _2643 = log2(_2641);
    float _2645 = fma(_1930, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2635);
    float _2647 = fma(_1930, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2637);
    float _2649 = fma(_1930, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2639);
    float _2651 = _2518 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2653 = fma(_1934, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2645);
    float _2655 = fma(_1934, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2647);
    float _2657 = fma(_1934, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2649);
    float _2659 = _2653 * _2653;
    float _2661 = fma(_2524, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2651);
    out.m_72.x = _1464;
    float _2663 = fma(_2655, _2655, _2659);
    float _2665 = fma(_2472, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2661);
    float _2667 = _2643 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2669 = fma(_2657, _2657, _2663);
    float _2671 = fma(_2544, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2665);
    float _2673 = exp2(_2667);
    bool _2675 = _2162 <= 8000.0;
    bool _2677 = isnan(_2162);
    bool _2679 = _2675 || _2677;
    bool _2681 = isnan(8000.0);
    bool _2683 = _2679 || _2681;
    float _2685 = float(_2683);
    float _2687 = _2578 + _2556;
    out.gl_Position.x = _2578;
    out.gl_Position.y = _2582;
    out.gl_Position.z = _2671;
    out.gl_Position.w = _2556;
    float _2689 = _2687 * 0.5;
    float _2691 = rsqrt(_2669);
    float _2693 = fma(_2673, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2695 = precise::clamp(_2693, 0.0, 1.0);
    float _2697 = fma(_2695, -2.0, 3.0);
    float _2699 = _2695 * _2695;
    float _2701 = _2655 * _2691;
    float _2703 = _2653 * _2691;
    float _2705 = _2699 * _2697;
    float _2707 = fma(_2701, 0.5, 0.5);
    float _2709 = fma(_2703, -0.5, 0.5);
    float _2711 = -_2705;
    float _2713 = _2711 + 1.0;
    float _2715 = _2707;
    float _2717 = _2709;
    float _2719 = _1250;
    if (_1010)
    {
        float _2721 = -_2707;
        float _2723 = _1254 ? _2721 : _2707;
        _2715 = _2723;
    }
    float _2725 = _2715;
    float _2727 = fma(_2713, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2705);
    if (_1016)
    {
        float _2729 = -_2709;
        float _2731 = _874 ? _2729 : _2709;
        _2717 = _2731;
    }
    float _2733 = _2717;
    bool _2735 = _2346 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2737 = isnan(_2346);
    bool _2739 = _2735 || _2737;
    bool _2741 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2743 = _2739 || _2741;
    float _2745 = _2725 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2747 = _2685 * _2727;
    float _2749 = _2733 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2751 = _2745 * _1224;
    float _2753 = _2496 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2755 = _2749 * _1256;
    float _2757 = in.m_80.x;
    float _2759 = _2556 * 0.5;
    float _2761 = _2747 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2763 = exp2(_2753);
    float _2765 = _2671 + _2556;
    float _2767 = fma(_2582, -0.5, _2759);
    out.m_66.x = _1286;
    out.m_66.y = _1250;
    out.m_66.z = _2751;
    out.m_66.w = _2755;
    float _2769 = _2765 * 0.5;
    out.m_82.x = _2689;
    out.m_82.y = _2767;
    out.m_82.z = _2769;
    out.m_82.w = _2556;
    float _2771 = -_2763;
    float _2773 = _2771 + 1.0;
    float _2775 = _2755;
    float _2777 = _1286;
    if (!_2743)
    {
        _2775 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2779 = _2775;
    float _2781 = _2773 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2783 = _2779;
    float _2785 = _2779;
    if (!_2743)
    {
        _2777 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2787 = _2777;
    float _2789 = _2787;
    float _2791 = _2787;
    if (!_2743)
    {
        _2719 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2793 = _2719;
    float _2795 = -_2594;
    float _2797 = _2795 + 1.0;
    float _2799 = _2797 * _2761;
    float _2801 = precise::clamp(_2799, 0.0, 1.0);
    float _2803 = -_2801;
    float _2805 = fma(_2803, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2807 = -_2781;
    float _2809 = _2807 + 1.0;
    float _2811 = _2805 * _2757;
    float _2813 = _2781 * _2610;
    float _2815 = _2811 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2817 = _2811;
    float _2819 = _2793;
    float _2821 = _2793;
    if (!_2743)
    {
        _2817 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2823 = _2817;
    float _2825 = _2625 * _2813;
    float _2827 = _2625 * _2809;
    out.m_84.x = _2815;
    float _2829 = _2218 * _2278;
    float _2831 = _2633 * _2813;
    float _2833 = fma(_2629, _2825, _2619);
    float _2835 = fma(_2631, _2825, _2621);
    float _2837 = _2829 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2839 = fma(_2625, _2831, _2623);
    float _2841 = _2825;
    float _2843 = _2829;
    float _2845 = _2823;
    float _2847 = _2823;
    if (!_2743)
    {
        _2841 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2849 = _2841;
    float _2851 = _2849;
    float _2853 = _2849;
    if (!_2743)
    {
        _2843 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2855 = _2843;
    out.m_86.x = _2833;
    out.m_86.y = _2835;
    out.m_86.z = _2839;
    out.m_86.w = _2827;
    bool _2857 = !_2743;
    float _2859 = _2855;
    float _2861 = _2855;
    if (!_2857)
    {
        bool _2863 = _2346 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2865 = isnan(_2346);
        bool _2867 = _2863 || _2865;
        bool _2869 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2871 = _2867 || _2869;
        if (!_2871)
        {
            float _2873 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2875 = _2346 + _2873;
            float _2877 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2879 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2877;
            float _2881 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2883 = _2881 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2885 = 1.0 / _2879;
            float _2887 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2889 = _2887 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2891 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2893 = _2891 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2895 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2897 = _2895 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2899 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2901 = _2899 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2903 = _2875 * _2885;
            float _2905 = precise::clamp(_2903, 0.0, 1.0);
            float _2907 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2909 = _2907 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2911 = fma(_2905, _2883, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2913 = fma(_2905, _2909, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2915 = fma(_2905, _2889, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2917 = fma(_2905, _2893, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2919 = fma(_2905, _2897, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2921 = fma(_2905, _2901, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2791 = _2915;
            _2847 = _2919;
            _2785 = _2911;
            _2853 = _2917;
            _2821 = _2913;
            _2861 = _2921;
            _2923 = true;
        }
        else
        {
            bool _2925 = _2346 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2927 = isnan(_2346);
            bool _2929 = _2925 || _2927;
            bool _2931 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2933 = _2929 || _2931;
            if (!_2933)
            {
                _2783 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2935 = _2783;
            _2785 = _2935;
            if (!_2933)
            {
                _2789 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2937 = _2789;
            _2791 = _2937;
            if (!_2933)
            {
                _2819 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2939 = _2819;
            _2821 = _2939;
            if (!_2933)
            {
                _2851 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2941 = _2851;
            _2853 = _2941;
            if (!_2933)
            {
                _2845 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2943 = _2845;
            _2847 = _2943;
            if (!_2933)
            {
                _2859 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2945 = _2859;
            bool _2947 = !_2933;
            _2861 = _2945;
            if (!_2947)
            {
                bool _2949 = _2346 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2951 = isnan(_2346);
                bool _2953 = _2949 || _2951;
                bool _2955 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2957 = _2953 || _2955;
                if (!_2957)
                {
                    float _2959 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2961 = _2346 + _2959;
                    float _2963 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2965 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2963;
                    float _2967 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2969 = _2967 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2971 = 1.0 / _2965;
                    float _2973 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2975 = _2973 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2977 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2979 = _2977 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2981 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2983 = _2981 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2985 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2987 = _2985 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2989 = _2961 * _2971;
                    float _2991 = precise::clamp(_2989, 0.0, 1.0);
                    float _2993 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2995 = _2993 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2997 = fma(_2991, _2969, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2999 = fma(_2991, _2995, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3001 = fma(_2991, _2975, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3003 = fma(_2991, _2979, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3005 = fma(_2991, _2983, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3007 = fma(_2991, _2987, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2791 = _3001;
                    _2847 = _3005;
                    _2785 = _2997;
                    _2853 = _3003;
                    _2821 = _2999;
                    _2861 = _3007;
                    _2923 = true;
                }
                else
                {
                    _2791 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2847 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2785 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2853 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2821 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2861 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2923 = false;
    float _3009 = _2791;
    float _3011 = _2847;
    float _3013 = _2785;
    float _3015 = _2853;
    float _3017 = _2821;
    float _3019 = _2861;
    float _3021 = fma(_1932, -0.5, 0.5);
    float _3023 = precise::clamp(_3021, 0.0, 1.0);
    float _3025 = -_3009;
    float _3027 = _3025 + _3011;
    float _3029 = -_3013;
    float _3031 = _3029 + _3015;
    out.m_88.x = 0.0;
    float _3033 = fma(_3023, _3027, _3009);
    float _3035 = -_3017;
    float _3037 = _3035 + _3019;
    float _3039 = fma(_3023, _3031, _3013);
    float _3041 = _3033 * 0.586610972881317138671875;
    bool _3043 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3045 = fma(_3023, _3037, _3017);
    float _3047 = _2837 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3049 = fma(_3039, 0.298911988735198974609375, _3041);
    bool _3051 = _2218 > 0.0;
    bool _3053 = isnan(_2218);
    bool _3055 = _3051 || _3053;
    bool _3057 = isnan(0.0);
    bool _3059 = _3055 || _3057;
    float _3061 = fma(_3045, 0.114477999508380889892578125, _3049);
    out.m_57.x = _3047;
    bool _3063 = _2278 <= 0.0;
    bool _3065 = !_3059;
    bool _3067 = _3063 || _3065;
    float _3069 = -_3061;
    float _3071 = _3039 + _3069;
    float _3073 = -_3061;
    float _3075 = _3033 + _3073;
    float _3077 = -_3061;
    float _3079 = _3045 + _3077;
    float _3081 = fma(_3071, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3061);
    float _3083 = fma(_3075, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3061);
    float _3085 = fma(_3079, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3061);
    bool _3087 = !_3043;
    if (!_3087)
    {
        float _3089 = -_2152;
        float _3091 = _3089 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3093 = -_2154;
        float _3095 = _3093 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3097 = -_2156;
        float _3099 = _3097 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3101 = _3091 * _3091;
        float _3103 = fma(_3095, _3095, _3101);
        float _3105 = fma(_3099, _3099, _3103);
        float _3107 = sqrt(_3105);
        float _3109 = rsqrt(_3105);
        float _3111 = -_3107;
        float _3113 = _3111 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3115 = _3113 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3117 = precise::clamp(_3115, 0.0, 1.0);
        float _3119 = _3095 * _3109;
        float _3121 = _3091 * _3109;
        float _3123 = abs(_3117);
        float _3125 = log2(_3123);
        float _3127 = _3099 * _3109;
        float _3129 = _3119 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3131 = _1932 * _3121;
        float _3133 = -_3121;
        float _3135 = -_3129;
        float _3137 = fma(_3133, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3135);
        float _3139 = fma(_1930, _3119, _3131);
        float _3141 = -_3127;
        float _3143 = fma(_3141, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3137);
        float _3145 = fma(_1934, _3127, _3139);
        float _3147 = precise::clamp(_3145, 0.0, 1.0);
        float _3149 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3151 = _3143 + _3149;
        float _3153 = _3125 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3155 = _3151 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3157 = precise::clamp(_3155, 0.0, 1.0);
        float _3159 = exp2(_3153);
        float _3161 = _3159 * _3157;
        float _3163 = _3147 * _3161;
        float _3165 = _3163 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3167 = _3163 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3169 = _3163 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_88.x = _3165;
        out.m_88.y = _3167;
        out.m_88.z = _3169;
    }
    out.m_90.x = _3081;
    out.m_90.y = _3083;
    out.m_90.z = _3085;
    if (!_3067)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_57.x = 0.0;
    float _3171 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3171;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2923 = false;
    bool _1984 = false;
    bool _207 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _104 = in.m_50.w;
    float _106 = in.m_52.w;
    float _108 = trunc(_104);
    int _111 = int(_108);
    float _113 = -_106;
    float _115 = _113 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_55.y = _115;
    bool _119 = _111 >= 1;
    float _121 = 0.0;
    float _123 = as_type<float>(_111);
    float _125 = _115;
    if (!_119)
    {
        _121 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _127 = _121;
    if (!_119)
    {
        out.m_57.x = 0.0;
    }
    int _129 = 0;
    if (!_119)
    {
        float _131 = _127 * 5.0;
        _129 = as_type<int>(_131);
    }
    int _133 = _129;
    int _135 = _133;
    if (!_119)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3240 = as_type<float>(_133);
        out.gl_Position.z = _3240;
    }
    if (!_119)
    {
        return out;
    }
    bool _137 = _106 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _139 = isnan(_106);
    bool _141 = _137 || _139;
    bool _143 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _145 = _141 || _143;
    float _147 = float(_111);
    bool _149 = _115 >= _147;
    bool _151 = !_145;
    bool _153 = _149 || _151;
    if (_153)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _155 = _123;
    if (_153)
    {
        out.m_57.x = 0.0;
    }
    if (_153)
    {
        float _157 = _155 * 5.0;
        _135 = as_type<int>(_157);
    }
    int _159 = _135;
    if (_153)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3295 = as_type<float>(_159);
        out.gl_Position.z = _3295;
    }
    if (_153)
    {
        return out;
    }
    float _161 = as_type<float>(int(gl_VertexIndex));
    float _163 = 1.0 / _147;
    bool _165 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _167 = _115 * _163;
    int _169 = as_type<int>(_161) & 1;
    bool _171 = _169 != 0;
    int _173 = as_type<int>(_161) & 2;
    bool _175 = _173 != 0;
    bool _177 = !_171;
    float _179 = _177 ? (-0.5) : 0.5;
    bool _181 = !_175;
    float _183 = _181 ? (-0.5) : 0.5;
    bool _185 = !_165;
    float _187 = _167;
    float _205;
    if (!_185)
    {
        float _189 = in.m_62.x;
        float _191 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _193 = _189 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _195 = fma(_193, (*spvDescriptorSet0.vp_c9)._m0[12].x, _115);
        float _197 = _195 * _191;
        float _199 = floor(_197);
        float _201 = -_199;
        float _203 = _197 + _201;
        _205 = _203;
        _207 = true;
    }
    else
    {
        _205 = _167;
    }
    _207 = false;
    float _209 = _205;
    float _211 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _213 = _209 + _211;
    float _215 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _217 = _209 + _215;
    float _219 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _221 = _209 + _219;
    float _223 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _225 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _223;
    float _227 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _229 = _227 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _231 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _233 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _231;
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _237 = _235 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _239 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _241 = isnan(_209);
    bool _243 = _239 || _241;
    bool _245 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _247 = _243 || _245;
    float _249 = float(_247);
    float _251 = 1.0 / _225;
    bool _253 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _255 = 1.0 / _229;
    float _257 = 1.0 / _233;
    float _259 = _213 * _251;
    float _261 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _263 = _209 + _261;
    float _265 = 1.0 / _237;
    float _267 = _217 * _255;
    bool _269 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _271 = isnan(_209);
    bool _273 = _269 || _271;
    bool _275 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _277 = _273 || _275;
    float _279 = float(_277);
    bool _281 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _283 = isnan(_209);
    bool _285 = _281 || _283;
    bool _287 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _289 = _285 || _287;
    float _291 = float(_289);
    float _293 = _221 * _257;
    float _295 = -_249;
    float _297 = _295 + 1.0;
    float _299 = -_279;
    float _301 = _299 + 1.0;
    float _303 = _279 * _297;
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _307 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _305;
    float _309 = _263 * _265;
    float _311 = _291 * _301;
    bool _313 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _315 = isnan(_209);
    bool _317 = _313 || _315;
    bool _319 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _321 = _317 || _319;
    float _323 = float(_321);
    float _325 = -_291;
    float _327 = _325 + 1.0;
    float _329 = fma(_307, _259, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _333 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _331;
    bool _335 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _337 = isnan(_209);
    bool _339 = _335 || _337;
    bool _341 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _343 = _339 || _341;
    float _345 = float(_343);
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _349 = _347 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _353 = _351 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _355 = fma(_333, _259, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _357 = _323 * _327;
    float _359 = -_323;
    float _361 = _359 + 1.0;
    float _363 = -_345;
    float _365 = _363 + 1.0;
    float _367 = fma(_353, _267, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _369 = fma(_349, _267, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _371 = _345 * _361;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _375 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _373;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _377;
    float _381 = _355 * _371;
    float _383 = _329 * _371;
    float _385 = fma(_375, _293, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _387 = fma(_379, _293, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _389 = fma(_365, (*spvDescriptorSet0.vp_c9)._m0[143].x, _381);
    float _391 = fma(_365, (*spvDescriptorSet0.vp_c9)._m0[143].y, _383);
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _395 = _393 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _399 = _397 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _401 = fma(_367, _357, _389);
    float _403 = fma(_369, _357, _391);
    float _405 = fma(_395, _309, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _407 = fma(_399, _309, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _409 = fma(_385, _311, _401);
    float _411 = fma(_387, _311, _403);
    float _413 = fma(_405, _303, _409);
    float _415 = fma(_407, _303, _411);
    float _417 = fma(_249, (*spvDescriptorSet0.vp_c9)._m0[147].x, _413);
    float _419 = fma(_249, (*spvDescriptorSet0.vp_c9)._m0[147].y, _415);
    bool _421 = !_253;
    if (!_421)
    {
        float _423 = in.m_62.x;
        float _425 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _427 = _423 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _429 = fma(_427, (*spvDescriptorSet0.vp_c9)._m0[11].y, _115);
        float _431 = _429 * _425;
        float _433 = floor(_431);
        float _435 = -_433;
        float _437 = _431 + _435;
        _187 = _437;
    }
    float _439 = _187;
    float _441 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _443 = int(_441);
    bool _445 = _439 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _447 = isnan(_439);
    bool _449 = _445 || _447;
    bool _451 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _453 = _449 || _451;
    float _455 = float(_453);
    float _457 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _459 = int(_457);
    float _461 = float(_443);
    float _463 = 1.0 / _461;
    float _465 = float(uint(_459));
    int _467 = ~_459;
    int _469 = _467 + 1;
    bool _471 = _459 == 0;
    float _473 = 1.0 / _465;
    int _475 = ~_459;
    int _477 = _475 + 1;
    int _479 = ~_459;
    int _481 = _479 + 1;
    float _483 = _463 * _115;
    float _485 = trunc(_483);
    int _487 = int(_485);
    int _489 = as_type<int>(_473) + (-2);
    float _491 = float(uint(_487));
    float _493 = float(_487);
    float _495 = as_type<float>(_489) * _491;
    int _497 = ~_459;
    int _499 = _497 + 1;
    float _501 = trunc(_495);
    float _503 = precise::max(_501, 0.0);
    uint _506 = uint(_503);
    int _508 = _499 * int(_506);
    int _510 = _508 + _487;
    float _512 = in.m_62.x;
    float _514 = in.m_62.y;
    float _516 = in.m_62.z;
    float _518 = in.m_62.w;
    float _520 = float(uint(_510));
    float _522 = as_type<float>(_489) * _520;
    int _524 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _526 = _524 != 0;
    float _528 = trunc(_522);
    float _530 = precise::max(_528, 0.0);
    uint _532 = uint(_530);
    bool _534 = !_526;
    float _536 = _534 ? 7.345489978790283203125 : 1.0;
    float _538 = _536 * _512;
    float _540 = floor(_538);
    int _542 = int(_506) + int(_532);
    float _544 = float(_459);
    int _546 = _469 * _542;
    int _548 = _546 + _487;
    bool _550 = _493 >= _544;
    bool _552 = isnan(_493);
    bool _554 = _550 || _552;
    bool _556 = isnan(_544);
    bool _558 = _554 || _556;
    float _560 = float(_558);
    bool _562 = uint(_548) >= uint(_459);
    float _564 = trunc(_560);
    int _566 = int(_564);
    bool _568 = !_562;
    int _570 = _568 ? 0 : (-1);
    float _572 = -_540;
    float _574 = _538 + _572;
    int _576 = ~_542;
    int _578 = _576 + _570;
    int _580 = _578 + 1;
    float _582 = _574 * _544;
    float _584 = _544 * _115;
    int _586 = _459 * _580;
    int _588 = _586 + _487;
    float _590 = _584 * _163;
    float _592 = trunc(_582);
    int _594 = int(_592);
    int _596 = ~_566;
    int _598 = _596 + 1;
    int _600 = _598 + 1;
    bool _602 = !_471;
    int _604 = _602 ? _588 : (-1);
    float _606 = trunc(_590);
    int _608 = int(_606);
    int _610 = _604 * _600;
    int _612 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _614 = _612 != 0;
    int _616 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _618 = _616 != 0;
    int _620 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _622 = _620 != 0;
    int _624 = _459 + (-1);
    int _626 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _628 = _626 != 0;
    bool _630 = !_618;
    int _632 = _630 ? 0 : 1;
    int _634 = _566 * _624;
    int _636 = _634 + _610;
    bool _638 = !_614;
    int _640 = _638 ? 0 : 1;
    bool _642 = !_628;
    int _644 = _642 ? 0 : 1;
    int _646 = abs(_632);
    int _648 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _650 = _648 != 0;
    bool _652 = !_622;
    int _654 = _652 ? 0 : 1;
    int _656 = _636 * _646;
    int _658 = abs(_640);
    int _660 = abs(_644);
    bool _662 = !_650;
    int _664 = _662 ? 0 : 1;
    int _666 = abs(_654);
    int _668 = _594 * _660;
    int _670 = _668 + _487;
    int _672 = abs(_664);
    int _674 = _608 * _658;
    int _676 = _674 + _656;
    int _678 = ~_459;
    int _680 = _678 + 1;
    int _682 = _670 * _666;
    int _684 = _682 + _676;
    int _686 = ~_459;
    int _688 = _686 + 1;
    int _690 = _594 * _672;
    int _692 = _690 + _684;
    bool _694 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _696 = isnan(0.0);
    bool _698 = _694 || _696;
    bool _700 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _702 = _698 || _700;
    float _704 = float(uint(_692));
    float _706 = as_type<float>(_489) * _704;
    float _708 = trunc(_706);
    float _710 = precise::max(_708, 0.0);
    uint _712 = uint(_710);
    float _714 = _512 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _716 = _688 * int(_712);
    int _718 = _716 + _692;
    float _720 = float(uint(_718));
    float _722 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _724 = log2(_722);
    float _726 = as_type<float>(_489) * _720;
    float _728 = trunc(_726);
    float _730 = precise::max(_728, 0.0);
    uint _732 = uint(_730);
    float _734 = _724 * _115;
    int _736 = int(_712) + int(_732);
    float _738 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _740 = exp2(_734);
    float _742 = _512 * 2.0;
    int _744 = _680 * _736;
    int _746 = _744 + _692;
    float _748 = -_738;
    float _750 = fma(_714, 2.0, _748);
    float _752 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _754 = _514 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _756 = floor(_742);
    bool _758 = uint(_746) >= uint(_459);
    float _760 = fma(_754, -2.0, _752);
    bool _762 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _764 = isnan(1.0);
    bool _766 = _762 || _764;
    bool _768 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _770 = _766 || _768;
    float _772 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _774 = 1.0 + _772;
    bool _776 = !_758;
    int _778 = _776 ? 0 : (-1);
    float _780 = -_115;
    float _782 = fma(_780, (*spvDescriptorSet0.vp_c9)._m0[76].x, _750);
    float _784 = 1.0 / _774;
    int _786 = ~_736;
    int _788 = _786 + _778;
    int _790 = _788 + 1;
    float _792 = -_740;
    float _794 = _792 + 1.0;
    int _796 = _459 * _790;
    int _798 = _796 + _692;
    float _800 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _802 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _804 = _702 ? _794 : 0.0;
    float _806 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[76].y, _760);
    bool _808 = !_471;
    int _810 = _808 ? _798 : (-1);
    float _812 = fma(_514, (*spvDescriptorSet0.vp_c9)._m0[78].w, _800);
    float _814 = float(uint(_670));
    float _816 = fma(_512, (*spvDescriptorSet0.vp_c9)._m0[78].z, _802);
    int _818 = _810 & 3;
    bool _820 = _818 != 0;
    float _822 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[77].w, _812);
    int _824 = _810 & 3;
    bool _826 = _824 != 0;
    float _828 = as_type<float>(_489) * _814;
    int _830 = _820 ? 0 : 1;
    float _832 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[77].z, _816);
    bool _834 = _756 > 0.0;
    if (_770)
    {
        float _836 = _804 * _784;
        _125 = _836;
    }
    float _838 = _125;
    bool _840 = uint(_824) > 1u;
    float _842 = trunc(_828);
    float _844 = precise::max(_842, 0.0);
    uint _846 = uint(_844);
    bool _848 = _824 != 3;
    float _850 = -_832;
    float _852 = _850 + 1.0;
    bool _854 = _756 >= 0.0;
    bool _856 = isnan(_756);
    bool _858 = _854 || _856;
    bool _860 = isnan(0.0);
    bool _862 = _858 || _860;
    float _864 = -_822;
    float _866 = _864 + 1.0;
    bool _868 = uint(_824) >= 2u;
    int _870 = _862 ? 0 : 1;
    int _872 = _868 ? 0 : 1;
    bool _874 = _518 > 0.5;
    float _876 = _514 * 2.0;
    int _878 = ~_870;
    int _880 = _878 + 1;
    int _882 = _880 + 1;
    int _884 = ~_830;
    int _886 = _884 + 1;
    int _888 = _886 + 1;
    float _890 = floor(_876);
    int _892 = ~_872;
    int _894 = _892 + 1;
    int _896 = _894 + 1;
    int _898 = _882;
    int _900 = _888;
    int _902 = _896;
    if (!_834)
    {
        int _904 = ~_870;
        int _906 = _904 + 1;
        _898 = _906;
    }
    int _908 = _898;
    if (!_840)
    {
        int _910 = ~_830;
        int _912 = _910 + 1;
        _900 = _912;
    }
    int _914 = _900;
    if (_848)
    {
        int _916 = ~_872;
        int _918 = _916 + 1;
        _902 = _918;
    }
    int _920 = _902;
    float _922 = in.m_50.x;
    float _924 = in.m_50.y;
    float _926 = in.m_50.z;
    bool _928 = _512 > 0.5;
    int _930 = _477 * int(_846);
    int _932 = _930 + _670;
    int _934 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _936 = _934 != 0;
    float _938 = -_179;
    int _940 = _928 ? as_type<int>(_938) : as_type<int>(_179);
    bool _942 = _514 > 0.5;
    bool _944 = !_936;
    float _946 = _944 ? _179 : as_type<float>(_940);
    float _948 = float(uint(_932));
    float _950 = -_183;
    int _952 = _942 ? as_type<int>(_950) : as_type<int>(_183);
    float _954 = _946 + 0.5;
    bool _956 = _890 >= 0.0;
    bool _958 = isnan(_890);
    bool _960 = _956 || _958;
    bool _962 = isnan(0.0);
    bool _964 = _960 || _962;
    float _966 = as_type<float>(_489) * _948;
    float _968 = fma(_954, (*spvDescriptorSet0.vp_c9)._m0[80].x, _782);
    int _970 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _972 = _970 != 0;
    float _974 = trunc(_966);
    float _976 = precise::max(_974, 0.0);
    uint _978 = uint(_976);
    int _980 = _964 ? 0 : 1;
    float _982 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _984 = _982 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _986 = _924 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _988 = _890 > 0.0;
    float _990 = _924 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _992 = !_972;
    int _994 = _992 ? 0 : 1;
    float _996 = _924 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _998 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1000 = _998 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    int _1002 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1004 = _1002 != 0;
    float _1006 = 1.0 / _984;
    int _1008 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1010 = _1008 != 0;
    float _1012 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _1014 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1016 = _1014 != 0;
    float _1018 = fma(_922, (*spvDescriptorSet0.vp_c10)._m0[4].x, _986);
    float _1020 = _1012 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1022 = 1.0 / _1000;
    float _1024 = fma(_922, (*spvDescriptorSet0.vp_c10)._m0[5].x, _990);
    float _1026 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1028 = fma(_922, (*spvDescriptorSet0.vp_c10)._m0[6].x, _996);
    float _1030 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1032 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1034 = _1026 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1036 = int(_846) + int(_978);
    float _1038 = _1030 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1040 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1042 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1040;
    float _1044 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1046 = _1044 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1048 = _514 + _516;
    out.m_64.x = _1020;
    out.m_64.y = _1034;
    out.m_64.z = _1038;
    out.m_64.w = _1032;
    int _1050 = _481 * _1036;
    int _1052 = _1050 + _670;
    int _1054 = ~_980;
    int _1056 = _1054 + 1;
    int _1058 = _1056 + 1;
    float _1060 = _1046 * _1022;
    int _1062 = _1058;
    if (!_988)
    {
        int _1064 = ~_980;
        int _1066 = _1064 + 1;
        _1062 = _1066;
    }
    int _1068 = _1062;
    float _1070 = _516 * 2.0;
    bool _1072 = !_1004;
    float _1074 = _1072 ? _183 : as_type<float>(_952);
    float _1076 = _1048 + (-1.0);
    bool _1078 = uint(_1052) >= uint(_459);
    float _1080 = _514 + _512;
    float _1082 = _1042 * _1006;
    bool _1084 = !_1078;
    int _1086 = _1084 ? 0 : (-1);
    float _1088 = _1080 + (-1.0);
    int _1090 = _810 >> 31;
    float _1092 = floor(_1070);
    float _1094 = fma(_1076, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1096 = _1090 & 3;
    float _1098 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1100 = _439 + _1098;
    bool _1102 = !_826;
    int _1104 = _1102 ? 0 : 1;
    float _1106 = fma(_926, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1018);
    int _1108 = _810 + _1096;
    float _1110 = fma(_1060, _1100, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _1112 = _439 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1114 = isnan(_439);
    bool _1116 = _1112 || _1114;
    bool _1118 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1120 = _1116 || _1118;
    float _1122 = float(_1120);
    float _1124 = fma(_1088, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1126 = _1108 >> 2;
    float _1128 = fma(_926, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1024);
    int _1130 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1132 = _1130 != 0;
    int _1134 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1136 = _1134 != 0;
    int _1138 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1140 = _1138 != 0;
    float _1142 = -_1122;
    float _1144 = _1142 + 1.0;
    bool _1146 = _439 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1148 = isnan(_439);
    bool _1150 = _1146 || _1148;
    bool _1152 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1154 = _1150 || _1152;
    float _1156 = float(_1154);
    float _1158 = _1074 + (-0.5);
    int _1160 = _1126 << 4;
    int _1162 = _1160 + 368;
    float _1164 = _514 + (-0.5);
    bool _1166 = !_1136;
    int _1168 = _1166 ? 0 : 1;
    float _1170 = _1156 * _1144;
    float _1172 = -_1156;
    float _1174 = _1172 + 1.0;
    bool _1176 = !_1132;
    int _1178 = _1176 ? 0 : 1;
    uint _1180 = uint(int(uint(_1162) >> uint(2)));
    uint _1182 = uint(int(uint(int(_1180)) >> uint(2)));
    int _1184 = int(_1180) & 3;
    float _1186 = (*spvDescriptorSet0.vp_c9)._m0[int(_1182)][_1184];
    int _1188 = int(_1180) + 1;
    uint _1190 = uint(int(uint(_1188) >> uint(2)));
    int _1192 = _1188 & 3;
    float _1194 = (*spvDescriptorSet0.vp_c9)._m0[int(_1190)][_1192];
    bool _1196 = _1092 > 0.0;
    float _1198 = -_1158;
    float _1200 = -_806;
    float _1202 = fma(_1198, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1200);
    bool _1204 = _1092 >= 0.0;
    bool _1206 = isnan(_1092);
    bool _1208 = _1204 || _1206;
    bool _1210 = isnan(0.0);
    bool _1212 = _1208 || _1210;
    float _1214 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1216 = _439 + _1214;
    float _1218 = _455 * _1174;
    float _1220 = -_455;
    float _1222 = _1220 + 1.0;
    float _1224 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _1226 = _1162 + 8;
    uint _1228 = uint(int(uint(_1226) >> uint(2)));
    uint _1230 = uint(int(uint(int(_1228)) >> uint(2)));
    int _1232 = int(_1228) & 3;
    float _1234 = (*spvDescriptorSet0.vp_c9)._m0[int(_1230)][_1232];
    int _1236 = int(_1228) + 1;
    uint _1238 = uint(int(uint(_1236) >> uint(2)));
    int _1240 = _1236 & 3;
    float _1242 = (*spvDescriptorSet0.vp_c9)._m0[int(_1238)][_1240];
    float _1244 = fma(_1082, _1216, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1246 = fma(_926, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1028);
    int _1248 = _1212 ? 0 : 1;
    float _1250 = fma(_1074, _866, _1202);
    float _1252 = _1244 * _1218;
    bool _1254 = _516 > 0.5;
    float _1256 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _1258 = ~_1248;
    int _1260 = _1258 + 1;
    int _1262 = _1260 + 1;
    float _1264 = fma(_1222, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1252);
    int _1266 = _1262;
    if (!_1196)
    {
        int _1268 = ~_1248;
        int _1270 = _1268 + 1;
        _1266 = _1270;
    }
    int _1272 = _1266;
    float _1274 = -_179;
    int _1276 = _1254 ? as_type<int>(_1274) : as_type<int>(_179);
    float _1278 = fma(_1110, _1170, _1264);
    float _1280 = -_183;
    int _1282 = _874 ? as_type<int>(_1280) : as_type<int>(_183);
    float _1284 = -_852;
    float _1286 = fma(_946, _1284, _968);
    int _1288 = abs(_1168);
    bool _1290 = !_1010;
    float _1292 = _1290 ? _179 : as_type<float>(_1276);
    bool _1294 = !_1016;
    float _1296 = _1294 ? _183 : as_type<float>(_1282);
    float _1298 = float(_908);
    float _1300 = _1292 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1302 = float(_1288);
    float _1304 = _1296 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _1306 = ~_1036;
    int _1308 = _1306 + _1086;
    int _1310 = _1308 + 1;
    float _1312 = _1300 * _1224;
    int _1314 = abs(_914);
    float _1316 = _1302 * _1298;
    float _1318 = _1304 * _1256;
    int _1320 = _459 * _1310;
    int _1322 = _1320 + _670;
    float _1324 = _1128 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1326 = abs(_1104);
    out.m_66.x = _1286;
    out.m_66.y = _1250;
    out.m_66.z = _1312;
    out.m_66.w = _1318;
    int _1328 = ~_1314;
    int _1330 = _1328 + 1;
    int _1332 = _1330 + 1;
    float _1334 = _1106 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1336 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1338 = _1324 + _1336;
    float _1340 = _1246 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1342 = fma(_1122, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1278);
    float _1344 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1346 = _1334 + _1344;
    int _1348 = _1332 * as_type<int>(_1194);
    int _1350 = abs(_920);
    float _1352 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1354 = _1340 + _1352;
    float _1356 = float(_1272);
    float _1358 = _1342 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1360 = _1338 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1362 = _512 + (-0.5);
    int _1364 = ~_1326;
    int _1366 = _1364 + 1;
    int _1368 = _1366 + 1;
    float _1370 = fma(_1346, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1360);
    bool _1372 = !_471;
    int _1374 = _1372 ? _1322 : (-1);
    float _1376 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _1378 = _824 != 3;
    int _1380 = _1368 * as_type<int>(_1186);
    int _1382 = _1380 + _1348;
    int _1384 = ~_1350;
    int _1386 = _1384 + 1;
    int _1388 = _1386 + 1;
    float _1390 = fma(_1354, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1370);
    bool _1392 = !_1378;
    int _1394 = _1392 ? 0 : (-1);
    float _1396 = _1376 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1398 = _1388 * as_type<int>(_1234);
    int _1400 = _1398 + _1382;
    int _1402 = abs(_1394);
    float _1404 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _1406 = _1390 >= 0.0;
    float _1408 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _1410 = abs(_1178);
    float _1412 = in.m_68.x;
    float _1414 = in.m_68.y;
    float _1416 = in.m_68.z;
    int _1418 = abs(_994);
    float _1420 = _1404 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1422 = ~_1402;
    int _1424 = _1422 + 1;
    int _1426 = _1424 + 1;
    float _1428 = _1408 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1430 = _1338 * _1338;
    int _1432 = ~_1418;
    int _1434 = _1432 + 1;
    int _1436 = _1434 + 1;
    int _1438 = _1426 * as_type<int>(_1242);
    int _1440 = _1438 + _1400;
    float _1442 = float(_1410);
    float _1444 = fma(_1346, _1346, _1430);
    out.m_70.x = _1396;
    out.m_70.y = _1428;
    out.m_70.z = _1420;
    out.m_70.w = _1358;
    int _1446 = _1440 * _1436;
    float _1448 = fma(_1354, _1354, _1444);
    float _1450 = _1442 * _1356;
    int _1452 = _1374 * _1418;
    int _1454 = _1452 + _1446;
    float _1456 = _1450;
    if (_1406)
    {
        out.m_57.x = 0.0;
    }
    float _1458 = _1450 * (-2.0);
    float _1460 = rsqrt(_1448);
    if (_1406)
    {
        _1456 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1462 = _1456;
    float _1464 = float(_1454);
    float _1466 = fma(_1458, _1412, _1412);
    float _1468 = fma(_1124, _1458, _1124);
    int _1470 = as_type<int>(_1462);
    if (_1406)
    {
        float _1472 = _1462 * 5.0;
        _1470 = as_type<int>(_1472);
    }
    int _1474 = _1470;
    bool _1476 = !_1140;
    int _1478 = _1476 ? 0 : 1;
    float _1480 = fma(_1362, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1466);
    out.m_72.x = _1464;
    int _1482 = abs(_1478);
    float _1484 = fma(_1468, _838, _1480);
    if (_1406)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5298 = as_type<float>(_1474);
        out.gl_Position.z = _5298;
    }
    float _1486 = _1338 * _1460;
    float _1488 = _1346 * _1460;
    if (_1406)
    {
        return out;
    }
    float _1490 = -_1486;
    float _1492 = fma(_1490, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1324);
    float _1494 = _1354 * _1460;
    float _1496 = -_1488;
    float _1498 = fma(_1496, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1334);
    float _1500 = _1316 * (-2.0);
    float _1502 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1504 = _1492 + _1502;
    float _1506 = -_1494;
    float _1508 = fma(_1506, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1340);
    float _1510 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1512 = _1498 + _1510;
    float _1514 = fma(_1500, _1414, _1414);
    float _1516 = _1504 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1518 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1520 = _1508 + _1518;
    float _1522 = float(_1068);
    float _1524 = fma(_1094, _1500, _1094);
    float _1526 = fma(_1512, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1516);
    float _1528 = float(_1482);
    float _1530 = -_1486;
    float _1532 = fma(_1530, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1338);
    float _1534 = fma(_1164, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1514);
    float _1536 = fma(_1520, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1526);
    float _1538 = -_1488;
    float _1540 = fma(_1538, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1346);
    float _1542 = _1528 * _1522;
    float _1544 = _1532 * _1532;
    float _1546 = fma(_1524, _838, _1534);
    bool _1548 = _1536 >= 0.0;
    float _1550 = in.m_74.x;
    float _1552 = in.m_74.y;
    float _1554 = fma(_1540, _1540, _1544);
    float _1556 = _1542 * (-2.0);
    float _1558 = -_1494;
    float _1560 = fma(_1558, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1354);
    float _1562 = _516 + _512;
    float _1564 = fma(_1556, _1416, _1416);
    float _1566 = fma(_1560, _1560, _1554);
    float _1568 = _1562 + (-1.0);
    float _1570 = _516 + (-0.5);
    float _1572 = _1484 * 0.15915493667125701904296875;
    float _1574 = _1546 * 0.15915493667125701904296875;
    float _1576 = fma(_1568, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1578 = _1560;
    int _1580 = as_type<int>(_1570);
    float _1582 = _1492;
    float _1584 = _1512;
    if (_1548)
    {
        _1578 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1586 = _1578;
    float _1588 = fma(_1570, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1564);
    float _1590 = _1572 * 6.283185482025146484375;
    float _1592 = sin(_1590);
    float _1594 = fma(_1576, _1556, _1576);
    if (_1548)
    {
        out.m_57.x = 0.0;
    }
    if (_1548)
    {
        float _1596 = _1586 * 5.0;
        _1580 = as_type<int>(_1596);
    }
    int _1598 = _1580;
    float _1600 = fma(_1594, _838, _1588);
    float _1602 = _1572 * 6.283185482025146484375;
    float _1604 = cos(_1602);
    if (_1548)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5505 = as_type<float>(_1598);
        out.gl_Position.z = _5505;
    }
    float _1606 = _419 * _1552;
    float _1608 = _1600 * 0.15915493667125701904296875;
    float _1610 = _1574 * 6.283185482025146484375;
    float _1612 = sin(_1610);
    float _1614 = sqrt(_1566);
    float _1616 = _1574 * 6.283185482025146484375;
    float _1618 = cos(_1616);
    if (_1548)
    {
        return out;
    }
    float _1620 = _1606 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1622 = _1460 * _1614;
    float _1624 = _1608 * 6.283185482025146484375;
    float _1626 = cos(_1624);
    float _1628 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _183);
    float _1630 = _417 * _1550;
    float _1632 = _1620 * _1622;
    float _1634 = _1592 * _1612;
    float _1636 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _179);
    float _1638 = _1604 * _1612;
    float _1640 = _1628 * _1632;
    float _1642 = _1608 * 6.283185482025146484375;
    float _1644 = sin(_1642);
    float _1646 = _1630 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1648 = _1604 * _1618;
    float _1650 = _1592 * _1618;
    float _1652 = _1646 * _1622;
    float _1654 = _1604 * _1626;
    float _1656 = _1636 * _1652;
    float _1658 = _1618 * _1626;
    float _1660 = _1592 * _1626;
    float _1662 = _1654 * _1640;
    float _1664 = _1612 * _1626;
    float _1666 = _1622 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1668 = _1666 * 0.5;
    float _1670 = fma(_1644, _1648, _1634);
    float _1672 = -_1650;
    float _1674 = fma(_1644, _1638, _1672);
    float _1676 = -_1640;
    float _1678 = _1644 * _1676;
    float _1680 = _1660 * _1640;
    float _1682 = fma(_1670, _1656, _1662);
    float _1684 = -_1638;
    float _1686 = fma(_1644, _1650, _1684);
    float _1688 = fma(_1658, _1656, _1678);
    float _1690 = fma(_1644, _1634, _1648);
    float _1692 = fma(_1674, _1668, _1682);
    float _1694 = fma(_1686, _1656, _1680);
    float _1696 = fma(_1664, _1668, _1688);
    float _1698 = _1692 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1700 = _1692 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1702 = fma(_1690, _1668, _1694);
    float _1704 = _1692 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1706 = fma(_1696, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1698);
    float _1708 = fma(_1696, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1700);
    float _1710 = fma(_1696, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1704);
    float _1712 = fma(_1702, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1706);
    float _1714 = fma(_1702, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1708);
    float _1716 = fma(_1702, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1710);
    float _1718 = _1712 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1720 = _1714 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1722 = _1716 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1724 = _1334 + _1718;
    float _1726 = _1340 + _1720;
    float _1728 = _1324 + _1722;
    float _1730 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1732 = _1724 + _1730;
    float _1734 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1736 = _1726 + _1734;
    float _1738 = _1732 * _1732;
    float _1740 = _1736 * _1736;
    float _1742 = _1738 + _1740;
    float _1744 = sqrt(_1742);
    bool _1746 = _1744 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1748 = _1702;
    float _1750 = _1696;
    float _1752 = _1656;
    float _1754 = _1726;
    float _1756 = _1740;
    if (!_1746)
    {
        _1748 = _1738;
    }
    float _1758 = _1748;
    float _1760 = _1758;
    if (!_1746)
    {
        _1750 = _1724;
    }
    float _1762 = _1750;
    float _1764 = _1762;
    if (!_1746)
    {
        _1752 = _1728;
    }
    float _1766 = _1752;
    bool _1768 = !_1746;
    float _1770 = _1766;
    if (!_1768)
    {
        float _1772 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1774 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1776 = _1744 + _1774;
        float _1778 = rsqrt(_1742);
        float _1780 = _1776 * _1772;
        float _1782 = _1728 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1784 = _1780 * 0.15915493667125701904296875;
        float _1786 = _1784 * 6.283185482025146484375;
        float _1788 = sin(_1786);
        float _1790 = _1784 * 6.283185482025146484375;
        float _1792 = cos(_1790);
        float _1794 = fma(_1788, _1782, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1796 = _1778 * _1794;
        float _1798 = _1792 + (-1.0);
        float _1800 = fma(_1732, _1796, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1802 = fma(_1736, _1796, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1804 = _1798 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1806 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1808 = _1800 + _1806;
        float _1810 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1812 = _1802 + _1810;
        float _1814 = fma(_1728, _1792, _1804);
        float _1816 = _1808 * _1808;
        float _1818 = _1812 * _1812;
        _1764 = _1800;
        _1754 = _1802;
        _1770 = _1814;
        _1760 = _1816;
        _1756 = _1818;
    }
    float _1820 = _1764;
    float _1822 = _1754;
    float _1824 = _1770;
    float _1826 = _1760;
    float _1828 = _1756;
    float _1830 = fma(_1820, 6.2500002968590706586837768554688e-05, 0.5);
    float _1832 = fma(_1822, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _5870 = float2(_1830, _1832);
    float3 _1836 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_5870, float2(0.0), isnan(_5870)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_5870, float2(0.0), isnan(_5870)), level(0.0)).xyz;
    float _1838 = _1836.x;
    float _1840 = _1836.y;
    float _1842 = _1836.z;
    float _1844 = _1670 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1846 = _1670 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1848 = _1670 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1850 = _1674 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1852 = fma(_1658, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1844);
    float _1854 = fma(_1658, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1846);
    float _1856 = _1654 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1858 = _1654 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1860 = fma(_1658, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1848);
    float _1862 = _1654 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1864 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1866 = _1824 + _1864;
    float _1868 = _1674 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1870 = _1674 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1872 = -_1644;
    float _1874 = fma(_1872, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1856);
    float _1876 = -_1644;
    float _1878 = fma(_1876, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1858);
    float _1880 = -_1644;
    float _1882 = fma(_1880, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1862);
    float _1884 = fma(_1866, _1866, _1826);
    float _1886 = fma(_1664, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1850);
    float _1888 = fma(_1664, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1868);
    float _1890 = fma(_1664, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1870);
    float _1892 = fma(_1660, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1874);
    float _1894 = fma(_1660, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1878);
    float _1896 = _183 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1898 = fma(_1660, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1882);
    float _1900 = _1884 + _1828;
    float _1902 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1886);
    float _1904 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1888);
    float _1906 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1890);
    float _1908 = fma(_1686, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1852);
    float _1910 = fma(_1686, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1854);
    float _1912 = _1896 * _1892;
    float _1914 = _1896 * _1894;
    float _1916 = fma(_1686, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1860);
    float _1918 = _179 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1920 = _1896 * _1898;
    float _1922 = sqrt(_1900);
    float _1924 = fma(_1918, _1908, _1912);
    float _1926 = fma(_1918, _1910, _1914);
    float _1928 = fma(_1918, _1916, _1920);
    float _1930 = _1902 + _1924;
    float _1932 = _1904 + _1926;
    float _1934 = _1906 + _1928;
    out.m_76.x = _1930;
    out.m_76.y = _1932;
    out.m_76.z = _1934;
    bool _1936 = _1922 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1938 = isnan(_1922);
    bool _1940 = _1936 || _1938;
    bool _1942 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1944 = _1940 || _1942;
    float _1946 = _1928;
    float _1948 = _1922;
    if (!_1944)
    {
        _1946 = 1.0;
    }
    float _1950 = _1946;
    out.m_78.x = _1838;
    out.m_78.y = _1840;
    out.m_78.z = _1842;
    bool _1952 = !_1944;
    float _1954 = _1950;
    if (!_1952)
    {
        bool _1956 = _1922 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1958 = isnan(_1922);
        bool _1960 = _1956 || _1958;
        bool _1962 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1964 = _1960 || _1962;
        if (!_1964)
        {
            float _1966 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1968 = _1922 + _1966;
            float _1970 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1972 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1970;
            float _1974 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1976 = _1974 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1978 = 1.0 / _1972;
            float _1980 = _1968 * _1978;
            float _1982 = fma(_1980, _1976, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1954 = _1982;
            _1984 = true;
        }
        else
        {
            bool _1986 = _1922 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1988 = isnan(_1922);
            bool _1990 = _1986 || _1988;
            bool _1992 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1994 = _1990 || _1992;
            if (!_1994)
            {
                float _1996 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1998 = _1922 + _1996;
                float _2000 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2002 = _2000 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2004 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2006 = _2004 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2008 = 1.0 / _2002;
                float _2010 = _1998 * _2008;
                float _2012 = fma(_2010, _2006, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1954 = _2012;
                _1984 = true;
            }
            else
            {
                _1954 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1984 = false;
    float _2014 = _1954;
    float _2016 = _1492 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2018 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2020 = _1824 + _2018;
    float _2022 = fma(_1498, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2016);
    bool _2024 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2026 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2028 = _2024 || _2026;
    bool _2030 = isnan(0.5);
    bool _2032 = _2028 || _2030;
    bool _2034 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2036 = isnan(0.5);
    bool _2038 = _2034 || _2036;
    bool _2040 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2042 = _2038 || _2040;
    float _2044 = fma(_1508, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2022);
    float _2046 = _1492 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2048 = _2044 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2050 = fma(_1498, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2046);
    float _2052 = 1.0 / _2048;
    float _2054 = fma(_1508, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2050);
    if (_2042)
    {
        _1948 = 1.0;
    }
    float _2056 = _1948;
    float _2058 = _2054 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2060 = _2058 + _2048;
    float _2062 = _2060 * _2052;
    float _2064 = _2062 * 0.5;
    float _2066 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2068 = _1820 + _2066;
    float _2070 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2072 = fma(_2064, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2070);
    float _2074 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2076 = _1822 + _2074;
    float _2078 = fma(_2068, _2014, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2080 = fma(_2020, _2014, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2082 = 1.0 / _2072;
    float _2084 = fma(_2076, _2014, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2086 = -_1488;
    float _2088 = fma(_2086, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2078);
    float _2090 = -_1486;
    float _2092 = fma(_2090, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2080);
    float _2094 = -_1494;
    float _2096 = fma(_2094, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2084);
    float _2098 = _2092;
    float _2100 = _2088;
    float _2102 = _2096;
    float _2104 = _2082;
    float _2106 = _2056;
    if (!_2032)
    {
        float _2108 = _1504 * _1504;
        float _2110 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2112 = -_1340;
        float _2114 = _2112 + _2084;
        float _2116 = -_1324;
        float _2118 = _2116 + _2080;
        float _2120 = fma(_1512, _1512, _2108);
        float _2122 = fma(_1520, _1520, _2120);
        float _2124 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2126 = sqrt(_2122);
        float _2128 = 1.0 / _1622;
        float _2130 = _2124 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2132 = precise::min(_2126, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2134 = _2132 * _2110;
        float _2136 = _2134 * _2128;
        float _2138 = -_1334;
        float _2140 = _2138 + _2078;
        float _2142 = _2130 * _2136;
        float _2144 = _2114 * _2136;
        float _2146 = fma(_2118, _2142, _1492);
        float _2148 = fma(_2140, _2142, _1498);
        float _2150 = fma(_2130, _2144, _1508);
        _2098 = _2146;
        _2100 = _2148;
        _2102 = _2150;
    }
    float _2152 = _2098;
    float _2154 = _2100;
    float _2156 = _2102;
    if (_2042)
    {
        _1582 = 1.0;
    }
    float _2158 = _1582;
    float _2160 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2162 = _2082 * _2160;
    float _2164 = _2158;
    if (!_2042)
    {
        float _2166 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2168 = _2166 * 0.15915493667125701904296875;
        float _2170 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2172 = _2168 * 6.283185482025146484375;
        float _2174 = cos(_2172);
        float _2176 = _2170 * 0.15915493667125701904296875;
        float _2178 = _2168 * 6.283185482025146484375;
        float _2180 = sin(_2178);
        float _2182 = 1.0 / _2174;
        float _2184 = _2176 * 6.283185482025146484375;
        float _2186 = cos(_2184);
        float _2188 = _2180 * _2182;
        float _2190 = _2176 * 6.283185482025146484375;
        float _2192 = sin(_2190);
        float _2194 = _2186 * _2188;
        float _2196 = 1.0 / _2194;
        float _2198 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2200 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2198;
        float _2202 = 1.0 / _2200;
        float _2204 = _2192 * _2196;
        float _2206 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2208 = fma(_2162, _2204, _2206);
        float _2210 = _2208 * _2202;
        float _2212 = precise::clamp(_2210, 0.0, 1.0);
        _1584 = _2176;
        _2104 = _2168;
        _2106 = _2212;
    }
    float _2214 = _1584;
    float _2216 = _2104;
    float _2218 = _2106;
    float _2220 = _2214;
    float _2222 = _2216;
    if (!_2042)
    {
        float _2224 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2226 = _2224 * 0.15915493667125701904296875;
        float _2228 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2230 = _2226 * 6.283185482025146484375;
        float _2232 = cos(_2230);
        float _2234 = _2228 * 0.15915493667125701904296875;
        float _2236 = _2226 * 6.283185482025146484375;
        float _2238 = sin(_2236);
        float _2240 = 1.0 / _2232;
        float _2242 = _2234 * 6.283185482025146484375;
        float _2244 = cos(_2242);
        float _2246 = _2238 * _2240;
        float _2248 = _2234 * 6.283185482025146484375;
        float _2250 = sin(_2248);
        float _2252 = _2244 * _2246;
        float _2254 = 1.0 / _2252;
        float _2256 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2258 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2256;
        float _2260 = 1.0 / _2258;
        float _2262 = _2250 * _2254;
        float _2264 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2266 = fma(_2162, _2262, _2264);
        float _2268 = _2266 * _2260;
        float _2270 = precise::clamp(_2268, 0.0, 1.0);
        float _2272 = -_2270;
        float _2274 = _2272 + 1.0;
        _2220 = _2232;
        _2164 = _2274;
    }
    float _2276 = _2220;
    float _2278 = _2164;
    float _2280 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2282 = _2152 + _2280;
    float _2284 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2286 = _2154 + _2284;
    float _2288 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2290 = _2156 + _2288;
    float _2292 = _2282 * _2282;
    float _2294 = fma(_2286, _2286, _2292);
    float _2296 = fma(_2290, _2290, _2294);
    float _2298 = rsqrt(_2296);
    float _2300 = _2298 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2302 = _2286 * _2300;
    float _2304 = _2290 * _2300;
    float _2306 = _2302 * _2302;
    float _2308 = _2304 * _2304;
    float _2310 = _2306 + _2308;
    float _2312 = sqrt(_2310);
    bool _2314 = _2312 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2316 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2318 = _2312 + _2316;
    float _2320 = _1324;
    float _2322 = _2276;
    float _2324 = _2318;
    float _2326 = _2282;
    float _2328 = _2300;
    float _2330 = _2310;
    if (_2314)
    {
        float _2332 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2320 = _2332;
    }
    float _2334 = _2320;
    if (_2314)
    {
        float _2336 = rsqrt(_2310);
        _2322 = _2336;
    }
    float _2338 = _2322;
    float _2340 = _2338;
    if (_2314)
    {
        float _2342 = _2318 * _2334;
        _2324 = _2342;
    }
    float _2344 = _2324;
    float _2346 = sqrt(_2296);
    if (_2314)
    {
        float _2348 = _2344 * 0.15915493667125701904296875;
        _2222 = _2348;
    }
    float _2350 = _2222;
    float _2352 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2354 = _2290;
    float _2356 = _2350;
    if (_2314)
    {
        float _2358 = _2350 * 6.283185482025146484375;
        float _2360 = sin(_2358);
        _2354 = _2360;
    }
    float _2362 = _2354;
    float _2364 = precise::max(0.0, _2352);
    float _2366 = _2298;
    if (_2314)
    {
        float _2368 = _2350 * 6.283185482025146484375;
        float _2370 = cos(_2368);
        _2366 = _2370;
    }
    float _2372 = _2366;
    float _2374 = -_2300;
    float _2376 = -_2364;
    float _2378 = fma(_2282, _2374, _2376);
    float _2380 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_2314)
    {
        float _2382 = _2378 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2326 = _2382;
    }
    float _2384 = _2326;
    float _2386 = fma(_1498, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2388 = _2384;
    float _2390 = _2362;
    if (_2314)
    {
        float _2392 = fma(_2362, _2384, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2388 = _2392;
    }
    float _2394 = _2388;
    float _2396 = _2394;
    if (!_2314)
    {
        _2356 = _2378;
    }
    float _2398 = _2356;
    float _2400 = _2398;
    if (!_2314)
    {
        _2390 = _2304;
    }
    float _2402 = _2390;
    float _2404 = _2402;
    if (_2314)
    {
        float _2406 = _2338 * _2394;
        _2328 = _2406;
    }
    float _2408 = _2328;
    if (!_2314)
    {
        _2340 = _2302;
    }
    float _2410 = _2340;
    float _2412 = _2410;
    if (_2314)
    {
        float _2414 = _2372 + (-1.0);
        _2380 = _2414;
    }
    float _2416 = _2380;
    float _2418 = _2416;
    if (_2314)
    {
        float _2420 = _2302 * _2408;
        _2412 = _2420;
    }
    float _2422 = _2412;
    if (!_2314)
    {
        _2396 = _2306;
    }
    float _2424 = _2396;
    float _2426 = _2424;
    if (_2314)
    {
        float _2428 = _2304 * _2408;
        _2404 = _2428;
    }
    float _2430 = _2404;
    if (_2314)
    {
        float _2432 = _2416 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2330 = _2432;
    }
    float _2434 = _2330;
    if (_2314)
    {
        float _2436 = _2422 * _2422;
        _2426 = _2436;
    }
    float _2438 = _2426;
    if (!_2314)
    {
        _2418 = _2308;
    }
    float _2440 = _2418;
    float _2442 = _2440;
    if (_2314)
    {
        float _2444 = _2430 * _2430;
        _2442 = _2444;
    }
    float _2446 = _2442;
    if (_2314)
    {
        float _2448 = fma(_2378, _2372, _2434);
        _2400 = _2448;
    }
    float _2450 = _2400;
    float _2452 = _2152 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2454 = floor(_2386);
    float _2456 = fma(_2450, _2450, _2438);
    float _2458 = fma(_2154, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2452);
    float _2460 = _2456 + _2446;
    float _2462 = fma(_2156, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2458);
    float _2464 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2466 = fma(_2346, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2464);
    float _2468 = precise::clamp(_2466, 0.0, 1.0);
    float _2470 = rsqrt(_2460);
    float _2472 = _2462 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2474 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2476 = -_2468;
    float _2478 = _2476 + 1.0;
    float _2480 = _2472 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2482 = fma(_1508, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2484 = _2152 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2486 = _2152 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2488 = -_2480;
    float _2490 = fma(_2488, _2474, 1.0);
    float _2492 = _2152 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2494 = abs(_2478);
    float _2496 = log2(_2494);
    float _2498 = fma(_2154, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2486);
    float _2500 = fma(_2154, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2484);
    float _2502 = fma(_2154, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2492);
    float _2504 = _2470 * _2422;
    float _2506 = _2470 * _2450;
    float _2508 = _2470 * _2430;
    float _2510 = fma(_2156, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2498);
    float _2512 = _2504 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2514 = fma(_2156, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2502);
    float _2516 = floor(_2482);
    float _2518 = _2510 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2520 = -_2512;
    float _2522 = fma(_2506, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2520);
    float _2524 = _2514 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2526 = -_2454;
    float _2528 = _2386 + _2526;
    float _2530 = _2518 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2532 = -_2508;
    float _2534 = fma(_2532, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2522);
    float _2536 = fma(_2156, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2500);
    float _2538 = _2496 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2540 = fma(_2524, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2530);
    float _2542 = fma(_2534, -0.5, 0.5);
    float _2544 = _2536 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2546 = exp2(_2538);
    float _2548 = fma(_2472, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2540);
    float _2550 = _2518 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2552 = _2518 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2554 = fma(_2534, 0.5, 0.5);
    float _2556 = fma(_2544, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2548);
    float _2558 = fma(_2524, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2550);
    float _2560 = fma(_2524, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2552);
    float _2562 = log2(_2490);
    float _2564 = -_2516;
    float _2566 = _2482 + _2564;
    float _2568 = fma(_2554, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2570 = fma(_2472, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2558);
    float _2572 = fma(_2472, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2560);
    float _2574 = _2506 + 1.0;
    float _2576 = fma(_2554, _2568, -0.212114393711090087890625);
    float _2578 = fma(_2544, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2570);
    float _2580 = 1.0 / _2556;
    float _2582 = fma(_2544, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2572);
    float _2584 = -_2506;
    float _2586 = fma(_2546, _2574, _2584);
    float _2588 = fma(_2554, _2576, 1.570728778839111328125);
    float _2590 = sqrt(_2542);
    float _2592 = _2562 * 0.693147182464599609375;
    float2 _7127 = float2(_2528, _2566);
    float _2594 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7127, float2(0.0), isnan(_7127)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7127, float2(0.0), isnan(_7127)), level(0.0)).x;
    float _2596 = fma(_2586, 0.5, 0.5);
    float _2598 = _2592 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2600 = _2578 * _2580;
    float _2602 = _2582 * _2580;
    float _2604 = fma(_2600, 0.5, 0.5);
    float _2606 = fma(_2602, -0.5, 0.5);
    float _2608 = _2590 * 0.636619746685028076171875;
    float3 _7155 = float3(_2604, _2606, _2598);
    float _2610 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7155, float3(0.0), isnan(_7155)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7155, float3(0.0), isnan(_7155)), level(0.0)).x;
    float _2612 = -_2588;
    float _2614 = fma(_2608, _2612, 1.0);
    float3 _7171 = float3(_2604, _2606, _2598);
    float4 _2617 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7171, float3(0.0), isnan(_7171)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7171, float3(0.0), isnan(_7171)), level(0.0)).xyzw;
    float _2619 = _2617.x;
    float _2621 = _2617.y;
    float _2623 = _2617.z;
    float _2625 = _2617.w;
    float2 _7187 = float2(_2614, _2596);
    float3 _2627 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7187, float2(0.0), isnan(_7187)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7187, float2(0.0), isnan(_7187)), level(0.0)).xyz;
    float _2629 = _2627.x;
    float _2631 = _2627.y;
    float _2633 = _2627.z;
    float _2635 = _1932 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2637 = _1932 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2639 = _1932 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2641 = abs(_2162);
    float _2643 = log2(_2641);
    float _2645 = fma(_1930, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2635);
    float _2647 = fma(_1930, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2637);
    float _2649 = fma(_1930, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2639);
    float _2651 = _2518 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2653 = fma(_1934, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2645);
    float _2655 = fma(_1934, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2647);
    float _2657 = fma(_1934, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2649);
    float _2659 = _2653 * _2653;
    float _2661 = fma(_2524, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2651);
    out.m_72.x = _1464;
    float _2663 = fma(_2655, _2655, _2659);
    float _2665 = fma(_2472, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2661);
    float _2667 = _2643 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2669 = fma(_2657, _2657, _2663);
    float _2671 = fma(_2544, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2665);
    float _2673 = exp2(_2667);
    bool _2675 = _2162 <= 8000.0;
    bool _2677 = isnan(_2162);
    bool _2679 = _2675 || _2677;
    bool _2681 = isnan(8000.0);
    bool _2683 = _2679 || _2681;
    float _2685 = float(_2683);
    float _2687 = _2578 + _2556;
    out.gl_Position.x = _2578;
    out.gl_Position.y = _2582;
    out.gl_Position.z = _2671;
    out.gl_Position.w = _2556;
    float _2689 = _2687 * 0.5;
    float _2691 = rsqrt(_2669);
    float _2693 = fma(_2673, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2695 = precise::clamp(_2693, 0.0, 1.0);
    float _2697 = fma(_2695, -2.0, 3.0);
    float _2699 = _2695 * _2695;
    float _2701 = _2655 * _2691;
    float _2703 = _2653 * _2691;
    float _2705 = _2699 * _2697;
    float _2707 = fma(_2701, 0.5, 0.5);
    float _2709 = fma(_2703, -0.5, 0.5);
    float _2711 = -_2705;
    float _2713 = _2711 + 1.0;
    float _2715 = _2707;
    float _2717 = _2709;
    float _2719 = _1250;
    if (_1010)
    {
        float _2721 = -_2707;
        float _2723 = _1254 ? _2721 : _2707;
        _2715 = _2723;
    }
    float _2725 = _2715;
    float _2727 = fma(_2713, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2705);
    if (_1016)
    {
        float _2729 = -_2709;
        float _2731 = _874 ? _2729 : _2709;
        _2717 = _2731;
    }
    float _2733 = _2717;
    bool _2735 = _2346 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2737 = isnan(_2346);
    bool _2739 = _2735 || _2737;
    bool _2741 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2743 = _2739 || _2741;
    float _2745 = _2725 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2747 = _2685 * _2727;
    float _2749 = _2733 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2751 = _2745 * _1224;
    float _2753 = _2496 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2755 = _2749 * _1256;
    float _2757 = in.m_80.x;
    float _2759 = _2556 * 0.5;
    float _2761 = _2747 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2763 = exp2(_2753);
    float _2765 = _2671 + _2556;
    float _2767 = fma(_2582, -0.5, _2759);
    out.m_66.x = _1286;
    out.m_66.y = _1250;
    out.m_66.z = _2751;
    out.m_66.w = _2755;
    float _2769 = _2765 * 0.5;
    out.m_82.x = _2689;
    out.m_82.y = _2767;
    out.m_82.z = _2769;
    out.m_82.w = _2556;
    float _2771 = -_2763;
    float _2773 = _2771 + 1.0;
    float _2775 = _2755;
    float _2777 = _1286;
    if (!_2743)
    {
        _2775 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2779 = _2775;
    float _2781 = _2773 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2783 = _2779;
    float _2785 = _2779;
    if (!_2743)
    {
        _2777 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2787 = _2777;
    float _2789 = _2787;
    float _2791 = _2787;
    if (!_2743)
    {
        _2719 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2793 = _2719;
    float _2795 = -_2594;
    float _2797 = _2795 + 1.0;
    float _2799 = _2797 * _2761;
    float _2801 = precise::clamp(_2799, 0.0, 1.0);
    float _2803 = -_2801;
    float _2805 = fma(_2803, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2807 = -_2781;
    float _2809 = _2807 + 1.0;
    float _2811 = _2805 * _2757;
    float _2813 = _2781 * _2610;
    float _2815 = _2811 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2817 = _2811;
    float _2819 = _2793;
    float _2821 = _2793;
    if (!_2743)
    {
        _2817 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2823 = _2817;
    float _2825 = _2625 * _2813;
    float _2827 = _2625 * _2809;
    out.m_84.x = _2815;
    float _2829 = _2218 * _2278;
    float _2831 = _2633 * _2813;
    float _2833 = fma(_2629, _2825, _2619);
    float _2835 = fma(_2631, _2825, _2621);
    float _2837 = _2829 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2839 = fma(_2625, _2831, _2623);
    float _2841 = _2825;
    float _2843 = _2829;
    float _2845 = _2823;
    float _2847 = _2823;
    if (!_2743)
    {
        _2841 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2849 = _2841;
    float _2851 = _2849;
    float _2853 = _2849;
    if (!_2743)
    {
        _2843 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2855 = _2843;
    out.m_86.x = _2833;
    out.m_86.y = _2835;
    out.m_86.z = _2839;
    out.m_86.w = _2827;
    bool _2857 = !_2743;
    float _2859 = _2855;
    float _2861 = _2855;
    if (!_2857)
    {
        bool _2863 = _2346 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2865 = isnan(_2346);
        bool _2867 = _2863 || _2865;
        bool _2869 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2871 = _2867 || _2869;
        if (!_2871)
        {
            float _2873 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2875 = _2346 + _2873;
            float _2877 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2879 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2877;
            float _2881 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2883 = _2881 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2885 = 1.0 / _2879;
            float _2887 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2889 = _2887 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2891 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2893 = _2891 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2895 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2897 = _2895 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2899 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2901 = _2899 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2903 = _2875 * _2885;
            float _2905 = precise::clamp(_2903, 0.0, 1.0);
            float _2907 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2909 = _2907 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2911 = fma(_2905, _2883, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2913 = fma(_2905, _2909, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2915 = fma(_2905, _2889, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2917 = fma(_2905, _2893, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2919 = fma(_2905, _2897, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2921 = fma(_2905, _2901, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2791 = _2915;
            _2847 = _2919;
            _2785 = _2911;
            _2853 = _2917;
            _2821 = _2913;
            _2861 = _2921;
            _2923 = true;
        }
        else
        {
            bool _2925 = _2346 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2927 = isnan(_2346);
            bool _2929 = _2925 || _2927;
            bool _2931 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2933 = _2929 || _2931;
            if (!_2933)
            {
                _2783 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2935 = _2783;
            _2785 = _2935;
            if (!_2933)
            {
                _2789 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2937 = _2789;
            _2791 = _2937;
            if (!_2933)
            {
                _2819 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2939 = _2819;
            _2821 = _2939;
            if (!_2933)
            {
                _2851 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2941 = _2851;
            _2853 = _2941;
            if (!_2933)
            {
                _2845 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2943 = _2845;
            _2847 = _2943;
            if (!_2933)
            {
                _2859 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2945 = _2859;
            bool _2947 = !_2933;
            _2861 = _2945;
            if (!_2947)
            {
                bool _2949 = _2346 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2951 = isnan(_2346);
                bool _2953 = _2949 || _2951;
                bool _2955 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2957 = _2953 || _2955;
                if (!_2957)
                {
                    float _2959 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2961 = _2346 + _2959;
                    float _2963 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2965 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2963;
                    float _2967 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2969 = _2967 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2971 = 1.0 / _2965;
                    float _2973 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2975 = _2973 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2977 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2979 = _2977 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2981 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2983 = _2981 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2985 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2987 = _2985 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2989 = _2961 * _2971;
                    float _2991 = precise::clamp(_2989, 0.0, 1.0);
                    float _2993 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2995 = _2993 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2997 = fma(_2991, _2969, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2999 = fma(_2991, _2995, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3001 = fma(_2991, _2975, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3003 = fma(_2991, _2979, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3005 = fma(_2991, _2983, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3007 = fma(_2991, _2987, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2791 = _3001;
                    _2847 = _3005;
                    _2785 = _2997;
                    _2853 = _3003;
                    _2821 = _2999;
                    _2861 = _3007;
                    _2923 = true;
                }
                else
                {
                    _2791 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2847 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2785 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2853 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2821 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2861 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2923 = false;
    float _3009 = _2791;
    float _3011 = _2847;
    float _3013 = _2785;
    float _3015 = _2853;
    float _3017 = _2821;
    float _3019 = _2861;
    float _3021 = fma(_1932, -0.5, 0.5);
    float _3023 = precise::clamp(_3021, 0.0, 1.0);
    float _3025 = -_3009;
    float _3027 = _3025 + _3011;
    float _3029 = -_3013;
    float _3031 = _3029 + _3015;
    out.m_88.x = 0.0;
    float _3033 = fma(_3023, _3027, _3009);
    float _3035 = -_3017;
    float _3037 = _3035 + _3019;
    float _3039 = fma(_3023, _3031, _3013);
    float _3041 = _3033 * 0.586610972881317138671875;
    bool _3043 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3045 = fma(_3023, _3037, _3017);
    float _3047 = _2837 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3049 = fma(_3039, 0.298911988735198974609375, _3041);
    bool _3051 = _2218 > 0.0;
    bool _3053 = isnan(_2218);
    bool _3055 = _3051 || _3053;
    bool _3057 = isnan(0.0);
    bool _3059 = _3055 || _3057;
    float _3061 = fma(_3045, 0.114477999508380889892578125, _3049);
    out.m_57.x = _3047;
    bool _3063 = _2278 <= 0.0;
    bool _3065 = !_3059;
    bool _3067 = _3063 || _3065;
    float _3069 = -_3061;
    float _3071 = _3039 + _3069;
    float _3073 = -_3061;
    float _3075 = _3033 + _3073;
    float _3077 = -_3061;
    float _3079 = _3045 + _3077;
    float _3081 = fma(_3071, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3061);
    float _3083 = fma(_3075, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3061);
    float _3085 = fma(_3079, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3061);
    bool _3087 = !_3043;
    if (!_3087)
    {
        float _3089 = -_2152;
        float _3091 = _3089 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3093 = -_2154;
        float _3095 = _3093 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3097 = -_2156;
        float _3099 = _3097 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3101 = _3091 * _3091;
        float _3103 = fma(_3095, _3095, _3101);
        float _3105 = fma(_3099, _3099, _3103);
        float _3107 = sqrt(_3105);
        float _3109 = rsqrt(_3105);
        float _3111 = -_3107;
        float _3113 = _3111 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3115 = _3113 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3117 = precise::clamp(_3115, 0.0, 1.0);
        float _3119 = _3095 * _3109;
        float _3121 = _3091 * _3109;
        float _3123 = abs(_3117);
        float _3125 = log2(_3123);
        float _3127 = _3099 * _3109;
        float _3129 = _3119 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3131 = _1932 * _3121;
        float _3133 = -_3121;
        float _3135 = -_3129;
        float _3137 = fma(_3133, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3135);
        float _3139 = fma(_1930, _3119, _3131);
        float _3141 = -_3127;
        float _3143 = fma(_3141, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3137);
        float _3145 = fma(_1934, _3127, _3139);
        float _3147 = precise::clamp(_3145, 0.0, 1.0);
        float _3149 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3151 = _3143 + _3149;
        float _3153 = _3125 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3155 = _3151 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3157 = precise::clamp(_3155, 0.0, 1.0);
        float _3159 = exp2(_3153);
        float _3161 = _3159 * _3157;
        float _3163 = _3147 * _3161;
        float _3165 = _3163 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3167 = _3163 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3169 = _3163 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_88.x = _3165;
        out.m_88.y = _3167;
        out.m_88.z = _3169;
    }
    out.m_90.x = _3081;
    out.m_90.y = _3083;
    out.m_90.z = _3085;
    if (!_3067)
    {
        return out;
    }
    out.m_57.x = 0.0;
    float _3171 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3171;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint dm_vid = gl_VertexIndex;
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2923 = false;
    bool _1984 = false;
    bool _207 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _104 = in.m_50.w;
    float _106 = in.m_52.w;
    float _108 = trunc(_104);
    int _111 = int(_108);
    float _113 = -_106;
    float _115 = _113 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_55.y = _115;
    bool _119 = _111 >= 1;
    float _121 = 0.0;
    float _123 = as_type<float>(_111);
    float _125 = _115;
    if (!_119)
    {
        _121 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _127 = _121;
    if (!_119)
    {
        out.m_57.x = 0.0;
    }
    int _129 = 0;
    if (!_119)
    {
        float _131 = _127 * 5.0;
        _129 = as_type<int>(_131);
    }
    int _133 = _129;
    int _135 = _133;
    if (!_119)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3240 = as_type<float>(_133);
        out.gl_Position.z = _3240;
    }
    if (!_119)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _137 = _106 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _139 = isnan(_106);
    bool _141 = _137 || _139;
    bool _143 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _145 = _141 || _143;
    float _147 = float(_111);
    bool _149 = _115 >= _147;
    bool _151 = !_145;
    bool _153 = _149 || _151;
    if (_153)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _155 = _123;
    if (_153)
    {
        out.m_57.x = 0.0;
    }
    if (_153)
    {
        float _157 = _155 * 5.0;
        _135 = as_type<int>(_157);
    }
    int _159 = _135;
    if (_153)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3295 = as_type<float>(_159);
        out.gl_Position.z = _3295;
    }
    if (_153)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _161 = as_type<float>(int(gl_VertexIndex));
    float _163 = 1.0 / _147;
    bool _165 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _167 = _115 * _163;
    int _169 = as_type<int>(_161) & 1;
    bool _171 = _169 != 0;
    int _173 = as_type<int>(_161) & 2;
    bool _175 = _173 != 0;
    bool _177 = !_171;
    float _179 = _177 ? (-0.5) : 0.5;
    bool _181 = !_175;
    float _183 = _181 ? (-0.5) : 0.5;
    bool _185 = !_165;
    float _187 = _167;
    float _205;
    if (!_185)
    {
        float _189 = in.m_62.x;
        float _191 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _193 = _189 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _195 = fma(_193, (*spvDescriptorSet0.vp_c9)._m0[12].x, _115);
        float _197 = _195 * _191;
        float _199 = floor(_197);
        float _201 = -_199;
        float _203 = _197 + _201;
        _205 = _203;
        _207 = true;
    }
    else
    {
        _205 = _167;
    }
    _207 = false;
    float _209 = _205;
    float _211 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _213 = _209 + _211;
    float _215 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _217 = _209 + _215;
    float _219 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _221 = _209 + _219;
    float _223 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _225 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _223;
    float _227 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _229 = _227 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _231 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _233 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _231;
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _237 = _235 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _239 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _241 = isnan(_209);
    bool _243 = _239 || _241;
    bool _245 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _247 = _243 || _245;
    float _249 = float(_247);
    float _251 = 1.0 / _225;
    bool _253 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _255 = 1.0 / _229;
    float _257 = 1.0 / _233;
    float _259 = _213 * _251;
    float _261 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _263 = _209 + _261;
    float _265 = 1.0 / _237;
    float _267 = _217 * _255;
    bool _269 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _271 = isnan(_209);
    bool _273 = _269 || _271;
    bool _275 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _277 = _273 || _275;
    float _279 = float(_277);
    bool _281 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _283 = isnan(_209);
    bool _285 = _281 || _283;
    bool _287 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _289 = _285 || _287;
    float _291 = float(_289);
    float _293 = _221 * _257;
    float _295 = -_249;
    float _297 = _295 + 1.0;
    float _299 = -_279;
    float _301 = _299 + 1.0;
    float _303 = _279 * _297;
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _307 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _305;
    float _309 = _263 * _265;
    float _311 = _291 * _301;
    bool _313 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _315 = isnan(_209);
    bool _317 = _313 || _315;
    bool _319 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _321 = _317 || _319;
    float _323 = float(_321);
    float _325 = -_291;
    float _327 = _325 + 1.0;
    float _329 = fma(_307, _259, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _333 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _331;
    bool _335 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _337 = isnan(_209);
    bool _339 = _335 || _337;
    bool _341 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _343 = _339 || _341;
    float _345 = float(_343);
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _349 = _347 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _353 = _351 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _355 = fma(_333, _259, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _357 = _323 * _327;
    float _359 = -_323;
    float _361 = _359 + 1.0;
    float _363 = -_345;
    float _365 = _363 + 1.0;
    float _367 = fma(_353, _267, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _369 = fma(_349, _267, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _371 = _345 * _361;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _375 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _373;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _377;
    float _381 = _355 * _371;
    float _383 = _329 * _371;
    float _385 = fma(_375, _293, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _387 = fma(_379, _293, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _389 = fma(_365, (*spvDescriptorSet0.vp_c9)._m0[143].x, _381);
    float _391 = fma(_365, (*spvDescriptorSet0.vp_c9)._m0[143].y, _383);
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _395 = _393 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _399 = _397 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _401 = fma(_367, _357, _389);
    float _403 = fma(_369, _357, _391);
    float _405 = fma(_395, _309, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _407 = fma(_399, _309, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _409 = fma(_385, _311, _401);
    float _411 = fma(_387, _311, _403);
    float _413 = fma(_405, _303, _409);
    float _415 = fma(_407, _303, _411);
    float _417 = fma(_249, (*spvDescriptorSet0.vp_c9)._m0[147].x, _413);
    float _419 = fma(_249, (*spvDescriptorSet0.vp_c9)._m0[147].y, _415);
    bool _421 = !_253;
    if (!_421)
    {
        float _423 = in.m_62.x;
        float _425 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _427 = _423 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _429 = fma(_427, (*spvDescriptorSet0.vp_c9)._m0[11].y, _115);
        float _431 = _429 * _425;
        float _433 = floor(_431);
        float _435 = -_433;
        float _437 = _431 + _435;
        _187 = _437;
    }
    float _439 = _187;
    float _441 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _443 = int(_441);
    bool _445 = _439 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _447 = isnan(_439);
    bool _449 = _445 || _447;
    bool _451 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _453 = _449 || _451;
    float _455 = float(_453);
    float _457 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _459 = int(_457);
    float _461 = float(_443);
    float _463 = 1.0 / _461;
    float _465 = float(uint(_459));
    int _467 = ~_459;
    int _469 = _467 + 1;
    bool _471 = _459 == 0;
    float _473 = 1.0 / _465;
    int _475 = ~_459;
    int _477 = _475 + 1;
    int _479 = ~_459;
    int _481 = _479 + 1;
    float _483 = _463 * _115;
    float _485 = trunc(_483);
    int _487 = int(_485);
    int _489 = as_type<int>(_473) + (-2);
    float _491 = float(uint(_487));
    float _493 = float(_487);
    float _495 = as_type<float>(_489) * _491;
    int _497 = ~_459;
    int _499 = _497 + 1;
    float _501 = trunc(_495);
    float _503 = precise::max(_501, 0.0);
    uint _506 = uint(_503);
    int _508 = _499 * int(_506);
    int _510 = _508 + _487;
    float _512 = in.m_62.x;
    float _514 = in.m_62.y;
    float _516 = in.m_62.z;
    float _518 = in.m_62.w;
    float _520 = float(uint(_510));
    float _522 = as_type<float>(_489) * _520;
    int _524 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _526 = _524 != 0;
    float _528 = trunc(_522);
    float _530 = precise::max(_528, 0.0);
    uint _532 = uint(_530);
    bool _534 = !_526;
    float _536 = _534 ? 7.345489978790283203125 : 1.0;
    float _538 = _536 * _512;
    float _540 = floor(_538);
    int _542 = int(_506) + int(_532);
    float _544 = float(_459);
    int _546 = _469 * _542;
    int _548 = _546 + _487;
    bool _550 = _493 >= _544;
    bool _552 = isnan(_493);
    bool _554 = _550 || _552;
    bool _556 = isnan(_544);
    bool _558 = _554 || _556;
    float _560 = float(_558);
    bool _562 = uint(_548) >= uint(_459);
    float _564 = trunc(_560);
    int _566 = int(_564);
    bool _568 = !_562;
    int _570 = _568 ? 0 : (-1);
    float _572 = -_540;
    float _574 = _538 + _572;
    int _576 = ~_542;
    int _578 = _576 + _570;
    int _580 = _578 + 1;
    float _582 = _574 * _544;
    float _584 = _544 * _115;
    int _586 = _459 * _580;
    int _588 = _586 + _487;
    float _590 = _584 * _163;
    float _592 = trunc(_582);
    int _594 = int(_592);
    int _596 = ~_566;
    int _598 = _596 + 1;
    int _600 = _598 + 1;
    bool _602 = !_471;
    int _604 = _602 ? _588 : (-1);
    float _606 = trunc(_590);
    int _608 = int(_606);
    int _610 = _604 * _600;
    int _612 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _614 = _612 != 0;
    int _616 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _618 = _616 != 0;
    int _620 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _622 = _620 != 0;
    int _624 = _459 + (-1);
    int _626 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _628 = _626 != 0;
    bool _630 = !_618;
    int _632 = _630 ? 0 : 1;
    int _634 = _566 * _624;
    int _636 = _634 + _610;
    bool _638 = !_614;
    int _640 = _638 ? 0 : 1;
    bool _642 = !_628;
    int _644 = _642 ? 0 : 1;
    int _646 = abs(_632);
    int _648 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _650 = _648 != 0;
    bool _652 = !_622;
    int _654 = _652 ? 0 : 1;
    int _656 = _636 * _646;
    int _658 = abs(_640);
    int _660 = abs(_644);
    bool _662 = !_650;
    int _664 = _662 ? 0 : 1;
    int _666 = abs(_654);
    int _668 = _594 * _660;
    int _670 = _668 + _487;
    int _672 = abs(_664);
    int _674 = _608 * _658;
    int _676 = _674 + _656;
    int _678 = ~_459;
    int _680 = _678 + 1;
    int _682 = _670 * _666;
    int _684 = _682 + _676;
    int _686 = ~_459;
    int _688 = _686 + 1;
    int _690 = _594 * _672;
    int _692 = _690 + _684;
    bool _694 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _696 = isnan(0.0);
    bool _698 = _694 || _696;
    bool _700 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _702 = _698 || _700;
    float _704 = float(uint(_692));
    float _706 = as_type<float>(_489) * _704;
    float _708 = trunc(_706);
    float _710 = precise::max(_708, 0.0);
    uint _712 = uint(_710);
    float _714 = _512 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _716 = _688 * int(_712);
    int _718 = _716 + _692;
    float _720 = float(uint(_718));
    float _722 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _724 = log2(_722);
    float _726 = as_type<float>(_489) * _720;
    float _728 = trunc(_726);
    float _730 = precise::max(_728, 0.0);
    uint _732 = uint(_730);
    float _734 = _724 * _115;
    int _736 = int(_712) + int(_732);
    float _738 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _740 = exp2(_734);
    float _742 = _512 * 2.0;
    int _744 = _680 * _736;
    int _746 = _744 + _692;
    float _748 = -_738;
    float _750 = fma(_714, 2.0, _748);
    float _752 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _754 = _514 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _756 = floor(_742);
    bool _758 = uint(_746) >= uint(_459);
    float _760 = fma(_754, -2.0, _752);
    bool _762 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _764 = isnan(1.0);
    bool _766 = _762 || _764;
    bool _768 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _770 = _766 || _768;
    float _772 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _774 = 1.0 + _772;
    bool _776 = !_758;
    int _778 = _776 ? 0 : (-1);
    float _780 = -_115;
    float _782 = fma(_780, (*spvDescriptorSet0.vp_c9)._m0[76].x, _750);
    float _784 = 1.0 / _774;
    int _786 = ~_736;
    int _788 = _786 + _778;
    int _790 = _788 + 1;
    float _792 = -_740;
    float _794 = _792 + 1.0;
    int _796 = _459 * _790;
    int _798 = _796 + _692;
    float _800 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _802 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _804 = _702 ? _794 : 0.0;
    float _806 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[76].y, _760);
    bool _808 = !_471;
    int _810 = _808 ? _798 : (-1);
    float _812 = fma(_514, (*spvDescriptorSet0.vp_c9)._m0[78].w, _800);
    float _814 = float(uint(_670));
    float _816 = fma(_512, (*spvDescriptorSet0.vp_c9)._m0[78].z, _802);
    int _818 = _810 & 3;
    bool _820 = _818 != 0;
    float _822 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[77].w, _812);
    int _824 = _810 & 3;
    bool _826 = _824 != 0;
    float _828 = as_type<float>(_489) * _814;
    int _830 = _820 ? 0 : 1;
    float _832 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[77].z, _816);
    bool _834 = _756 > 0.0;
    if (_770)
    {
        float _836 = _804 * _784;
        _125 = _836;
    }
    float _838 = _125;
    bool _840 = uint(_824) > 1u;
    float _842 = trunc(_828);
    float _844 = precise::max(_842, 0.0);
    uint _846 = uint(_844);
    bool _848 = _824 != 3;
    float _850 = -_832;
    float _852 = _850 + 1.0;
    bool _854 = _756 >= 0.0;
    bool _856 = isnan(_756);
    bool _858 = _854 || _856;
    bool _860 = isnan(0.0);
    bool _862 = _858 || _860;
    float _864 = -_822;
    float _866 = _864 + 1.0;
    bool _868 = uint(_824) >= 2u;
    int _870 = _862 ? 0 : 1;
    int _872 = _868 ? 0 : 1;
    bool _874 = _518 > 0.5;
    float _876 = _514 * 2.0;
    int _878 = ~_870;
    int _880 = _878 + 1;
    int _882 = _880 + 1;
    int _884 = ~_830;
    int _886 = _884 + 1;
    int _888 = _886 + 1;
    float _890 = floor(_876);
    int _892 = ~_872;
    int _894 = _892 + 1;
    int _896 = _894 + 1;
    int _898 = _882;
    int _900 = _888;
    int _902 = _896;
    if (!_834)
    {
        int _904 = ~_870;
        int _906 = _904 + 1;
        _898 = _906;
    }
    int _908 = _898;
    if (!_840)
    {
        int _910 = ~_830;
        int _912 = _910 + 1;
        _900 = _912;
    }
    int _914 = _900;
    if (_848)
    {
        int _916 = ~_872;
        int _918 = _916 + 1;
        _902 = _918;
    }
    int _920 = _902;
    float _922 = in.m_50.x;
    float _924 = in.m_50.y;
    float _926 = in.m_50.z;
    bool _928 = _512 > 0.5;
    int _930 = _477 * int(_846);
    int _932 = _930 + _670;
    int _934 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _936 = _934 != 0;
    float _938 = -_179;
    int _940 = _928 ? as_type<int>(_938) : as_type<int>(_179);
    bool _942 = _514 > 0.5;
    bool _944 = !_936;
    float _946 = _944 ? _179 : as_type<float>(_940);
    float _948 = float(uint(_932));
    float _950 = -_183;
    int _952 = _942 ? as_type<int>(_950) : as_type<int>(_183);
    float _954 = _946 + 0.5;
    bool _956 = _890 >= 0.0;
    bool _958 = isnan(_890);
    bool _960 = _956 || _958;
    bool _962 = isnan(0.0);
    bool _964 = _960 || _962;
    float _966 = as_type<float>(_489) * _948;
    float _968 = fma(_954, (*spvDescriptorSet0.vp_c9)._m0[80].x, _782);
    int _970 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _972 = _970 != 0;
    float _974 = trunc(_966);
    float _976 = precise::max(_974, 0.0);
    uint _978 = uint(_976);
    int _980 = _964 ? 0 : 1;
    float _982 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _984 = _982 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _986 = _924 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _988 = _890 > 0.0;
    float _990 = _924 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _992 = !_972;
    int _994 = _992 ? 0 : 1;
    float _996 = _924 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _998 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1000 = _998 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    int _1002 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1004 = _1002 != 0;
    float _1006 = 1.0 / _984;
    int _1008 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1010 = _1008 != 0;
    float _1012 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _1014 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1016 = _1014 != 0;
    float _1018 = fma(_922, (*spvDescriptorSet0.vp_c10)._m0[4].x, _986);
    float _1020 = _1012 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1022 = 1.0 / _1000;
    float _1024 = fma(_922, (*spvDescriptorSet0.vp_c10)._m0[5].x, _990);
    float _1026 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1028 = fma(_922, (*spvDescriptorSet0.vp_c10)._m0[6].x, _996);
    float _1030 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1032 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1034 = _1026 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1036 = int(_846) + int(_978);
    float _1038 = _1030 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1040 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1042 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1040;
    float _1044 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1046 = _1044 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1048 = _514 + _516;
    out.m_64.x = _1020;
    out.m_64.y = _1034;
    out.m_64.z = _1038;
    out.m_64.w = _1032;
    int _1050 = _481 * _1036;
    int _1052 = _1050 + _670;
    int _1054 = ~_980;
    int _1056 = _1054 + 1;
    int _1058 = _1056 + 1;
    float _1060 = _1046 * _1022;
    int _1062 = _1058;
    if (!_988)
    {
        int _1064 = ~_980;
        int _1066 = _1064 + 1;
        _1062 = _1066;
    }
    int _1068 = _1062;
    float _1070 = _516 * 2.0;
    bool _1072 = !_1004;
    float _1074 = _1072 ? _183 : as_type<float>(_952);
    float _1076 = _1048 + (-1.0);
    bool _1078 = uint(_1052) >= uint(_459);
    float _1080 = _514 + _512;
    float _1082 = _1042 * _1006;
    bool _1084 = !_1078;
    int _1086 = _1084 ? 0 : (-1);
    float _1088 = _1080 + (-1.0);
    int _1090 = _810 >> 31;
    float _1092 = floor(_1070);
    float _1094 = fma(_1076, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1096 = _1090 & 3;
    float _1098 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1100 = _439 + _1098;
    bool _1102 = !_826;
    int _1104 = _1102 ? 0 : 1;
    float _1106 = fma(_926, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1018);
    int _1108 = _810 + _1096;
    float _1110 = fma(_1060, _1100, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _1112 = _439 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1114 = isnan(_439);
    bool _1116 = _1112 || _1114;
    bool _1118 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1120 = _1116 || _1118;
    float _1122 = float(_1120);
    float _1124 = fma(_1088, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1126 = _1108 >> 2;
    float _1128 = fma(_926, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1024);
    int _1130 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1132 = _1130 != 0;
    int _1134 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1136 = _1134 != 0;
    int _1138 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1140 = _1138 != 0;
    float _1142 = -_1122;
    float _1144 = _1142 + 1.0;
    bool _1146 = _439 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1148 = isnan(_439);
    bool _1150 = _1146 || _1148;
    bool _1152 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1154 = _1150 || _1152;
    float _1156 = float(_1154);
    float _1158 = _1074 + (-0.5);
    int _1160 = _1126 << 4;
    int _1162 = _1160 + 368;
    float _1164 = _514 + (-0.5);
    bool _1166 = !_1136;
    int _1168 = _1166 ? 0 : 1;
    float _1170 = _1156 * _1144;
    float _1172 = -_1156;
    float _1174 = _1172 + 1.0;
    bool _1176 = !_1132;
    int _1178 = _1176 ? 0 : 1;
    uint _1180 = uint(int(uint(_1162) >> uint(2)));
    uint _1182 = uint(int(uint(int(_1180)) >> uint(2)));
    int _1184 = int(_1180) & 3;
    float _1186 = (*spvDescriptorSet0.vp_c9)._m0[int(_1182)][_1184];
    int _1188 = int(_1180) + 1;
    uint _1190 = uint(int(uint(_1188) >> uint(2)));
    int _1192 = _1188 & 3;
    float _1194 = (*spvDescriptorSet0.vp_c9)._m0[int(_1190)][_1192];
    bool _1196 = _1092 > 0.0;
    float _1198 = -_1158;
    float _1200 = -_806;
    float _1202 = fma(_1198, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1200);
    bool _1204 = _1092 >= 0.0;
    bool _1206 = isnan(_1092);
    bool _1208 = _1204 || _1206;
    bool _1210 = isnan(0.0);
    bool _1212 = _1208 || _1210;
    float _1214 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1216 = _439 + _1214;
    float _1218 = _455 * _1174;
    float _1220 = -_455;
    float _1222 = _1220 + 1.0;
    float _1224 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _1226 = _1162 + 8;
    uint _1228 = uint(int(uint(_1226) >> uint(2)));
    uint _1230 = uint(int(uint(int(_1228)) >> uint(2)));
    int _1232 = int(_1228) & 3;
    float _1234 = (*spvDescriptorSet0.vp_c9)._m0[int(_1230)][_1232];
    int _1236 = int(_1228) + 1;
    uint _1238 = uint(int(uint(_1236) >> uint(2)));
    int _1240 = _1236 & 3;
    float _1242 = (*spvDescriptorSet0.vp_c9)._m0[int(_1238)][_1240];
    float _1244 = fma(_1082, _1216, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1246 = fma(_926, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1028);
    int _1248 = _1212 ? 0 : 1;
    float _1250 = fma(_1074, _866, _1202);
    float _1252 = _1244 * _1218;
    bool _1254 = _516 > 0.5;
    float _1256 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _1258 = ~_1248;
    int _1260 = _1258 + 1;
    int _1262 = _1260 + 1;
    float _1264 = fma(_1222, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1252);
    int _1266 = _1262;
    if (!_1196)
    {
        int _1268 = ~_1248;
        int _1270 = _1268 + 1;
        _1266 = _1270;
    }
    int _1272 = _1266;
    float _1274 = -_179;
    int _1276 = _1254 ? as_type<int>(_1274) : as_type<int>(_179);
    float _1278 = fma(_1110, _1170, _1264);
    float _1280 = -_183;
    int _1282 = _874 ? as_type<int>(_1280) : as_type<int>(_183);
    float _1284 = -_852;
    float _1286 = fma(_946, _1284, _968);
    int _1288 = abs(_1168);
    bool _1290 = !_1010;
    float _1292 = _1290 ? _179 : as_type<float>(_1276);
    bool _1294 = !_1016;
    float _1296 = _1294 ? _183 : as_type<float>(_1282);
    float _1298 = float(_908);
    float _1300 = _1292 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1302 = float(_1288);
    float _1304 = _1296 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _1306 = ~_1036;
    int _1308 = _1306 + _1086;
    int _1310 = _1308 + 1;
    float _1312 = _1300 * _1224;
    int _1314 = abs(_914);
    float _1316 = _1302 * _1298;
    float _1318 = _1304 * _1256;
    int _1320 = _459 * _1310;
    int _1322 = _1320 + _670;
    float _1324 = _1128 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1326 = abs(_1104);
    out.m_66.x = _1286;
    out.m_66.y = _1250;
    out.m_66.z = _1312;
    out.m_66.w = _1318;
    int _1328 = ~_1314;
    int _1330 = _1328 + 1;
    int _1332 = _1330 + 1;
    float _1334 = _1106 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1336 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1338 = _1324 + _1336;
    float _1340 = _1246 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1342 = fma(_1122, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1278);
    float _1344 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1346 = _1334 + _1344;
    int _1348 = _1332 * as_type<int>(_1194);
    int _1350 = abs(_920);
    float _1352 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1354 = _1340 + _1352;
    float _1356 = float(_1272);
    float _1358 = _1342 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1360 = _1338 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1362 = _512 + (-0.5);
    int _1364 = ~_1326;
    int _1366 = _1364 + 1;
    int _1368 = _1366 + 1;
    float _1370 = fma(_1346, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1360);
    bool _1372 = !_471;
    int _1374 = _1372 ? _1322 : (-1);
    float _1376 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _1378 = _824 != 3;
    int _1380 = _1368 * as_type<int>(_1186);
    int _1382 = _1380 + _1348;
    int _1384 = ~_1350;
    int _1386 = _1384 + 1;
    int _1388 = _1386 + 1;
    float _1390 = fma(_1354, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1370);
    bool _1392 = !_1378;
    int _1394 = _1392 ? 0 : (-1);
    float _1396 = _1376 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1398 = _1388 * as_type<int>(_1234);
    int _1400 = _1398 + _1382;
    int _1402 = abs(_1394);
    float _1404 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _1406 = _1390 >= 0.0;
    float _1408 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _1410 = abs(_1178);
    float _1412 = in.m_68.x;
    float _1414 = in.m_68.y;
    float _1416 = in.m_68.z;
    int _1418 = abs(_994);
    float _1420 = _1404 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1422 = ~_1402;
    int _1424 = _1422 + 1;
    int _1426 = _1424 + 1;
    float _1428 = _1408 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1430 = _1338 * _1338;
    int _1432 = ~_1418;
    int _1434 = _1432 + 1;
    int _1436 = _1434 + 1;
    int _1438 = _1426 * as_type<int>(_1242);
    int _1440 = _1438 + _1400;
    float _1442 = float(_1410);
    float _1444 = fma(_1346, _1346, _1430);
    out.m_70.x = _1396;
    out.m_70.y = _1428;
    out.m_70.z = _1420;
    out.m_70.w = _1358;
    int _1446 = _1440 * _1436;
    float _1448 = fma(_1354, _1354, _1444);
    float _1450 = _1442 * _1356;
    int _1452 = _1374 * _1418;
    int _1454 = _1452 + _1446;
    float _1456 = _1450;
    if (_1406)
    {
        out.m_57.x = 0.0;
    }
    float _1458 = _1450 * (-2.0);
    float _1460 = rsqrt(_1448);
    if (_1406)
    {
        _1456 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1462 = _1456;
    float _1464 = float(_1454);
    float _1466 = fma(_1458, _1412, _1412);
    float _1468 = fma(_1124, _1458, _1124);
    int _1470 = as_type<int>(_1462);
    if (_1406)
    {
        float _1472 = _1462 * 5.0;
        _1470 = as_type<int>(_1472);
    }
    int _1474 = _1470;
    bool _1476 = !_1140;
    int _1478 = _1476 ? 0 : 1;
    float _1480 = fma(_1362, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1466);
    out.m_72.x = _1464;
    int _1482 = abs(_1478);
    float _1484 = fma(_1468, _838, _1480);
    if (_1406)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5298 = as_type<float>(_1474);
        out.gl_Position.z = _5298;
    }
    float _1486 = _1338 * _1460;
    float _1488 = _1346 * _1460;
    if (_1406)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1490 = -_1486;
    float _1492 = fma(_1490, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1324);
    float _1494 = _1354 * _1460;
    float _1496 = -_1488;
    float _1498 = fma(_1496, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1334);
    float _1500 = _1316 * (-2.0);
    float _1502 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1504 = _1492 + _1502;
    float _1506 = -_1494;
    float _1508 = fma(_1506, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1340);
    float _1510 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1512 = _1498 + _1510;
    float _1514 = fma(_1500, _1414, _1414);
    float _1516 = _1504 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1518 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1520 = _1508 + _1518;
    float _1522 = float(_1068);
    float _1524 = fma(_1094, _1500, _1094);
    float _1526 = fma(_1512, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1516);
    float _1528 = float(_1482);
    float _1530 = -_1486;
    float _1532 = fma(_1530, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1338);
    float _1534 = fma(_1164, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1514);
    float _1536 = fma(_1520, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1526);
    float _1538 = -_1488;
    float _1540 = fma(_1538, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1346);
    float _1542 = _1528 * _1522;
    float _1544 = _1532 * _1532;
    float _1546 = fma(_1524, _838, _1534);
    bool _1548 = _1536 >= 0.0;
    float _1550 = in.m_74.x;
    float _1552 = in.m_74.y;
    float _1554 = fma(_1540, _1540, _1544);
    float _1556 = _1542 * (-2.0);
    float _1558 = -_1494;
    float _1560 = fma(_1558, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1354);
    float _1562 = _516 + _512;
    float _1564 = fma(_1556, _1416, _1416);
    float _1566 = fma(_1560, _1560, _1554);
    float _1568 = _1562 + (-1.0);
    float _1570 = _516 + (-0.5);
    float _1572 = _1484 * 0.15915493667125701904296875;
    float _1574 = _1546 * 0.15915493667125701904296875;
    float _1576 = fma(_1568, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1578 = _1560;
    int _1580 = as_type<int>(_1570);
    float _1582 = _1492;
    float _1584 = _1512;
    if (_1548)
    {
        _1578 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1586 = _1578;
    float _1588 = fma(_1570, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1564);
    float _1590 = _1572 * 6.283185482025146484375;
    float _1592 = sin(_1590);
    float _1594 = fma(_1576, _1556, _1576);
    if (_1548)
    {
        out.m_57.x = 0.0;
    }
    if (_1548)
    {
        float _1596 = _1586 * 5.0;
        _1580 = as_type<int>(_1596);
    }
    int _1598 = _1580;
    float _1600 = fma(_1594, _838, _1588);
    float _1602 = _1572 * 6.283185482025146484375;
    float _1604 = cos(_1602);
    if (_1548)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5505 = as_type<float>(_1598);
        out.gl_Position.z = _5505;
    }
    float _1606 = _419 * _1552;
    float _1608 = _1600 * 0.15915493667125701904296875;
    float _1610 = _1574 * 6.283185482025146484375;
    float _1612 = sin(_1610);
    float _1614 = sqrt(_1566);
    float _1616 = _1574 * 6.283185482025146484375;
    float _1618 = cos(_1616);
    if (_1548)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1620 = _1606 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1622 = _1460 * _1614;
    float _1624 = _1608 * 6.283185482025146484375;
    float _1626 = cos(_1624);
    float _1628 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _183);
    float _1630 = _417 * _1550;
    float _1632 = _1620 * _1622;
    float _1634 = _1592 * _1612;
    float _1636 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _179);
    float _1638 = _1604 * _1612;
    float _1640 = _1628 * _1632;
    float _1642 = _1608 * 6.283185482025146484375;
    float _1644 = sin(_1642);
    float _1646 = _1630 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1648 = _1604 * _1618;
    float _1650 = _1592 * _1618;
    float _1652 = _1646 * _1622;
    float _1654 = _1604 * _1626;
    float _1656 = _1636 * _1652;
    float _1658 = _1618 * _1626;
    float _1660 = _1592 * _1626;
    float _1662 = _1654 * _1640;
    float _1664 = _1612 * _1626;
    float _1666 = _1622 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1668 = _1666 * 0.5;
    float _1670 = fma(_1644, _1648, _1634);
    float _1672 = -_1650;
    float _1674 = fma(_1644, _1638, _1672);
    float _1676 = -_1640;
    float _1678 = _1644 * _1676;
    float _1680 = _1660 * _1640;
    float _1682 = fma(_1670, _1656, _1662);
    float _1684 = -_1638;
    float _1686 = fma(_1644, _1650, _1684);
    float _1688 = fma(_1658, _1656, _1678);
    float _1690 = fma(_1644, _1634, _1648);
    float _1692 = fma(_1674, _1668, _1682);
    float _1694 = fma(_1686, _1656, _1680);
    float _1696 = fma(_1664, _1668, _1688);
    float _1698 = _1692 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1700 = _1692 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1702 = fma(_1690, _1668, _1694);
    float _1704 = _1692 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1706 = fma(_1696, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1698);
    float _1708 = fma(_1696, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1700);
    float _1710 = fma(_1696, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1704);
    float _1712 = fma(_1702, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1706);
    float _1714 = fma(_1702, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1708);
    float _1716 = fma(_1702, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1710);
    float _1718 = _1712 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1720 = _1714 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1722 = _1716 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1724 = _1334 + _1718;
    float _1726 = _1340 + _1720;
    float _1728 = _1324 + _1722;
    float _1730 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1732 = _1724 + _1730;
    float _1734 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1736 = _1726 + _1734;
    float _1738 = _1732 * _1732;
    float _1740 = _1736 * _1736;
    float _1742 = _1738 + _1740;
    float _1744 = sqrt(_1742);
    bool _1746 = _1744 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1748 = _1702;
    float _1750 = _1696;
    float _1752 = _1656;
    float _1754 = _1726;
    float _1756 = _1740;
    if (!_1746)
    {
        _1748 = _1738;
    }
    float _1758 = _1748;
    float _1760 = _1758;
    if (!_1746)
    {
        _1750 = _1724;
    }
    float _1762 = _1750;
    float _1764 = _1762;
    if (!_1746)
    {
        _1752 = _1728;
    }
    float _1766 = _1752;
    bool _1768 = !_1746;
    float _1770 = _1766;
    if (!_1768)
    {
        float _1772 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1774 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1776 = _1744 + _1774;
        float _1778 = rsqrt(_1742);
        float _1780 = _1776 * _1772;
        float _1782 = _1728 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1784 = _1780 * 0.15915493667125701904296875;
        float _1786 = _1784 * 6.283185482025146484375;
        float _1788 = sin(_1786);
        float _1790 = _1784 * 6.283185482025146484375;
        float _1792 = cos(_1790);
        float _1794 = fma(_1788, _1782, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1796 = _1778 * _1794;
        float _1798 = _1792 + (-1.0);
        float _1800 = fma(_1732, _1796, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1802 = fma(_1736, _1796, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1804 = _1798 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1806 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1808 = _1800 + _1806;
        float _1810 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1812 = _1802 + _1810;
        float _1814 = fma(_1728, _1792, _1804);
        float _1816 = _1808 * _1808;
        float _1818 = _1812 * _1812;
        _1764 = _1800;
        _1754 = _1802;
        _1770 = _1814;
        _1760 = _1816;
        _1756 = _1818;
    }
    float _1820 = _1764;
    float _1822 = _1754;
    float _1824 = _1770;
    float _1826 = _1760;
    float _1828 = _1756;
    float _1830 = fma(_1820, 6.2500002968590706586837768554688e-05, 0.5);
    float _1832 = fma(_1822, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _5870 = float2(_1830, _1832);
    float3 _1836 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_5870, float2(0.0), isnan(_5870)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_5870, float2(0.0), isnan(_5870)), level(0.0)).xyz;
    float _1838 = _1836.x;
    float _1840 = _1836.y;
    float _1842 = _1836.z;
    float _1844 = _1670 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1846 = _1670 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1848 = _1670 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1850 = _1674 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1852 = fma(_1658, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1844);
    float _1854 = fma(_1658, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1846);
    float _1856 = _1654 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1858 = _1654 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1860 = fma(_1658, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1848);
    float _1862 = _1654 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1864 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1866 = _1824 + _1864;
    float _1868 = _1674 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1870 = _1674 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1872 = -_1644;
    float _1874 = fma(_1872, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1856);
    float _1876 = -_1644;
    float _1878 = fma(_1876, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1858);
    float _1880 = -_1644;
    float _1882 = fma(_1880, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1862);
    float _1884 = fma(_1866, _1866, _1826);
    float _1886 = fma(_1664, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1850);
    float _1888 = fma(_1664, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1868);
    float _1890 = fma(_1664, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1870);
    float _1892 = fma(_1660, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1874);
    float _1894 = fma(_1660, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1878);
    float _1896 = _183 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1898 = fma(_1660, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1882);
    float _1900 = _1884 + _1828;
    float _1902 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1886);
    float _1904 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1888);
    float _1906 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1890);
    float _1908 = fma(_1686, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1852);
    float _1910 = fma(_1686, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1854);
    float _1912 = _1896 * _1892;
    float _1914 = _1896 * _1894;
    float _1916 = fma(_1686, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1860);
    float _1918 = _179 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1920 = _1896 * _1898;
    float _1922 = sqrt(_1900);
    float _1924 = fma(_1918, _1908, _1912);
    float _1926 = fma(_1918, _1910, _1914);
    float _1928 = fma(_1918, _1916, _1920);
    float _1930 = _1902 + _1924;
    float _1932 = _1904 + _1926;
    float _1934 = _1906 + _1928;
    out.m_76.x = _1930;
    out.m_76.y = _1932;
    out.m_76.z = _1934;
    bool _1936 = _1922 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1938 = isnan(_1922);
    bool _1940 = _1936 || _1938;
    bool _1942 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1944 = _1940 || _1942;
    float _1946 = _1928;
    float _1948 = _1922;
    if (!_1944)
    {
        _1946 = 1.0;
    }
    float _1950 = _1946;
    out.m_78.x = _1838;
    out.m_78.y = _1840;
    out.m_78.z = _1842;
    bool _1952 = !_1944;
    float _1954 = _1950;
    if (!_1952)
    {
        bool _1956 = _1922 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1958 = isnan(_1922);
        bool _1960 = _1956 || _1958;
        bool _1962 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1964 = _1960 || _1962;
        if (!_1964)
        {
            float _1966 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1968 = _1922 + _1966;
            float _1970 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1972 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1970;
            float _1974 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1976 = _1974 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1978 = 1.0 / _1972;
            float _1980 = _1968 * _1978;
            float _1982 = fma(_1980, _1976, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1954 = _1982;
            _1984 = true;
        }
        else
        {
            bool _1986 = _1922 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1988 = isnan(_1922);
            bool _1990 = _1986 || _1988;
            bool _1992 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1994 = _1990 || _1992;
            if (!_1994)
            {
                float _1996 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1998 = _1922 + _1996;
                float _2000 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2002 = _2000 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2004 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2006 = _2004 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2008 = 1.0 / _2002;
                float _2010 = _1998 * _2008;
                float _2012 = fma(_2010, _2006, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1954 = _2012;
                _1984 = true;
            }
            else
            {
                _1954 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1984 = false;
    float _2014 = _1954;
    float _2016 = _1492 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2018 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2020 = _1824 + _2018;
    float _2022 = fma(_1498, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2016);
    bool _2024 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2026 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2028 = _2024 || _2026;
    bool _2030 = isnan(0.5);
    bool _2032 = _2028 || _2030;
    bool _2034 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2036 = isnan(0.5);
    bool _2038 = _2034 || _2036;
    bool _2040 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2042 = _2038 || _2040;
    float _2044 = fma(_1508, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2022);
    float _2046 = _1492 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2048 = _2044 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2050 = fma(_1498, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2046);
    float _2052 = 1.0 / _2048;
    float _2054 = fma(_1508, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2050);
    if (_2042)
    {
        _1948 = 1.0;
    }
    float _2056 = _1948;
    float _2058 = _2054 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2060 = _2058 + _2048;
    float _2062 = _2060 * _2052;
    float _2064 = _2062 * 0.5;
    float _2066 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2068 = _1820 + _2066;
    float _2070 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2072 = fma(_2064, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2070);
    float _2074 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2076 = _1822 + _2074;
    float _2078 = fma(_2068, _2014, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2080 = fma(_2020, _2014, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2082 = 1.0 / _2072;
    float _2084 = fma(_2076, _2014, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2086 = -_1488;
    float _2088 = fma(_2086, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2078);
    float _2090 = -_1486;
    float _2092 = fma(_2090, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2080);
    float _2094 = -_1494;
    float _2096 = fma(_2094, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2084);
    float _2098 = _2092;
    float _2100 = _2088;
    float _2102 = _2096;
    float _2104 = _2082;
    float _2106 = _2056;
    if (!_2032)
    {
        float _2108 = _1504 * _1504;
        float _2110 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2112 = -_1340;
        float _2114 = _2112 + _2084;
        float _2116 = -_1324;
        float _2118 = _2116 + _2080;
        float _2120 = fma(_1512, _1512, _2108);
        float _2122 = fma(_1520, _1520, _2120);
        float _2124 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2126 = sqrt(_2122);
        float _2128 = 1.0 / _1622;
        float _2130 = _2124 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2132 = precise::min(_2126, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2134 = _2132 * _2110;
        float _2136 = _2134 * _2128;
        float _2138 = -_1334;
        float _2140 = _2138 + _2078;
        float _2142 = _2130 * _2136;
        float _2144 = _2114 * _2136;
        float _2146 = fma(_2118, _2142, _1492);
        float _2148 = fma(_2140, _2142, _1498);
        float _2150 = fma(_2130, _2144, _1508);
        _2098 = _2146;
        _2100 = _2148;
        _2102 = _2150;
    }
    float _2152 = _2098;
    float _2154 = _2100;
    float _2156 = _2102;
    if (_2042)
    {
        _1582 = 1.0;
    }
    float _2158 = _1582;
    float _2160 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2162 = _2082 * _2160;
    float _2164 = _2158;
    if (!_2042)
    {
        float _2166 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2168 = _2166 * 0.15915493667125701904296875;
        float _2170 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2172 = _2168 * 6.283185482025146484375;
        float _2174 = cos(_2172);
        float _2176 = _2170 * 0.15915493667125701904296875;
        float _2178 = _2168 * 6.283185482025146484375;
        float _2180 = sin(_2178);
        float _2182 = 1.0 / _2174;
        float _2184 = _2176 * 6.283185482025146484375;
        float _2186 = cos(_2184);
        float _2188 = _2180 * _2182;
        float _2190 = _2176 * 6.283185482025146484375;
        float _2192 = sin(_2190);
        float _2194 = _2186 * _2188;
        float _2196 = 1.0 / _2194;
        float _2198 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2200 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2198;
        float _2202 = 1.0 / _2200;
        float _2204 = _2192 * _2196;
        float _2206 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2208 = fma(_2162, _2204, _2206);
        float _2210 = _2208 * _2202;
        float _2212 = precise::clamp(_2210, 0.0, 1.0);
        _1584 = _2176;
        _2104 = _2168;
        _2106 = _2212;
    }
    float _2214 = _1584;
    float _2216 = _2104;
    float _2218 = _2106;
    float _2220 = _2214;
    float _2222 = _2216;
    if (!_2042)
    {
        float _2224 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2226 = _2224 * 0.15915493667125701904296875;
        float _2228 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2230 = _2226 * 6.283185482025146484375;
        float _2232 = cos(_2230);
        float _2234 = _2228 * 0.15915493667125701904296875;
        float _2236 = _2226 * 6.283185482025146484375;
        float _2238 = sin(_2236);
        float _2240 = 1.0 / _2232;
        float _2242 = _2234 * 6.283185482025146484375;
        float _2244 = cos(_2242);
        float _2246 = _2238 * _2240;
        float _2248 = _2234 * 6.283185482025146484375;
        float _2250 = sin(_2248);
        float _2252 = _2244 * _2246;
        float _2254 = 1.0 / _2252;
        float _2256 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2258 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2256;
        float _2260 = 1.0 / _2258;
        float _2262 = _2250 * _2254;
        float _2264 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2266 = fma(_2162, _2262, _2264);
        float _2268 = _2266 * _2260;
        float _2270 = precise::clamp(_2268, 0.0, 1.0);
        float _2272 = -_2270;
        float _2274 = _2272 + 1.0;
        _2220 = _2232;
        _2164 = _2274;
    }
    float _2276 = _2220;
    float _2278 = _2164;
    float _2280 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2282 = _2152 + _2280;
    float _2284 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2286 = _2154 + _2284;
    float _2288 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2290 = _2156 + _2288;
    float _2292 = _2282 * _2282;
    float _2294 = fma(_2286, _2286, _2292);
    float _2296 = fma(_2290, _2290, _2294);
    float _2298 = rsqrt(_2296);
    float _2300 = _2298 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2302 = _2286 * _2300;
    float _2304 = _2290 * _2300;
    float _2306 = _2302 * _2302;
    float _2308 = _2304 * _2304;
    float _2310 = _2306 + _2308;
    float _2312 = sqrt(_2310);
    bool _2314 = _2312 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2316 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2318 = _2312 + _2316;
    float _2320 = _1324;
    float _2322 = _2276;
    float _2324 = _2318;
    float _2326 = _2282;
    float _2328 = _2300;
    float _2330 = _2310;
    if (_2314)
    {
        float _2332 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2320 = _2332;
    }
    float _2334 = _2320;
    if (_2314)
    {
        float _2336 = rsqrt(_2310);
        _2322 = _2336;
    }
    float _2338 = _2322;
    float _2340 = _2338;
    if (_2314)
    {
        float _2342 = _2318 * _2334;
        _2324 = _2342;
    }
    float _2344 = _2324;
    float _2346 = sqrt(_2296);
    if (_2314)
    {
        float _2348 = _2344 * 0.15915493667125701904296875;
        _2222 = _2348;
    }
    float _2350 = _2222;
    float _2352 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2354 = _2290;
    float _2356 = _2350;
    if (_2314)
    {
        float _2358 = _2350 * 6.283185482025146484375;
        float _2360 = sin(_2358);
        _2354 = _2360;
    }
    float _2362 = _2354;
    float _2364 = precise::max(0.0, _2352);
    float _2366 = _2298;
    if (_2314)
    {
        float _2368 = _2350 * 6.283185482025146484375;
        float _2370 = cos(_2368);
        _2366 = _2370;
    }
    float _2372 = _2366;
    float _2374 = -_2300;
    float _2376 = -_2364;
    float _2378 = fma(_2282, _2374, _2376);
    float _2380 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_2314)
    {
        float _2382 = _2378 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2326 = _2382;
    }
    float _2384 = _2326;
    float _2386 = fma(_1498, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2388 = _2384;
    float _2390 = _2362;
    if (_2314)
    {
        float _2392 = fma(_2362, _2384, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2388 = _2392;
    }
    float _2394 = _2388;
    float _2396 = _2394;
    if (!_2314)
    {
        _2356 = _2378;
    }
    float _2398 = _2356;
    float _2400 = _2398;
    if (!_2314)
    {
        _2390 = _2304;
    }
    float _2402 = _2390;
    float _2404 = _2402;
    if (_2314)
    {
        float _2406 = _2338 * _2394;
        _2328 = _2406;
    }
    float _2408 = _2328;
    if (!_2314)
    {
        _2340 = _2302;
    }
    float _2410 = _2340;
    float _2412 = _2410;
    if (_2314)
    {
        float _2414 = _2372 + (-1.0);
        _2380 = _2414;
    }
    float _2416 = _2380;
    float _2418 = _2416;
    if (_2314)
    {
        float _2420 = _2302 * _2408;
        _2412 = _2420;
    }
    float _2422 = _2412;
    if (!_2314)
    {
        _2396 = _2306;
    }
    float _2424 = _2396;
    float _2426 = _2424;
    if (_2314)
    {
        float _2428 = _2304 * _2408;
        _2404 = _2428;
    }
    float _2430 = _2404;
    if (_2314)
    {
        float _2432 = _2416 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2330 = _2432;
    }
    float _2434 = _2330;
    if (_2314)
    {
        float _2436 = _2422 * _2422;
        _2426 = _2436;
    }
    float _2438 = _2426;
    if (!_2314)
    {
        _2418 = _2308;
    }
    float _2440 = _2418;
    float _2442 = _2440;
    if (_2314)
    {
        float _2444 = _2430 * _2430;
        _2442 = _2444;
    }
    float _2446 = _2442;
    if (_2314)
    {
        float _2448 = fma(_2378, _2372, _2434);
        _2400 = _2448;
    }
    float _2450 = _2400;
    float _2452 = _2152 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2454 = floor(_2386);
    float _2456 = fma(_2450, _2450, _2438);
    float _2458 = fma(_2154, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2452);
    float _2460 = _2456 + _2446;
    float _2462 = fma(_2156, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2458);
    float _2464 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2466 = fma(_2346, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2464);
    float _2468 = precise::clamp(_2466, 0.0, 1.0);
    float _2470 = rsqrt(_2460);
    float _2472 = _2462 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2474 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2476 = -_2468;
    float _2478 = _2476 + 1.0;
    float _2480 = _2472 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2482 = fma(_1508, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2484 = _2152 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2486 = _2152 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2488 = -_2480;
    float _2490 = fma(_2488, _2474, 1.0);
    float _2492 = _2152 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2494 = abs(_2478);
    float _2496 = log2(_2494);
    float _2498 = fma(_2154, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2486);
    float _2500 = fma(_2154, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2484);
    float _2502 = fma(_2154, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2492);
    float _2504 = _2470 * _2422;
    float _2506 = _2470 * _2450;
    float _2508 = _2470 * _2430;
    float _2510 = fma(_2156, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2498);
    float _2512 = _2504 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2514 = fma(_2156, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2502);
    float _2516 = floor(_2482);
    float _2518 = _2510 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2520 = -_2512;
    float _2522 = fma(_2506, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2520);
    float _2524 = _2514 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2526 = -_2454;
    float _2528 = _2386 + _2526;
    float _2530 = _2518 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2532 = -_2508;
    float _2534 = fma(_2532, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2522);
    float _2536 = fma(_2156, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2500);
    float _2538 = _2496 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2540 = fma(_2524, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2530);
    float _2542 = fma(_2534, -0.5, 0.5);
    float _2544 = _2536 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2546 = exp2(_2538);
    float _2548 = fma(_2472, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2540);
    float _2550 = _2518 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2552 = _2518 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2554 = fma(_2534, 0.5, 0.5);
    float _2556 = fma(_2544, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2548);
    float _2558 = fma(_2524, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2550);
    float _2560 = fma(_2524, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2552);
    float _2562 = log2(_2490);
    float _2564 = -_2516;
    float _2566 = _2482 + _2564;
    float _2568 = fma(_2554, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2570 = fma(_2472, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2558);
    float _2572 = fma(_2472, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2560);
    float _2574 = _2506 + 1.0;
    float _2576 = fma(_2554, _2568, -0.212114393711090087890625);
    float _2578 = fma(_2544, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2570);
    float _2580 = 1.0 / _2556;
    float _2582 = fma(_2544, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2572);
    float _2584 = -_2506;
    float _2586 = fma(_2546, _2574, _2584);
    float _2588 = fma(_2554, _2576, 1.570728778839111328125);
    float _2590 = sqrt(_2542);
    float _2592 = _2562 * 0.693147182464599609375;
    float2 _7127 = float2(_2528, _2566);
    float _2594 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7127, float2(0.0), isnan(_7127)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7127, float2(0.0), isnan(_7127)), level(0.0)).x;
    float _2596 = fma(_2586, 0.5, 0.5);
    float _2598 = _2592 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2600 = _2578 * _2580;
    float _2602 = _2582 * _2580;
    float _2604 = fma(_2600, 0.5, 0.5);
    float _2606 = fma(_2602, -0.5, 0.5);
    float _2608 = _2590 * 0.636619746685028076171875;
    float3 _7155 = float3(_2604, _2606, _2598);
    float _2610 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7155, float3(0.0), isnan(_7155)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7155, float3(0.0), isnan(_7155)), level(0.0)).x;
    float _2612 = -_2588;
    float _2614 = fma(_2608, _2612, 1.0);
    float3 _7171 = float3(_2604, _2606, _2598);
    float4 _2617 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7171, float3(0.0), isnan(_7171)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7171, float3(0.0), isnan(_7171)), level(0.0)).xyzw;
    float _2619 = _2617.x;
    float _2621 = _2617.y;
    float _2623 = _2617.z;
    float _2625 = _2617.w;
    float2 _7187 = float2(_2614, _2596);
    float3 _2627 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7187, float2(0.0), isnan(_7187)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7187, float2(0.0), isnan(_7187)), level(0.0)).xyz;
    float _2629 = _2627.x;
    float _2631 = _2627.y;
    float _2633 = _2627.z;
    float _2635 = _1932 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2637 = _1932 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2639 = _1932 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2641 = abs(_2162);
    float _2643 = log2(_2641);
    float _2645 = fma(_1930, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2635);
    float _2647 = fma(_1930, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2637);
    float _2649 = fma(_1930, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2639);
    float _2651 = _2518 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2653 = fma(_1934, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2645);
    float _2655 = fma(_1934, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2647);
    float _2657 = fma(_1934, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2649);
    float _2659 = _2653 * _2653;
    float _2661 = fma(_2524, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2651);
    out.m_72.x = _1464;
    float _2663 = fma(_2655, _2655, _2659);
    float _2665 = fma(_2472, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2661);
    float _2667 = _2643 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2669 = fma(_2657, _2657, _2663);
    float _2671 = fma(_2544, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2665);
    float _2673 = exp2(_2667);
    bool _2675 = _2162 <= 8000.0;
    bool _2677 = isnan(_2162);
    bool _2679 = _2675 || _2677;
    bool _2681 = isnan(8000.0);
    bool _2683 = _2679 || _2681;
    float _2685 = float(_2683);
    float _2687 = _2578 + _2556;
    out.gl_Position.x = _2578;
    out.gl_Position.y = _2582;
    out.gl_Position.z = _2671;
    out.gl_Position.w = _2556;
    float _2689 = _2687 * 0.5;
    float _2691 = rsqrt(_2669);
    float _2693 = fma(_2673, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2695 = precise::clamp(_2693, 0.0, 1.0);
    float _2697 = fma(_2695, -2.0, 3.0);
    float _2699 = _2695 * _2695;
    float _2701 = _2655 * _2691;
    float _2703 = _2653 * _2691;
    float _2705 = _2699 * _2697;
    float _2707 = fma(_2701, 0.5, 0.5);
    float _2709 = fma(_2703, -0.5, 0.5);
    float _2711 = -_2705;
    float _2713 = _2711 + 1.0;
    float _2715 = _2707;
    float _2717 = _2709;
    float _2719 = _1250;
    if (_1010)
    {
        float _2721 = -_2707;
        float _2723 = _1254 ? _2721 : _2707;
        _2715 = _2723;
    }
    float _2725 = _2715;
    float _2727 = fma(_2713, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2705);
    if (_1016)
    {
        float _2729 = -_2709;
        float _2731 = _874 ? _2729 : _2709;
        _2717 = _2731;
    }
    float _2733 = _2717;
    bool _2735 = _2346 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2737 = isnan(_2346);
    bool _2739 = _2735 || _2737;
    bool _2741 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2743 = _2739 || _2741;
    float _2745 = _2725 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2747 = _2685 * _2727;
    float _2749 = _2733 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2751 = _2745 * _1224;
    float _2753 = _2496 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2755 = _2749 * _1256;
    float _2757 = in.m_80.x;
    float _2759 = _2556 * 0.5;
    float _2761 = _2747 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2763 = exp2(_2753);
    float _2765 = _2671 + _2556;
    float _2767 = fma(_2582, -0.5, _2759);
    out.m_66.x = _1286;
    out.m_66.y = _1250;
    out.m_66.z = _2751;
    out.m_66.w = _2755;
    float _2769 = _2765 * 0.5;
    out.m_82.x = _2689;
    out.m_82.y = _2767;
    out.m_82.z = _2769;
    out.m_82.w = _2556;
    float _2771 = -_2763;
    float _2773 = _2771 + 1.0;
    float _2775 = _2755;
    float _2777 = _1286;
    if (!_2743)
    {
        _2775 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2779 = _2775;
    float _2781 = _2773 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2783 = _2779;
    float _2785 = _2779;
    if (!_2743)
    {
        _2777 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2787 = _2777;
    float _2789 = _2787;
    float _2791 = _2787;
    if (!_2743)
    {
        _2719 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2793 = _2719;
    float _2795 = -_2594;
    float _2797 = _2795 + 1.0;
    float _2799 = _2797 * _2761;
    float _2801 = precise::clamp(_2799, 0.0, 1.0);
    float _2803 = -_2801;
    float _2805 = fma(_2803, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2807 = -_2781;
    float _2809 = _2807 + 1.0;
    float _2811 = _2805 * _2757;
    float _2813 = _2781 * _2610;
    float _2815 = _2811 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2817 = _2811;
    float _2819 = _2793;
    float _2821 = _2793;
    if (!_2743)
    {
        _2817 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2823 = _2817;
    float _2825 = _2625 * _2813;
    float _2827 = _2625 * _2809;
    out.m_84.x = _2815;
    float _2829 = _2218 * _2278;
    float _2831 = _2633 * _2813;
    float _2833 = fma(_2629, _2825, _2619);
    float _2835 = fma(_2631, _2825, _2621);
    float _2837 = _2829 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2839 = fma(_2625, _2831, _2623);
    float _2841 = _2825;
    float _2843 = _2829;
    float _2845 = _2823;
    float _2847 = _2823;
    if (!_2743)
    {
        _2841 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2849 = _2841;
    float _2851 = _2849;
    float _2853 = _2849;
    if (!_2743)
    {
        _2843 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2855 = _2843;
    out.m_86.x = _2833;
    out.m_86.y = _2835;
    out.m_86.z = _2839;
    out.m_86.w = _2827;
    bool _2857 = !_2743;
    float _2859 = _2855;
    float _2861 = _2855;
    if (!_2857)
    {
        bool _2863 = _2346 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2865 = isnan(_2346);
        bool _2867 = _2863 || _2865;
        bool _2869 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2871 = _2867 || _2869;
        if (!_2871)
        {
            float _2873 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2875 = _2346 + _2873;
            float _2877 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2879 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2877;
            float _2881 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2883 = _2881 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2885 = 1.0 / _2879;
            float _2887 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2889 = _2887 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2891 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2893 = _2891 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2895 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2897 = _2895 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2899 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2901 = _2899 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2903 = _2875 * _2885;
            float _2905 = precise::clamp(_2903, 0.0, 1.0);
            float _2907 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2909 = _2907 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2911 = fma(_2905, _2883, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2913 = fma(_2905, _2909, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2915 = fma(_2905, _2889, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2917 = fma(_2905, _2893, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2919 = fma(_2905, _2897, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2921 = fma(_2905, _2901, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2791 = _2915;
            _2847 = _2919;
            _2785 = _2911;
            _2853 = _2917;
            _2821 = _2913;
            _2861 = _2921;
            _2923 = true;
        }
        else
        {
            bool _2925 = _2346 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2927 = isnan(_2346);
            bool _2929 = _2925 || _2927;
            bool _2931 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2933 = _2929 || _2931;
            if (!_2933)
            {
                _2783 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2935 = _2783;
            _2785 = _2935;
            if (!_2933)
            {
                _2789 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2937 = _2789;
            _2791 = _2937;
            if (!_2933)
            {
                _2819 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2939 = _2819;
            _2821 = _2939;
            if (!_2933)
            {
                _2851 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2941 = _2851;
            _2853 = _2941;
            if (!_2933)
            {
                _2845 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2943 = _2845;
            _2847 = _2943;
            if (!_2933)
            {
                _2859 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2945 = _2859;
            bool _2947 = !_2933;
            _2861 = _2945;
            if (!_2947)
            {
                bool _2949 = _2346 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2951 = isnan(_2346);
                bool _2953 = _2949 || _2951;
                bool _2955 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2957 = _2953 || _2955;
                if (!_2957)
                {
                    float _2959 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2961 = _2346 + _2959;
                    float _2963 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2965 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2963;
                    float _2967 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2969 = _2967 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2971 = 1.0 / _2965;
                    float _2973 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2975 = _2973 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2977 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2979 = _2977 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2981 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2983 = _2981 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2985 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2987 = _2985 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2989 = _2961 * _2971;
                    float _2991 = precise::clamp(_2989, 0.0, 1.0);
                    float _2993 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2995 = _2993 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2997 = fma(_2991, _2969, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2999 = fma(_2991, _2995, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3001 = fma(_2991, _2975, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3003 = fma(_2991, _2979, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3005 = fma(_2991, _2983, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3007 = fma(_2991, _2987, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2791 = _3001;
                    _2847 = _3005;
                    _2785 = _2997;
                    _2853 = _3003;
                    _2821 = _2999;
                    _2861 = _3007;
                    _2923 = true;
                }
                else
                {
                    _2791 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2847 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2785 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2853 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2821 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2861 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2923 = false;
    float _3009 = _2791;
    float _3011 = _2847;
    float _3013 = _2785;
    float _3015 = _2853;
    float _3017 = _2821;
    float _3019 = _2861;
    float _3021 = fma(_1932, -0.5, 0.5);
    float _3023 = precise::clamp(_3021, 0.0, 1.0);
    float _3025 = -_3009;
    float _3027 = _3025 + _3011;
    float _3029 = -_3013;
    float _3031 = _3029 + _3015;
    out.m_88.x = 0.0;
    float _3033 = fma(_3023, _3027, _3009);
    float _3035 = -_3017;
    float _3037 = _3035 + _3019;
    float _3039 = fma(_3023, _3031, _3013);
    float _3041 = _3033 * 0.586610972881317138671875;
    bool _3043 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3045 = fma(_3023, _3037, _3017);
    float _3047 = _2837 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3049 = fma(_3039, 0.298911988735198974609375, _3041);
    bool _3051 = _2218 > 0.0;
    bool _3053 = isnan(_2218);
    bool _3055 = _3051 || _3053;
    bool _3057 = isnan(0.0);
    bool _3059 = _3055 || _3057;
    float _3061 = fma(_3045, 0.114477999508380889892578125, _3049);
    out.m_57.x = _3047;
    bool _3063 = _2278 <= 0.0;
    bool _3065 = !_3059;
    bool _3067 = _3063 || _3065;
    float _3069 = -_3061;
    float _3071 = _3039 + _3069;
    float _3073 = -_3061;
    float _3075 = _3033 + _3073;
    float _3077 = -_3061;
    float _3079 = _3045 + _3077;
    float _3081 = fma(_3071, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3061);
    float _3083 = fma(_3075, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3061);
    float _3085 = fma(_3079, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3061);
    bool _3087 = !_3043;
    if (!_3087)
    {
        float _3089 = -_2152;
        float _3091 = _3089 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3093 = -_2154;
        float _3095 = _3093 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3097 = -_2156;
        float _3099 = _3097 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3101 = _3091 * _3091;
        float _3103 = fma(_3095, _3095, _3101);
        float _3105 = fma(_3099, _3099, _3103);
        float _3107 = sqrt(_3105);
        float _3109 = rsqrt(_3105);
        float _3111 = -_3107;
        float _3113 = _3111 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3115 = _3113 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3117 = precise::clamp(_3115, 0.0, 1.0);
        float _3119 = _3095 * _3109;
        float _3121 = _3091 * _3109;
        float _3123 = abs(_3117);
        float _3125 = log2(_3123);
        float _3127 = _3099 * _3109;
        float _3129 = _3119 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3131 = _1932 * _3121;
        float _3133 = -_3121;
        float _3135 = -_3129;
        float _3137 = fma(_3133, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3135);
        float _3139 = fma(_1930, _3119, _3131);
        float _3141 = -_3127;
        float _3143 = fma(_3141, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3137);
        float _3145 = fma(_1934, _3127, _3139);
        float _3147 = precise::clamp(_3145, 0.0, 1.0);
        float _3149 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3151 = _3143 + _3149;
        float _3153 = _3125 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3155 = _3151 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3157 = precise::clamp(_3155, 0.0, 1.0);
        float _3159 = exp2(_3153);
        float _3161 = _3159 * _3157;
        float _3163 = _3147 * _3161;
        float _3165 = _3163 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3167 = _3163 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3169 = _3163 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_88.x = _3165;
        out.m_88.y = _3167;
        out.m_88.z = _3169;
    }
    out.m_90.x = _3081;
    out.m_90.y = _3083;
    out.m_90.z = _3085;
    if (!_3067)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_57.x = 0.0;
    float _3171 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3171;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

