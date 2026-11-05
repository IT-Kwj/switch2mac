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
    constant _16* vp_c13 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    texture2d<float> vp_t_tcb_28 [[id(6)]];
    sampler vp_t_tcb_28Smplr [[id(7)]];
    texture3d<float> vp_t_tcb_32 [[id(8)]];
    sampler vp_t_tcb_32Smplr [[id(9)]];
    texture3d<float> vp_t_tcb_30 [[id(10)]];
    sampler vp_t_tcb_30Smplr [[id(11)]];
    texture2d<float> vp_t_tcb_1C [[id(12)]];
    sampler vp_t_tcb_1CSmplr [[id(13)]];
    sampler vp_t_tcb_28Smplr_w [[id(14)]];
    sampler vp_t_tcb_32Smplr_w [[id(15)]];
    sampler vp_t_tcb_30Smplr_w [[id(16)]];
    sampler vp_t_tcb_1CSmplr_w [[id(17)]];
    constant dm_border_t* dm_border [[id(18)]];
};

struct main0_out
{
    float4 m_74 [[user(locn0)]];
    float4 m_78 [[user(locn1)]];
    float4 m_92 [[user(locn2)]];
    float4 m_82 [[user(locn3)]];
    float4 m_88 [[user(locn4)]];
    float4 m_72 [[user(locn5)]];
    float4 m_76 [[user(locn6)]];
    float4 m_84 [[user(locn7)]];
    float4 m_70 [[user(locn8)]];
    float4 m_86 [[user(locn9)]];
    float4 m_51 [[user(locn10)]];
    float4 m_90 [[user(locn11)]];
    float4 m_53 [[user(locn12)]];
    float4 m_80 [[user(locn13)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_66 [[attribute(0)]];
    float4 m_62 [[attribute(1)]];
    float4 m_68 [[attribute(2)]];
    float4 m_64 [[attribute(3)]];
    float4 m_46 [[attribute(5)]];
    float4 m_48 [[attribute(6)]];
    float4 m_58 [[attribute(7)]];
    float4 m_60 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2473 = false;
    bool _207 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _106 = in.m_46.w;
    float _108 = in.m_48.w;
    float _110 = trunc(_106);
    int _113 = int(_110);
    float _115 = -_108;
    float _117 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _117;
    bool _121 = _113 >= 1;
    float _123 = 0.0;
    float _125 = _108;
    if (!_121)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _127 = _123;
    if (!_121)
    {
        out.m_53.x = 0.0;
    }
    int _129 = 0;
    if (!_121)
    {
        float _131 = _127 * 5.0;
        _129 = as_type<int>(_131);
    }
    int _133 = _129;
    int _135 = _133;
    if (!_121)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2730 = as_type<float>(_133);
        out.gl_Position.z = _2730;
    }
    if (!_121)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _137 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _139 = isnan(_108);
    bool _141 = _137 || _139;
    bool _143 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _145 = _141 || _143;
    float _147 = float(_113);
    bool _149 = _117 >= _147;
    bool _151 = !_145;
    bool _153 = _149 || _151;
    if (_153)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _155 = _125;
    if (_153)
    {
        out.m_53.x = 0.0;
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
        float _2785 = as_type<float>(_159);
        out.gl_Position.z = _2785;
    }
    if (_153)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _161 = as_type<float>(int(gl_VertexIndex));
    float _163 = 1.0 / _147;
    bool _165 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _167 = _117 * _163;
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
        float _189 = in.m_58.x;
        float _191 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _193 = _189 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _195 = fma(_193, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
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
    float _215 = in.m_60.x;
    float _217 = in.m_60.y;
    bool _219 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _221 = isnan(_209);
    bool _223 = _219 || _221;
    bool _225 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _227 = _223 || _225;
    float _229 = float(_227);
    float _231 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _233 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _231;
    bool _235 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _237 = isnan(_209);
    bool _239 = _235 || _237;
    bool _241 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _243 = _239 || _241;
    float _245 = float(_243);
    float _247 = -_229;
    float _249 = _247 + 1.0;
    float _251 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _253 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _251;
    float _255 = 1.0 / _233;
    bool _257 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _259 = _245 * _249;
    float _261 = -_245;
    float _263 = _261 + 1.0;
    float _265 = _213 * _255;
    float _267 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _269 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _267;
    float _271 = fma(_253, _265, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _273 = fma(_269, _265, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _275 = _271 * _259;
    float _277 = _273 * _259;
    float _279 = fma(_263, (*spvDescriptorSet0.vp_c9)._m0[143].x, _275);
    float _281 = fma(_263, (*spvDescriptorSet0.vp_c9)._m0[143].y, _277);
    float _283 = fma(_229, (*spvDescriptorSet0.vp_c9)._m0[144].x, _279);
    float _285 = fma(_229, (*spvDescriptorSet0.vp_c9)._m0[144].y, _281);
    float _287 = _283 * _215;
    float _289 = _285 * _217;
    bool _291 = !_257;
    if (!_291)
    {
        float _293 = in.m_58.x;
        float _295 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _297 = _293 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _299 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[11].y, _117);
        float _301 = _299 * _295;
        float _303 = floor(_301);
        float _305 = -_303;
        float _307 = _301 + _305;
        _187 = _307;
    }
    float _309 = _187;
    float _311 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _313 = int(_311);
    float _315 = in.m_58.x;
    float _317 = in.m_58.y;
    float _319 = in.m_58.z;
    float _321 = in.m_58.w;
    float _323 = _287 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _325 = in.m_46.x;
    float _327 = in.m_46.y;
    float _329 = in.m_46.z;
    float _331 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _333 = int(_331);
    float _335 = in.m_62.x;
    float _337 = in.m_62.y;
    float _339 = in.m_62.z;
    float _341 = in.m_62.w;
    float _343 = in.m_64.x;
    float _345 = in.m_64.y;
    float _347 = in.m_64.z;
    float _349 = in.m_64.w;
    float _351 = float(_313);
    float _353 = in.m_66.y;
    float _355 = 1.0 / _351;
    float _357 = float(uint(_333));
    float _359 = _317 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _361 = ~_333;
    int _363 = _361 + 1;
    int _365 = ~_333;
    int _367 = _365 + 1;
    float _369 = 1.0 / _357;
    float _371 = _327 * _337;
    float _373 = _327 * _345;
    float _375 = _117 * _355;
    float _377 = fma(_325, _335, _371);
    float _379 = _315 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _381 = _327 + _353;
    float _383 = fma(_325, _343, _373);
    float _385 = fma(_329, _339, _377);
    float _387 = trunc(_375);
    int _389 = int(_387);
    float _391 = fma(_329, _347, _383);
    int _393 = as_type<int>(_369) + (-2);
    float _395 = _385 + _341;
    float _397 = _391 + _349;
    float _399 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _401 = -_399;
    float _403 = fma(_379, 2.0, _401);
    float _405 = float(uint(_389));
    float _407 = as_type<float>(_393) * _405;
    float _409 = trunc(_407);
    float _411 = precise::max(_409, 0.0);
    uint _414 = uint(_411);
    int _416 = _363 * int(_414);
    int _418 = _416 + _389;
    float _420 = float(uint(_418));
    int _422 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _424 = _422 != 0;
    int _426 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _428 = _426 != 0;
    int _430 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _432 = _430 != 0;
    int _434 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _436 = _434 != 0;
    float _438 = as_type<float>(_393) * _420;
    bool _440 = _321 > 0.5;
    float _442 = trunc(_438);
    float _444 = precise::max(_442, 0.0);
    uint _446 = uint(_444);
    bool _448 = !_424;
    int _450 = _448 ? 0 : 1;
    int _452 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _454 = _452 != 0;
    bool _456 = !_432;
    int _458 = _456 ? 0 : 1;
    bool _460 = !_454;
    float _462 = _460 ? 7.345489978790283203125 : 1.0;
    int _464 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _466 = _464 != 0;
    int _468 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _470 = _468 != 0;
    float _472 = _462 * _315;
    bool _474 = !_428;
    int _476 = _474 ? 0 : 1;
    bool _478 = !_470;
    int _480 = _478 ? 0 : 1;
    float _482 = floor(_472);
    int _484 = int(_414) + int(_446);
    float _486 = in.m_68.x;
    float _488 = in.m_68.y;
    float _490 = in.m_68.z;
    float _492 = in.m_68.w;
    int _494 = abs(_450);
    int _496 = _367 * _484;
    int _498 = _496 + _389;
    int _500 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _502 = _500 != 0;
    int _504 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _506 = _504 != 0;
    bool _508 = uint(_498) >= uint(_333);
    bool _510 = !_436;
    int _512 = _510 ? 0 : 1;
    bool _514 = _315 > 0.5;
    float _516 = -_482;
    float _518 = _472 + _516;
    bool _520 = !_508;
    int _522 = _520 ? 0 : (-1);
    float _524 = -_179;
    int _526 = _514 ? as_type<int>(_524) : as_type<int>(_179);
    int _528 = ~_484;
    int _530 = _528 + _522;
    int _532 = _530 + 1;
    int _534 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _536 = _534 != 0;
    int _538 = _333 * _532;
    int _540 = _538 + _389;
    float _542 = _327 * _488;
    float _544 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _546 = _544 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    int _548 = _333 + (-1);
    float _550 = fma(_325, _486, _542);
    float _552 = float(_333);
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _556 = _554 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _558 = float(_389);
    float _560 = fma(_329, _490, _550);
    bool _562 = !_466;
    float _564 = _562 ? _179 : as_type<float>(_526);
    float _566 = _117 * _552;
    bool _568 = _558 >= _552;
    bool _570 = isnan(_558);
    bool _572 = _568 || _570;
    bool _574 = isnan(_552);
    bool _576 = _572 || _574;
    float _578 = float(_576);
    float _580 = 1.0 / _556;
    bool _582 = _317 > 0.5;
    float _584 = _566 * _163;
    float _586 = _518 * _552;
    float _588 = -_183;
    int _590 = _582 ? as_type<int>(_588) : as_type<int>(_183);
    float _592 = trunc(_578);
    int _594 = int(_592);
    bool _596 = _333 == 0;
    float _598 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _600 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _598;
    int _602 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _604 = _602 != 0;
    bool _606 = !_596;
    int _608 = _606 ? _540 : (-1);
    float _610 = trunc(_586);
    int _612 = int(_610);
    float _614 = _600 * _580;
    float _616 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _618 = ~_594;
    int _620 = _618 + 1;
    int _622 = _620 + 1;
    float _624 = trunc(_584);
    int _626 = int(_624);
    float _628 = fma(_359, -2.0, _616);
    int _630 = _608 * _622;
    int _632 = _594 * _548;
    int _634 = _632 + _630;
    int _636 = abs(_476);
    float _638 = 1.0 / _546;
    int _640 = abs(_480);
    float _642 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _644 = _642 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    int _646 = abs(_458);
    int _648 = _634 * _636;
    int _650 = _612 * _640;
    int _652 = _650 + _389;
    float _654 = 1.0 / _644;
    float _656 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _658 = _656 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    int _660 = _626 * _494;
    int _662 = _660 + _648;
    int _664 = _652 * _646;
    int _666 = _664 + _662;
    int _668 = abs(_512);
    float _670 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _672 = _658 * _638;
    float _674 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _676 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _674;
    float _678 = fma(_315, (*spvDescriptorSet0.vp_c9)._m0[78].z, _670);
    float _680 = (*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _682 = as_type<float>(_668);
    if (!_454)
    {
        _680 = _317;
    }
    float _684 = _680;
    int _686 = _612 * _668;
    int _688 = _686 + _666;
    float _690 = _676 * _654;
    bool _692 = !_502;
    float _694 = _692 ? _183 : as_type<float>(_590);
    float _696 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _698 = _309 + _696;
    bool _700 = _319 > 0.5;
    float _702 = _654;
    float _704 = _684;
    if (!_454)
    {
        _682 = _319;
    }
    float _706 = _682;
    float _708 = _706;
    if (!_454)
    {
        _702 = _319;
    }
    float _710 = _702;
    float _712 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _714 = _309 + _712;
    float _716 = float(uint(_688));
    bool _718 = _309 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _720 = isnan(_309);
    bool _722 = _718 || _720;
    bool _724 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _726 = _722 || _724;
    float _728 = float(_726);
    float _730 = fma(_672, _714, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _732 = _710;
    if (_454)
    {
        _704 = _315;
    }
    float _734 = _704;
    float _736 = as_type<float>(_393) * _716;
    float _738 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _740 = fma(_614, _698, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _742 = _309 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _744 = isnan(_309);
    bool _746 = _742 || _744;
    bool _748 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _750 = _746 || _748;
    float _752 = float(_750);
    float _754 = -_728;
    float _756 = _754 + 1.0;
    float _758 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _760 = _309 + _758;
    float _762 = trunc(_736);
    float _764 = precise::max(_762, 0.0);
    uint _766 = uint(_764);
    bool _768 = _309 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _770 = isnan(_309);
    bool _772 = _768 || _770;
    bool _774 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _776 = _772 || _774;
    float _778 = float(_776);
    float _780 = _752 * _756;
    float _782 = -_752;
    float _784 = _782 + 1.0;
    float _786 = fma(_690, _760, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    int _788 = ~_333;
    int _790 = _788 + 1;
    float _792 = fma(_317, (*spvDescriptorSet0.vp_c9)._m0[78].w, _738);
    if (_454)
    {
        _708 = _317;
    }
    float _794 = _708;
    float _796 = _778 * _784;
    float _798 = -_778;
    float _800 = _798 + 1.0;
    if (_454)
    {
        _732 = _317;
    }
    float _802 = _732;
    float _804 = _794 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _806 = _309 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _808 = isnan(_309);
    bool _810 = _806 || _808;
    bool _812 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _814 = _810 || _812;
    float _816 = float(_814);
    int _818 = _790 * int(_766);
    int _820 = _818 + _688;
    float _822 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _824 = _816 * _800;
    float _826 = float(uint(_820));
    float _828 = fma(_802, (*spvDescriptorSet0.vp_c9)._m0[83].w, _822);
    float _830 = _560 + _492;
    float _832 = _740 * _824;
    float _834 = as_type<float>(_393) * _826;
    float _836 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _838 = -_117;
    float _840 = fma(_838, (*spvDescriptorSet0.vp_c9)._m0[76].x, _403);
    float _842 = _564 + 0.5;
    float _844 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _846 = fma(_734, (*spvDescriptorSet0.vp_c9)._m0[83].z, _836);
    float _848 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _850 = _734 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _852 = fma(_842, (*spvDescriptorSet0.vp_c9)._m0[80].x, _840);
    float _854 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[76].y, _628);
    float _856 = _694 + (-0.5);
    float _858 = -_816;
    float _860 = _858 + 1.0;
    float _862 = trunc(_834);
    float _864 = precise::max(_862, 0.0);
    uint _866 = uint(_864);
    float _868 = -_848;
    float _870 = fma(_850, 2.0, _868);
    float _872 = -_856;
    float _874 = -_854;
    float _876 = fma(_872, (*spvDescriptorSet0.vp_c9)._m0[80].y, _874);
    float _878 = fma(_860, (*spvDescriptorSet0.vp_c9)._m0[115].x, _832);
    float _880 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].z, _678);
    float _882 = -_117;
    float _884 = fma(_882, (*spvDescriptorSet0.vp_c9)._m0[81].x, _870);
    float _886 = -_179;
    int _888 = _700 ? as_type<int>(_886) : as_type<int>(_179);
    float _890 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _892 = fma(_730, _796, _878);
    float _894 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[82].w, _828);
    float _896 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _898 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _900 = _395 + _898;
    float _902 = _844 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _904 = -_183;
    int _906 = _440 ? as_type<int>(_904) : as_type<int>(_183);
    float _908 = fma(_804, -2.0, _890);
    bool _910 = !_604;
    float _912 = _910 ? _179 : as_type<float>(_888);
    float _914 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _916 = _830 + _914;
    int _918 = int(_766) + int(_866);
    float _920 = _900 * _900;
    int _922 = ~_333;
    int _924 = _922 + 1;
    float _926 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].w, _792);
    float _928 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[82].z, _846);
    bool _930 = !_536;
    float _932 = _930 ? _183 : as_type<float>(_906);
    float _934 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[81].y, _908);
    int _936 = _924 * _918;
    int _938 = _936 + _688;
    float _940 = float(uint(_652));
    float _942 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _944 = _397 + _942;
    float _946 = fma(_916, _916, _920);
    float _948 = _912 + 0.5;
    bool _950 = uint(_938) >= uint(_333);
    float _952 = as_type<float>(_393) * _940;
    float _954 = fma(_944, _944, _946);
    float _956 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _958 = _381 + _956;
    bool _960 = !_950;
    int _962 = _960 ? 0 : (-1);
    float _964 = fma(_902, _948, _884);
    float _966 = _896 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _968 = fma(_958, _958, _920);
    int _970 = ~_918;
    int _972 = _970 + _962;
    int _974 = _972 + 1;
    float _976 = trunc(_952);
    float _978 = precise::max(_976, 0.0);
    uint _980 = uint(_978);
    float _982 = _932 + (-0.5);
    int _984 = ~_333;
    int _986 = _984 + 1;
    float _988 = -_880;
    float _990 = _988 + 1.0;
    int _992 = _333 * _974;
    int _994 = _992 + _688;
    float _996 = fma(_944, _944, _968);
    float _998 = -_966;
    float _1000 = -_934;
    float _1002 = fma(_998, _982, _1000);
    float _1004 = _958 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1006 = sqrt(_954);
    bool _1008 = !_596;
    int _1010 = _1008 ? _994 : (-1);
    float _1012 = fma(_786, _780, _892);
    float _1014 = fma(_900, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1004);
    float _1016 = _323 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    int _1018 = _1010 >> 31;
    float _1020 = -_926;
    float _1022 = _1020 + 1.0;
    float _1024 = fma(_944, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1014);
    float _1026 = rsqrt(_996);
    int _1028 = _1018 & 3;
    int _1030 = _986 * int(_980);
    int _1032 = _1030 + _652;
    float _1034 = -_928;
    float _1036 = _1034 + 1.0;
    float _1038 = -_990;
    float _1040 = fma(_564, _1038, _852);
    int _1042 = _1010 + _1028;
    float _1044 = fma(_694, _1022, _876);
    float _1046 = float(uint(_1032));
    float _1048 = rsqrt(_954);
    float _1050 = _1006 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    int _1052 = _1042 >> 2;
    float _1054 = -_1036;
    float _1056 = fma(_912, _1054, _964);
    float _1058 = as_type<float>(_393) * _1046;
    float _1060 = -_894;
    float _1062 = _1060 + 1.0;
    float _1064 = precise::min(_1016, _1050);
    float _1066 = _958 * _1026;
    int _1068 = _1052 << 4;
    int _1070 = _1068 + 368;
    float _1072 = _900 * _1026;
    float _1074 = fma(_932, _1062, _1002);
    float _1076 = -_1066;
    float _1078 = fma(_1076, (*spvDescriptorSet0.vp_c9)._m0[18].w, _958);
    uint _1080 = uint(int(uint(_1070) >> uint(2)));
    uint _1082 = uint(int(uint(int(_1080)) >> uint(2)));
    int _1084 = int(_1080) & 3;
    float _1086 = (*spvDescriptorSet0.vp_c9)._m0[int(_1082)][_1084];
    int _1088 = int(_1080) + 1;
    uint _1090 = uint(int(uint(_1088) >> uint(2)));
    int _1092 = _1088 & 3;
    float _1094 = (*spvDescriptorSet0.vp_c9)._m0[int(_1090)][_1092];
    float _1096 = -_1072;
    float _1098 = fma(_1096, (*spvDescriptorSet0.vp_c9)._m0[18].w, _900);
    float _1100 = trunc(_1058);
    float _1102 = precise::max(_1100, 0.0);
    uint _1104 = uint(_1102);
    float _1106 = _1048 * _1064;
    float _1108 = _1078 * _1078;
    int _1110 = _1010 & 3;
    bool _1112 = _1110 != 0;
    out.m_70.x = _1040;
    out.m_70.y = _1044;
    out.m_70.z = _1056;
    out.m_70.w = _1074;
    float _1114 = _916 * _1106;
    float _1116 = _900 * _1106;
    float _1118 = fma(_1098, _1098, _1108);
    bool _1120 = _1024 >= 0.0;
    float _1122 = -_1114;
    float _1124 = _916 + _1122;
    float _1126 = -_1116;
    float _1128 = _900 + _1126;
    out.m_72.w = _1064;
    int _1130 = _1070 + 8;
    uint _1132 = uint(int(uint(_1130) >> uint(2)));
    uint _1134 = uint(int(uint(int(_1132)) >> uint(2)));
    int _1136 = int(_1132) & 3;
    float _1138 = (*spvDescriptorSet0.vp_c9)._m0[int(_1134)][_1136];
    int _1140 = int(_1132) + 1;
    uint _1142 = uint(int(uint(_1140) >> uint(2)));
    int _1144 = _1140 & 3;
    float _1146 = (*spvDescriptorSet0.vp_c9)._m0[int(_1142)][_1144];
    float _1148 = _1124 * _1124;
    int _1150 = _1010 & 3;
    bool _1152 = _1150 != 0;
    float _1154 = _944 * _1106;
    int _1156 = int(_980) + int(_1104);
    float _1158 = fma(_1128, _1128, _1148);
    bool _1160 = uint(_1150) > 1u;
    float _1162 = _944 * _1026;
    int _1164 = _1112 ? 0 : 1;
    if (_1120)
    {
        out.m_53.x = 0.0;
    }
    bool _1166 = _1150 != 3;
    float _1168 = -_1162;
    float _1170 = fma(_1168, (*spvDescriptorSet0.vp_c9)._m0[18].w, _944);
    int _1172 = ~_333;
    int _1174 = _1172 + 1;
    float _1176 = -_1154;
    float _1178 = _944 + _1176;
    bool _1180 = uint(_1150) >= 2u;
    float _1182 = fma(_1170, _1170, _1118);
    int _1184 = ~_1164;
    int _1186 = _1184 + 1;
    int _1188 = _1186 + 1;
    int _1190 = _1174 * _1156;
    int _1192 = _1190 + _652;
    int _1194 = _1180 ? 0 : 1;
    float _1196 = fma(_1178, _1178, _1158);
    int _1198 = _1188;
    if (!_1160)
    {
        int _1200 = ~_1164;
        int _1202 = _1200 + 1;
        _1198 = _1202;
    }
    int _1204 = _1198;
    float _1206 = sqrt(_1182);
    bool _1208 = uint(_1192) >= uint(_333);
    int _1210 = abs(_1204);
    int _1212 = ~_1194;
    int _1214 = _1212 + 1;
    int _1216 = _1214 + 1;
    int _1218 = _1216;
    if (_1166)
    {
        int _1220 = ~_1194;
        int _1222 = _1220 + 1;
        _1218 = _1222;
    }
    int _1224 = _1218;
    bool _1226 = !_1152;
    int _1228 = _1226 ? 0 : 1;
    bool _1230 = !_1208;
    int _1232 = _1230 ? 0 : (-1);
    bool _1234 = _1150 != 3;
    float _1236 = _1026 * _1206;
    int _1238 = abs(_1228);
    int _1240 = ~_1156;
    int _1242 = _1240 + _1232;
    int _1244 = _1242 + 1;
    int _1246 = ~_1210;
    int _1248 = _1246 + 1;
    int _1250 = _1248 + 1;
    bool _1252 = !_1234;
    int _1254 = _1252 ? 0 : (-1);
    int _1256 = _333 * _1244;
    int _1258 = _1256 + _652;
    int _1260 = _1250 * as_type<int>(_1094);
    int _1262 = abs(_1254);
    float _1264 = sqrt(_1196);
    int _1266 = abs(_1224);
    int _1268 = ~_1238;
    int _1270 = _1268 + 1;
    int _1272 = _1270 + 1;
    bool _1274 = !_506;
    int _1276 = _1274 ? 0 : 1;
    int _1278 = _1272 * as_type<int>(_1086);
    int _1280 = _1278 + _1260;
    int _1282 = ~_1266;
    int _1284 = _1282 + 1;
    int _1286 = _1284 + 1;
    int _1288 = abs(_1276);
    int _1290 = ~_1262;
    int _1292 = _1290 + 1;
    int _1294 = _1292 + 1;
    int _1296 = _1286 * as_type<int>(_1138);
    int _1298 = _1296 + _1280;
    int _1300 = ~_1288;
    int _1302 = _1300 + 1;
    int _1304 = _1302 + 1;
    float _1306 = _1048 * _1264;
    float _1308 = as_type<float>(_1262);
    if (_1120)
    {
        _1308 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1310 = _1308;
    int _1312 = _1294 * as_type<int>(_1146);
    int _1314 = _1312 + _1298;
    bool _1316 = !_596;
    int _1318 = _1316 ? _1258 : (-1);
    float _1320 = fma(_728, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1012);
    int _1322 = _1314 * _1304;
    int _1324 = as_type<int>(_1310);
    if (_1120)
    {
        float _1326 = _1310 * 5.0;
        _1324 = as_type<int>(_1326);
    }
    int _1328 = _1324;
    float _1330 = _1306 * _1236;
    int _1332 = _1318 * _1288;
    int _1334 = _1332 + _1322;
    if (_1120)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4555 = as_type<float>(_1328);
        out.gl_Position.z = _4555;
    }
    float _1336 = _1320 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1338 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1340 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1342 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1344 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1346 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1348 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1350 = _1338 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1352 = _1340 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1354 = _1344 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1356 = _1346 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1358 = _1342 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1360 = float(_1334);
    float _1362 = _1348 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1364 = _323 * _1330;
    out.m_74.x = _1350;
    out.m_74.y = _1352;
    out.m_74.z = _1358;
    out.m_74.w = _1336;
    out.m_76.x = _1360;
    out.m_78.x = _1354;
    out.m_78.y = _1356;
    out.m_78.z = _1362;
    out.m_80.x = _1364;
    if (_1120)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1366 = -_1066;
    float _1368 = fma(_1366, (*spvDescriptorSet0.vp_c9)._m0[18].w, _381);
    float _1370 = -_1072;
    float _1372 = fma(_1370, (*spvDescriptorSet0.vp_c9)._m0[18].w, _395);
    float _1374 = -_1162;
    float _1376 = fma(_1374, (*spvDescriptorSet0.vp_c9)._m0[18].w, _397);
    float _1378 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1380 = _1368 + _1378;
    float _1382 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1384 = _1372 + _1382;
    float _1386 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1388 = _1376 + _1386;
    float _1390 = _1380 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1392 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1390);
    float _1394 = fma(_1388, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1392);
    bool _1396 = _1394 >= 0.0;
    float _1398 = _1388;
    if (_1396)
    {
        _1398 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1400 = _1398;
    int _1402 = as_type<int>(_1400);
    if (_1396)
    {
        out.m_53.x = 0.0;
    }
    if (_1396)
    {
        float _1404 = _1400 * 5.0;
        _1402 = as_type<int>(_1404);
    }
    int _1406 = _1402;
    if (_1396)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4726 = as_type<float>(_1406);
        out.gl_Position.z = _4726;
    }
    if (_1396)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1408 = -_381;
    float _1410 = _1408 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1412 = -_395;
    float _1414 = _1412 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1416 = -_397;
    float _1418 = _1416 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1420 = _1410 * _1410;
    float _1422 = _289 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1424 = fma(_1414, _1414, _1420);
    float _1426 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _1428 = _1422 * _1330;
    float _1430 = fma(_1418, _1418, _1424);
    float _1432 = -_1426;
    float _1434 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1432);
    float _1436 = rsqrt(_1430);
    float _1438 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1440 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1442 = -_1438;
    float _1444 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _1442);
    float _1446 = -_1440;
    float _1448 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1446);
    float _1450 = _1414 * _1436;
    float _1452 = _1418 * _1436;
    float _1454 = _1448 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1456 = _1444 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1458 = _1450 * _1450;
    float _1460 = _1448 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1462 = -_1454;
    float _1464 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1462);
    float _1466 = _1410 * _1436;
    float _1468 = fma(_1452, _1452, _1458);
    float _1470 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1472 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1474 = -_1460;
    float _1476 = fma(_1444, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1474);
    float _1478 = rsqrt(_1468);
    float _1480 = -_1470;
    float _1482 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1480);
    float _1484 = -_1472;
    float _1486 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1484);
    float _1488 = fma(_1486, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1464);
    float _1490 = _1486 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1492 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1494 = -_1456;
    float _1496 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[1].y, _1494);
    float _1498 = _1488 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1500 = -_1492;
    float _1502 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _1500);
    float _1504 = fma(_1482, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1496);
    float _1506 = _1452 * _1478;
    float _1508 = _1450 * _1478;
    float _1510 = -_1498;
    float _1512 = fma(_1504, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1510);
    float _1514 = fma(_1502, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1476);
    float _1516 = -_1506;
    float _1518 = _1452 * _1516;
    float _1520 = -_1506;
    float _1522 = _1466 * _1520;
    float _1524 = fma(_1514, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1512);
    float _1526 = -_1518;
    float _1528 = fma(_1450, _1508, _1526);
    float _1530 = _1466 * _1508;
    float _1532 = -_1490;
    float _1534 = fma(_1482, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1532);
    float _1536 = _1528 * _1528;
    float _1538 = fma(_1502, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1534);
    float _1540 = _1448 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _1542 = fma(_1530, _1530, _1536);
    float _1544 = -_1538;
    float _1546 = fma(_1544, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1524);
    float _1548 = -_1540;
    float _1550 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1548);
    float _1552 = fma(_1522, _1522, _1542);
    float _1554 = _1444 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _1556 = fma(_1486, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1550);
    float _1558 = rsqrt(_1552);
    float _1560 = _1448 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1562 = -_1554;
    float _1564 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[0].y, _1562);
    float _1566 = -_1560;
    float _1568 = fma(_1444, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1566);
    float _1570 = fma(_1482, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1564);
    float _1572 = 1.0 / _1546;
    float _1574 = fma(_1502, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1568);
    float _1576 = _1528 * _1558;
    float _1578 = precise::clamp(_1576, 0.0, 1.0);
    float _1580 = -_1578;
    float _1582 = _1580 + 1.0;
    float _1584 = fma(_1556, _1572, -1.0);
    float _1586 = _1582 * _1572;
    float _1588 = fma(_1582, _1584, 1.0);
    float _1590 = _1570 * _1586;
    float _1592 = _1574 * _1586;
    float _1594 = _1588 * _1588;
    float _1596 = fma(_1590, _1590, _1594);
    float _1598 = fma(_1592, _1592, _1596);
    float _1600 = rsqrt(_1598);
    float _1602 = _1592 * _1600;
    float _1604 = _1588 * _1600;
    float _1606 = _1590 * _1600;
    float _1608 = -_1602;
    float _1610 = _1450 * _1608;
    float _1612 = _1452 * _1604;
    float _1614 = -_1606;
    float _1616 = -_1610;
    float _1618 = fma(_1452, _1614, _1616);
    float _1620 = -_1602;
    float _1622 = -_1612;
    float _1624 = fma(_1466, _1620, _1622);
    float _1626 = -_1606;
    float _1628 = _1466 * _1626;
    float _1630 = _1618 * _1618;
    float _1632 = -_1628;
    float _1634 = fma(_1450, _1604, _1632);
    float _1636 = fma(_1624, _1624, _1630);
    float _1638 = fma(_1634, _1634, _1636);
    float _1640 = rsqrt(_1638);
    float _1642 = _1624 * _1640;
    float _1644 = _1634 * _1640;
    float _1646 = _1618 * _1640;
    float _1648 = _1452 * _1642;
    float _1650 = _1466 * _1644;
    float _1652 = _1450 * _1646;
    float _1654 = -_1648;
    float _1656 = fma(_1450, _1644, _1654);
    float _1658 = -_1650;
    float _1660 = fma(_1452, _1646, _1658);
    float _1662 = -_1652;
    float _1664 = fma(_1466, _1642, _1662);
    float _1666 = _1656 * _1656;
    float _1668 = fma(_1660, _1660, _1666);
    float _1670 = fma(_1664, _1664, _1668);
    float _1672 = rsqrt(_1670);
    float _1674 = _1664 * _1672;
    float _1676 = _1660 * _1672;
    float _1678 = _1656 * _1672;
    float _1680 = _1450 * _1674;
    float _1682 = _1452 * _1678;
    float _1684 = -_1680;
    float _1686 = fma(_1452, _1676, _1684);
    float _1688 = _1466 * _1676;
    float _1690 = -_1682;
    float _1692 = fma(_1466, _1674, _1690);
    float _1694 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _183);
    float _1696 = _1686 * _1686;
    float _1698 = -_1688;
    float _1700 = fma(_1450, _1678, _1698);
    float _1702 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _179);
    float _1704 = _1428 * _1694;
    float _1706 = fma(_1692, _1692, _1696);
    float _1708 = _1364 * _1702;
    float _1710 = _1704 * _1674;
    float _1712 = fma(_1700, _1700, _1706);
    float _1714 = _1704 * _1676;
    float _1716 = _1704 * _1678;
    float _1718 = rsqrt(_1712);
    float _1720 = _1700 * _1718;
    float _1722 = _1692 * _1718;
    float _1724 = _1686 * _1718;
    float _1726 = fma(_1708, _1720, _1710);
    float _1728 = fma(_1708, _1722, _1714);
    float _1730 = fma(_1708, _1724, _1716);
    float _1732 = _397 + _1726;
    float _1734 = _395 + _1728;
    float _1736 = _381 + _1730;
    float _1738 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1740 = _1732 + _1738;
    float _1742 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1744 = _1734 + _1742;
    float _1746 = _1740 * _1740;
    float _1748 = fma(_1744, _1744, _1746);
    float _1750 = sqrt(_1748);
    bool _1752 = _1750 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1754 = _1730;
    float _1756 = _1708;
    float _1758 = _1734;
    float _1760 = _1666;
    float _1762 = _1522;
    if (!_1752)
    {
        _1754 = _1732;
    }
    float _1764 = _1754;
    float _1766 = _1764;
    if (!_1752)
    {
        _1756 = _1736;
    }
    float _1768 = _1756;
    bool _1770 = !_1752;
    float _1772 = _1768;
    if (!_1770)
    {
        float _1774 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1776 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1778 = _1750 + _1776;
        float _1780 = _1736 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1782 = rsqrt(_1748);
        float _1784 = _1778 * _1774;
        float _1786 = _1784 * 0.15915493667125701904296875;
        float _1788 = _1786 * 6.283185482025146484375;
        float _1790 = cos(_1788);
        float _1792 = _1786 * 6.283185482025146484375;
        float _1794 = sin(_1792);
        float _1796 = _1790 + (-1.0);
        float _1798 = fma(_1794, _1780, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1800 = _1796 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1802 = _1782 * _1798;
        float _1804 = fma(_1736, _1790, _1800);
        float _1806 = fma(_1744, _1802, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1808 = fma(_1740, _1802, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1758 = _1806;
        _1766 = _1808;
        _1772 = _1804;
    }
    float _1810 = _1758;
    float _1812 = _1766;
    float _1814 = _1772;
    float _1816 = -_1116;
    float _1818 = _1816 + _1810;
    float _1820 = -_1154;
    float _1822 = _1820 + _1812;
    float _1824 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _1826 = _1818 + _1824;
    float _1828 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _1830 = _1822 + _1828;
    float _1832 = fma(_1826, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _1834 = fma(_1830, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _5435 = float2(_1832, _1834);
    float _1836 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_5435, float2(0.0), isnan(_5435)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_5435, float2(0.0), isnan(_5435)), level(0.0)).x;
    float _1838 = -_1114;
    float _1840 = _1838 + _1814;
    float _1842 = -_1162;
    float _1844 = fma(_1842, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1822);
    float _1846 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1848 = _1844 + _1846;
    float _1850 = fma(_1836, 100.0, _1840);
    float _1852 = -_1066;
    float _1854 = fma(_1852, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1850);
    float _1856 = -_1072;
    float _1858 = fma(_1856, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1818);
    float _1860 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1862 = _1854 + _1860;
    float _1864 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1866 = _1858 + _1864;
    float _1868 = _1862 * _1862;
    float _1870 = fma(_1866, _1866, _1868);
    float _1872 = fma(_1848, _1848, _1870);
    float _1874 = rsqrt(_1872);
    float _1876 = sqrt(_1872);
    float _1878 = _1874 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1880 = _1866 * _1878;
    float _1882 = _1848 * _1878;
    float _1884 = _1880 * _1880;
    float _1886 = _1882 * _1882;
    float _1888 = _1884 + _1886;
    float _1890 = sqrt(_1888);
    bool _1892 = _1890 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1894 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1896 = _1890 + _1894;
    float _1898 = _1870;
    float _1900 = _1896;
    float _1902 = _1862;
    float _1904 = _1882;
    float _1906 = _1886;
    if (_1892)
    {
        float _1908 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1898 = _1908;
    }
    float _1910 = _1898;
    float _1912 = _1910;
    if (_1892)
    {
        float _1914 = _1896 * _1910;
        _1900 = _1914;
    }
    float _1916 = _1900;
    if (_1892)
    {
        float _1918 = rsqrt(_1888);
        _1912 = _1918;
    }
    float _1920 = _1912;
    float _1922 = _1920;
    if (_1892)
    {
        float _1924 = _1916 * 0.15915493667125701904296875;
        _1760 = _1924;
    }
    float _1926 = _1760;
    float _1928 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1930 = _1848;
    if (_1892)
    {
        float _1932 = _1926 * 6.283185482025146484375;
        float _1934 = sin(_1932);
        _1930 = _1934;
    }
    float _1936 = _1930;
    float _1938 = precise::max(0.0, _1928);
    float _1940 = _1740;
    float _1942 = _1938;
    if (_1892)
    {
        float _1944 = _1926 * 6.283185482025146484375;
        float _1946 = cos(_1944);
        _1940 = _1946;
    }
    float _1948 = _1940;
    float _1950 = -_1878;
    float _1952 = -_1938;
    float _1954 = fma(_1862, _1950, _1952);
    if (_1892)
    {
        float _1956 = _1954 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1902 = _1956;
    }
    float _1958 = _1902;
    float _1960 = _1936;
    float _1962 = _1958;
    if (_1892)
    {
        float _1964 = fma(_1936, _1958, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1942 = _1964;
    }
    float _1966 = _1942;
    float _1968 = _1966;
    if (!_1892)
    {
        _1960 = _1880;
    }
    float _1970 = _1960;
    float _1972 = _1970;
    if (_1892)
    {
        float _1974 = _1920 * _1966;
        _1762 = _1974;
    }
    float _1976 = _1762;
    if (!_1892)
    {
        _1968 = _1954;
    }
    float _1978 = _1968;
    float _1980 = _1978;
    if (_1892)
    {
        float _1982 = _1948 + (-1.0);
        _1962 = _1982;
    }
    float _1984 = _1962;
    float _1986 = _1984;
    if (_1892)
    {
        float _1988 = _1880 * _1976;
        _1972 = _1988;
    }
    float _1990 = _1972;
    if (_1892)
    {
        float _1992 = _1882 * _1976;
        _1904 = _1992;
    }
    float _1994 = _1904;
    if (_1892)
    {
        float _1996 = _1984 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1922 = _1996;
    }
    float _1998 = _1922;
    if (!_1892)
    {
        _1986 = _1884;
    }
    float _2000 = _1986;
    float _2002 = _2000;
    if (_1892)
    {
        float _2004 = _1990 * _1990;
        _2002 = _2004;
    }
    float _2006 = _2002;
    if (_1892)
    {
        float _2008 = _1994 * _1994;
        _1906 = _2008;
    }
    float _2010 = _1906;
    if (_1892)
    {
        float _2012 = fma(_1954, _1948, _1998);
        _1980 = _2012;
    }
    float _2014 = _1980;
    float _2016 = _1854 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2018 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2020 = fma(_1876, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2018);
    float _2022 = precise::clamp(_2020, 0.0, 1.0);
    float _2024 = fma(_2014, _2014, _2006);
    float _2026 = _1854 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2028 = -_2022;
    float _2030 = _2028 + 1.0;
    float _2032 = _2024 + _2010;
    float _2034 = fma(_1858, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2016);
    float _2036 = _1854 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2038 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2040 = abs(_2030);
    float _2042 = log2(_2040);
    float _2044 = fma(_1844, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2034);
    float _2046 = fma(_1858, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2036);
    float _2048 = _1854 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2050 = fma(_1858, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2026);
    float _2052 = _2044 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2054 = fma(_1844, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2046);
    float _2056 = fma(_1858, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2048);
    float _2058 = rsqrt(_2032);
    float _2060 = _2052 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2062 = _2054 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2064 = fma(_1844, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2056);
    float _2066 = fma(_1844, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2050);
    float _2068 = -_2060;
    float _2070 = fma(_2068, _2038, 1.0);
    float _2072 = _2062 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2074 = _2064 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2076 = _2066 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2078 = log2(_2070);
    float _2080 = _2058 * _1990;
    float _2082 = _2058 * _2014;
    float _2084 = fma(_2074, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2072);
    float _2086 = _2058 * _1994;
    float _2088 = _2080 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2090 = _2042 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2092 = fma(_2052, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2084);
    float _2094 = -_2088;
    float _2096 = fma(_2082, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2094);
    float _2098 = _2062 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2100 = fma(_2076, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2092);
    float _2102 = exp2(_2090);
    float _2104 = -_2086;
    float _2106 = fma(_2104, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2096);
    float _2108 = _2062 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2110 = fma(_2074, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2098);
    float _2112 = fma(_2106, -0.5, 0.5);
    float _2114 = fma(_2106, 0.5, 0.5);
    float _2116 = fma(_2074, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2108);
    float _2118 = 1.0 / _2100;
    float _2120 = _2082 + 1.0;
    float _2122 = fma(_2114, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2124 = fma(_2052, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2116);
    float _2126 = fma(_2052, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2110);
    float _2128 = fma(_2114, _2122, -0.212114393711090087890625);
    float _2130 = sqrt(_2112);
    float _2132 = -_2082;
    float _2134 = fma(_2102, _2120, _2132);
    float _2136 = fma(_2076, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2124);
    float _2138 = fma(_2076, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2126);
    float _2140 = _2078 * 0.693147182464599609375;
    float _2142 = fma(_2114, _2128, 1.570728778839111328125);
    float _2144 = _2136 * _2118;
    float _2146 = _2138 * _2118;
    float _2148 = _2140 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2150 = fma(_2134, 0.5, 0.5);
    float _2152 = fma(_2144, 0.5, 0.5);
    float _2154 = fma(_2146, -0.5, 0.5);
    float _2156 = _2130 * 0.636619746685028076171875;
    float _2158 = -_2142;
    float _2160 = fma(_2156, _2158, 1.0);
    float3 _5985 = float3(_2152, _2154, _2148);
    float _2162 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5985, float3(0.0), isnan(_5985)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5985, float3(0.0), isnan(_5985)), level(0.0)).x;
    float3 _5996 = float3(_2152, _2154, _2148);
    float4 _2165 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5996, float3(0.0), isnan(_5996)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5996, float3(0.0), isnan(_5996)), level(0.0)).xyzw;
    float _2167 = _2165.x;
    float _2169 = _2165.y;
    float _2171 = _2165.z;
    float _2173 = _2165.w;
    float2 _6012 = float2(_2160, _2150);
    float3 _2177 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6012, float2(0.0), isnan(_6012)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6012, float2(0.0), isnan(_6012)), level(0.0)).xyz;
    float _2179 = _2177.x;
    float _2181 = _2177.y;
    float _2183 = _2177.z;
    float _2185 = _916 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _2187 = -_1116;
    float _2189 = _395 + _2187;
    float _2191 = -_1114;
    float _2193 = _2191 + _381;
    float _2195 = _183 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2197 = abs(_2185);
    float _2199 = 1.0 / _2197;
    float _2201 = _179 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2203 = fma(_1836, 100.0, _2193);
    float _2205 = _2195 * _1676;
    out.m_78.x = _1354;
    out.m_78.y = _1356;
    out.m_78.z = _1362;
    float _2207 = -_1154;
    float _2209 = _397 + _2207;
    float _2211 = -_1066;
    float _2213 = fma(_2211, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2203);
    float _2215 = _2042 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2217 = _2062 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2219 = -_1162;
    float _2221 = fma(_2219, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2209);
    float _2223 = _2195 * _1678;
    float _2225 = fma(_2074, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2217);
    float _2227 = exp2(_2215);
    float _2229 = 0.0 + _2199;
    float _2231 = precise::clamp(_2229, 0.0, 1.0);
    float _2233 = fma(_2201, _1722, _2205);
    float _2235 = _2213 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2237 = fma(_2052, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2225);
    float _2239 = _1336 * _2231;
    float _2241 = _2195 * _1674;
    float _2243 = fma(_2201, _1724, _2223);
    float _2245 = _1450 + _2233;
    float _2247 = fma(_2201, _1720, _2241);
    float _2249 = -_1072;
    float _2251 = fma(_2249, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2189);
    out.m_74.x = _1350;
    out.m_74.y = _1352;
    out.m_74.z = _1358;
    out.m_74.w = _2239;
    float _2253 = fma(_2076, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2237);
    float _2255 = _2100 * 0.5;
    float _2257 = fma(_2251, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2235);
    float _2259 = -_2227;
    float _2261 = _2259 + 1.0;
    out.m_82.x = _2251;
    out.m_82.y = _2213;
    out.m_82.z = _2221;
    float _2263 = _1466 + _2243;
    float _2265 = fma(_2221, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2257);
    float _2267 = _1452 + _2247;
    float _2269 = _2265 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2271 = _2213 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2273 = 1.0 / _2269;
    float _2275 = fma(_2251, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2271);
    bool _2277 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2279 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2281 = _2277 || _2279;
    bool _2283 = isnan(0.5);
    bool _2285 = _2281 || _2283;
    float _2287 = fma(_2221, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2275);
    float _2289 = _2261 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2291 = _2287 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2293 = _2291 + _2269;
    float _2295 = _2136 + _2100;
    float _2297 = _2265;
    if (_2285)
    {
        _2297 = 1.0;
    }
    float _2299 = _2297;
    float _2301 = _2293 * _2273;
    float _2303 = _2301 * 0.5;
    float _2305 = _2253 + _2100;
    float _2307 = _2295 * 0.5;
    float _2309 = fma(_2138, -0.5, _2255);
    float _2311 = _2305 * 0.5;
    float _2313 = _2299;
    float _2315 = _2311;
    float _2317 = _2309;
    float _2319 = _2307;
    if (!_2285)
    {
        float _2321 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2323 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2325 = fma(_2303, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2323);
        float _2327 = _2321 * 0.15915493667125701904296875;
        float _2329 = _2327 * 6.283185482025146484375;
        float _2331 = cos(_2329);
        float _2333 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2335 = _2333 * 0.15915493667125701904296875;
        float _2337 = _2327 * 6.283185482025146484375;
        float _2339 = sin(_2337);
        float _2341 = 1.0 / _2331;
        float _2343 = _2335 * 6.283185482025146484375;
        float _2345 = cos(_2343);
        float _2347 = _2339 * _2341;
        float _2349 = 1.0 / _2325;
        float _2351 = _2345 * _2347;
        float _2353 = _2335 * 6.283185482025146484375;
        float _2355 = sin(_2353);
        float _2357 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2359 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2357;
        float _2361 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2363 = _2349 * _2361;
        float _2365 = 1.0 / _2351;
        float _2367 = 1.0 / _2359;
        float _2369 = _2355 * _2365;
        float _2371 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2373 = fma(_2369, _2363, _2371);
        float _2375 = _2373 * _2367;
        float _2377 = precise::clamp(_2375, 0.0, 1.0);
        _2313 = _2377;
    }
    float _2379 = _2313;
    float _2381 = _2289 * _2162;
    float _2383 = -_2289;
    float _2385 = _2383 + 1.0;
    out.m_84.x = _2245;
    out.m_84.y = _2263;
    out.m_84.z = _2267;
    bool _2387 = _1876 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2389 = isnan(_1876);
    bool _2391 = _2387 || _2389;
    bool _2393 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2395 = _2391 || _2393;
    float _2397 = _2173 * _2381;
    float _2399 = _2183 * _2381;
    float _2401 = _2173 * _2385;
    out.m_86.x = _1858;
    out.m_86.y = _1854;
    out.m_86.z = _1844;
    float _2403 = fma(_2179, _2397, _2167);
    float _2405 = fma(_2181, _2397, _2169);
    float _2407 = fma(_2173, _2399, _2171);
    out.gl_Position.x = _2136;
    out.gl_Position.y = _2138;
    out.gl_Position.z = _2253;
    out.gl_Position.w = _2100;
    out.m_88.x = _2403;
    out.m_88.y = _2405;
    out.m_88.z = _2407;
    out.m_88.w = _2401;
    out.m_90.x = _2307;
    out.m_90.y = _2309;
    out.m_90.z = _2311;
    out.m_90.w = _2100;
    float _2409 = _2379 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    if (!_2395)
    {
        _2315 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2411 = _2315;
    float _2413 = _2411;
    float _2415 = _2411;
    if (!_2395)
    {
        _2317 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2417 = _2317;
    float _2419 = _2417;
    float _2421 = _2417;
    if (!_2395)
    {
        _2319 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2423 = _2319;
    bool _2425 = !_2395;
    float _2427 = _2423;
    float _2429 = _2423;
    if (!_2425)
    {
        bool _2431 = _1876 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2433 = isnan(_1876);
        bool _2435 = _2431 || _2433;
        bool _2437 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2439 = _2435 || _2437;
        if (!_2439)
        {
            float _2441 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2443 = _1876 + _2441;
            float _2445 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2447 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2445;
            float _2449 = 1.0 / _2447;
            float _2451 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2453 = _2451 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2455 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2457 = _2455 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2459 = _2443 * _2449;
            float _2461 = precise::clamp(_2459, 0.0, 1.0);
            float _2463 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2465 = _2463 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2467 = fma(_2461, _2457, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2469 = fma(_2461, _2465, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2471 = fma(_2461, _2453, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            _2421 = _2471;
            _2415 = _2469;
            _2429 = _2467;
            _2473 = true;
        }
        else
        {
            bool _2475 = _1876 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2477 = isnan(_1876);
            bool _2479 = _2475 || _2477;
            bool _2481 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2483 = _2479 || _2481;
            if (!_2483)
            {
                _2413 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2485 = _2413;
            _2415 = _2485;
            if (!_2483)
            {
                _2419 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2487 = _2419;
            _2421 = _2487;
            if (!_2483)
            {
                _2427 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2489 = _2427;
            bool _2491 = !_2483;
            _2429 = _2489;
            if (!_2491)
            {
                bool _2493 = _1876 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2495 = isnan(_1876);
                bool _2497 = _2493 || _2495;
                bool _2499 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2501 = _2497 || _2499;
                if (!_2501)
                {
                    float _2503 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2505 = _1876 + _2503;
                    float _2507 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2509 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2507;
                    float _2511 = 1.0 / _2509;
                    float _2513 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2515 = _2513 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2517 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2519 = _2517 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2521 = _2505 * _2511;
                    float _2523 = precise::clamp(_2521, 0.0, 1.0);
                    float _2525 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2527 = _2525 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2529 = fma(_2523, _2519, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2531 = fma(_2523, _2527, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2533 = fma(_2523, _2515, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    _2421 = _2533;
                    _2415 = _2531;
                    _2429 = _2529;
                    _2473 = true;
                }
                else
                {
                    _2421 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2415 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2429 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _2473 = false;
    float _2535 = _2421;
    float _2537 = _2415;
    float _2539 = _2429;
    float _2541 = _2409 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_92.x = 0.0;
    float _2543 = _2535 * 0.586610972881317138671875;
    bool _2545 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_53.x = _2541;
    float _2547 = fma(_2537, 0.298911988735198974609375, _2543);
    bool _2549 = _2379 > 0.0;
    bool _2551 = isnan(_2379);
    bool _2553 = _2549 || _2551;
    bool _2555 = isnan(0.0);
    bool _2557 = _2553 || _2555;
    float _2559 = fma(_2539, 0.114477999508380889892578125, _2547);
    float _2561 = -_2559;
    float _2563 = _2561 + _2537;
    float _2565 = -_2559;
    float _2567 = _2565 + _2535;
    float _2569 = -_2559;
    float _2571 = _2569 + _2539;
    float _2573 = fma(_2563, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2559);
    float _2575 = fma(_2567, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2559);
    float _2577 = fma(_2571, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2559);
    bool _2579 = !_2545;
    if (!_2579)
    {
        float _2581 = -_1854;
        float _2583 = _2581 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2585 = -_1858;
        float _2587 = _2585 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2589 = -_1844;
        float _2591 = _2589 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2593 = _2583 * _2583;
        float _2595 = fma(_2587, _2587, _2593);
        float _2597 = fma(_2591, _2591, _2595);
        float _2599 = sqrt(_2597);
        float _2601 = rsqrt(_2597);
        float _2603 = -_2599;
        float _2605 = _2603 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2607 = _2605 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2609 = precise::clamp(_2607, 0.0, 1.0);
        float _2611 = _2587 * _2601;
        float _2613 = _2583 * _2601;
        float _2615 = abs(_2609);
        float _2617 = log2(_2615);
        float _2619 = _2591 * _2601;
        float _2621 = _2611 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2623 = _2263 * _2613;
        float _2625 = -_2613;
        float _2627 = -_2621;
        float _2629 = fma(_2625, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2627);
        float _2631 = fma(_2245, _2611, _2623);
        float _2633 = -_2619;
        float _2635 = fma(_2633, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2629);
        float _2637 = fma(_2267, _2619, _2631);
        float _2639 = precise::clamp(_2637, 0.0, 1.0);
        float _2641 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2643 = _2635 + _2641;
        float _2645 = _2617 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2647 = _2643 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2649 = precise::clamp(_2647, 0.0, 1.0);
        float _2651 = exp2(_2645);
        float _2653 = _2651 * _2649;
        float _2655 = _2639 * _2653;
        float _2657 = _2655 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2659 = _2655 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2661 = _2655 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_92.x = _2657;
        out.m_92.y = _2659;
        out.m_92.z = _2661;
    }
    out.m_72.x = _2573;
    out.m_72.y = _2575;
    out.m_72.z = _2577;
    if (_2557)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_53.x = 0.0;
    float _2663 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2663;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2473 = false;
    bool _207 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _106 = in.m_46.w;
    float _108 = in.m_48.w;
    float _110 = trunc(_106);
    int _113 = int(_110);
    float _115 = -_108;
    float _117 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _117;
    bool _121 = _113 >= 1;
    float _123 = 0.0;
    float _125 = _108;
    if (!_121)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _127 = _123;
    if (!_121)
    {
        out.m_53.x = 0.0;
    }
    int _129 = 0;
    if (!_121)
    {
        float _131 = _127 * 5.0;
        _129 = as_type<int>(_131);
    }
    int _133 = _129;
    int _135 = _133;
    if (!_121)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2730 = as_type<float>(_133);
        out.gl_Position.z = _2730;
    }
    if (!_121)
    {
        return out;
    }
    bool _137 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _139 = isnan(_108);
    bool _141 = _137 || _139;
    bool _143 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _145 = _141 || _143;
    float _147 = float(_113);
    bool _149 = _117 >= _147;
    bool _151 = !_145;
    bool _153 = _149 || _151;
    if (_153)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _155 = _125;
    if (_153)
    {
        out.m_53.x = 0.0;
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
        float _2785 = as_type<float>(_159);
        out.gl_Position.z = _2785;
    }
    if (_153)
    {
        return out;
    }
    float _161 = as_type<float>(int(gl_VertexIndex));
    float _163 = 1.0 / _147;
    bool _165 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _167 = _117 * _163;
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
        float _189 = in.m_58.x;
        float _191 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _193 = _189 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _195 = fma(_193, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
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
    float _215 = in.m_60.x;
    float _217 = in.m_60.y;
    bool _219 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _221 = isnan(_209);
    bool _223 = _219 || _221;
    bool _225 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _227 = _223 || _225;
    float _229 = float(_227);
    float _231 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _233 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _231;
    bool _235 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _237 = isnan(_209);
    bool _239 = _235 || _237;
    bool _241 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _243 = _239 || _241;
    float _245 = float(_243);
    float _247 = -_229;
    float _249 = _247 + 1.0;
    float _251 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _253 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _251;
    float _255 = 1.0 / _233;
    bool _257 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _259 = _245 * _249;
    float _261 = -_245;
    float _263 = _261 + 1.0;
    float _265 = _213 * _255;
    float _267 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _269 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _267;
    float _271 = fma(_253, _265, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _273 = fma(_269, _265, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _275 = _271 * _259;
    float _277 = _273 * _259;
    float _279 = fma(_263, (*spvDescriptorSet0.vp_c9)._m0[143].x, _275);
    float _281 = fma(_263, (*spvDescriptorSet0.vp_c9)._m0[143].y, _277);
    float _283 = fma(_229, (*spvDescriptorSet0.vp_c9)._m0[144].x, _279);
    float _285 = fma(_229, (*spvDescriptorSet0.vp_c9)._m0[144].y, _281);
    float _287 = _283 * _215;
    float _289 = _285 * _217;
    bool _291 = !_257;
    if (!_291)
    {
        float _293 = in.m_58.x;
        float _295 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _297 = _293 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _299 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[11].y, _117);
        float _301 = _299 * _295;
        float _303 = floor(_301);
        float _305 = -_303;
        float _307 = _301 + _305;
        _187 = _307;
    }
    float _309 = _187;
    float _311 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _313 = int(_311);
    float _315 = in.m_58.x;
    float _317 = in.m_58.y;
    float _319 = in.m_58.z;
    float _321 = in.m_58.w;
    float _323 = _287 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _325 = in.m_46.x;
    float _327 = in.m_46.y;
    float _329 = in.m_46.z;
    float _331 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _333 = int(_331);
    float _335 = in.m_62.x;
    float _337 = in.m_62.y;
    float _339 = in.m_62.z;
    float _341 = in.m_62.w;
    float _343 = in.m_64.x;
    float _345 = in.m_64.y;
    float _347 = in.m_64.z;
    float _349 = in.m_64.w;
    float _351 = float(_313);
    float _353 = in.m_66.y;
    float _355 = 1.0 / _351;
    float _357 = float(uint(_333));
    float _359 = _317 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _361 = ~_333;
    int _363 = _361 + 1;
    int _365 = ~_333;
    int _367 = _365 + 1;
    float _369 = 1.0 / _357;
    float _371 = _327 * _337;
    float _373 = _327 * _345;
    float _375 = _117 * _355;
    float _377 = fma(_325, _335, _371);
    float _379 = _315 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _381 = _327 + _353;
    float _383 = fma(_325, _343, _373);
    float _385 = fma(_329, _339, _377);
    float _387 = trunc(_375);
    int _389 = int(_387);
    float _391 = fma(_329, _347, _383);
    int _393 = as_type<int>(_369) + (-2);
    float _395 = _385 + _341;
    float _397 = _391 + _349;
    float _399 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _401 = -_399;
    float _403 = fma(_379, 2.0, _401);
    float _405 = float(uint(_389));
    float _407 = as_type<float>(_393) * _405;
    float _409 = trunc(_407);
    float _411 = precise::max(_409, 0.0);
    uint _414 = uint(_411);
    int _416 = _363 * int(_414);
    int _418 = _416 + _389;
    float _420 = float(uint(_418));
    int _422 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _424 = _422 != 0;
    int _426 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _428 = _426 != 0;
    int _430 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _432 = _430 != 0;
    int _434 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _436 = _434 != 0;
    float _438 = as_type<float>(_393) * _420;
    bool _440 = _321 > 0.5;
    float _442 = trunc(_438);
    float _444 = precise::max(_442, 0.0);
    uint _446 = uint(_444);
    bool _448 = !_424;
    int _450 = _448 ? 0 : 1;
    int _452 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _454 = _452 != 0;
    bool _456 = !_432;
    int _458 = _456 ? 0 : 1;
    bool _460 = !_454;
    float _462 = _460 ? 7.345489978790283203125 : 1.0;
    int _464 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _466 = _464 != 0;
    int _468 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _470 = _468 != 0;
    float _472 = _462 * _315;
    bool _474 = !_428;
    int _476 = _474 ? 0 : 1;
    bool _478 = !_470;
    int _480 = _478 ? 0 : 1;
    float _482 = floor(_472);
    int _484 = int(_414) + int(_446);
    float _486 = in.m_68.x;
    float _488 = in.m_68.y;
    float _490 = in.m_68.z;
    float _492 = in.m_68.w;
    int _494 = abs(_450);
    int _496 = _367 * _484;
    int _498 = _496 + _389;
    int _500 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _502 = _500 != 0;
    int _504 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _506 = _504 != 0;
    bool _508 = uint(_498) >= uint(_333);
    bool _510 = !_436;
    int _512 = _510 ? 0 : 1;
    bool _514 = _315 > 0.5;
    float _516 = -_482;
    float _518 = _472 + _516;
    bool _520 = !_508;
    int _522 = _520 ? 0 : (-1);
    float _524 = -_179;
    int _526 = _514 ? as_type<int>(_524) : as_type<int>(_179);
    int _528 = ~_484;
    int _530 = _528 + _522;
    int _532 = _530 + 1;
    int _534 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _536 = _534 != 0;
    int _538 = _333 * _532;
    int _540 = _538 + _389;
    float _542 = _327 * _488;
    float _544 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _546 = _544 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    int _548 = _333 + (-1);
    float _550 = fma(_325, _486, _542);
    float _552 = float(_333);
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _556 = _554 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _558 = float(_389);
    float _560 = fma(_329, _490, _550);
    bool _562 = !_466;
    float _564 = _562 ? _179 : as_type<float>(_526);
    float _566 = _117 * _552;
    bool _568 = _558 >= _552;
    bool _570 = isnan(_558);
    bool _572 = _568 || _570;
    bool _574 = isnan(_552);
    bool _576 = _572 || _574;
    float _578 = float(_576);
    float _580 = 1.0 / _556;
    bool _582 = _317 > 0.5;
    float _584 = _566 * _163;
    float _586 = _518 * _552;
    float _588 = -_183;
    int _590 = _582 ? as_type<int>(_588) : as_type<int>(_183);
    float _592 = trunc(_578);
    int _594 = int(_592);
    bool _596 = _333 == 0;
    float _598 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _600 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _598;
    int _602 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _604 = _602 != 0;
    bool _606 = !_596;
    int _608 = _606 ? _540 : (-1);
    float _610 = trunc(_586);
    int _612 = int(_610);
    float _614 = _600 * _580;
    float _616 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _618 = ~_594;
    int _620 = _618 + 1;
    int _622 = _620 + 1;
    float _624 = trunc(_584);
    int _626 = int(_624);
    float _628 = fma(_359, -2.0, _616);
    int _630 = _608 * _622;
    int _632 = _594 * _548;
    int _634 = _632 + _630;
    int _636 = abs(_476);
    float _638 = 1.0 / _546;
    int _640 = abs(_480);
    float _642 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _644 = _642 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    int _646 = abs(_458);
    int _648 = _634 * _636;
    int _650 = _612 * _640;
    int _652 = _650 + _389;
    float _654 = 1.0 / _644;
    float _656 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _658 = _656 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    int _660 = _626 * _494;
    int _662 = _660 + _648;
    int _664 = _652 * _646;
    int _666 = _664 + _662;
    int _668 = abs(_512);
    float _670 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _672 = _658 * _638;
    float _674 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _676 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _674;
    float _678 = fma(_315, (*spvDescriptorSet0.vp_c9)._m0[78].z, _670);
    float _680 = (*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _682 = as_type<float>(_668);
    if (!_454)
    {
        _680 = _317;
    }
    float _684 = _680;
    int _686 = _612 * _668;
    int _688 = _686 + _666;
    float _690 = _676 * _654;
    bool _692 = !_502;
    float _694 = _692 ? _183 : as_type<float>(_590);
    float _696 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _698 = _309 + _696;
    bool _700 = _319 > 0.5;
    float _702 = _654;
    float _704 = _684;
    if (!_454)
    {
        _682 = _319;
    }
    float _706 = _682;
    float _708 = _706;
    if (!_454)
    {
        _702 = _319;
    }
    float _710 = _702;
    float _712 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _714 = _309 + _712;
    float _716 = float(uint(_688));
    bool _718 = _309 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _720 = isnan(_309);
    bool _722 = _718 || _720;
    bool _724 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _726 = _722 || _724;
    float _728 = float(_726);
    float _730 = fma(_672, _714, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _732 = _710;
    if (_454)
    {
        _704 = _315;
    }
    float _734 = _704;
    float _736 = as_type<float>(_393) * _716;
    float _738 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _740 = fma(_614, _698, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _742 = _309 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _744 = isnan(_309);
    bool _746 = _742 || _744;
    bool _748 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _750 = _746 || _748;
    float _752 = float(_750);
    float _754 = -_728;
    float _756 = _754 + 1.0;
    float _758 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _760 = _309 + _758;
    float _762 = trunc(_736);
    float _764 = precise::max(_762, 0.0);
    uint _766 = uint(_764);
    bool _768 = _309 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _770 = isnan(_309);
    bool _772 = _768 || _770;
    bool _774 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _776 = _772 || _774;
    float _778 = float(_776);
    float _780 = _752 * _756;
    float _782 = -_752;
    float _784 = _782 + 1.0;
    float _786 = fma(_690, _760, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    int _788 = ~_333;
    int _790 = _788 + 1;
    float _792 = fma(_317, (*spvDescriptorSet0.vp_c9)._m0[78].w, _738);
    if (_454)
    {
        _708 = _317;
    }
    float _794 = _708;
    float _796 = _778 * _784;
    float _798 = -_778;
    float _800 = _798 + 1.0;
    if (_454)
    {
        _732 = _317;
    }
    float _802 = _732;
    float _804 = _794 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _806 = _309 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _808 = isnan(_309);
    bool _810 = _806 || _808;
    bool _812 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _814 = _810 || _812;
    float _816 = float(_814);
    int _818 = _790 * int(_766);
    int _820 = _818 + _688;
    float _822 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _824 = _816 * _800;
    float _826 = float(uint(_820));
    float _828 = fma(_802, (*spvDescriptorSet0.vp_c9)._m0[83].w, _822);
    float _830 = _560 + _492;
    float _832 = _740 * _824;
    float _834 = as_type<float>(_393) * _826;
    float _836 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _838 = -_117;
    float _840 = fma(_838, (*spvDescriptorSet0.vp_c9)._m0[76].x, _403);
    float _842 = _564 + 0.5;
    float _844 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _846 = fma(_734, (*spvDescriptorSet0.vp_c9)._m0[83].z, _836);
    float _848 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _850 = _734 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _852 = fma(_842, (*spvDescriptorSet0.vp_c9)._m0[80].x, _840);
    float _854 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[76].y, _628);
    float _856 = _694 + (-0.5);
    float _858 = -_816;
    float _860 = _858 + 1.0;
    float _862 = trunc(_834);
    float _864 = precise::max(_862, 0.0);
    uint _866 = uint(_864);
    float _868 = -_848;
    float _870 = fma(_850, 2.0, _868);
    float _872 = -_856;
    float _874 = -_854;
    float _876 = fma(_872, (*spvDescriptorSet0.vp_c9)._m0[80].y, _874);
    float _878 = fma(_860, (*spvDescriptorSet0.vp_c9)._m0[115].x, _832);
    float _880 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].z, _678);
    float _882 = -_117;
    float _884 = fma(_882, (*spvDescriptorSet0.vp_c9)._m0[81].x, _870);
    float _886 = -_179;
    int _888 = _700 ? as_type<int>(_886) : as_type<int>(_179);
    float _890 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _892 = fma(_730, _796, _878);
    float _894 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[82].w, _828);
    float _896 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _898 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _900 = _395 + _898;
    float _902 = _844 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _904 = -_183;
    int _906 = _440 ? as_type<int>(_904) : as_type<int>(_183);
    float _908 = fma(_804, -2.0, _890);
    bool _910 = !_604;
    float _912 = _910 ? _179 : as_type<float>(_888);
    float _914 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _916 = _830 + _914;
    int _918 = int(_766) + int(_866);
    float _920 = _900 * _900;
    int _922 = ~_333;
    int _924 = _922 + 1;
    float _926 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].w, _792);
    float _928 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[82].z, _846);
    bool _930 = !_536;
    float _932 = _930 ? _183 : as_type<float>(_906);
    float _934 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[81].y, _908);
    int _936 = _924 * _918;
    int _938 = _936 + _688;
    float _940 = float(uint(_652));
    float _942 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _944 = _397 + _942;
    float _946 = fma(_916, _916, _920);
    float _948 = _912 + 0.5;
    bool _950 = uint(_938) >= uint(_333);
    float _952 = as_type<float>(_393) * _940;
    float _954 = fma(_944, _944, _946);
    float _956 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _958 = _381 + _956;
    bool _960 = !_950;
    int _962 = _960 ? 0 : (-1);
    float _964 = fma(_902, _948, _884);
    float _966 = _896 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _968 = fma(_958, _958, _920);
    int _970 = ~_918;
    int _972 = _970 + _962;
    int _974 = _972 + 1;
    float _976 = trunc(_952);
    float _978 = precise::max(_976, 0.0);
    uint _980 = uint(_978);
    float _982 = _932 + (-0.5);
    int _984 = ~_333;
    int _986 = _984 + 1;
    float _988 = -_880;
    float _990 = _988 + 1.0;
    int _992 = _333 * _974;
    int _994 = _992 + _688;
    float _996 = fma(_944, _944, _968);
    float _998 = -_966;
    float _1000 = -_934;
    float _1002 = fma(_998, _982, _1000);
    float _1004 = _958 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1006 = sqrt(_954);
    bool _1008 = !_596;
    int _1010 = _1008 ? _994 : (-1);
    float _1012 = fma(_786, _780, _892);
    float _1014 = fma(_900, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1004);
    float _1016 = _323 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    int _1018 = _1010 >> 31;
    float _1020 = -_926;
    float _1022 = _1020 + 1.0;
    float _1024 = fma(_944, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1014);
    float _1026 = rsqrt(_996);
    int _1028 = _1018 & 3;
    int _1030 = _986 * int(_980);
    int _1032 = _1030 + _652;
    float _1034 = -_928;
    float _1036 = _1034 + 1.0;
    float _1038 = -_990;
    float _1040 = fma(_564, _1038, _852);
    int _1042 = _1010 + _1028;
    float _1044 = fma(_694, _1022, _876);
    float _1046 = float(uint(_1032));
    float _1048 = rsqrt(_954);
    float _1050 = _1006 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    int _1052 = _1042 >> 2;
    float _1054 = -_1036;
    float _1056 = fma(_912, _1054, _964);
    float _1058 = as_type<float>(_393) * _1046;
    float _1060 = -_894;
    float _1062 = _1060 + 1.0;
    float _1064 = precise::min(_1016, _1050);
    float _1066 = _958 * _1026;
    int _1068 = _1052 << 4;
    int _1070 = _1068 + 368;
    float _1072 = _900 * _1026;
    float _1074 = fma(_932, _1062, _1002);
    float _1076 = -_1066;
    float _1078 = fma(_1076, (*spvDescriptorSet0.vp_c9)._m0[18].w, _958);
    uint _1080 = uint(int(uint(_1070) >> uint(2)));
    uint _1082 = uint(int(uint(int(_1080)) >> uint(2)));
    int _1084 = int(_1080) & 3;
    float _1086 = (*spvDescriptorSet0.vp_c9)._m0[int(_1082)][_1084];
    int _1088 = int(_1080) + 1;
    uint _1090 = uint(int(uint(_1088) >> uint(2)));
    int _1092 = _1088 & 3;
    float _1094 = (*spvDescriptorSet0.vp_c9)._m0[int(_1090)][_1092];
    float _1096 = -_1072;
    float _1098 = fma(_1096, (*spvDescriptorSet0.vp_c9)._m0[18].w, _900);
    float _1100 = trunc(_1058);
    float _1102 = precise::max(_1100, 0.0);
    uint _1104 = uint(_1102);
    float _1106 = _1048 * _1064;
    float _1108 = _1078 * _1078;
    int _1110 = _1010 & 3;
    bool _1112 = _1110 != 0;
    out.m_70.x = _1040;
    out.m_70.y = _1044;
    out.m_70.z = _1056;
    out.m_70.w = _1074;
    float _1114 = _916 * _1106;
    float _1116 = _900 * _1106;
    float _1118 = fma(_1098, _1098, _1108);
    bool _1120 = _1024 >= 0.0;
    float _1122 = -_1114;
    float _1124 = _916 + _1122;
    float _1126 = -_1116;
    float _1128 = _900 + _1126;
    out.m_72.w = _1064;
    int _1130 = _1070 + 8;
    uint _1132 = uint(int(uint(_1130) >> uint(2)));
    uint _1134 = uint(int(uint(int(_1132)) >> uint(2)));
    int _1136 = int(_1132) & 3;
    float _1138 = (*spvDescriptorSet0.vp_c9)._m0[int(_1134)][_1136];
    int _1140 = int(_1132) + 1;
    uint _1142 = uint(int(uint(_1140) >> uint(2)));
    int _1144 = _1140 & 3;
    float _1146 = (*spvDescriptorSet0.vp_c9)._m0[int(_1142)][_1144];
    float _1148 = _1124 * _1124;
    int _1150 = _1010 & 3;
    bool _1152 = _1150 != 0;
    float _1154 = _944 * _1106;
    int _1156 = int(_980) + int(_1104);
    float _1158 = fma(_1128, _1128, _1148);
    bool _1160 = uint(_1150) > 1u;
    float _1162 = _944 * _1026;
    int _1164 = _1112 ? 0 : 1;
    if (_1120)
    {
        out.m_53.x = 0.0;
    }
    bool _1166 = _1150 != 3;
    float _1168 = -_1162;
    float _1170 = fma(_1168, (*spvDescriptorSet0.vp_c9)._m0[18].w, _944);
    int _1172 = ~_333;
    int _1174 = _1172 + 1;
    float _1176 = -_1154;
    float _1178 = _944 + _1176;
    bool _1180 = uint(_1150) >= 2u;
    float _1182 = fma(_1170, _1170, _1118);
    int _1184 = ~_1164;
    int _1186 = _1184 + 1;
    int _1188 = _1186 + 1;
    int _1190 = _1174 * _1156;
    int _1192 = _1190 + _652;
    int _1194 = _1180 ? 0 : 1;
    float _1196 = fma(_1178, _1178, _1158);
    int _1198 = _1188;
    if (!_1160)
    {
        int _1200 = ~_1164;
        int _1202 = _1200 + 1;
        _1198 = _1202;
    }
    int _1204 = _1198;
    float _1206 = sqrt(_1182);
    bool _1208 = uint(_1192) >= uint(_333);
    int _1210 = abs(_1204);
    int _1212 = ~_1194;
    int _1214 = _1212 + 1;
    int _1216 = _1214 + 1;
    int _1218 = _1216;
    if (_1166)
    {
        int _1220 = ~_1194;
        int _1222 = _1220 + 1;
        _1218 = _1222;
    }
    int _1224 = _1218;
    bool _1226 = !_1152;
    int _1228 = _1226 ? 0 : 1;
    bool _1230 = !_1208;
    int _1232 = _1230 ? 0 : (-1);
    bool _1234 = _1150 != 3;
    float _1236 = _1026 * _1206;
    int _1238 = abs(_1228);
    int _1240 = ~_1156;
    int _1242 = _1240 + _1232;
    int _1244 = _1242 + 1;
    int _1246 = ~_1210;
    int _1248 = _1246 + 1;
    int _1250 = _1248 + 1;
    bool _1252 = !_1234;
    int _1254 = _1252 ? 0 : (-1);
    int _1256 = _333 * _1244;
    int _1258 = _1256 + _652;
    int _1260 = _1250 * as_type<int>(_1094);
    int _1262 = abs(_1254);
    float _1264 = sqrt(_1196);
    int _1266 = abs(_1224);
    int _1268 = ~_1238;
    int _1270 = _1268 + 1;
    int _1272 = _1270 + 1;
    bool _1274 = !_506;
    int _1276 = _1274 ? 0 : 1;
    int _1278 = _1272 * as_type<int>(_1086);
    int _1280 = _1278 + _1260;
    int _1282 = ~_1266;
    int _1284 = _1282 + 1;
    int _1286 = _1284 + 1;
    int _1288 = abs(_1276);
    int _1290 = ~_1262;
    int _1292 = _1290 + 1;
    int _1294 = _1292 + 1;
    int _1296 = _1286 * as_type<int>(_1138);
    int _1298 = _1296 + _1280;
    int _1300 = ~_1288;
    int _1302 = _1300 + 1;
    int _1304 = _1302 + 1;
    float _1306 = _1048 * _1264;
    float _1308 = as_type<float>(_1262);
    if (_1120)
    {
        _1308 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1310 = _1308;
    int _1312 = _1294 * as_type<int>(_1146);
    int _1314 = _1312 + _1298;
    bool _1316 = !_596;
    int _1318 = _1316 ? _1258 : (-1);
    float _1320 = fma(_728, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1012);
    int _1322 = _1314 * _1304;
    int _1324 = as_type<int>(_1310);
    if (_1120)
    {
        float _1326 = _1310 * 5.0;
        _1324 = as_type<int>(_1326);
    }
    int _1328 = _1324;
    float _1330 = _1306 * _1236;
    int _1332 = _1318 * _1288;
    int _1334 = _1332 + _1322;
    if (_1120)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4555 = as_type<float>(_1328);
        out.gl_Position.z = _4555;
    }
    float _1336 = _1320 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1338 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1340 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1342 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1344 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1346 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1348 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1350 = _1338 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1352 = _1340 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1354 = _1344 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1356 = _1346 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1358 = _1342 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1360 = float(_1334);
    float _1362 = _1348 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1364 = _323 * _1330;
    out.m_74.x = _1350;
    out.m_74.y = _1352;
    out.m_74.z = _1358;
    out.m_74.w = _1336;
    out.m_76.x = _1360;
    out.m_78.x = _1354;
    out.m_78.y = _1356;
    out.m_78.z = _1362;
    out.m_80.x = _1364;
    if (_1120)
    {
        return out;
    }
    float _1366 = -_1066;
    float _1368 = fma(_1366, (*spvDescriptorSet0.vp_c9)._m0[18].w, _381);
    float _1370 = -_1072;
    float _1372 = fma(_1370, (*spvDescriptorSet0.vp_c9)._m0[18].w, _395);
    float _1374 = -_1162;
    float _1376 = fma(_1374, (*spvDescriptorSet0.vp_c9)._m0[18].w, _397);
    float _1378 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1380 = _1368 + _1378;
    float _1382 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1384 = _1372 + _1382;
    float _1386 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1388 = _1376 + _1386;
    float _1390 = _1380 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1392 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1390);
    float _1394 = fma(_1388, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1392);
    bool _1396 = _1394 >= 0.0;
    float _1398 = _1388;
    if (_1396)
    {
        _1398 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1400 = _1398;
    int _1402 = as_type<int>(_1400);
    if (_1396)
    {
        out.m_53.x = 0.0;
    }
    if (_1396)
    {
        float _1404 = _1400 * 5.0;
        _1402 = as_type<int>(_1404);
    }
    int _1406 = _1402;
    if (_1396)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4726 = as_type<float>(_1406);
        out.gl_Position.z = _4726;
    }
    if (_1396)
    {
        return out;
    }
    float _1408 = -_381;
    float _1410 = _1408 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1412 = -_395;
    float _1414 = _1412 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1416 = -_397;
    float _1418 = _1416 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1420 = _1410 * _1410;
    float _1422 = _289 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1424 = fma(_1414, _1414, _1420);
    float _1426 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _1428 = _1422 * _1330;
    float _1430 = fma(_1418, _1418, _1424);
    float _1432 = -_1426;
    float _1434 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1432);
    float _1436 = rsqrt(_1430);
    float _1438 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1440 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1442 = -_1438;
    float _1444 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _1442);
    float _1446 = -_1440;
    float _1448 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1446);
    float _1450 = _1414 * _1436;
    float _1452 = _1418 * _1436;
    float _1454 = _1448 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1456 = _1444 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1458 = _1450 * _1450;
    float _1460 = _1448 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1462 = -_1454;
    float _1464 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1462);
    float _1466 = _1410 * _1436;
    float _1468 = fma(_1452, _1452, _1458);
    float _1470 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1472 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1474 = -_1460;
    float _1476 = fma(_1444, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1474);
    float _1478 = rsqrt(_1468);
    float _1480 = -_1470;
    float _1482 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1480);
    float _1484 = -_1472;
    float _1486 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1484);
    float _1488 = fma(_1486, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1464);
    float _1490 = _1486 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1492 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1494 = -_1456;
    float _1496 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[1].y, _1494);
    float _1498 = _1488 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1500 = -_1492;
    float _1502 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _1500);
    float _1504 = fma(_1482, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1496);
    float _1506 = _1452 * _1478;
    float _1508 = _1450 * _1478;
    float _1510 = -_1498;
    float _1512 = fma(_1504, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1510);
    float _1514 = fma(_1502, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1476);
    float _1516 = -_1506;
    float _1518 = _1452 * _1516;
    float _1520 = -_1506;
    float _1522 = _1466 * _1520;
    float _1524 = fma(_1514, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1512);
    float _1526 = -_1518;
    float _1528 = fma(_1450, _1508, _1526);
    float _1530 = _1466 * _1508;
    float _1532 = -_1490;
    float _1534 = fma(_1482, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1532);
    float _1536 = _1528 * _1528;
    float _1538 = fma(_1502, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1534);
    float _1540 = _1448 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _1542 = fma(_1530, _1530, _1536);
    float _1544 = -_1538;
    float _1546 = fma(_1544, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1524);
    float _1548 = -_1540;
    float _1550 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1548);
    float _1552 = fma(_1522, _1522, _1542);
    float _1554 = _1444 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _1556 = fma(_1486, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1550);
    float _1558 = rsqrt(_1552);
    float _1560 = _1448 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1562 = -_1554;
    float _1564 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[0].y, _1562);
    float _1566 = -_1560;
    float _1568 = fma(_1444, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1566);
    float _1570 = fma(_1482, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1564);
    float _1572 = 1.0 / _1546;
    float _1574 = fma(_1502, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1568);
    float _1576 = _1528 * _1558;
    float _1578 = precise::clamp(_1576, 0.0, 1.0);
    float _1580 = -_1578;
    float _1582 = _1580 + 1.0;
    float _1584 = fma(_1556, _1572, -1.0);
    float _1586 = _1582 * _1572;
    float _1588 = fma(_1582, _1584, 1.0);
    float _1590 = _1570 * _1586;
    float _1592 = _1574 * _1586;
    float _1594 = _1588 * _1588;
    float _1596 = fma(_1590, _1590, _1594);
    float _1598 = fma(_1592, _1592, _1596);
    float _1600 = rsqrt(_1598);
    float _1602 = _1592 * _1600;
    float _1604 = _1588 * _1600;
    float _1606 = _1590 * _1600;
    float _1608 = -_1602;
    float _1610 = _1450 * _1608;
    float _1612 = _1452 * _1604;
    float _1614 = -_1606;
    float _1616 = -_1610;
    float _1618 = fma(_1452, _1614, _1616);
    float _1620 = -_1602;
    float _1622 = -_1612;
    float _1624 = fma(_1466, _1620, _1622);
    float _1626 = -_1606;
    float _1628 = _1466 * _1626;
    float _1630 = _1618 * _1618;
    float _1632 = -_1628;
    float _1634 = fma(_1450, _1604, _1632);
    float _1636 = fma(_1624, _1624, _1630);
    float _1638 = fma(_1634, _1634, _1636);
    float _1640 = rsqrt(_1638);
    float _1642 = _1624 * _1640;
    float _1644 = _1634 * _1640;
    float _1646 = _1618 * _1640;
    float _1648 = _1452 * _1642;
    float _1650 = _1466 * _1644;
    float _1652 = _1450 * _1646;
    float _1654 = -_1648;
    float _1656 = fma(_1450, _1644, _1654);
    float _1658 = -_1650;
    float _1660 = fma(_1452, _1646, _1658);
    float _1662 = -_1652;
    float _1664 = fma(_1466, _1642, _1662);
    float _1666 = _1656 * _1656;
    float _1668 = fma(_1660, _1660, _1666);
    float _1670 = fma(_1664, _1664, _1668);
    float _1672 = rsqrt(_1670);
    float _1674 = _1664 * _1672;
    float _1676 = _1660 * _1672;
    float _1678 = _1656 * _1672;
    float _1680 = _1450 * _1674;
    float _1682 = _1452 * _1678;
    float _1684 = -_1680;
    float _1686 = fma(_1452, _1676, _1684);
    float _1688 = _1466 * _1676;
    float _1690 = -_1682;
    float _1692 = fma(_1466, _1674, _1690);
    float _1694 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _183);
    float _1696 = _1686 * _1686;
    float _1698 = -_1688;
    float _1700 = fma(_1450, _1678, _1698);
    float _1702 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _179);
    float _1704 = _1428 * _1694;
    float _1706 = fma(_1692, _1692, _1696);
    float _1708 = _1364 * _1702;
    float _1710 = _1704 * _1674;
    float _1712 = fma(_1700, _1700, _1706);
    float _1714 = _1704 * _1676;
    float _1716 = _1704 * _1678;
    float _1718 = rsqrt(_1712);
    float _1720 = _1700 * _1718;
    float _1722 = _1692 * _1718;
    float _1724 = _1686 * _1718;
    float _1726 = fma(_1708, _1720, _1710);
    float _1728 = fma(_1708, _1722, _1714);
    float _1730 = fma(_1708, _1724, _1716);
    float _1732 = _397 + _1726;
    float _1734 = _395 + _1728;
    float _1736 = _381 + _1730;
    float _1738 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1740 = _1732 + _1738;
    float _1742 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1744 = _1734 + _1742;
    float _1746 = _1740 * _1740;
    float _1748 = fma(_1744, _1744, _1746);
    float _1750 = sqrt(_1748);
    bool _1752 = _1750 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1754 = _1730;
    float _1756 = _1708;
    float _1758 = _1734;
    float _1760 = _1666;
    float _1762 = _1522;
    if (!_1752)
    {
        _1754 = _1732;
    }
    float _1764 = _1754;
    float _1766 = _1764;
    if (!_1752)
    {
        _1756 = _1736;
    }
    float _1768 = _1756;
    bool _1770 = !_1752;
    float _1772 = _1768;
    if (!_1770)
    {
        float _1774 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1776 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1778 = _1750 + _1776;
        float _1780 = _1736 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1782 = rsqrt(_1748);
        float _1784 = _1778 * _1774;
        float _1786 = _1784 * 0.15915493667125701904296875;
        float _1788 = _1786 * 6.283185482025146484375;
        float _1790 = cos(_1788);
        float _1792 = _1786 * 6.283185482025146484375;
        float _1794 = sin(_1792);
        float _1796 = _1790 + (-1.0);
        float _1798 = fma(_1794, _1780, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1800 = _1796 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1802 = _1782 * _1798;
        float _1804 = fma(_1736, _1790, _1800);
        float _1806 = fma(_1744, _1802, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1808 = fma(_1740, _1802, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1758 = _1806;
        _1766 = _1808;
        _1772 = _1804;
    }
    float _1810 = _1758;
    float _1812 = _1766;
    float _1814 = _1772;
    float _1816 = -_1116;
    float _1818 = _1816 + _1810;
    float _1820 = -_1154;
    float _1822 = _1820 + _1812;
    float _1824 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _1826 = _1818 + _1824;
    float _1828 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _1830 = _1822 + _1828;
    float _1832 = fma(_1826, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _1834 = fma(_1830, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _5435 = float2(_1832, _1834);
    float _1836 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_5435, float2(0.0), isnan(_5435)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_5435, float2(0.0), isnan(_5435)), level(0.0)).x;
    float _1838 = -_1114;
    float _1840 = _1838 + _1814;
    float _1842 = -_1162;
    float _1844 = fma(_1842, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1822);
    float _1846 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1848 = _1844 + _1846;
    float _1850 = fma(_1836, 100.0, _1840);
    float _1852 = -_1066;
    float _1854 = fma(_1852, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1850);
    float _1856 = -_1072;
    float _1858 = fma(_1856, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1818);
    float _1860 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1862 = _1854 + _1860;
    float _1864 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1866 = _1858 + _1864;
    float _1868 = _1862 * _1862;
    float _1870 = fma(_1866, _1866, _1868);
    float _1872 = fma(_1848, _1848, _1870);
    float _1874 = rsqrt(_1872);
    float _1876 = sqrt(_1872);
    float _1878 = _1874 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1880 = _1866 * _1878;
    float _1882 = _1848 * _1878;
    float _1884 = _1880 * _1880;
    float _1886 = _1882 * _1882;
    float _1888 = _1884 + _1886;
    float _1890 = sqrt(_1888);
    bool _1892 = _1890 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1894 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1896 = _1890 + _1894;
    float _1898 = _1870;
    float _1900 = _1896;
    float _1902 = _1862;
    float _1904 = _1882;
    float _1906 = _1886;
    if (_1892)
    {
        float _1908 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1898 = _1908;
    }
    float _1910 = _1898;
    float _1912 = _1910;
    if (_1892)
    {
        float _1914 = _1896 * _1910;
        _1900 = _1914;
    }
    float _1916 = _1900;
    if (_1892)
    {
        float _1918 = rsqrt(_1888);
        _1912 = _1918;
    }
    float _1920 = _1912;
    float _1922 = _1920;
    if (_1892)
    {
        float _1924 = _1916 * 0.15915493667125701904296875;
        _1760 = _1924;
    }
    float _1926 = _1760;
    float _1928 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1930 = _1848;
    if (_1892)
    {
        float _1932 = _1926 * 6.283185482025146484375;
        float _1934 = sin(_1932);
        _1930 = _1934;
    }
    float _1936 = _1930;
    float _1938 = precise::max(0.0, _1928);
    float _1940 = _1740;
    float _1942 = _1938;
    if (_1892)
    {
        float _1944 = _1926 * 6.283185482025146484375;
        float _1946 = cos(_1944);
        _1940 = _1946;
    }
    float _1948 = _1940;
    float _1950 = -_1878;
    float _1952 = -_1938;
    float _1954 = fma(_1862, _1950, _1952);
    if (_1892)
    {
        float _1956 = _1954 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1902 = _1956;
    }
    float _1958 = _1902;
    float _1960 = _1936;
    float _1962 = _1958;
    if (_1892)
    {
        float _1964 = fma(_1936, _1958, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1942 = _1964;
    }
    float _1966 = _1942;
    float _1968 = _1966;
    if (!_1892)
    {
        _1960 = _1880;
    }
    float _1970 = _1960;
    float _1972 = _1970;
    if (_1892)
    {
        float _1974 = _1920 * _1966;
        _1762 = _1974;
    }
    float _1976 = _1762;
    if (!_1892)
    {
        _1968 = _1954;
    }
    float _1978 = _1968;
    float _1980 = _1978;
    if (_1892)
    {
        float _1982 = _1948 + (-1.0);
        _1962 = _1982;
    }
    float _1984 = _1962;
    float _1986 = _1984;
    if (_1892)
    {
        float _1988 = _1880 * _1976;
        _1972 = _1988;
    }
    float _1990 = _1972;
    if (_1892)
    {
        float _1992 = _1882 * _1976;
        _1904 = _1992;
    }
    float _1994 = _1904;
    if (_1892)
    {
        float _1996 = _1984 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1922 = _1996;
    }
    float _1998 = _1922;
    if (!_1892)
    {
        _1986 = _1884;
    }
    float _2000 = _1986;
    float _2002 = _2000;
    if (_1892)
    {
        float _2004 = _1990 * _1990;
        _2002 = _2004;
    }
    float _2006 = _2002;
    if (_1892)
    {
        float _2008 = _1994 * _1994;
        _1906 = _2008;
    }
    float _2010 = _1906;
    if (_1892)
    {
        float _2012 = fma(_1954, _1948, _1998);
        _1980 = _2012;
    }
    float _2014 = _1980;
    float _2016 = _1854 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2018 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2020 = fma(_1876, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2018);
    float _2022 = precise::clamp(_2020, 0.0, 1.0);
    float _2024 = fma(_2014, _2014, _2006);
    float _2026 = _1854 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2028 = -_2022;
    float _2030 = _2028 + 1.0;
    float _2032 = _2024 + _2010;
    float _2034 = fma(_1858, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2016);
    float _2036 = _1854 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2038 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2040 = abs(_2030);
    float _2042 = log2(_2040);
    float _2044 = fma(_1844, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2034);
    float _2046 = fma(_1858, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2036);
    float _2048 = _1854 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2050 = fma(_1858, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2026);
    float _2052 = _2044 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2054 = fma(_1844, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2046);
    float _2056 = fma(_1858, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2048);
    float _2058 = rsqrt(_2032);
    float _2060 = _2052 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2062 = _2054 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2064 = fma(_1844, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2056);
    float _2066 = fma(_1844, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2050);
    float _2068 = -_2060;
    float _2070 = fma(_2068, _2038, 1.0);
    float _2072 = _2062 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2074 = _2064 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2076 = _2066 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2078 = log2(_2070);
    float _2080 = _2058 * _1990;
    float _2082 = _2058 * _2014;
    float _2084 = fma(_2074, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2072);
    float _2086 = _2058 * _1994;
    float _2088 = _2080 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2090 = _2042 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2092 = fma(_2052, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2084);
    float _2094 = -_2088;
    float _2096 = fma(_2082, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2094);
    float _2098 = _2062 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2100 = fma(_2076, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2092);
    float _2102 = exp2(_2090);
    float _2104 = -_2086;
    float _2106 = fma(_2104, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2096);
    float _2108 = _2062 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2110 = fma(_2074, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2098);
    float _2112 = fma(_2106, -0.5, 0.5);
    float _2114 = fma(_2106, 0.5, 0.5);
    float _2116 = fma(_2074, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2108);
    float _2118 = 1.0 / _2100;
    float _2120 = _2082 + 1.0;
    float _2122 = fma(_2114, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2124 = fma(_2052, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2116);
    float _2126 = fma(_2052, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2110);
    float _2128 = fma(_2114, _2122, -0.212114393711090087890625);
    float _2130 = sqrt(_2112);
    float _2132 = -_2082;
    float _2134 = fma(_2102, _2120, _2132);
    float _2136 = fma(_2076, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2124);
    float _2138 = fma(_2076, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2126);
    float _2140 = _2078 * 0.693147182464599609375;
    float _2142 = fma(_2114, _2128, 1.570728778839111328125);
    float _2144 = _2136 * _2118;
    float _2146 = _2138 * _2118;
    float _2148 = _2140 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2150 = fma(_2134, 0.5, 0.5);
    float _2152 = fma(_2144, 0.5, 0.5);
    float _2154 = fma(_2146, -0.5, 0.5);
    float _2156 = _2130 * 0.636619746685028076171875;
    float _2158 = -_2142;
    float _2160 = fma(_2156, _2158, 1.0);
    float3 _5985 = float3(_2152, _2154, _2148);
    float _2162 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5985, float3(0.0), isnan(_5985)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5985, float3(0.0), isnan(_5985)), level(0.0)).x;
    float3 _5996 = float3(_2152, _2154, _2148);
    float4 _2165 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5996, float3(0.0), isnan(_5996)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5996, float3(0.0), isnan(_5996)), level(0.0)).xyzw;
    float _2167 = _2165.x;
    float _2169 = _2165.y;
    float _2171 = _2165.z;
    float _2173 = _2165.w;
    float2 _6012 = float2(_2160, _2150);
    float3 _2177 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6012, float2(0.0), isnan(_6012)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6012, float2(0.0), isnan(_6012)), level(0.0)).xyz;
    float _2179 = _2177.x;
    float _2181 = _2177.y;
    float _2183 = _2177.z;
    float _2185 = _916 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _2187 = -_1116;
    float _2189 = _395 + _2187;
    float _2191 = -_1114;
    float _2193 = _2191 + _381;
    float _2195 = _183 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2197 = abs(_2185);
    float _2199 = 1.0 / _2197;
    float _2201 = _179 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2203 = fma(_1836, 100.0, _2193);
    float _2205 = _2195 * _1676;
    out.m_78.x = _1354;
    out.m_78.y = _1356;
    out.m_78.z = _1362;
    float _2207 = -_1154;
    float _2209 = _397 + _2207;
    float _2211 = -_1066;
    float _2213 = fma(_2211, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2203);
    float _2215 = _2042 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2217 = _2062 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2219 = -_1162;
    float _2221 = fma(_2219, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2209);
    float _2223 = _2195 * _1678;
    float _2225 = fma(_2074, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2217);
    float _2227 = exp2(_2215);
    float _2229 = 0.0 + _2199;
    float _2231 = precise::clamp(_2229, 0.0, 1.0);
    float _2233 = fma(_2201, _1722, _2205);
    float _2235 = _2213 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2237 = fma(_2052, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2225);
    float _2239 = _1336 * _2231;
    float _2241 = _2195 * _1674;
    float _2243 = fma(_2201, _1724, _2223);
    float _2245 = _1450 + _2233;
    float _2247 = fma(_2201, _1720, _2241);
    float _2249 = -_1072;
    float _2251 = fma(_2249, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2189);
    out.m_74.x = _1350;
    out.m_74.y = _1352;
    out.m_74.z = _1358;
    out.m_74.w = _2239;
    float _2253 = fma(_2076, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2237);
    float _2255 = _2100 * 0.5;
    float _2257 = fma(_2251, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2235);
    float _2259 = -_2227;
    float _2261 = _2259 + 1.0;
    out.m_82.x = _2251;
    out.m_82.y = _2213;
    out.m_82.z = _2221;
    float _2263 = _1466 + _2243;
    float _2265 = fma(_2221, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2257);
    float _2267 = _1452 + _2247;
    float _2269 = _2265 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2271 = _2213 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2273 = 1.0 / _2269;
    float _2275 = fma(_2251, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2271);
    bool _2277 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2279 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2281 = _2277 || _2279;
    bool _2283 = isnan(0.5);
    bool _2285 = _2281 || _2283;
    float _2287 = fma(_2221, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2275);
    float _2289 = _2261 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2291 = _2287 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2293 = _2291 + _2269;
    float _2295 = _2136 + _2100;
    float _2297 = _2265;
    if (_2285)
    {
        _2297 = 1.0;
    }
    float _2299 = _2297;
    float _2301 = _2293 * _2273;
    float _2303 = _2301 * 0.5;
    float _2305 = _2253 + _2100;
    float _2307 = _2295 * 0.5;
    float _2309 = fma(_2138, -0.5, _2255);
    float _2311 = _2305 * 0.5;
    float _2313 = _2299;
    float _2315 = _2311;
    float _2317 = _2309;
    float _2319 = _2307;
    if (!_2285)
    {
        float _2321 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2323 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2325 = fma(_2303, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2323);
        float _2327 = _2321 * 0.15915493667125701904296875;
        float _2329 = _2327 * 6.283185482025146484375;
        float _2331 = cos(_2329);
        float _2333 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2335 = _2333 * 0.15915493667125701904296875;
        float _2337 = _2327 * 6.283185482025146484375;
        float _2339 = sin(_2337);
        float _2341 = 1.0 / _2331;
        float _2343 = _2335 * 6.283185482025146484375;
        float _2345 = cos(_2343);
        float _2347 = _2339 * _2341;
        float _2349 = 1.0 / _2325;
        float _2351 = _2345 * _2347;
        float _2353 = _2335 * 6.283185482025146484375;
        float _2355 = sin(_2353);
        float _2357 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2359 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2357;
        float _2361 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2363 = _2349 * _2361;
        float _2365 = 1.0 / _2351;
        float _2367 = 1.0 / _2359;
        float _2369 = _2355 * _2365;
        float _2371 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2373 = fma(_2369, _2363, _2371);
        float _2375 = _2373 * _2367;
        float _2377 = precise::clamp(_2375, 0.0, 1.0);
        _2313 = _2377;
    }
    float _2379 = _2313;
    float _2381 = _2289 * _2162;
    float _2383 = -_2289;
    float _2385 = _2383 + 1.0;
    out.m_84.x = _2245;
    out.m_84.y = _2263;
    out.m_84.z = _2267;
    bool _2387 = _1876 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2389 = isnan(_1876);
    bool _2391 = _2387 || _2389;
    bool _2393 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2395 = _2391 || _2393;
    float _2397 = _2173 * _2381;
    float _2399 = _2183 * _2381;
    float _2401 = _2173 * _2385;
    out.m_86.x = _1858;
    out.m_86.y = _1854;
    out.m_86.z = _1844;
    float _2403 = fma(_2179, _2397, _2167);
    float _2405 = fma(_2181, _2397, _2169);
    float _2407 = fma(_2173, _2399, _2171);
    out.gl_Position.x = _2136;
    out.gl_Position.y = _2138;
    out.gl_Position.z = _2253;
    out.gl_Position.w = _2100;
    out.m_88.x = _2403;
    out.m_88.y = _2405;
    out.m_88.z = _2407;
    out.m_88.w = _2401;
    out.m_90.x = _2307;
    out.m_90.y = _2309;
    out.m_90.z = _2311;
    out.m_90.w = _2100;
    float _2409 = _2379 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    if (!_2395)
    {
        _2315 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2411 = _2315;
    float _2413 = _2411;
    float _2415 = _2411;
    if (!_2395)
    {
        _2317 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2417 = _2317;
    float _2419 = _2417;
    float _2421 = _2417;
    if (!_2395)
    {
        _2319 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2423 = _2319;
    bool _2425 = !_2395;
    float _2427 = _2423;
    float _2429 = _2423;
    if (!_2425)
    {
        bool _2431 = _1876 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2433 = isnan(_1876);
        bool _2435 = _2431 || _2433;
        bool _2437 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2439 = _2435 || _2437;
        if (!_2439)
        {
            float _2441 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2443 = _1876 + _2441;
            float _2445 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2447 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2445;
            float _2449 = 1.0 / _2447;
            float _2451 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2453 = _2451 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2455 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2457 = _2455 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2459 = _2443 * _2449;
            float _2461 = precise::clamp(_2459, 0.0, 1.0);
            float _2463 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2465 = _2463 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2467 = fma(_2461, _2457, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2469 = fma(_2461, _2465, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2471 = fma(_2461, _2453, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            _2421 = _2471;
            _2415 = _2469;
            _2429 = _2467;
            _2473 = true;
        }
        else
        {
            bool _2475 = _1876 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2477 = isnan(_1876);
            bool _2479 = _2475 || _2477;
            bool _2481 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2483 = _2479 || _2481;
            if (!_2483)
            {
                _2413 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2485 = _2413;
            _2415 = _2485;
            if (!_2483)
            {
                _2419 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2487 = _2419;
            _2421 = _2487;
            if (!_2483)
            {
                _2427 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2489 = _2427;
            bool _2491 = !_2483;
            _2429 = _2489;
            if (!_2491)
            {
                bool _2493 = _1876 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2495 = isnan(_1876);
                bool _2497 = _2493 || _2495;
                bool _2499 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2501 = _2497 || _2499;
                if (!_2501)
                {
                    float _2503 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2505 = _1876 + _2503;
                    float _2507 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2509 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2507;
                    float _2511 = 1.0 / _2509;
                    float _2513 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2515 = _2513 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2517 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2519 = _2517 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2521 = _2505 * _2511;
                    float _2523 = precise::clamp(_2521, 0.0, 1.0);
                    float _2525 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2527 = _2525 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2529 = fma(_2523, _2519, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2531 = fma(_2523, _2527, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2533 = fma(_2523, _2515, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    _2421 = _2533;
                    _2415 = _2531;
                    _2429 = _2529;
                    _2473 = true;
                }
                else
                {
                    _2421 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2415 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2429 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _2473 = false;
    float _2535 = _2421;
    float _2537 = _2415;
    float _2539 = _2429;
    float _2541 = _2409 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_92.x = 0.0;
    float _2543 = _2535 * 0.586610972881317138671875;
    bool _2545 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_53.x = _2541;
    float _2547 = fma(_2537, 0.298911988735198974609375, _2543);
    bool _2549 = _2379 > 0.0;
    bool _2551 = isnan(_2379);
    bool _2553 = _2549 || _2551;
    bool _2555 = isnan(0.0);
    bool _2557 = _2553 || _2555;
    float _2559 = fma(_2539, 0.114477999508380889892578125, _2547);
    float _2561 = -_2559;
    float _2563 = _2561 + _2537;
    float _2565 = -_2559;
    float _2567 = _2565 + _2535;
    float _2569 = -_2559;
    float _2571 = _2569 + _2539;
    float _2573 = fma(_2563, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2559);
    float _2575 = fma(_2567, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2559);
    float _2577 = fma(_2571, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2559);
    bool _2579 = !_2545;
    if (!_2579)
    {
        float _2581 = -_1854;
        float _2583 = _2581 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2585 = -_1858;
        float _2587 = _2585 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2589 = -_1844;
        float _2591 = _2589 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2593 = _2583 * _2583;
        float _2595 = fma(_2587, _2587, _2593);
        float _2597 = fma(_2591, _2591, _2595);
        float _2599 = sqrt(_2597);
        float _2601 = rsqrt(_2597);
        float _2603 = -_2599;
        float _2605 = _2603 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2607 = _2605 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2609 = precise::clamp(_2607, 0.0, 1.0);
        float _2611 = _2587 * _2601;
        float _2613 = _2583 * _2601;
        float _2615 = abs(_2609);
        float _2617 = log2(_2615);
        float _2619 = _2591 * _2601;
        float _2621 = _2611 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2623 = _2263 * _2613;
        float _2625 = -_2613;
        float _2627 = -_2621;
        float _2629 = fma(_2625, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2627);
        float _2631 = fma(_2245, _2611, _2623);
        float _2633 = -_2619;
        float _2635 = fma(_2633, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2629);
        float _2637 = fma(_2267, _2619, _2631);
        float _2639 = precise::clamp(_2637, 0.0, 1.0);
        float _2641 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2643 = _2635 + _2641;
        float _2645 = _2617 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2647 = _2643 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2649 = precise::clamp(_2647, 0.0, 1.0);
        float _2651 = exp2(_2645);
        float _2653 = _2651 * _2649;
        float _2655 = _2639 * _2653;
        float _2657 = _2655 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2659 = _2655 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2661 = _2655 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_92.x = _2657;
        out.m_92.y = _2659;
        out.m_92.z = _2661;
    }
    out.m_72.x = _2573;
    out.m_72.y = _2575;
    out.m_72.z = _2577;
    if (_2557)
    {
        return out;
    }
    out.m_53.x = 0.0;
    float _2663 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2663;
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
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2473 = false;
    bool _207 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _106 = in.m_46.w;
    float _108 = in.m_48.w;
    float _110 = trunc(_106);
    int _113 = int(_110);
    float _115 = -_108;
    float _117 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _117;
    bool _121 = _113 >= 1;
    float _123 = 0.0;
    float _125 = _108;
    if (!_121)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _127 = _123;
    if (!_121)
    {
        out.m_53.x = 0.0;
    }
    int _129 = 0;
    if (!_121)
    {
        float _131 = _127 * 5.0;
        _129 = as_type<int>(_131);
    }
    int _133 = _129;
    int _135 = _133;
    if (!_121)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2730 = as_type<float>(_133);
        out.gl_Position.z = _2730;
    }
    if (!_121)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _137 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _139 = isnan(_108);
    bool _141 = _137 || _139;
    bool _143 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _145 = _141 || _143;
    float _147 = float(_113);
    bool _149 = _117 >= _147;
    bool _151 = !_145;
    bool _153 = _149 || _151;
    if (_153)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _155 = _125;
    if (_153)
    {
        out.m_53.x = 0.0;
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
        float _2785 = as_type<float>(_159);
        out.gl_Position.z = _2785;
    }
    if (_153)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _161 = as_type<float>(int(gl_VertexIndex));
    float _163 = 1.0 / _147;
    bool _165 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _167 = _117 * _163;
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
        float _189 = in.m_58.x;
        float _191 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _193 = _189 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _195 = fma(_193, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
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
    float _215 = in.m_60.x;
    float _217 = in.m_60.y;
    bool _219 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _221 = isnan(_209);
    bool _223 = _219 || _221;
    bool _225 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _227 = _223 || _225;
    float _229 = float(_227);
    float _231 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _233 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _231;
    bool _235 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _237 = isnan(_209);
    bool _239 = _235 || _237;
    bool _241 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _243 = _239 || _241;
    float _245 = float(_243);
    float _247 = -_229;
    float _249 = _247 + 1.0;
    float _251 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _253 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _251;
    float _255 = 1.0 / _233;
    bool _257 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _259 = _245 * _249;
    float _261 = -_245;
    float _263 = _261 + 1.0;
    float _265 = _213 * _255;
    float _267 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _269 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _267;
    float _271 = fma(_253, _265, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _273 = fma(_269, _265, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _275 = _271 * _259;
    float _277 = _273 * _259;
    float _279 = fma(_263, (*spvDescriptorSet0.vp_c9)._m0[143].x, _275);
    float _281 = fma(_263, (*spvDescriptorSet0.vp_c9)._m0[143].y, _277);
    float _283 = fma(_229, (*spvDescriptorSet0.vp_c9)._m0[144].x, _279);
    float _285 = fma(_229, (*spvDescriptorSet0.vp_c9)._m0[144].y, _281);
    float _287 = _283 * _215;
    float _289 = _285 * _217;
    bool _291 = !_257;
    if (!_291)
    {
        float _293 = in.m_58.x;
        float _295 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _297 = _293 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _299 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[11].y, _117);
        float _301 = _299 * _295;
        float _303 = floor(_301);
        float _305 = -_303;
        float _307 = _301 + _305;
        _187 = _307;
    }
    float _309 = _187;
    float _311 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _313 = int(_311);
    float _315 = in.m_58.x;
    float _317 = in.m_58.y;
    float _319 = in.m_58.z;
    float _321 = in.m_58.w;
    float _323 = _287 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _325 = in.m_46.x;
    float _327 = in.m_46.y;
    float _329 = in.m_46.z;
    float _331 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _333 = int(_331);
    float _335 = in.m_62.x;
    float _337 = in.m_62.y;
    float _339 = in.m_62.z;
    float _341 = in.m_62.w;
    float _343 = in.m_64.x;
    float _345 = in.m_64.y;
    float _347 = in.m_64.z;
    float _349 = in.m_64.w;
    float _351 = float(_313);
    float _353 = in.m_66.y;
    float _355 = 1.0 / _351;
    float _357 = float(uint(_333));
    float _359 = _317 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _361 = ~_333;
    int _363 = _361 + 1;
    int _365 = ~_333;
    int _367 = _365 + 1;
    float _369 = 1.0 / _357;
    float _371 = _327 * _337;
    float _373 = _327 * _345;
    float _375 = _117 * _355;
    float _377 = fma(_325, _335, _371);
    float _379 = _315 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _381 = _327 + _353;
    float _383 = fma(_325, _343, _373);
    float _385 = fma(_329, _339, _377);
    float _387 = trunc(_375);
    int _389 = int(_387);
    float _391 = fma(_329, _347, _383);
    int _393 = as_type<int>(_369) + (-2);
    float _395 = _385 + _341;
    float _397 = _391 + _349;
    float _399 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _401 = -_399;
    float _403 = fma(_379, 2.0, _401);
    float _405 = float(uint(_389));
    float _407 = as_type<float>(_393) * _405;
    float _409 = trunc(_407);
    float _411 = precise::max(_409, 0.0);
    uint _414 = uint(_411);
    int _416 = _363 * int(_414);
    int _418 = _416 + _389;
    float _420 = float(uint(_418));
    int _422 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _424 = _422 != 0;
    int _426 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _428 = _426 != 0;
    int _430 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _432 = _430 != 0;
    int _434 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _436 = _434 != 0;
    float _438 = as_type<float>(_393) * _420;
    bool _440 = _321 > 0.5;
    float _442 = trunc(_438);
    float _444 = precise::max(_442, 0.0);
    uint _446 = uint(_444);
    bool _448 = !_424;
    int _450 = _448 ? 0 : 1;
    int _452 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _454 = _452 != 0;
    bool _456 = !_432;
    int _458 = _456 ? 0 : 1;
    bool _460 = !_454;
    float _462 = _460 ? 7.345489978790283203125 : 1.0;
    int _464 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _466 = _464 != 0;
    int _468 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _470 = _468 != 0;
    float _472 = _462 * _315;
    bool _474 = !_428;
    int _476 = _474 ? 0 : 1;
    bool _478 = !_470;
    int _480 = _478 ? 0 : 1;
    float _482 = floor(_472);
    int _484 = int(_414) + int(_446);
    float _486 = in.m_68.x;
    float _488 = in.m_68.y;
    float _490 = in.m_68.z;
    float _492 = in.m_68.w;
    int _494 = abs(_450);
    int _496 = _367 * _484;
    int _498 = _496 + _389;
    int _500 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _502 = _500 != 0;
    int _504 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _506 = _504 != 0;
    bool _508 = uint(_498) >= uint(_333);
    bool _510 = !_436;
    int _512 = _510 ? 0 : 1;
    bool _514 = _315 > 0.5;
    float _516 = -_482;
    float _518 = _472 + _516;
    bool _520 = !_508;
    int _522 = _520 ? 0 : (-1);
    float _524 = -_179;
    int _526 = _514 ? as_type<int>(_524) : as_type<int>(_179);
    int _528 = ~_484;
    int _530 = _528 + _522;
    int _532 = _530 + 1;
    int _534 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _536 = _534 != 0;
    int _538 = _333 * _532;
    int _540 = _538 + _389;
    float _542 = _327 * _488;
    float _544 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _546 = _544 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    int _548 = _333 + (-1);
    float _550 = fma(_325, _486, _542);
    float _552 = float(_333);
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _556 = _554 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _558 = float(_389);
    float _560 = fma(_329, _490, _550);
    bool _562 = !_466;
    float _564 = _562 ? _179 : as_type<float>(_526);
    float _566 = _117 * _552;
    bool _568 = _558 >= _552;
    bool _570 = isnan(_558);
    bool _572 = _568 || _570;
    bool _574 = isnan(_552);
    bool _576 = _572 || _574;
    float _578 = float(_576);
    float _580 = 1.0 / _556;
    bool _582 = _317 > 0.5;
    float _584 = _566 * _163;
    float _586 = _518 * _552;
    float _588 = -_183;
    int _590 = _582 ? as_type<int>(_588) : as_type<int>(_183);
    float _592 = trunc(_578);
    int _594 = int(_592);
    bool _596 = _333 == 0;
    float _598 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _600 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _598;
    int _602 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _604 = _602 != 0;
    bool _606 = !_596;
    int _608 = _606 ? _540 : (-1);
    float _610 = trunc(_586);
    int _612 = int(_610);
    float _614 = _600 * _580;
    float _616 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _618 = ~_594;
    int _620 = _618 + 1;
    int _622 = _620 + 1;
    float _624 = trunc(_584);
    int _626 = int(_624);
    float _628 = fma(_359, -2.0, _616);
    int _630 = _608 * _622;
    int _632 = _594 * _548;
    int _634 = _632 + _630;
    int _636 = abs(_476);
    float _638 = 1.0 / _546;
    int _640 = abs(_480);
    float _642 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _644 = _642 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    int _646 = abs(_458);
    int _648 = _634 * _636;
    int _650 = _612 * _640;
    int _652 = _650 + _389;
    float _654 = 1.0 / _644;
    float _656 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _658 = _656 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    int _660 = _626 * _494;
    int _662 = _660 + _648;
    int _664 = _652 * _646;
    int _666 = _664 + _662;
    int _668 = abs(_512);
    float _670 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _672 = _658 * _638;
    float _674 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _676 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _674;
    float _678 = fma(_315, (*spvDescriptorSet0.vp_c9)._m0[78].z, _670);
    float _680 = (*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _682 = as_type<float>(_668);
    if (!_454)
    {
        _680 = _317;
    }
    float _684 = _680;
    int _686 = _612 * _668;
    int _688 = _686 + _666;
    float _690 = _676 * _654;
    bool _692 = !_502;
    float _694 = _692 ? _183 : as_type<float>(_590);
    float _696 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _698 = _309 + _696;
    bool _700 = _319 > 0.5;
    float _702 = _654;
    float _704 = _684;
    if (!_454)
    {
        _682 = _319;
    }
    float _706 = _682;
    float _708 = _706;
    if (!_454)
    {
        _702 = _319;
    }
    float _710 = _702;
    float _712 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _714 = _309 + _712;
    float _716 = float(uint(_688));
    bool _718 = _309 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _720 = isnan(_309);
    bool _722 = _718 || _720;
    bool _724 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _726 = _722 || _724;
    float _728 = float(_726);
    float _730 = fma(_672, _714, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _732 = _710;
    if (_454)
    {
        _704 = _315;
    }
    float _734 = _704;
    float _736 = as_type<float>(_393) * _716;
    float _738 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _740 = fma(_614, _698, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _742 = _309 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _744 = isnan(_309);
    bool _746 = _742 || _744;
    bool _748 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _750 = _746 || _748;
    float _752 = float(_750);
    float _754 = -_728;
    float _756 = _754 + 1.0;
    float _758 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _760 = _309 + _758;
    float _762 = trunc(_736);
    float _764 = precise::max(_762, 0.0);
    uint _766 = uint(_764);
    bool _768 = _309 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _770 = isnan(_309);
    bool _772 = _768 || _770;
    bool _774 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _776 = _772 || _774;
    float _778 = float(_776);
    float _780 = _752 * _756;
    float _782 = -_752;
    float _784 = _782 + 1.0;
    float _786 = fma(_690, _760, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    int _788 = ~_333;
    int _790 = _788 + 1;
    float _792 = fma(_317, (*spvDescriptorSet0.vp_c9)._m0[78].w, _738);
    if (_454)
    {
        _708 = _317;
    }
    float _794 = _708;
    float _796 = _778 * _784;
    float _798 = -_778;
    float _800 = _798 + 1.0;
    if (_454)
    {
        _732 = _317;
    }
    float _802 = _732;
    float _804 = _794 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _806 = _309 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _808 = isnan(_309);
    bool _810 = _806 || _808;
    bool _812 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _814 = _810 || _812;
    float _816 = float(_814);
    int _818 = _790 * int(_766);
    int _820 = _818 + _688;
    float _822 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _824 = _816 * _800;
    float _826 = float(uint(_820));
    float _828 = fma(_802, (*spvDescriptorSet0.vp_c9)._m0[83].w, _822);
    float _830 = _560 + _492;
    float _832 = _740 * _824;
    float _834 = as_type<float>(_393) * _826;
    float _836 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _838 = -_117;
    float _840 = fma(_838, (*spvDescriptorSet0.vp_c9)._m0[76].x, _403);
    float _842 = _564 + 0.5;
    float _844 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _846 = fma(_734, (*spvDescriptorSet0.vp_c9)._m0[83].z, _836);
    float _848 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _850 = _734 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _852 = fma(_842, (*spvDescriptorSet0.vp_c9)._m0[80].x, _840);
    float _854 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[76].y, _628);
    float _856 = _694 + (-0.5);
    float _858 = -_816;
    float _860 = _858 + 1.0;
    float _862 = trunc(_834);
    float _864 = precise::max(_862, 0.0);
    uint _866 = uint(_864);
    float _868 = -_848;
    float _870 = fma(_850, 2.0, _868);
    float _872 = -_856;
    float _874 = -_854;
    float _876 = fma(_872, (*spvDescriptorSet0.vp_c9)._m0[80].y, _874);
    float _878 = fma(_860, (*spvDescriptorSet0.vp_c9)._m0[115].x, _832);
    float _880 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].z, _678);
    float _882 = -_117;
    float _884 = fma(_882, (*spvDescriptorSet0.vp_c9)._m0[81].x, _870);
    float _886 = -_179;
    int _888 = _700 ? as_type<int>(_886) : as_type<int>(_179);
    float _890 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _892 = fma(_730, _796, _878);
    float _894 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[82].w, _828);
    float _896 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _898 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _900 = _395 + _898;
    float _902 = _844 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _904 = -_183;
    int _906 = _440 ? as_type<int>(_904) : as_type<int>(_183);
    float _908 = fma(_804, -2.0, _890);
    bool _910 = !_604;
    float _912 = _910 ? _179 : as_type<float>(_888);
    float _914 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _916 = _830 + _914;
    int _918 = int(_766) + int(_866);
    float _920 = _900 * _900;
    int _922 = ~_333;
    int _924 = _922 + 1;
    float _926 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].w, _792);
    float _928 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[82].z, _846);
    bool _930 = !_536;
    float _932 = _930 ? _183 : as_type<float>(_906);
    float _934 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[81].y, _908);
    int _936 = _924 * _918;
    int _938 = _936 + _688;
    float _940 = float(uint(_652));
    float _942 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _944 = _397 + _942;
    float _946 = fma(_916, _916, _920);
    float _948 = _912 + 0.5;
    bool _950 = uint(_938) >= uint(_333);
    float _952 = as_type<float>(_393) * _940;
    float _954 = fma(_944, _944, _946);
    float _956 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _958 = _381 + _956;
    bool _960 = !_950;
    int _962 = _960 ? 0 : (-1);
    float _964 = fma(_902, _948, _884);
    float _966 = _896 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _968 = fma(_958, _958, _920);
    int _970 = ~_918;
    int _972 = _970 + _962;
    int _974 = _972 + 1;
    float _976 = trunc(_952);
    float _978 = precise::max(_976, 0.0);
    uint _980 = uint(_978);
    float _982 = _932 + (-0.5);
    int _984 = ~_333;
    int _986 = _984 + 1;
    float _988 = -_880;
    float _990 = _988 + 1.0;
    int _992 = _333 * _974;
    int _994 = _992 + _688;
    float _996 = fma(_944, _944, _968);
    float _998 = -_966;
    float _1000 = -_934;
    float _1002 = fma(_998, _982, _1000);
    float _1004 = _958 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1006 = sqrt(_954);
    bool _1008 = !_596;
    int _1010 = _1008 ? _994 : (-1);
    float _1012 = fma(_786, _780, _892);
    float _1014 = fma(_900, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1004);
    float _1016 = _323 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    int _1018 = _1010 >> 31;
    float _1020 = -_926;
    float _1022 = _1020 + 1.0;
    float _1024 = fma(_944, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1014);
    float _1026 = rsqrt(_996);
    int _1028 = _1018 & 3;
    int _1030 = _986 * int(_980);
    int _1032 = _1030 + _652;
    float _1034 = -_928;
    float _1036 = _1034 + 1.0;
    float _1038 = -_990;
    float _1040 = fma(_564, _1038, _852);
    int _1042 = _1010 + _1028;
    float _1044 = fma(_694, _1022, _876);
    float _1046 = float(uint(_1032));
    float _1048 = rsqrt(_954);
    float _1050 = _1006 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    int _1052 = _1042 >> 2;
    float _1054 = -_1036;
    float _1056 = fma(_912, _1054, _964);
    float _1058 = as_type<float>(_393) * _1046;
    float _1060 = -_894;
    float _1062 = _1060 + 1.0;
    float _1064 = precise::min(_1016, _1050);
    float _1066 = _958 * _1026;
    int _1068 = _1052 << 4;
    int _1070 = _1068 + 368;
    float _1072 = _900 * _1026;
    float _1074 = fma(_932, _1062, _1002);
    float _1076 = -_1066;
    float _1078 = fma(_1076, (*spvDescriptorSet0.vp_c9)._m0[18].w, _958);
    uint _1080 = uint(int(uint(_1070) >> uint(2)));
    uint _1082 = uint(int(uint(int(_1080)) >> uint(2)));
    int _1084 = int(_1080) & 3;
    float _1086 = (*spvDescriptorSet0.vp_c9)._m0[int(_1082)][_1084];
    int _1088 = int(_1080) + 1;
    uint _1090 = uint(int(uint(_1088) >> uint(2)));
    int _1092 = _1088 & 3;
    float _1094 = (*spvDescriptorSet0.vp_c9)._m0[int(_1090)][_1092];
    float _1096 = -_1072;
    float _1098 = fma(_1096, (*spvDescriptorSet0.vp_c9)._m0[18].w, _900);
    float _1100 = trunc(_1058);
    float _1102 = precise::max(_1100, 0.0);
    uint _1104 = uint(_1102);
    float _1106 = _1048 * _1064;
    float _1108 = _1078 * _1078;
    int _1110 = _1010 & 3;
    bool _1112 = _1110 != 0;
    out.m_70.x = _1040;
    out.m_70.y = _1044;
    out.m_70.z = _1056;
    out.m_70.w = _1074;
    float _1114 = _916 * _1106;
    float _1116 = _900 * _1106;
    float _1118 = fma(_1098, _1098, _1108);
    bool _1120 = _1024 >= 0.0;
    float _1122 = -_1114;
    float _1124 = _916 + _1122;
    float _1126 = -_1116;
    float _1128 = _900 + _1126;
    out.m_72.w = _1064;
    int _1130 = _1070 + 8;
    uint _1132 = uint(int(uint(_1130) >> uint(2)));
    uint _1134 = uint(int(uint(int(_1132)) >> uint(2)));
    int _1136 = int(_1132) & 3;
    float _1138 = (*spvDescriptorSet0.vp_c9)._m0[int(_1134)][_1136];
    int _1140 = int(_1132) + 1;
    uint _1142 = uint(int(uint(_1140) >> uint(2)));
    int _1144 = _1140 & 3;
    float _1146 = (*spvDescriptorSet0.vp_c9)._m0[int(_1142)][_1144];
    float _1148 = _1124 * _1124;
    int _1150 = _1010 & 3;
    bool _1152 = _1150 != 0;
    float _1154 = _944 * _1106;
    int _1156 = int(_980) + int(_1104);
    float _1158 = fma(_1128, _1128, _1148);
    bool _1160 = uint(_1150) > 1u;
    float _1162 = _944 * _1026;
    int _1164 = _1112 ? 0 : 1;
    if (_1120)
    {
        out.m_53.x = 0.0;
    }
    bool _1166 = _1150 != 3;
    float _1168 = -_1162;
    float _1170 = fma(_1168, (*spvDescriptorSet0.vp_c9)._m0[18].w, _944);
    int _1172 = ~_333;
    int _1174 = _1172 + 1;
    float _1176 = -_1154;
    float _1178 = _944 + _1176;
    bool _1180 = uint(_1150) >= 2u;
    float _1182 = fma(_1170, _1170, _1118);
    int _1184 = ~_1164;
    int _1186 = _1184 + 1;
    int _1188 = _1186 + 1;
    int _1190 = _1174 * _1156;
    int _1192 = _1190 + _652;
    int _1194 = _1180 ? 0 : 1;
    float _1196 = fma(_1178, _1178, _1158);
    int _1198 = _1188;
    if (!_1160)
    {
        int _1200 = ~_1164;
        int _1202 = _1200 + 1;
        _1198 = _1202;
    }
    int _1204 = _1198;
    float _1206 = sqrt(_1182);
    bool _1208 = uint(_1192) >= uint(_333);
    int _1210 = abs(_1204);
    int _1212 = ~_1194;
    int _1214 = _1212 + 1;
    int _1216 = _1214 + 1;
    int _1218 = _1216;
    if (_1166)
    {
        int _1220 = ~_1194;
        int _1222 = _1220 + 1;
        _1218 = _1222;
    }
    int _1224 = _1218;
    bool _1226 = !_1152;
    int _1228 = _1226 ? 0 : 1;
    bool _1230 = !_1208;
    int _1232 = _1230 ? 0 : (-1);
    bool _1234 = _1150 != 3;
    float _1236 = _1026 * _1206;
    int _1238 = abs(_1228);
    int _1240 = ~_1156;
    int _1242 = _1240 + _1232;
    int _1244 = _1242 + 1;
    int _1246 = ~_1210;
    int _1248 = _1246 + 1;
    int _1250 = _1248 + 1;
    bool _1252 = !_1234;
    int _1254 = _1252 ? 0 : (-1);
    int _1256 = _333 * _1244;
    int _1258 = _1256 + _652;
    int _1260 = _1250 * as_type<int>(_1094);
    int _1262 = abs(_1254);
    float _1264 = sqrt(_1196);
    int _1266 = abs(_1224);
    int _1268 = ~_1238;
    int _1270 = _1268 + 1;
    int _1272 = _1270 + 1;
    bool _1274 = !_506;
    int _1276 = _1274 ? 0 : 1;
    int _1278 = _1272 * as_type<int>(_1086);
    int _1280 = _1278 + _1260;
    int _1282 = ~_1266;
    int _1284 = _1282 + 1;
    int _1286 = _1284 + 1;
    int _1288 = abs(_1276);
    int _1290 = ~_1262;
    int _1292 = _1290 + 1;
    int _1294 = _1292 + 1;
    int _1296 = _1286 * as_type<int>(_1138);
    int _1298 = _1296 + _1280;
    int _1300 = ~_1288;
    int _1302 = _1300 + 1;
    int _1304 = _1302 + 1;
    float _1306 = _1048 * _1264;
    float _1308 = as_type<float>(_1262);
    if (_1120)
    {
        _1308 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1310 = _1308;
    int _1312 = _1294 * as_type<int>(_1146);
    int _1314 = _1312 + _1298;
    bool _1316 = !_596;
    int _1318 = _1316 ? _1258 : (-1);
    float _1320 = fma(_728, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1012);
    int _1322 = _1314 * _1304;
    int _1324 = as_type<int>(_1310);
    if (_1120)
    {
        float _1326 = _1310 * 5.0;
        _1324 = as_type<int>(_1326);
    }
    int _1328 = _1324;
    float _1330 = _1306 * _1236;
    int _1332 = _1318 * _1288;
    int _1334 = _1332 + _1322;
    if (_1120)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4555 = as_type<float>(_1328);
        out.gl_Position.z = _4555;
    }
    float _1336 = _1320 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1338 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1340 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1342 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1344 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1346 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1348 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1350 = _1338 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1352 = _1340 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1354 = _1344 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1356 = _1346 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1358 = _1342 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1360 = float(_1334);
    float _1362 = _1348 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1364 = _323 * _1330;
    out.m_74.x = _1350;
    out.m_74.y = _1352;
    out.m_74.z = _1358;
    out.m_74.w = _1336;
    out.m_76.x = _1360;
    out.m_78.x = _1354;
    out.m_78.y = _1356;
    out.m_78.z = _1362;
    out.m_80.x = _1364;
    if (_1120)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1366 = -_1066;
    float _1368 = fma(_1366, (*spvDescriptorSet0.vp_c9)._m0[18].w, _381);
    float _1370 = -_1072;
    float _1372 = fma(_1370, (*spvDescriptorSet0.vp_c9)._m0[18].w, _395);
    float _1374 = -_1162;
    float _1376 = fma(_1374, (*spvDescriptorSet0.vp_c9)._m0[18].w, _397);
    float _1378 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1380 = _1368 + _1378;
    float _1382 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1384 = _1372 + _1382;
    float _1386 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1388 = _1376 + _1386;
    float _1390 = _1380 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1392 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1390);
    float _1394 = fma(_1388, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1392);
    bool _1396 = _1394 >= 0.0;
    float _1398 = _1388;
    if (_1396)
    {
        _1398 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1400 = _1398;
    int _1402 = as_type<int>(_1400);
    if (_1396)
    {
        out.m_53.x = 0.0;
    }
    if (_1396)
    {
        float _1404 = _1400 * 5.0;
        _1402 = as_type<int>(_1404);
    }
    int _1406 = _1402;
    if (_1396)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4726 = as_type<float>(_1406);
        out.gl_Position.z = _4726;
    }
    if (_1396)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1408 = -_381;
    float _1410 = _1408 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1412 = -_395;
    float _1414 = _1412 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1416 = -_397;
    float _1418 = _1416 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1420 = _1410 * _1410;
    float _1422 = _289 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1424 = fma(_1414, _1414, _1420);
    float _1426 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _1428 = _1422 * _1330;
    float _1430 = fma(_1418, _1418, _1424);
    float _1432 = -_1426;
    float _1434 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1432);
    float _1436 = rsqrt(_1430);
    float _1438 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1440 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1442 = -_1438;
    float _1444 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _1442);
    float _1446 = -_1440;
    float _1448 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1446);
    float _1450 = _1414 * _1436;
    float _1452 = _1418 * _1436;
    float _1454 = _1448 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1456 = _1444 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1458 = _1450 * _1450;
    float _1460 = _1448 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1462 = -_1454;
    float _1464 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1462);
    float _1466 = _1410 * _1436;
    float _1468 = fma(_1452, _1452, _1458);
    float _1470 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1472 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1474 = -_1460;
    float _1476 = fma(_1444, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1474);
    float _1478 = rsqrt(_1468);
    float _1480 = -_1470;
    float _1482 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1480);
    float _1484 = -_1472;
    float _1486 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1484);
    float _1488 = fma(_1486, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1464);
    float _1490 = _1486 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1492 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1494 = -_1456;
    float _1496 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[1].y, _1494);
    float _1498 = _1488 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1500 = -_1492;
    float _1502 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _1500);
    float _1504 = fma(_1482, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1496);
    float _1506 = _1452 * _1478;
    float _1508 = _1450 * _1478;
    float _1510 = -_1498;
    float _1512 = fma(_1504, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1510);
    float _1514 = fma(_1502, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1476);
    float _1516 = -_1506;
    float _1518 = _1452 * _1516;
    float _1520 = -_1506;
    float _1522 = _1466 * _1520;
    float _1524 = fma(_1514, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1512);
    float _1526 = -_1518;
    float _1528 = fma(_1450, _1508, _1526);
    float _1530 = _1466 * _1508;
    float _1532 = -_1490;
    float _1534 = fma(_1482, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1532);
    float _1536 = _1528 * _1528;
    float _1538 = fma(_1502, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1534);
    float _1540 = _1448 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _1542 = fma(_1530, _1530, _1536);
    float _1544 = -_1538;
    float _1546 = fma(_1544, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1524);
    float _1548 = -_1540;
    float _1550 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1548);
    float _1552 = fma(_1522, _1522, _1542);
    float _1554 = _1444 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _1556 = fma(_1486, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1550);
    float _1558 = rsqrt(_1552);
    float _1560 = _1448 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1562 = -_1554;
    float _1564 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[0].y, _1562);
    float _1566 = -_1560;
    float _1568 = fma(_1444, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1566);
    float _1570 = fma(_1482, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1564);
    float _1572 = 1.0 / _1546;
    float _1574 = fma(_1502, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1568);
    float _1576 = _1528 * _1558;
    float _1578 = precise::clamp(_1576, 0.0, 1.0);
    float _1580 = -_1578;
    float _1582 = _1580 + 1.0;
    float _1584 = fma(_1556, _1572, -1.0);
    float _1586 = _1582 * _1572;
    float _1588 = fma(_1582, _1584, 1.0);
    float _1590 = _1570 * _1586;
    float _1592 = _1574 * _1586;
    float _1594 = _1588 * _1588;
    float _1596 = fma(_1590, _1590, _1594);
    float _1598 = fma(_1592, _1592, _1596);
    float _1600 = rsqrt(_1598);
    float _1602 = _1592 * _1600;
    float _1604 = _1588 * _1600;
    float _1606 = _1590 * _1600;
    float _1608 = -_1602;
    float _1610 = _1450 * _1608;
    float _1612 = _1452 * _1604;
    float _1614 = -_1606;
    float _1616 = -_1610;
    float _1618 = fma(_1452, _1614, _1616);
    float _1620 = -_1602;
    float _1622 = -_1612;
    float _1624 = fma(_1466, _1620, _1622);
    float _1626 = -_1606;
    float _1628 = _1466 * _1626;
    float _1630 = _1618 * _1618;
    float _1632 = -_1628;
    float _1634 = fma(_1450, _1604, _1632);
    float _1636 = fma(_1624, _1624, _1630);
    float _1638 = fma(_1634, _1634, _1636);
    float _1640 = rsqrt(_1638);
    float _1642 = _1624 * _1640;
    float _1644 = _1634 * _1640;
    float _1646 = _1618 * _1640;
    float _1648 = _1452 * _1642;
    float _1650 = _1466 * _1644;
    float _1652 = _1450 * _1646;
    float _1654 = -_1648;
    float _1656 = fma(_1450, _1644, _1654);
    float _1658 = -_1650;
    float _1660 = fma(_1452, _1646, _1658);
    float _1662 = -_1652;
    float _1664 = fma(_1466, _1642, _1662);
    float _1666 = _1656 * _1656;
    float _1668 = fma(_1660, _1660, _1666);
    float _1670 = fma(_1664, _1664, _1668);
    float _1672 = rsqrt(_1670);
    float _1674 = _1664 * _1672;
    float _1676 = _1660 * _1672;
    float _1678 = _1656 * _1672;
    float _1680 = _1450 * _1674;
    float _1682 = _1452 * _1678;
    float _1684 = -_1680;
    float _1686 = fma(_1452, _1676, _1684);
    float _1688 = _1466 * _1676;
    float _1690 = -_1682;
    float _1692 = fma(_1466, _1674, _1690);
    float _1694 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _183);
    float _1696 = _1686 * _1686;
    float _1698 = -_1688;
    float _1700 = fma(_1450, _1678, _1698);
    float _1702 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _179);
    float _1704 = _1428 * _1694;
    float _1706 = fma(_1692, _1692, _1696);
    float _1708 = _1364 * _1702;
    float _1710 = _1704 * _1674;
    float _1712 = fma(_1700, _1700, _1706);
    float _1714 = _1704 * _1676;
    float _1716 = _1704 * _1678;
    float _1718 = rsqrt(_1712);
    float _1720 = _1700 * _1718;
    float _1722 = _1692 * _1718;
    float _1724 = _1686 * _1718;
    float _1726 = fma(_1708, _1720, _1710);
    float _1728 = fma(_1708, _1722, _1714);
    float _1730 = fma(_1708, _1724, _1716);
    float _1732 = _397 + _1726;
    float _1734 = _395 + _1728;
    float _1736 = _381 + _1730;
    float _1738 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1740 = _1732 + _1738;
    float _1742 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1744 = _1734 + _1742;
    float _1746 = _1740 * _1740;
    float _1748 = fma(_1744, _1744, _1746);
    float _1750 = sqrt(_1748);
    bool _1752 = _1750 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1754 = _1730;
    float _1756 = _1708;
    float _1758 = _1734;
    float _1760 = _1666;
    float _1762 = _1522;
    if (!_1752)
    {
        _1754 = _1732;
    }
    float _1764 = _1754;
    float _1766 = _1764;
    if (!_1752)
    {
        _1756 = _1736;
    }
    float _1768 = _1756;
    bool _1770 = !_1752;
    float _1772 = _1768;
    if (!_1770)
    {
        float _1774 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1776 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1778 = _1750 + _1776;
        float _1780 = _1736 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1782 = rsqrt(_1748);
        float _1784 = _1778 * _1774;
        float _1786 = _1784 * 0.15915493667125701904296875;
        float _1788 = _1786 * 6.283185482025146484375;
        float _1790 = cos(_1788);
        float _1792 = _1786 * 6.283185482025146484375;
        float _1794 = sin(_1792);
        float _1796 = _1790 + (-1.0);
        float _1798 = fma(_1794, _1780, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1800 = _1796 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1802 = _1782 * _1798;
        float _1804 = fma(_1736, _1790, _1800);
        float _1806 = fma(_1744, _1802, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1808 = fma(_1740, _1802, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1758 = _1806;
        _1766 = _1808;
        _1772 = _1804;
    }
    float _1810 = _1758;
    float _1812 = _1766;
    float _1814 = _1772;
    float _1816 = -_1116;
    float _1818 = _1816 + _1810;
    float _1820 = -_1154;
    float _1822 = _1820 + _1812;
    float _1824 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _1826 = _1818 + _1824;
    float _1828 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _1830 = _1822 + _1828;
    float _1832 = fma(_1826, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _1834 = fma(_1830, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _5435 = float2(_1832, _1834);
    float _1836 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_5435, float2(0.0), isnan(_5435)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_5435, float2(0.0), isnan(_5435)), level(0.0)).x;
    float _1838 = -_1114;
    float _1840 = _1838 + _1814;
    float _1842 = -_1162;
    float _1844 = fma(_1842, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1822);
    float _1846 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1848 = _1844 + _1846;
    float _1850 = fma(_1836, 100.0, _1840);
    float _1852 = -_1066;
    float _1854 = fma(_1852, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1850);
    float _1856 = -_1072;
    float _1858 = fma(_1856, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1818);
    float _1860 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1862 = _1854 + _1860;
    float _1864 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1866 = _1858 + _1864;
    float _1868 = _1862 * _1862;
    float _1870 = fma(_1866, _1866, _1868);
    float _1872 = fma(_1848, _1848, _1870);
    float _1874 = rsqrt(_1872);
    float _1876 = sqrt(_1872);
    float _1878 = _1874 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1880 = _1866 * _1878;
    float _1882 = _1848 * _1878;
    float _1884 = _1880 * _1880;
    float _1886 = _1882 * _1882;
    float _1888 = _1884 + _1886;
    float _1890 = sqrt(_1888);
    bool _1892 = _1890 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1894 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1896 = _1890 + _1894;
    float _1898 = _1870;
    float _1900 = _1896;
    float _1902 = _1862;
    float _1904 = _1882;
    float _1906 = _1886;
    if (_1892)
    {
        float _1908 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1898 = _1908;
    }
    float _1910 = _1898;
    float _1912 = _1910;
    if (_1892)
    {
        float _1914 = _1896 * _1910;
        _1900 = _1914;
    }
    float _1916 = _1900;
    if (_1892)
    {
        float _1918 = rsqrt(_1888);
        _1912 = _1918;
    }
    float _1920 = _1912;
    float _1922 = _1920;
    if (_1892)
    {
        float _1924 = _1916 * 0.15915493667125701904296875;
        _1760 = _1924;
    }
    float _1926 = _1760;
    float _1928 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1930 = _1848;
    if (_1892)
    {
        float _1932 = _1926 * 6.283185482025146484375;
        float _1934 = sin(_1932);
        _1930 = _1934;
    }
    float _1936 = _1930;
    float _1938 = precise::max(0.0, _1928);
    float _1940 = _1740;
    float _1942 = _1938;
    if (_1892)
    {
        float _1944 = _1926 * 6.283185482025146484375;
        float _1946 = cos(_1944);
        _1940 = _1946;
    }
    float _1948 = _1940;
    float _1950 = -_1878;
    float _1952 = -_1938;
    float _1954 = fma(_1862, _1950, _1952);
    if (_1892)
    {
        float _1956 = _1954 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1902 = _1956;
    }
    float _1958 = _1902;
    float _1960 = _1936;
    float _1962 = _1958;
    if (_1892)
    {
        float _1964 = fma(_1936, _1958, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1942 = _1964;
    }
    float _1966 = _1942;
    float _1968 = _1966;
    if (!_1892)
    {
        _1960 = _1880;
    }
    float _1970 = _1960;
    float _1972 = _1970;
    if (_1892)
    {
        float _1974 = _1920 * _1966;
        _1762 = _1974;
    }
    float _1976 = _1762;
    if (!_1892)
    {
        _1968 = _1954;
    }
    float _1978 = _1968;
    float _1980 = _1978;
    if (_1892)
    {
        float _1982 = _1948 + (-1.0);
        _1962 = _1982;
    }
    float _1984 = _1962;
    float _1986 = _1984;
    if (_1892)
    {
        float _1988 = _1880 * _1976;
        _1972 = _1988;
    }
    float _1990 = _1972;
    if (_1892)
    {
        float _1992 = _1882 * _1976;
        _1904 = _1992;
    }
    float _1994 = _1904;
    if (_1892)
    {
        float _1996 = _1984 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1922 = _1996;
    }
    float _1998 = _1922;
    if (!_1892)
    {
        _1986 = _1884;
    }
    float _2000 = _1986;
    float _2002 = _2000;
    if (_1892)
    {
        float _2004 = _1990 * _1990;
        _2002 = _2004;
    }
    float _2006 = _2002;
    if (_1892)
    {
        float _2008 = _1994 * _1994;
        _1906 = _2008;
    }
    float _2010 = _1906;
    if (_1892)
    {
        float _2012 = fma(_1954, _1948, _1998);
        _1980 = _2012;
    }
    float _2014 = _1980;
    float _2016 = _1854 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2018 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2020 = fma(_1876, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2018);
    float _2022 = precise::clamp(_2020, 0.0, 1.0);
    float _2024 = fma(_2014, _2014, _2006);
    float _2026 = _1854 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2028 = -_2022;
    float _2030 = _2028 + 1.0;
    float _2032 = _2024 + _2010;
    float _2034 = fma(_1858, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2016);
    float _2036 = _1854 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2038 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2040 = abs(_2030);
    float _2042 = log2(_2040);
    float _2044 = fma(_1844, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2034);
    float _2046 = fma(_1858, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2036);
    float _2048 = _1854 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2050 = fma(_1858, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2026);
    float _2052 = _2044 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2054 = fma(_1844, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2046);
    float _2056 = fma(_1858, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2048);
    float _2058 = rsqrt(_2032);
    float _2060 = _2052 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2062 = _2054 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2064 = fma(_1844, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2056);
    float _2066 = fma(_1844, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2050);
    float _2068 = -_2060;
    float _2070 = fma(_2068, _2038, 1.0);
    float _2072 = _2062 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2074 = _2064 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2076 = _2066 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2078 = log2(_2070);
    float _2080 = _2058 * _1990;
    float _2082 = _2058 * _2014;
    float _2084 = fma(_2074, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2072);
    float _2086 = _2058 * _1994;
    float _2088 = _2080 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2090 = _2042 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2092 = fma(_2052, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2084);
    float _2094 = -_2088;
    float _2096 = fma(_2082, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2094);
    float _2098 = _2062 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2100 = fma(_2076, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2092);
    float _2102 = exp2(_2090);
    float _2104 = -_2086;
    float _2106 = fma(_2104, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2096);
    float _2108 = _2062 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2110 = fma(_2074, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2098);
    float _2112 = fma(_2106, -0.5, 0.5);
    float _2114 = fma(_2106, 0.5, 0.5);
    float _2116 = fma(_2074, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2108);
    float _2118 = 1.0 / _2100;
    float _2120 = _2082 + 1.0;
    float _2122 = fma(_2114, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2124 = fma(_2052, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2116);
    float _2126 = fma(_2052, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2110);
    float _2128 = fma(_2114, _2122, -0.212114393711090087890625);
    float _2130 = sqrt(_2112);
    float _2132 = -_2082;
    float _2134 = fma(_2102, _2120, _2132);
    float _2136 = fma(_2076, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2124);
    float _2138 = fma(_2076, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2126);
    float _2140 = _2078 * 0.693147182464599609375;
    float _2142 = fma(_2114, _2128, 1.570728778839111328125);
    float _2144 = _2136 * _2118;
    float _2146 = _2138 * _2118;
    float _2148 = _2140 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2150 = fma(_2134, 0.5, 0.5);
    float _2152 = fma(_2144, 0.5, 0.5);
    float _2154 = fma(_2146, -0.5, 0.5);
    float _2156 = _2130 * 0.636619746685028076171875;
    float _2158 = -_2142;
    float _2160 = fma(_2156, _2158, 1.0);
    float3 _5985 = float3(_2152, _2154, _2148);
    float _2162 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5985, float3(0.0), isnan(_5985)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5985, float3(0.0), isnan(_5985)), level(0.0)).x;
    float3 _5996 = float3(_2152, _2154, _2148);
    float4 _2165 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5996, float3(0.0), isnan(_5996)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5996, float3(0.0), isnan(_5996)), level(0.0)).xyzw;
    float _2167 = _2165.x;
    float _2169 = _2165.y;
    float _2171 = _2165.z;
    float _2173 = _2165.w;
    float2 _6012 = float2(_2160, _2150);
    float3 _2177 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6012, float2(0.0), isnan(_6012)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6012, float2(0.0), isnan(_6012)), level(0.0)).xyz;
    float _2179 = _2177.x;
    float _2181 = _2177.y;
    float _2183 = _2177.z;
    float _2185 = _916 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _2187 = -_1116;
    float _2189 = _395 + _2187;
    float _2191 = -_1114;
    float _2193 = _2191 + _381;
    float _2195 = _183 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2197 = abs(_2185);
    float _2199 = 1.0 / _2197;
    float _2201 = _179 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2203 = fma(_1836, 100.0, _2193);
    float _2205 = _2195 * _1676;
    out.m_78.x = _1354;
    out.m_78.y = _1356;
    out.m_78.z = _1362;
    float _2207 = -_1154;
    float _2209 = _397 + _2207;
    float _2211 = -_1066;
    float _2213 = fma(_2211, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2203);
    float _2215 = _2042 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2217 = _2062 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2219 = -_1162;
    float _2221 = fma(_2219, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2209);
    float _2223 = _2195 * _1678;
    float _2225 = fma(_2074, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2217);
    float _2227 = exp2(_2215);
    float _2229 = 0.0 + _2199;
    float _2231 = precise::clamp(_2229, 0.0, 1.0);
    float _2233 = fma(_2201, _1722, _2205);
    float _2235 = _2213 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2237 = fma(_2052, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2225);
    float _2239 = _1336 * _2231;
    float _2241 = _2195 * _1674;
    float _2243 = fma(_2201, _1724, _2223);
    float _2245 = _1450 + _2233;
    float _2247 = fma(_2201, _1720, _2241);
    float _2249 = -_1072;
    float _2251 = fma(_2249, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2189);
    out.m_74.x = _1350;
    out.m_74.y = _1352;
    out.m_74.z = _1358;
    out.m_74.w = _2239;
    float _2253 = fma(_2076, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2237);
    float _2255 = _2100 * 0.5;
    float _2257 = fma(_2251, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2235);
    float _2259 = -_2227;
    float _2261 = _2259 + 1.0;
    out.m_82.x = _2251;
    out.m_82.y = _2213;
    out.m_82.z = _2221;
    float _2263 = _1466 + _2243;
    float _2265 = fma(_2221, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2257);
    float _2267 = _1452 + _2247;
    float _2269 = _2265 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2271 = _2213 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2273 = 1.0 / _2269;
    float _2275 = fma(_2251, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2271);
    bool _2277 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2279 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2281 = _2277 || _2279;
    bool _2283 = isnan(0.5);
    bool _2285 = _2281 || _2283;
    float _2287 = fma(_2221, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2275);
    float _2289 = _2261 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2291 = _2287 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2293 = _2291 + _2269;
    float _2295 = _2136 + _2100;
    float _2297 = _2265;
    if (_2285)
    {
        _2297 = 1.0;
    }
    float _2299 = _2297;
    float _2301 = _2293 * _2273;
    float _2303 = _2301 * 0.5;
    float _2305 = _2253 + _2100;
    float _2307 = _2295 * 0.5;
    float _2309 = fma(_2138, -0.5, _2255);
    float _2311 = _2305 * 0.5;
    float _2313 = _2299;
    float _2315 = _2311;
    float _2317 = _2309;
    float _2319 = _2307;
    if (!_2285)
    {
        float _2321 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2323 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2325 = fma(_2303, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2323);
        float _2327 = _2321 * 0.15915493667125701904296875;
        float _2329 = _2327 * 6.283185482025146484375;
        float _2331 = cos(_2329);
        float _2333 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2335 = _2333 * 0.15915493667125701904296875;
        float _2337 = _2327 * 6.283185482025146484375;
        float _2339 = sin(_2337);
        float _2341 = 1.0 / _2331;
        float _2343 = _2335 * 6.283185482025146484375;
        float _2345 = cos(_2343);
        float _2347 = _2339 * _2341;
        float _2349 = 1.0 / _2325;
        float _2351 = _2345 * _2347;
        float _2353 = _2335 * 6.283185482025146484375;
        float _2355 = sin(_2353);
        float _2357 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2359 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2357;
        float _2361 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2363 = _2349 * _2361;
        float _2365 = 1.0 / _2351;
        float _2367 = 1.0 / _2359;
        float _2369 = _2355 * _2365;
        float _2371 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2373 = fma(_2369, _2363, _2371);
        float _2375 = _2373 * _2367;
        float _2377 = precise::clamp(_2375, 0.0, 1.0);
        _2313 = _2377;
    }
    float _2379 = _2313;
    float _2381 = _2289 * _2162;
    float _2383 = -_2289;
    float _2385 = _2383 + 1.0;
    out.m_84.x = _2245;
    out.m_84.y = _2263;
    out.m_84.z = _2267;
    bool _2387 = _1876 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2389 = isnan(_1876);
    bool _2391 = _2387 || _2389;
    bool _2393 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2395 = _2391 || _2393;
    float _2397 = _2173 * _2381;
    float _2399 = _2183 * _2381;
    float _2401 = _2173 * _2385;
    out.m_86.x = _1858;
    out.m_86.y = _1854;
    out.m_86.z = _1844;
    float _2403 = fma(_2179, _2397, _2167);
    float _2405 = fma(_2181, _2397, _2169);
    float _2407 = fma(_2173, _2399, _2171);
    out.gl_Position.x = _2136;
    out.gl_Position.y = _2138;
    out.gl_Position.z = _2253;
    out.gl_Position.w = _2100;
    out.m_88.x = _2403;
    out.m_88.y = _2405;
    out.m_88.z = _2407;
    out.m_88.w = _2401;
    out.m_90.x = _2307;
    out.m_90.y = _2309;
    out.m_90.z = _2311;
    out.m_90.w = _2100;
    float _2409 = _2379 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    if (!_2395)
    {
        _2315 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2411 = _2315;
    float _2413 = _2411;
    float _2415 = _2411;
    if (!_2395)
    {
        _2317 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2417 = _2317;
    float _2419 = _2417;
    float _2421 = _2417;
    if (!_2395)
    {
        _2319 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2423 = _2319;
    bool _2425 = !_2395;
    float _2427 = _2423;
    float _2429 = _2423;
    if (!_2425)
    {
        bool _2431 = _1876 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2433 = isnan(_1876);
        bool _2435 = _2431 || _2433;
        bool _2437 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2439 = _2435 || _2437;
        if (!_2439)
        {
            float _2441 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2443 = _1876 + _2441;
            float _2445 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2447 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2445;
            float _2449 = 1.0 / _2447;
            float _2451 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2453 = _2451 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2455 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2457 = _2455 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2459 = _2443 * _2449;
            float _2461 = precise::clamp(_2459, 0.0, 1.0);
            float _2463 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2465 = _2463 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2467 = fma(_2461, _2457, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2469 = fma(_2461, _2465, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2471 = fma(_2461, _2453, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            _2421 = _2471;
            _2415 = _2469;
            _2429 = _2467;
            _2473 = true;
        }
        else
        {
            bool _2475 = _1876 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2477 = isnan(_1876);
            bool _2479 = _2475 || _2477;
            bool _2481 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2483 = _2479 || _2481;
            if (!_2483)
            {
                _2413 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2485 = _2413;
            _2415 = _2485;
            if (!_2483)
            {
                _2419 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2487 = _2419;
            _2421 = _2487;
            if (!_2483)
            {
                _2427 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2489 = _2427;
            bool _2491 = !_2483;
            _2429 = _2489;
            if (!_2491)
            {
                bool _2493 = _1876 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2495 = isnan(_1876);
                bool _2497 = _2493 || _2495;
                bool _2499 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2501 = _2497 || _2499;
                if (!_2501)
                {
                    float _2503 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2505 = _1876 + _2503;
                    float _2507 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2509 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2507;
                    float _2511 = 1.0 / _2509;
                    float _2513 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2515 = _2513 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2517 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2519 = _2517 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2521 = _2505 * _2511;
                    float _2523 = precise::clamp(_2521, 0.0, 1.0);
                    float _2525 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2527 = _2525 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2529 = fma(_2523, _2519, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2531 = fma(_2523, _2527, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2533 = fma(_2523, _2515, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    _2421 = _2533;
                    _2415 = _2531;
                    _2429 = _2529;
                    _2473 = true;
                }
                else
                {
                    _2421 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2415 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2429 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _2473 = false;
    float _2535 = _2421;
    float _2537 = _2415;
    float _2539 = _2429;
    float _2541 = _2409 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_92.x = 0.0;
    float _2543 = _2535 * 0.586610972881317138671875;
    bool _2545 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_53.x = _2541;
    float _2547 = fma(_2537, 0.298911988735198974609375, _2543);
    bool _2549 = _2379 > 0.0;
    bool _2551 = isnan(_2379);
    bool _2553 = _2549 || _2551;
    bool _2555 = isnan(0.0);
    bool _2557 = _2553 || _2555;
    float _2559 = fma(_2539, 0.114477999508380889892578125, _2547);
    float _2561 = -_2559;
    float _2563 = _2561 + _2537;
    float _2565 = -_2559;
    float _2567 = _2565 + _2535;
    float _2569 = -_2559;
    float _2571 = _2569 + _2539;
    float _2573 = fma(_2563, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2559);
    float _2575 = fma(_2567, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2559);
    float _2577 = fma(_2571, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2559);
    bool _2579 = !_2545;
    if (!_2579)
    {
        float _2581 = -_1854;
        float _2583 = _2581 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2585 = -_1858;
        float _2587 = _2585 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2589 = -_1844;
        float _2591 = _2589 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2593 = _2583 * _2583;
        float _2595 = fma(_2587, _2587, _2593);
        float _2597 = fma(_2591, _2591, _2595);
        float _2599 = sqrt(_2597);
        float _2601 = rsqrt(_2597);
        float _2603 = -_2599;
        float _2605 = _2603 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2607 = _2605 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2609 = precise::clamp(_2607, 0.0, 1.0);
        float _2611 = _2587 * _2601;
        float _2613 = _2583 * _2601;
        float _2615 = abs(_2609);
        float _2617 = log2(_2615);
        float _2619 = _2591 * _2601;
        float _2621 = _2611 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2623 = _2263 * _2613;
        float _2625 = -_2613;
        float _2627 = -_2621;
        float _2629 = fma(_2625, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2627);
        float _2631 = fma(_2245, _2611, _2623);
        float _2633 = -_2619;
        float _2635 = fma(_2633, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2629);
        float _2637 = fma(_2267, _2619, _2631);
        float _2639 = precise::clamp(_2637, 0.0, 1.0);
        float _2641 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2643 = _2635 + _2641;
        float _2645 = _2617 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2647 = _2643 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2649 = precise::clamp(_2647, 0.0, 1.0);
        float _2651 = exp2(_2645);
        float _2653 = _2651 * _2649;
        float _2655 = _2639 * _2653;
        float _2657 = _2655 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2659 = _2655 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2661 = _2655 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_92.x = _2657;
        out.m_92.y = _2659;
        out.m_92.z = _2661;
    }
    out.m_72.x = _2573;
    out.m_72.y = _2575;
    out.m_72.z = _2577;
    if (_2557)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_53.x = 0.0;
    float _2663 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2663;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

