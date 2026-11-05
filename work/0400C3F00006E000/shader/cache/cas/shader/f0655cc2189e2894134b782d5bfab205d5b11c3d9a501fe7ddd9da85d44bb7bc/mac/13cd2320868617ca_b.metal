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
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c10 [[id(2)]];
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
    float4 m_70 [[user(locn0)]];
    float4 m_64 [[user(locn1)]];
    float4 m_72 [[user(locn2)]];
    float4 m_78 [[user(locn3)]];
    float4 m_88 [[user(locn4)]];
    float4 m_51 [[user(locn5)]];
    float4 m_66 [[user(locn6)]];
    float4 m_74 [[user(locn7)]];
    float4 m_76 [[user(locn8)]];
    float4 m_86 [[user(locn9)]];
    float4 m_82 [[user(locn10)]];
    float4 m_84 [[user(locn11)]];
    float4 m_90 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_80 [[attribute(0)]];
    float4 m_68 [[attribute(1)]];
    float4 m_58 [[attribute(2)]];
    float4 m_48 [[attribute(3)]];
    float4 m_53 [[attribute(4)]];
    float4 m_60 [[attribute(5)]];
    float4 m_62 [[attribute(6)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3051 = false;
    bool _2136 = false;
    bool _337 = false;
    bool _231 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _104 = in.m_48.w;
    float _106 = trunc(_104);
    int _109 = int(_106);
    bool _113 = _109 >= 1;
    float _115 = 0.0;
    if (!_113)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _117 = _115;
    float _119 = _117;
    if (!_113)
    {
        out.m_51.x = 0.0;
    }
    int _121 = 0;
    if (!_113)
    {
        float _123 = _117 * 5.0;
        _121 = as_type<int>(_123);
    }
    int _125 = _121;
    int _127 = _125;
    if (!_113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3410 = as_type<float>(_125);
        out.gl_Position.z = _3410;
    }
    if (!_113)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _129 = in.m_53.w;
    bool _131 = _129 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _133 = isnan(_129);
    bool _135 = _131 || _133;
    bool _137 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _139 = _135 || _137;
    float _141 = -_129;
    float _143 = _141 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _145 = 0.0;
    float _147 = _143;
    if (_139)
    {
        float _149 = float(_109);
        _145 = _149;
    }
    float _151 = _145;
    bool _153 = _143 >= _151;
    bool _155 = !_139;
    bool _157 = _153 || _155;
    if (_157)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _159 = _119;
    if (_157)
    {
        out.m_51.x = 0.0;
    }
    if (_157)
    {
        float _161 = _159 * 5.0;
        _127 = as_type<int>(_161);
    }
    int _163 = _127;
    if (_157)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3479 = as_type<float>(_163);
        out.gl_Position.z = _3479;
    }
    if (_157)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _165 = as_type<float>(int(gl_VertexIndex));
    float _167 = in.m_58.x;
    float _169 = in.m_58.y;
    float _171 = in.m_58.z;
    int _173 = as_type<int>(_165) & 1;
    bool _175 = _173 != 0;
    int _177 = as_type<int>(_165) & 2;
    bool _179 = _177 != 0;
    bool _181 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _183 = _169 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _185 = _169 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _187 = _169 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _189 = !_175;
    float _191 = _189 ? (-0.5) : 0.5;
    float _193 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[4].x, _183);
    float _195 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[5].x, _185);
    float _197 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[6].x, _187);
    bool _199 = !_179;
    float _201 = _199 ? (-0.5) : 0.5;
    float _203 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[4].z, _193);
    float _205 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[5].z, _195);
    float _207 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[6].z, _197);
    bool _209 = !_181;
    float _211 = _207;
    float _229;
    if (!_209)
    {
        float _213 = in.m_60.x;
        float _215 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _217 = _213 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _219 = fma(_217, (*spvDescriptorSet0.vp_c9)._m0[12].x, _143);
        float _221 = _219 * _215;
        float _223 = floor(_221);
        float _225 = -_223;
        float _227 = _221 + _225;
        _229 = _227;
        _231 = true;
    }
    else
    {
        float _233 = float(_109);
        float _235 = 1.0 / _233;
        float _237 = _143 * _235;
        _229 = _237;
    }
    _231 = false;
    float _239 = _229;
    float _241 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _243 = _239 + _241;
    bool _245 = _239 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _247 = isnan(_239);
    bool _249 = _245 || _247;
    bool _251 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _253 = _249 || _251;
    float _255 = float(_253);
    float _257 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _259 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _257;
    float _261 = -_255;
    float _263 = _261 + 1.0;
    bool _265 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _267 = 1.0 / _259;
    float _269 = _243 * _267;
    bool _271 = _239 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _273 = isnan(_239);
    bool _275 = _271 || _273;
    bool _277 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _279 = _275 || _277;
    float _281 = float(_279);
    float _283 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _285 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _283;
    float _287 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _289 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _287;
    float _291 = _281 * _263;
    float _293 = fma(_285, _269, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _295 = fma(_289, _269, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _297 = -_281;
    float _299 = _297 + 1.0;
    float _301 = _293 * _291;
    float _303 = _295 * _291;
    float _305 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[143].x, _301);
    float _307 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[143].y, _303);
    float _309 = fma(_255, (*spvDescriptorSet0.vp_c9)._m0[144].x, _305);
    float _311 = fma(_255, (*spvDescriptorSet0.vp_c9)._m0[144].y, _307);
    bool _313 = !_265;
    float _333;
    float _335;
    if (!_313)
    {
        float _315 = in.m_60.x;
        float _317 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _319 = float(_109);
        float _321 = _315 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _323 = fma(_321, (*spvDescriptorSet0.vp_c9)._m0[11].y, _143);
        float _325 = _323 * _317;
        float _327 = floor(_325);
        float _329 = -_327;
        float _331 = _325 + _329;
        _333 = _319;
        _335 = _331;
        _337 = true;
    }
    else
    {
        float _339 = float(_109);
        float _341 = 1.0 / _339;
        float _343 = _143 * _341;
        _333 = _339;
        _335 = _343;
    }
    _337 = false;
    float _345 = _333;
    float _347 = _335;
    float _349 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _351 = int(_349);
    float _353 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _355 = int(_353);
    float _357 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _361 = _359 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _363 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _365 = 1.0 / _345;
    float _367 = float(_351);
    float _369 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _371 = 1.0 / _367;
    float _373 = float(uint(_355));
    int _375 = ~_355;
    int _377 = _375 + 1;
    int _379 = ~_355;
    int _381 = _379 + 1;
    float _383 = float(_355);
    float _385 = 1.0 / _373;
    float _387 = _371 * _143;
    float _389 = 1.0 / _361;
    int _391 = as_type<int>(_385) + (-2);
    float _393 = trunc(_387);
    int _395 = int(_393);
    float _397 = float(uint(_395));
    float _399 = as_type<float>(_391) * _397;
    float _401 = trunc(_399);
    float _403 = precise::max(_401, 0.0);
    uint _406 = uint(_403);
    int _408 = _377 * int(_406);
    int _410 = _408 + _395;
    float _412 = float(uint(_410));
    float _414 = in.m_60.x;
    float _416 = in.m_60.y;
    float _418 = in.m_60.z;
    float _420 = as_type<float>(_391) * _412;
    float _422 = trunc(_420);
    float _424 = precise::max(_422, 0.0);
    uint _426 = uint(_424);
    int _428 = int(_406) + int(_426);
    float _430 = fma(_416, (*spvDescriptorSet0.vp_c9)._m0[88].w, _369);
    float _432 = float(_395);
    int _434 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _436 = _434 != 0;
    int _438 = _381 * _428;
    int _440 = _438 + _395;
    bool _442 = _432 >= _383;
    bool _444 = isnan(_432);
    bool _446 = _442 || _444;
    bool _448 = isnan(_383);
    bool _450 = _446 || _448;
    float _452 = float(_450);
    bool _454 = !_436;
    float _456 = _454 ? 7.345489978790283203125 : 1.0;
    bool _458 = uint(_440) >= uint(_355);
    float _460 = trunc(_452);
    int _462 = int(_460);
    float _464 = _456 * _414;
    bool _466 = !_458;
    int _468 = _466 ? 0 : (-1);
    bool _470 = _355 == 0;
    int _472 = ~_428;
    int _474 = _472 + _468;
    int _476 = _474 + 1;
    float _478 = floor(_464);
    int _480 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _482 = _480 != 0;
    int _484 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _486 = _484 != 0;
    int _488 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _490 = _488 != 0;
    int _492 = _355 * _476;
    int _494 = _492 + _395;
    int _496 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _498 = _496 != 0;
    bool _500 = _416 > 0.5;
    int _502 = ~_462;
    int _504 = _502 + 1;
    int _506 = _504 + 1;
    bool _508 = !_470;
    int _510 = _508 ? _494 : (-1);
    float _512 = -_191;
    int _514 = _500 ? as_type<int>(_512) : as_type<int>(_191);
    int _516 = int(_436);
    int _518 = _470 ? 2 : 0;
    int _520 = _516 | _518;
    int _522 = _498 ? 4 : 0;
    int _524 = _520 | _522;
    int _526 = _500 ? 8 : 0;
    int _528 = _524 | _526;
    int _530 = _482 ? 16 : 0;
    int _532 = _528 | _530;
    int _534 = _486 ? 32 : 0;
    int _536 = _532 | _534;
    int _538 = _490 ? 64 : 0;
    int _540 = _536 | _538;
    int _542 = _540 & 8;
    float _544 = -_478;
    float _546 = _464 + _544;
    int _548 = _510 * _506;
    int _550 = _355 + (-1);
    float _552 = _546 * _383;
    float _554 = _383 * _143;
    bool _556 = !_486;
    int _558 = _556 ? 0 : 1;
    int _560 = _462 * _550;
    int _562 = _560 + _548;
    float _564 = trunc(_552);
    int _566 = int(_564);
    float _568 = _554 * _365;
    bool _570 = !_482;
    int _572 = _570 ? 0 : 1;
    bool _574 = !_498;
    int _576 = _574 ? 0 : 1;
    int _578 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _580 = _578 != 0;
    float _582 = trunc(_568);
    int _584 = int(_582);
    int _586 = abs(_558);
    bool _588 = !_490;
    int _590 = _588 ? 0 : 1;
    int _592 = abs(_572);
    int _594 = _562 * _586;
    int _596 = abs(_576);
    bool _598 = !_580;
    int _600 = _598 ? 0 : 1;
    int _602 = abs(_590);
    int _604 = _566 * _596;
    int _606 = _604 + _395;
    int _608 = abs(_600);
    int _610 = _584 * _592;
    int _612 = _610 + _594;
    float _614 = float(uint(_606));
    int _616 = _606 * _602;
    int _618 = _616 + _612;
    int _620 = ~_355;
    int _622 = _620 + 1;
    int _624 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _626 = _624 != 0;
    int _628 = _566 * _608;
    int _630 = _628 + _618;
    int _632 = ~_355;
    int _634 = _632 + 1;
    float _636 = as_type<float>(_391) * _614;
    int _638 = ~_355;
    int _640 = _638 + 1;
    float _642 = float(uint(_630));
    float _644 = trunc(_636);
    float _646 = precise::max(_644, 0.0);
    uint _648 = uint(_646);
    bool _650 = !_626;
    float _652 = _650 ? _191 : as_type<float>(_514);
    int _654 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _656 = _654 != 0;
    float _658 = as_type<float>(_391) * _642;
    int _660 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _662 = _660 != 0;
    int _664 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _666 = _664 != 0;
    bool _668 = !_656;
    int _670 = _668 ? 0 : 1;
    float _672 = trunc(_658);
    float _674 = precise::max(_672, 0.0);
    uint _676 = uint(_674);
    int _678 = abs(_670);
    int _680 = _634 * int(_676);
    int _682 = _680 + _630;
    float _684 = float(uint(_682));
    float _686 = as_type<float>(_391) * _684;
    float _688 = trunc(_686);
    float _690 = precise::max(_688, 0.0);
    uint _692 = uint(_690);
    int _694 = _640 * int(_648);
    int _696 = _694 + _606;
    float _698 = float(uint(_696));
    int _700 = int(_676) + int(_692);
    float _702 = as_type<float>(_391) * _698;
    float _704 = _416 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _706 = _622 * _700;
    int _708 = _706 + _630;
    float _710 = in.m_62.x;
    float _712 = in.m_62.y;
    float _714 = fma(_704, -2.0, _363);
    float _716 = trunc(_702);
    float _718 = precise::max(_716, 0.0);
    uint _720 = uint(_718);
    bool _722 = uint(_708) >= uint(_355);
    bool _724 = !_722;
    int _726 = _724 ? 0 : (-1);
    int _728 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _730 = _728 != 0;
    float _732 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _734 = ~_700;
    int _736 = _734 + _726;
    int _738 = _736 + 1;
    int _740 = _355 * _738;
    int _742 = _740 + _630;
    float _744 = in.m_48.x;
    float _746 = in.m_48.y;
    float _748 = in.m_48.z;
    int _750 = int(_648) + int(_720);
    float _752 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _754 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _752;
    bool _756 = !_470;
    int _758 = _756 ? _742 : (-1);
    float _760 = _309 * _710;
    float _762 = _414 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _764 = _758 >> 31;
    int _766 = _758 & 3;
    bool _768 = _766 != 0;
    float _770 = -_357;
    float _772 = fma(_762, 2.0, _770);
    int _774 = _764 & 3;
    bool _776 = !_768;
    int _778 = _776 ? 0 : 1;
    int _780 = _758 & 3;
    bool _782 = _780 != 0;
    int _784 = _758 + _774;
    int _786 = _782 ? 0 : 1;
    bool _788 = uint(_766) > 1u;
    float _790 = _746 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _792 = _746 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _794 = _746 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _796 = _784 >> 2;
    float _798 = fma(_744, (*spvDescriptorSet0.vp_c10)._m0[4].x, _790);
    int _800 = ~_355;
    int _802 = _800 + 1;
    float _804 = fma(_744, (*spvDescriptorSet0.vp_c10)._m0[5].x, _792);
    int _806 = _796 << 4;
    int _808 = _806 + 368;
    float _810 = fma(_744, (*spvDescriptorSet0.vp_c10)._m0[6].x, _794);
    int _812 = ~_786;
    int _814 = _812 + 1;
    int _816 = _814 + 1;
    int _818 = _802 * _750;
    int _820 = _818 + _606;
    uint _822 = uint(int(uint(_808) >> uint(2)));
    uint _824 = uint(int(uint(int(_822)) >> uint(2)));
    int _826 = int(_822) & 3;
    float _828 = (*spvDescriptorSet0.vp_c9)._m0[int(_824)][_826];
    int _830 = int(_822) + 1;
    uint _832 = uint(int(uint(_830) >> uint(2)));
    int _834 = _830 & 3;
    float _836 = (*spvDescriptorSet0.vp_c9)._m0[int(_832)][_834];
    int _838 = _816;
    if (!_788)
    {
        int _840 = ~_786;
        int _842 = _840 + 1;
        _838 = _842;
    }
    int _844 = _838;
    float _846 = fma(_748, (*spvDescriptorSet0.vp_c10)._m0[5].z, _804);
    bool _848 = uint(_820) >= uint(_355);
    float _850 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _852 = _850 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _854 = !_848;
    int _856 = _854 ? 0 : (-1);
    bool _858 = uint(_766) >= 2u;
    float _860 = 1.0 / _852;
    float _862 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _864 = _858 ? 0 : 1;
    float _866 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _868 = _766 != 3;
    float _870 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _872 = _808 + 8;
    uint _874 = uint(int(uint(_872) >> uint(2)));
    uint _876 = uint(int(uint(int(_874)) >> uint(2)));
    int _878 = int(_874) & 3;
    float _880 = (*spvDescriptorSet0.vp_c9)._m0[int(_876)][_878];
    int _882 = int(_874) + 1;
    uint _884 = uint(int(uint(_882) >> uint(2)));
    int _886 = _882 & 3;
    float _888 = (*spvDescriptorSet0.vp_c9)._m0[int(_884)][_886];
    float _890 = _862 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _892 = _866 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _894 = _870 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _896 = ~_750;
    int _898 = _896 + _856;
    int _900 = _898 + 1;
    float _902 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _904 = _902 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    int _906 = abs(_778);
    float _908 = _754 * _860;
    out.m_64.x = _890;
    out.m_64.y = _892;
    out.m_64.z = _894;
    out.m_64.w = _732;
    float _910 = _416 + _414;
    float _912 = _414 * 2.0;
    float _914 = _416 * 2.0;
    float _916 = _910 + (-1.0);
    float _918 = floor(_912);
    float _920 = _904 * _389;
    int _922 = ~_864;
    int _924 = _922 + 1;
    int _926 = _924 + 1;
    int _928 = _355 * _900;
    int _930 = _928 + _606;
    int _932 = _926;
    if (_868)
    {
        int _934 = ~_864;
        int _936 = _934 + 1;
        _932 = _936;
    }
    int _938 = _932;
    float _940 = floor(_914);
    int _942 = abs(_844);
    float _944 = fma(_916, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _946 = !_470;
    int _948 = _946 ? _930 : (-1);
    int _950 = ~_942;
    int _952 = _950 + 1;
    int _954 = _952 + 1;
    bool _956 = _766 != 3;
    float _958 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _960 = log2(_958);
    int _962 = _954 * as_type<int>(_836);
    int _964 = abs(_938);
    int _966 = ~_906;
    int _968 = _966 + 1;
    int _970 = _968 + 1;
    bool _972 = !_956;
    int _974 = _972 ? 0 : (-1);
    float _976 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _978 = int(_976);
    int _980 = _970 * as_type<int>(_828);
    int _982 = _980 + _962;
    int _984 = abs(_974);
    float _986 = _416 + _418;
    int _988 = ~_964;
    int _990 = _988 + 1;
    int _992 = _990 + 1;
    float _994 = _960 * _143;
    int _996 = ~_984;
    int _998 = _996 + 1;
    int _1000 = _998 + 1;
    float _1002 = _986 + (-1.0);
    int _1004 = _992 * as_type<int>(_880);
    int _1006 = _1004 + _982;
    float _1008 = as_type<float>(_982);
    float _1010 = _880;
    if (_436)
    {
        _1008 = _414;
    }
    float _1012 = _1008;
    float _1014 = exp2(_994);
    float _1016 = _1012;
    if (_436)
    {
        _1010 = _416;
    }
    float _1018 = _1010;
    int _1020 = _1000 * as_type<int>(_888);
    int _1022 = _1020 + _1006;
    float _1024 = fma(_1002, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1026 = _1018;
    if (!_436)
    {
        _1016 = _418;
    }
    float _1028 = _1016;
    float _1030 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    if (!_436)
    {
        _1026 = _414;
    }
    float _1032 = _1026;
    bool _1034 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1036 = isnan(0.0);
    bool _1038 = _1034 || _1036;
    bool _1040 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1042 = _1038 || _1040;
    float _1044 = fma(_416, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1030);
    float _1046 = float(uint(_978));
    float _1048 = -_1014;
    float _1050 = _1048 + 1.0;
    float _1052 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1054 = _1028 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1056 = _1032 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _1058 = ~_678;
    int _1060 = _1058 + 1;
    int _1062 = _1060 + 1;
    float _1064 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1066 = _1042 ? _1050 : 0.0;
    float _1068 = 1.0 / _1046;
    bool _1070 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1072 = isnan(1.0);
    bool _1074 = _1070 || _1072;
    bool _1076 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1078 = _1074 || _1076;
    int _1080 = _1022 * _1062;
    float _1082 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1084 = 1.0 + _1082;
    float _1086 = -_1064;
    float _1088 = fma(_1054, 2.0, _1086);
    int _1090 = _948 * _678;
    int _1092 = _1090 + _1080;
    int _1094 = abs(_978);
    float _1096 = fma(_1056, -2.0, _1052);
    float _1098 = 1.0 / _1084;
    float _1100 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1102 = float(uint(_1094));
    float _1104 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[76].y, _714);
    bool _1106 = _918 > 0.0;
    float _1108 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1110 = fma(_414, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1100);
    bool _1112 = _918 >= 0.0;
    bool _1114 = isnan(_918);
    bool _1116 = _1112 || _1114;
    bool _1118 = isnan(0.0);
    bool _1120 = _1116 || _1118;
    float _1122 = 1.0 / _1102;
    float _1124 = fma(_414, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1108);
    float _1126 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1044);
    int _1128 = as_type<int>(_1068) + (-2);
    float _1130 = -_143;
    float _1132 = fma(_1130, (*spvDescriptorSet0.vp_c9)._m0[76].x, _772);
    float _1134 = float(uint(_1092));
    float _1136 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1124);
    int _1138 = abs(_1092);
    float _1140 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1110);
    float _1142 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[87].w, _430);
    float _1144 = -_143;
    float _1146 = fma(_1144, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1088);
    float _1148 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1096);
    if (_1078)
    {
        float _1150 = _1066 * _1098;
        _147 = _1150;
    }
    float _1152 = _147;
    float _1154 = as_type<float>(_1128) * _1134;
    bool _1156 = _418 > 0.5;
    float _1158 = _418 * 2.0;
    int _1160 = as_type<int>(_1122) + (-2);
    float _1162 = -_1136;
    float _1164 = _1162 + 1.0;
    float _1166 = float(uint(_1138));
    float _1168 = trunc(_1154);
    float _1170 = precise::max(_1168, 0.0);
    uint _1172 = uint(_1170);
    float _1174 = -_201;
    int _1176 = _1156 ? as_type<int>(_1174) : as_type<int>(_201);
    float _1178 = -_1126;
    float _1180 = _1178 + 1.0;
    int _1182 = _1120 ? 0 : 1;
    bool _1184 = _940 > 0.0;
    bool _1186 = _940 >= 0.0;
    bool _1188 = isnan(_940);
    bool _1190 = _1186 || _1188;
    bool _1192 = isnan(0.0);
    bool _1194 = _1190 || _1192;
    float _1196 = as_type<float>(_1160) * _1166;
    float _1198 = floor(_1158);
    int _1200 = ~_1182;
    int _1202 = _1200 + 1;
    int _1204 = _1202 + 1;
    int _1206 = ~_978;
    int _1208 = _1206 + 1;
    int _1210 = _1204;
    if (!_1106)
    {
        int _1212 = ~_1182;
        int _1214 = _1212 + 1;
        _1210 = _1214;
    }
    int _1216 = _1210;
    float _1218 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1220 = _347 + _1218;
    bool _1222 = _347 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1224 = isnan(_347);
    bool _1226 = _1222 || _1224;
    bool _1228 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1230 = _1226 || _1228;
    float _1232 = float(_1230);
    float _1234 = trunc(_1196);
    float _1236 = precise::max(_1234, 0.0);
    uint _1238 = uint(_1236);
    int _1240 = _1208 * int(_1172);
    int _1242 = _1240 + _1092;
    float _1244 = fma(_908, _1220, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1246 = _347 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1248 = isnan(_347);
    bool _1250 = _1246 || _1248;
    bool _1252 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1254 = _1250 || _1252;
    float _1256 = float(_1254);
    int _1258 = ~_1094;
    int _1260 = _1258 + 1;
    float _1262 = float(uint(_1242));
    float _1264 = -_1256;
    float _1266 = _1264 + 1.0;
    int _1268 = _1194 ? 0 : 1;
    float _1270 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _1272 = _1198 > 0.0;
    float _1274 = as_type<float>(_1128) * _1262;
    bool _1276 = _1198 >= 0.0;
    bool _1278 = isnan(_1198);
    bool _1280 = _1276 || _1278;
    bool _1282 = isnan(0.0);
    bool _1284 = _1280 || _1282;
    float _1286 = _1232 * _1266;
    bool _1288 = _347 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1290 = isnan(_347);
    bool _1292 = _1288 || _1290;
    bool _1294 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1296 = _1292 || _1294;
    float _1298 = float(_1296);
    int _1300 = _1260 * int(_1238);
    int _1302 = _1300 + _1138;
    float _1304 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1306 = _347 + _1304;
    float _1308 = _1244 * _1286;
    float _1310 = float(_1216);
    float _1312 = -_1298;
    float _1314 = _1312 + 1.0;
    float _1316 = float(uint(_1302));
    float _1318 = -_1232;
    float _1320 = _1318 + 1.0;
    bool _1322 = !_666;
    float _1324 = _1322 ? _201 : as_type<float>(_1176);
    float _1326 = _1256 * _1314;
    int _1328 = ~_1268;
    int _1330 = _1328 + 1;
    int _1332 = _1330 + 1;
    float _1334 = as_type<float>(_1160) * _1316;
    int _1336 = _1332;
    if (!_1184)
    {
        int _1338 = ~_1268;
        int _1340 = _1338 + 1;
        _1336 = _1340;
    }
    int _1342 = _1336;
    float _1344 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _1346 = _1284 ? 0 : 1;
    float _1348 = fma(_920, _1306, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1350 = fma(_748, (*spvDescriptorSet0.vp_c10)._m0[4].z, _798);
    int _1352 = ~_978;
    int _1354 = _1352 + 1;
    float _1356 = fma(_1320, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1308);
    int _1358 = ~_1346;
    int _1360 = _1358 + 1;
    int _1362 = _1360 + 1;
    float _1364 = _1350 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1366 = trunc(_1274);
    float _1368 = precise::max(_1366, 0.0);
    uint _1370 = uint(_1368);
    int _1372 = _1362;
    if (!_1272)
    {
        int _1374 = ~_1346;
        int _1376 = _1374 + 1;
        _1372 = _1376;
    }
    int _1378 = _1372;
    float _1380 = _1324 + (-0.5);
    int _1382 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1384 = _1382 != 0;
    int _1386 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1388 = _1386 != 0;
    int _1390 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1392 = _1390 != 0;
    float _1394 = fma(_748, (*spvDescriptorSet0.vp_c10)._m0[6].z, _810);
    float _1396 = _1270 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1398 = _652 + 0.5;
    int _1400 = ~_1094;
    int _1402 = _1400 + 1;
    float _1404 = trunc(_1334);
    float _1406 = precise::max(_1404, 0.0);
    uint _1408 = uint(_1406);
    float _1410 = _1344 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1412 = fma(_1396, _1398, _1146);
    bool _1414 = !_1384;
    int _1416 = _1414 ? 0 : 1;
    float _1418 = fma(_1348, _1326, _1356);
    float _1420 = -_1410;
    float _1422 = -_1148;
    float _1424 = fma(_1420, _1380, _1422);
    bool _1426 = !_1388;
    int _1428 = _1426 ? 0 : 1;
    float _1430 = _1394 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1432 = int(_1172) + int(_1370);
    float _1434 = fma(_1298, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1418);
    int _1436 = abs(_1428);
    float _1438 = -_1140;
    float _1440 = _1438 + 1.0;
    int _1442 = abs(_1416);
    int _1444 = _1354 * _1432;
    int _1446 = _1444 + _1092;
    float _1448 = -_1440;
    float _1450 = fma(_652, _1448, _1412);
    int _1452 = int(_1238) + int(_1408);
    float _1454 = -_1142;
    float _1456 = _1454 + 1.0;
    bool _1458 = uint(_1446) >= uint(_978);
    float _1460 = _846 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1462 = float(_1436);
    int _1464 = _1402 * _1452;
    int _1466 = _1464 + _1138;
    bool _1468 = !_1458;
    int _1470 = _1468 ? 0 : (-1);
    float _1472 = fma(_1324, _1456, _1424);
    int _1474 = _1092 ^ _978;
    float _1476 = _1462 * _1310;
    bool _1478 = uint(_1466) >= uint(_1094);
    float _1480 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1482 = ~_1432;
    int _1484 = _1482 + _1470;
    int _1486 = _1484 + 1;
    float _1488 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1490 = _1460 + _1488;
    bool _1492 = !_1478;
    int _1494 = _1492 ? 0 : (-1);
    out.m_66.x = _1450;
    out.m_66.y = _1472;
    float _1496 = float(_1442);
    int _1498 = _978 * _1486;
    int _1500 = _1498 + _1092;
    int _1502 = ~_1494;
    int _1504 = _1452 + _1502;
    int _1506 = _1504 + 1;
    float _1508 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1510 = _1430 + _1508;
    float _1512 = in.m_68.x;
    float _1514 = in.m_68.y;
    float _1516 = in.m_68.z;
    float _1518 = float(_1378);
    float _1520 = _1476 * (-2.0);
    bool _1522 = _978 == 0;
    float _1524 = _1496 * _1518;
    bool _1526 = _978 == 0;
    float _1528 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    uint _1530 = uint(int(uint(_1474) >> uint(31)));
    float _1532 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1534 = _1364 + _1532;
    float _1536 = _1490 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1538 = _1528 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1540 = ~int(_1530);
    int _1542 = _1540 + 1;
    float _1544 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1546 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1536);
    float _1548 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1550 = _1434 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _1552 = _1506 ^ _1542;
    float _1554 = _1480 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1556 = !_1522;
    int _1558 = _1556 ? _1500 : (-1);
    float _1560 = _1524 * (-2.0);
    float _1562 = _1544 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1564 = _1548 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1566 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1568 = _414 > 0.5;
    float _1570 = fma(_1510, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1546);
    int _1572 = ~_1542;
    int _1574 = _1572 + _1552;
    int _1576 = _1574 + 1;
    float _1578 = fma(_1560, _1512, _1512);
    bool _1580 = _542 != 0;
    out.m_70.x = _1562;
    out.m_70.y = _1564;
    out.m_70.z = _1538;
    out.m_70.w = _1550;
    float _1582 = -_191;
    int _1584 = _1568 ? as_type<int>(_1582) : as_type<int>(_191);
    float _1586 = fma(_1520, _1514, _1514);
    float _1588 = float(_1558);
    bool _1590 = !_662;
    float _1592 = _1590 ? _191 : as_type<float>(_1584);
    bool _1594 = !_1526;
    int _1596 = _1594 ? _1576 : (-1);
    float _1598 = fma(_1554, _1588, _1132);
    bool _1600 = _1570 >= 0.0;
    float _1602 = fma(_944, _1560, _944);
    float _1604 = float(_1596);
    float _1606 = _414 + (-0.5);
    float _1608 = _1490 * _1490;
    float _1610 = -_201;
    int _1612 = _1580 ? as_type<int>(_1610) : as_type<int>(_201);
    float _1614 = _1566 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1616 = fma(_1606, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1578);
    float _1618 = fma(_1534, _1534, _1608);
    bool _1620 = !_730;
    float _1622 = _1620 ? _201 : as_type<float>(_1612);
    float _1624 = _1592 + 0.5;
    float _1626 = -_1104;
    float _1628 = fma(_1614, _1604, _1626);
    float _1630 = fma(_1510, _1510, _1618);
    float _1632 = _1614;
    if (_1600)
    {
        out.m_51.x = 0.0;
    }
    float _1634 = fma(_1554, _1624, _1598);
    float _1636 = _1622 + (-0.5);
    float _1638 = rsqrt(_1630);
    float _1640 = fma(_1024, _1520, _1024);
    float _1642 = -_1164;
    float _1644 = fma(_1592, _1642, _1634);
    float _1646 = -_1614;
    float _1648 = fma(_1646, _1636, _1628);
    if (_1600)
    {
        _1632 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1650 = _1632;
    float _1652 = _760 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1654 = fma(_1622, _1180, _1648);
    bool _1656 = !_1392;
    int _1658 = _1656 ? 0 : 1;
    int _1660 = as_type<int>(_1650);
    if (_1600)
    {
        float _1662 = _1650 * 5.0;
        _1660 = as_type<int>(_1662);
    }
    int _1664 = _1660;
    float _1666 = _1652 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _1668 = fma(_1602, _1152, _1616);
    out.m_72.x = _1644;
    out.m_72.y = _1654;
    float _1670 = _416 + (-0.5);
    int _1672 = abs(_1658);
    float _1674 = _1666 * _1638;
    if (_1600)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5732 = as_type<float>(_1664);
        out.gl_Position.z = _5732;
    }
    float _1676 = _1534 * _1674;
    float _1678 = _1490 * _1674;
    if (_1600)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1680 = -_1678;
    float _1682 = _1460 + _1680;
    float _1684 = _1510 * _1674;
    float _1686 = -_1676;
    float _1688 = _1364 + _1686;
    float _1690 = _1668 * 0.15915493667125701904296875;
    float _1692 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1694 = _1682 + _1692;
    float _1696 = -_1684;
    float _1698 = _1430 + _1696;
    float _1700 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1702 = _1688 + _1700;
    float _1704 = -_1678;
    float _1706 = _1490 + _1704;
    float _1708 = _1694 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1710 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1712 = _1698 + _1710;
    float _1714 = float(_1342);
    float _1716 = fma(_1670, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1586);
    float _1718 = fma(_1702, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1708);
    float _1720 = float(_1672);
    float _1722 = -_1676;
    float _1724 = _1534 + _1722;
    float _1726 = _1706 * _1706;
    float _1728 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1718);
    float _1730 = _418 + _414;
    float _1732 = _1720 * _1714;
    float _1734 = fma(_1640, _1152, _1716);
    float _1736 = fma(_1724, _1724, _1726);
    bool _1738 = _1728 >= 0.0;
    float _1740 = -_1684;
    float _1742 = _1510 + _1740;
    float _1744 = _1730 + (-1.0);
    float _1746 = _1732 * (-2.0);
    float _1748 = _1734 * 0.15915493667125701904296875;
    float _1750 = fma(_1742, _1742, _1736);
    float _1752 = _1690 * 6.283185482025146484375;
    float _1754 = sin(_1752);
    float _1756 = fma(_1744, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1758 = _418 + (-0.5);
    float _1760 = fma(_1746, _1516, _1516);
    float _1762 = fma(_1756, _1746, _1756);
    float _1764 = _1724;
    int _1766 = as_type<int>(_1758);
    float _1768 = _1684;
    if (_1738)
    {
        _1764 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1770 = _1764;
    float _1772 = fma(_1758, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1760);
    float _1774 = _1690 * 6.283185482025146484375;
    float _1776 = cos(_1774);
    if (_1738)
    {
        out.m_51.x = 0.0;
    }
    if (_1738)
    {
        float _1778 = _1770 * 5.0;
        _1766 = as_type<int>(_1778);
    }
    int _1780 = _1766;
    float _1782 = fma(_1762, _1152, _1772);
    float _1784 = _1748 * 6.283185482025146484375;
    float _1786 = sin(_1784);
    if (_1738)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5915 = as_type<float>(_1780);
        out.gl_Position.z = _5915;
    }
    float _1788 = _1782 * 0.15915493667125701904296875;
    float _1790 = sqrt(_1750);
    float _1792 = _1748 * 6.283185482025146484375;
    float _1794 = cos(_1792);
    if (_1738)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1796 = _1788 * 6.283185482025146484375;
    float _1798 = cos(_1796);
    float _1800 = _311 * _712;
    float _1802 = _1638 * _1790;
    float _1804 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _201);
    float _1806 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _191);
    float _1808 = _1800 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1810 = _1652 * _1802;
    float _1812 = _1776 * _1786;
    float _1814 = _1788 * 6.283185482025146484375;
    float _1816 = sin(_1814);
    float _1818 = _1802 * _1808;
    float _1820 = _1776 * _1794;
    float _1822 = _1754 * _1794;
    float _1824 = _1806 * _1810;
    float _1826 = _1804 * _1818;
    float _1828 = _1754 * _1786;
    float _1830 = _1776 * _1798;
    float _1832 = _1786 * _1798;
    float _1834 = _1794 * _1798;
    float _1836 = _1754 * _1798;
    float _1838 = _1830 * _1826;
    float _1840 = _1802 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1842 = _1840 * 0.5;
    float _1844 = fma(_1816, _1820, _1828);
    float _1846 = -_1826;
    float _1848 = _1816 * _1846;
    float _1850 = -_1822;
    float _1852 = fma(_1816, _1812, _1850);
    float _1854 = -_1812;
    float _1856 = fma(_1816, _1822, _1854);
    float _1858 = fma(_1844, _1824, _1838);
    float _1860 = _1836 * _1826;
    float _1862 = fma(_1834, _1824, _1848);
    float _1864 = fma(_1816, _1828, _1820);
    float _1866 = fma(_1852, _1842, _1858);
    float _1868 = fma(_1856, _1824, _1860);
    float _1870 = fma(_1832, _1842, _1862);
    float _1872 = _1844 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1874 = _1866 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1876 = _1866 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1878 = fma(_1864, _1842, _1868);
    float _1880 = _1866 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1882 = fma(_1870, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1874);
    float _1884 = fma(_1870, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1876);
    float _1886 = _1844 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1888 = fma(_1870, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1880);
    float _1890 = fma(_1878, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1882);
    float _1892 = fma(_1878, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1884);
    float _1894 = _1844 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1896 = fma(_1878, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1888);
    float _1898 = _1890 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1900 = _1892 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1902 = fma(_1834, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1872);
    float _1904 = fma(_1834, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1886);
    float _1906 = _1364 + _1898;
    float _1908 = _1430 + _1900;
    float _1910 = fma(_1834, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1894);
    float _1912 = _1830 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1914 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1916 = _1906 + _1914;
    float _1918 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1920 = _1908 + _1918;
    float _1922 = _1830 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1924 = _1830 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1926 = _1916 * _1916;
    float _1928 = _1920 * _1920;
    float _1930 = _1896 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1932 = _1852 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1934 = _1852 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1936 = _1926 + _1928;
    float _1938 = -_1816;
    float _1940 = fma(_1938, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1912);
    float _1942 = -_1816;
    float _1944 = fma(_1942, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1922);
    float _1946 = -_1816;
    float _1948 = fma(_1946, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1924);
    float _1950 = sqrt(_1936);
    float _1952 = _1852 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1954 = _1460 + _1930;
    float _1956 = fma(_1856, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1902);
    float _1958 = fma(_1856, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1904);
    float _1960 = fma(_1856, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1910);
    float _1962 = fma(_1832, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1932);
    float _1964 = fma(_1832, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1934);
    float _1966 = fma(_1832, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1952);
    bool _1968 = _1950 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1970 = _1952;
    float _1972 = _1926;
    float _1974 = _1928;
    float _1976 = _1906;
    float _1978 = _1908;
    float _1980 = _1802;
    if (!_1968)
    {
        _1970 = _1954;
    }
    float _1982 = _1970;
    bool _1984 = !_1968;
    float _1986 = _1982;
    if (!_1984)
    {
        float _1988 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1990 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1992 = _1950 + _1990;
        float _1994 = _1954 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1996 = rsqrt(_1936);
        float _1998 = _1992 * _1988;
        float _2000 = _1998 * 0.15915493667125701904296875;
        float _2002 = _2000 * 6.283185482025146484375;
        float _2004 = sin(_2002);
        float _2006 = _2000 * 6.283185482025146484375;
        float _2008 = cos(_2006);
        float _2010 = fma(_2004, _1994, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2012 = _1996 * _2010;
        float _2014 = fma(_1916, _2012, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2016 = _2008 + (-1.0);
        float _2018 = fma(_1920, _2012, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2020 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2022 = _2014 + _2020;
        float _2024 = _2016 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2026 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2028 = _2018 + _2026;
        float _2030 = _2022 * _2022;
        float _2032 = fma(_1954, _2008, _2024);
        float _2034 = _2028 * _2028;
        _1986 = _2032;
        _1972 = _2030;
        _1974 = _2034;
        _1976 = _2014;
        _1978 = _2018;
    }
    float _2036 = _1986;
    float _2038 = _1972;
    float _2040 = _1974;
    float _2042 = _1976;
    float _2044 = _1978;
    float _2046 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2048 = _2036 + _2046;
    float _2050 = fma(_1836, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1940);
    float _2052 = fma(_1836, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1944);
    float _2054 = _201 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2056 = fma(_2048, _2048, _2038);
    float _2058 = fma(_1836, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1948);
    float _2060 = _191 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2062 = _2054 * _2050;
    float _2064 = _2056 + _2040;
    float _2066 = _2054 * _2052;
    float _2068 = _2054 * _2058;
    float _2070 = fma(_1864, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1962);
    float _2072 = fma(_1864, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1964);
    float _2074 = fma(_1864, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1966);
    float _2076 = sqrt(_2064);
    float _2078 = fma(_2060, _1956, _2062);
    float _2080 = fma(_2060, _1958, _2066);
    float _2082 = fma(_2060, _1960, _2068);
    float _2084 = _2070 + _2078;
    float _2086 = _2072 + _2080;
    float _2088 = _2074 + _2082;
    out.m_74.x = _2084;
    out.m_74.y = _2086;
    out.m_74.z = _2088;
    bool _2090 = _2076 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2092 = isnan(_2076);
    bool _2094 = _2090 || _2092;
    bool _2096 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2098 = _2094 || _2096;
    float _2100 = _2068;
    if (!_2098)
    {
        _2100 = 1.0;
    }
    float _2102 = _2100;
    bool _2104 = !_2098;
    float _2106 = _2102;
    if (!_2104)
    {
        bool _2108 = _2076 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2110 = isnan(_2076);
        bool _2112 = _2108 || _2110;
        bool _2114 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2116 = _2112 || _2114;
        if (!_2116)
        {
            float _2118 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2120 = _2076 + _2118;
            float _2122 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2124 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2122;
            float _2126 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2128 = _2126 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2130 = 1.0 / _2124;
            float _2132 = _2120 * _2130;
            float _2134 = fma(_2132, _2128, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2106 = _2134;
            _2136 = true;
        }
        else
        {
            bool _2138 = _2076 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2140 = isnan(_2076);
            bool _2142 = _2138 || _2140;
            bool _2144 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2146 = _2142 || _2144;
            if (!_2146)
            {
                float _2148 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2150 = _2076 + _2148;
                float _2152 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2154 = _2152 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2156 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2158 = _2156 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2160 = 1.0 / _2154;
                float _2162 = _2150 * _2160;
                float _2164 = fma(_2162, _2158, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2106 = _2164;
                _2136 = true;
            }
            else
            {
                _2106 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2136 = false;
    float _2166 = _2106;
    float _2168 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2170 = _2036 + _2168;
    float _2172 = _1682 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2174 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2176 = _2042 + _2174;
    float _2178 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2180 = _2044 + _2178;
    float _2182 = fma(_2170, _2166, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2184 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2172);
    float _2186 = fma(_2176, _2166, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2188 = fma(_2180, _2166, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2190 = -_1460;
    float _2192 = _2190 + _2182;
    float _2194 = fma(_1698, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2184);
    float _2196 = -_1364;
    float _2198 = _2196 + _2186;
    float _2200 = -_1430;
    float _2202 = _2200 + _2188;
    float _2204 = _2192 * _2192;
    float _2206 = _2194 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2208 = _1682 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2210 = fma(_2198, _2198, _2204);
    float _2212 = 1.0 / _2206;
    float _2214 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2208);
    float _2216 = fma(_2202, _2202, _2210);
    float _2218 = fma(_1698, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2214);
    float _2220 = sqrt(_2216);
    float _2222 = _2218 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2224 = _2222 + _2206;
    float _2226 = _2224 * _2212;
    float _2228 = _2226 * 0.5;
    bool _2230 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2232 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2234 = _2230 || _2232;
    bool _2236 = isnan(0.5);
    bool _2238 = _2234 || _2236;
    float _2240 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2242 = fma(_2228, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2240);
    bool _2244 = _2220 > 0.0;
    float _2246 = 1.0 / _2242;
    bool _2248 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2250 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2252 = _2248 || _2250;
    bool _2254 = isnan(0.5);
    bool _2256 = _2252 || _2254;
    float _2258 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _2260 = _2188;
    float _2262 = _2182;
    float _2264 = _2212;
    if (!_2244)
    {
        _2258 = _2186;
    }
    float _2266 = _2258;
    bool _2268 = !_2244;
    float _2270 = _2266;
    if (!_2268)
    {
        float _2272 = _205 * _205;
        float _2274 = fma(_203, _203, _2272);
        float _2276 = rsqrt(_2216);
        float _2278 = fma(_207, _207, _2274);
        float _2280 = sqrt(_2278);
        float _2282 = _2198 * _2276;
        float _2284 = _2192 * _2276;
        float _2286 = _2202 * _2276;
        bool _2288 = _2280 > 0.0;
        float _2290 = _2280;
        if (!_2288)
        {
            _2290 = _2186;
        }
        float _2292 = _2290;
        bool _2294 = !_2288;
        _2270 = _2292;
        if (!_2294)
        {
            float _2296 = rsqrt(_2278);
            float _2298 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2300 = _205 * _2296;
            float _2302 = _203 * _2296;
            float _2304 = _2284 * _2300;
            float _2306 = _207 * _2296;
            float _2308 = fma(_2282, _2302, _2304);
            float _2310 = _2298 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2312 = fma(_2286, _2306, _2308);
            float _2314 = _2312 * _2310;
            float _2316 = fma(_203, _2314, _2186);
            float _2318 = fma(_205, _2314, _2182);
            float _2320 = fma(_207, _2314, _2188);
            _2270 = _2316;
            _2260 = _2320;
            _2262 = _2318;
            _2264 = _2298;
        }
    }
    float _2322 = _2270;
    float _2324 = _2260;
    float _2326 = _2262;
    float _2328 = _2264;
    float _2330 = -_1676;
    float _2332 = _2330 + _2322;
    float _2334 = -_1684;
    float _2336 = _2334 + _2324;
    float _2338 = -_1678;
    float _2340 = _2338 + _2326;
    float _2342 = _2340;
    float _2344 = _2336;
    float _2346 = _2324;
    if (_2238)
    {
        _211 = 1.0;
    }
    float _2348 = _211;
    float _2350 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2352 = _2246 * _2350;
    float _2354 = _2348;
    if (_2256)
    {
        _1768 = _2332;
    }
    float _2356 = _1768;
    float _2358 = _2356;
    if (!_2256)
    {
        float _2360 = _1694 * _1694;
        float _2362 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2364 = -_1430;
        float _2366 = _2364 + _2324;
        float _2368 = -_1460;
        float _2370 = _2368 + _2326;
        float _2372 = fma(_1702, _1702, _2360);
        float _2374 = -_1364;
        float _2376 = _2374 + _2322;
        float _2378 = fma(_1712, _1712, _2372);
        float _2380 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2382 = sqrt(_2378);
        float _2384 = _2362 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2386 = 1.0 / _1802;
        float _2388 = precise::min(_2382, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2390 = _2388 * _2380;
        float _2392 = _2390 * _2386;
        float _2394 = _2384 * _2392;
        float _2396 = _2366 * _2392;
        float _2398 = fma(_2370, _2394, _1682);
        float _2400 = fma(_2376, _2394, _1688);
        float _2402 = fma(_2384, _2396, _1698);
        _2342 = _2398;
        _2358 = _2400;
        _2344 = _2402;
        _2346 = _2396;
        _1980 = _2386;
    }
    float _2404 = _2342;
    float _2406 = _2358;
    float _2408 = _2344;
    float _2410 = _2346;
    float _2412 = _1980;
    float _2414 = _2412;
    float _2416 = _2410;
    if (!_2238)
    {
        float _2418 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2420 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2422 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2420;
        float _2424 = _2418 * 0.15915493667125701904296875;
        float _2426 = _2424 * 6.283185482025146484375;
        float _2428 = cos(_2426);
        float _2430 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2432 = _2430 * 0.15915493667125701904296875;
        float _2434 = _2424 * 6.283185482025146484375;
        float _2436 = sin(_2434);
        float _2438 = 1.0 / _2428;
        float _2440 = _2432 * 6.283185482025146484375;
        float _2442 = cos(_2440);
        float _2444 = _2436 * _2438;
        float _2446 = _2432 * 6.283185482025146484375;
        float _2448 = sin(_2446);
        float _2450 = _2442 * _2444;
        float _2452 = 1.0 / _2422;
        float _2454 = 1.0 / _2450;
        float _2456 = _2448 * _2454;
        float _2458 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2460 = fma(_2352, _2456, _2458);
        float _2462 = _2460 * _2452;
        float _2464 = precise::clamp(_2462, 0.0, 1.0);
        _2414 = _2460;
        _2354 = _2464;
    }
    float _2466 = _2414;
    float _2468 = _2354;
    float _2470 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2472 = _2404 + _2470;
    float _2474 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2476 = _2406 + _2474;
    float _2478 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2480 = _2408 + _2478;
    float _2482 = _2472 * _2472;
    float _2484 = fma(_2476, _2476, _2482);
    float _2486 = fma(_2480, _2480, _2484);
    float _2488 = rsqrt(_2486);
    float _2490 = sqrt(_2486);
    float _2492 = _2476 * _2488;
    float _2494 = _2480 * _2488;
    float _2496 = _2472 * _2488;
    float _2498 = _2492 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2500 = _2494 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2502 = _2498 * _2498;
    float _2504 = _2500 * _2500;
    float _2506 = _2502 + _2504;
    float _2508 = sqrt(_2506);
    bool _2510 = _2508 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2512 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2514 = _2508 + _2512;
    float _2516 = _2328;
    float _2518 = _2514;
    float _2520 = _2506;
    if (_2510)
    {
        float _2522 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2516 = _2522;
    }
    float _2524 = _2516;
    float _2526 = _2524;
    if (_2510)
    {
        float _2528 = _2514 * _2524;
        _2518 = _2528;
    }
    float _2530 = _2518;
    if (_2510)
    {
        float _2532 = rsqrt(_2506);
        _2526 = _2532;
    }
    float _2534 = _2526;
    float _2536 = _2534;
    if (_2510)
    {
        float _2538 = _2530 * 0.15915493667125701904296875;
        _2416 = _2538;
    }
    float _2540 = _2416;
    float _2542 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2544 = _2326;
    float _2546 = _2540;
    if (_2510)
    {
        float _2548 = _2540 * 6.283185482025146484375;
        float _2550 = sin(_2548);
        _2544 = _2550;
    }
    float _2552 = _2544;
    float _2554 = precise::max(0.0, _2542);
    float _2556 = _2466;
    float _2558 = _2554;
    float _2560 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_2510)
    {
        float _2562 = _2540 * 6.283185482025146484375;
        float _2564 = cos(_2562);
        _2556 = _2564;
    }
    float _2566 = _2556;
    float _2568 = -_2496;
    float _2570 = -_2554;
    float _2572 = fma(_2568, (*spvDescriptorSet0.vp_c15)._m0[24].y, _2570);
    float _2574 = fma(_1688, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    if (_2510)
    {
        float _2576 = _2572 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2558 = _2576;
    }
    float _2578 = _2558;
    float _2580 = _2552;
    float _2582 = _2578;
    if (_2510)
    {
        float _2584 = fma(_2552, _2578, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2580 = _2584;
    }
    float _2586 = _2580;
    float _2588 = _2586;
    if (!_2510)
    {
        _2546 = _2498;
    }
    float _2590 = _2546;
    float _2592 = _2590;
    if (!_2510)
    {
        _2582 = _2500;
    }
    float _2594 = _2582;
    float _2596 = _2594;
    if (_2510)
    {
        float _2598 = _2534 * _2586;
        _2588 = _2598;
    }
    float _2600 = _2588;
    if (!_2510)
    {
        _2536 = _2572;
    }
    float _2602 = _2536;
    float _2604 = _2602;
    float _2606 = _2566;
    if (_2510)
    {
        float _2608 = _2566 + (-1.0);
        _2560 = _2608;
    }
    float _2610 = _2560;
    float _2612 = _2610;
    if (_2510)
    {
        float _2614 = _2498 * _2600;
        _2592 = _2614;
    }
    float _2616 = _2592;
    if (_2510)
    {
        float _2618 = _2500 * _2600;
        _2596 = _2618;
    }
    float _2620 = _2596;
    if (_2510)
    {
        float _2622 = _2610 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2520 = _2622;
    }
    float _2624 = _2520;
    if (!_2510)
    {
        _2612 = _2502;
    }
    float _2626 = _2612;
    float _2628 = _2626;
    if (_2510)
    {
        float _2630 = _2616 * _2616;
        _2628 = _2630;
    }
    float _2632 = _2628;
    float _2634 = floor(_2574);
    if (_2510)
    {
        float _2636 = fma(_2572, _2566, _2624);
        _2604 = _2636;
    }
    float _2638 = _2604;
    float _2640 = _2404 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (!_2510)
    {
        _2606 = _2504;
    }
    float _2642 = _2606;
    float _2644 = _2642;
    if (_2510)
    {
        float _2646 = _2620 * _2620;
        _2644 = _2646;
    }
    float _2648 = _2644;
    float _2650 = fma(_2638, _2638, _2632);
    float _2652 = fma(_2406, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2640);
    float _2654 = fma(_1698, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2656 = _2650 + _2648;
    float _2658 = fma(_2408, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2652);
    float _2660 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2662 = rsqrt(_2656);
    float _2664 = _2658 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2666 = _2404 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2668 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2670 = fma(_2490, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2668);
    float _2672 = precise::clamp(_2670, 0.0, 1.0);
    float _2674 = -_2634;
    float _2676 = _2574 + _2674;
    float _2678 = _2664 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2680 = fma(_2406, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2666);
    float _2682 = -_2672;
    float _2684 = _2682 + 1.0;
    float _2686 = floor(_2654);
    float _2688 = -_2678;
    float _2690 = fma(_2688, _2660, 1.0);
    float _2692 = _2404 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2694 = _2404 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2696 = fma(_2408, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2680);
    float _2698 = fma(_2406, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2692);
    float _2700 = fma(_2406, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2694);
    float _2702 = _2662 * _2616;
    float _2704 = _2662 * _2638;
    float _2706 = fma(_2408, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2698);
    float _2708 = abs(_2684);
    float _2710 = log2(_2708);
    float _2712 = _2702 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2714 = _2662 * _2620;
    float _2716 = _2706 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2718 = _2696 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2720 = -_2712;
    float _2722 = fma(_2704, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2720);
    float _2724 = fma(_2408, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2700);
    float _2726 = _2716 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2728 = log2(_2690);
    float _2730 = -_2714;
    float _2732 = fma(_2730, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2722);
    float _2734 = _2716 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2736 = fma(_2718, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2726);
    float _2738 = -_2686;
    float _2740 = _2654 + _2738;
    float _2742 = fma(_2732, -0.5, 0.5);
    float _2744 = fma(_2718, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2734);
    float _2746 = fma(_2664, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2736);
    float _2748 = _2710 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2750 = _2724 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2752 = sqrt(_2742);
    float _2754 = fma(_2750, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2746);
    float _2756 = _2716 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2758 = _2728 * 0.693147182464599609375;
    float _2760 = 1.0 / _2754;
    float _2762 = fma(_2664, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2744);
    float _2764 = fma(_2750, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2762);
    float _2766 = exp2(_2748);
    float _2768 = _2752 * 0.636619746685028076171875;
    float _2770 = fma(_2732, 0.5, 0.5);
    float _2772 = fma(_2718, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2756);
    float _2774 = _2704 + 1.0;
    float _2776 = fma(_2770, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2778 = fma(_2664, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2772);
    float _2780 = _2764 * _2760;
    float _2782 = -_2704;
    float _2784 = fma(_2766, _2774, _2782);
    float _2786 = fma(_2770, _2776, -0.212114393711090087890625);
    float _2788 = fma(_2750, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2778);
    float _2790 = _2758 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2792 = fma(_2780, 0.5, 0.5);
    float _2794 = fma(_2770, _2786, 1.570728778839111328125);
    float _2796 = _2788 * _2760;
    float2 _7573 = float2(_2676, _2740);
    float _2798 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7573, float2(0.0), isnan(_7573)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7573, float2(0.0), isnan(_7573)), level(0.0)).x;
    float _2800 = -_2794;
    float _2802 = fma(_2768, _2800, 1.0);
    float _2804 = fma(_2796, -0.5, 0.5);
    float _2806 = fma(_2784, 0.5, 0.5);
    float3 _7593 = float3(_2792, _2804, _2790);
    float _2808 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7593, float3(0.0), isnan(_7593)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7593, float3(0.0), isnan(_7593)), level(0.0)).x;
    float3 _7604 = float3(_2792, _2804, _2790);
    float4 _2811 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7604, float3(0.0), isnan(_7604)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7604, float3(0.0), isnan(_7604)), level(0.0)).xyzw;
    float _2813 = _2811.x;
    float _2815 = _2811.y;
    float _2817 = _2811.z;
    float _2819 = _2811.w;
    float2 _7620 = float2(_2802, _2806);
    float3 _2823 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7620, float2(0.0), isnan(_7620)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7620, float2(0.0), isnan(_7620)), level(0.0)).xyz;
    float _2825 = _2823.x;
    float _2827 = _2823.y;
    float _2829 = _2823.z;
    float _2831 = abs(_2352);
    float _2833 = log2(_2831);
    float _2835 = _2716 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_76.x = _2406;
    out.m_76.y = _2404;
    out.m_76.z = _2408;
    bool _2837 = _2490 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2839 = isnan(_2490);
    bool _2841 = _2837 || _2839;
    bool _2843 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2845 = _2841 || _2843;
    float _2847 = fma(_2718, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2835);
    bool _2849 = _2352 <= 8000.0;
    bool _2851 = isnan(_2352);
    bool _2853 = _2849 || _2851;
    bool _2855 = isnan(8000.0);
    bool _2857 = _2853 || _2855;
    float _2859 = float(_2857);
    float _2861 = fma(_2664, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2847);
    float _2863 = fma(_2750, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2861);
    float _2865 = _2833 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2867 = _2863 + _2754;
    float _2869 = exp2(_2865);
    float _2871 = _2867 * 0.5;
    out.m_78.z = _2871;
    out.m_78.w = _2754;
    float _2873 = fma(_2869, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2875 = precise::clamp(_2873, 0.0, 1.0);
    float _2877 = fma(_2875, -2.0, 3.0);
    float _2879 = _2875 * _2875;
    float _2881 = _2879 * _2877;
    float _2883 = _2710 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2885 = -_2881;
    float _2887 = _2885 + 1.0;
    float _2889 = exp2(_2883);
    float _2891 = fma(_2887, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2881);
    float _2893 = in.m_80.x;
    float _2895 = _2859 * _2891;
    out.gl_Position.x = _2764;
    out.gl_Position.y = _2788;
    out.gl_Position.z = _2863;
    out.gl_Position.w = _2754;
    float _2897 = _2895 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2899 = _2468 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2901 = -_2889;
    float _2903 = _2901 + 1.0;
    float _2905 = _2903 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2907 = _2754;
    float _2909 = _2863;
    float _2911 = _2788;
    float _2913 = _2764;
    float _2915 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    if (!_2845)
    {
        _2907 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2917 = _2907;
    float _2919 = _2917;
    float _2921 = _2917;
    if (!_2845)
    {
        _2909 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2923 = _2909;
    float _2925 = _2923;
    float _2927 = _2923;
    if (!_2845)
    {
        _2911 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2929 = _2911;
    float _2931 = _2929;
    float _2933 = _2929;
    if (!_2845)
    {
        _2913 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2935 = _2913;
    float _2937 = -_2798;
    float _2939 = _2937 + 1.0;
    float _2941 = _2939 * _2897;
    float _2943 = precise::clamp(_2941, 0.0, 1.0);
    float _2945 = _2905 * _2808;
    float _2947 = -_2905;
    float _2949 = _2947 + 1.0;
    float _2951 = -_2943;
    float _2953 = fma(_2951, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2955 = _2813;
    float _2957 = _2935;
    float _2959 = _2935;
    if (!_2845)
    {
        _2915 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2961 = _2915;
    float _2963 = _2819 * _2945;
    float _2965 = _2829 * _2945;
    float _2967 = _2953 * _2893;
    float _2969 = _2819 * _2949;
    float _2971 = fma(_2825, _2963, _2813);
    float _2973 = fma(_2827, _2963, _2815);
    float _2975 = _2967 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2977 = fma(_2819, _2965, _2817);
    float _2979 = _2961;
    float _2981 = _2961;
    if (!_2845)
    {
        _2955 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2983 = _2955;
    out.m_82.x = _2975;
    out.m_84.x = _2971;
    out.m_84.y = _2973;
    out.m_84.z = _2977;
    out.m_84.w = _2969;
    bool _2985 = !_2845;
    float _2987 = _2983;
    float _2989 = _2983;
    if (!_2985)
    {
        bool _2991 = _2490 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2993 = isnan(_2490);
        bool _2995 = _2991 || _2993;
        bool _2997 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2999 = _2995 || _2997;
        if (!_2999)
        {
            float _3001 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3003 = _2490 + _3001;
            float _3005 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3007 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3005;
            float _3009 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3011 = _3009 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3013 = 1.0 / _3007;
            float _3015 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3017 = _3015 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3019 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3021 = _3019 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3023 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3025 = _3023 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3027 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3029 = _3027 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3031 = _3003 * _3013;
            float _3033 = precise::clamp(_3031, 0.0, 1.0);
            float _3035 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3037 = _3035 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3039 = fma(_3033, _3011, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3041 = fma(_3033, _3037, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3043 = fma(_3033, _3017, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3045 = fma(_3033, _3021, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3047 = fma(_3033, _3025, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3049 = fma(_3033, _3029, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2989 = _3043;
            _2933 = _3047;
            _2981 = _3039;
            _2927 = _3045;
            _2921 = _3041;
            _2959 = _3049;
            _3051 = true;
        }
        else
        {
            bool _3053 = _2490 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3055 = isnan(_2490);
            bool _3057 = _3053 || _3055;
            bool _3059 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3061 = _3057 || _3059;
            if (!_3061)
            {
                _2979 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3063 = _2979;
            _2981 = _3063;
            if (!_3061)
            {
                _2987 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3065 = _2987;
            _2989 = _3065;
            if (!_3061)
            {
                _2919 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3067 = _2919;
            _2921 = _3067;
            if (!_3061)
            {
                _2925 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3069 = _2925;
            _2927 = _3069;
            if (!_3061)
            {
                _2931 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3071 = _2931;
            _2933 = _3071;
            if (!_3061)
            {
                _2957 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3073 = _2957;
            bool _3075 = !_3061;
            _2959 = _3073;
            if (!_3075)
            {
                bool _3077 = _2490 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3079 = isnan(_2490);
                bool _3081 = _3077 || _3079;
                bool _3083 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3085 = _3081 || _3083;
                if (!_3085)
                {
                    float _3087 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3089 = _2490 + _3087;
                    float _3091 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3093 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3091;
                    float _3095 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3097 = _3095 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3099 = 1.0 / _3093;
                    float _3101 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3103 = _3101 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3105 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3107 = _3105 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3109 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3111 = _3109 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3113 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3115 = _3113 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3117 = _3089 * _3099;
                    float _3119 = precise::clamp(_3117, 0.0, 1.0);
                    float _3121 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3123 = _3121 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3125 = fma(_3119, _3097, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3127 = fma(_3119, _3123, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3129 = fma(_3119, _3103, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3131 = fma(_3119, _3107, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3133 = fma(_3119, _3111, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3135 = fma(_3119, _3115, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2989 = _3129;
                    _2933 = _3133;
                    _2981 = _3125;
                    _2927 = _3131;
                    _2921 = _3127;
                    _2959 = _3135;
                    _3051 = true;
                }
                else
                {
                    _2989 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2933 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2981 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2927 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2921 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2959 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3051 = false;
    float _3137 = _2989;
    float _3139 = _2933;
    float _3141 = _2981;
    float _3143 = _2927;
    float _3145 = _2921;
    float _3147 = _2959;
    float _3149 = fma(_2086, -0.5, 0.5);
    float _3151 = precise::clamp(_3149, 0.0, 1.0);
    float _3153 = -_3137;
    float _3155 = _3153 + _3139;
    float _3157 = _2899 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3159 = -_3141;
    float _3161 = _3159 + _3143;
    float _3163 = fma(_3151, _3155, _3137);
    out.m_86.x = 0.0;
    float _3165 = -_3145;
    float _3167 = _3165 + _3147;
    float _3169 = fma(_3151, _3161, _3141);
    float _3171 = _3163 * 0.586610972881317138671875;
    out.m_51.x = _3157;
    bool _3173 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3175 = fma(_3151, _3167, _3145);
    float _3177 = fma(_3169, 0.298911988735198974609375, _3171);
    bool _3179 = _2468 > 0.0;
    bool _3181 = isnan(_2468);
    bool _3183 = _3179 || _3181;
    bool _3185 = isnan(0.0);
    bool _3187 = _3183 || _3185;
    float _3189 = fma(_3175, 0.114477999508380889892578125, _3177);
    out.m_88.x = 0.0;
    float _3191 = -_3189;
    float _3193 = _3169 + _3191;
    float _3195 = -_3189;
    float _3197 = _3163 + _3195;
    float _3199 = -_3189;
    float _3201 = _3175 + _3199;
    float _3203 = fma(_3193, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3189);
    float _3205 = fma(_3197, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3189);
    float _3207 = fma(_3201, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3189);
    bool _3209 = !_3173;
    if (!_3209)
    {
        float _3211 = -_2404;
        float _3213 = _3211 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3215 = -_2406;
        float _3217 = _3215 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3219 = -_2408;
        float _3221 = _3219 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3223 = _3213 * _3213;
        float _3225 = fma(_3217, _3217, _3223);
        float _3227 = fma(_3221, _3221, _3225);
        float _3229 = rsqrt(_3227);
        float _3231 = _3213 * _3229;
        float _3233 = _3217 * _3229;
        float _3235 = _3221 * _3229;
        float _3237 = -_2496;
        float _3239 = _3237 + _3231;
        float _3241 = -_2492;
        float _3243 = _3241 + _3233;
        float _3245 = -_2494;
        float _3247 = _3245 + _3235;
        float _3249 = sqrt(_3227);
        float _3251 = _3239 * _3239;
        float _3253 = fma(_3243, _3243, _3251);
        float _3255 = fma(_3247, _3247, _3253);
        float _3257 = rsqrt(_3255);
        float _3259 = -_3249;
        float _3261 = _3259 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3263 = _3261 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3265 = precise::clamp(_3263, 0.0, 1.0);
        float _3267 = abs(_3265);
        float _3269 = log2(_3267);
        float _3271 = _3239 * _3257;
        float _3273 = _3243 * _3257;
        float _3275 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
        float _3277 = precise::clamp(_3275, 0.0, 1.0);
        float _3279 = _3247 * _3257;
        float _3281 = _2086 * _3271;
        float _3283 = _2086 * _3231;
        float _3285 = fma(_2084, _3273, _3281);
        float _3287 = _3277 * _3277;
        float _3289 = _3233 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3291 = fma(_2084, _3233, _3283);
        float _3293 = fma(_2088, _3279, _3285);
        float _3295 = precise::clamp(_3293, 0.0, 1.0);
        float _3297 = _3287 + (-1.0);
        float _3299 = _3269 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3301 = fma(_2088, _3235, _3291);
        float _3303 = precise::clamp(_3301, 0.0, 1.0);
        float _3305 = _3295 * _3295;
        float _3307 = fma(_3305, _3297, 1.0);
        float _3309 = exp2(_3299);
        float _3311 = -_3231;
        float _3313 = -_3289;
        float _3315 = fma(_3311, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3313);
        float _3317 = _3307 * _3307;
        float _3319 = -_3235;
        float _3321 = fma(_3319, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3315);
        float _3323 = 1.0 / _3317;
        float _3325 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3327 = _3321 + _3325;
        float _3329 = _3327 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3331 = precise::clamp(_3329, 0.0, 1.0);
        float _3333 = _3309 * _3331;
        float _3335 = _3303 * _3333;
        float _3337 = _3287 * _3323;
        float _3339 = _3335 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3341 = _3335 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3343 = _3335 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        float _3345 = _3335 * _3337;
        float _3347 = _3345 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3349 = _3345 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3351 = _3345 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_86.x = _3339;
        out.m_86.y = _3341;
        out.m_86.z = _3343;
        out.m_88.x = _3347;
        out.m_88.y = _3349;
        out.m_88.z = _3351;
    }
    out.m_90.x = _3203;
    out.m_90.y = _3205;
    out.m_90.z = _3207;
    if (_3187)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_51.x = 0.0;
    float _3353 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3353;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3051 = false;
    bool _2136 = false;
    bool _337 = false;
    bool _231 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _104 = in.m_48.w;
    float _106 = trunc(_104);
    int _109 = int(_106);
    bool _113 = _109 >= 1;
    float _115 = 0.0;
    if (!_113)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _117 = _115;
    float _119 = _117;
    if (!_113)
    {
        out.m_51.x = 0.0;
    }
    int _121 = 0;
    if (!_113)
    {
        float _123 = _117 * 5.0;
        _121 = as_type<int>(_123);
    }
    int _125 = _121;
    int _127 = _125;
    if (!_113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3410 = as_type<float>(_125);
        out.gl_Position.z = _3410;
    }
    if (!_113)
    {
        return out;
    }
    float _129 = in.m_53.w;
    bool _131 = _129 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _133 = isnan(_129);
    bool _135 = _131 || _133;
    bool _137 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _139 = _135 || _137;
    float _141 = -_129;
    float _143 = _141 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _145 = 0.0;
    float _147 = _143;
    if (_139)
    {
        float _149 = float(_109);
        _145 = _149;
    }
    float _151 = _145;
    bool _153 = _143 >= _151;
    bool _155 = !_139;
    bool _157 = _153 || _155;
    if (_157)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _159 = _119;
    if (_157)
    {
        out.m_51.x = 0.0;
    }
    if (_157)
    {
        float _161 = _159 * 5.0;
        _127 = as_type<int>(_161);
    }
    int _163 = _127;
    if (_157)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3479 = as_type<float>(_163);
        out.gl_Position.z = _3479;
    }
    if (_157)
    {
        return out;
    }
    float _165 = as_type<float>(int(gl_VertexIndex));
    float _167 = in.m_58.x;
    float _169 = in.m_58.y;
    float _171 = in.m_58.z;
    int _173 = as_type<int>(_165) & 1;
    bool _175 = _173 != 0;
    int _177 = as_type<int>(_165) & 2;
    bool _179 = _177 != 0;
    bool _181 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _183 = _169 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _185 = _169 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _187 = _169 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _189 = !_175;
    float _191 = _189 ? (-0.5) : 0.5;
    float _193 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[4].x, _183);
    float _195 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[5].x, _185);
    float _197 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[6].x, _187);
    bool _199 = !_179;
    float _201 = _199 ? (-0.5) : 0.5;
    float _203 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[4].z, _193);
    float _205 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[5].z, _195);
    float _207 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[6].z, _197);
    bool _209 = !_181;
    float _211 = _207;
    float _229;
    if (!_209)
    {
        float _213 = in.m_60.x;
        float _215 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _217 = _213 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _219 = fma(_217, (*spvDescriptorSet0.vp_c9)._m0[12].x, _143);
        float _221 = _219 * _215;
        float _223 = floor(_221);
        float _225 = -_223;
        float _227 = _221 + _225;
        _229 = _227;
        _231 = true;
    }
    else
    {
        float _233 = float(_109);
        float _235 = 1.0 / _233;
        float _237 = _143 * _235;
        _229 = _237;
    }
    _231 = false;
    float _239 = _229;
    float _241 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _243 = _239 + _241;
    bool _245 = _239 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _247 = isnan(_239);
    bool _249 = _245 || _247;
    bool _251 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _253 = _249 || _251;
    float _255 = float(_253);
    float _257 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _259 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _257;
    float _261 = -_255;
    float _263 = _261 + 1.0;
    bool _265 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _267 = 1.0 / _259;
    float _269 = _243 * _267;
    bool _271 = _239 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _273 = isnan(_239);
    bool _275 = _271 || _273;
    bool _277 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _279 = _275 || _277;
    float _281 = float(_279);
    float _283 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _285 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _283;
    float _287 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _289 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _287;
    float _291 = _281 * _263;
    float _293 = fma(_285, _269, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _295 = fma(_289, _269, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _297 = -_281;
    float _299 = _297 + 1.0;
    float _301 = _293 * _291;
    float _303 = _295 * _291;
    float _305 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[143].x, _301);
    float _307 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[143].y, _303);
    float _309 = fma(_255, (*spvDescriptorSet0.vp_c9)._m0[144].x, _305);
    float _311 = fma(_255, (*spvDescriptorSet0.vp_c9)._m0[144].y, _307);
    bool _313 = !_265;
    float _333;
    float _335;
    if (!_313)
    {
        float _315 = in.m_60.x;
        float _317 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _319 = float(_109);
        float _321 = _315 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _323 = fma(_321, (*spvDescriptorSet0.vp_c9)._m0[11].y, _143);
        float _325 = _323 * _317;
        float _327 = floor(_325);
        float _329 = -_327;
        float _331 = _325 + _329;
        _333 = _319;
        _335 = _331;
        _337 = true;
    }
    else
    {
        float _339 = float(_109);
        float _341 = 1.0 / _339;
        float _343 = _143 * _341;
        _333 = _339;
        _335 = _343;
    }
    _337 = false;
    float _345 = _333;
    float _347 = _335;
    float _349 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _351 = int(_349);
    float _353 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _355 = int(_353);
    float _357 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _361 = _359 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _363 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _365 = 1.0 / _345;
    float _367 = float(_351);
    float _369 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _371 = 1.0 / _367;
    float _373 = float(uint(_355));
    int _375 = ~_355;
    int _377 = _375 + 1;
    int _379 = ~_355;
    int _381 = _379 + 1;
    float _383 = float(_355);
    float _385 = 1.0 / _373;
    float _387 = _371 * _143;
    float _389 = 1.0 / _361;
    int _391 = as_type<int>(_385) + (-2);
    float _393 = trunc(_387);
    int _395 = int(_393);
    float _397 = float(uint(_395));
    float _399 = as_type<float>(_391) * _397;
    float _401 = trunc(_399);
    float _403 = precise::max(_401, 0.0);
    uint _406 = uint(_403);
    int _408 = _377 * int(_406);
    int _410 = _408 + _395;
    float _412 = float(uint(_410));
    float _414 = in.m_60.x;
    float _416 = in.m_60.y;
    float _418 = in.m_60.z;
    float _420 = as_type<float>(_391) * _412;
    float _422 = trunc(_420);
    float _424 = precise::max(_422, 0.0);
    uint _426 = uint(_424);
    int _428 = int(_406) + int(_426);
    float _430 = fma(_416, (*spvDescriptorSet0.vp_c9)._m0[88].w, _369);
    float _432 = float(_395);
    int _434 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _436 = _434 != 0;
    int _438 = _381 * _428;
    int _440 = _438 + _395;
    bool _442 = _432 >= _383;
    bool _444 = isnan(_432);
    bool _446 = _442 || _444;
    bool _448 = isnan(_383);
    bool _450 = _446 || _448;
    float _452 = float(_450);
    bool _454 = !_436;
    float _456 = _454 ? 7.345489978790283203125 : 1.0;
    bool _458 = uint(_440) >= uint(_355);
    float _460 = trunc(_452);
    int _462 = int(_460);
    float _464 = _456 * _414;
    bool _466 = !_458;
    int _468 = _466 ? 0 : (-1);
    bool _470 = _355 == 0;
    int _472 = ~_428;
    int _474 = _472 + _468;
    int _476 = _474 + 1;
    float _478 = floor(_464);
    int _480 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _482 = _480 != 0;
    int _484 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _486 = _484 != 0;
    int _488 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _490 = _488 != 0;
    int _492 = _355 * _476;
    int _494 = _492 + _395;
    int _496 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _498 = _496 != 0;
    bool _500 = _416 > 0.5;
    int _502 = ~_462;
    int _504 = _502 + 1;
    int _506 = _504 + 1;
    bool _508 = !_470;
    int _510 = _508 ? _494 : (-1);
    float _512 = -_191;
    int _514 = _500 ? as_type<int>(_512) : as_type<int>(_191);
    int _516 = int(_436);
    int _518 = _470 ? 2 : 0;
    int _520 = _516 | _518;
    int _522 = _498 ? 4 : 0;
    int _524 = _520 | _522;
    int _526 = _500 ? 8 : 0;
    int _528 = _524 | _526;
    int _530 = _482 ? 16 : 0;
    int _532 = _528 | _530;
    int _534 = _486 ? 32 : 0;
    int _536 = _532 | _534;
    int _538 = _490 ? 64 : 0;
    int _540 = _536 | _538;
    int _542 = _540 & 8;
    float _544 = -_478;
    float _546 = _464 + _544;
    int _548 = _510 * _506;
    int _550 = _355 + (-1);
    float _552 = _546 * _383;
    float _554 = _383 * _143;
    bool _556 = !_486;
    int _558 = _556 ? 0 : 1;
    int _560 = _462 * _550;
    int _562 = _560 + _548;
    float _564 = trunc(_552);
    int _566 = int(_564);
    float _568 = _554 * _365;
    bool _570 = !_482;
    int _572 = _570 ? 0 : 1;
    bool _574 = !_498;
    int _576 = _574 ? 0 : 1;
    int _578 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _580 = _578 != 0;
    float _582 = trunc(_568);
    int _584 = int(_582);
    int _586 = abs(_558);
    bool _588 = !_490;
    int _590 = _588 ? 0 : 1;
    int _592 = abs(_572);
    int _594 = _562 * _586;
    int _596 = abs(_576);
    bool _598 = !_580;
    int _600 = _598 ? 0 : 1;
    int _602 = abs(_590);
    int _604 = _566 * _596;
    int _606 = _604 + _395;
    int _608 = abs(_600);
    int _610 = _584 * _592;
    int _612 = _610 + _594;
    float _614 = float(uint(_606));
    int _616 = _606 * _602;
    int _618 = _616 + _612;
    int _620 = ~_355;
    int _622 = _620 + 1;
    int _624 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _626 = _624 != 0;
    int _628 = _566 * _608;
    int _630 = _628 + _618;
    int _632 = ~_355;
    int _634 = _632 + 1;
    float _636 = as_type<float>(_391) * _614;
    int _638 = ~_355;
    int _640 = _638 + 1;
    float _642 = float(uint(_630));
    float _644 = trunc(_636);
    float _646 = precise::max(_644, 0.0);
    uint _648 = uint(_646);
    bool _650 = !_626;
    float _652 = _650 ? _191 : as_type<float>(_514);
    int _654 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _656 = _654 != 0;
    float _658 = as_type<float>(_391) * _642;
    int _660 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _662 = _660 != 0;
    int _664 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _666 = _664 != 0;
    bool _668 = !_656;
    int _670 = _668 ? 0 : 1;
    float _672 = trunc(_658);
    float _674 = precise::max(_672, 0.0);
    uint _676 = uint(_674);
    int _678 = abs(_670);
    int _680 = _634 * int(_676);
    int _682 = _680 + _630;
    float _684 = float(uint(_682));
    float _686 = as_type<float>(_391) * _684;
    float _688 = trunc(_686);
    float _690 = precise::max(_688, 0.0);
    uint _692 = uint(_690);
    int _694 = _640 * int(_648);
    int _696 = _694 + _606;
    float _698 = float(uint(_696));
    int _700 = int(_676) + int(_692);
    float _702 = as_type<float>(_391) * _698;
    float _704 = _416 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _706 = _622 * _700;
    int _708 = _706 + _630;
    float _710 = in.m_62.x;
    float _712 = in.m_62.y;
    float _714 = fma(_704, -2.0, _363);
    float _716 = trunc(_702);
    float _718 = precise::max(_716, 0.0);
    uint _720 = uint(_718);
    bool _722 = uint(_708) >= uint(_355);
    bool _724 = !_722;
    int _726 = _724 ? 0 : (-1);
    int _728 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _730 = _728 != 0;
    float _732 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _734 = ~_700;
    int _736 = _734 + _726;
    int _738 = _736 + 1;
    int _740 = _355 * _738;
    int _742 = _740 + _630;
    float _744 = in.m_48.x;
    float _746 = in.m_48.y;
    float _748 = in.m_48.z;
    int _750 = int(_648) + int(_720);
    float _752 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _754 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _752;
    bool _756 = !_470;
    int _758 = _756 ? _742 : (-1);
    float _760 = _309 * _710;
    float _762 = _414 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _764 = _758 >> 31;
    int _766 = _758 & 3;
    bool _768 = _766 != 0;
    float _770 = -_357;
    float _772 = fma(_762, 2.0, _770);
    int _774 = _764 & 3;
    bool _776 = !_768;
    int _778 = _776 ? 0 : 1;
    int _780 = _758 & 3;
    bool _782 = _780 != 0;
    int _784 = _758 + _774;
    int _786 = _782 ? 0 : 1;
    bool _788 = uint(_766) > 1u;
    float _790 = _746 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _792 = _746 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _794 = _746 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _796 = _784 >> 2;
    float _798 = fma(_744, (*spvDescriptorSet0.vp_c10)._m0[4].x, _790);
    int _800 = ~_355;
    int _802 = _800 + 1;
    float _804 = fma(_744, (*spvDescriptorSet0.vp_c10)._m0[5].x, _792);
    int _806 = _796 << 4;
    int _808 = _806 + 368;
    float _810 = fma(_744, (*spvDescriptorSet0.vp_c10)._m0[6].x, _794);
    int _812 = ~_786;
    int _814 = _812 + 1;
    int _816 = _814 + 1;
    int _818 = _802 * _750;
    int _820 = _818 + _606;
    uint _822 = uint(int(uint(_808) >> uint(2)));
    uint _824 = uint(int(uint(int(_822)) >> uint(2)));
    int _826 = int(_822) & 3;
    float _828 = (*spvDescriptorSet0.vp_c9)._m0[int(_824)][_826];
    int _830 = int(_822) + 1;
    uint _832 = uint(int(uint(_830) >> uint(2)));
    int _834 = _830 & 3;
    float _836 = (*spvDescriptorSet0.vp_c9)._m0[int(_832)][_834];
    int _838 = _816;
    if (!_788)
    {
        int _840 = ~_786;
        int _842 = _840 + 1;
        _838 = _842;
    }
    int _844 = _838;
    float _846 = fma(_748, (*spvDescriptorSet0.vp_c10)._m0[5].z, _804);
    bool _848 = uint(_820) >= uint(_355);
    float _850 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _852 = _850 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _854 = !_848;
    int _856 = _854 ? 0 : (-1);
    bool _858 = uint(_766) >= 2u;
    float _860 = 1.0 / _852;
    float _862 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _864 = _858 ? 0 : 1;
    float _866 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _868 = _766 != 3;
    float _870 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _872 = _808 + 8;
    uint _874 = uint(int(uint(_872) >> uint(2)));
    uint _876 = uint(int(uint(int(_874)) >> uint(2)));
    int _878 = int(_874) & 3;
    float _880 = (*spvDescriptorSet0.vp_c9)._m0[int(_876)][_878];
    int _882 = int(_874) + 1;
    uint _884 = uint(int(uint(_882) >> uint(2)));
    int _886 = _882 & 3;
    float _888 = (*spvDescriptorSet0.vp_c9)._m0[int(_884)][_886];
    float _890 = _862 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _892 = _866 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _894 = _870 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _896 = ~_750;
    int _898 = _896 + _856;
    int _900 = _898 + 1;
    float _902 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _904 = _902 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    int _906 = abs(_778);
    float _908 = _754 * _860;
    out.m_64.x = _890;
    out.m_64.y = _892;
    out.m_64.z = _894;
    out.m_64.w = _732;
    float _910 = _416 + _414;
    float _912 = _414 * 2.0;
    float _914 = _416 * 2.0;
    float _916 = _910 + (-1.0);
    float _918 = floor(_912);
    float _920 = _904 * _389;
    int _922 = ~_864;
    int _924 = _922 + 1;
    int _926 = _924 + 1;
    int _928 = _355 * _900;
    int _930 = _928 + _606;
    int _932 = _926;
    if (_868)
    {
        int _934 = ~_864;
        int _936 = _934 + 1;
        _932 = _936;
    }
    int _938 = _932;
    float _940 = floor(_914);
    int _942 = abs(_844);
    float _944 = fma(_916, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _946 = !_470;
    int _948 = _946 ? _930 : (-1);
    int _950 = ~_942;
    int _952 = _950 + 1;
    int _954 = _952 + 1;
    bool _956 = _766 != 3;
    float _958 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _960 = log2(_958);
    int _962 = _954 * as_type<int>(_836);
    int _964 = abs(_938);
    int _966 = ~_906;
    int _968 = _966 + 1;
    int _970 = _968 + 1;
    bool _972 = !_956;
    int _974 = _972 ? 0 : (-1);
    float _976 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _978 = int(_976);
    int _980 = _970 * as_type<int>(_828);
    int _982 = _980 + _962;
    int _984 = abs(_974);
    float _986 = _416 + _418;
    int _988 = ~_964;
    int _990 = _988 + 1;
    int _992 = _990 + 1;
    float _994 = _960 * _143;
    int _996 = ~_984;
    int _998 = _996 + 1;
    int _1000 = _998 + 1;
    float _1002 = _986 + (-1.0);
    int _1004 = _992 * as_type<int>(_880);
    int _1006 = _1004 + _982;
    float _1008 = as_type<float>(_982);
    float _1010 = _880;
    if (_436)
    {
        _1008 = _414;
    }
    float _1012 = _1008;
    float _1014 = exp2(_994);
    float _1016 = _1012;
    if (_436)
    {
        _1010 = _416;
    }
    float _1018 = _1010;
    int _1020 = _1000 * as_type<int>(_888);
    int _1022 = _1020 + _1006;
    float _1024 = fma(_1002, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1026 = _1018;
    if (!_436)
    {
        _1016 = _418;
    }
    float _1028 = _1016;
    float _1030 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    if (!_436)
    {
        _1026 = _414;
    }
    float _1032 = _1026;
    bool _1034 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1036 = isnan(0.0);
    bool _1038 = _1034 || _1036;
    bool _1040 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1042 = _1038 || _1040;
    float _1044 = fma(_416, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1030);
    float _1046 = float(uint(_978));
    float _1048 = -_1014;
    float _1050 = _1048 + 1.0;
    float _1052 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1054 = _1028 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1056 = _1032 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _1058 = ~_678;
    int _1060 = _1058 + 1;
    int _1062 = _1060 + 1;
    float _1064 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1066 = _1042 ? _1050 : 0.0;
    float _1068 = 1.0 / _1046;
    bool _1070 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1072 = isnan(1.0);
    bool _1074 = _1070 || _1072;
    bool _1076 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1078 = _1074 || _1076;
    int _1080 = _1022 * _1062;
    float _1082 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1084 = 1.0 + _1082;
    float _1086 = -_1064;
    float _1088 = fma(_1054, 2.0, _1086);
    int _1090 = _948 * _678;
    int _1092 = _1090 + _1080;
    int _1094 = abs(_978);
    float _1096 = fma(_1056, -2.0, _1052);
    float _1098 = 1.0 / _1084;
    float _1100 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1102 = float(uint(_1094));
    float _1104 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[76].y, _714);
    bool _1106 = _918 > 0.0;
    float _1108 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1110 = fma(_414, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1100);
    bool _1112 = _918 >= 0.0;
    bool _1114 = isnan(_918);
    bool _1116 = _1112 || _1114;
    bool _1118 = isnan(0.0);
    bool _1120 = _1116 || _1118;
    float _1122 = 1.0 / _1102;
    float _1124 = fma(_414, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1108);
    float _1126 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1044);
    int _1128 = as_type<int>(_1068) + (-2);
    float _1130 = -_143;
    float _1132 = fma(_1130, (*spvDescriptorSet0.vp_c9)._m0[76].x, _772);
    float _1134 = float(uint(_1092));
    float _1136 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1124);
    int _1138 = abs(_1092);
    float _1140 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1110);
    float _1142 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[87].w, _430);
    float _1144 = -_143;
    float _1146 = fma(_1144, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1088);
    float _1148 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1096);
    if (_1078)
    {
        float _1150 = _1066 * _1098;
        _147 = _1150;
    }
    float _1152 = _147;
    float _1154 = as_type<float>(_1128) * _1134;
    bool _1156 = _418 > 0.5;
    float _1158 = _418 * 2.0;
    int _1160 = as_type<int>(_1122) + (-2);
    float _1162 = -_1136;
    float _1164 = _1162 + 1.0;
    float _1166 = float(uint(_1138));
    float _1168 = trunc(_1154);
    float _1170 = precise::max(_1168, 0.0);
    uint _1172 = uint(_1170);
    float _1174 = -_201;
    int _1176 = _1156 ? as_type<int>(_1174) : as_type<int>(_201);
    float _1178 = -_1126;
    float _1180 = _1178 + 1.0;
    int _1182 = _1120 ? 0 : 1;
    bool _1184 = _940 > 0.0;
    bool _1186 = _940 >= 0.0;
    bool _1188 = isnan(_940);
    bool _1190 = _1186 || _1188;
    bool _1192 = isnan(0.0);
    bool _1194 = _1190 || _1192;
    float _1196 = as_type<float>(_1160) * _1166;
    float _1198 = floor(_1158);
    int _1200 = ~_1182;
    int _1202 = _1200 + 1;
    int _1204 = _1202 + 1;
    int _1206 = ~_978;
    int _1208 = _1206 + 1;
    int _1210 = _1204;
    if (!_1106)
    {
        int _1212 = ~_1182;
        int _1214 = _1212 + 1;
        _1210 = _1214;
    }
    int _1216 = _1210;
    float _1218 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1220 = _347 + _1218;
    bool _1222 = _347 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1224 = isnan(_347);
    bool _1226 = _1222 || _1224;
    bool _1228 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1230 = _1226 || _1228;
    float _1232 = float(_1230);
    float _1234 = trunc(_1196);
    float _1236 = precise::max(_1234, 0.0);
    uint _1238 = uint(_1236);
    int _1240 = _1208 * int(_1172);
    int _1242 = _1240 + _1092;
    float _1244 = fma(_908, _1220, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1246 = _347 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1248 = isnan(_347);
    bool _1250 = _1246 || _1248;
    bool _1252 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1254 = _1250 || _1252;
    float _1256 = float(_1254);
    int _1258 = ~_1094;
    int _1260 = _1258 + 1;
    float _1262 = float(uint(_1242));
    float _1264 = -_1256;
    float _1266 = _1264 + 1.0;
    int _1268 = _1194 ? 0 : 1;
    float _1270 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _1272 = _1198 > 0.0;
    float _1274 = as_type<float>(_1128) * _1262;
    bool _1276 = _1198 >= 0.0;
    bool _1278 = isnan(_1198);
    bool _1280 = _1276 || _1278;
    bool _1282 = isnan(0.0);
    bool _1284 = _1280 || _1282;
    float _1286 = _1232 * _1266;
    bool _1288 = _347 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1290 = isnan(_347);
    bool _1292 = _1288 || _1290;
    bool _1294 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1296 = _1292 || _1294;
    float _1298 = float(_1296);
    int _1300 = _1260 * int(_1238);
    int _1302 = _1300 + _1138;
    float _1304 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1306 = _347 + _1304;
    float _1308 = _1244 * _1286;
    float _1310 = float(_1216);
    float _1312 = -_1298;
    float _1314 = _1312 + 1.0;
    float _1316 = float(uint(_1302));
    float _1318 = -_1232;
    float _1320 = _1318 + 1.0;
    bool _1322 = !_666;
    float _1324 = _1322 ? _201 : as_type<float>(_1176);
    float _1326 = _1256 * _1314;
    int _1328 = ~_1268;
    int _1330 = _1328 + 1;
    int _1332 = _1330 + 1;
    float _1334 = as_type<float>(_1160) * _1316;
    int _1336 = _1332;
    if (!_1184)
    {
        int _1338 = ~_1268;
        int _1340 = _1338 + 1;
        _1336 = _1340;
    }
    int _1342 = _1336;
    float _1344 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _1346 = _1284 ? 0 : 1;
    float _1348 = fma(_920, _1306, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1350 = fma(_748, (*spvDescriptorSet0.vp_c10)._m0[4].z, _798);
    int _1352 = ~_978;
    int _1354 = _1352 + 1;
    float _1356 = fma(_1320, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1308);
    int _1358 = ~_1346;
    int _1360 = _1358 + 1;
    int _1362 = _1360 + 1;
    float _1364 = _1350 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1366 = trunc(_1274);
    float _1368 = precise::max(_1366, 0.0);
    uint _1370 = uint(_1368);
    int _1372 = _1362;
    if (!_1272)
    {
        int _1374 = ~_1346;
        int _1376 = _1374 + 1;
        _1372 = _1376;
    }
    int _1378 = _1372;
    float _1380 = _1324 + (-0.5);
    int _1382 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1384 = _1382 != 0;
    int _1386 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1388 = _1386 != 0;
    int _1390 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1392 = _1390 != 0;
    float _1394 = fma(_748, (*spvDescriptorSet0.vp_c10)._m0[6].z, _810);
    float _1396 = _1270 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1398 = _652 + 0.5;
    int _1400 = ~_1094;
    int _1402 = _1400 + 1;
    float _1404 = trunc(_1334);
    float _1406 = precise::max(_1404, 0.0);
    uint _1408 = uint(_1406);
    float _1410 = _1344 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1412 = fma(_1396, _1398, _1146);
    bool _1414 = !_1384;
    int _1416 = _1414 ? 0 : 1;
    float _1418 = fma(_1348, _1326, _1356);
    float _1420 = -_1410;
    float _1422 = -_1148;
    float _1424 = fma(_1420, _1380, _1422);
    bool _1426 = !_1388;
    int _1428 = _1426 ? 0 : 1;
    float _1430 = _1394 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1432 = int(_1172) + int(_1370);
    float _1434 = fma(_1298, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1418);
    int _1436 = abs(_1428);
    float _1438 = -_1140;
    float _1440 = _1438 + 1.0;
    int _1442 = abs(_1416);
    int _1444 = _1354 * _1432;
    int _1446 = _1444 + _1092;
    float _1448 = -_1440;
    float _1450 = fma(_652, _1448, _1412);
    int _1452 = int(_1238) + int(_1408);
    float _1454 = -_1142;
    float _1456 = _1454 + 1.0;
    bool _1458 = uint(_1446) >= uint(_978);
    float _1460 = _846 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1462 = float(_1436);
    int _1464 = _1402 * _1452;
    int _1466 = _1464 + _1138;
    bool _1468 = !_1458;
    int _1470 = _1468 ? 0 : (-1);
    float _1472 = fma(_1324, _1456, _1424);
    int _1474 = _1092 ^ _978;
    float _1476 = _1462 * _1310;
    bool _1478 = uint(_1466) >= uint(_1094);
    float _1480 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1482 = ~_1432;
    int _1484 = _1482 + _1470;
    int _1486 = _1484 + 1;
    float _1488 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1490 = _1460 + _1488;
    bool _1492 = !_1478;
    int _1494 = _1492 ? 0 : (-1);
    out.m_66.x = _1450;
    out.m_66.y = _1472;
    float _1496 = float(_1442);
    int _1498 = _978 * _1486;
    int _1500 = _1498 + _1092;
    int _1502 = ~_1494;
    int _1504 = _1452 + _1502;
    int _1506 = _1504 + 1;
    float _1508 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1510 = _1430 + _1508;
    float _1512 = in.m_68.x;
    float _1514 = in.m_68.y;
    float _1516 = in.m_68.z;
    float _1518 = float(_1378);
    float _1520 = _1476 * (-2.0);
    bool _1522 = _978 == 0;
    float _1524 = _1496 * _1518;
    bool _1526 = _978 == 0;
    float _1528 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    uint _1530 = uint(int(uint(_1474) >> uint(31)));
    float _1532 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1534 = _1364 + _1532;
    float _1536 = _1490 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1538 = _1528 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1540 = ~int(_1530);
    int _1542 = _1540 + 1;
    float _1544 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1546 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1536);
    float _1548 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1550 = _1434 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _1552 = _1506 ^ _1542;
    float _1554 = _1480 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1556 = !_1522;
    int _1558 = _1556 ? _1500 : (-1);
    float _1560 = _1524 * (-2.0);
    float _1562 = _1544 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1564 = _1548 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1566 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1568 = _414 > 0.5;
    float _1570 = fma(_1510, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1546);
    int _1572 = ~_1542;
    int _1574 = _1572 + _1552;
    int _1576 = _1574 + 1;
    float _1578 = fma(_1560, _1512, _1512);
    bool _1580 = _542 != 0;
    out.m_70.x = _1562;
    out.m_70.y = _1564;
    out.m_70.z = _1538;
    out.m_70.w = _1550;
    float _1582 = -_191;
    int _1584 = _1568 ? as_type<int>(_1582) : as_type<int>(_191);
    float _1586 = fma(_1520, _1514, _1514);
    float _1588 = float(_1558);
    bool _1590 = !_662;
    float _1592 = _1590 ? _191 : as_type<float>(_1584);
    bool _1594 = !_1526;
    int _1596 = _1594 ? _1576 : (-1);
    float _1598 = fma(_1554, _1588, _1132);
    bool _1600 = _1570 >= 0.0;
    float _1602 = fma(_944, _1560, _944);
    float _1604 = float(_1596);
    float _1606 = _414 + (-0.5);
    float _1608 = _1490 * _1490;
    float _1610 = -_201;
    int _1612 = _1580 ? as_type<int>(_1610) : as_type<int>(_201);
    float _1614 = _1566 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1616 = fma(_1606, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1578);
    float _1618 = fma(_1534, _1534, _1608);
    bool _1620 = !_730;
    float _1622 = _1620 ? _201 : as_type<float>(_1612);
    float _1624 = _1592 + 0.5;
    float _1626 = -_1104;
    float _1628 = fma(_1614, _1604, _1626);
    float _1630 = fma(_1510, _1510, _1618);
    float _1632 = _1614;
    if (_1600)
    {
        out.m_51.x = 0.0;
    }
    float _1634 = fma(_1554, _1624, _1598);
    float _1636 = _1622 + (-0.5);
    float _1638 = rsqrt(_1630);
    float _1640 = fma(_1024, _1520, _1024);
    float _1642 = -_1164;
    float _1644 = fma(_1592, _1642, _1634);
    float _1646 = -_1614;
    float _1648 = fma(_1646, _1636, _1628);
    if (_1600)
    {
        _1632 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1650 = _1632;
    float _1652 = _760 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1654 = fma(_1622, _1180, _1648);
    bool _1656 = !_1392;
    int _1658 = _1656 ? 0 : 1;
    int _1660 = as_type<int>(_1650);
    if (_1600)
    {
        float _1662 = _1650 * 5.0;
        _1660 = as_type<int>(_1662);
    }
    int _1664 = _1660;
    float _1666 = _1652 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _1668 = fma(_1602, _1152, _1616);
    out.m_72.x = _1644;
    out.m_72.y = _1654;
    float _1670 = _416 + (-0.5);
    int _1672 = abs(_1658);
    float _1674 = _1666 * _1638;
    if (_1600)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5732 = as_type<float>(_1664);
        out.gl_Position.z = _5732;
    }
    float _1676 = _1534 * _1674;
    float _1678 = _1490 * _1674;
    if (_1600)
    {
        return out;
    }
    float _1680 = -_1678;
    float _1682 = _1460 + _1680;
    float _1684 = _1510 * _1674;
    float _1686 = -_1676;
    float _1688 = _1364 + _1686;
    float _1690 = _1668 * 0.15915493667125701904296875;
    float _1692 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1694 = _1682 + _1692;
    float _1696 = -_1684;
    float _1698 = _1430 + _1696;
    float _1700 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1702 = _1688 + _1700;
    float _1704 = -_1678;
    float _1706 = _1490 + _1704;
    float _1708 = _1694 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1710 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1712 = _1698 + _1710;
    float _1714 = float(_1342);
    float _1716 = fma(_1670, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1586);
    float _1718 = fma(_1702, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1708);
    float _1720 = float(_1672);
    float _1722 = -_1676;
    float _1724 = _1534 + _1722;
    float _1726 = _1706 * _1706;
    float _1728 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1718);
    float _1730 = _418 + _414;
    float _1732 = _1720 * _1714;
    float _1734 = fma(_1640, _1152, _1716);
    float _1736 = fma(_1724, _1724, _1726);
    bool _1738 = _1728 >= 0.0;
    float _1740 = -_1684;
    float _1742 = _1510 + _1740;
    float _1744 = _1730 + (-1.0);
    float _1746 = _1732 * (-2.0);
    float _1748 = _1734 * 0.15915493667125701904296875;
    float _1750 = fma(_1742, _1742, _1736);
    float _1752 = _1690 * 6.283185482025146484375;
    float _1754 = sin(_1752);
    float _1756 = fma(_1744, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1758 = _418 + (-0.5);
    float _1760 = fma(_1746, _1516, _1516);
    float _1762 = fma(_1756, _1746, _1756);
    float _1764 = _1724;
    int _1766 = as_type<int>(_1758);
    float _1768 = _1684;
    if (_1738)
    {
        _1764 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1770 = _1764;
    float _1772 = fma(_1758, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1760);
    float _1774 = _1690 * 6.283185482025146484375;
    float _1776 = cos(_1774);
    if (_1738)
    {
        out.m_51.x = 0.0;
    }
    if (_1738)
    {
        float _1778 = _1770 * 5.0;
        _1766 = as_type<int>(_1778);
    }
    int _1780 = _1766;
    float _1782 = fma(_1762, _1152, _1772);
    float _1784 = _1748 * 6.283185482025146484375;
    float _1786 = sin(_1784);
    if (_1738)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5915 = as_type<float>(_1780);
        out.gl_Position.z = _5915;
    }
    float _1788 = _1782 * 0.15915493667125701904296875;
    float _1790 = sqrt(_1750);
    float _1792 = _1748 * 6.283185482025146484375;
    float _1794 = cos(_1792);
    if (_1738)
    {
        return out;
    }
    float _1796 = _1788 * 6.283185482025146484375;
    float _1798 = cos(_1796);
    float _1800 = _311 * _712;
    float _1802 = _1638 * _1790;
    float _1804 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _201);
    float _1806 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _191);
    float _1808 = _1800 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1810 = _1652 * _1802;
    float _1812 = _1776 * _1786;
    float _1814 = _1788 * 6.283185482025146484375;
    float _1816 = sin(_1814);
    float _1818 = _1802 * _1808;
    float _1820 = _1776 * _1794;
    float _1822 = _1754 * _1794;
    float _1824 = _1806 * _1810;
    float _1826 = _1804 * _1818;
    float _1828 = _1754 * _1786;
    float _1830 = _1776 * _1798;
    float _1832 = _1786 * _1798;
    float _1834 = _1794 * _1798;
    float _1836 = _1754 * _1798;
    float _1838 = _1830 * _1826;
    float _1840 = _1802 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1842 = _1840 * 0.5;
    float _1844 = fma(_1816, _1820, _1828);
    float _1846 = -_1826;
    float _1848 = _1816 * _1846;
    float _1850 = -_1822;
    float _1852 = fma(_1816, _1812, _1850);
    float _1854 = -_1812;
    float _1856 = fma(_1816, _1822, _1854);
    float _1858 = fma(_1844, _1824, _1838);
    float _1860 = _1836 * _1826;
    float _1862 = fma(_1834, _1824, _1848);
    float _1864 = fma(_1816, _1828, _1820);
    float _1866 = fma(_1852, _1842, _1858);
    float _1868 = fma(_1856, _1824, _1860);
    float _1870 = fma(_1832, _1842, _1862);
    float _1872 = _1844 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1874 = _1866 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1876 = _1866 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1878 = fma(_1864, _1842, _1868);
    float _1880 = _1866 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1882 = fma(_1870, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1874);
    float _1884 = fma(_1870, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1876);
    float _1886 = _1844 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1888 = fma(_1870, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1880);
    float _1890 = fma(_1878, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1882);
    float _1892 = fma(_1878, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1884);
    float _1894 = _1844 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1896 = fma(_1878, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1888);
    float _1898 = _1890 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1900 = _1892 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1902 = fma(_1834, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1872);
    float _1904 = fma(_1834, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1886);
    float _1906 = _1364 + _1898;
    float _1908 = _1430 + _1900;
    float _1910 = fma(_1834, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1894);
    float _1912 = _1830 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1914 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1916 = _1906 + _1914;
    float _1918 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1920 = _1908 + _1918;
    float _1922 = _1830 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1924 = _1830 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1926 = _1916 * _1916;
    float _1928 = _1920 * _1920;
    float _1930 = _1896 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1932 = _1852 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1934 = _1852 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1936 = _1926 + _1928;
    float _1938 = -_1816;
    float _1940 = fma(_1938, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1912);
    float _1942 = -_1816;
    float _1944 = fma(_1942, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1922);
    float _1946 = -_1816;
    float _1948 = fma(_1946, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1924);
    float _1950 = sqrt(_1936);
    float _1952 = _1852 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1954 = _1460 + _1930;
    float _1956 = fma(_1856, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1902);
    float _1958 = fma(_1856, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1904);
    float _1960 = fma(_1856, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1910);
    float _1962 = fma(_1832, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1932);
    float _1964 = fma(_1832, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1934);
    float _1966 = fma(_1832, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1952);
    bool _1968 = _1950 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1970 = _1952;
    float _1972 = _1926;
    float _1974 = _1928;
    float _1976 = _1906;
    float _1978 = _1908;
    float _1980 = _1802;
    if (!_1968)
    {
        _1970 = _1954;
    }
    float _1982 = _1970;
    bool _1984 = !_1968;
    float _1986 = _1982;
    if (!_1984)
    {
        float _1988 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1990 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1992 = _1950 + _1990;
        float _1994 = _1954 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1996 = rsqrt(_1936);
        float _1998 = _1992 * _1988;
        float _2000 = _1998 * 0.15915493667125701904296875;
        float _2002 = _2000 * 6.283185482025146484375;
        float _2004 = sin(_2002);
        float _2006 = _2000 * 6.283185482025146484375;
        float _2008 = cos(_2006);
        float _2010 = fma(_2004, _1994, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2012 = _1996 * _2010;
        float _2014 = fma(_1916, _2012, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2016 = _2008 + (-1.0);
        float _2018 = fma(_1920, _2012, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2020 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2022 = _2014 + _2020;
        float _2024 = _2016 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2026 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2028 = _2018 + _2026;
        float _2030 = _2022 * _2022;
        float _2032 = fma(_1954, _2008, _2024);
        float _2034 = _2028 * _2028;
        _1986 = _2032;
        _1972 = _2030;
        _1974 = _2034;
        _1976 = _2014;
        _1978 = _2018;
    }
    float _2036 = _1986;
    float _2038 = _1972;
    float _2040 = _1974;
    float _2042 = _1976;
    float _2044 = _1978;
    float _2046 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2048 = _2036 + _2046;
    float _2050 = fma(_1836, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1940);
    float _2052 = fma(_1836, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1944);
    float _2054 = _201 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2056 = fma(_2048, _2048, _2038);
    float _2058 = fma(_1836, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1948);
    float _2060 = _191 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2062 = _2054 * _2050;
    float _2064 = _2056 + _2040;
    float _2066 = _2054 * _2052;
    float _2068 = _2054 * _2058;
    float _2070 = fma(_1864, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1962);
    float _2072 = fma(_1864, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1964);
    float _2074 = fma(_1864, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1966);
    float _2076 = sqrt(_2064);
    float _2078 = fma(_2060, _1956, _2062);
    float _2080 = fma(_2060, _1958, _2066);
    float _2082 = fma(_2060, _1960, _2068);
    float _2084 = _2070 + _2078;
    float _2086 = _2072 + _2080;
    float _2088 = _2074 + _2082;
    out.m_74.x = _2084;
    out.m_74.y = _2086;
    out.m_74.z = _2088;
    bool _2090 = _2076 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2092 = isnan(_2076);
    bool _2094 = _2090 || _2092;
    bool _2096 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2098 = _2094 || _2096;
    float _2100 = _2068;
    if (!_2098)
    {
        _2100 = 1.0;
    }
    float _2102 = _2100;
    bool _2104 = !_2098;
    float _2106 = _2102;
    if (!_2104)
    {
        bool _2108 = _2076 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2110 = isnan(_2076);
        bool _2112 = _2108 || _2110;
        bool _2114 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2116 = _2112 || _2114;
        if (!_2116)
        {
            float _2118 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2120 = _2076 + _2118;
            float _2122 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2124 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2122;
            float _2126 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2128 = _2126 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2130 = 1.0 / _2124;
            float _2132 = _2120 * _2130;
            float _2134 = fma(_2132, _2128, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2106 = _2134;
            _2136 = true;
        }
        else
        {
            bool _2138 = _2076 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2140 = isnan(_2076);
            bool _2142 = _2138 || _2140;
            bool _2144 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2146 = _2142 || _2144;
            if (!_2146)
            {
                float _2148 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2150 = _2076 + _2148;
                float _2152 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2154 = _2152 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2156 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2158 = _2156 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2160 = 1.0 / _2154;
                float _2162 = _2150 * _2160;
                float _2164 = fma(_2162, _2158, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2106 = _2164;
                _2136 = true;
            }
            else
            {
                _2106 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2136 = false;
    float _2166 = _2106;
    float _2168 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2170 = _2036 + _2168;
    float _2172 = _1682 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2174 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2176 = _2042 + _2174;
    float _2178 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2180 = _2044 + _2178;
    float _2182 = fma(_2170, _2166, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2184 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2172);
    float _2186 = fma(_2176, _2166, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2188 = fma(_2180, _2166, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2190 = -_1460;
    float _2192 = _2190 + _2182;
    float _2194 = fma(_1698, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2184);
    float _2196 = -_1364;
    float _2198 = _2196 + _2186;
    float _2200 = -_1430;
    float _2202 = _2200 + _2188;
    float _2204 = _2192 * _2192;
    float _2206 = _2194 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2208 = _1682 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2210 = fma(_2198, _2198, _2204);
    float _2212 = 1.0 / _2206;
    float _2214 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2208);
    float _2216 = fma(_2202, _2202, _2210);
    float _2218 = fma(_1698, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2214);
    float _2220 = sqrt(_2216);
    float _2222 = _2218 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2224 = _2222 + _2206;
    float _2226 = _2224 * _2212;
    float _2228 = _2226 * 0.5;
    bool _2230 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2232 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2234 = _2230 || _2232;
    bool _2236 = isnan(0.5);
    bool _2238 = _2234 || _2236;
    float _2240 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2242 = fma(_2228, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2240);
    bool _2244 = _2220 > 0.0;
    float _2246 = 1.0 / _2242;
    bool _2248 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2250 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2252 = _2248 || _2250;
    bool _2254 = isnan(0.5);
    bool _2256 = _2252 || _2254;
    float _2258 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _2260 = _2188;
    float _2262 = _2182;
    float _2264 = _2212;
    if (!_2244)
    {
        _2258 = _2186;
    }
    float _2266 = _2258;
    bool _2268 = !_2244;
    float _2270 = _2266;
    if (!_2268)
    {
        float _2272 = _205 * _205;
        float _2274 = fma(_203, _203, _2272);
        float _2276 = rsqrt(_2216);
        float _2278 = fma(_207, _207, _2274);
        float _2280 = sqrt(_2278);
        float _2282 = _2198 * _2276;
        float _2284 = _2192 * _2276;
        float _2286 = _2202 * _2276;
        bool _2288 = _2280 > 0.0;
        float _2290 = _2280;
        if (!_2288)
        {
            _2290 = _2186;
        }
        float _2292 = _2290;
        bool _2294 = !_2288;
        _2270 = _2292;
        if (!_2294)
        {
            float _2296 = rsqrt(_2278);
            float _2298 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2300 = _205 * _2296;
            float _2302 = _203 * _2296;
            float _2304 = _2284 * _2300;
            float _2306 = _207 * _2296;
            float _2308 = fma(_2282, _2302, _2304);
            float _2310 = _2298 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2312 = fma(_2286, _2306, _2308);
            float _2314 = _2312 * _2310;
            float _2316 = fma(_203, _2314, _2186);
            float _2318 = fma(_205, _2314, _2182);
            float _2320 = fma(_207, _2314, _2188);
            _2270 = _2316;
            _2260 = _2320;
            _2262 = _2318;
            _2264 = _2298;
        }
    }
    float _2322 = _2270;
    float _2324 = _2260;
    float _2326 = _2262;
    float _2328 = _2264;
    float _2330 = -_1676;
    float _2332 = _2330 + _2322;
    float _2334 = -_1684;
    float _2336 = _2334 + _2324;
    float _2338 = -_1678;
    float _2340 = _2338 + _2326;
    float _2342 = _2340;
    float _2344 = _2336;
    float _2346 = _2324;
    if (_2238)
    {
        _211 = 1.0;
    }
    float _2348 = _211;
    float _2350 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2352 = _2246 * _2350;
    float _2354 = _2348;
    if (_2256)
    {
        _1768 = _2332;
    }
    float _2356 = _1768;
    float _2358 = _2356;
    if (!_2256)
    {
        float _2360 = _1694 * _1694;
        float _2362 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2364 = -_1430;
        float _2366 = _2364 + _2324;
        float _2368 = -_1460;
        float _2370 = _2368 + _2326;
        float _2372 = fma(_1702, _1702, _2360);
        float _2374 = -_1364;
        float _2376 = _2374 + _2322;
        float _2378 = fma(_1712, _1712, _2372);
        float _2380 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2382 = sqrt(_2378);
        float _2384 = _2362 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2386 = 1.0 / _1802;
        float _2388 = precise::min(_2382, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2390 = _2388 * _2380;
        float _2392 = _2390 * _2386;
        float _2394 = _2384 * _2392;
        float _2396 = _2366 * _2392;
        float _2398 = fma(_2370, _2394, _1682);
        float _2400 = fma(_2376, _2394, _1688);
        float _2402 = fma(_2384, _2396, _1698);
        _2342 = _2398;
        _2358 = _2400;
        _2344 = _2402;
        _2346 = _2396;
        _1980 = _2386;
    }
    float _2404 = _2342;
    float _2406 = _2358;
    float _2408 = _2344;
    float _2410 = _2346;
    float _2412 = _1980;
    float _2414 = _2412;
    float _2416 = _2410;
    if (!_2238)
    {
        float _2418 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2420 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2422 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2420;
        float _2424 = _2418 * 0.15915493667125701904296875;
        float _2426 = _2424 * 6.283185482025146484375;
        float _2428 = cos(_2426);
        float _2430 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2432 = _2430 * 0.15915493667125701904296875;
        float _2434 = _2424 * 6.283185482025146484375;
        float _2436 = sin(_2434);
        float _2438 = 1.0 / _2428;
        float _2440 = _2432 * 6.283185482025146484375;
        float _2442 = cos(_2440);
        float _2444 = _2436 * _2438;
        float _2446 = _2432 * 6.283185482025146484375;
        float _2448 = sin(_2446);
        float _2450 = _2442 * _2444;
        float _2452 = 1.0 / _2422;
        float _2454 = 1.0 / _2450;
        float _2456 = _2448 * _2454;
        float _2458 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2460 = fma(_2352, _2456, _2458);
        float _2462 = _2460 * _2452;
        float _2464 = precise::clamp(_2462, 0.0, 1.0);
        _2414 = _2460;
        _2354 = _2464;
    }
    float _2466 = _2414;
    float _2468 = _2354;
    float _2470 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2472 = _2404 + _2470;
    float _2474 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2476 = _2406 + _2474;
    float _2478 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2480 = _2408 + _2478;
    float _2482 = _2472 * _2472;
    float _2484 = fma(_2476, _2476, _2482);
    float _2486 = fma(_2480, _2480, _2484);
    float _2488 = rsqrt(_2486);
    float _2490 = sqrt(_2486);
    float _2492 = _2476 * _2488;
    float _2494 = _2480 * _2488;
    float _2496 = _2472 * _2488;
    float _2498 = _2492 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2500 = _2494 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2502 = _2498 * _2498;
    float _2504 = _2500 * _2500;
    float _2506 = _2502 + _2504;
    float _2508 = sqrt(_2506);
    bool _2510 = _2508 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2512 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2514 = _2508 + _2512;
    float _2516 = _2328;
    float _2518 = _2514;
    float _2520 = _2506;
    if (_2510)
    {
        float _2522 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2516 = _2522;
    }
    float _2524 = _2516;
    float _2526 = _2524;
    if (_2510)
    {
        float _2528 = _2514 * _2524;
        _2518 = _2528;
    }
    float _2530 = _2518;
    if (_2510)
    {
        float _2532 = rsqrt(_2506);
        _2526 = _2532;
    }
    float _2534 = _2526;
    float _2536 = _2534;
    if (_2510)
    {
        float _2538 = _2530 * 0.15915493667125701904296875;
        _2416 = _2538;
    }
    float _2540 = _2416;
    float _2542 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2544 = _2326;
    float _2546 = _2540;
    if (_2510)
    {
        float _2548 = _2540 * 6.283185482025146484375;
        float _2550 = sin(_2548);
        _2544 = _2550;
    }
    float _2552 = _2544;
    float _2554 = precise::max(0.0, _2542);
    float _2556 = _2466;
    float _2558 = _2554;
    float _2560 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_2510)
    {
        float _2562 = _2540 * 6.283185482025146484375;
        float _2564 = cos(_2562);
        _2556 = _2564;
    }
    float _2566 = _2556;
    float _2568 = -_2496;
    float _2570 = -_2554;
    float _2572 = fma(_2568, (*spvDescriptorSet0.vp_c15)._m0[24].y, _2570);
    float _2574 = fma(_1688, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    if (_2510)
    {
        float _2576 = _2572 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2558 = _2576;
    }
    float _2578 = _2558;
    float _2580 = _2552;
    float _2582 = _2578;
    if (_2510)
    {
        float _2584 = fma(_2552, _2578, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2580 = _2584;
    }
    float _2586 = _2580;
    float _2588 = _2586;
    if (!_2510)
    {
        _2546 = _2498;
    }
    float _2590 = _2546;
    float _2592 = _2590;
    if (!_2510)
    {
        _2582 = _2500;
    }
    float _2594 = _2582;
    float _2596 = _2594;
    if (_2510)
    {
        float _2598 = _2534 * _2586;
        _2588 = _2598;
    }
    float _2600 = _2588;
    if (!_2510)
    {
        _2536 = _2572;
    }
    float _2602 = _2536;
    float _2604 = _2602;
    float _2606 = _2566;
    if (_2510)
    {
        float _2608 = _2566 + (-1.0);
        _2560 = _2608;
    }
    float _2610 = _2560;
    float _2612 = _2610;
    if (_2510)
    {
        float _2614 = _2498 * _2600;
        _2592 = _2614;
    }
    float _2616 = _2592;
    if (_2510)
    {
        float _2618 = _2500 * _2600;
        _2596 = _2618;
    }
    float _2620 = _2596;
    if (_2510)
    {
        float _2622 = _2610 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2520 = _2622;
    }
    float _2624 = _2520;
    if (!_2510)
    {
        _2612 = _2502;
    }
    float _2626 = _2612;
    float _2628 = _2626;
    if (_2510)
    {
        float _2630 = _2616 * _2616;
        _2628 = _2630;
    }
    float _2632 = _2628;
    float _2634 = floor(_2574);
    if (_2510)
    {
        float _2636 = fma(_2572, _2566, _2624);
        _2604 = _2636;
    }
    float _2638 = _2604;
    float _2640 = _2404 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (!_2510)
    {
        _2606 = _2504;
    }
    float _2642 = _2606;
    float _2644 = _2642;
    if (_2510)
    {
        float _2646 = _2620 * _2620;
        _2644 = _2646;
    }
    float _2648 = _2644;
    float _2650 = fma(_2638, _2638, _2632);
    float _2652 = fma(_2406, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2640);
    float _2654 = fma(_1698, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2656 = _2650 + _2648;
    float _2658 = fma(_2408, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2652);
    float _2660 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2662 = rsqrt(_2656);
    float _2664 = _2658 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2666 = _2404 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2668 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2670 = fma(_2490, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2668);
    float _2672 = precise::clamp(_2670, 0.0, 1.0);
    float _2674 = -_2634;
    float _2676 = _2574 + _2674;
    float _2678 = _2664 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2680 = fma(_2406, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2666);
    float _2682 = -_2672;
    float _2684 = _2682 + 1.0;
    float _2686 = floor(_2654);
    float _2688 = -_2678;
    float _2690 = fma(_2688, _2660, 1.0);
    float _2692 = _2404 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2694 = _2404 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2696 = fma(_2408, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2680);
    float _2698 = fma(_2406, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2692);
    float _2700 = fma(_2406, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2694);
    float _2702 = _2662 * _2616;
    float _2704 = _2662 * _2638;
    float _2706 = fma(_2408, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2698);
    float _2708 = abs(_2684);
    float _2710 = log2(_2708);
    float _2712 = _2702 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2714 = _2662 * _2620;
    float _2716 = _2706 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2718 = _2696 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2720 = -_2712;
    float _2722 = fma(_2704, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2720);
    float _2724 = fma(_2408, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2700);
    float _2726 = _2716 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2728 = log2(_2690);
    float _2730 = -_2714;
    float _2732 = fma(_2730, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2722);
    float _2734 = _2716 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2736 = fma(_2718, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2726);
    float _2738 = -_2686;
    float _2740 = _2654 + _2738;
    float _2742 = fma(_2732, -0.5, 0.5);
    float _2744 = fma(_2718, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2734);
    float _2746 = fma(_2664, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2736);
    float _2748 = _2710 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2750 = _2724 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2752 = sqrt(_2742);
    float _2754 = fma(_2750, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2746);
    float _2756 = _2716 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2758 = _2728 * 0.693147182464599609375;
    float _2760 = 1.0 / _2754;
    float _2762 = fma(_2664, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2744);
    float _2764 = fma(_2750, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2762);
    float _2766 = exp2(_2748);
    float _2768 = _2752 * 0.636619746685028076171875;
    float _2770 = fma(_2732, 0.5, 0.5);
    float _2772 = fma(_2718, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2756);
    float _2774 = _2704 + 1.0;
    float _2776 = fma(_2770, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2778 = fma(_2664, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2772);
    float _2780 = _2764 * _2760;
    float _2782 = -_2704;
    float _2784 = fma(_2766, _2774, _2782);
    float _2786 = fma(_2770, _2776, -0.212114393711090087890625);
    float _2788 = fma(_2750, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2778);
    float _2790 = _2758 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2792 = fma(_2780, 0.5, 0.5);
    float _2794 = fma(_2770, _2786, 1.570728778839111328125);
    float _2796 = _2788 * _2760;
    float2 _7573 = float2(_2676, _2740);
    float _2798 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7573, float2(0.0), isnan(_7573)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7573, float2(0.0), isnan(_7573)), level(0.0)).x;
    float _2800 = -_2794;
    float _2802 = fma(_2768, _2800, 1.0);
    float _2804 = fma(_2796, -0.5, 0.5);
    float _2806 = fma(_2784, 0.5, 0.5);
    float3 _7593 = float3(_2792, _2804, _2790);
    float _2808 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7593, float3(0.0), isnan(_7593)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7593, float3(0.0), isnan(_7593)), level(0.0)).x;
    float3 _7604 = float3(_2792, _2804, _2790);
    float4 _2811 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7604, float3(0.0), isnan(_7604)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7604, float3(0.0), isnan(_7604)), level(0.0)).xyzw;
    float _2813 = _2811.x;
    float _2815 = _2811.y;
    float _2817 = _2811.z;
    float _2819 = _2811.w;
    float2 _7620 = float2(_2802, _2806);
    float3 _2823 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7620, float2(0.0), isnan(_7620)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7620, float2(0.0), isnan(_7620)), level(0.0)).xyz;
    float _2825 = _2823.x;
    float _2827 = _2823.y;
    float _2829 = _2823.z;
    float _2831 = abs(_2352);
    float _2833 = log2(_2831);
    float _2835 = _2716 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_76.x = _2406;
    out.m_76.y = _2404;
    out.m_76.z = _2408;
    bool _2837 = _2490 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2839 = isnan(_2490);
    bool _2841 = _2837 || _2839;
    bool _2843 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2845 = _2841 || _2843;
    float _2847 = fma(_2718, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2835);
    bool _2849 = _2352 <= 8000.0;
    bool _2851 = isnan(_2352);
    bool _2853 = _2849 || _2851;
    bool _2855 = isnan(8000.0);
    bool _2857 = _2853 || _2855;
    float _2859 = float(_2857);
    float _2861 = fma(_2664, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2847);
    float _2863 = fma(_2750, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2861);
    float _2865 = _2833 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2867 = _2863 + _2754;
    float _2869 = exp2(_2865);
    float _2871 = _2867 * 0.5;
    out.m_78.z = _2871;
    out.m_78.w = _2754;
    float _2873 = fma(_2869, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2875 = precise::clamp(_2873, 0.0, 1.0);
    float _2877 = fma(_2875, -2.0, 3.0);
    float _2879 = _2875 * _2875;
    float _2881 = _2879 * _2877;
    float _2883 = _2710 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2885 = -_2881;
    float _2887 = _2885 + 1.0;
    float _2889 = exp2(_2883);
    float _2891 = fma(_2887, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2881);
    float _2893 = in.m_80.x;
    float _2895 = _2859 * _2891;
    out.gl_Position.x = _2764;
    out.gl_Position.y = _2788;
    out.gl_Position.z = _2863;
    out.gl_Position.w = _2754;
    float _2897 = _2895 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2899 = _2468 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2901 = -_2889;
    float _2903 = _2901 + 1.0;
    float _2905 = _2903 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2907 = _2754;
    float _2909 = _2863;
    float _2911 = _2788;
    float _2913 = _2764;
    float _2915 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    if (!_2845)
    {
        _2907 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2917 = _2907;
    float _2919 = _2917;
    float _2921 = _2917;
    if (!_2845)
    {
        _2909 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2923 = _2909;
    float _2925 = _2923;
    float _2927 = _2923;
    if (!_2845)
    {
        _2911 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2929 = _2911;
    float _2931 = _2929;
    float _2933 = _2929;
    if (!_2845)
    {
        _2913 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2935 = _2913;
    float _2937 = -_2798;
    float _2939 = _2937 + 1.0;
    float _2941 = _2939 * _2897;
    float _2943 = precise::clamp(_2941, 0.0, 1.0);
    float _2945 = _2905 * _2808;
    float _2947 = -_2905;
    float _2949 = _2947 + 1.0;
    float _2951 = -_2943;
    float _2953 = fma(_2951, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2955 = _2813;
    float _2957 = _2935;
    float _2959 = _2935;
    if (!_2845)
    {
        _2915 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2961 = _2915;
    float _2963 = _2819 * _2945;
    float _2965 = _2829 * _2945;
    float _2967 = _2953 * _2893;
    float _2969 = _2819 * _2949;
    float _2971 = fma(_2825, _2963, _2813);
    float _2973 = fma(_2827, _2963, _2815);
    float _2975 = _2967 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2977 = fma(_2819, _2965, _2817);
    float _2979 = _2961;
    float _2981 = _2961;
    if (!_2845)
    {
        _2955 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2983 = _2955;
    out.m_82.x = _2975;
    out.m_84.x = _2971;
    out.m_84.y = _2973;
    out.m_84.z = _2977;
    out.m_84.w = _2969;
    bool _2985 = !_2845;
    float _2987 = _2983;
    float _2989 = _2983;
    if (!_2985)
    {
        bool _2991 = _2490 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2993 = isnan(_2490);
        bool _2995 = _2991 || _2993;
        bool _2997 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2999 = _2995 || _2997;
        if (!_2999)
        {
            float _3001 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3003 = _2490 + _3001;
            float _3005 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3007 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3005;
            float _3009 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3011 = _3009 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3013 = 1.0 / _3007;
            float _3015 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3017 = _3015 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3019 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3021 = _3019 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3023 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3025 = _3023 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3027 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3029 = _3027 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3031 = _3003 * _3013;
            float _3033 = precise::clamp(_3031, 0.0, 1.0);
            float _3035 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3037 = _3035 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3039 = fma(_3033, _3011, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3041 = fma(_3033, _3037, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3043 = fma(_3033, _3017, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3045 = fma(_3033, _3021, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3047 = fma(_3033, _3025, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3049 = fma(_3033, _3029, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2989 = _3043;
            _2933 = _3047;
            _2981 = _3039;
            _2927 = _3045;
            _2921 = _3041;
            _2959 = _3049;
            _3051 = true;
        }
        else
        {
            bool _3053 = _2490 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3055 = isnan(_2490);
            bool _3057 = _3053 || _3055;
            bool _3059 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3061 = _3057 || _3059;
            if (!_3061)
            {
                _2979 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3063 = _2979;
            _2981 = _3063;
            if (!_3061)
            {
                _2987 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3065 = _2987;
            _2989 = _3065;
            if (!_3061)
            {
                _2919 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3067 = _2919;
            _2921 = _3067;
            if (!_3061)
            {
                _2925 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3069 = _2925;
            _2927 = _3069;
            if (!_3061)
            {
                _2931 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3071 = _2931;
            _2933 = _3071;
            if (!_3061)
            {
                _2957 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3073 = _2957;
            bool _3075 = !_3061;
            _2959 = _3073;
            if (!_3075)
            {
                bool _3077 = _2490 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3079 = isnan(_2490);
                bool _3081 = _3077 || _3079;
                bool _3083 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3085 = _3081 || _3083;
                if (!_3085)
                {
                    float _3087 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3089 = _2490 + _3087;
                    float _3091 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3093 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3091;
                    float _3095 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3097 = _3095 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3099 = 1.0 / _3093;
                    float _3101 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3103 = _3101 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3105 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3107 = _3105 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3109 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3111 = _3109 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3113 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3115 = _3113 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3117 = _3089 * _3099;
                    float _3119 = precise::clamp(_3117, 0.0, 1.0);
                    float _3121 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3123 = _3121 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3125 = fma(_3119, _3097, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3127 = fma(_3119, _3123, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3129 = fma(_3119, _3103, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3131 = fma(_3119, _3107, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3133 = fma(_3119, _3111, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3135 = fma(_3119, _3115, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2989 = _3129;
                    _2933 = _3133;
                    _2981 = _3125;
                    _2927 = _3131;
                    _2921 = _3127;
                    _2959 = _3135;
                    _3051 = true;
                }
                else
                {
                    _2989 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2933 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2981 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2927 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2921 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2959 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3051 = false;
    float _3137 = _2989;
    float _3139 = _2933;
    float _3141 = _2981;
    float _3143 = _2927;
    float _3145 = _2921;
    float _3147 = _2959;
    float _3149 = fma(_2086, -0.5, 0.5);
    float _3151 = precise::clamp(_3149, 0.0, 1.0);
    float _3153 = -_3137;
    float _3155 = _3153 + _3139;
    float _3157 = _2899 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3159 = -_3141;
    float _3161 = _3159 + _3143;
    float _3163 = fma(_3151, _3155, _3137);
    out.m_86.x = 0.0;
    float _3165 = -_3145;
    float _3167 = _3165 + _3147;
    float _3169 = fma(_3151, _3161, _3141);
    float _3171 = _3163 * 0.586610972881317138671875;
    out.m_51.x = _3157;
    bool _3173 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3175 = fma(_3151, _3167, _3145);
    float _3177 = fma(_3169, 0.298911988735198974609375, _3171);
    bool _3179 = _2468 > 0.0;
    bool _3181 = isnan(_2468);
    bool _3183 = _3179 || _3181;
    bool _3185 = isnan(0.0);
    bool _3187 = _3183 || _3185;
    float _3189 = fma(_3175, 0.114477999508380889892578125, _3177);
    out.m_88.x = 0.0;
    float _3191 = -_3189;
    float _3193 = _3169 + _3191;
    float _3195 = -_3189;
    float _3197 = _3163 + _3195;
    float _3199 = -_3189;
    float _3201 = _3175 + _3199;
    float _3203 = fma(_3193, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3189);
    float _3205 = fma(_3197, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3189);
    float _3207 = fma(_3201, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3189);
    bool _3209 = !_3173;
    if (!_3209)
    {
        float _3211 = -_2404;
        float _3213 = _3211 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3215 = -_2406;
        float _3217 = _3215 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3219 = -_2408;
        float _3221 = _3219 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3223 = _3213 * _3213;
        float _3225 = fma(_3217, _3217, _3223);
        float _3227 = fma(_3221, _3221, _3225);
        float _3229 = rsqrt(_3227);
        float _3231 = _3213 * _3229;
        float _3233 = _3217 * _3229;
        float _3235 = _3221 * _3229;
        float _3237 = -_2496;
        float _3239 = _3237 + _3231;
        float _3241 = -_2492;
        float _3243 = _3241 + _3233;
        float _3245 = -_2494;
        float _3247 = _3245 + _3235;
        float _3249 = sqrt(_3227);
        float _3251 = _3239 * _3239;
        float _3253 = fma(_3243, _3243, _3251);
        float _3255 = fma(_3247, _3247, _3253);
        float _3257 = rsqrt(_3255);
        float _3259 = -_3249;
        float _3261 = _3259 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3263 = _3261 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3265 = precise::clamp(_3263, 0.0, 1.0);
        float _3267 = abs(_3265);
        float _3269 = log2(_3267);
        float _3271 = _3239 * _3257;
        float _3273 = _3243 * _3257;
        float _3275 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
        float _3277 = precise::clamp(_3275, 0.0, 1.0);
        float _3279 = _3247 * _3257;
        float _3281 = _2086 * _3271;
        float _3283 = _2086 * _3231;
        float _3285 = fma(_2084, _3273, _3281);
        float _3287 = _3277 * _3277;
        float _3289 = _3233 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3291 = fma(_2084, _3233, _3283);
        float _3293 = fma(_2088, _3279, _3285);
        float _3295 = precise::clamp(_3293, 0.0, 1.0);
        float _3297 = _3287 + (-1.0);
        float _3299 = _3269 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3301 = fma(_2088, _3235, _3291);
        float _3303 = precise::clamp(_3301, 0.0, 1.0);
        float _3305 = _3295 * _3295;
        float _3307 = fma(_3305, _3297, 1.0);
        float _3309 = exp2(_3299);
        float _3311 = -_3231;
        float _3313 = -_3289;
        float _3315 = fma(_3311, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3313);
        float _3317 = _3307 * _3307;
        float _3319 = -_3235;
        float _3321 = fma(_3319, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3315);
        float _3323 = 1.0 / _3317;
        float _3325 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3327 = _3321 + _3325;
        float _3329 = _3327 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3331 = precise::clamp(_3329, 0.0, 1.0);
        float _3333 = _3309 * _3331;
        float _3335 = _3303 * _3333;
        float _3337 = _3287 * _3323;
        float _3339 = _3335 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3341 = _3335 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3343 = _3335 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        float _3345 = _3335 * _3337;
        float _3347 = _3345 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3349 = _3345 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3351 = _3345 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_86.x = _3339;
        out.m_86.y = _3341;
        out.m_86.z = _3343;
        out.m_88.x = _3347;
        out.m_88.y = _3349;
        out.m_88.z = _3351;
    }
    out.m_90.x = _3203;
    out.m_90.y = _3205;
    out.m_90.z = _3207;
    if (_3187)
    {
        return out;
    }
    out.m_51.x = 0.0;
    float _3353 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3353;
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
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3051 = false;
    bool _2136 = false;
    bool _337 = false;
    bool _231 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _104 = in.m_48.w;
    float _106 = trunc(_104);
    int _109 = int(_106);
    bool _113 = _109 >= 1;
    float _115 = 0.0;
    if (!_113)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _117 = _115;
    float _119 = _117;
    if (!_113)
    {
        out.m_51.x = 0.0;
    }
    int _121 = 0;
    if (!_113)
    {
        float _123 = _117 * 5.0;
        _121 = as_type<int>(_123);
    }
    int _125 = _121;
    int _127 = _125;
    if (!_113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3410 = as_type<float>(_125);
        out.gl_Position.z = _3410;
    }
    if (!_113)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _129 = in.m_53.w;
    bool _131 = _129 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _133 = isnan(_129);
    bool _135 = _131 || _133;
    bool _137 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _139 = _135 || _137;
    float _141 = -_129;
    float _143 = _141 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _145 = 0.0;
    float _147 = _143;
    if (_139)
    {
        float _149 = float(_109);
        _145 = _149;
    }
    float _151 = _145;
    bool _153 = _143 >= _151;
    bool _155 = !_139;
    bool _157 = _153 || _155;
    if (_157)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _159 = _119;
    if (_157)
    {
        out.m_51.x = 0.0;
    }
    if (_157)
    {
        float _161 = _159 * 5.0;
        _127 = as_type<int>(_161);
    }
    int _163 = _127;
    if (_157)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3479 = as_type<float>(_163);
        out.gl_Position.z = _3479;
    }
    if (_157)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _165 = as_type<float>(int(gl_VertexIndex));
    float _167 = in.m_58.x;
    float _169 = in.m_58.y;
    float _171 = in.m_58.z;
    int _173 = as_type<int>(_165) & 1;
    bool _175 = _173 != 0;
    int _177 = as_type<int>(_165) & 2;
    bool _179 = _177 != 0;
    bool _181 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _183 = _169 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _185 = _169 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _187 = _169 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _189 = !_175;
    float _191 = _189 ? (-0.5) : 0.5;
    float _193 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[4].x, _183);
    float _195 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[5].x, _185);
    float _197 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[6].x, _187);
    bool _199 = !_179;
    float _201 = _199 ? (-0.5) : 0.5;
    float _203 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[4].z, _193);
    float _205 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[5].z, _195);
    float _207 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[6].z, _197);
    bool _209 = !_181;
    float _211 = _207;
    float _229;
    if (!_209)
    {
        float _213 = in.m_60.x;
        float _215 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _217 = _213 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _219 = fma(_217, (*spvDescriptorSet0.vp_c9)._m0[12].x, _143);
        float _221 = _219 * _215;
        float _223 = floor(_221);
        float _225 = -_223;
        float _227 = _221 + _225;
        _229 = _227;
        _231 = true;
    }
    else
    {
        float _233 = float(_109);
        float _235 = 1.0 / _233;
        float _237 = _143 * _235;
        _229 = _237;
    }
    _231 = false;
    float _239 = _229;
    float _241 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _243 = _239 + _241;
    bool _245 = _239 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _247 = isnan(_239);
    bool _249 = _245 || _247;
    bool _251 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _253 = _249 || _251;
    float _255 = float(_253);
    float _257 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _259 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _257;
    float _261 = -_255;
    float _263 = _261 + 1.0;
    bool _265 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _267 = 1.0 / _259;
    float _269 = _243 * _267;
    bool _271 = _239 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _273 = isnan(_239);
    bool _275 = _271 || _273;
    bool _277 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _279 = _275 || _277;
    float _281 = float(_279);
    float _283 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _285 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _283;
    float _287 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _289 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _287;
    float _291 = _281 * _263;
    float _293 = fma(_285, _269, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _295 = fma(_289, _269, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _297 = -_281;
    float _299 = _297 + 1.0;
    float _301 = _293 * _291;
    float _303 = _295 * _291;
    float _305 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[143].x, _301);
    float _307 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[143].y, _303);
    float _309 = fma(_255, (*spvDescriptorSet0.vp_c9)._m0[144].x, _305);
    float _311 = fma(_255, (*spvDescriptorSet0.vp_c9)._m0[144].y, _307);
    bool _313 = !_265;
    float _333;
    float _335;
    if (!_313)
    {
        float _315 = in.m_60.x;
        float _317 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _319 = float(_109);
        float _321 = _315 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _323 = fma(_321, (*spvDescriptorSet0.vp_c9)._m0[11].y, _143);
        float _325 = _323 * _317;
        float _327 = floor(_325);
        float _329 = -_327;
        float _331 = _325 + _329;
        _333 = _319;
        _335 = _331;
        _337 = true;
    }
    else
    {
        float _339 = float(_109);
        float _341 = 1.0 / _339;
        float _343 = _143 * _341;
        _333 = _339;
        _335 = _343;
    }
    _337 = false;
    float _345 = _333;
    float _347 = _335;
    float _349 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _351 = int(_349);
    float _353 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _355 = int(_353);
    float _357 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _361 = _359 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _363 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _365 = 1.0 / _345;
    float _367 = float(_351);
    float _369 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _371 = 1.0 / _367;
    float _373 = float(uint(_355));
    int _375 = ~_355;
    int _377 = _375 + 1;
    int _379 = ~_355;
    int _381 = _379 + 1;
    float _383 = float(_355);
    float _385 = 1.0 / _373;
    float _387 = _371 * _143;
    float _389 = 1.0 / _361;
    int _391 = as_type<int>(_385) + (-2);
    float _393 = trunc(_387);
    int _395 = int(_393);
    float _397 = float(uint(_395));
    float _399 = as_type<float>(_391) * _397;
    float _401 = trunc(_399);
    float _403 = precise::max(_401, 0.0);
    uint _406 = uint(_403);
    int _408 = _377 * int(_406);
    int _410 = _408 + _395;
    float _412 = float(uint(_410));
    float _414 = in.m_60.x;
    float _416 = in.m_60.y;
    float _418 = in.m_60.z;
    float _420 = as_type<float>(_391) * _412;
    float _422 = trunc(_420);
    float _424 = precise::max(_422, 0.0);
    uint _426 = uint(_424);
    int _428 = int(_406) + int(_426);
    float _430 = fma(_416, (*spvDescriptorSet0.vp_c9)._m0[88].w, _369);
    float _432 = float(_395);
    int _434 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _436 = _434 != 0;
    int _438 = _381 * _428;
    int _440 = _438 + _395;
    bool _442 = _432 >= _383;
    bool _444 = isnan(_432);
    bool _446 = _442 || _444;
    bool _448 = isnan(_383);
    bool _450 = _446 || _448;
    float _452 = float(_450);
    bool _454 = !_436;
    float _456 = _454 ? 7.345489978790283203125 : 1.0;
    bool _458 = uint(_440) >= uint(_355);
    float _460 = trunc(_452);
    int _462 = int(_460);
    float _464 = _456 * _414;
    bool _466 = !_458;
    int _468 = _466 ? 0 : (-1);
    bool _470 = _355 == 0;
    int _472 = ~_428;
    int _474 = _472 + _468;
    int _476 = _474 + 1;
    float _478 = floor(_464);
    int _480 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _482 = _480 != 0;
    int _484 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _486 = _484 != 0;
    int _488 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _490 = _488 != 0;
    int _492 = _355 * _476;
    int _494 = _492 + _395;
    int _496 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _498 = _496 != 0;
    bool _500 = _416 > 0.5;
    int _502 = ~_462;
    int _504 = _502 + 1;
    int _506 = _504 + 1;
    bool _508 = !_470;
    int _510 = _508 ? _494 : (-1);
    float _512 = -_191;
    int _514 = _500 ? as_type<int>(_512) : as_type<int>(_191);
    int _516 = int(_436);
    int _518 = _470 ? 2 : 0;
    int _520 = _516 | _518;
    int _522 = _498 ? 4 : 0;
    int _524 = _520 | _522;
    int _526 = _500 ? 8 : 0;
    int _528 = _524 | _526;
    int _530 = _482 ? 16 : 0;
    int _532 = _528 | _530;
    int _534 = _486 ? 32 : 0;
    int _536 = _532 | _534;
    int _538 = _490 ? 64 : 0;
    int _540 = _536 | _538;
    int _542 = _540 & 8;
    float _544 = -_478;
    float _546 = _464 + _544;
    int _548 = _510 * _506;
    int _550 = _355 + (-1);
    float _552 = _546 * _383;
    float _554 = _383 * _143;
    bool _556 = !_486;
    int _558 = _556 ? 0 : 1;
    int _560 = _462 * _550;
    int _562 = _560 + _548;
    float _564 = trunc(_552);
    int _566 = int(_564);
    float _568 = _554 * _365;
    bool _570 = !_482;
    int _572 = _570 ? 0 : 1;
    bool _574 = !_498;
    int _576 = _574 ? 0 : 1;
    int _578 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _580 = _578 != 0;
    float _582 = trunc(_568);
    int _584 = int(_582);
    int _586 = abs(_558);
    bool _588 = !_490;
    int _590 = _588 ? 0 : 1;
    int _592 = abs(_572);
    int _594 = _562 * _586;
    int _596 = abs(_576);
    bool _598 = !_580;
    int _600 = _598 ? 0 : 1;
    int _602 = abs(_590);
    int _604 = _566 * _596;
    int _606 = _604 + _395;
    int _608 = abs(_600);
    int _610 = _584 * _592;
    int _612 = _610 + _594;
    float _614 = float(uint(_606));
    int _616 = _606 * _602;
    int _618 = _616 + _612;
    int _620 = ~_355;
    int _622 = _620 + 1;
    int _624 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _626 = _624 != 0;
    int _628 = _566 * _608;
    int _630 = _628 + _618;
    int _632 = ~_355;
    int _634 = _632 + 1;
    float _636 = as_type<float>(_391) * _614;
    int _638 = ~_355;
    int _640 = _638 + 1;
    float _642 = float(uint(_630));
    float _644 = trunc(_636);
    float _646 = precise::max(_644, 0.0);
    uint _648 = uint(_646);
    bool _650 = !_626;
    float _652 = _650 ? _191 : as_type<float>(_514);
    int _654 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _656 = _654 != 0;
    float _658 = as_type<float>(_391) * _642;
    int _660 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _662 = _660 != 0;
    int _664 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _666 = _664 != 0;
    bool _668 = !_656;
    int _670 = _668 ? 0 : 1;
    float _672 = trunc(_658);
    float _674 = precise::max(_672, 0.0);
    uint _676 = uint(_674);
    int _678 = abs(_670);
    int _680 = _634 * int(_676);
    int _682 = _680 + _630;
    float _684 = float(uint(_682));
    float _686 = as_type<float>(_391) * _684;
    float _688 = trunc(_686);
    float _690 = precise::max(_688, 0.0);
    uint _692 = uint(_690);
    int _694 = _640 * int(_648);
    int _696 = _694 + _606;
    float _698 = float(uint(_696));
    int _700 = int(_676) + int(_692);
    float _702 = as_type<float>(_391) * _698;
    float _704 = _416 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _706 = _622 * _700;
    int _708 = _706 + _630;
    float _710 = in.m_62.x;
    float _712 = in.m_62.y;
    float _714 = fma(_704, -2.0, _363);
    float _716 = trunc(_702);
    float _718 = precise::max(_716, 0.0);
    uint _720 = uint(_718);
    bool _722 = uint(_708) >= uint(_355);
    bool _724 = !_722;
    int _726 = _724 ? 0 : (-1);
    int _728 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _730 = _728 != 0;
    float _732 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _734 = ~_700;
    int _736 = _734 + _726;
    int _738 = _736 + 1;
    int _740 = _355 * _738;
    int _742 = _740 + _630;
    float _744 = in.m_48.x;
    float _746 = in.m_48.y;
    float _748 = in.m_48.z;
    int _750 = int(_648) + int(_720);
    float _752 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _754 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _752;
    bool _756 = !_470;
    int _758 = _756 ? _742 : (-1);
    float _760 = _309 * _710;
    float _762 = _414 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _764 = _758 >> 31;
    int _766 = _758 & 3;
    bool _768 = _766 != 0;
    float _770 = -_357;
    float _772 = fma(_762, 2.0, _770);
    int _774 = _764 & 3;
    bool _776 = !_768;
    int _778 = _776 ? 0 : 1;
    int _780 = _758 & 3;
    bool _782 = _780 != 0;
    int _784 = _758 + _774;
    int _786 = _782 ? 0 : 1;
    bool _788 = uint(_766) > 1u;
    float _790 = _746 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _792 = _746 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _794 = _746 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _796 = _784 >> 2;
    float _798 = fma(_744, (*spvDescriptorSet0.vp_c10)._m0[4].x, _790);
    int _800 = ~_355;
    int _802 = _800 + 1;
    float _804 = fma(_744, (*spvDescriptorSet0.vp_c10)._m0[5].x, _792);
    int _806 = _796 << 4;
    int _808 = _806 + 368;
    float _810 = fma(_744, (*spvDescriptorSet0.vp_c10)._m0[6].x, _794);
    int _812 = ~_786;
    int _814 = _812 + 1;
    int _816 = _814 + 1;
    int _818 = _802 * _750;
    int _820 = _818 + _606;
    uint _822 = uint(int(uint(_808) >> uint(2)));
    uint _824 = uint(int(uint(int(_822)) >> uint(2)));
    int _826 = int(_822) & 3;
    float _828 = (*spvDescriptorSet0.vp_c9)._m0[int(_824)][_826];
    int _830 = int(_822) + 1;
    uint _832 = uint(int(uint(_830) >> uint(2)));
    int _834 = _830 & 3;
    float _836 = (*spvDescriptorSet0.vp_c9)._m0[int(_832)][_834];
    int _838 = _816;
    if (!_788)
    {
        int _840 = ~_786;
        int _842 = _840 + 1;
        _838 = _842;
    }
    int _844 = _838;
    float _846 = fma(_748, (*spvDescriptorSet0.vp_c10)._m0[5].z, _804);
    bool _848 = uint(_820) >= uint(_355);
    float _850 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _852 = _850 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _854 = !_848;
    int _856 = _854 ? 0 : (-1);
    bool _858 = uint(_766) >= 2u;
    float _860 = 1.0 / _852;
    float _862 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _864 = _858 ? 0 : 1;
    float _866 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _868 = _766 != 3;
    float _870 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _872 = _808 + 8;
    uint _874 = uint(int(uint(_872) >> uint(2)));
    uint _876 = uint(int(uint(int(_874)) >> uint(2)));
    int _878 = int(_874) & 3;
    float _880 = (*spvDescriptorSet0.vp_c9)._m0[int(_876)][_878];
    int _882 = int(_874) + 1;
    uint _884 = uint(int(uint(_882) >> uint(2)));
    int _886 = _882 & 3;
    float _888 = (*spvDescriptorSet0.vp_c9)._m0[int(_884)][_886];
    float _890 = _862 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _892 = _866 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _894 = _870 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _896 = ~_750;
    int _898 = _896 + _856;
    int _900 = _898 + 1;
    float _902 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _904 = _902 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    int _906 = abs(_778);
    float _908 = _754 * _860;
    out.m_64.x = _890;
    out.m_64.y = _892;
    out.m_64.z = _894;
    out.m_64.w = _732;
    float _910 = _416 + _414;
    float _912 = _414 * 2.0;
    float _914 = _416 * 2.0;
    float _916 = _910 + (-1.0);
    float _918 = floor(_912);
    float _920 = _904 * _389;
    int _922 = ~_864;
    int _924 = _922 + 1;
    int _926 = _924 + 1;
    int _928 = _355 * _900;
    int _930 = _928 + _606;
    int _932 = _926;
    if (_868)
    {
        int _934 = ~_864;
        int _936 = _934 + 1;
        _932 = _936;
    }
    int _938 = _932;
    float _940 = floor(_914);
    int _942 = abs(_844);
    float _944 = fma(_916, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _946 = !_470;
    int _948 = _946 ? _930 : (-1);
    int _950 = ~_942;
    int _952 = _950 + 1;
    int _954 = _952 + 1;
    bool _956 = _766 != 3;
    float _958 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _960 = log2(_958);
    int _962 = _954 * as_type<int>(_836);
    int _964 = abs(_938);
    int _966 = ~_906;
    int _968 = _966 + 1;
    int _970 = _968 + 1;
    bool _972 = !_956;
    int _974 = _972 ? 0 : (-1);
    float _976 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _978 = int(_976);
    int _980 = _970 * as_type<int>(_828);
    int _982 = _980 + _962;
    int _984 = abs(_974);
    float _986 = _416 + _418;
    int _988 = ~_964;
    int _990 = _988 + 1;
    int _992 = _990 + 1;
    float _994 = _960 * _143;
    int _996 = ~_984;
    int _998 = _996 + 1;
    int _1000 = _998 + 1;
    float _1002 = _986 + (-1.0);
    int _1004 = _992 * as_type<int>(_880);
    int _1006 = _1004 + _982;
    float _1008 = as_type<float>(_982);
    float _1010 = _880;
    if (_436)
    {
        _1008 = _414;
    }
    float _1012 = _1008;
    float _1014 = exp2(_994);
    float _1016 = _1012;
    if (_436)
    {
        _1010 = _416;
    }
    float _1018 = _1010;
    int _1020 = _1000 * as_type<int>(_888);
    int _1022 = _1020 + _1006;
    float _1024 = fma(_1002, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1026 = _1018;
    if (!_436)
    {
        _1016 = _418;
    }
    float _1028 = _1016;
    float _1030 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    if (!_436)
    {
        _1026 = _414;
    }
    float _1032 = _1026;
    bool _1034 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1036 = isnan(0.0);
    bool _1038 = _1034 || _1036;
    bool _1040 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1042 = _1038 || _1040;
    float _1044 = fma(_416, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1030);
    float _1046 = float(uint(_978));
    float _1048 = -_1014;
    float _1050 = _1048 + 1.0;
    float _1052 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1054 = _1028 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1056 = _1032 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _1058 = ~_678;
    int _1060 = _1058 + 1;
    int _1062 = _1060 + 1;
    float _1064 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1066 = _1042 ? _1050 : 0.0;
    float _1068 = 1.0 / _1046;
    bool _1070 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1072 = isnan(1.0);
    bool _1074 = _1070 || _1072;
    bool _1076 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1078 = _1074 || _1076;
    int _1080 = _1022 * _1062;
    float _1082 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1084 = 1.0 + _1082;
    float _1086 = -_1064;
    float _1088 = fma(_1054, 2.0, _1086);
    int _1090 = _948 * _678;
    int _1092 = _1090 + _1080;
    int _1094 = abs(_978);
    float _1096 = fma(_1056, -2.0, _1052);
    float _1098 = 1.0 / _1084;
    float _1100 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1102 = float(uint(_1094));
    float _1104 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[76].y, _714);
    bool _1106 = _918 > 0.0;
    float _1108 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1110 = fma(_414, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1100);
    bool _1112 = _918 >= 0.0;
    bool _1114 = isnan(_918);
    bool _1116 = _1112 || _1114;
    bool _1118 = isnan(0.0);
    bool _1120 = _1116 || _1118;
    float _1122 = 1.0 / _1102;
    float _1124 = fma(_414, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1108);
    float _1126 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1044);
    int _1128 = as_type<int>(_1068) + (-2);
    float _1130 = -_143;
    float _1132 = fma(_1130, (*spvDescriptorSet0.vp_c9)._m0[76].x, _772);
    float _1134 = float(uint(_1092));
    float _1136 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1124);
    int _1138 = abs(_1092);
    float _1140 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1110);
    float _1142 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[87].w, _430);
    float _1144 = -_143;
    float _1146 = fma(_1144, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1088);
    float _1148 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1096);
    if (_1078)
    {
        float _1150 = _1066 * _1098;
        _147 = _1150;
    }
    float _1152 = _147;
    float _1154 = as_type<float>(_1128) * _1134;
    bool _1156 = _418 > 0.5;
    float _1158 = _418 * 2.0;
    int _1160 = as_type<int>(_1122) + (-2);
    float _1162 = -_1136;
    float _1164 = _1162 + 1.0;
    float _1166 = float(uint(_1138));
    float _1168 = trunc(_1154);
    float _1170 = precise::max(_1168, 0.0);
    uint _1172 = uint(_1170);
    float _1174 = -_201;
    int _1176 = _1156 ? as_type<int>(_1174) : as_type<int>(_201);
    float _1178 = -_1126;
    float _1180 = _1178 + 1.0;
    int _1182 = _1120 ? 0 : 1;
    bool _1184 = _940 > 0.0;
    bool _1186 = _940 >= 0.0;
    bool _1188 = isnan(_940);
    bool _1190 = _1186 || _1188;
    bool _1192 = isnan(0.0);
    bool _1194 = _1190 || _1192;
    float _1196 = as_type<float>(_1160) * _1166;
    float _1198 = floor(_1158);
    int _1200 = ~_1182;
    int _1202 = _1200 + 1;
    int _1204 = _1202 + 1;
    int _1206 = ~_978;
    int _1208 = _1206 + 1;
    int _1210 = _1204;
    if (!_1106)
    {
        int _1212 = ~_1182;
        int _1214 = _1212 + 1;
        _1210 = _1214;
    }
    int _1216 = _1210;
    float _1218 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1220 = _347 + _1218;
    bool _1222 = _347 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1224 = isnan(_347);
    bool _1226 = _1222 || _1224;
    bool _1228 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1230 = _1226 || _1228;
    float _1232 = float(_1230);
    float _1234 = trunc(_1196);
    float _1236 = precise::max(_1234, 0.0);
    uint _1238 = uint(_1236);
    int _1240 = _1208 * int(_1172);
    int _1242 = _1240 + _1092;
    float _1244 = fma(_908, _1220, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1246 = _347 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1248 = isnan(_347);
    bool _1250 = _1246 || _1248;
    bool _1252 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1254 = _1250 || _1252;
    float _1256 = float(_1254);
    int _1258 = ~_1094;
    int _1260 = _1258 + 1;
    float _1262 = float(uint(_1242));
    float _1264 = -_1256;
    float _1266 = _1264 + 1.0;
    int _1268 = _1194 ? 0 : 1;
    float _1270 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _1272 = _1198 > 0.0;
    float _1274 = as_type<float>(_1128) * _1262;
    bool _1276 = _1198 >= 0.0;
    bool _1278 = isnan(_1198);
    bool _1280 = _1276 || _1278;
    bool _1282 = isnan(0.0);
    bool _1284 = _1280 || _1282;
    float _1286 = _1232 * _1266;
    bool _1288 = _347 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1290 = isnan(_347);
    bool _1292 = _1288 || _1290;
    bool _1294 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1296 = _1292 || _1294;
    float _1298 = float(_1296);
    int _1300 = _1260 * int(_1238);
    int _1302 = _1300 + _1138;
    float _1304 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1306 = _347 + _1304;
    float _1308 = _1244 * _1286;
    float _1310 = float(_1216);
    float _1312 = -_1298;
    float _1314 = _1312 + 1.0;
    float _1316 = float(uint(_1302));
    float _1318 = -_1232;
    float _1320 = _1318 + 1.0;
    bool _1322 = !_666;
    float _1324 = _1322 ? _201 : as_type<float>(_1176);
    float _1326 = _1256 * _1314;
    int _1328 = ~_1268;
    int _1330 = _1328 + 1;
    int _1332 = _1330 + 1;
    float _1334 = as_type<float>(_1160) * _1316;
    int _1336 = _1332;
    if (!_1184)
    {
        int _1338 = ~_1268;
        int _1340 = _1338 + 1;
        _1336 = _1340;
    }
    int _1342 = _1336;
    float _1344 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _1346 = _1284 ? 0 : 1;
    float _1348 = fma(_920, _1306, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1350 = fma(_748, (*spvDescriptorSet0.vp_c10)._m0[4].z, _798);
    int _1352 = ~_978;
    int _1354 = _1352 + 1;
    float _1356 = fma(_1320, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1308);
    int _1358 = ~_1346;
    int _1360 = _1358 + 1;
    int _1362 = _1360 + 1;
    float _1364 = _1350 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1366 = trunc(_1274);
    float _1368 = precise::max(_1366, 0.0);
    uint _1370 = uint(_1368);
    int _1372 = _1362;
    if (!_1272)
    {
        int _1374 = ~_1346;
        int _1376 = _1374 + 1;
        _1372 = _1376;
    }
    int _1378 = _1372;
    float _1380 = _1324 + (-0.5);
    int _1382 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1384 = _1382 != 0;
    int _1386 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1388 = _1386 != 0;
    int _1390 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1392 = _1390 != 0;
    float _1394 = fma(_748, (*spvDescriptorSet0.vp_c10)._m0[6].z, _810);
    float _1396 = _1270 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1398 = _652 + 0.5;
    int _1400 = ~_1094;
    int _1402 = _1400 + 1;
    float _1404 = trunc(_1334);
    float _1406 = precise::max(_1404, 0.0);
    uint _1408 = uint(_1406);
    float _1410 = _1344 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1412 = fma(_1396, _1398, _1146);
    bool _1414 = !_1384;
    int _1416 = _1414 ? 0 : 1;
    float _1418 = fma(_1348, _1326, _1356);
    float _1420 = -_1410;
    float _1422 = -_1148;
    float _1424 = fma(_1420, _1380, _1422);
    bool _1426 = !_1388;
    int _1428 = _1426 ? 0 : 1;
    float _1430 = _1394 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1432 = int(_1172) + int(_1370);
    float _1434 = fma(_1298, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1418);
    int _1436 = abs(_1428);
    float _1438 = -_1140;
    float _1440 = _1438 + 1.0;
    int _1442 = abs(_1416);
    int _1444 = _1354 * _1432;
    int _1446 = _1444 + _1092;
    float _1448 = -_1440;
    float _1450 = fma(_652, _1448, _1412);
    int _1452 = int(_1238) + int(_1408);
    float _1454 = -_1142;
    float _1456 = _1454 + 1.0;
    bool _1458 = uint(_1446) >= uint(_978);
    float _1460 = _846 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1462 = float(_1436);
    int _1464 = _1402 * _1452;
    int _1466 = _1464 + _1138;
    bool _1468 = !_1458;
    int _1470 = _1468 ? 0 : (-1);
    float _1472 = fma(_1324, _1456, _1424);
    int _1474 = _1092 ^ _978;
    float _1476 = _1462 * _1310;
    bool _1478 = uint(_1466) >= uint(_1094);
    float _1480 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1482 = ~_1432;
    int _1484 = _1482 + _1470;
    int _1486 = _1484 + 1;
    float _1488 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1490 = _1460 + _1488;
    bool _1492 = !_1478;
    int _1494 = _1492 ? 0 : (-1);
    out.m_66.x = _1450;
    out.m_66.y = _1472;
    float _1496 = float(_1442);
    int _1498 = _978 * _1486;
    int _1500 = _1498 + _1092;
    int _1502 = ~_1494;
    int _1504 = _1452 + _1502;
    int _1506 = _1504 + 1;
    float _1508 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1510 = _1430 + _1508;
    float _1512 = in.m_68.x;
    float _1514 = in.m_68.y;
    float _1516 = in.m_68.z;
    float _1518 = float(_1378);
    float _1520 = _1476 * (-2.0);
    bool _1522 = _978 == 0;
    float _1524 = _1496 * _1518;
    bool _1526 = _978 == 0;
    float _1528 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    uint _1530 = uint(int(uint(_1474) >> uint(31)));
    float _1532 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1534 = _1364 + _1532;
    float _1536 = _1490 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1538 = _1528 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1540 = ~int(_1530);
    int _1542 = _1540 + 1;
    float _1544 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1546 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1536);
    float _1548 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1550 = _1434 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _1552 = _1506 ^ _1542;
    float _1554 = _1480 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1556 = !_1522;
    int _1558 = _1556 ? _1500 : (-1);
    float _1560 = _1524 * (-2.0);
    float _1562 = _1544 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1564 = _1548 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1566 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1568 = _414 > 0.5;
    float _1570 = fma(_1510, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1546);
    int _1572 = ~_1542;
    int _1574 = _1572 + _1552;
    int _1576 = _1574 + 1;
    float _1578 = fma(_1560, _1512, _1512);
    bool _1580 = _542 != 0;
    out.m_70.x = _1562;
    out.m_70.y = _1564;
    out.m_70.z = _1538;
    out.m_70.w = _1550;
    float _1582 = -_191;
    int _1584 = _1568 ? as_type<int>(_1582) : as_type<int>(_191);
    float _1586 = fma(_1520, _1514, _1514);
    float _1588 = float(_1558);
    bool _1590 = !_662;
    float _1592 = _1590 ? _191 : as_type<float>(_1584);
    bool _1594 = !_1526;
    int _1596 = _1594 ? _1576 : (-1);
    float _1598 = fma(_1554, _1588, _1132);
    bool _1600 = _1570 >= 0.0;
    float _1602 = fma(_944, _1560, _944);
    float _1604 = float(_1596);
    float _1606 = _414 + (-0.5);
    float _1608 = _1490 * _1490;
    float _1610 = -_201;
    int _1612 = _1580 ? as_type<int>(_1610) : as_type<int>(_201);
    float _1614 = _1566 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1616 = fma(_1606, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1578);
    float _1618 = fma(_1534, _1534, _1608);
    bool _1620 = !_730;
    float _1622 = _1620 ? _201 : as_type<float>(_1612);
    float _1624 = _1592 + 0.5;
    float _1626 = -_1104;
    float _1628 = fma(_1614, _1604, _1626);
    float _1630 = fma(_1510, _1510, _1618);
    float _1632 = _1614;
    if (_1600)
    {
        out.m_51.x = 0.0;
    }
    float _1634 = fma(_1554, _1624, _1598);
    float _1636 = _1622 + (-0.5);
    float _1638 = rsqrt(_1630);
    float _1640 = fma(_1024, _1520, _1024);
    float _1642 = -_1164;
    float _1644 = fma(_1592, _1642, _1634);
    float _1646 = -_1614;
    float _1648 = fma(_1646, _1636, _1628);
    if (_1600)
    {
        _1632 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1650 = _1632;
    float _1652 = _760 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1654 = fma(_1622, _1180, _1648);
    bool _1656 = !_1392;
    int _1658 = _1656 ? 0 : 1;
    int _1660 = as_type<int>(_1650);
    if (_1600)
    {
        float _1662 = _1650 * 5.0;
        _1660 = as_type<int>(_1662);
    }
    int _1664 = _1660;
    float _1666 = _1652 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _1668 = fma(_1602, _1152, _1616);
    out.m_72.x = _1644;
    out.m_72.y = _1654;
    float _1670 = _416 + (-0.5);
    int _1672 = abs(_1658);
    float _1674 = _1666 * _1638;
    if (_1600)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5732 = as_type<float>(_1664);
        out.gl_Position.z = _5732;
    }
    float _1676 = _1534 * _1674;
    float _1678 = _1490 * _1674;
    if (_1600)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1680 = -_1678;
    float _1682 = _1460 + _1680;
    float _1684 = _1510 * _1674;
    float _1686 = -_1676;
    float _1688 = _1364 + _1686;
    float _1690 = _1668 * 0.15915493667125701904296875;
    float _1692 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1694 = _1682 + _1692;
    float _1696 = -_1684;
    float _1698 = _1430 + _1696;
    float _1700 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1702 = _1688 + _1700;
    float _1704 = -_1678;
    float _1706 = _1490 + _1704;
    float _1708 = _1694 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1710 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1712 = _1698 + _1710;
    float _1714 = float(_1342);
    float _1716 = fma(_1670, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1586);
    float _1718 = fma(_1702, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1708);
    float _1720 = float(_1672);
    float _1722 = -_1676;
    float _1724 = _1534 + _1722;
    float _1726 = _1706 * _1706;
    float _1728 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1718);
    float _1730 = _418 + _414;
    float _1732 = _1720 * _1714;
    float _1734 = fma(_1640, _1152, _1716);
    float _1736 = fma(_1724, _1724, _1726);
    bool _1738 = _1728 >= 0.0;
    float _1740 = -_1684;
    float _1742 = _1510 + _1740;
    float _1744 = _1730 + (-1.0);
    float _1746 = _1732 * (-2.0);
    float _1748 = _1734 * 0.15915493667125701904296875;
    float _1750 = fma(_1742, _1742, _1736);
    float _1752 = _1690 * 6.283185482025146484375;
    float _1754 = sin(_1752);
    float _1756 = fma(_1744, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1758 = _418 + (-0.5);
    float _1760 = fma(_1746, _1516, _1516);
    float _1762 = fma(_1756, _1746, _1756);
    float _1764 = _1724;
    int _1766 = as_type<int>(_1758);
    float _1768 = _1684;
    if (_1738)
    {
        _1764 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1770 = _1764;
    float _1772 = fma(_1758, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1760);
    float _1774 = _1690 * 6.283185482025146484375;
    float _1776 = cos(_1774);
    if (_1738)
    {
        out.m_51.x = 0.0;
    }
    if (_1738)
    {
        float _1778 = _1770 * 5.0;
        _1766 = as_type<int>(_1778);
    }
    int _1780 = _1766;
    float _1782 = fma(_1762, _1152, _1772);
    float _1784 = _1748 * 6.283185482025146484375;
    float _1786 = sin(_1784);
    if (_1738)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5915 = as_type<float>(_1780);
        out.gl_Position.z = _5915;
    }
    float _1788 = _1782 * 0.15915493667125701904296875;
    float _1790 = sqrt(_1750);
    float _1792 = _1748 * 6.283185482025146484375;
    float _1794 = cos(_1792);
    if (_1738)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1796 = _1788 * 6.283185482025146484375;
    float _1798 = cos(_1796);
    float _1800 = _311 * _712;
    float _1802 = _1638 * _1790;
    float _1804 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _201);
    float _1806 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _191);
    float _1808 = _1800 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1810 = _1652 * _1802;
    float _1812 = _1776 * _1786;
    float _1814 = _1788 * 6.283185482025146484375;
    float _1816 = sin(_1814);
    float _1818 = _1802 * _1808;
    float _1820 = _1776 * _1794;
    float _1822 = _1754 * _1794;
    float _1824 = _1806 * _1810;
    float _1826 = _1804 * _1818;
    float _1828 = _1754 * _1786;
    float _1830 = _1776 * _1798;
    float _1832 = _1786 * _1798;
    float _1834 = _1794 * _1798;
    float _1836 = _1754 * _1798;
    float _1838 = _1830 * _1826;
    float _1840 = _1802 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1842 = _1840 * 0.5;
    float _1844 = fma(_1816, _1820, _1828);
    float _1846 = -_1826;
    float _1848 = _1816 * _1846;
    float _1850 = -_1822;
    float _1852 = fma(_1816, _1812, _1850);
    float _1854 = -_1812;
    float _1856 = fma(_1816, _1822, _1854);
    float _1858 = fma(_1844, _1824, _1838);
    float _1860 = _1836 * _1826;
    float _1862 = fma(_1834, _1824, _1848);
    float _1864 = fma(_1816, _1828, _1820);
    float _1866 = fma(_1852, _1842, _1858);
    float _1868 = fma(_1856, _1824, _1860);
    float _1870 = fma(_1832, _1842, _1862);
    float _1872 = _1844 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1874 = _1866 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1876 = _1866 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1878 = fma(_1864, _1842, _1868);
    float _1880 = _1866 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1882 = fma(_1870, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1874);
    float _1884 = fma(_1870, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1876);
    float _1886 = _1844 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1888 = fma(_1870, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1880);
    float _1890 = fma(_1878, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1882);
    float _1892 = fma(_1878, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1884);
    float _1894 = _1844 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1896 = fma(_1878, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1888);
    float _1898 = _1890 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1900 = _1892 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1902 = fma(_1834, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1872);
    float _1904 = fma(_1834, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1886);
    float _1906 = _1364 + _1898;
    float _1908 = _1430 + _1900;
    float _1910 = fma(_1834, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1894);
    float _1912 = _1830 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1914 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1916 = _1906 + _1914;
    float _1918 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1920 = _1908 + _1918;
    float _1922 = _1830 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1924 = _1830 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1926 = _1916 * _1916;
    float _1928 = _1920 * _1920;
    float _1930 = _1896 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1932 = _1852 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1934 = _1852 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1936 = _1926 + _1928;
    float _1938 = -_1816;
    float _1940 = fma(_1938, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1912);
    float _1942 = -_1816;
    float _1944 = fma(_1942, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1922);
    float _1946 = -_1816;
    float _1948 = fma(_1946, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1924);
    float _1950 = sqrt(_1936);
    float _1952 = _1852 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1954 = _1460 + _1930;
    float _1956 = fma(_1856, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1902);
    float _1958 = fma(_1856, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1904);
    float _1960 = fma(_1856, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1910);
    float _1962 = fma(_1832, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1932);
    float _1964 = fma(_1832, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1934);
    float _1966 = fma(_1832, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1952);
    bool _1968 = _1950 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1970 = _1952;
    float _1972 = _1926;
    float _1974 = _1928;
    float _1976 = _1906;
    float _1978 = _1908;
    float _1980 = _1802;
    if (!_1968)
    {
        _1970 = _1954;
    }
    float _1982 = _1970;
    bool _1984 = !_1968;
    float _1986 = _1982;
    if (!_1984)
    {
        float _1988 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1990 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1992 = _1950 + _1990;
        float _1994 = _1954 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1996 = rsqrt(_1936);
        float _1998 = _1992 * _1988;
        float _2000 = _1998 * 0.15915493667125701904296875;
        float _2002 = _2000 * 6.283185482025146484375;
        float _2004 = sin(_2002);
        float _2006 = _2000 * 6.283185482025146484375;
        float _2008 = cos(_2006);
        float _2010 = fma(_2004, _1994, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2012 = _1996 * _2010;
        float _2014 = fma(_1916, _2012, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2016 = _2008 + (-1.0);
        float _2018 = fma(_1920, _2012, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2020 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2022 = _2014 + _2020;
        float _2024 = _2016 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2026 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2028 = _2018 + _2026;
        float _2030 = _2022 * _2022;
        float _2032 = fma(_1954, _2008, _2024);
        float _2034 = _2028 * _2028;
        _1986 = _2032;
        _1972 = _2030;
        _1974 = _2034;
        _1976 = _2014;
        _1978 = _2018;
    }
    float _2036 = _1986;
    float _2038 = _1972;
    float _2040 = _1974;
    float _2042 = _1976;
    float _2044 = _1978;
    float _2046 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2048 = _2036 + _2046;
    float _2050 = fma(_1836, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1940);
    float _2052 = fma(_1836, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1944);
    float _2054 = _201 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2056 = fma(_2048, _2048, _2038);
    float _2058 = fma(_1836, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1948);
    float _2060 = _191 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2062 = _2054 * _2050;
    float _2064 = _2056 + _2040;
    float _2066 = _2054 * _2052;
    float _2068 = _2054 * _2058;
    float _2070 = fma(_1864, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1962);
    float _2072 = fma(_1864, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1964);
    float _2074 = fma(_1864, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1966);
    float _2076 = sqrt(_2064);
    float _2078 = fma(_2060, _1956, _2062);
    float _2080 = fma(_2060, _1958, _2066);
    float _2082 = fma(_2060, _1960, _2068);
    float _2084 = _2070 + _2078;
    float _2086 = _2072 + _2080;
    float _2088 = _2074 + _2082;
    out.m_74.x = _2084;
    out.m_74.y = _2086;
    out.m_74.z = _2088;
    bool _2090 = _2076 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2092 = isnan(_2076);
    bool _2094 = _2090 || _2092;
    bool _2096 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2098 = _2094 || _2096;
    float _2100 = _2068;
    if (!_2098)
    {
        _2100 = 1.0;
    }
    float _2102 = _2100;
    bool _2104 = !_2098;
    float _2106 = _2102;
    if (!_2104)
    {
        bool _2108 = _2076 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2110 = isnan(_2076);
        bool _2112 = _2108 || _2110;
        bool _2114 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2116 = _2112 || _2114;
        if (!_2116)
        {
            float _2118 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2120 = _2076 + _2118;
            float _2122 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2124 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2122;
            float _2126 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2128 = _2126 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2130 = 1.0 / _2124;
            float _2132 = _2120 * _2130;
            float _2134 = fma(_2132, _2128, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2106 = _2134;
            _2136 = true;
        }
        else
        {
            bool _2138 = _2076 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2140 = isnan(_2076);
            bool _2142 = _2138 || _2140;
            bool _2144 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2146 = _2142 || _2144;
            if (!_2146)
            {
                float _2148 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2150 = _2076 + _2148;
                float _2152 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2154 = _2152 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2156 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2158 = _2156 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2160 = 1.0 / _2154;
                float _2162 = _2150 * _2160;
                float _2164 = fma(_2162, _2158, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2106 = _2164;
                _2136 = true;
            }
            else
            {
                _2106 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2136 = false;
    float _2166 = _2106;
    float _2168 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2170 = _2036 + _2168;
    float _2172 = _1682 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2174 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2176 = _2042 + _2174;
    float _2178 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2180 = _2044 + _2178;
    float _2182 = fma(_2170, _2166, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2184 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2172);
    float _2186 = fma(_2176, _2166, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2188 = fma(_2180, _2166, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2190 = -_1460;
    float _2192 = _2190 + _2182;
    float _2194 = fma(_1698, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2184);
    float _2196 = -_1364;
    float _2198 = _2196 + _2186;
    float _2200 = -_1430;
    float _2202 = _2200 + _2188;
    float _2204 = _2192 * _2192;
    float _2206 = _2194 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2208 = _1682 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2210 = fma(_2198, _2198, _2204);
    float _2212 = 1.0 / _2206;
    float _2214 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2208);
    float _2216 = fma(_2202, _2202, _2210);
    float _2218 = fma(_1698, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2214);
    float _2220 = sqrt(_2216);
    float _2222 = _2218 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2224 = _2222 + _2206;
    float _2226 = _2224 * _2212;
    float _2228 = _2226 * 0.5;
    bool _2230 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2232 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2234 = _2230 || _2232;
    bool _2236 = isnan(0.5);
    bool _2238 = _2234 || _2236;
    float _2240 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2242 = fma(_2228, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2240);
    bool _2244 = _2220 > 0.0;
    float _2246 = 1.0 / _2242;
    bool _2248 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2250 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2252 = _2248 || _2250;
    bool _2254 = isnan(0.5);
    bool _2256 = _2252 || _2254;
    float _2258 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _2260 = _2188;
    float _2262 = _2182;
    float _2264 = _2212;
    if (!_2244)
    {
        _2258 = _2186;
    }
    float _2266 = _2258;
    bool _2268 = !_2244;
    float _2270 = _2266;
    if (!_2268)
    {
        float _2272 = _205 * _205;
        float _2274 = fma(_203, _203, _2272);
        float _2276 = rsqrt(_2216);
        float _2278 = fma(_207, _207, _2274);
        float _2280 = sqrt(_2278);
        float _2282 = _2198 * _2276;
        float _2284 = _2192 * _2276;
        float _2286 = _2202 * _2276;
        bool _2288 = _2280 > 0.0;
        float _2290 = _2280;
        if (!_2288)
        {
            _2290 = _2186;
        }
        float _2292 = _2290;
        bool _2294 = !_2288;
        _2270 = _2292;
        if (!_2294)
        {
            float _2296 = rsqrt(_2278);
            float _2298 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2300 = _205 * _2296;
            float _2302 = _203 * _2296;
            float _2304 = _2284 * _2300;
            float _2306 = _207 * _2296;
            float _2308 = fma(_2282, _2302, _2304);
            float _2310 = _2298 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2312 = fma(_2286, _2306, _2308);
            float _2314 = _2312 * _2310;
            float _2316 = fma(_203, _2314, _2186);
            float _2318 = fma(_205, _2314, _2182);
            float _2320 = fma(_207, _2314, _2188);
            _2270 = _2316;
            _2260 = _2320;
            _2262 = _2318;
            _2264 = _2298;
        }
    }
    float _2322 = _2270;
    float _2324 = _2260;
    float _2326 = _2262;
    float _2328 = _2264;
    float _2330 = -_1676;
    float _2332 = _2330 + _2322;
    float _2334 = -_1684;
    float _2336 = _2334 + _2324;
    float _2338 = -_1678;
    float _2340 = _2338 + _2326;
    float _2342 = _2340;
    float _2344 = _2336;
    float _2346 = _2324;
    if (_2238)
    {
        _211 = 1.0;
    }
    float _2348 = _211;
    float _2350 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2352 = _2246 * _2350;
    float _2354 = _2348;
    if (_2256)
    {
        _1768 = _2332;
    }
    float _2356 = _1768;
    float _2358 = _2356;
    if (!_2256)
    {
        float _2360 = _1694 * _1694;
        float _2362 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2364 = -_1430;
        float _2366 = _2364 + _2324;
        float _2368 = -_1460;
        float _2370 = _2368 + _2326;
        float _2372 = fma(_1702, _1702, _2360);
        float _2374 = -_1364;
        float _2376 = _2374 + _2322;
        float _2378 = fma(_1712, _1712, _2372);
        float _2380 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2382 = sqrt(_2378);
        float _2384 = _2362 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2386 = 1.0 / _1802;
        float _2388 = precise::min(_2382, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2390 = _2388 * _2380;
        float _2392 = _2390 * _2386;
        float _2394 = _2384 * _2392;
        float _2396 = _2366 * _2392;
        float _2398 = fma(_2370, _2394, _1682);
        float _2400 = fma(_2376, _2394, _1688);
        float _2402 = fma(_2384, _2396, _1698);
        _2342 = _2398;
        _2358 = _2400;
        _2344 = _2402;
        _2346 = _2396;
        _1980 = _2386;
    }
    float _2404 = _2342;
    float _2406 = _2358;
    float _2408 = _2344;
    float _2410 = _2346;
    float _2412 = _1980;
    float _2414 = _2412;
    float _2416 = _2410;
    if (!_2238)
    {
        float _2418 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2420 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2422 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2420;
        float _2424 = _2418 * 0.15915493667125701904296875;
        float _2426 = _2424 * 6.283185482025146484375;
        float _2428 = cos(_2426);
        float _2430 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2432 = _2430 * 0.15915493667125701904296875;
        float _2434 = _2424 * 6.283185482025146484375;
        float _2436 = sin(_2434);
        float _2438 = 1.0 / _2428;
        float _2440 = _2432 * 6.283185482025146484375;
        float _2442 = cos(_2440);
        float _2444 = _2436 * _2438;
        float _2446 = _2432 * 6.283185482025146484375;
        float _2448 = sin(_2446);
        float _2450 = _2442 * _2444;
        float _2452 = 1.0 / _2422;
        float _2454 = 1.0 / _2450;
        float _2456 = _2448 * _2454;
        float _2458 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2460 = fma(_2352, _2456, _2458);
        float _2462 = _2460 * _2452;
        float _2464 = precise::clamp(_2462, 0.0, 1.0);
        _2414 = _2460;
        _2354 = _2464;
    }
    float _2466 = _2414;
    float _2468 = _2354;
    float _2470 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2472 = _2404 + _2470;
    float _2474 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2476 = _2406 + _2474;
    float _2478 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2480 = _2408 + _2478;
    float _2482 = _2472 * _2472;
    float _2484 = fma(_2476, _2476, _2482);
    float _2486 = fma(_2480, _2480, _2484);
    float _2488 = rsqrt(_2486);
    float _2490 = sqrt(_2486);
    float _2492 = _2476 * _2488;
    float _2494 = _2480 * _2488;
    float _2496 = _2472 * _2488;
    float _2498 = _2492 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2500 = _2494 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2502 = _2498 * _2498;
    float _2504 = _2500 * _2500;
    float _2506 = _2502 + _2504;
    float _2508 = sqrt(_2506);
    bool _2510 = _2508 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2512 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2514 = _2508 + _2512;
    float _2516 = _2328;
    float _2518 = _2514;
    float _2520 = _2506;
    if (_2510)
    {
        float _2522 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2516 = _2522;
    }
    float _2524 = _2516;
    float _2526 = _2524;
    if (_2510)
    {
        float _2528 = _2514 * _2524;
        _2518 = _2528;
    }
    float _2530 = _2518;
    if (_2510)
    {
        float _2532 = rsqrt(_2506);
        _2526 = _2532;
    }
    float _2534 = _2526;
    float _2536 = _2534;
    if (_2510)
    {
        float _2538 = _2530 * 0.15915493667125701904296875;
        _2416 = _2538;
    }
    float _2540 = _2416;
    float _2542 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2544 = _2326;
    float _2546 = _2540;
    if (_2510)
    {
        float _2548 = _2540 * 6.283185482025146484375;
        float _2550 = sin(_2548);
        _2544 = _2550;
    }
    float _2552 = _2544;
    float _2554 = precise::max(0.0, _2542);
    float _2556 = _2466;
    float _2558 = _2554;
    float _2560 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_2510)
    {
        float _2562 = _2540 * 6.283185482025146484375;
        float _2564 = cos(_2562);
        _2556 = _2564;
    }
    float _2566 = _2556;
    float _2568 = -_2496;
    float _2570 = -_2554;
    float _2572 = fma(_2568, (*spvDescriptorSet0.vp_c15)._m0[24].y, _2570);
    float _2574 = fma(_1688, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    if (_2510)
    {
        float _2576 = _2572 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2558 = _2576;
    }
    float _2578 = _2558;
    float _2580 = _2552;
    float _2582 = _2578;
    if (_2510)
    {
        float _2584 = fma(_2552, _2578, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2580 = _2584;
    }
    float _2586 = _2580;
    float _2588 = _2586;
    if (!_2510)
    {
        _2546 = _2498;
    }
    float _2590 = _2546;
    float _2592 = _2590;
    if (!_2510)
    {
        _2582 = _2500;
    }
    float _2594 = _2582;
    float _2596 = _2594;
    if (_2510)
    {
        float _2598 = _2534 * _2586;
        _2588 = _2598;
    }
    float _2600 = _2588;
    if (!_2510)
    {
        _2536 = _2572;
    }
    float _2602 = _2536;
    float _2604 = _2602;
    float _2606 = _2566;
    if (_2510)
    {
        float _2608 = _2566 + (-1.0);
        _2560 = _2608;
    }
    float _2610 = _2560;
    float _2612 = _2610;
    if (_2510)
    {
        float _2614 = _2498 * _2600;
        _2592 = _2614;
    }
    float _2616 = _2592;
    if (_2510)
    {
        float _2618 = _2500 * _2600;
        _2596 = _2618;
    }
    float _2620 = _2596;
    if (_2510)
    {
        float _2622 = _2610 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2520 = _2622;
    }
    float _2624 = _2520;
    if (!_2510)
    {
        _2612 = _2502;
    }
    float _2626 = _2612;
    float _2628 = _2626;
    if (_2510)
    {
        float _2630 = _2616 * _2616;
        _2628 = _2630;
    }
    float _2632 = _2628;
    float _2634 = floor(_2574);
    if (_2510)
    {
        float _2636 = fma(_2572, _2566, _2624);
        _2604 = _2636;
    }
    float _2638 = _2604;
    float _2640 = _2404 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (!_2510)
    {
        _2606 = _2504;
    }
    float _2642 = _2606;
    float _2644 = _2642;
    if (_2510)
    {
        float _2646 = _2620 * _2620;
        _2644 = _2646;
    }
    float _2648 = _2644;
    float _2650 = fma(_2638, _2638, _2632);
    float _2652 = fma(_2406, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2640);
    float _2654 = fma(_1698, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2656 = _2650 + _2648;
    float _2658 = fma(_2408, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2652);
    float _2660 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2662 = rsqrt(_2656);
    float _2664 = _2658 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2666 = _2404 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2668 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2670 = fma(_2490, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2668);
    float _2672 = precise::clamp(_2670, 0.0, 1.0);
    float _2674 = -_2634;
    float _2676 = _2574 + _2674;
    float _2678 = _2664 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2680 = fma(_2406, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2666);
    float _2682 = -_2672;
    float _2684 = _2682 + 1.0;
    float _2686 = floor(_2654);
    float _2688 = -_2678;
    float _2690 = fma(_2688, _2660, 1.0);
    float _2692 = _2404 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2694 = _2404 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2696 = fma(_2408, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2680);
    float _2698 = fma(_2406, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2692);
    float _2700 = fma(_2406, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2694);
    float _2702 = _2662 * _2616;
    float _2704 = _2662 * _2638;
    float _2706 = fma(_2408, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2698);
    float _2708 = abs(_2684);
    float _2710 = log2(_2708);
    float _2712 = _2702 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2714 = _2662 * _2620;
    float _2716 = _2706 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2718 = _2696 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2720 = -_2712;
    float _2722 = fma(_2704, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2720);
    float _2724 = fma(_2408, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2700);
    float _2726 = _2716 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2728 = log2(_2690);
    float _2730 = -_2714;
    float _2732 = fma(_2730, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2722);
    float _2734 = _2716 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2736 = fma(_2718, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2726);
    float _2738 = -_2686;
    float _2740 = _2654 + _2738;
    float _2742 = fma(_2732, -0.5, 0.5);
    float _2744 = fma(_2718, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2734);
    float _2746 = fma(_2664, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2736);
    float _2748 = _2710 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2750 = _2724 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2752 = sqrt(_2742);
    float _2754 = fma(_2750, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2746);
    float _2756 = _2716 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2758 = _2728 * 0.693147182464599609375;
    float _2760 = 1.0 / _2754;
    float _2762 = fma(_2664, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2744);
    float _2764 = fma(_2750, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2762);
    float _2766 = exp2(_2748);
    float _2768 = _2752 * 0.636619746685028076171875;
    float _2770 = fma(_2732, 0.5, 0.5);
    float _2772 = fma(_2718, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2756);
    float _2774 = _2704 + 1.0;
    float _2776 = fma(_2770, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2778 = fma(_2664, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2772);
    float _2780 = _2764 * _2760;
    float _2782 = -_2704;
    float _2784 = fma(_2766, _2774, _2782);
    float _2786 = fma(_2770, _2776, -0.212114393711090087890625);
    float _2788 = fma(_2750, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2778);
    float _2790 = _2758 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2792 = fma(_2780, 0.5, 0.5);
    float _2794 = fma(_2770, _2786, 1.570728778839111328125);
    float _2796 = _2788 * _2760;
    float2 _7573 = float2(_2676, _2740);
    float _2798 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7573, float2(0.0), isnan(_7573)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7573, float2(0.0), isnan(_7573)), level(0.0)).x;
    float _2800 = -_2794;
    float _2802 = fma(_2768, _2800, 1.0);
    float _2804 = fma(_2796, -0.5, 0.5);
    float _2806 = fma(_2784, 0.5, 0.5);
    float3 _7593 = float3(_2792, _2804, _2790);
    float _2808 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7593, float3(0.0), isnan(_7593)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7593, float3(0.0), isnan(_7593)), level(0.0)).x;
    float3 _7604 = float3(_2792, _2804, _2790);
    float4 _2811 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7604, float3(0.0), isnan(_7604)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7604, float3(0.0), isnan(_7604)), level(0.0)).xyzw;
    float _2813 = _2811.x;
    float _2815 = _2811.y;
    float _2817 = _2811.z;
    float _2819 = _2811.w;
    float2 _7620 = float2(_2802, _2806);
    float3 _2823 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7620, float2(0.0), isnan(_7620)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7620, float2(0.0), isnan(_7620)), level(0.0)).xyz;
    float _2825 = _2823.x;
    float _2827 = _2823.y;
    float _2829 = _2823.z;
    float _2831 = abs(_2352);
    float _2833 = log2(_2831);
    float _2835 = _2716 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_76.x = _2406;
    out.m_76.y = _2404;
    out.m_76.z = _2408;
    bool _2837 = _2490 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2839 = isnan(_2490);
    bool _2841 = _2837 || _2839;
    bool _2843 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2845 = _2841 || _2843;
    float _2847 = fma(_2718, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2835);
    bool _2849 = _2352 <= 8000.0;
    bool _2851 = isnan(_2352);
    bool _2853 = _2849 || _2851;
    bool _2855 = isnan(8000.0);
    bool _2857 = _2853 || _2855;
    float _2859 = float(_2857);
    float _2861 = fma(_2664, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2847);
    float _2863 = fma(_2750, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2861);
    float _2865 = _2833 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2867 = _2863 + _2754;
    float _2869 = exp2(_2865);
    float _2871 = _2867 * 0.5;
    out.m_78.z = _2871;
    out.m_78.w = _2754;
    float _2873 = fma(_2869, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2875 = precise::clamp(_2873, 0.0, 1.0);
    float _2877 = fma(_2875, -2.0, 3.0);
    float _2879 = _2875 * _2875;
    float _2881 = _2879 * _2877;
    float _2883 = _2710 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2885 = -_2881;
    float _2887 = _2885 + 1.0;
    float _2889 = exp2(_2883);
    float _2891 = fma(_2887, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2881);
    float _2893 = in.m_80.x;
    float _2895 = _2859 * _2891;
    out.gl_Position.x = _2764;
    out.gl_Position.y = _2788;
    out.gl_Position.z = _2863;
    out.gl_Position.w = _2754;
    float _2897 = _2895 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2899 = _2468 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2901 = -_2889;
    float _2903 = _2901 + 1.0;
    float _2905 = _2903 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2907 = _2754;
    float _2909 = _2863;
    float _2911 = _2788;
    float _2913 = _2764;
    float _2915 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    if (!_2845)
    {
        _2907 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2917 = _2907;
    float _2919 = _2917;
    float _2921 = _2917;
    if (!_2845)
    {
        _2909 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2923 = _2909;
    float _2925 = _2923;
    float _2927 = _2923;
    if (!_2845)
    {
        _2911 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2929 = _2911;
    float _2931 = _2929;
    float _2933 = _2929;
    if (!_2845)
    {
        _2913 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2935 = _2913;
    float _2937 = -_2798;
    float _2939 = _2937 + 1.0;
    float _2941 = _2939 * _2897;
    float _2943 = precise::clamp(_2941, 0.0, 1.0);
    float _2945 = _2905 * _2808;
    float _2947 = -_2905;
    float _2949 = _2947 + 1.0;
    float _2951 = -_2943;
    float _2953 = fma(_2951, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2955 = _2813;
    float _2957 = _2935;
    float _2959 = _2935;
    if (!_2845)
    {
        _2915 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2961 = _2915;
    float _2963 = _2819 * _2945;
    float _2965 = _2829 * _2945;
    float _2967 = _2953 * _2893;
    float _2969 = _2819 * _2949;
    float _2971 = fma(_2825, _2963, _2813);
    float _2973 = fma(_2827, _2963, _2815);
    float _2975 = _2967 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2977 = fma(_2819, _2965, _2817);
    float _2979 = _2961;
    float _2981 = _2961;
    if (!_2845)
    {
        _2955 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2983 = _2955;
    out.m_82.x = _2975;
    out.m_84.x = _2971;
    out.m_84.y = _2973;
    out.m_84.z = _2977;
    out.m_84.w = _2969;
    bool _2985 = !_2845;
    float _2987 = _2983;
    float _2989 = _2983;
    if (!_2985)
    {
        bool _2991 = _2490 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2993 = isnan(_2490);
        bool _2995 = _2991 || _2993;
        bool _2997 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2999 = _2995 || _2997;
        if (!_2999)
        {
            float _3001 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3003 = _2490 + _3001;
            float _3005 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3007 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3005;
            float _3009 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3011 = _3009 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3013 = 1.0 / _3007;
            float _3015 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3017 = _3015 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3019 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3021 = _3019 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3023 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3025 = _3023 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3027 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3029 = _3027 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3031 = _3003 * _3013;
            float _3033 = precise::clamp(_3031, 0.0, 1.0);
            float _3035 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3037 = _3035 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3039 = fma(_3033, _3011, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3041 = fma(_3033, _3037, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3043 = fma(_3033, _3017, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3045 = fma(_3033, _3021, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3047 = fma(_3033, _3025, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3049 = fma(_3033, _3029, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2989 = _3043;
            _2933 = _3047;
            _2981 = _3039;
            _2927 = _3045;
            _2921 = _3041;
            _2959 = _3049;
            _3051 = true;
        }
        else
        {
            bool _3053 = _2490 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3055 = isnan(_2490);
            bool _3057 = _3053 || _3055;
            bool _3059 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3061 = _3057 || _3059;
            if (!_3061)
            {
                _2979 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3063 = _2979;
            _2981 = _3063;
            if (!_3061)
            {
                _2987 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3065 = _2987;
            _2989 = _3065;
            if (!_3061)
            {
                _2919 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3067 = _2919;
            _2921 = _3067;
            if (!_3061)
            {
                _2925 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3069 = _2925;
            _2927 = _3069;
            if (!_3061)
            {
                _2931 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3071 = _2931;
            _2933 = _3071;
            if (!_3061)
            {
                _2957 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3073 = _2957;
            bool _3075 = !_3061;
            _2959 = _3073;
            if (!_3075)
            {
                bool _3077 = _2490 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3079 = isnan(_2490);
                bool _3081 = _3077 || _3079;
                bool _3083 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3085 = _3081 || _3083;
                if (!_3085)
                {
                    float _3087 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3089 = _2490 + _3087;
                    float _3091 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3093 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3091;
                    float _3095 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3097 = _3095 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3099 = 1.0 / _3093;
                    float _3101 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3103 = _3101 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3105 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3107 = _3105 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3109 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3111 = _3109 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3113 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3115 = _3113 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3117 = _3089 * _3099;
                    float _3119 = precise::clamp(_3117, 0.0, 1.0);
                    float _3121 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3123 = _3121 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3125 = fma(_3119, _3097, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3127 = fma(_3119, _3123, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3129 = fma(_3119, _3103, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3131 = fma(_3119, _3107, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3133 = fma(_3119, _3111, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3135 = fma(_3119, _3115, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2989 = _3129;
                    _2933 = _3133;
                    _2981 = _3125;
                    _2927 = _3131;
                    _2921 = _3127;
                    _2959 = _3135;
                    _3051 = true;
                }
                else
                {
                    _2989 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2933 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2981 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2927 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2921 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2959 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3051 = false;
    float _3137 = _2989;
    float _3139 = _2933;
    float _3141 = _2981;
    float _3143 = _2927;
    float _3145 = _2921;
    float _3147 = _2959;
    float _3149 = fma(_2086, -0.5, 0.5);
    float _3151 = precise::clamp(_3149, 0.0, 1.0);
    float _3153 = -_3137;
    float _3155 = _3153 + _3139;
    float _3157 = _2899 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3159 = -_3141;
    float _3161 = _3159 + _3143;
    float _3163 = fma(_3151, _3155, _3137);
    out.m_86.x = 0.0;
    float _3165 = -_3145;
    float _3167 = _3165 + _3147;
    float _3169 = fma(_3151, _3161, _3141);
    float _3171 = _3163 * 0.586610972881317138671875;
    out.m_51.x = _3157;
    bool _3173 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3175 = fma(_3151, _3167, _3145);
    float _3177 = fma(_3169, 0.298911988735198974609375, _3171);
    bool _3179 = _2468 > 0.0;
    bool _3181 = isnan(_2468);
    bool _3183 = _3179 || _3181;
    bool _3185 = isnan(0.0);
    bool _3187 = _3183 || _3185;
    float _3189 = fma(_3175, 0.114477999508380889892578125, _3177);
    out.m_88.x = 0.0;
    float _3191 = -_3189;
    float _3193 = _3169 + _3191;
    float _3195 = -_3189;
    float _3197 = _3163 + _3195;
    float _3199 = -_3189;
    float _3201 = _3175 + _3199;
    float _3203 = fma(_3193, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3189);
    float _3205 = fma(_3197, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3189);
    float _3207 = fma(_3201, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3189);
    bool _3209 = !_3173;
    if (!_3209)
    {
        float _3211 = -_2404;
        float _3213 = _3211 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3215 = -_2406;
        float _3217 = _3215 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3219 = -_2408;
        float _3221 = _3219 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3223 = _3213 * _3213;
        float _3225 = fma(_3217, _3217, _3223);
        float _3227 = fma(_3221, _3221, _3225);
        float _3229 = rsqrt(_3227);
        float _3231 = _3213 * _3229;
        float _3233 = _3217 * _3229;
        float _3235 = _3221 * _3229;
        float _3237 = -_2496;
        float _3239 = _3237 + _3231;
        float _3241 = -_2492;
        float _3243 = _3241 + _3233;
        float _3245 = -_2494;
        float _3247 = _3245 + _3235;
        float _3249 = sqrt(_3227);
        float _3251 = _3239 * _3239;
        float _3253 = fma(_3243, _3243, _3251);
        float _3255 = fma(_3247, _3247, _3253);
        float _3257 = rsqrt(_3255);
        float _3259 = -_3249;
        float _3261 = _3259 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3263 = _3261 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3265 = precise::clamp(_3263, 0.0, 1.0);
        float _3267 = abs(_3265);
        float _3269 = log2(_3267);
        float _3271 = _3239 * _3257;
        float _3273 = _3243 * _3257;
        float _3275 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
        float _3277 = precise::clamp(_3275, 0.0, 1.0);
        float _3279 = _3247 * _3257;
        float _3281 = _2086 * _3271;
        float _3283 = _2086 * _3231;
        float _3285 = fma(_2084, _3273, _3281);
        float _3287 = _3277 * _3277;
        float _3289 = _3233 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3291 = fma(_2084, _3233, _3283);
        float _3293 = fma(_2088, _3279, _3285);
        float _3295 = precise::clamp(_3293, 0.0, 1.0);
        float _3297 = _3287 + (-1.0);
        float _3299 = _3269 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3301 = fma(_2088, _3235, _3291);
        float _3303 = precise::clamp(_3301, 0.0, 1.0);
        float _3305 = _3295 * _3295;
        float _3307 = fma(_3305, _3297, 1.0);
        float _3309 = exp2(_3299);
        float _3311 = -_3231;
        float _3313 = -_3289;
        float _3315 = fma(_3311, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3313);
        float _3317 = _3307 * _3307;
        float _3319 = -_3235;
        float _3321 = fma(_3319, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3315);
        float _3323 = 1.0 / _3317;
        float _3325 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3327 = _3321 + _3325;
        float _3329 = _3327 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3331 = precise::clamp(_3329, 0.0, 1.0);
        float _3333 = _3309 * _3331;
        float _3335 = _3303 * _3333;
        float _3337 = _3287 * _3323;
        float _3339 = _3335 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3341 = _3335 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3343 = _3335 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        float _3345 = _3335 * _3337;
        float _3347 = _3345 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3349 = _3345 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3351 = _3345 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_86.x = _3339;
        out.m_86.y = _3341;
        out.m_86.z = _3343;
        out.m_88.x = _3347;
        out.m_88.y = _3349;
        out.m_88.z = _3351;
    }
    out.m_90.x = _3203;
    out.m_90.y = _3205;
    out.m_90.z = _3207;
    if (_3187)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_51.x = 0.0;
    float _3353 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3353;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

