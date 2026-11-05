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
    texture2d<float> vp_t_tcb_24 [[id(7)]];
    sampler vp_t_tcb_24Smplr [[id(8)]];
    texture3d<float> vp_t_tcb_32 [[id(9)]];
    sampler vp_t_tcb_32Smplr [[id(10)]];
    texture3d<float> vp_t_tcb_30 [[id(11)]];
    sampler vp_t_tcb_30Smplr [[id(12)]];
    texture2d<float> vp_t_tcb_1C [[id(13)]];
    sampler vp_t_tcb_1CSmplr [[id(14)]];
    sampler vp_t_tcb_24Smplr_w [[id(15)]];
    sampler vp_t_tcb_32Smplr_w [[id(16)]];
    sampler vp_t_tcb_30Smplr_w [[id(17)]];
    sampler vp_t_tcb_1CSmplr_w [[id(18)]];
    constant dm_border_t* dm_border [[id(19)]];
};

struct main0_out
{
    float4 m_68 [[user(locn0)]];
    float4 m_55 [[user(locn2)]];
    float4 m_84 [[user(locn3)]];
    float4 m_53 [[user(locn4)]];
    float4 m_64 [[user(locn5)]];
    float4 m_76 [[user(locn6)]];
    float4 m_70 [[user(locn7)]];
    float4 m_72 [[user(locn8)]];
    float4 m_82 [[user(locn9)]];
    float4 m_78 [[user(locn10)]];
    float4 m_80 [[user(locn11)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_74 [[attribute(0)]];
    float4 m_66 [[attribute(1)]];
    float4 m_48 [[attribute(2)]];
    float4 m_50 [[attribute(3)]];
    float4 m_60 [[attribute(4)]];
    float4 m_62 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2665 = false;
    bool _1850 = false;
    bool _295 = false;
    bool _199 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _98 = in.m_48.w;
    float _100 = in.m_50.w;
    float _102 = trunc(_98);
    int _105 = int(_102);
    float _107 = -_100;
    float _109 = _107 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.y = _109;
    bool _113 = _105 >= 1;
    float _115 = 0.0;
    float _117 = _100;
    float _119 = _109;
    if (!_113)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _115;
    if (!_113)
    {
        out.m_55.x = 0.0;
    }
    int _123 = 0;
    if (!_113)
    {
        float _125 = _121 * 5.0;
        _123 = as_type<int>(_125);
    }
    int _127 = _123;
    int _129 = _127;
    if (!_113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2975 = as_type<float>(_127);
        out.gl_Position.z = _2975;
    }
    if (!_113)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _131 = _100 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _133 = isnan(_100);
    bool _135 = _131 || _133;
    bool _137 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _139 = _135 || _137;
    float _141 = float(_105);
    bool _143 = _109 >= _141;
    bool _145 = !_139;
    bool _147 = _143 || _145;
    if (_147)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _149 = _117;
    if (_147)
    {
        out.m_55.x = 0.0;
    }
    if (_147)
    {
        float _151 = _149 * 5.0;
        _129 = as_type<int>(_151);
    }
    int _153 = _129;
    if (_147)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3030 = as_type<float>(_153);
        out.gl_Position.z = _3030;
    }
    if (_147)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _155 = as_type<float>(int(gl_VertexIndex));
    float _157 = 1.0 / _141;
    bool _159 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _161 = _109 * _157;
    int _163 = as_type<int>(_155) & 1;
    bool _165 = _163 != 0;
    int _167 = as_type<int>(_155) & 2;
    bool _169 = _167 != 0;
    bool _171 = !_165;
    float _173 = _171 ? (-0.5) : 0.5;
    bool _175 = !_169;
    float _177 = _175 ? (-0.5) : 0.5;
    bool _179 = !_159;
    float _197;
    if (!_179)
    {
        float _181 = in.m_60.x;
        float _183 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _185 = _181 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _187 = fma(_185, (*spvDescriptorSet0.vp_c9)._m0[12].x, _109);
        float _189 = _187 * _183;
        float _191 = floor(_189);
        float _193 = -_191;
        float _195 = _189 + _193;
        _197 = _195;
        _199 = true;
    }
    else
    {
        _197 = _161;
    }
    _199 = false;
    float _201 = _197;
    float _203 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _205 = _201 + _203;
    bool _207 = _201 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _209 = isnan(_201);
    bool _211 = _207 || _209;
    bool _213 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _215 = _211 || _213;
    float _217 = float(_215);
    float _219 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _221 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _219;
    float _223 = -_217;
    float _225 = _223 + 1.0;
    bool _227 = _201 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _229 = isnan(_201);
    bool _231 = _227 || _229;
    bool _233 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _235 = _231 || _233;
    float _237 = float(_235);
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _241 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _239;
    bool _243 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _245 = 1.0 / _221;
    float _247 = _237 * _225;
    float _249 = -_237;
    float _251 = _249 + 1.0;
    float _253 = _205 * _245;
    float _255 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _257 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _255;
    float _259 = fma(_241, _253, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _261 = fma(_257, _253, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _263 = _259 * _247;
    float _265 = _261 * _247;
    float _267 = fma(_251, (*spvDescriptorSet0.vp_c9)._m0[143].x, _263);
    float _269 = fma(_251, (*spvDescriptorSet0.vp_c9)._m0[143].y, _265);
    float _271 = fma(_217, (*spvDescriptorSet0.vp_c9)._m0[144].x, _267);
    float _273 = fma(_217, (*spvDescriptorSet0.vp_c9)._m0[144].y, _269);
    bool _275 = !_243;
    float _293;
    if (!_275)
    {
        float _277 = in.m_60.x;
        float _279 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _281 = _277 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _283 = fma(_281, (*spvDescriptorSet0.vp_c9)._m0[11].y, _109);
        float _285 = _283 * _279;
        float _287 = floor(_285);
        float _289 = -_287;
        float _291 = _285 + _289;
        _293 = _291;
        _295 = true;
    }
    else
    {
        _293 = _161;
    }
    _295 = false;
    float _297 = _293;
    float _299 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _301 = int(_299);
    float _303 = in.m_60.x;
    float _305 = in.m_60.y;
    float _307 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _309 = int(_307);
    float _311 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _315 = _313 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _317 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _319 = log2(_317);
    float _321 = float(_301);
    float _323 = 1.0 / _321;
    float _325 = float(uint(_309));
    float _327 = _305 * 2.0;
    int _329 = ~_309;
    int _331 = _329 + 1;
    int _333 = ~_309;
    int _335 = _333 + 1;
    int _337 = ~_309;
    int _339 = _337 + 1;
    float _341 = 1.0 / _325;
    float _343 = _323 * _109;
    float _345 = 1.0 / _315;
    int _347 = as_type<int>(_341) + (-2);
    float _349 = trunc(_343);
    int _351 = int(_349);
    float _353 = floor(_327);
    float _355 = float(uint(_351));
    float _357 = as_type<float>(_347) * _355;
    float _359 = trunc(_357);
    float _361 = precise::max(_359, 0.0);
    uint _364 = uint(_361);
    int _366 = _331 * int(_364);
    int _368 = _366 + _351;
    float _370 = float(_309);
    float _372 = float(uint(_368));
    float _374 = as_type<float>(_347) * _372;
    int _376 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _378 = _376 != 0;
    float _380 = float(_351);
    float _382 = trunc(_374);
    float _384 = precise::max(_382, 0.0);
    uint _386 = uint(_384);
    bool _388 = !_378;
    float _390 = _388 ? 7.345489978790283203125 : 1.0;
    float _392 = _390 * _303;
    float _394 = floor(_392);
    int _396 = int(_364) + int(_386);
    float _398 = _370 * _109;
    bool _400 = _380 >= _370;
    bool _402 = isnan(_380);
    bool _404 = _400 || _402;
    bool _406 = isnan(_370);
    bool _408 = _404 || _406;
    float _410 = float(_408);
    float _412 = in.m_62.x;
    float _414 = in.m_62.y;
    int _416 = _335 * _396;
    int _418 = _416 + _351;
    float _420 = _398 * _157;
    bool _422 = uint(_418) >= uint(_309);
    float _424 = -_394;
    float _426 = _392 + _424;
    float _428 = trunc(_410);
    int _430 = int(_428);
    bool _432 = !_422;
    int _434 = _432 ? 0 : (-1);
    float _436 = _426 * _370;
    bool _438 = _309 == 0;
    int _440 = ~_396;
    int _442 = _440 + _434;
    int _444 = _442 + 1;
    int _446 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _448 = _446 != 0;
    int _450 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _452 = _450 != 0;
    int _454 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _456 = _454 != 0;
    float _458 = trunc(_420);
    int _460 = int(_458);
    int _462 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _464 = _462 != 0;
    int _466 = _309 * _444;
    int _468 = _466 + _351;
    int _470 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _472 = _470 != 0;
    bool _474 = !_452;
    int _476 = _474 ? 0 : 1;
    int _478 = ~_430;
    int _480 = _478 + 1;
    int _482 = _480 + 1;
    float _484 = trunc(_436);
    int _486 = int(_484);
    bool _488 = !_438;
    int _490 = _488 ? _468 : (-1);
    float _492 = _271 * _412;
    bool _494 = !_464;
    int _496 = _494 ? 0 : 1;
    int _498 = _309 + (-1);
    int _500 = _490 * _482;
    bool _502 = !_448;
    int _504 = _502 ? 0 : 1;
    int _506 = abs(_476);
    int _508 = _430 * _498;
    int _510 = _508 + _500;
    int _512 = abs(_504);
    int _514 = abs(_496);
    int _516 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _518 = _516 != 0;
    int _520 = _486 * _514;
    int _522 = _520 + _351;
    bool _524 = !_456;
    int _526 = _524 ? 0 : 1;
    int _528 = _510 * _506;
    int _530 = abs(_526);
    int _532 = _460 * _512;
    int _534 = _532 + _528;
    bool _536 = !_518;
    int _538 = _536 ? 0 : 1;
    float _540 = in.m_48.x;
    float _542 = in.m_48.y;
    float _544 = in.m_48.z;
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _548 = _546 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    int _550 = _522 * _530;
    int _552 = _550 + _534;
    int _554 = abs(_538);
    float _556 = _303 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _558 = 1.0 / _548;
    int _560 = _486 * _554;
    int _562 = _560 + _552;
    float _564 = _303 * 2.0;
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _568 = _566 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _570 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _572 = isnan(0.0);
    bool _574 = _570 || _572;
    bool _576 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _578 = _574 || _576;
    float _580 = _319 * _109;
    float _582 = _305 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _584 = floor(_564);
    float _586 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _588 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _590 = _588 != 0;
    float _592 = fma(_582, -2.0, _311);
    float _594 = -_586;
    float _596 = fma(_556, 2.0, _594);
    float _598 = _542 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _600 = _542 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _602 = _542 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _604 = float(uint(_562));
    float _606 = exp2(_580);
    float _608 = fma(_540, (*spvDescriptorSet0.vp_c10)._m0[4].x, _598);
    float _610 = fma(_540, (*spvDescriptorSet0.vp_c10)._m0[5].x, _600);
    float _612 = fma(_540, (*spvDescriptorSet0.vp_c10)._m0[6].x, _602);
    float _614 = as_type<float>(_347) * _604;
    float _616 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _618 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _616;
    float _620 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _622 = _620 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    bool _624 = _584 > 0.0;
    float _626 = trunc(_614);
    float _628 = precise::max(_626, 0.0);
    uint _630 = uint(_628);
    float _632 = _618 * _345;
    float _634 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _636 = _634 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    int _638 = ~_309;
    int _640 = _638 + 1;
    float _642 = _622 * _558;
    float _644 = -_109;
    float _646 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[76].x, _596);
    float _648 = 1.0 / _636;
    float _650 = -_606;
    float _652 = _650 + 1.0;
    bool _654 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _656 = isnan(1.0);
    bool _658 = _654 || _656;
    bool _660 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _662 = _658 || _660;
    float _664 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _666 = 1.0 + _664;
    float _668 = _578 ? _652 : 0.0;
    float _670 = 1.0 / _568;
    int _672 = _640 * int(_630);
    int _674 = _672 + _562;
    bool _676 = _584 >= 0.0;
    bool _678 = isnan(_584);
    bool _680 = _676 || _678;
    bool _682 = isnan(0.0);
    bool _684 = _680 || _682;
    float _686 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _688 = in.m_60.z;
    float _690 = _305 + _303;
    float _692 = float(uint(_674));
    float _694 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[78].z, _686);
    float _696 = 1.0 / _666;
    float _698 = _690 + (-1.0);
    float _700 = fma(_109, (*spvDescriptorSet0.vp_c9)._m0[77].z, _694);
    int _702 = _684 ? 0 : 1;
    float _704 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _706 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _704;
    bool _708 = _353 >= 0.0;
    bool _710 = isnan(_353);
    bool _712 = _708 || _710;
    bool _714 = isnan(0.0);
    bool _716 = _712 || _714;
    float _718 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _720 = _718 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _722 = as_type<float>(_347) * _692;
    float _724 = _706 * _670;
    float _726 = fma(_109, (*spvDescriptorSet0.vp_c9)._m0[76].y, _592);
    float _728 = _720 * _648;
    float _730 = trunc(_722);
    float _732 = precise::max(_730, 0.0);
    uint _734 = uint(_732);
    float _736 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _738 = _716 ? 0 : 1;
    float _740 = -_700;
    float _742 = _740 + 1.0;
    float _744 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[78].w, _736);
    float _746 = fma(_109, (*spvDescriptorSet0.vp_c9)._m0[77].w, _744);
    if (_662)
    {
        float _748 = _668 * _696;
        _119 = _748;
    }
    float _750 = _119;
    bool _752 = _303 > 0.5;
    float _754 = fma(_698, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _756 = _688 * 2.0;
    int _758 = ~_309;
    int _760 = _758 + 1;
    float _762 = -_746;
    float _764 = _762 + 1.0;
    int _766 = int(_630) + int(_734);
    float _768 = float(uint(_522));
    float _770 = floor(_756);
    float _772 = -_173;
    int _774 = _752 ? as_type<int>(_772) : as_type<int>(_173);
    bool _776 = _353 > 0.0;
    float _778 = as_type<float>(_347) * _768;
    int _780 = ~_702;
    int _782 = _780 + 1;
    int _784 = _782 + 1;
    int _786 = _760 * _766;
    int _788 = _786 + _562;
    int _790 = _784;
    if (!_624)
    {
        int _792 = ~_702;
        int _794 = _792 + 1;
        _790 = _794;
    }
    int _796 = _790;
    float _798 = _305 + _688;
    bool _800 = _305 > 0.5;
    float _802 = trunc(_778);
    float _804 = precise::max(_802, 0.0);
    uint _806 = uint(_804);
    int _808 = ~_738;
    int _810 = _808 + 1;
    int _812 = _810 + 1;
    float _814 = _798 + (-1.0);
    float _816 = -_177;
    int _818 = _800 ? as_type<int>(_816) : as_type<int>(_177);
    bool _820 = uint(_788) >= uint(_309);
    float _822 = fma(_814, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _824 = _812;
    if (!_776)
    {
        int _826 = ~_738;
        int _828 = _826 + 1;
        _824 = _828;
    }
    int _830 = _824;
    bool _832 = !_590;
    float _834 = _832 ? _173 : as_type<float>(_774);
    bool _836 = !_472;
    float _838 = _836 ? _177 : as_type<float>(_818);
    float _840 = fma(_544, (*spvDescriptorSet0.vp_c10)._m0[4].z, _608);
    int _842 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _844 = _842 != 0;
    int _846 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _848 = _846 != 0;
    int _850 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _852 = _850 != 0;
    float _854 = fma(_544, (*spvDescriptorSet0.vp_c10)._m0[5].z, _610);
    bool _856 = !_820;
    int _858 = _856 ? 0 : (-1);
    int _860 = _339 * int(_806);
    int _862 = _860 + _522;
    bool _864 = _770 > 0.0;
    float _866 = _854 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _868 = _770 >= 0.0;
    bool _870 = isnan(_770);
    bool _872 = _868 || _870;
    bool _874 = isnan(0.0);
    bool _876 = _872 || _874;
    float _878 = fma(_544, (*spvDescriptorSet0.vp_c10)._m0[6].z, _612);
    float _880 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _882 = _297 + _880;
    bool _884 = _297 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _886 = isnan(_297);
    bool _888 = _884 || _886;
    bool _890 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _892 = _888 || _890;
    float _894 = float(_892);
    int _896 = ~_766;
    int _898 = _896 + _858;
    int _900 = _898 + 1;
    float _902 = fma(_632, _882, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _904 = _297 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _906 = isnan(_297);
    bool _908 = _904 || _906;
    bool _910 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _912 = _908 || _910;
    float _914 = float(_912);
    float _916 = -_894;
    float _918 = _916 + 1.0;
    float _920 = float(uint(_862));
    int _922 = _309 * _900;
    int _924 = _922 + _562;
    bool _926 = _297 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _928 = isnan(_297);
    bool _930 = _926 || _928;
    bool _932 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _934 = _930 || _932;
    float _936 = float(_934);
    float _938 = _914 * _918;
    bool _940 = _297 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _942 = isnan(_297);
    bool _944 = _940 || _942;
    bool _946 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _948 = _944 || _946;
    float _950 = float(_948);
    float _952 = as_type<float>(_347) * _920;
    bool _954 = !_438;
    int _956 = _954 ? _924 : (-1);
    float _958 = -_914;
    float _960 = _958 + 1.0;
    bool _962 = _297 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _964 = isnan(_297);
    bool _966 = _962 || _964;
    bool _968 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _970 = _966 || _968;
    float _972 = float(_970);
    int _974 = _956 >> 31;
    float _976 = trunc(_952);
    float _978 = precise::max(_976, 0.0);
    uint _980 = uint(_978);
    int _982 = _956 & 3;
    bool _984 = _982 != 0;
    float _986 = _972 * _960;
    float _988 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _990 = _297 + _988;
    int _992 = _974 & 3;
    float _994 = -_972;
    float _996 = _994 + 1.0;
    float _998 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1000 = _297 + _998;
    float _1002 = fma(_642, _990, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    int _1004 = _956 + _992;
    float _1006 = _936 * _996;
    float _1008 = -_936;
    float _1010 = _1008 + 1.0;
    float _1012 = fma(_724, _1000, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    int _1014 = _1004 >> 2;
    float _1016 = _834 + 0.5;
    float _1018 = _950 * _1010;
    float _1020 = _838 + (-0.5);
    int _1022 = _1014 << 4;
    int _1024 = _1022 + 368;
    float _1026 = fma(_1016, (*spvDescriptorSet0.vp_c9)._m0[80].x, _646);
    int _1028 = int(_806) + int(_980);
    float _1030 = -_1020;
    float _1032 = -_726;
    float _1034 = fma(_1030, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1032);
    int _1036 = ~_309;
    int _1038 = _1036 + 1;
    uint _1040 = uint(int(uint(_1024) >> uint(2)));
    uint _1042 = uint(int(uint(int(_1040)) >> uint(2)));
    int _1044 = int(_1040) & 3;
    float _1046 = (*spvDescriptorSet0.vp_c9)._m0[int(_1042)][_1044];
    int _1048 = int(_1040) + 1;
    uint _1050 = uint(int(uint(_1048) >> uint(2)));
    int _1052 = _1048 & 3;
    float _1054 = (*spvDescriptorSet0.vp_c9)._m0[int(_1050)][_1052];
    float _1056 = -_742;
    float _1058 = fma(_834, _1056, _1026);
    float _1060 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1062 = _297 + _1060;
    int _1064 = _876 ? 0 : 1;
    float _1066 = _902 * _1018;
    float _1068 = -_950;
    float _1070 = _1068 + 1.0;
    int _1072 = _956 & 3;
    bool _1074 = _1072 != 0;
    float _1076 = fma(_728, _1062, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    int _1078 = ~_1064;
    int _1080 = _1078 + 1;
    int _1082 = _1080 + 1;
    float _1084 = fma(_1070, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1066);
    int _1086 = _1082;
    if (!_864)
    {
        int _1088 = ~_1064;
        int _1090 = _1088 + 1;
        _1086 = _1090;
    }
    int _1092 = _1086;
    int _1094 = _1038 * _1028;
    int _1096 = _1094 + _522;
    bool _1098 = !_844;
    int _1100 = _1098 ? 0 : 1;
    float _1102 = fma(_1002, _1006, _1084);
    int _1104 = _984 ? 0 : 1;
    float _1106 = fma(_838, _764, _1034);
    bool _1108 = uint(_1072) > 1u;
    bool _1110 = uint(_1096) >= uint(_309);
    int _1112 = abs(_1100);
    out.m_64.x = _1058;
    out.m_64.y = _1106;
    int _1114 = _1024 + 8;
    uint _1116 = uint(int(uint(_1114) >> uint(2)));
    uint _1118 = uint(int(uint(int(_1116)) >> uint(2)));
    int _1120 = int(_1116) & 3;
    float _1122 = (*spvDescriptorSet0.vp_c9)._m0[int(_1118)][_1120];
    int _1124 = int(_1116) + 1;
    uint _1126 = uint(int(uint(_1124) >> uint(2)));
    int _1128 = _1124 & 3;
    float _1130 = (*spvDescriptorSet0.vp_c9)._m0[int(_1126)][_1128];
    bool _1132 = !_848;
    int _1134 = _1132 ? 0 : 1;
    int _1136 = ~_1104;
    int _1138 = _1136 + 1;
    int _1140 = _1138 + 1;
    int _1142 = abs(_1134);
    int _1144 = _1140;
    if (!_1108)
    {
        int _1146 = ~_1104;
        int _1148 = _1146 + 1;
        _1144 = _1148;
    }
    int _1150 = _1144;
    float _1152 = float(_796);
    float _1154 = float(_1142);
    float _1156 = fma(_1012, _986, _1102);
    bool _1158 = uint(_1072) >= 2u;
    int _1160 = abs(_1150);
    float _1162 = _1154 * _1152;
    int _1164 = _1158 ? 0 : 1;
    float _1166 = fma(_1076, _938, _1156);
    bool _1168 = _1072 != 3;
    int _1170 = ~_1160;
    int _1172 = _1170 + 1;
    int _1174 = _1172 + 1;
    float _1176 = float(_1112);
    float _1178 = float(_1092);
    int _1180 = _1174 * as_type<int>(_1054);
    int _1182 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1184 = _1182 != 0;
    bool _1186 = !_1110;
    int _1188 = _1186 ? 0 : (-1);
    float _1190 = _1176 * _1178;
    bool _1192 = !_1074;
    int _1194 = _1192 ? 0 : 1;
    bool _1196 = _1072 != 3;
    float _1198 = _1190 * (-2.0);
    bool _1200 = !_1184;
    int _1202 = _1200 ? 0 : 1;
    int _1204 = ~_1164;
    int _1206 = _1204 + 1;
    int _1208 = _1206 + 1;
    int _1210 = _1208;
    if (_1168)
    {
        int _1212 = ~_1164;
        int _1214 = _1212 + 1;
        _1210 = _1214;
    }
    int _1216 = _1210;
    int _1218 = abs(_1194);
    float _1220 = in.m_66.x;
    float _1222 = in.m_66.y;
    float _1224 = in.m_66.z;
    int _1226 = ~_1028;
    int _1228 = _1226 + _1188;
    int _1230 = _1228 + 1;
    float _1232 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1234 = _866 + _1232;
    int _1236 = abs(_1202);
    float _1238 = _840 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _1240 = !_1196;
    int _1242 = _1240 ? 0 : (-1);
    float _1244 = _878 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1246 = abs(_1216);
    float _1248 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1250 = _1238 + _1248;
    int _1252 = abs(_1242);
    float _1254 = _1234 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1256 = ~_1218;
    int _1258 = _1256 + 1;
    int _1260 = _1258 + 1;
    int _1262 = _309 * _1230;
    int _1264 = _1262 + _522;
    float _1266 = fma(_1250, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1254);
    float _1268 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1270 = _1244 + _1268;
    int _1272 = _1260 * as_type<int>(_1046);
    int _1274 = _1272 + _1180;
    int _1276 = ~_1246;
    int _1278 = _1276 + 1;
    int _1280 = _1278 + 1;
    int _1282 = ~_1252;
    int _1284 = _1282 + 1;
    int _1286 = _1284 + 1;
    float _1288 = fma(_1270, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1266);
    int _1290 = _1280 * as_type<int>(_1122);
    int _1292 = _1290 + _1274;
    float _1294 = _1162 * (-2.0);
    int _1296 = ~_1236;
    int _1298 = _1296 + 1;
    int _1300 = _1298 + 1;
    int _1302 = _1286 * as_type<int>(_1130);
    int _1304 = _1302 + _1292;
    float _1306 = _1234 * _1234;
    float _1308 = fma(_894, (*spvDescriptorSet0.vp_c9)._m0[119].x, _1166);
    bool _1310 = _1288 >= 0.0;
    int _1312 = _1304 * _1300;
    float _1314 = fma(_1250, _1250, _1306);
    bool _1316 = !_438;
    int _1318 = _1316 ? _1264 : (-1);
    float _1320 = fma(_1198, _1220, _1220);
    float _1322 = fma(_822, _1294, _822);
    float _1324 = fma(_1270, _1270, _1314);
    float _1326 = fma(_1294, _1222, _1222);
    float _1328 = fma(_754, _1198, _754);
    int _1330 = _1318 * _1236;
    int _1332 = _1330 + _1312;
    float _1334 = rsqrt(_1324);
    float _1336 = _303 + (-0.5);
    float _1338 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1340 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1342 = (*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1344 = _1224;
    if (_1310)
    {
        _1342 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1346 = _1342;
    float _1348 = fma(_1336, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1320);
    float _1350 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1352 = _492 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1354 = _1338 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1356 = _1340 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1358 = _1350 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1360 = _1308 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _1362 = as_type<int>(_1346);
    if (_1310)
    {
        float _1364 = _1346 * 5.0;
        _1362 = as_type<int>(_1364);
    }
    int _1366 = _1362;
    float _1368 = float(_1332);
    float _1370 = _1352 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    bool _1372 = !_852;
    int _1374 = _1372 ? 0 : 1;
    out.m_68.x = _1358;
    out.m_68.y = _1354;
    out.m_68.z = _1356;
    out.m_68.w = _1360;
    float _1376 = fma(_1328, _750, _1348);
    float _1378 = _1370 * _1334;
    float _1380 = _305 + (-0.5);
    if (_1310)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4835 = as_type<float>(_1366);
        out.gl_Position.z = _4835;
    }
    int _1382 = abs(_1374);
    float _1384 = _1250 * _1378;
    float _1386 = _1234 * _1378;
    out.m_70.x = _1368;
    if (_1310)
    {
        out.m_55.x = 0.0;
    }
    if (_1310)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1388 = -_1386;
    float _1390 = _866 + _1388;
    float _1392 = _1270 * _1378;
    float _1394 = -_1384;
    float _1396 = _1238 + _1394;
    float _1398 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1400 = _1390 + _1398;
    float _1402 = float(_830);
    float _1404 = -_1392;
    float _1406 = _1244 + _1404;
    float _1408 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1410 = _1396 + _1408;
    float _1412 = _1400 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1414 = float(_1382);
    float _1416 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1418 = _1406 + _1416;
    float _1420 = -_1386;
    float _1422 = _1234 + _1420;
    float _1424 = fma(_1410, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1412);
    float _1426 = -_1384;
    float _1428 = _1250 + _1426;
    float _1430 = fma(_1380, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1326);
    float _1432 = _1422 * _1422;
    float _1434 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1424);
    float _1436 = _688 + _303;
    float _1438 = _1376 * 0.15915493667125701904296875;
    float _1440 = _1414 * _1402;
    float _1442 = fma(_1428, _1428, _1432);
    bool _1444 = _1434 >= 0.0;
    float _1446 = fma(_1322, _750, _1430);
    float _1448 = _1436 + (-1.0);
    float _1450 = _1440 * (-2.0);
    float _1452 = -_1392;
    float _1454 = _1270 + _1452;
    float _1456 = _1446 * 0.15915493667125701904296875;
    float _1458 = fma(_1448, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1460 = _688 + (-0.5);
    float _1462 = fma(_1450, _1224, _1224);
    float _1464 = fma(_1454, _1454, _1442);
    float _1466 = _1456 * 6.283185482025146484375;
    float _1468 = sin(_1466);
    float _1470 = fma(_1458, _1450, _1458);
    if (_1444)
    {
        _1344 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1472 = _1344;
    float _1474 = fma(_1460, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1462);
    int _1476 = as_type<int>(_1472);
    if (_1444)
    {
        out.m_55.x = 0.0;
    }
    if (_1444)
    {
        float _1478 = _1472 * 5.0;
        _1476 = as_type<int>(_1478);
    }
    int _1480 = _1476;
    float _1482 = _1438 * 6.283185482025146484375;
    float _1484 = sin(_1482);
    float _1486 = fma(_1470, _750, _1474);
    if (_1444)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5020 = as_type<float>(_1480);
        out.gl_Position.z = _5020;
    }
    float _1488 = _1486 * 0.15915493667125701904296875;
    float _1490 = _1438 * 6.283185482025146484375;
    float _1492 = cos(_1490);
    float _1494 = sqrt(_1464);
    float _1496 = _1456 * 6.283185482025146484375;
    float _1498 = cos(_1496);
    if (_1444)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1500 = _1488 * 6.283185482025146484375;
    float _1502 = cos(_1500);
    float _1504 = _273 * _414;
    float _1506 = _1334 * _1494;
    float _1508 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _177);
    float _1510 = _1484 * _1468;
    float _1512 = _1504 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1514 = _1492 * _1498;
    float _1516 = _1492 * _1468;
    float _1518 = _1488 * 6.283185482025146484375;
    float _1520 = sin(_1518);
    float _1522 = _1512 * _1506;
    float _1524 = _1484 * _1498;
    float _1526 = _1508 * _1522;
    float _1528 = _1352 * _1506;
    float _1530 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _173);
    float _1532 = _1492 * _1502;
    float _1534 = _1498 * _1502;
    float _1536 = _1484 * _1502;
    float _1538 = _1530 * _1528;
    float _1540 = _1532 * _1526;
    float _1542 = _1468 * _1502;
    float _1544 = _1506 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1546 = _1544 * 0.5;
    float _1548 = fma(_1520, _1514, _1510);
    float _1550 = -_1526;
    float _1552 = _1520 * _1550;
    float _1554 = -_1524;
    float _1556 = fma(_1520, _1516, _1554);
    float _1558 = -_1516;
    float _1560 = fma(_1520, _1524, _1558);
    float _1562 = fma(_1548, _1538, _1540);
    float _1564 = _1536 * _1526;
    float _1566 = fma(_1534, _1538, _1552);
    float _1568 = fma(_1520, _1510, _1514);
    float _1570 = fma(_1556, _1546, _1562);
    float _1572 = fma(_1560, _1538, _1564);
    float _1574 = fma(_1542, _1546, _1566);
    float _1576 = _1548 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1578 = _1570 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1580 = _1570 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1582 = fma(_1568, _1546, _1572);
    float _1584 = _1570 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1586 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1578);
    float _1588 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1580);
    float _1590 = _1548 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1592 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1584);
    float _1594 = fma(_1582, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1586);
    float _1596 = fma(_1582, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1588);
    float _1598 = _1548 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1600 = fma(_1582, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1592);
    float _1602 = _1594 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1604 = _1596 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1606 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1576);
    float _1608 = _1600 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1610 = _1238 + _1602;
    float _1612 = _1244 + _1604;
    float _1614 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1590);
    float _1616 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1598);
    float _1618 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1620 = _1610 + _1618;
    float _1622 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1624 = _1612 + _1622;
    float _1626 = _1532 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1628 = _1532 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1630 = _1620 * _1620;
    float _1632 = _1624 * _1624;
    float _1634 = _1532 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1636 = _1556 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1638 = _1556 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1640 = _1630 + _1632;
    float _1642 = _866 + _1608;
    float _1644 = _1556 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1646 = -_1520;
    float _1648 = fma(_1646, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1626);
    float _1650 = sqrt(_1640);
    float _1652 = -_1520;
    float _1654 = fma(_1652, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1628);
    float _1656 = -_1520;
    float _1658 = fma(_1656, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1634);
    float _1660 = fma(_1560, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1606);
    float _1662 = fma(_1560, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1614);
    float _1664 = fma(_1542, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1636);
    float _1666 = fma(_1542, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1638);
    float _1668 = fma(_1560, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1616);
    float _1670 = fma(_1542, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1644);
    bool _1672 = _1650 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1674 = _1556;
    float _1676 = _1610;
    float _1678 = _1636;
    float _1680 = _1612;
    float _1682 = _1630;
    if (!_1672)
    {
        _1674 = _1610;
    }
    float _1684 = _1674;
    float _1686 = _1684;
    if (!_1672)
    {
        _1676 = _1612;
    }
    float _1688 = _1676;
    float _1690 = _1688;
    if (!_1672)
    {
        _1678 = _1632;
    }
    float _1692 = _1678;
    float _1694 = _1692;
    if (!_1672)
    {
        _1680 = _1642;
    }
    float _1696 = _1680;
    bool _1698 = !_1672;
    float _1700 = _1696;
    if (!_1698)
    {
        float _1702 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1704 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1706 = _1650 + _1704;
        float _1708 = rsqrt(_1640);
        float _1710 = _1706 * _1702;
        float _1712 = _1642 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1714 = _1710 * 0.15915493667125701904296875;
        float _1716 = _1714 * 6.283185482025146484375;
        float _1718 = sin(_1716);
        float _1720 = _1714 * 6.283185482025146484375;
        float _1722 = cos(_1720);
        float _1724 = fma(_1718, _1712, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1726 = _1708 * _1724;
        float _1728 = fma(_1620, _1726, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1730 = _1722 + (-1.0);
        float _1732 = fma(_1624, _1726, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1734 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1736 = _1728 + _1734;
        float _1738 = _1730 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1740 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1742 = _1732 + _1740;
        float _1744 = _1736 * _1736;
        float _1746 = fma(_1642, _1722, _1738);
        float _1748 = _1742 * _1742;
        _1700 = _1746;
        _1682 = _1744;
        _1694 = _1748;
        _1686 = _1728;
        _1690 = _1732;
    }
    float _1750 = _1700;
    float _1752 = _1682;
    float _1754 = _1694;
    float _1756 = _1686;
    float _1758 = _1690;
    float _1760 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1762 = _1750 + _1760;
    float _1764 = fma(_1536, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1648);
    float _1766 = fma(_1536, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1654);
    float _1768 = _177 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1770 = fma(_1762, _1762, _1752);
    float _1772 = fma(_1536, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1658);
    float _1774 = _173 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1776 = _1768 * _1764;
    float _1778 = _1770 + _1754;
    float _1780 = _1768 * _1766;
    float _1782 = _1768 * _1772;
    float _1784 = fma(_1568, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1664);
    float _1786 = fma(_1568, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1666);
    float _1788 = fma(_1568, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1670);
    float _1790 = sqrt(_1778);
    float _1792 = fma(_1774, _1660, _1776);
    float _1794 = fma(_1774, _1662, _1780);
    float _1796 = fma(_1774, _1668, _1782);
    float _1798 = _1784 + _1792;
    float _1800 = _1786 + _1794;
    float _1802 = _1788 + _1796;
    out.m_72.x = _1798;
    out.m_72.y = _1800;
    out.m_72.z = _1802;
    bool _1804 = _1790 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1806 = isnan(_1790);
    bool _1808 = _1804 || _1806;
    bool _1810 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1812 = _1808 || _1810;
    float _1814 = _1772;
    if (!_1812)
    {
        _1814 = 1.0;
    }
    float _1816 = _1814;
    bool _1818 = !_1812;
    float _1820 = _1816;
    if (!_1818)
    {
        bool _1822 = _1790 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1824 = isnan(_1790);
        bool _1826 = _1822 || _1824;
        bool _1828 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1830 = _1826 || _1828;
        if (!_1830)
        {
            float _1832 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1834 = _1790 + _1832;
            float _1836 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1838 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1836;
            float _1840 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1842 = _1840 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1844 = 1.0 / _1838;
            float _1846 = _1834 * _1844;
            float _1848 = fma(_1846, _1842, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1820 = _1848;
            _1850 = true;
        }
        else
        {
            bool _1852 = _1790 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1854 = isnan(_1790);
            bool _1856 = _1852 || _1854;
            bool _1858 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1860 = _1856 || _1858;
            if (!_1860)
            {
                float _1862 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1864 = _1790 + _1862;
                float _1866 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1868 = _1866 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1870 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1872 = _1870 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1874 = 1.0 / _1868;
                float _1876 = _1864 * _1874;
                float _1878 = fma(_1876, _1872, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1820 = _1878;
                _1850 = true;
            }
            else
            {
                _1820 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1850 = false;
    float _1880 = _1820;
    float _1882 = _1390 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1884 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1886 = _1756 + _1884;
    float _1888 = fma(_1396, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1882);
    float _1890 = _1390 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1892 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1894 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1896 = _1892 || _1894;
    bool _1898 = isnan(0.5);
    bool _1900 = _1896 || _1898;
    float _1902 = fma(_1406, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1888);
    float _1904 = _1902 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1906 = fma(_1396, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1890);
    bool _1908 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1910 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1912 = _1908 || _1910;
    bool _1914 = isnan(0.5);
    bool _1916 = _1912 || _1914;
    float _1918 = fma(_1886, _1880, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1920 = 1.0 / _1904;
    float _1922 = fma(_1406, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1906);
    float _1924 = _1922 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1926 = _1924 + _1904;
    float _1928 = _1886;
    if (_1916)
    {
        _1928 = 1.0;
    }
    float _1930 = _1928;
    float _1932 = _1926 * _1920;
    float _1934 = _1932 * 0.5;
    float _1936 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1938 = _1750 + _1936;
    float _1940 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1942 = fma(_1934, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1940);
    float _1944 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1946 = _1758 + _1944;
    float _1948 = fma(_1938, _1880, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1950 = -_1384;
    float _1952 = _1950 + _1918;
    float _1954 = fma(_1946, _1880, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1956 = 1.0 / _1942;
    float _1958 = -_1386;
    float _1960 = _1958 + _1948;
    float _1962 = -_1392;
    float _1964 = _1962 + _1954;
    float _1966 = _1960;
    float _1968 = _1952;
    float _1970 = _1964;
    float _1972 = _1930;
    float _1974 = _1956;
    if (!_1900)
    {
        float _1976 = _1400 * _1400;
        float _1978 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1980 = -_1244;
        float _1982 = _1980 + _1954;
        float _1984 = -_866;
        float _1986 = _1984 + _1948;
        float _1988 = fma(_1410, _1410, _1976);
        float _1990 = -_1238;
        float _1992 = _1990 + _1918;
        float _1994 = fma(_1418, _1418, _1988);
        float _1996 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1998 = sqrt(_1994);
        float _2000 = 1.0 / _1506;
        float _2002 = _1996 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2004 = precise::min(_1998, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2006 = _2004 * _1978;
        float _2008 = _2006 * _2000;
        float _2010 = _2002 * _2008;
        float _2012 = _1982 * _2008;
        float _2014 = fma(_1986, _2010, _1390);
        float _2016 = fma(_1992, _2010, _1396);
        float _2018 = fma(_2002, _2012, _1406);
        _1966 = _2014;
        _1968 = _2016;
        _1970 = _2018;
    }
    float _2020 = _1966;
    float _2022 = _1968;
    float _2024 = _1970;
    float _2026 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2028 = _1956 * _2026;
    if (!_1916)
    {
        float _2030 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2032 = _2030 * 0.15915493667125701904296875;
        float _2034 = _2032 * 6.283185482025146484375;
        float _2036 = cos(_2034);
        float _2038 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2040 = _2038 * 0.15915493667125701904296875;
        float _2042 = _2032 * 6.283185482025146484375;
        float _2044 = sin(_2042);
        float _2046 = 1.0 / _2036;
        float _2048 = _2040 * 6.283185482025146484375;
        float _2050 = cos(_2048);
        float _2052 = _2044 * _2046;
        float _2054 = _2040 * 6.283185482025146484375;
        float _2056 = sin(_2054);
        float _2058 = _2050 * _2052;
        float _2060 = 1.0 / _2058;
        float _2062 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2064 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2062;
        float _2066 = 1.0 / _2064;
        float _2068 = _2056 * _2060;
        float _2070 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2072 = fma(_2028, _2068, _2070);
        float _2074 = _2072 * _2066;
        float _2076 = precise::clamp(_2074, 0.0, 1.0);
        _1972 = _2076;
    }
    float _2078 = _1972;
    float _2080 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2082 = _2020 + _2080;
    float _2084 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2086 = _2022 + _2084;
    float _2088 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2090 = _2024 + _2088;
    float _2092 = _2082 * _2082;
    float _2094 = fma(_2086, _2086, _2092);
    float _2096 = fma(_2090, _2090, _2094);
    float _2098 = rsqrt(_2096);
    float _2100 = _2098 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2102 = _2086 * _2100;
    float _2104 = _2090 * _2100;
    float _2106 = _2102 * _2102;
    float _2108 = _2104 * _2104;
    float _2110 = _2106 + _2108;
    float _2112 = sqrt(_2110);
    bool _2114 = _2112 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2116 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2118 = _2112 + _2116;
    float _2120 = _2094;
    float _2122 = _2118;
    float _2124 = _2082;
    float _2126 = _2100;
    float _2128 = _2110;
    if (_2114)
    {
        float _2130 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2120 = _2130;
    }
    float _2132 = _2120;
    float _2134 = _2132;
    if (_2114)
    {
        float _2136 = _2118 * _2132;
        _2122 = _2136;
    }
    float _2138 = _2122;
    if (_2114)
    {
        float _2140 = rsqrt(_2110);
        _2134 = _2140;
    }
    float _2142 = _2134;
    float _2144 = _2142;
    if (_2114)
    {
        float _2146 = _2138 * 0.15915493667125701904296875;
        _1974 = _2146;
    }
    float _2148 = _1974;
    float _2150 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2152 = _2090;
    float _2154 = _2148;
    if (_2114)
    {
        float _2156 = _2148 * 6.283185482025146484375;
        float _2158 = sin(_2156);
        _2152 = _2158;
    }
    float _2160 = _2152;
    float _2162 = precise::max(0.0, _2150);
    float _2164 = _2098;
    if (_2114)
    {
        float _2166 = _2148 * 6.283185482025146484375;
        float _2168 = cos(_2166);
        _2164 = _2168;
    }
    float _2170 = _2164;
    float _2172 = -_2100;
    float _2174 = -_2162;
    float _2176 = fma(_2082, _2172, _2174);
    float _2178 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_2114)
    {
        float _2180 = _2176 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2124 = _2180;
    }
    float _2182 = _2124;
    float _2184 = fma(_1396, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2186 = _2160;
    float _2188 = _2182;
    if (_2114)
    {
        float _2190 = fma(_2160, _2182, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2186 = _2190;
    }
    float _2192 = _2186;
    if (!_2114)
    {
        _2154 = _2102;
    }
    float _2194 = _2154;
    float _2196 = _2194;
    if (!_2114)
    {
        _2188 = _2104;
    }
    float _2198 = _2188;
    float _2200 = _2198;
    if (_2114)
    {
        float _2202 = _2142 * _2192;
        _2126 = _2202;
    }
    float _2204 = _2126;
    if (!_2114)
    {
        _2144 = _2176;
    }
    float _2206 = _2144;
    float _2208 = sqrt(_2096);
    float _2210 = _2206;
    float _2212 = _2170;
    if (_2114)
    {
        float _2214 = _2170 + (-1.0);
        _2178 = _2214;
    }
    float _2216 = _2178;
    float _2218 = _2216;
    if (_2114)
    {
        float _2220 = _2102 * _2204;
        _2196 = _2220;
    }
    float _2222 = _2196;
    if (_2114)
    {
        float _2224 = _2104 * _2204;
        _2200 = _2224;
    }
    float _2226 = _2200;
    if (_2114)
    {
        float _2228 = _2216 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2128 = _2228;
    }
    float _2230 = _2128;
    if (!_2114)
    {
        _2218 = _2106;
    }
    float _2232 = _2218;
    float _2234 = _2232;
    if (_2114)
    {
        float _2236 = _2222 * _2222;
        _2234 = _2236;
    }
    float _2238 = _2234;
    if (_2114)
    {
        float _2240 = fma(_2176, _2170, _2230);
        _2210 = _2240;
    }
    float _2242 = _2210;
    if (!_2114)
    {
        _2212 = _2108;
    }
    float _2244 = _2212;
    float _2246 = _2244;
    if (_2114)
    {
        float _2248 = _2226 * _2226;
        _2246 = _2248;
    }
    float _2250 = _2246;
    float _2252 = fma(_2242, _2242, _2238);
    float _2254 = _2020 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2256 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2258 = fma(_1406, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2260 = _2252 + _2250;
    float _2262 = fma(_2022, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2254);
    float _2264 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2266 = fma(_2208, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2264);
    float _2268 = precise::clamp(_2266, 0.0, 1.0);
    float _2270 = _2020 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2272 = rsqrt(_2260);
    float _2274 = fma(_2024, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2262);
    float _2276 = -_2268;
    float _2278 = _2276 + 1.0;
    float _2280 = fma(_2022, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2270);
    float _2282 = _2274 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2284 = fma(_2024, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2280);
    float _2286 = abs(_2278);
    float _2288 = log2(_2286);
    float _2290 = _2282 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2292 = _2020 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2294 = -_2290;
    float _2296 = fma(_2294, _2256, 1.0);
    float _2298 = _2020 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2300 = fma(_2022, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2292);
    float _2302 = _2272 * _2222;
    float _2304 = _2272 * _2242;
    float _2306 = fma(_2022, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2298);
    float _2308 = floor(_2184);
    float _2310 = _2302 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2312 = _2272 * _2226;
    float _2314 = fma(_2024, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2306);
    float _2316 = -_2310;
    float _2318 = fma(_2304, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2316);
    float _2320 = _2284 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2322 = _2314 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2324 = floor(_2258);
    float _2326 = -_2312;
    float _2328 = fma(_2326, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2318);
    float _2330 = fma(_2024, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2300);
    float _2332 = _2322 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2334 = _2288 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2336 = fma(_2328, -0.5, 0.5);
    float _2338 = _2330 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2340 = fma(_2320, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2332);
    float _2342 = log2(_2296);
    float _2344 = -_2308;
    float _2346 = _2184 + _2344;
    float _2348 = fma(_2328, 0.5, 0.5);
    float _2350 = fma(_2282, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2340);
    float _2352 = _2322 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2354 = fma(_2338, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2350);
    float _2356 = _2322 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2358 = exp2(_2334);
    float _2360 = fma(_2320, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2352);
    float _2362 = -_2324;
    float _2364 = _2258 + _2362;
    float _2366 = fma(_2348, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2368 = fma(_2320, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2356);
    float _2370 = _2342 * 0.693147182464599609375;
    float _2372 = fma(_2348, _2366, -0.212114393711090087890625);
    float _2374 = 1.0 / _2354;
    float _2376 = fma(_2282, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2360);
    float _2378 = fma(_2282, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2368);
    float _2380 = sqrt(_2336);
    float _2382 = fma(_2338, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2376);
    float _2384 = fma(_2338, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2378);
    float2 _6514 = float2(_2346, _2364);
    float _2386 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6514, float2(0.0), isnan(_6514)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6514, float2(0.0), isnan(_6514)), level(0.0)).x;
    float _2388 = fma(_2348, _2372, 1.570728778839111328125);
    float _2390 = _2382 * _2374;
    float _2392 = _2304 + 1.0;
    float _2394 = _2384 * _2374;
    float _2396 = _2370 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2398 = fma(_2390, 0.5, 0.5);
    float _2400 = -_2304;
    float _2402 = fma(_2358, _2392, _2400);
    float _2404 = fma(_2394, -0.5, 0.5);
    float _2406 = _2380 * 0.636619746685028076171875;
    float _2408 = fma(_2402, 0.5, 0.5);
    float3 _6556 = float3(_2398, _2404, _2396);
    float _2410 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6556, float3(0.0), isnan(_6556)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6556, float3(0.0), isnan(_6556)), level(0.0)).x;
    float3 _6567 = float3(_2398, _2404, _2396);
    float4 _2413 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6567, float3(0.0), isnan(_6567)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6567, float3(0.0), isnan(_6567)), level(0.0)).xyzw;
    float _2415 = _2413.x;
    float _2417 = _2413.y;
    float _2419 = _2413.z;
    float _2421 = _2413.w;
    float _2423 = -_2388;
    float _2425 = fma(_2406, _2423, 1.0);
    float2 _6588 = float2(_2425, _2408);
    float3 _2429 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6588, float2(0.0), isnan(_6588)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6588, float2(0.0), isnan(_6588)), level(0.0)).xyz;
    float _2431 = _2429.x;
    float _2433 = _2429.y;
    float _2435 = _2429.z;
    float _2437 = abs(_2028);
    float _2439 = log2(_2437);
    float _2441 = _2322 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2443 = fma(_2320, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2441);
    bool _2445 = _2208 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2447 = isnan(_2208);
    bool _2449 = _2445 || _2447;
    bool _2451 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2453 = _2449 || _2451;
    float _2455 = fma(_2282, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2443);
    float _2457 = _2288 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2459 = in.m_74.x;
    bool _2461 = _2028 <= 8000.0;
    bool _2463 = isnan(_2028);
    bool _2465 = _2461 || _2463;
    bool _2467 = isnan(8000.0);
    bool _2469 = _2465 || _2467;
    float _2471 = float(_2469);
    float _2473 = fma(_2338, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2455);
    float _2475 = _2354 * 0.5;
    float _2477 = _2439 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2479 = exp2(_2457);
    float _2481 = fma(_2384, -0.5, _2475);
    out.gl_Position.x = _2382;
    out.gl_Position.y = _2384;
    out.gl_Position.z = _2473;
    out.gl_Position.w = _2354;
    float _2483 = exp2(_2477);
    float _2485 = -_2479;
    float _2487 = _2485 + 1.0;
    float _2489 = _2384;
    float _2491 = _2473;
    float _2493 = _2354;
    if (!_2453)
    {
        _2489 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2495 = _2489;
    float _2497 = _2487 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2499 = fma(_2483, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2501 = precise::clamp(_2499, 0.0, 1.0);
    float _2503 = _2473 + _2354;
    float _2505 = _2495;
    float _2507 = _2495;
    if (!_2453)
    {
        _2491 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2509 = _2491;
    float _2511 = fma(_2501, -2.0, 3.0);
    float _2513 = _2501 * _2501;
    float _2515 = _2503 * 0.5;
    float _2517 = _2513 * _2511;
    float _2519 = -_2517;
    float _2521 = _2519 + 1.0;
    float _2523 = fma(_2521, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2517);
    float _2525 = _2382 + _2354;
    float _2527 = -_2497;
    float _2529 = _2527 + 1.0;
    float _2531 = _2471 * _2523;
    float _2533 = _2525 * 0.5;
    float _2535 = _2529;
    float _2537 = _2509;
    float _2539 = _2509;
    if (!_2453)
    {
        _2493 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2541 = _2493;
    float _2543 = _2531 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_76.x = _2533;
    out.m_76.y = _2481;
    out.m_76.z = _2515;
    out.m_76.w = _2354;
    float _2545 = -_2386;
    float _2547 = _2545 + 1.0;
    float _2549 = _2547 * _2543;
    float _2551 = precise::clamp(_2549, 0.0, 1.0);
    float _2553 = -_2551;
    float _2555 = fma(_2553, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2557 = _2555 * _2459;
    float _2559 = _2497 * _2410;
    float _2561 = _2557 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2563 = _2421 * _2529;
    float _2565 = _2557;
    float _2567 = _2541;
    float _2569 = _2541;
    if (!_2453)
    {
        _2565 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2571 = _2565;
    float _2573 = _2421 * _2559;
    float _2575 = _2573;
    float _2577 = _2571;
    float _2579 = _2571;
    if (!_2453)
    {
        _2535 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2581 = _2535;
    out.m_78.x = _2561;
    float _2583 = _2435 * _2559;
    float _2585 = fma(_2431, _2573, _2415);
    float _2587 = fma(_2433, _2573, _2417);
    float _2589 = _2078 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2591 = fma(_2421, _2583, _2419);
    float _2593 = _2581;
    float _2595 = _2581;
    if (!_2453)
    {
        _2575 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2597 = _2575;
    out.m_80.x = _2585;
    out.m_80.y = _2587;
    out.m_80.z = _2591;
    out.m_80.w = _2563;
    bool _2599 = !_2453;
    float _2601 = _2597;
    float _2603 = _2597;
    if (!_2599)
    {
        bool _2605 = _2208 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2607 = isnan(_2208);
        bool _2609 = _2605 || _2607;
        bool _2611 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2613 = _2609 || _2611;
        if (!_2613)
        {
            float _2615 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2617 = _2208 + _2615;
            float _2619 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2621 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2619;
            float _2623 = 1.0 / _2621;
            float _2625 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2627 = _2625 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2629 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2631 = _2629 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2633 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2635 = _2633 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2637 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2639 = _2637 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2641 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2643 = _2641 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2645 = _2617 * _2623;
            float _2647 = precise::clamp(_2645, 0.0, 1.0);
            float _2649 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2651 = _2649 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2653 = fma(_2647, _2627, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2655 = fma(_2647, _2651, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2657 = fma(_2647, _2631, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2659 = fma(_2647, _2635, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2661 = fma(_2647, _2639, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2663 = fma(_2647, _2643, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2579 = _2655;
            _2507 = _2661;
            _2603 = _2653;
            _2539 = _2659;
            _2569 = _2657;
            _2595 = _2663;
            _2665 = true;
        }
        else
        {
            bool _2667 = _2208 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2669 = isnan(_2208);
            bool _2671 = _2667 || _2669;
            bool _2673 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2675 = _2671 || _2673;
            if (!_2675)
            {
                _2601 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2677 = _2601;
            _2603 = _2677;
            if (!_2675)
            {
                _2577 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2679 = _2577;
            _2579 = _2679;
            if (!_2675)
            {
                _2567 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2681 = _2567;
            _2569 = _2681;
            if (!_2675)
            {
                _2537 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2683 = _2537;
            _2539 = _2683;
            if (!_2675)
            {
                _2505 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2685 = _2505;
            _2507 = _2685;
            if (!_2675)
            {
                _2593 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2687 = _2593;
            bool _2689 = !_2675;
            _2595 = _2687;
            if (!_2689)
            {
                bool _2691 = _2208 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2693 = isnan(_2208);
                bool _2695 = _2691 || _2693;
                bool _2697 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2699 = _2695 || _2697;
                if (!_2699)
                {
                    float _2701 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2703 = _2208 + _2701;
                    float _2705 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2707 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2705;
                    float _2709 = 1.0 / _2707;
                    float _2711 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2713 = _2711 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2715 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2717 = _2715 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2719 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2721 = _2719 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2723 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2725 = _2723 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2727 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2729 = _2727 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2731 = _2703 * _2709;
                    float _2733 = precise::clamp(_2731, 0.0, 1.0);
                    float _2735 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2737 = _2735 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2739 = fma(_2733, _2713, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2741 = fma(_2733, _2737, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2743 = fma(_2733, _2717, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2745 = fma(_2733, _2721, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2747 = fma(_2733, _2725, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2749 = fma(_2733, _2729, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2579 = _2741;
                    _2507 = _2747;
                    _2603 = _2739;
                    _2539 = _2745;
                    _2569 = _2743;
                    _2595 = _2749;
                    _2665 = true;
                }
                else
                {
                    _2579 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2507 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2603 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2539 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2569 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2595 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2665 = false;
    float _2751 = _2579;
    float _2753 = _2507;
    float _2755 = _2603;
    float _2757 = _2539;
    float _2759 = _2569;
    float _2761 = _2595;
    float _2763 = fma(_1800, -0.5, 0.5);
    float _2765 = precise::clamp(_2763, 0.0, 1.0);
    float _2767 = -_2751;
    float _2769 = _2767 + _2753;
    float _2771 = _2589 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2773 = -_2755;
    float _2775 = _2773 + _2757;
    float _2777 = fma(_2765, _2769, _2751);
    out.m_82.x = 0.0;
    float _2779 = -_2759;
    float _2781 = _2779 + _2761;
    float _2783 = fma(_2765, _2775, _2755);
    float _2785 = _2777 * 0.586610972881317138671875;
    out.m_55.x = _2771;
    bool _2787 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2789 = fma(_2765, _2781, _2759);
    float _2791 = fma(_2783, 0.298911988735198974609375, _2785);
    bool _2793 = _2078 > 0.0;
    bool _2795 = isnan(_2078);
    bool _2797 = _2793 || _2795;
    bool _2799 = isnan(0.0);
    bool _2801 = _2797 || _2799;
    float _2803 = fma(_2789, 0.114477999508380889892578125, _2791);
    float _2805 = -_2803;
    float _2807 = _2783 + _2805;
    float _2809 = -_2803;
    float _2811 = _2777 + _2809;
    float _2813 = -_2803;
    float _2815 = _2789 + _2813;
    float _2817 = fma(_2807, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2803);
    float _2819 = fma(_2811, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2803);
    float _2821 = fma(_2815, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2803);
    bool _2823 = !_2787;
    if (!_2823)
    {
        float _2825 = -_2020;
        float _2827 = _2825 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2829 = -_2022;
        float _2831 = _2829 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2833 = -_2024;
        float _2835 = _2833 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2837 = _2827 * _2827;
        float _2839 = fma(_2831, _2831, _2837);
        float _2841 = fma(_2835, _2835, _2839);
        float _2843 = sqrt(_2841);
        float _2845 = rsqrt(_2841);
        float _2847 = -_2843;
        float _2849 = _2847 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2851 = _2849 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2853 = precise::clamp(_2851, 0.0, 1.0);
        float _2855 = _2831 * _2845;
        float _2857 = _2827 * _2845;
        float _2859 = abs(_2853);
        float _2861 = log2(_2859);
        float _2863 = _2835 * _2845;
        float _2865 = _2855 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2867 = _1800 * _2857;
        float _2869 = -_2857;
        float _2871 = -_2865;
        float _2873 = fma(_2869, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2871);
        float _2875 = fma(_1798, _2855, _2867);
        float _2877 = -_2863;
        float _2879 = fma(_2877, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2873);
        float _2881 = fma(_1802, _2863, _2875);
        float _2883 = precise::clamp(_2881, 0.0, 1.0);
        float _2885 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2887 = _2879 + _2885;
        float _2889 = _2861 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2891 = _2887 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2893 = precise::clamp(_2891, 0.0, 1.0);
        float _2895 = exp2(_2889);
        float _2897 = _2895 * _2893;
        float _2899 = _2883 * _2897;
        float _2901 = _2899 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2903 = _2899 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2905 = _2899 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_82.x = _2901;
        out.m_82.y = _2903;
        out.m_82.z = _2905;
    }
    out.m_84.x = _2817;
    out.m_84.y = _2819;
    out.m_84.z = _2821;
    if (_2801)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_55.x = 0.0;
    float _2907 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2907;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2665 = false;
    bool _1850 = false;
    bool _295 = false;
    bool _199 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _98 = in.m_48.w;
    float _100 = in.m_50.w;
    float _102 = trunc(_98);
    int _105 = int(_102);
    float _107 = -_100;
    float _109 = _107 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.y = _109;
    bool _113 = _105 >= 1;
    float _115 = 0.0;
    float _117 = _100;
    float _119 = _109;
    if (!_113)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _115;
    if (!_113)
    {
        out.m_55.x = 0.0;
    }
    int _123 = 0;
    if (!_113)
    {
        float _125 = _121 * 5.0;
        _123 = as_type<int>(_125);
    }
    int _127 = _123;
    int _129 = _127;
    if (!_113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2975 = as_type<float>(_127);
        out.gl_Position.z = _2975;
    }
    if (!_113)
    {
        return out;
    }
    bool _131 = _100 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _133 = isnan(_100);
    bool _135 = _131 || _133;
    bool _137 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _139 = _135 || _137;
    float _141 = float(_105);
    bool _143 = _109 >= _141;
    bool _145 = !_139;
    bool _147 = _143 || _145;
    if (_147)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _149 = _117;
    if (_147)
    {
        out.m_55.x = 0.0;
    }
    if (_147)
    {
        float _151 = _149 * 5.0;
        _129 = as_type<int>(_151);
    }
    int _153 = _129;
    if (_147)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3030 = as_type<float>(_153);
        out.gl_Position.z = _3030;
    }
    if (_147)
    {
        return out;
    }
    float _155 = as_type<float>(int(gl_VertexIndex));
    float _157 = 1.0 / _141;
    bool _159 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _161 = _109 * _157;
    int _163 = as_type<int>(_155) & 1;
    bool _165 = _163 != 0;
    int _167 = as_type<int>(_155) & 2;
    bool _169 = _167 != 0;
    bool _171 = !_165;
    float _173 = _171 ? (-0.5) : 0.5;
    bool _175 = !_169;
    float _177 = _175 ? (-0.5) : 0.5;
    bool _179 = !_159;
    float _197;
    if (!_179)
    {
        float _181 = in.m_60.x;
        float _183 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _185 = _181 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _187 = fma(_185, (*spvDescriptorSet0.vp_c9)._m0[12].x, _109);
        float _189 = _187 * _183;
        float _191 = floor(_189);
        float _193 = -_191;
        float _195 = _189 + _193;
        _197 = _195;
        _199 = true;
    }
    else
    {
        _197 = _161;
    }
    _199 = false;
    float _201 = _197;
    float _203 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _205 = _201 + _203;
    bool _207 = _201 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _209 = isnan(_201);
    bool _211 = _207 || _209;
    bool _213 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _215 = _211 || _213;
    float _217 = float(_215);
    float _219 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _221 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _219;
    float _223 = -_217;
    float _225 = _223 + 1.0;
    bool _227 = _201 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _229 = isnan(_201);
    bool _231 = _227 || _229;
    bool _233 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _235 = _231 || _233;
    float _237 = float(_235);
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _241 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _239;
    bool _243 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _245 = 1.0 / _221;
    float _247 = _237 * _225;
    float _249 = -_237;
    float _251 = _249 + 1.0;
    float _253 = _205 * _245;
    float _255 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _257 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _255;
    float _259 = fma(_241, _253, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _261 = fma(_257, _253, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _263 = _259 * _247;
    float _265 = _261 * _247;
    float _267 = fma(_251, (*spvDescriptorSet0.vp_c9)._m0[143].x, _263);
    float _269 = fma(_251, (*spvDescriptorSet0.vp_c9)._m0[143].y, _265);
    float _271 = fma(_217, (*spvDescriptorSet0.vp_c9)._m0[144].x, _267);
    float _273 = fma(_217, (*spvDescriptorSet0.vp_c9)._m0[144].y, _269);
    bool _275 = !_243;
    float _293;
    if (!_275)
    {
        float _277 = in.m_60.x;
        float _279 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _281 = _277 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _283 = fma(_281, (*spvDescriptorSet0.vp_c9)._m0[11].y, _109);
        float _285 = _283 * _279;
        float _287 = floor(_285);
        float _289 = -_287;
        float _291 = _285 + _289;
        _293 = _291;
        _295 = true;
    }
    else
    {
        _293 = _161;
    }
    _295 = false;
    float _297 = _293;
    float _299 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _301 = int(_299);
    float _303 = in.m_60.x;
    float _305 = in.m_60.y;
    float _307 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _309 = int(_307);
    float _311 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _315 = _313 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _317 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _319 = log2(_317);
    float _321 = float(_301);
    float _323 = 1.0 / _321;
    float _325 = float(uint(_309));
    float _327 = _305 * 2.0;
    int _329 = ~_309;
    int _331 = _329 + 1;
    int _333 = ~_309;
    int _335 = _333 + 1;
    int _337 = ~_309;
    int _339 = _337 + 1;
    float _341 = 1.0 / _325;
    float _343 = _323 * _109;
    float _345 = 1.0 / _315;
    int _347 = as_type<int>(_341) + (-2);
    float _349 = trunc(_343);
    int _351 = int(_349);
    float _353 = floor(_327);
    float _355 = float(uint(_351));
    float _357 = as_type<float>(_347) * _355;
    float _359 = trunc(_357);
    float _361 = precise::max(_359, 0.0);
    uint _364 = uint(_361);
    int _366 = _331 * int(_364);
    int _368 = _366 + _351;
    float _370 = float(_309);
    float _372 = float(uint(_368));
    float _374 = as_type<float>(_347) * _372;
    int _376 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _378 = _376 != 0;
    float _380 = float(_351);
    float _382 = trunc(_374);
    float _384 = precise::max(_382, 0.0);
    uint _386 = uint(_384);
    bool _388 = !_378;
    float _390 = _388 ? 7.345489978790283203125 : 1.0;
    float _392 = _390 * _303;
    float _394 = floor(_392);
    int _396 = int(_364) + int(_386);
    float _398 = _370 * _109;
    bool _400 = _380 >= _370;
    bool _402 = isnan(_380);
    bool _404 = _400 || _402;
    bool _406 = isnan(_370);
    bool _408 = _404 || _406;
    float _410 = float(_408);
    float _412 = in.m_62.x;
    float _414 = in.m_62.y;
    int _416 = _335 * _396;
    int _418 = _416 + _351;
    float _420 = _398 * _157;
    bool _422 = uint(_418) >= uint(_309);
    float _424 = -_394;
    float _426 = _392 + _424;
    float _428 = trunc(_410);
    int _430 = int(_428);
    bool _432 = !_422;
    int _434 = _432 ? 0 : (-1);
    float _436 = _426 * _370;
    bool _438 = _309 == 0;
    int _440 = ~_396;
    int _442 = _440 + _434;
    int _444 = _442 + 1;
    int _446 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _448 = _446 != 0;
    int _450 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _452 = _450 != 0;
    int _454 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _456 = _454 != 0;
    float _458 = trunc(_420);
    int _460 = int(_458);
    int _462 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _464 = _462 != 0;
    int _466 = _309 * _444;
    int _468 = _466 + _351;
    int _470 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _472 = _470 != 0;
    bool _474 = !_452;
    int _476 = _474 ? 0 : 1;
    int _478 = ~_430;
    int _480 = _478 + 1;
    int _482 = _480 + 1;
    float _484 = trunc(_436);
    int _486 = int(_484);
    bool _488 = !_438;
    int _490 = _488 ? _468 : (-1);
    float _492 = _271 * _412;
    bool _494 = !_464;
    int _496 = _494 ? 0 : 1;
    int _498 = _309 + (-1);
    int _500 = _490 * _482;
    bool _502 = !_448;
    int _504 = _502 ? 0 : 1;
    int _506 = abs(_476);
    int _508 = _430 * _498;
    int _510 = _508 + _500;
    int _512 = abs(_504);
    int _514 = abs(_496);
    int _516 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _518 = _516 != 0;
    int _520 = _486 * _514;
    int _522 = _520 + _351;
    bool _524 = !_456;
    int _526 = _524 ? 0 : 1;
    int _528 = _510 * _506;
    int _530 = abs(_526);
    int _532 = _460 * _512;
    int _534 = _532 + _528;
    bool _536 = !_518;
    int _538 = _536 ? 0 : 1;
    float _540 = in.m_48.x;
    float _542 = in.m_48.y;
    float _544 = in.m_48.z;
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _548 = _546 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    int _550 = _522 * _530;
    int _552 = _550 + _534;
    int _554 = abs(_538);
    float _556 = _303 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _558 = 1.0 / _548;
    int _560 = _486 * _554;
    int _562 = _560 + _552;
    float _564 = _303 * 2.0;
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _568 = _566 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _570 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _572 = isnan(0.0);
    bool _574 = _570 || _572;
    bool _576 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _578 = _574 || _576;
    float _580 = _319 * _109;
    float _582 = _305 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _584 = floor(_564);
    float _586 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _588 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _590 = _588 != 0;
    float _592 = fma(_582, -2.0, _311);
    float _594 = -_586;
    float _596 = fma(_556, 2.0, _594);
    float _598 = _542 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _600 = _542 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _602 = _542 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _604 = float(uint(_562));
    float _606 = exp2(_580);
    float _608 = fma(_540, (*spvDescriptorSet0.vp_c10)._m0[4].x, _598);
    float _610 = fma(_540, (*spvDescriptorSet0.vp_c10)._m0[5].x, _600);
    float _612 = fma(_540, (*spvDescriptorSet0.vp_c10)._m0[6].x, _602);
    float _614 = as_type<float>(_347) * _604;
    float _616 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _618 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _616;
    float _620 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _622 = _620 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    bool _624 = _584 > 0.0;
    float _626 = trunc(_614);
    float _628 = precise::max(_626, 0.0);
    uint _630 = uint(_628);
    float _632 = _618 * _345;
    float _634 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _636 = _634 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    int _638 = ~_309;
    int _640 = _638 + 1;
    float _642 = _622 * _558;
    float _644 = -_109;
    float _646 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[76].x, _596);
    float _648 = 1.0 / _636;
    float _650 = -_606;
    float _652 = _650 + 1.0;
    bool _654 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _656 = isnan(1.0);
    bool _658 = _654 || _656;
    bool _660 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _662 = _658 || _660;
    float _664 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _666 = 1.0 + _664;
    float _668 = _578 ? _652 : 0.0;
    float _670 = 1.0 / _568;
    int _672 = _640 * int(_630);
    int _674 = _672 + _562;
    bool _676 = _584 >= 0.0;
    bool _678 = isnan(_584);
    bool _680 = _676 || _678;
    bool _682 = isnan(0.0);
    bool _684 = _680 || _682;
    float _686 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _688 = in.m_60.z;
    float _690 = _305 + _303;
    float _692 = float(uint(_674));
    float _694 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[78].z, _686);
    float _696 = 1.0 / _666;
    float _698 = _690 + (-1.0);
    float _700 = fma(_109, (*spvDescriptorSet0.vp_c9)._m0[77].z, _694);
    int _702 = _684 ? 0 : 1;
    float _704 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _706 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _704;
    bool _708 = _353 >= 0.0;
    bool _710 = isnan(_353);
    bool _712 = _708 || _710;
    bool _714 = isnan(0.0);
    bool _716 = _712 || _714;
    float _718 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _720 = _718 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _722 = as_type<float>(_347) * _692;
    float _724 = _706 * _670;
    float _726 = fma(_109, (*spvDescriptorSet0.vp_c9)._m0[76].y, _592);
    float _728 = _720 * _648;
    float _730 = trunc(_722);
    float _732 = precise::max(_730, 0.0);
    uint _734 = uint(_732);
    float _736 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _738 = _716 ? 0 : 1;
    float _740 = -_700;
    float _742 = _740 + 1.0;
    float _744 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[78].w, _736);
    float _746 = fma(_109, (*spvDescriptorSet0.vp_c9)._m0[77].w, _744);
    if (_662)
    {
        float _748 = _668 * _696;
        _119 = _748;
    }
    float _750 = _119;
    bool _752 = _303 > 0.5;
    float _754 = fma(_698, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _756 = _688 * 2.0;
    int _758 = ~_309;
    int _760 = _758 + 1;
    float _762 = -_746;
    float _764 = _762 + 1.0;
    int _766 = int(_630) + int(_734);
    float _768 = float(uint(_522));
    float _770 = floor(_756);
    float _772 = -_173;
    int _774 = _752 ? as_type<int>(_772) : as_type<int>(_173);
    bool _776 = _353 > 0.0;
    float _778 = as_type<float>(_347) * _768;
    int _780 = ~_702;
    int _782 = _780 + 1;
    int _784 = _782 + 1;
    int _786 = _760 * _766;
    int _788 = _786 + _562;
    int _790 = _784;
    if (!_624)
    {
        int _792 = ~_702;
        int _794 = _792 + 1;
        _790 = _794;
    }
    int _796 = _790;
    float _798 = _305 + _688;
    bool _800 = _305 > 0.5;
    float _802 = trunc(_778);
    float _804 = precise::max(_802, 0.0);
    uint _806 = uint(_804);
    int _808 = ~_738;
    int _810 = _808 + 1;
    int _812 = _810 + 1;
    float _814 = _798 + (-1.0);
    float _816 = -_177;
    int _818 = _800 ? as_type<int>(_816) : as_type<int>(_177);
    bool _820 = uint(_788) >= uint(_309);
    float _822 = fma(_814, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _824 = _812;
    if (!_776)
    {
        int _826 = ~_738;
        int _828 = _826 + 1;
        _824 = _828;
    }
    int _830 = _824;
    bool _832 = !_590;
    float _834 = _832 ? _173 : as_type<float>(_774);
    bool _836 = !_472;
    float _838 = _836 ? _177 : as_type<float>(_818);
    float _840 = fma(_544, (*spvDescriptorSet0.vp_c10)._m0[4].z, _608);
    int _842 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _844 = _842 != 0;
    int _846 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _848 = _846 != 0;
    int _850 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _852 = _850 != 0;
    float _854 = fma(_544, (*spvDescriptorSet0.vp_c10)._m0[5].z, _610);
    bool _856 = !_820;
    int _858 = _856 ? 0 : (-1);
    int _860 = _339 * int(_806);
    int _862 = _860 + _522;
    bool _864 = _770 > 0.0;
    float _866 = _854 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _868 = _770 >= 0.0;
    bool _870 = isnan(_770);
    bool _872 = _868 || _870;
    bool _874 = isnan(0.0);
    bool _876 = _872 || _874;
    float _878 = fma(_544, (*spvDescriptorSet0.vp_c10)._m0[6].z, _612);
    float _880 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _882 = _297 + _880;
    bool _884 = _297 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _886 = isnan(_297);
    bool _888 = _884 || _886;
    bool _890 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _892 = _888 || _890;
    float _894 = float(_892);
    int _896 = ~_766;
    int _898 = _896 + _858;
    int _900 = _898 + 1;
    float _902 = fma(_632, _882, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _904 = _297 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _906 = isnan(_297);
    bool _908 = _904 || _906;
    bool _910 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _912 = _908 || _910;
    float _914 = float(_912);
    float _916 = -_894;
    float _918 = _916 + 1.0;
    float _920 = float(uint(_862));
    int _922 = _309 * _900;
    int _924 = _922 + _562;
    bool _926 = _297 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _928 = isnan(_297);
    bool _930 = _926 || _928;
    bool _932 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _934 = _930 || _932;
    float _936 = float(_934);
    float _938 = _914 * _918;
    bool _940 = _297 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _942 = isnan(_297);
    bool _944 = _940 || _942;
    bool _946 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _948 = _944 || _946;
    float _950 = float(_948);
    float _952 = as_type<float>(_347) * _920;
    bool _954 = !_438;
    int _956 = _954 ? _924 : (-1);
    float _958 = -_914;
    float _960 = _958 + 1.0;
    bool _962 = _297 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _964 = isnan(_297);
    bool _966 = _962 || _964;
    bool _968 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _970 = _966 || _968;
    float _972 = float(_970);
    int _974 = _956 >> 31;
    float _976 = trunc(_952);
    float _978 = precise::max(_976, 0.0);
    uint _980 = uint(_978);
    int _982 = _956 & 3;
    bool _984 = _982 != 0;
    float _986 = _972 * _960;
    float _988 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _990 = _297 + _988;
    int _992 = _974 & 3;
    float _994 = -_972;
    float _996 = _994 + 1.0;
    float _998 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1000 = _297 + _998;
    float _1002 = fma(_642, _990, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    int _1004 = _956 + _992;
    float _1006 = _936 * _996;
    float _1008 = -_936;
    float _1010 = _1008 + 1.0;
    float _1012 = fma(_724, _1000, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    int _1014 = _1004 >> 2;
    float _1016 = _834 + 0.5;
    float _1018 = _950 * _1010;
    float _1020 = _838 + (-0.5);
    int _1022 = _1014 << 4;
    int _1024 = _1022 + 368;
    float _1026 = fma(_1016, (*spvDescriptorSet0.vp_c9)._m0[80].x, _646);
    int _1028 = int(_806) + int(_980);
    float _1030 = -_1020;
    float _1032 = -_726;
    float _1034 = fma(_1030, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1032);
    int _1036 = ~_309;
    int _1038 = _1036 + 1;
    uint _1040 = uint(int(uint(_1024) >> uint(2)));
    uint _1042 = uint(int(uint(int(_1040)) >> uint(2)));
    int _1044 = int(_1040) & 3;
    float _1046 = (*spvDescriptorSet0.vp_c9)._m0[int(_1042)][_1044];
    int _1048 = int(_1040) + 1;
    uint _1050 = uint(int(uint(_1048) >> uint(2)));
    int _1052 = _1048 & 3;
    float _1054 = (*spvDescriptorSet0.vp_c9)._m0[int(_1050)][_1052];
    float _1056 = -_742;
    float _1058 = fma(_834, _1056, _1026);
    float _1060 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1062 = _297 + _1060;
    int _1064 = _876 ? 0 : 1;
    float _1066 = _902 * _1018;
    float _1068 = -_950;
    float _1070 = _1068 + 1.0;
    int _1072 = _956 & 3;
    bool _1074 = _1072 != 0;
    float _1076 = fma(_728, _1062, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    int _1078 = ~_1064;
    int _1080 = _1078 + 1;
    int _1082 = _1080 + 1;
    float _1084 = fma(_1070, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1066);
    int _1086 = _1082;
    if (!_864)
    {
        int _1088 = ~_1064;
        int _1090 = _1088 + 1;
        _1086 = _1090;
    }
    int _1092 = _1086;
    int _1094 = _1038 * _1028;
    int _1096 = _1094 + _522;
    bool _1098 = !_844;
    int _1100 = _1098 ? 0 : 1;
    float _1102 = fma(_1002, _1006, _1084);
    int _1104 = _984 ? 0 : 1;
    float _1106 = fma(_838, _764, _1034);
    bool _1108 = uint(_1072) > 1u;
    bool _1110 = uint(_1096) >= uint(_309);
    int _1112 = abs(_1100);
    out.m_64.x = _1058;
    out.m_64.y = _1106;
    int _1114 = _1024 + 8;
    uint _1116 = uint(int(uint(_1114) >> uint(2)));
    uint _1118 = uint(int(uint(int(_1116)) >> uint(2)));
    int _1120 = int(_1116) & 3;
    float _1122 = (*spvDescriptorSet0.vp_c9)._m0[int(_1118)][_1120];
    int _1124 = int(_1116) + 1;
    uint _1126 = uint(int(uint(_1124) >> uint(2)));
    int _1128 = _1124 & 3;
    float _1130 = (*spvDescriptorSet0.vp_c9)._m0[int(_1126)][_1128];
    bool _1132 = !_848;
    int _1134 = _1132 ? 0 : 1;
    int _1136 = ~_1104;
    int _1138 = _1136 + 1;
    int _1140 = _1138 + 1;
    int _1142 = abs(_1134);
    int _1144 = _1140;
    if (!_1108)
    {
        int _1146 = ~_1104;
        int _1148 = _1146 + 1;
        _1144 = _1148;
    }
    int _1150 = _1144;
    float _1152 = float(_796);
    float _1154 = float(_1142);
    float _1156 = fma(_1012, _986, _1102);
    bool _1158 = uint(_1072) >= 2u;
    int _1160 = abs(_1150);
    float _1162 = _1154 * _1152;
    int _1164 = _1158 ? 0 : 1;
    float _1166 = fma(_1076, _938, _1156);
    bool _1168 = _1072 != 3;
    int _1170 = ~_1160;
    int _1172 = _1170 + 1;
    int _1174 = _1172 + 1;
    float _1176 = float(_1112);
    float _1178 = float(_1092);
    int _1180 = _1174 * as_type<int>(_1054);
    int _1182 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1184 = _1182 != 0;
    bool _1186 = !_1110;
    int _1188 = _1186 ? 0 : (-1);
    float _1190 = _1176 * _1178;
    bool _1192 = !_1074;
    int _1194 = _1192 ? 0 : 1;
    bool _1196 = _1072 != 3;
    float _1198 = _1190 * (-2.0);
    bool _1200 = !_1184;
    int _1202 = _1200 ? 0 : 1;
    int _1204 = ~_1164;
    int _1206 = _1204 + 1;
    int _1208 = _1206 + 1;
    int _1210 = _1208;
    if (_1168)
    {
        int _1212 = ~_1164;
        int _1214 = _1212 + 1;
        _1210 = _1214;
    }
    int _1216 = _1210;
    int _1218 = abs(_1194);
    float _1220 = in.m_66.x;
    float _1222 = in.m_66.y;
    float _1224 = in.m_66.z;
    int _1226 = ~_1028;
    int _1228 = _1226 + _1188;
    int _1230 = _1228 + 1;
    float _1232 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1234 = _866 + _1232;
    int _1236 = abs(_1202);
    float _1238 = _840 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _1240 = !_1196;
    int _1242 = _1240 ? 0 : (-1);
    float _1244 = _878 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1246 = abs(_1216);
    float _1248 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1250 = _1238 + _1248;
    int _1252 = abs(_1242);
    float _1254 = _1234 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1256 = ~_1218;
    int _1258 = _1256 + 1;
    int _1260 = _1258 + 1;
    int _1262 = _309 * _1230;
    int _1264 = _1262 + _522;
    float _1266 = fma(_1250, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1254);
    float _1268 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1270 = _1244 + _1268;
    int _1272 = _1260 * as_type<int>(_1046);
    int _1274 = _1272 + _1180;
    int _1276 = ~_1246;
    int _1278 = _1276 + 1;
    int _1280 = _1278 + 1;
    int _1282 = ~_1252;
    int _1284 = _1282 + 1;
    int _1286 = _1284 + 1;
    float _1288 = fma(_1270, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1266);
    int _1290 = _1280 * as_type<int>(_1122);
    int _1292 = _1290 + _1274;
    float _1294 = _1162 * (-2.0);
    int _1296 = ~_1236;
    int _1298 = _1296 + 1;
    int _1300 = _1298 + 1;
    int _1302 = _1286 * as_type<int>(_1130);
    int _1304 = _1302 + _1292;
    float _1306 = _1234 * _1234;
    float _1308 = fma(_894, (*spvDescriptorSet0.vp_c9)._m0[119].x, _1166);
    bool _1310 = _1288 >= 0.0;
    int _1312 = _1304 * _1300;
    float _1314 = fma(_1250, _1250, _1306);
    bool _1316 = !_438;
    int _1318 = _1316 ? _1264 : (-1);
    float _1320 = fma(_1198, _1220, _1220);
    float _1322 = fma(_822, _1294, _822);
    float _1324 = fma(_1270, _1270, _1314);
    float _1326 = fma(_1294, _1222, _1222);
    float _1328 = fma(_754, _1198, _754);
    int _1330 = _1318 * _1236;
    int _1332 = _1330 + _1312;
    float _1334 = rsqrt(_1324);
    float _1336 = _303 + (-0.5);
    float _1338 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1340 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1342 = (*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1344 = _1224;
    if (_1310)
    {
        _1342 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1346 = _1342;
    float _1348 = fma(_1336, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1320);
    float _1350 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1352 = _492 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1354 = _1338 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1356 = _1340 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1358 = _1350 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1360 = _1308 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _1362 = as_type<int>(_1346);
    if (_1310)
    {
        float _1364 = _1346 * 5.0;
        _1362 = as_type<int>(_1364);
    }
    int _1366 = _1362;
    float _1368 = float(_1332);
    float _1370 = _1352 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    bool _1372 = !_852;
    int _1374 = _1372 ? 0 : 1;
    out.m_68.x = _1358;
    out.m_68.y = _1354;
    out.m_68.z = _1356;
    out.m_68.w = _1360;
    float _1376 = fma(_1328, _750, _1348);
    float _1378 = _1370 * _1334;
    float _1380 = _305 + (-0.5);
    if (_1310)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4835 = as_type<float>(_1366);
        out.gl_Position.z = _4835;
    }
    int _1382 = abs(_1374);
    float _1384 = _1250 * _1378;
    float _1386 = _1234 * _1378;
    out.m_70.x = _1368;
    if (_1310)
    {
        out.m_55.x = 0.0;
    }
    if (_1310)
    {
        return out;
    }
    float _1388 = -_1386;
    float _1390 = _866 + _1388;
    float _1392 = _1270 * _1378;
    float _1394 = -_1384;
    float _1396 = _1238 + _1394;
    float _1398 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1400 = _1390 + _1398;
    float _1402 = float(_830);
    float _1404 = -_1392;
    float _1406 = _1244 + _1404;
    float _1408 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1410 = _1396 + _1408;
    float _1412 = _1400 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1414 = float(_1382);
    float _1416 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1418 = _1406 + _1416;
    float _1420 = -_1386;
    float _1422 = _1234 + _1420;
    float _1424 = fma(_1410, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1412);
    float _1426 = -_1384;
    float _1428 = _1250 + _1426;
    float _1430 = fma(_1380, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1326);
    float _1432 = _1422 * _1422;
    float _1434 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1424);
    float _1436 = _688 + _303;
    float _1438 = _1376 * 0.15915493667125701904296875;
    float _1440 = _1414 * _1402;
    float _1442 = fma(_1428, _1428, _1432);
    bool _1444 = _1434 >= 0.0;
    float _1446 = fma(_1322, _750, _1430);
    float _1448 = _1436 + (-1.0);
    float _1450 = _1440 * (-2.0);
    float _1452 = -_1392;
    float _1454 = _1270 + _1452;
    float _1456 = _1446 * 0.15915493667125701904296875;
    float _1458 = fma(_1448, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1460 = _688 + (-0.5);
    float _1462 = fma(_1450, _1224, _1224);
    float _1464 = fma(_1454, _1454, _1442);
    float _1466 = _1456 * 6.283185482025146484375;
    float _1468 = sin(_1466);
    float _1470 = fma(_1458, _1450, _1458);
    if (_1444)
    {
        _1344 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1472 = _1344;
    float _1474 = fma(_1460, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1462);
    int _1476 = as_type<int>(_1472);
    if (_1444)
    {
        out.m_55.x = 0.0;
    }
    if (_1444)
    {
        float _1478 = _1472 * 5.0;
        _1476 = as_type<int>(_1478);
    }
    int _1480 = _1476;
    float _1482 = _1438 * 6.283185482025146484375;
    float _1484 = sin(_1482);
    float _1486 = fma(_1470, _750, _1474);
    if (_1444)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5020 = as_type<float>(_1480);
        out.gl_Position.z = _5020;
    }
    float _1488 = _1486 * 0.15915493667125701904296875;
    float _1490 = _1438 * 6.283185482025146484375;
    float _1492 = cos(_1490);
    float _1494 = sqrt(_1464);
    float _1496 = _1456 * 6.283185482025146484375;
    float _1498 = cos(_1496);
    if (_1444)
    {
        return out;
    }
    float _1500 = _1488 * 6.283185482025146484375;
    float _1502 = cos(_1500);
    float _1504 = _273 * _414;
    float _1506 = _1334 * _1494;
    float _1508 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _177);
    float _1510 = _1484 * _1468;
    float _1512 = _1504 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1514 = _1492 * _1498;
    float _1516 = _1492 * _1468;
    float _1518 = _1488 * 6.283185482025146484375;
    float _1520 = sin(_1518);
    float _1522 = _1512 * _1506;
    float _1524 = _1484 * _1498;
    float _1526 = _1508 * _1522;
    float _1528 = _1352 * _1506;
    float _1530 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _173);
    float _1532 = _1492 * _1502;
    float _1534 = _1498 * _1502;
    float _1536 = _1484 * _1502;
    float _1538 = _1530 * _1528;
    float _1540 = _1532 * _1526;
    float _1542 = _1468 * _1502;
    float _1544 = _1506 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1546 = _1544 * 0.5;
    float _1548 = fma(_1520, _1514, _1510);
    float _1550 = -_1526;
    float _1552 = _1520 * _1550;
    float _1554 = -_1524;
    float _1556 = fma(_1520, _1516, _1554);
    float _1558 = -_1516;
    float _1560 = fma(_1520, _1524, _1558);
    float _1562 = fma(_1548, _1538, _1540);
    float _1564 = _1536 * _1526;
    float _1566 = fma(_1534, _1538, _1552);
    float _1568 = fma(_1520, _1510, _1514);
    float _1570 = fma(_1556, _1546, _1562);
    float _1572 = fma(_1560, _1538, _1564);
    float _1574 = fma(_1542, _1546, _1566);
    float _1576 = _1548 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1578 = _1570 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1580 = _1570 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1582 = fma(_1568, _1546, _1572);
    float _1584 = _1570 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1586 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1578);
    float _1588 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1580);
    float _1590 = _1548 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1592 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1584);
    float _1594 = fma(_1582, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1586);
    float _1596 = fma(_1582, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1588);
    float _1598 = _1548 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1600 = fma(_1582, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1592);
    float _1602 = _1594 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1604 = _1596 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1606 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1576);
    float _1608 = _1600 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1610 = _1238 + _1602;
    float _1612 = _1244 + _1604;
    float _1614 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1590);
    float _1616 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1598);
    float _1618 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1620 = _1610 + _1618;
    float _1622 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1624 = _1612 + _1622;
    float _1626 = _1532 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1628 = _1532 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1630 = _1620 * _1620;
    float _1632 = _1624 * _1624;
    float _1634 = _1532 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1636 = _1556 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1638 = _1556 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1640 = _1630 + _1632;
    float _1642 = _866 + _1608;
    float _1644 = _1556 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1646 = -_1520;
    float _1648 = fma(_1646, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1626);
    float _1650 = sqrt(_1640);
    float _1652 = -_1520;
    float _1654 = fma(_1652, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1628);
    float _1656 = -_1520;
    float _1658 = fma(_1656, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1634);
    float _1660 = fma(_1560, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1606);
    float _1662 = fma(_1560, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1614);
    float _1664 = fma(_1542, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1636);
    float _1666 = fma(_1542, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1638);
    float _1668 = fma(_1560, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1616);
    float _1670 = fma(_1542, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1644);
    bool _1672 = _1650 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1674 = _1556;
    float _1676 = _1610;
    float _1678 = _1636;
    float _1680 = _1612;
    float _1682 = _1630;
    if (!_1672)
    {
        _1674 = _1610;
    }
    float _1684 = _1674;
    float _1686 = _1684;
    if (!_1672)
    {
        _1676 = _1612;
    }
    float _1688 = _1676;
    float _1690 = _1688;
    if (!_1672)
    {
        _1678 = _1632;
    }
    float _1692 = _1678;
    float _1694 = _1692;
    if (!_1672)
    {
        _1680 = _1642;
    }
    float _1696 = _1680;
    bool _1698 = !_1672;
    float _1700 = _1696;
    if (!_1698)
    {
        float _1702 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1704 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1706 = _1650 + _1704;
        float _1708 = rsqrt(_1640);
        float _1710 = _1706 * _1702;
        float _1712 = _1642 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1714 = _1710 * 0.15915493667125701904296875;
        float _1716 = _1714 * 6.283185482025146484375;
        float _1718 = sin(_1716);
        float _1720 = _1714 * 6.283185482025146484375;
        float _1722 = cos(_1720);
        float _1724 = fma(_1718, _1712, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1726 = _1708 * _1724;
        float _1728 = fma(_1620, _1726, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1730 = _1722 + (-1.0);
        float _1732 = fma(_1624, _1726, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1734 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1736 = _1728 + _1734;
        float _1738 = _1730 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1740 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1742 = _1732 + _1740;
        float _1744 = _1736 * _1736;
        float _1746 = fma(_1642, _1722, _1738);
        float _1748 = _1742 * _1742;
        _1700 = _1746;
        _1682 = _1744;
        _1694 = _1748;
        _1686 = _1728;
        _1690 = _1732;
    }
    float _1750 = _1700;
    float _1752 = _1682;
    float _1754 = _1694;
    float _1756 = _1686;
    float _1758 = _1690;
    float _1760 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1762 = _1750 + _1760;
    float _1764 = fma(_1536, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1648);
    float _1766 = fma(_1536, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1654);
    float _1768 = _177 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1770 = fma(_1762, _1762, _1752);
    float _1772 = fma(_1536, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1658);
    float _1774 = _173 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1776 = _1768 * _1764;
    float _1778 = _1770 + _1754;
    float _1780 = _1768 * _1766;
    float _1782 = _1768 * _1772;
    float _1784 = fma(_1568, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1664);
    float _1786 = fma(_1568, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1666);
    float _1788 = fma(_1568, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1670);
    float _1790 = sqrt(_1778);
    float _1792 = fma(_1774, _1660, _1776);
    float _1794 = fma(_1774, _1662, _1780);
    float _1796 = fma(_1774, _1668, _1782);
    float _1798 = _1784 + _1792;
    float _1800 = _1786 + _1794;
    float _1802 = _1788 + _1796;
    out.m_72.x = _1798;
    out.m_72.y = _1800;
    out.m_72.z = _1802;
    bool _1804 = _1790 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1806 = isnan(_1790);
    bool _1808 = _1804 || _1806;
    bool _1810 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1812 = _1808 || _1810;
    float _1814 = _1772;
    if (!_1812)
    {
        _1814 = 1.0;
    }
    float _1816 = _1814;
    bool _1818 = !_1812;
    float _1820 = _1816;
    if (!_1818)
    {
        bool _1822 = _1790 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1824 = isnan(_1790);
        bool _1826 = _1822 || _1824;
        bool _1828 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1830 = _1826 || _1828;
        if (!_1830)
        {
            float _1832 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1834 = _1790 + _1832;
            float _1836 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1838 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1836;
            float _1840 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1842 = _1840 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1844 = 1.0 / _1838;
            float _1846 = _1834 * _1844;
            float _1848 = fma(_1846, _1842, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1820 = _1848;
            _1850 = true;
        }
        else
        {
            bool _1852 = _1790 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1854 = isnan(_1790);
            bool _1856 = _1852 || _1854;
            bool _1858 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1860 = _1856 || _1858;
            if (!_1860)
            {
                float _1862 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1864 = _1790 + _1862;
                float _1866 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1868 = _1866 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1870 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1872 = _1870 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1874 = 1.0 / _1868;
                float _1876 = _1864 * _1874;
                float _1878 = fma(_1876, _1872, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1820 = _1878;
                _1850 = true;
            }
            else
            {
                _1820 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1850 = false;
    float _1880 = _1820;
    float _1882 = _1390 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1884 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1886 = _1756 + _1884;
    float _1888 = fma(_1396, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1882);
    float _1890 = _1390 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1892 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1894 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1896 = _1892 || _1894;
    bool _1898 = isnan(0.5);
    bool _1900 = _1896 || _1898;
    float _1902 = fma(_1406, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1888);
    float _1904 = _1902 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1906 = fma(_1396, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1890);
    bool _1908 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1910 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1912 = _1908 || _1910;
    bool _1914 = isnan(0.5);
    bool _1916 = _1912 || _1914;
    float _1918 = fma(_1886, _1880, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1920 = 1.0 / _1904;
    float _1922 = fma(_1406, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1906);
    float _1924 = _1922 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1926 = _1924 + _1904;
    float _1928 = _1886;
    if (_1916)
    {
        _1928 = 1.0;
    }
    float _1930 = _1928;
    float _1932 = _1926 * _1920;
    float _1934 = _1932 * 0.5;
    float _1936 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1938 = _1750 + _1936;
    float _1940 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1942 = fma(_1934, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1940);
    float _1944 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1946 = _1758 + _1944;
    float _1948 = fma(_1938, _1880, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1950 = -_1384;
    float _1952 = _1950 + _1918;
    float _1954 = fma(_1946, _1880, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1956 = 1.0 / _1942;
    float _1958 = -_1386;
    float _1960 = _1958 + _1948;
    float _1962 = -_1392;
    float _1964 = _1962 + _1954;
    float _1966 = _1960;
    float _1968 = _1952;
    float _1970 = _1964;
    float _1972 = _1930;
    float _1974 = _1956;
    if (!_1900)
    {
        float _1976 = _1400 * _1400;
        float _1978 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1980 = -_1244;
        float _1982 = _1980 + _1954;
        float _1984 = -_866;
        float _1986 = _1984 + _1948;
        float _1988 = fma(_1410, _1410, _1976);
        float _1990 = -_1238;
        float _1992 = _1990 + _1918;
        float _1994 = fma(_1418, _1418, _1988);
        float _1996 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1998 = sqrt(_1994);
        float _2000 = 1.0 / _1506;
        float _2002 = _1996 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2004 = precise::min(_1998, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2006 = _2004 * _1978;
        float _2008 = _2006 * _2000;
        float _2010 = _2002 * _2008;
        float _2012 = _1982 * _2008;
        float _2014 = fma(_1986, _2010, _1390);
        float _2016 = fma(_1992, _2010, _1396);
        float _2018 = fma(_2002, _2012, _1406);
        _1966 = _2014;
        _1968 = _2016;
        _1970 = _2018;
    }
    float _2020 = _1966;
    float _2022 = _1968;
    float _2024 = _1970;
    float _2026 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2028 = _1956 * _2026;
    if (!_1916)
    {
        float _2030 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2032 = _2030 * 0.15915493667125701904296875;
        float _2034 = _2032 * 6.283185482025146484375;
        float _2036 = cos(_2034);
        float _2038 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2040 = _2038 * 0.15915493667125701904296875;
        float _2042 = _2032 * 6.283185482025146484375;
        float _2044 = sin(_2042);
        float _2046 = 1.0 / _2036;
        float _2048 = _2040 * 6.283185482025146484375;
        float _2050 = cos(_2048);
        float _2052 = _2044 * _2046;
        float _2054 = _2040 * 6.283185482025146484375;
        float _2056 = sin(_2054);
        float _2058 = _2050 * _2052;
        float _2060 = 1.0 / _2058;
        float _2062 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2064 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2062;
        float _2066 = 1.0 / _2064;
        float _2068 = _2056 * _2060;
        float _2070 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2072 = fma(_2028, _2068, _2070);
        float _2074 = _2072 * _2066;
        float _2076 = precise::clamp(_2074, 0.0, 1.0);
        _1972 = _2076;
    }
    float _2078 = _1972;
    float _2080 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2082 = _2020 + _2080;
    float _2084 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2086 = _2022 + _2084;
    float _2088 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2090 = _2024 + _2088;
    float _2092 = _2082 * _2082;
    float _2094 = fma(_2086, _2086, _2092);
    float _2096 = fma(_2090, _2090, _2094);
    float _2098 = rsqrt(_2096);
    float _2100 = _2098 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2102 = _2086 * _2100;
    float _2104 = _2090 * _2100;
    float _2106 = _2102 * _2102;
    float _2108 = _2104 * _2104;
    float _2110 = _2106 + _2108;
    float _2112 = sqrt(_2110);
    bool _2114 = _2112 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2116 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2118 = _2112 + _2116;
    float _2120 = _2094;
    float _2122 = _2118;
    float _2124 = _2082;
    float _2126 = _2100;
    float _2128 = _2110;
    if (_2114)
    {
        float _2130 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2120 = _2130;
    }
    float _2132 = _2120;
    float _2134 = _2132;
    if (_2114)
    {
        float _2136 = _2118 * _2132;
        _2122 = _2136;
    }
    float _2138 = _2122;
    if (_2114)
    {
        float _2140 = rsqrt(_2110);
        _2134 = _2140;
    }
    float _2142 = _2134;
    float _2144 = _2142;
    if (_2114)
    {
        float _2146 = _2138 * 0.15915493667125701904296875;
        _1974 = _2146;
    }
    float _2148 = _1974;
    float _2150 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2152 = _2090;
    float _2154 = _2148;
    if (_2114)
    {
        float _2156 = _2148 * 6.283185482025146484375;
        float _2158 = sin(_2156);
        _2152 = _2158;
    }
    float _2160 = _2152;
    float _2162 = precise::max(0.0, _2150);
    float _2164 = _2098;
    if (_2114)
    {
        float _2166 = _2148 * 6.283185482025146484375;
        float _2168 = cos(_2166);
        _2164 = _2168;
    }
    float _2170 = _2164;
    float _2172 = -_2100;
    float _2174 = -_2162;
    float _2176 = fma(_2082, _2172, _2174);
    float _2178 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_2114)
    {
        float _2180 = _2176 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2124 = _2180;
    }
    float _2182 = _2124;
    float _2184 = fma(_1396, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2186 = _2160;
    float _2188 = _2182;
    if (_2114)
    {
        float _2190 = fma(_2160, _2182, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2186 = _2190;
    }
    float _2192 = _2186;
    if (!_2114)
    {
        _2154 = _2102;
    }
    float _2194 = _2154;
    float _2196 = _2194;
    if (!_2114)
    {
        _2188 = _2104;
    }
    float _2198 = _2188;
    float _2200 = _2198;
    if (_2114)
    {
        float _2202 = _2142 * _2192;
        _2126 = _2202;
    }
    float _2204 = _2126;
    if (!_2114)
    {
        _2144 = _2176;
    }
    float _2206 = _2144;
    float _2208 = sqrt(_2096);
    float _2210 = _2206;
    float _2212 = _2170;
    if (_2114)
    {
        float _2214 = _2170 + (-1.0);
        _2178 = _2214;
    }
    float _2216 = _2178;
    float _2218 = _2216;
    if (_2114)
    {
        float _2220 = _2102 * _2204;
        _2196 = _2220;
    }
    float _2222 = _2196;
    if (_2114)
    {
        float _2224 = _2104 * _2204;
        _2200 = _2224;
    }
    float _2226 = _2200;
    if (_2114)
    {
        float _2228 = _2216 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2128 = _2228;
    }
    float _2230 = _2128;
    if (!_2114)
    {
        _2218 = _2106;
    }
    float _2232 = _2218;
    float _2234 = _2232;
    if (_2114)
    {
        float _2236 = _2222 * _2222;
        _2234 = _2236;
    }
    float _2238 = _2234;
    if (_2114)
    {
        float _2240 = fma(_2176, _2170, _2230);
        _2210 = _2240;
    }
    float _2242 = _2210;
    if (!_2114)
    {
        _2212 = _2108;
    }
    float _2244 = _2212;
    float _2246 = _2244;
    if (_2114)
    {
        float _2248 = _2226 * _2226;
        _2246 = _2248;
    }
    float _2250 = _2246;
    float _2252 = fma(_2242, _2242, _2238);
    float _2254 = _2020 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2256 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2258 = fma(_1406, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2260 = _2252 + _2250;
    float _2262 = fma(_2022, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2254);
    float _2264 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2266 = fma(_2208, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2264);
    float _2268 = precise::clamp(_2266, 0.0, 1.0);
    float _2270 = _2020 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2272 = rsqrt(_2260);
    float _2274 = fma(_2024, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2262);
    float _2276 = -_2268;
    float _2278 = _2276 + 1.0;
    float _2280 = fma(_2022, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2270);
    float _2282 = _2274 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2284 = fma(_2024, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2280);
    float _2286 = abs(_2278);
    float _2288 = log2(_2286);
    float _2290 = _2282 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2292 = _2020 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2294 = -_2290;
    float _2296 = fma(_2294, _2256, 1.0);
    float _2298 = _2020 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2300 = fma(_2022, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2292);
    float _2302 = _2272 * _2222;
    float _2304 = _2272 * _2242;
    float _2306 = fma(_2022, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2298);
    float _2308 = floor(_2184);
    float _2310 = _2302 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2312 = _2272 * _2226;
    float _2314 = fma(_2024, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2306);
    float _2316 = -_2310;
    float _2318 = fma(_2304, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2316);
    float _2320 = _2284 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2322 = _2314 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2324 = floor(_2258);
    float _2326 = -_2312;
    float _2328 = fma(_2326, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2318);
    float _2330 = fma(_2024, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2300);
    float _2332 = _2322 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2334 = _2288 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2336 = fma(_2328, -0.5, 0.5);
    float _2338 = _2330 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2340 = fma(_2320, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2332);
    float _2342 = log2(_2296);
    float _2344 = -_2308;
    float _2346 = _2184 + _2344;
    float _2348 = fma(_2328, 0.5, 0.5);
    float _2350 = fma(_2282, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2340);
    float _2352 = _2322 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2354 = fma(_2338, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2350);
    float _2356 = _2322 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2358 = exp2(_2334);
    float _2360 = fma(_2320, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2352);
    float _2362 = -_2324;
    float _2364 = _2258 + _2362;
    float _2366 = fma(_2348, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2368 = fma(_2320, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2356);
    float _2370 = _2342 * 0.693147182464599609375;
    float _2372 = fma(_2348, _2366, -0.212114393711090087890625);
    float _2374 = 1.0 / _2354;
    float _2376 = fma(_2282, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2360);
    float _2378 = fma(_2282, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2368);
    float _2380 = sqrt(_2336);
    float _2382 = fma(_2338, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2376);
    float _2384 = fma(_2338, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2378);
    float2 _6514 = float2(_2346, _2364);
    float _2386 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6514, float2(0.0), isnan(_6514)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6514, float2(0.0), isnan(_6514)), level(0.0)).x;
    float _2388 = fma(_2348, _2372, 1.570728778839111328125);
    float _2390 = _2382 * _2374;
    float _2392 = _2304 + 1.0;
    float _2394 = _2384 * _2374;
    float _2396 = _2370 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2398 = fma(_2390, 0.5, 0.5);
    float _2400 = -_2304;
    float _2402 = fma(_2358, _2392, _2400);
    float _2404 = fma(_2394, -0.5, 0.5);
    float _2406 = _2380 * 0.636619746685028076171875;
    float _2408 = fma(_2402, 0.5, 0.5);
    float3 _6556 = float3(_2398, _2404, _2396);
    float _2410 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6556, float3(0.0), isnan(_6556)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6556, float3(0.0), isnan(_6556)), level(0.0)).x;
    float3 _6567 = float3(_2398, _2404, _2396);
    float4 _2413 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6567, float3(0.0), isnan(_6567)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6567, float3(0.0), isnan(_6567)), level(0.0)).xyzw;
    float _2415 = _2413.x;
    float _2417 = _2413.y;
    float _2419 = _2413.z;
    float _2421 = _2413.w;
    float _2423 = -_2388;
    float _2425 = fma(_2406, _2423, 1.0);
    float2 _6588 = float2(_2425, _2408);
    float3 _2429 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6588, float2(0.0), isnan(_6588)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6588, float2(0.0), isnan(_6588)), level(0.0)).xyz;
    float _2431 = _2429.x;
    float _2433 = _2429.y;
    float _2435 = _2429.z;
    float _2437 = abs(_2028);
    float _2439 = log2(_2437);
    float _2441 = _2322 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2443 = fma(_2320, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2441);
    bool _2445 = _2208 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2447 = isnan(_2208);
    bool _2449 = _2445 || _2447;
    bool _2451 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2453 = _2449 || _2451;
    float _2455 = fma(_2282, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2443);
    float _2457 = _2288 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2459 = in.m_74.x;
    bool _2461 = _2028 <= 8000.0;
    bool _2463 = isnan(_2028);
    bool _2465 = _2461 || _2463;
    bool _2467 = isnan(8000.0);
    bool _2469 = _2465 || _2467;
    float _2471 = float(_2469);
    float _2473 = fma(_2338, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2455);
    float _2475 = _2354 * 0.5;
    float _2477 = _2439 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2479 = exp2(_2457);
    float _2481 = fma(_2384, -0.5, _2475);
    out.gl_Position.x = _2382;
    out.gl_Position.y = _2384;
    out.gl_Position.z = _2473;
    out.gl_Position.w = _2354;
    float _2483 = exp2(_2477);
    float _2485 = -_2479;
    float _2487 = _2485 + 1.0;
    float _2489 = _2384;
    float _2491 = _2473;
    float _2493 = _2354;
    if (!_2453)
    {
        _2489 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2495 = _2489;
    float _2497 = _2487 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2499 = fma(_2483, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2501 = precise::clamp(_2499, 0.0, 1.0);
    float _2503 = _2473 + _2354;
    float _2505 = _2495;
    float _2507 = _2495;
    if (!_2453)
    {
        _2491 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2509 = _2491;
    float _2511 = fma(_2501, -2.0, 3.0);
    float _2513 = _2501 * _2501;
    float _2515 = _2503 * 0.5;
    float _2517 = _2513 * _2511;
    float _2519 = -_2517;
    float _2521 = _2519 + 1.0;
    float _2523 = fma(_2521, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2517);
    float _2525 = _2382 + _2354;
    float _2527 = -_2497;
    float _2529 = _2527 + 1.0;
    float _2531 = _2471 * _2523;
    float _2533 = _2525 * 0.5;
    float _2535 = _2529;
    float _2537 = _2509;
    float _2539 = _2509;
    if (!_2453)
    {
        _2493 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2541 = _2493;
    float _2543 = _2531 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_76.x = _2533;
    out.m_76.y = _2481;
    out.m_76.z = _2515;
    out.m_76.w = _2354;
    float _2545 = -_2386;
    float _2547 = _2545 + 1.0;
    float _2549 = _2547 * _2543;
    float _2551 = precise::clamp(_2549, 0.0, 1.0);
    float _2553 = -_2551;
    float _2555 = fma(_2553, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2557 = _2555 * _2459;
    float _2559 = _2497 * _2410;
    float _2561 = _2557 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2563 = _2421 * _2529;
    float _2565 = _2557;
    float _2567 = _2541;
    float _2569 = _2541;
    if (!_2453)
    {
        _2565 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2571 = _2565;
    float _2573 = _2421 * _2559;
    float _2575 = _2573;
    float _2577 = _2571;
    float _2579 = _2571;
    if (!_2453)
    {
        _2535 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2581 = _2535;
    out.m_78.x = _2561;
    float _2583 = _2435 * _2559;
    float _2585 = fma(_2431, _2573, _2415);
    float _2587 = fma(_2433, _2573, _2417);
    float _2589 = _2078 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2591 = fma(_2421, _2583, _2419);
    float _2593 = _2581;
    float _2595 = _2581;
    if (!_2453)
    {
        _2575 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2597 = _2575;
    out.m_80.x = _2585;
    out.m_80.y = _2587;
    out.m_80.z = _2591;
    out.m_80.w = _2563;
    bool _2599 = !_2453;
    float _2601 = _2597;
    float _2603 = _2597;
    if (!_2599)
    {
        bool _2605 = _2208 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2607 = isnan(_2208);
        bool _2609 = _2605 || _2607;
        bool _2611 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2613 = _2609 || _2611;
        if (!_2613)
        {
            float _2615 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2617 = _2208 + _2615;
            float _2619 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2621 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2619;
            float _2623 = 1.0 / _2621;
            float _2625 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2627 = _2625 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2629 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2631 = _2629 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2633 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2635 = _2633 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2637 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2639 = _2637 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2641 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2643 = _2641 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2645 = _2617 * _2623;
            float _2647 = precise::clamp(_2645, 0.0, 1.0);
            float _2649 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2651 = _2649 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2653 = fma(_2647, _2627, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2655 = fma(_2647, _2651, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2657 = fma(_2647, _2631, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2659 = fma(_2647, _2635, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2661 = fma(_2647, _2639, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2663 = fma(_2647, _2643, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2579 = _2655;
            _2507 = _2661;
            _2603 = _2653;
            _2539 = _2659;
            _2569 = _2657;
            _2595 = _2663;
            _2665 = true;
        }
        else
        {
            bool _2667 = _2208 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2669 = isnan(_2208);
            bool _2671 = _2667 || _2669;
            bool _2673 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2675 = _2671 || _2673;
            if (!_2675)
            {
                _2601 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2677 = _2601;
            _2603 = _2677;
            if (!_2675)
            {
                _2577 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2679 = _2577;
            _2579 = _2679;
            if (!_2675)
            {
                _2567 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2681 = _2567;
            _2569 = _2681;
            if (!_2675)
            {
                _2537 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2683 = _2537;
            _2539 = _2683;
            if (!_2675)
            {
                _2505 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2685 = _2505;
            _2507 = _2685;
            if (!_2675)
            {
                _2593 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2687 = _2593;
            bool _2689 = !_2675;
            _2595 = _2687;
            if (!_2689)
            {
                bool _2691 = _2208 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2693 = isnan(_2208);
                bool _2695 = _2691 || _2693;
                bool _2697 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2699 = _2695 || _2697;
                if (!_2699)
                {
                    float _2701 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2703 = _2208 + _2701;
                    float _2705 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2707 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2705;
                    float _2709 = 1.0 / _2707;
                    float _2711 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2713 = _2711 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2715 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2717 = _2715 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2719 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2721 = _2719 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2723 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2725 = _2723 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2727 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2729 = _2727 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2731 = _2703 * _2709;
                    float _2733 = precise::clamp(_2731, 0.0, 1.0);
                    float _2735 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2737 = _2735 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2739 = fma(_2733, _2713, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2741 = fma(_2733, _2737, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2743 = fma(_2733, _2717, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2745 = fma(_2733, _2721, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2747 = fma(_2733, _2725, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2749 = fma(_2733, _2729, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2579 = _2741;
                    _2507 = _2747;
                    _2603 = _2739;
                    _2539 = _2745;
                    _2569 = _2743;
                    _2595 = _2749;
                    _2665 = true;
                }
                else
                {
                    _2579 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2507 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2603 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2539 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2569 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2595 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2665 = false;
    float _2751 = _2579;
    float _2753 = _2507;
    float _2755 = _2603;
    float _2757 = _2539;
    float _2759 = _2569;
    float _2761 = _2595;
    float _2763 = fma(_1800, -0.5, 0.5);
    float _2765 = precise::clamp(_2763, 0.0, 1.0);
    float _2767 = -_2751;
    float _2769 = _2767 + _2753;
    float _2771 = _2589 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2773 = -_2755;
    float _2775 = _2773 + _2757;
    float _2777 = fma(_2765, _2769, _2751);
    out.m_82.x = 0.0;
    float _2779 = -_2759;
    float _2781 = _2779 + _2761;
    float _2783 = fma(_2765, _2775, _2755);
    float _2785 = _2777 * 0.586610972881317138671875;
    out.m_55.x = _2771;
    bool _2787 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2789 = fma(_2765, _2781, _2759);
    float _2791 = fma(_2783, 0.298911988735198974609375, _2785);
    bool _2793 = _2078 > 0.0;
    bool _2795 = isnan(_2078);
    bool _2797 = _2793 || _2795;
    bool _2799 = isnan(0.0);
    bool _2801 = _2797 || _2799;
    float _2803 = fma(_2789, 0.114477999508380889892578125, _2791);
    float _2805 = -_2803;
    float _2807 = _2783 + _2805;
    float _2809 = -_2803;
    float _2811 = _2777 + _2809;
    float _2813 = -_2803;
    float _2815 = _2789 + _2813;
    float _2817 = fma(_2807, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2803);
    float _2819 = fma(_2811, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2803);
    float _2821 = fma(_2815, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2803);
    bool _2823 = !_2787;
    if (!_2823)
    {
        float _2825 = -_2020;
        float _2827 = _2825 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2829 = -_2022;
        float _2831 = _2829 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2833 = -_2024;
        float _2835 = _2833 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2837 = _2827 * _2827;
        float _2839 = fma(_2831, _2831, _2837);
        float _2841 = fma(_2835, _2835, _2839);
        float _2843 = sqrt(_2841);
        float _2845 = rsqrt(_2841);
        float _2847 = -_2843;
        float _2849 = _2847 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2851 = _2849 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2853 = precise::clamp(_2851, 0.0, 1.0);
        float _2855 = _2831 * _2845;
        float _2857 = _2827 * _2845;
        float _2859 = abs(_2853);
        float _2861 = log2(_2859);
        float _2863 = _2835 * _2845;
        float _2865 = _2855 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2867 = _1800 * _2857;
        float _2869 = -_2857;
        float _2871 = -_2865;
        float _2873 = fma(_2869, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2871);
        float _2875 = fma(_1798, _2855, _2867);
        float _2877 = -_2863;
        float _2879 = fma(_2877, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2873);
        float _2881 = fma(_1802, _2863, _2875);
        float _2883 = precise::clamp(_2881, 0.0, 1.0);
        float _2885 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2887 = _2879 + _2885;
        float _2889 = _2861 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2891 = _2887 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2893 = precise::clamp(_2891, 0.0, 1.0);
        float _2895 = exp2(_2889);
        float _2897 = _2895 * _2893;
        float _2899 = _2883 * _2897;
        float _2901 = _2899 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2903 = _2899 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2905 = _2899 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_82.x = _2901;
        out.m_82.y = _2903;
        out.m_82.z = _2905;
    }
    out.m_84.x = _2817;
    out.m_84.y = _2819;
    out.m_84.z = _2821;
    if (_2801)
    {
        return out;
    }
    out.m_55.x = 0.0;
    float _2907 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2907;
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
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2665 = false;
    bool _1850 = false;
    bool _295 = false;
    bool _199 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _98 = in.m_48.w;
    float _100 = in.m_50.w;
    float _102 = trunc(_98);
    int _105 = int(_102);
    float _107 = -_100;
    float _109 = _107 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.y = _109;
    bool _113 = _105 >= 1;
    float _115 = 0.0;
    float _117 = _100;
    float _119 = _109;
    if (!_113)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _115;
    if (!_113)
    {
        out.m_55.x = 0.0;
    }
    int _123 = 0;
    if (!_113)
    {
        float _125 = _121 * 5.0;
        _123 = as_type<int>(_125);
    }
    int _127 = _123;
    int _129 = _127;
    if (!_113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2975 = as_type<float>(_127);
        out.gl_Position.z = _2975;
    }
    if (!_113)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _131 = _100 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _133 = isnan(_100);
    bool _135 = _131 || _133;
    bool _137 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _139 = _135 || _137;
    float _141 = float(_105);
    bool _143 = _109 >= _141;
    bool _145 = !_139;
    bool _147 = _143 || _145;
    if (_147)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _149 = _117;
    if (_147)
    {
        out.m_55.x = 0.0;
    }
    if (_147)
    {
        float _151 = _149 * 5.0;
        _129 = as_type<int>(_151);
    }
    int _153 = _129;
    if (_147)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3030 = as_type<float>(_153);
        out.gl_Position.z = _3030;
    }
    if (_147)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _155 = as_type<float>(int(gl_VertexIndex));
    float _157 = 1.0 / _141;
    bool _159 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _161 = _109 * _157;
    int _163 = as_type<int>(_155) & 1;
    bool _165 = _163 != 0;
    int _167 = as_type<int>(_155) & 2;
    bool _169 = _167 != 0;
    bool _171 = !_165;
    float _173 = _171 ? (-0.5) : 0.5;
    bool _175 = !_169;
    float _177 = _175 ? (-0.5) : 0.5;
    bool _179 = !_159;
    float _197;
    if (!_179)
    {
        float _181 = in.m_60.x;
        float _183 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _185 = _181 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _187 = fma(_185, (*spvDescriptorSet0.vp_c9)._m0[12].x, _109);
        float _189 = _187 * _183;
        float _191 = floor(_189);
        float _193 = -_191;
        float _195 = _189 + _193;
        _197 = _195;
        _199 = true;
    }
    else
    {
        _197 = _161;
    }
    _199 = false;
    float _201 = _197;
    float _203 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _205 = _201 + _203;
    bool _207 = _201 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _209 = isnan(_201);
    bool _211 = _207 || _209;
    bool _213 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _215 = _211 || _213;
    float _217 = float(_215);
    float _219 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _221 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _219;
    float _223 = -_217;
    float _225 = _223 + 1.0;
    bool _227 = _201 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _229 = isnan(_201);
    bool _231 = _227 || _229;
    bool _233 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _235 = _231 || _233;
    float _237 = float(_235);
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _241 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _239;
    bool _243 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _245 = 1.0 / _221;
    float _247 = _237 * _225;
    float _249 = -_237;
    float _251 = _249 + 1.0;
    float _253 = _205 * _245;
    float _255 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _257 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _255;
    float _259 = fma(_241, _253, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _261 = fma(_257, _253, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _263 = _259 * _247;
    float _265 = _261 * _247;
    float _267 = fma(_251, (*spvDescriptorSet0.vp_c9)._m0[143].x, _263);
    float _269 = fma(_251, (*spvDescriptorSet0.vp_c9)._m0[143].y, _265);
    float _271 = fma(_217, (*spvDescriptorSet0.vp_c9)._m0[144].x, _267);
    float _273 = fma(_217, (*spvDescriptorSet0.vp_c9)._m0[144].y, _269);
    bool _275 = !_243;
    float _293;
    if (!_275)
    {
        float _277 = in.m_60.x;
        float _279 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _281 = _277 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _283 = fma(_281, (*spvDescriptorSet0.vp_c9)._m0[11].y, _109);
        float _285 = _283 * _279;
        float _287 = floor(_285);
        float _289 = -_287;
        float _291 = _285 + _289;
        _293 = _291;
        _295 = true;
    }
    else
    {
        _293 = _161;
    }
    _295 = false;
    float _297 = _293;
    float _299 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _301 = int(_299);
    float _303 = in.m_60.x;
    float _305 = in.m_60.y;
    float _307 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _309 = int(_307);
    float _311 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _315 = _313 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _317 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _319 = log2(_317);
    float _321 = float(_301);
    float _323 = 1.0 / _321;
    float _325 = float(uint(_309));
    float _327 = _305 * 2.0;
    int _329 = ~_309;
    int _331 = _329 + 1;
    int _333 = ~_309;
    int _335 = _333 + 1;
    int _337 = ~_309;
    int _339 = _337 + 1;
    float _341 = 1.0 / _325;
    float _343 = _323 * _109;
    float _345 = 1.0 / _315;
    int _347 = as_type<int>(_341) + (-2);
    float _349 = trunc(_343);
    int _351 = int(_349);
    float _353 = floor(_327);
    float _355 = float(uint(_351));
    float _357 = as_type<float>(_347) * _355;
    float _359 = trunc(_357);
    float _361 = precise::max(_359, 0.0);
    uint _364 = uint(_361);
    int _366 = _331 * int(_364);
    int _368 = _366 + _351;
    float _370 = float(_309);
    float _372 = float(uint(_368));
    float _374 = as_type<float>(_347) * _372;
    int _376 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _378 = _376 != 0;
    float _380 = float(_351);
    float _382 = trunc(_374);
    float _384 = precise::max(_382, 0.0);
    uint _386 = uint(_384);
    bool _388 = !_378;
    float _390 = _388 ? 7.345489978790283203125 : 1.0;
    float _392 = _390 * _303;
    float _394 = floor(_392);
    int _396 = int(_364) + int(_386);
    float _398 = _370 * _109;
    bool _400 = _380 >= _370;
    bool _402 = isnan(_380);
    bool _404 = _400 || _402;
    bool _406 = isnan(_370);
    bool _408 = _404 || _406;
    float _410 = float(_408);
    float _412 = in.m_62.x;
    float _414 = in.m_62.y;
    int _416 = _335 * _396;
    int _418 = _416 + _351;
    float _420 = _398 * _157;
    bool _422 = uint(_418) >= uint(_309);
    float _424 = -_394;
    float _426 = _392 + _424;
    float _428 = trunc(_410);
    int _430 = int(_428);
    bool _432 = !_422;
    int _434 = _432 ? 0 : (-1);
    float _436 = _426 * _370;
    bool _438 = _309 == 0;
    int _440 = ~_396;
    int _442 = _440 + _434;
    int _444 = _442 + 1;
    int _446 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _448 = _446 != 0;
    int _450 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _452 = _450 != 0;
    int _454 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _456 = _454 != 0;
    float _458 = trunc(_420);
    int _460 = int(_458);
    int _462 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _464 = _462 != 0;
    int _466 = _309 * _444;
    int _468 = _466 + _351;
    int _470 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _472 = _470 != 0;
    bool _474 = !_452;
    int _476 = _474 ? 0 : 1;
    int _478 = ~_430;
    int _480 = _478 + 1;
    int _482 = _480 + 1;
    float _484 = trunc(_436);
    int _486 = int(_484);
    bool _488 = !_438;
    int _490 = _488 ? _468 : (-1);
    float _492 = _271 * _412;
    bool _494 = !_464;
    int _496 = _494 ? 0 : 1;
    int _498 = _309 + (-1);
    int _500 = _490 * _482;
    bool _502 = !_448;
    int _504 = _502 ? 0 : 1;
    int _506 = abs(_476);
    int _508 = _430 * _498;
    int _510 = _508 + _500;
    int _512 = abs(_504);
    int _514 = abs(_496);
    int _516 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _518 = _516 != 0;
    int _520 = _486 * _514;
    int _522 = _520 + _351;
    bool _524 = !_456;
    int _526 = _524 ? 0 : 1;
    int _528 = _510 * _506;
    int _530 = abs(_526);
    int _532 = _460 * _512;
    int _534 = _532 + _528;
    bool _536 = !_518;
    int _538 = _536 ? 0 : 1;
    float _540 = in.m_48.x;
    float _542 = in.m_48.y;
    float _544 = in.m_48.z;
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _548 = _546 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    int _550 = _522 * _530;
    int _552 = _550 + _534;
    int _554 = abs(_538);
    float _556 = _303 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _558 = 1.0 / _548;
    int _560 = _486 * _554;
    int _562 = _560 + _552;
    float _564 = _303 * 2.0;
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _568 = _566 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _570 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _572 = isnan(0.0);
    bool _574 = _570 || _572;
    bool _576 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _578 = _574 || _576;
    float _580 = _319 * _109;
    float _582 = _305 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _584 = floor(_564);
    float _586 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _588 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _590 = _588 != 0;
    float _592 = fma(_582, -2.0, _311);
    float _594 = -_586;
    float _596 = fma(_556, 2.0, _594);
    float _598 = _542 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _600 = _542 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _602 = _542 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _604 = float(uint(_562));
    float _606 = exp2(_580);
    float _608 = fma(_540, (*spvDescriptorSet0.vp_c10)._m0[4].x, _598);
    float _610 = fma(_540, (*spvDescriptorSet0.vp_c10)._m0[5].x, _600);
    float _612 = fma(_540, (*spvDescriptorSet0.vp_c10)._m0[6].x, _602);
    float _614 = as_type<float>(_347) * _604;
    float _616 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _618 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _616;
    float _620 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _622 = _620 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    bool _624 = _584 > 0.0;
    float _626 = trunc(_614);
    float _628 = precise::max(_626, 0.0);
    uint _630 = uint(_628);
    float _632 = _618 * _345;
    float _634 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _636 = _634 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    int _638 = ~_309;
    int _640 = _638 + 1;
    float _642 = _622 * _558;
    float _644 = -_109;
    float _646 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[76].x, _596);
    float _648 = 1.0 / _636;
    float _650 = -_606;
    float _652 = _650 + 1.0;
    bool _654 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _656 = isnan(1.0);
    bool _658 = _654 || _656;
    bool _660 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _662 = _658 || _660;
    float _664 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _666 = 1.0 + _664;
    float _668 = _578 ? _652 : 0.0;
    float _670 = 1.0 / _568;
    int _672 = _640 * int(_630);
    int _674 = _672 + _562;
    bool _676 = _584 >= 0.0;
    bool _678 = isnan(_584);
    bool _680 = _676 || _678;
    bool _682 = isnan(0.0);
    bool _684 = _680 || _682;
    float _686 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _688 = in.m_60.z;
    float _690 = _305 + _303;
    float _692 = float(uint(_674));
    float _694 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[78].z, _686);
    float _696 = 1.0 / _666;
    float _698 = _690 + (-1.0);
    float _700 = fma(_109, (*spvDescriptorSet0.vp_c9)._m0[77].z, _694);
    int _702 = _684 ? 0 : 1;
    float _704 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _706 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _704;
    bool _708 = _353 >= 0.0;
    bool _710 = isnan(_353);
    bool _712 = _708 || _710;
    bool _714 = isnan(0.0);
    bool _716 = _712 || _714;
    float _718 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _720 = _718 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _722 = as_type<float>(_347) * _692;
    float _724 = _706 * _670;
    float _726 = fma(_109, (*spvDescriptorSet0.vp_c9)._m0[76].y, _592);
    float _728 = _720 * _648;
    float _730 = trunc(_722);
    float _732 = precise::max(_730, 0.0);
    uint _734 = uint(_732);
    float _736 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _738 = _716 ? 0 : 1;
    float _740 = -_700;
    float _742 = _740 + 1.0;
    float _744 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[78].w, _736);
    float _746 = fma(_109, (*spvDescriptorSet0.vp_c9)._m0[77].w, _744);
    if (_662)
    {
        float _748 = _668 * _696;
        _119 = _748;
    }
    float _750 = _119;
    bool _752 = _303 > 0.5;
    float _754 = fma(_698, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _756 = _688 * 2.0;
    int _758 = ~_309;
    int _760 = _758 + 1;
    float _762 = -_746;
    float _764 = _762 + 1.0;
    int _766 = int(_630) + int(_734);
    float _768 = float(uint(_522));
    float _770 = floor(_756);
    float _772 = -_173;
    int _774 = _752 ? as_type<int>(_772) : as_type<int>(_173);
    bool _776 = _353 > 0.0;
    float _778 = as_type<float>(_347) * _768;
    int _780 = ~_702;
    int _782 = _780 + 1;
    int _784 = _782 + 1;
    int _786 = _760 * _766;
    int _788 = _786 + _562;
    int _790 = _784;
    if (!_624)
    {
        int _792 = ~_702;
        int _794 = _792 + 1;
        _790 = _794;
    }
    int _796 = _790;
    float _798 = _305 + _688;
    bool _800 = _305 > 0.5;
    float _802 = trunc(_778);
    float _804 = precise::max(_802, 0.0);
    uint _806 = uint(_804);
    int _808 = ~_738;
    int _810 = _808 + 1;
    int _812 = _810 + 1;
    float _814 = _798 + (-1.0);
    float _816 = -_177;
    int _818 = _800 ? as_type<int>(_816) : as_type<int>(_177);
    bool _820 = uint(_788) >= uint(_309);
    float _822 = fma(_814, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _824 = _812;
    if (!_776)
    {
        int _826 = ~_738;
        int _828 = _826 + 1;
        _824 = _828;
    }
    int _830 = _824;
    bool _832 = !_590;
    float _834 = _832 ? _173 : as_type<float>(_774);
    bool _836 = !_472;
    float _838 = _836 ? _177 : as_type<float>(_818);
    float _840 = fma(_544, (*spvDescriptorSet0.vp_c10)._m0[4].z, _608);
    int _842 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _844 = _842 != 0;
    int _846 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _848 = _846 != 0;
    int _850 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _852 = _850 != 0;
    float _854 = fma(_544, (*spvDescriptorSet0.vp_c10)._m0[5].z, _610);
    bool _856 = !_820;
    int _858 = _856 ? 0 : (-1);
    int _860 = _339 * int(_806);
    int _862 = _860 + _522;
    bool _864 = _770 > 0.0;
    float _866 = _854 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _868 = _770 >= 0.0;
    bool _870 = isnan(_770);
    bool _872 = _868 || _870;
    bool _874 = isnan(0.0);
    bool _876 = _872 || _874;
    float _878 = fma(_544, (*spvDescriptorSet0.vp_c10)._m0[6].z, _612);
    float _880 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _882 = _297 + _880;
    bool _884 = _297 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _886 = isnan(_297);
    bool _888 = _884 || _886;
    bool _890 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _892 = _888 || _890;
    float _894 = float(_892);
    int _896 = ~_766;
    int _898 = _896 + _858;
    int _900 = _898 + 1;
    float _902 = fma(_632, _882, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _904 = _297 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _906 = isnan(_297);
    bool _908 = _904 || _906;
    bool _910 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _912 = _908 || _910;
    float _914 = float(_912);
    float _916 = -_894;
    float _918 = _916 + 1.0;
    float _920 = float(uint(_862));
    int _922 = _309 * _900;
    int _924 = _922 + _562;
    bool _926 = _297 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _928 = isnan(_297);
    bool _930 = _926 || _928;
    bool _932 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _934 = _930 || _932;
    float _936 = float(_934);
    float _938 = _914 * _918;
    bool _940 = _297 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _942 = isnan(_297);
    bool _944 = _940 || _942;
    bool _946 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _948 = _944 || _946;
    float _950 = float(_948);
    float _952 = as_type<float>(_347) * _920;
    bool _954 = !_438;
    int _956 = _954 ? _924 : (-1);
    float _958 = -_914;
    float _960 = _958 + 1.0;
    bool _962 = _297 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _964 = isnan(_297);
    bool _966 = _962 || _964;
    bool _968 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _970 = _966 || _968;
    float _972 = float(_970);
    int _974 = _956 >> 31;
    float _976 = trunc(_952);
    float _978 = precise::max(_976, 0.0);
    uint _980 = uint(_978);
    int _982 = _956 & 3;
    bool _984 = _982 != 0;
    float _986 = _972 * _960;
    float _988 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _990 = _297 + _988;
    int _992 = _974 & 3;
    float _994 = -_972;
    float _996 = _994 + 1.0;
    float _998 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1000 = _297 + _998;
    float _1002 = fma(_642, _990, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    int _1004 = _956 + _992;
    float _1006 = _936 * _996;
    float _1008 = -_936;
    float _1010 = _1008 + 1.0;
    float _1012 = fma(_724, _1000, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    int _1014 = _1004 >> 2;
    float _1016 = _834 + 0.5;
    float _1018 = _950 * _1010;
    float _1020 = _838 + (-0.5);
    int _1022 = _1014 << 4;
    int _1024 = _1022 + 368;
    float _1026 = fma(_1016, (*spvDescriptorSet0.vp_c9)._m0[80].x, _646);
    int _1028 = int(_806) + int(_980);
    float _1030 = -_1020;
    float _1032 = -_726;
    float _1034 = fma(_1030, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1032);
    int _1036 = ~_309;
    int _1038 = _1036 + 1;
    uint _1040 = uint(int(uint(_1024) >> uint(2)));
    uint _1042 = uint(int(uint(int(_1040)) >> uint(2)));
    int _1044 = int(_1040) & 3;
    float _1046 = (*spvDescriptorSet0.vp_c9)._m0[int(_1042)][_1044];
    int _1048 = int(_1040) + 1;
    uint _1050 = uint(int(uint(_1048) >> uint(2)));
    int _1052 = _1048 & 3;
    float _1054 = (*spvDescriptorSet0.vp_c9)._m0[int(_1050)][_1052];
    float _1056 = -_742;
    float _1058 = fma(_834, _1056, _1026);
    float _1060 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1062 = _297 + _1060;
    int _1064 = _876 ? 0 : 1;
    float _1066 = _902 * _1018;
    float _1068 = -_950;
    float _1070 = _1068 + 1.0;
    int _1072 = _956 & 3;
    bool _1074 = _1072 != 0;
    float _1076 = fma(_728, _1062, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    int _1078 = ~_1064;
    int _1080 = _1078 + 1;
    int _1082 = _1080 + 1;
    float _1084 = fma(_1070, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1066);
    int _1086 = _1082;
    if (!_864)
    {
        int _1088 = ~_1064;
        int _1090 = _1088 + 1;
        _1086 = _1090;
    }
    int _1092 = _1086;
    int _1094 = _1038 * _1028;
    int _1096 = _1094 + _522;
    bool _1098 = !_844;
    int _1100 = _1098 ? 0 : 1;
    float _1102 = fma(_1002, _1006, _1084);
    int _1104 = _984 ? 0 : 1;
    float _1106 = fma(_838, _764, _1034);
    bool _1108 = uint(_1072) > 1u;
    bool _1110 = uint(_1096) >= uint(_309);
    int _1112 = abs(_1100);
    out.m_64.x = _1058;
    out.m_64.y = _1106;
    int _1114 = _1024 + 8;
    uint _1116 = uint(int(uint(_1114) >> uint(2)));
    uint _1118 = uint(int(uint(int(_1116)) >> uint(2)));
    int _1120 = int(_1116) & 3;
    float _1122 = (*spvDescriptorSet0.vp_c9)._m0[int(_1118)][_1120];
    int _1124 = int(_1116) + 1;
    uint _1126 = uint(int(uint(_1124) >> uint(2)));
    int _1128 = _1124 & 3;
    float _1130 = (*spvDescriptorSet0.vp_c9)._m0[int(_1126)][_1128];
    bool _1132 = !_848;
    int _1134 = _1132 ? 0 : 1;
    int _1136 = ~_1104;
    int _1138 = _1136 + 1;
    int _1140 = _1138 + 1;
    int _1142 = abs(_1134);
    int _1144 = _1140;
    if (!_1108)
    {
        int _1146 = ~_1104;
        int _1148 = _1146 + 1;
        _1144 = _1148;
    }
    int _1150 = _1144;
    float _1152 = float(_796);
    float _1154 = float(_1142);
    float _1156 = fma(_1012, _986, _1102);
    bool _1158 = uint(_1072) >= 2u;
    int _1160 = abs(_1150);
    float _1162 = _1154 * _1152;
    int _1164 = _1158 ? 0 : 1;
    float _1166 = fma(_1076, _938, _1156);
    bool _1168 = _1072 != 3;
    int _1170 = ~_1160;
    int _1172 = _1170 + 1;
    int _1174 = _1172 + 1;
    float _1176 = float(_1112);
    float _1178 = float(_1092);
    int _1180 = _1174 * as_type<int>(_1054);
    int _1182 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1184 = _1182 != 0;
    bool _1186 = !_1110;
    int _1188 = _1186 ? 0 : (-1);
    float _1190 = _1176 * _1178;
    bool _1192 = !_1074;
    int _1194 = _1192 ? 0 : 1;
    bool _1196 = _1072 != 3;
    float _1198 = _1190 * (-2.0);
    bool _1200 = !_1184;
    int _1202 = _1200 ? 0 : 1;
    int _1204 = ~_1164;
    int _1206 = _1204 + 1;
    int _1208 = _1206 + 1;
    int _1210 = _1208;
    if (_1168)
    {
        int _1212 = ~_1164;
        int _1214 = _1212 + 1;
        _1210 = _1214;
    }
    int _1216 = _1210;
    int _1218 = abs(_1194);
    float _1220 = in.m_66.x;
    float _1222 = in.m_66.y;
    float _1224 = in.m_66.z;
    int _1226 = ~_1028;
    int _1228 = _1226 + _1188;
    int _1230 = _1228 + 1;
    float _1232 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1234 = _866 + _1232;
    int _1236 = abs(_1202);
    float _1238 = _840 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _1240 = !_1196;
    int _1242 = _1240 ? 0 : (-1);
    float _1244 = _878 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1246 = abs(_1216);
    float _1248 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1250 = _1238 + _1248;
    int _1252 = abs(_1242);
    float _1254 = _1234 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1256 = ~_1218;
    int _1258 = _1256 + 1;
    int _1260 = _1258 + 1;
    int _1262 = _309 * _1230;
    int _1264 = _1262 + _522;
    float _1266 = fma(_1250, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1254);
    float _1268 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1270 = _1244 + _1268;
    int _1272 = _1260 * as_type<int>(_1046);
    int _1274 = _1272 + _1180;
    int _1276 = ~_1246;
    int _1278 = _1276 + 1;
    int _1280 = _1278 + 1;
    int _1282 = ~_1252;
    int _1284 = _1282 + 1;
    int _1286 = _1284 + 1;
    float _1288 = fma(_1270, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1266);
    int _1290 = _1280 * as_type<int>(_1122);
    int _1292 = _1290 + _1274;
    float _1294 = _1162 * (-2.0);
    int _1296 = ~_1236;
    int _1298 = _1296 + 1;
    int _1300 = _1298 + 1;
    int _1302 = _1286 * as_type<int>(_1130);
    int _1304 = _1302 + _1292;
    float _1306 = _1234 * _1234;
    float _1308 = fma(_894, (*spvDescriptorSet0.vp_c9)._m0[119].x, _1166);
    bool _1310 = _1288 >= 0.0;
    int _1312 = _1304 * _1300;
    float _1314 = fma(_1250, _1250, _1306);
    bool _1316 = !_438;
    int _1318 = _1316 ? _1264 : (-1);
    float _1320 = fma(_1198, _1220, _1220);
    float _1322 = fma(_822, _1294, _822);
    float _1324 = fma(_1270, _1270, _1314);
    float _1326 = fma(_1294, _1222, _1222);
    float _1328 = fma(_754, _1198, _754);
    int _1330 = _1318 * _1236;
    int _1332 = _1330 + _1312;
    float _1334 = rsqrt(_1324);
    float _1336 = _303 + (-0.5);
    float _1338 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1340 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1342 = (*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1344 = _1224;
    if (_1310)
    {
        _1342 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1346 = _1342;
    float _1348 = fma(_1336, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1320);
    float _1350 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1352 = _492 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1354 = _1338 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1356 = _1340 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1358 = _1350 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1360 = _1308 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _1362 = as_type<int>(_1346);
    if (_1310)
    {
        float _1364 = _1346 * 5.0;
        _1362 = as_type<int>(_1364);
    }
    int _1366 = _1362;
    float _1368 = float(_1332);
    float _1370 = _1352 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    bool _1372 = !_852;
    int _1374 = _1372 ? 0 : 1;
    out.m_68.x = _1358;
    out.m_68.y = _1354;
    out.m_68.z = _1356;
    out.m_68.w = _1360;
    float _1376 = fma(_1328, _750, _1348);
    float _1378 = _1370 * _1334;
    float _1380 = _305 + (-0.5);
    if (_1310)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4835 = as_type<float>(_1366);
        out.gl_Position.z = _4835;
    }
    int _1382 = abs(_1374);
    float _1384 = _1250 * _1378;
    float _1386 = _1234 * _1378;
    out.m_70.x = _1368;
    if (_1310)
    {
        out.m_55.x = 0.0;
    }
    if (_1310)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1388 = -_1386;
    float _1390 = _866 + _1388;
    float _1392 = _1270 * _1378;
    float _1394 = -_1384;
    float _1396 = _1238 + _1394;
    float _1398 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1400 = _1390 + _1398;
    float _1402 = float(_830);
    float _1404 = -_1392;
    float _1406 = _1244 + _1404;
    float _1408 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1410 = _1396 + _1408;
    float _1412 = _1400 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1414 = float(_1382);
    float _1416 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1418 = _1406 + _1416;
    float _1420 = -_1386;
    float _1422 = _1234 + _1420;
    float _1424 = fma(_1410, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1412);
    float _1426 = -_1384;
    float _1428 = _1250 + _1426;
    float _1430 = fma(_1380, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1326);
    float _1432 = _1422 * _1422;
    float _1434 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1424);
    float _1436 = _688 + _303;
    float _1438 = _1376 * 0.15915493667125701904296875;
    float _1440 = _1414 * _1402;
    float _1442 = fma(_1428, _1428, _1432);
    bool _1444 = _1434 >= 0.0;
    float _1446 = fma(_1322, _750, _1430);
    float _1448 = _1436 + (-1.0);
    float _1450 = _1440 * (-2.0);
    float _1452 = -_1392;
    float _1454 = _1270 + _1452;
    float _1456 = _1446 * 0.15915493667125701904296875;
    float _1458 = fma(_1448, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1460 = _688 + (-0.5);
    float _1462 = fma(_1450, _1224, _1224);
    float _1464 = fma(_1454, _1454, _1442);
    float _1466 = _1456 * 6.283185482025146484375;
    float _1468 = sin(_1466);
    float _1470 = fma(_1458, _1450, _1458);
    if (_1444)
    {
        _1344 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1472 = _1344;
    float _1474 = fma(_1460, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1462);
    int _1476 = as_type<int>(_1472);
    if (_1444)
    {
        out.m_55.x = 0.0;
    }
    if (_1444)
    {
        float _1478 = _1472 * 5.0;
        _1476 = as_type<int>(_1478);
    }
    int _1480 = _1476;
    float _1482 = _1438 * 6.283185482025146484375;
    float _1484 = sin(_1482);
    float _1486 = fma(_1470, _750, _1474);
    if (_1444)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5020 = as_type<float>(_1480);
        out.gl_Position.z = _5020;
    }
    float _1488 = _1486 * 0.15915493667125701904296875;
    float _1490 = _1438 * 6.283185482025146484375;
    float _1492 = cos(_1490);
    float _1494 = sqrt(_1464);
    float _1496 = _1456 * 6.283185482025146484375;
    float _1498 = cos(_1496);
    if (_1444)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1500 = _1488 * 6.283185482025146484375;
    float _1502 = cos(_1500);
    float _1504 = _273 * _414;
    float _1506 = _1334 * _1494;
    float _1508 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _177);
    float _1510 = _1484 * _1468;
    float _1512 = _1504 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1514 = _1492 * _1498;
    float _1516 = _1492 * _1468;
    float _1518 = _1488 * 6.283185482025146484375;
    float _1520 = sin(_1518);
    float _1522 = _1512 * _1506;
    float _1524 = _1484 * _1498;
    float _1526 = _1508 * _1522;
    float _1528 = _1352 * _1506;
    float _1530 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _173);
    float _1532 = _1492 * _1502;
    float _1534 = _1498 * _1502;
    float _1536 = _1484 * _1502;
    float _1538 = _1530 * _1528;
    float _1540 = _1532 * _1526;
    float _1542 = _1468 * _1502;
    float _1544 = _1506 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1546 = _1544 * 0.5;
    float _1548 = fma(_1520, _1514, _1510);
    float _1550 = -_1526;
    float _1552 = _1520 * _1550;
    float _1554 = -_1524;
    float _1556 = fma(_1520, _1516, _1554);
    float _1558 = -_1516;
    float _1560 = fma(_1520, _1524, _1558);
    float _1562 = fma(_1548, _1538, _1540);
    float _1564 = _1536 * _1526;
    float _1566 = fma(_1534, _1538, _1552);
    float _1568 = fma(_1520, _1510, _1514);
    float _1570 = fma(_1556, _1546, _1562);
    float _1572 = fma(_1560, _1538, _1564);
    float _1574 = fma(_1542, _1546, _1566);
    float _1576 = _1548 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1578 = _1570 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1580 = _1570 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1582 = fma(_1568, _1546, _1572);
    float _1584 = _1570 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1586 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1578);
    float _1588 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1580);
    float _1590 = _1548 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1592 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1584);
    float _1594 = fma(_1582, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1586);
    float _1596 = fma(_1582, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1588);
    float _1598 = _1548 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1600 = fma(_1582, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1592);
    float _1602 = _1594 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1604 = _1596 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1606 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1576);
    float _1608 = _1600 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1610 = _1238 + _1602;
    float _1612 = _1244 + _1604;
    float _1614 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1590);
    float _1616 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1598);
    float _1618 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1620 = _1610 + _1618;
    float _1622 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1624 = _1612 + _1622;
    float _1626 = _1532 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1628 = _1532 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1630 = _1620 * _1620;
    float _1632 = _1624 * _1624;
    float _1634 = _1532 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1636 = _1556 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1638 = _1556 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1640 = _1630 + _1632;
    float _1642 = _866 + _1608;
    float _1644 = _1556 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1646 = -_1520;
    float _1648 = fma(_1646, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1626);
    float _1650 = sqrt(_1640);
    float _1652 = -_1520;
    float _1654 = fma(_1652, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1628);
    float _1656 = -_1520;
    float _1658 = fma(_1656, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1634);
    float _1660 = fma(_1560, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1606);
    float _1662 = fma(_1560, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1614);
    float _1664 = fma(_1542, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1636);
    float _1666 = fma(_1542, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1638);
    float _1668 = fma(_1560, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1616);
    float _1670 = fma(_1542, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1644);
    bool _1672 = _1650 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1674 = _1556;
    float _1676 = _1610;
    float _1678 = _1636;
    float _1680 = _1612;
    float _1682 = _1630;
    if (!_1672)
    {
        _1674 = _1610;
    }
    float _1684 = _1674;
    float _1686 = _1684;
    if (!_1672)
    {
        _1676 = _1612;
    }
    float _1688 = _1676;
    float _1690 = _1688;
    if (!_1672)
    {
        _1678 = _1632;
    }
    float _1692 = _1678;
    float _1694 = _1692;
    if (!_1672)
    {
        _1680 = _1642;
    }
    float _1696 = _1680;
    bool _1698 = !_1672;
    float _1700 = _1696;
    if (!_1698)
    {
        float _1702 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1704 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1706 = _1650 + _1704;
        float _1708 = rsqrt(_1640);
        float _1710 = _1706 * _1702;
        float _1712 = _1642 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1714 = _1710 * 0.15915493667125701904296875;
        float _1716 = _1714 * 6.283185482025146484375;
        float _1718 = sin(_1716);
        float _1720 = _1714 * 6.283185482025146484375;
        float _1722 = cos(_1720);
        float _1724 = fma(_1718, _1712, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1726 = _1708 * _1724;
        float _1728 = fma(_1620, _1726, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1730 = _1722 + (-1.0);
        float _1732 = fma(_1624, _1726, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1734 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1736 = _1728 + _1734;
        float _1738 = _1730 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1740 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1742 = _1732 + _1740;
        float _1744 = _1736 * _1736;
        float _1746 = fma(_1642, _1722, _1738);
        float _1748 = _1742 * _1742;
        _1700 = _1746;
        _1682 = _1744;
        _1694 = _1748;
        _1686 = _1728;
        _1690 = _1732;
    }
    float _1750 = _1700;
    float _1752 = _1682;
    float _1754 = _1694;
    float _1756 = _1686;
    float _1758 = _1690;
    float _1760 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1762 = _1750 + _1760;
    float _1764 = fma(_1536, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1648);
    float _1766 = fma(_1536, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1654);
    float _1768 = _177 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1770 = fma(_1762, _1762, _1752);
    float _1772 = fma(_1536, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1658);
    float _1774 = _173 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1776 = _1768 * _1764;
    float _1778 = _1770 + _1754;
    float _1780 = _1768 * _1766;
    float _1782 = _1768 * _1772;
    float _1784 = fma(_1568, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1664);
    float _1786 = fma(_1568, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1666);
    float _1788 = fma(_1568, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1670);
    float _1790 = sqrt(_1778);
    float _1792 = fma(_1774, _1660, _1776);
    float _1794 = fma(_1774, _1662, _1780);
    float _1796 = fma(_1774, _1668, _1782);
    float _1798 = _1784 + _1792;
    float _1800 = _1786 + _1794;
    float _1802 = _1788 + _1796;
    out.m_72.x = _1798;
    out.m_72.y = _1800;
    out.m_72.z = _1802;
    bool _1804 = _1790 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1806 = isnan(_1790);
    bool _1808 = _1804 || _1806;
    bool _1810 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1812 = _1808 || _1810;
    float _1814 = _1772;
    if (!_1812)
    {
        _1814 = 1.0;
    }
    float _1816 = _1814;
    bool _1818 = !_1812;
    float _1820 = _1816;
    if (!_1818)
    {
        bool _1822 = _1790 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1824 = isnan(_1790);
        bool _1826 = _1822 || _1824;
        bool _1828 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1830 = _1826 || _1828;
        if (!_1830)
        {
            float _1832 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1834 = _1790 + _1832;
            float _1836 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1838 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1836;
            float _1840 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1842 = _1840 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1844 = 1.0 / _1838;
            float _1846 = _1834 * _1844;
            float _1848 = fma(_1846, _1842, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1820 = _1848;
            _1850 = true;
        }
        else
        {
            bool _1852 = _1790 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1854 = isnan(_1790);
            bool _1856 = _1852 || _1854;
            bool _1858 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1860 = _1856 || _1858;
            if (!_1860)
            {
                float _1862 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1864 = _1790 + _1862;
                float _1866 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1868 = _1866 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1870 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1872 = _1870 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1874 = 1.0 / _1868;
                float _1876 = _1864 * _1874;
                float _1878 = fma(_1876, _1872, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1820 = _1878;
                _1850 = true;
            }
            else
            {
                _1820 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1850 = false;
    float _1880 = _1820;
    float _1882 = _1390 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1884 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1886 = _1756 + _1884;
    float _1888 = fma(_1396, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1882);
    float _1890 = _1390 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1892 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1894 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1896 = _1892 || _1894;
    bool _1898 = isnan(0.5);
    bool _1900 = _1896 || _1898;
    float _1902 = fma(_1406, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1888);
    float _1904 = _1902 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1906 = fma(_1396, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1890);
    bool _1908 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1910 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1912 = _1908 || _1910;
    bool _1914 = isnan(0.5);
    bool _1916 = _1912 || _1914;
    float _1918 = fma(_1886, _1880, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1920 = 1.0 / _1904;
    float _1922 = fma(_1406, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1906);
    float _1924 = _1922 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1926 = _1924 + _1904;
    float _1928 = _1886;
    if (_1916)
    {
        _1928 = 1.0;
    }
    float _1930 = _1928;
    float _1932 = _1926 * _1920;
    float _1934 = _1932 * 0.5;
    float _1936 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1938 = _1750 + _1936;
    float _1940 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1942 = fma(_1934, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1940);
    float _1944 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1946 = _1758 + _1944;
    float _1948 = fma(_1938, _1880, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1950 = -_1384;
    float _1952 = _1950 + _1918;
    float _1954 = fma(_1946, _1880, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1956 = 1.0 / _1942;
    float _1958 = -_1386;
    float _1960 = _1958 + _1948;
    float _1962 = -_1392;
    float _1964 = _1962 + _1954;
    float _1966 = _1960;
    float _1968 = _1952;
    float _1970 = _1964;
    float _1972 = _1930;
    float _1974 = _1956;
    if (!_1900)
    {
        float _1976 = _1400 * _1400;
        float _1978 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1980 = -_1244;
        float _1982 = _1980 + _1954;
        float _1984 = -_866;
        float _1986 = _1984 + _1948;
        float _1988 = fma(_1410, _1410, _1976);
        float _1990 = -_1238;
        float _1992 = _1990 + _1918;
        float _1994 = fma(_1418, _1418, _1988);
        float _1996 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1998 = sqrt(_1994);
        float _2000 = 1.0 / _1506;
        float _2002 = _1996 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2004 = precise::min(_1998, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2006 = _2004 * _1978;
        float _2008 = _2006 * _2000;
        float _2010 = _2002 * _2008;
        float _2012 = _1982 * _2008;
        float _2014 = fma(_1986, _2010, _1390);
        float _2016 = fma(_1992, _2010, _1396);
        float _2018 = fma(_2002, _2012, _1406);
        _1966 = _2014;
        _1968 = _2016;
        _1970 = _2018;
    }
    float _2020 = _1966;
    float _2022 = _1968;
    float _2024 = _1970;
    float _2026 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2028 = _1956 * _2026;
    if (!_1916)
    {
        float _2030 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2032 = _2030 * 0.15915493667125701904296875;
        float _2034 = _2032 * 6.283185482025146484375;
        float _2036 = cos(_2034);
        float _2038 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2040 = _2038 * 0.15915493667125701904296875;
        float _2042 = _2032 * 6.283185482025146484375;
        float _2044 = sin(_2042);
        float _2046 = 1.0 / _2036;
        float _2048 = _2040 * 6.283185482025146484375;
        float _2050 = cos(_2048);
        float _2052 = _2044 * _2046;
        float _2054 = _2040 * 6.283185482025146484375;
        float _2056 = sin(_2054);
        float _2058 = _2050 * _2052;
        float _2060 = 1.0 / _2058;
        float _2062 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2064 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2062;
        float _2066 = 1.0 / _2064;
        float _2068 = _2056 * _2060;
        float _2070 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2072 = fma(_2028, _2068, _2070);
        float _2074 = _2072 * _2066;
        float _2076 = precise::clamp(_2074, 0.0, 1.0);
        _1972 = _2076;
    }
    float _2078 = _1972;
    float _2080 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2082 = _2020 + _2080;
    float _2084 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2086 = _2022 + _2084;
    float _2088 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2090 = _2024 + _2088;
    float _2092 = _2082 * _2082;
    float _2094 = fma(_2086, _2086, _2092);
    float _2096 = fma(_2090, _2090, _2094);
    float _2098 = rsqrt(_2096);
    float _2100 = _2098 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2102 = _2086 * _2100;
    float _2104 = _2090 * _2100;
    float _2106 = _2102 * _2102;
    float _2108 = _2104 * _2104;
    float _2110 = _2106 + _2108;
    float _2112 = sqrt(_2110);
    bool _2114 = _2112 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2116 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2118 = _2112 + _2116;
    float _2120 = _2094;
    float _2122 = _2118;
    float _2124 = _2082;
    float _2126 = _2100;
    float _2128 = _2110;
    if (_2114)
    {
        float _2130 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2120 = _2130;
    }
    float _2132 = _2120;
    float _2134 = _2132;
    if (_2114)
    {
        float _2136 = _2118 * _2132;
        _2122 = _2136;
    }
    float _2138 = _2122;
    if (_2114)
    {
        float _2140 = rsqrt(_2110);
        _2134 = _2140;
    }
    float _2142 = _2134;
    float _2144 = _2142;
    if (_2114)
    {
        float _2146 = _2138 * 0.15915493667125701904296875;
        _1974 = _2146;
    }
    float _2148 = _1974;
    float _2150 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2152 = _2090;
    float _2154 = _2148;
    if (_2114)
    {
        float _2156 = _2148 * 6.283185482025146484375;
        float _2158 = sin(_2156);
        _2152 = _2158;
    }
    float _2160 = _2152;
    float _2162 = precise::max(0.0, _2150);
    float _2164 = _2098;
    if (_2114)
    {
        float _2166 = _2148 * 6.283185482025146484375;
        float _2168 = cos(_2166);
        _2164 = _2168;
    }
    float _2170 = _2164;
    float _2172 = -_2100;
    float _2174 = -_2162;
    float _2176 = fma(_2082, _2172, _2174);
    float _2178 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_2114)
    {
        float _2180 = _2176 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2124 = _2180;
    }
    float _2182 = _2124;
    float _2184 = fma(_1396, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2186 = _2160;
    float _2188 = _2182;
    if (_2114)
    {
        float _2190 = fma(_2160, _2182, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2186 = _2190;
    }
    float _2192 = _2186;
    if (!_2114)
    {
        _2154 = _2102;
    }
    float _2194 = _2154;
    float _2196 = _2194;
    if (!_2114)
    {
        _2188 = _2104;
    }
    float _2198 = _2188;
    float _2200 = _2198;
    if (_2114)
    {
        float _2202 = _2142 * _2192;
        _2126 = _2202;
    }
    float _2204 = _2126;
    if (!_2114)
    {
        _2144 = _2176;
    }
    float _2206 = _2144;
    float _2208 = sqrt(_2096);
    float _2210 = _2206;
    float _2212 = _2170;
    if (_2114)
    {
        float _2214 = _2170 + (-1.0);
        _2178 = _2214;
    }
    float _2216 = _2178;
    float _2218 = _2216;
    if (_2114)
    {
        float _2220 = _2102 * _2204;
        _2196 = _2220;
    }
    float _2222 = _2196;
    if (_2114)
    {
        float _2224 = _2104 * _2204;
        _2200 = _2224;
    }
    float _2226 = _2200;
    if (_2114)
    {
        float _2228 = _2216 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2128 = _2228;
    }
    float _2230 = _2128;
    if (!_2114)
    {
        _2218 = _2106;
    }
    float _2232 = _2218;
    float _2234 = _2232;
    if (_2114)
    {
        float _2236 = _2222 * _2222;
        _2234 = _2236;
    }
    float _2238 = _2234;
    if (_2114)
    {
        float _2240 = fma(_2176, _2170, _2230);
        _2210 = _2240;
    }
    float _2242 = _2210;
    if (!_2114)
    {
        _2212 = _2108;
    }
    float _2244 = _2212;
    float _2246 = _2244;
    if (_2114)
    {
        float _2248 = _2226 * _2226;
        _2246 = _2248;
    }
    float _2250 = _2246;
    float _2252 = fma(_2242, _2242, _2238);
    float _2254 = _2020 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2256 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2258 = fma(_1406, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2260 = _2252 + _2250;
    float _2262 = fma(_2022, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2254);
    float _2264 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2266 = fma(_2208, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2264);
    float _2268 = precise::clamp(_2266, 0.0, 1.0);
    float _2270 = _2020 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2272 = rsqrt(_2260);
    float _2274 = fma(_2024, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2262);
    float _2276 = -_2268;
    float _2278 = _2276 + 1.0;
    float _2280 = fma(_2022, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2270);
    float _2282 = _2274 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2284 = fma(_2024, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2280);
    float _2286 = abs(_2278);
    float _2288 = log2(_2286);
    float _2290 = _2282 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2292 = _2020 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2294 = -_2290;
    float _2296 = fma(_2294, _2256, 1.0);
    float _2298 = _2020 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2300 = fma(_2022, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2292);
    float _2302 = _2272 * _2222;
    float _2304 = _2272 * _2242;
    float _2306 = fma(_2022, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2298);
    float _2308 = floor(_2184);
    float _2310 = _2302 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2312 = _2272 * _2226;
    float _2314 = fma(_2024, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2306);
    float _2316 = -_2310;
    float _2318 = fma(_2304, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2316);
    float _2320 = _2284 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2322 = _2314 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2324 = floor(_2258);
    float _2326 = -_2312;
    float _2328 = fma(_2326, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2318);
    float _2330 = fma(_2024, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2300);
    float _2332 = _2322 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2334 = _2288 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2336 = fma(_2328, -0.5, 0.5);
    float _2338 = _2330 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2340 = fma(_2320, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2332);
    float _2342 = log2(_2296);
    float _2344 = -_2308;
    float _2346 = _2184 + _2344;
    float _2348 = fma(_2328, 0.5, 0.5);
    float _2350 = fma(_2282, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2340);
    float _2352 = _2322 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2354 = fma(_2338, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2350);
    float _2356 = _2322 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2358 = exp2(_2334);
    float _2360 = fma(_2320, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2352);
    float _2362 = -_2324;
    float _2364 = _2258 + _2362;
    float _2366 = fma(_2348, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2368 = fma(_2320, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2356);
    float _2370 = _2342 * 0.693147182464599609375;
    float _2372 = fma(_2348, _2366, -0.212114393711090087890625);
    float _2374 = 1.0 / _2354;
    float _2376 = fma(_2282, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2360);
    float _2378 = fma(_2282, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2368);
    float _2380 = sqrt(_2336);
    float _2382 = fma(_2338, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2376);
    float _2384 = fma(_2338, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2378);
    float2 _6514 = float2(_2346, _2364);
    float _2386 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6514, float2(0.0), isnan(_6514)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6514, float2(0.0), isnan(_6514)), level(0.0)).x;
    float _2388 = fma(_2348, _2372, 1.570728778839111328125);
    float _2390 = _2382 * _2374;
    float _2392 = _2304 + 1.0;
    float _2394 = _2384 * _2374;
    float _2396 = _2370 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2398 = fma(_2390, 0.5, 0.5);
    float _2400 = -_2304;
    float _2402 = fma(_2358, _2392, _2400);
    float _2404 = fma(_2394, -0.5, 0.5);
    float _2406 = _2380 * 0.636619746685028076171875;
    float _2408 = fma(_2402, 0.5, 0.5);
    float3 _6556 = float3(_2398, _2404, _2396);
    float _2410 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6556, float3(0.0), isnan(_6556)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6556, float3(0.0), isnan(_6556)), level(0.0)).x;
    float3 _6567 = float3(_2398, _2404, _2396);
    float4 _2413 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6567, float3(0.0), isnan(_6567)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6567, float3(0.0), isnan(_6567)), level(0.0)).xyzw;
    float _2415 = _2413.x;
    float _2417 = _2413.y;
    float _2419 = _2413.z;
    float _2421 = _2413.w;
    float _2423 = -_2388;
    float _2425 = fma(_2406, _2423, 1.0);
    float2 _6588 = float2(_2425, _2408);
    float3 _2429 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6588, float2(0.0), isnan(_6588)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6588, float2(0.0), isnan(_6588)), level(0.0)).xyz;
    float _2431 = _2429.x;
    float _2433 = _2429.y;
    float _2435 = _2429.z;
    float _2437 = abs(_2028);
    float _2439 = log2(_2437);
    float _2441 = _2322 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2443 = fma(_2320, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2441);
    bool _2445 = _2208 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2447 = isnan(_2208);
    bool _2449 = _2445 || _2447;
    bool _2451 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2453 = _2449 || _2451;
    float _2455 = fma(_2282, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2443);
    float _2457 = _2288 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2459 = in.m_74.x;
    bool _2461 = _2028 <= 8000.0;
    bool _2463 = isnan(_2028);
    bool _2465 = _2461 || _2463;
    bool _2467 = isnan(8000.0);
    bool _2469 = _2465 || _2467;
    float _2471 = float(_2469);
    float _2473 = fma(_2338, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2455);
    float _2475 = _2354 * 0.5;
    float _2477 = _2439 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2479 = exp2(_2457);
    float _2481 = fma(_2384, -0.5, _2475);
    out.gl_Position.x = _2382;
    out.gl_Position.y = _2384;
    out.gl_Position.z = _2473;
    out.gl_Position.w = _2354;
    float _2483 = exp2(_2477);
    float _2485 = -_2479;
    float _2487 = _2485 + 1.0;
    float _2489 = _2384;
    float _2491 = _2473;
    float _2493 = _2354;
    if (!_2453)
    {
        _2489 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2495 = _2489;
    float _2497 = _2487 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2499 = fma(_2483, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2501 = precise::clamp(_2499, 0.0, 1.0);
    float _2503 = _2473 + _2354;
    float _2505 = _2495;
    float _2507 = _2495;
    if (!_2453)
    {
        _2491 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2509 = _2491;
    float _2511 = fma(_2501, -2.0, 3.0);
    float _2513 = _2501 * _2501;
    float _2515 = _2503 * 0.5;
    float _2517 = _2513 * _2511;
    float _2519 = -_2517;
    float _2521 = _2519 + 1.0;
    float _2523 = fma(_2521, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2517);
    float _2525 = _2382 + _2354;
    float _2527 = -_2497;
    float _2529 = _2527 + 1.0;
    float _2531 = _2471 * _2523;
    float _2533 = _2525 * 0.5;
    float _2535 = _2529;
    float _2537 = _2509;
    float _2539 = _2509;
    if (!_2453)
    {
        _2493 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2541 = _2493;
    float _2543 = _2531 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_76.x = _2533;
    out.m_76.y = _2481;
    out.m_76.z = _2515;
    out.m_76.w = _2354;
    float _2545 = -_2386;
    float _2547 = _2545 + 1.0;
    float _2549 = _2547 * _2543;
    float _2551 = precise::clamp(_2549, 0.0, 1.0);
    float _2553 = -_2551;
    float _2555 = fma(_2553, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2557 = _2555 * _2459;
    float _2559 = _2497 * _2410;
    float _2561 = _2557 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2563 = _2421 * _2529;
    float _2565 = _2557;
    float _2567 = _2541;
    float _2569 = _2541;
    if (!_2453)
    {
        _2565 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2571 = _2565;
    float _2573 = _2421 * _2559;
    float _2575 = _2573;
    float _2577 = _2571;
    float _2579 = _2571;
    if (!_2453)
    {
        _2535 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2581 = _2535;
    out.m_78.x = _2561;
    float _2583 = _2435 * _2559;
    float _2585 = fma(_2431, _2573, _2415);
    float _2587 = fma(_2433, _2573, _2417);
    float _2589 = _2078 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2591 = fma(_2421, _2583, _2419);
    float _2593 = _2581;
    float _2595 = _2581;
    if (!_2453)
    {
        _2575 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2597 = _2575;
    out.m_80.x = _2585;
    out.m_80.y = _2587;
    out.m_80.z = _2591;
    out.m_80.w = _2563;
    bool _2599 = !_2453;
    float _2601 = _2597;
    float _2603 = _2597;
    if (!_2599)
    {
        bool _2605 = _2208 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2607 = isnan(_2208);
        bool _2609 = _2605 || _2607;
        bool _2611 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2613 = _2609 || _2611;
        if (!_2613)
        {
            float _2615 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2617 = _2208 + _2615;
            float _2619 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2621 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2619;
            float _2623 = 1.0 / _2621;
            float _2625 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2627 = _2625 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2629 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2631 = _2629 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2633 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2635 = _2633 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2637 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2639 = _2637 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2641 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2643 = _2641 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2645 = _2617 * _2623;
            float _2647 = precise::clamp(_2645, 0.0, 1.0);
            float _2649 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2651 = _2649 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2653 = fma(_2647, _2627, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2655 = fma(_2647, _2651, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2657 = fma(_2647, _2631, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2659 = fma(_2647, _2635, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2661 = fma(_2647, _2639, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2663 = fma(_2647, _2643, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2579 = _2655;
            _2507 = _2661;
            _2603 = _2653;
            _2539 = _2659;
            _2569 = _2657;
            _2595 = _2663;
            _2665 = true;
        }
        else
        {
            bool _2667 = _2208 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2669 = isnan(_2208);
            bool _2671 = _2667 || _2669;
            bool _2673 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2675 = _2671 || _2673;
            if (!_2675)
            {
                _2601 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2677 = _2601;
            _2603 = _2677;
            if (!_2675)
            {
                _2577 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2679 = _2577;
            _2579 = _2679;
            if (!_2675)
            {
                _2567 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2681 = _2567;
            _2569 = _2681;
            if (!_2675)
            {
                _2537 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2683 = _2537;
            _2539 = _2683;
            if (!_2675)
            {
                _2505 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2685 = _2505;
            _2507 = _2685;
            if (!_2675)
            {
                _2593 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2687 = _2593;
            bool _2689 = !_2675;
            _2595 = _2687;
            if (!_2689)
            {
                bool _2691 = _2208 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2693 = isnan(_2208);
                bool _2695 = _2691 || _2693;
                bool _2697 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2699 = _2695 || _2697;
                if (!_2699)
                {
                    float _2701 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2703 = _2208 + _2701;
                    float _2705 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2707 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2705;
                    float _2709 = 1.0 / _2707;
                    float _2711 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2713 = _2711 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2715 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2717 = _2715 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2719 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2721 = _2719 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2723 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2725 = _2723 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2727 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2729 = _2727 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2731 = _2703 * _2709;
                    float _2733 = precise::clamp(_2731, 0.0, 1.0);
                    float _2735 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2737 = _2735 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2739 = fma(_2733, _2713, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2741 = fma(_2733, _2737, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2743 = fma(_2733, _2717, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2745 = fma(_2733, _2721, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2747 = fma(_2733, _2725, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2749 = fma(_2733, _2729, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2579 = _2741;
                    _2507 = _2747;
                    _2603 = _2739;
                    _2539 = _2745;
                    _2569 = _2743;
                    _2595 = _2749;
                    _2665 = true;
                }
                else
                {
                    _2579 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2507 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2603 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2539 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2569 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2595 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2665 = false;
    float _2751 = _2579;
    float _2753 = _2507;
    float _2755 = _2603;
    float _2757 = _2539;
    float _2759 = _2569;
    float _2761 = _2595;
    float _2763 = fma(_1800, -0.5, 0.5);
    float _2765 = precise::clamp(_2763, 0.0, 1.0);
    float _2767 = -_2751;
    float _2769 = _2767 + _2753;
    float _2771 = _2589 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2773 = -_2755;
    float _2775 = _2773 + _2757;
    float _2777 = fma(_2765, _2769, _2751);
    out.m_82.x = 0.0;
    float _2779 = -_2759;
    float _2781 = _2779 + _2761;
    float _2783 = fma(_2765, _2775, _2755);
    float _2785 = _2777 * 0.586610972881317138671875;
    out.m_55.x = _2771;
    bool _2787 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2789 = fma(_2765, _2781, _2759);
    float _2791 = fma(_2783, 0.298911988735198974609375, _2785);
    bool _2793 = _2078 > 0.0;
    bool _2795 = isnan(_2078);
    bool _2797 = _2793 || _2795;
    bool _2799 = isnan(0.0);
    bool _2801 = _2797 || _2799;
    float _2803 = fma(_2789, 0.114477999508380889892578125, _2791);
    float _2805 = -_2803;
    float _2807 = _2783 + _2805;
    float _2809 = -_2803;
    float _2811 = _2777 + _2809;
    float _2813 = -_2803;
    float _2815 = _2789 + _2813;
    float _2817 = fma(_2807, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2803);
    float _2819 = fma(_2811, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2803);
    float _2821 = fma(_2815, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2803);
    bool _2823 = !_2787;
    if (!_2823)
    {
        float _2825 = -_2020;
        float _2827 = _2825 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2829 = -_2022;
        float _2831 = _2829 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2833 = -_2024;
        float _2835 = _2833 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2837 = _2827 * _2827;
        float _2839 = fma(_2831, _2831, _2837);
        float _2841 = fma(_2835, _2835, _2839);
        float _2843 = sqrt(_2841);
        float _2845 = rsqrt(_2841);
        float _2847 = -_2843;
        float _2849 = _2847 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2851 = _2849 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2853 = precise::clamp(_2851, 0.0, 1.0);
        float _2855 = _2831 * _2845;
        float _2857 = _2827 * _2845;
        float _2859 = abs(_2853);
        float _2861 = log2(_2859);
        float _2863 = _2835 * _2845;
        float _2865 = _2855 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2867 = _1800 * _2857;
        float _2869 = -_2857;
        float _2871 = -_2865;
        float _2873 = fma(_2869, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2871);
        float _2875 = fma(_1798, _2855, _2867);
        float _2877 = -_2863;
        float _2879 = fma(_2877, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2873);
        float _2881 = fma(_1802, _2863, _2875);
        float _2883 = precise::clamp(_2881, 0.0, 1.0);
        float _2885 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2887 = _2879 + _2885;
        float _2889 = _2861 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2891 = _2887 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2893 = precise::clamp(_2891, 0.0, 1.0);
        float _2895 = exp2(_2889);
        float _2897 = _2895 * _2893;
        float _2899 = _2883 * _2897;
        float _2901 = _2899 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2903 = _2899 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2905 = _2899 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_82.x = _2901;
        out.m_82.y = _2903;
        out.m_82.z = _2905;
    }
    out.m_84.x = _2817;
    out.m_84.y = _2819;
    out.m_84.z = _2821;
    if (_2801)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_55.x = 0.0;
    float _2907 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2907;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

