#pragma clang diagnostic ignored "-Wmissing-prototypes"

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

template <typename T>
static inline depth2d<T> spvDepthCast(texture2d<T> t)
{
    return reinterpret_cast<thread const depth2d<T> &>(t);
}

template <typename T>
static inline depth2d_array<T> spvDepthCast(texture2d_array<T> t)
{
    return reinterpret_cast<thread const depth2d_array<T> &>(t);
}

template <typename T>
static inline depthcube<T> spvDepthCast(texturecube<T> t)
{
    return reinterpret_cast<thread const depthcube<T> &>(t);
}

template <typename T>
static inline depthcube_array<T> spvDepthCast(texturecube_array<T> t)
{
    return reinterpret_cast<thread const depthcube_array<T> &>(t);
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
    constant _16* vp_c15 [[id(1)]];
    constant _16* vp_c8 [[id(2)]];
    constant _16* vp_c10 [[id(3)]];
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c13 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    texture2d<float> vp_t_tcb_24 [[id(7)]];
    sampler vp_t_tcb_24Smplr [[id(8)]];
    texture2d_array<float> vp_t_tcb_16 [[id(9)]];
    sampler vp_t_tcb_16Smplr [[id(10)]];
    texture3d<float> vp_t_tcb_32 [[id(11)]];
    sampler vp_t_tcb_32Smplr [[id(12)]];
    texture3d<float> vp_t_tcb_30 [[id(13)]];
    sampler vp_t_tcb_30Smplr [[id(14)]];
    texture2d<float> vp_t_tcb_1C [[id(15)]];
    sampler vp_t_tcb_1CSmplr [[id(16)]];
    texture2d_array<float> vp_t_tcb_14 [[id(17)]];
    sampler vp_t_tcb_14Smplr [[id(18)]];
    sampler vp_t_tcb_24Smplr_w [[id(19)]];
    sampler vp_t_tcb_32Smplr_w [[id(20)]];
    sampler vp_t_tcb_30Smplr_w [[id(21)]];
    sampler vp_t_tcb_1CSmplr_w [[id(22)]];
    sampler vp_t_tcb_14Smplr_w [[id(23)]];
    constant dm_border_t* dm_border [[id(24)]];
};

struct main0_out
{
    float4 m_80 [[user(locn0)]];
    float4 m_82 [[user(locn1)]];
    float4 m_86 [[user(locn2)]];
    float4 m_90 [[user(locn3)]];
    float4 m_100 [[user(locn4)]];
    float4 m_61 [[user(locn5)]];
    float4 m_84 [[user(locn6)]];
    float4 m_88 [[user(locn7)]];
    float4 m_92 [[user(locn8)]];
    float4 m_72 [[user(locn9)]];
    float4 m_98 [[user(locn10)]];
    float4 m_94 [[user(locn11)]];
    float4 m_96 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_74 [[attribute(1)]];
    float4 m_78 [[attribute(2)]];
    float4 m_76 [[attribute(3)]];
    float4 m_58 [[attribute(5)]];
    float4 m_63 [[attribute(6)]];
    float4 m_70 [[attribute(7)]];
    float4 m_68 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2783 = false;
    bool _1658 = false;
    bool _337 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _114 = in.m_58.w;
    float _116 = trunc(_114);
    int _119 = int(_116);
    bool _123 = _119 >= 1;
    float _125 = 0.0;
    if (!_123)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _127 = _125;
    float _129 = _127;
    if (!_123)
    {
        out.m_61.x = 0.0;
    }
    int _131 = 0;
    if (!_123)
    {
        float _133 = _127 * 5.0;
        _131 = as_type<int>(_133);
    }
    int _135 = _131;
    int _137 = _135;
    if (!_123)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3068 = as_type<float>(_135);
        out.gl_Position.z = _3068;
    }
    if (!_123)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _139 = in.m_63.w;
    bool _141 = _139 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _143 = isnan(_139);
    bool _145 = _141 || _143;
    bool _147 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _149 = _145 || _147;
    float _151 = -_139;
    float _153 = _151 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_149)
    {
        float _155 = float(_119);
        _129 = _155;
    }
    float _157 = _129;
    bool _159 = _153 >= _157;
    bool _161 = !_149;
    bool _163 = _159 || _161;
    float _165 = _157;
    if (_163)
    {
        _165 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _167 = _165;
    if (_163)
    {
        out.m_61.x = 0.0;
    }
    if (_163)
    {
        float _169 = _167 * 5.0;
        _137 = as_type<int>(_169);
    }
    int _171 = _137;
    if (_163)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3137 = as_type<float>(_171);
        out.gl_Position.z = _3137;
    }
    if (_163)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _173 = as_type<float>(int(gl_VertexIndex));
    float _175 = in.m_68.w;
    bool _177 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _179 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _181 = _177 || _179;
    bool _183 = isnan(1.0);
    bool _185 = _181 || _183;
    float _187 = in.m_63.x;
    float _189 = in.m_63.y;
    float _191 = in.m_63.z;
    float _193 = in.m_58.x;
    float _195 = in.m_58.y;
    float _197 = in.m_58.z;
    int _199 = as_type<int>(_173) & 1;
    bool _201 = _199 != 0;
    int _203 = as_type<int>(_173) & 2;
    bool _205 = _203 != 0;
    float _207 = _153 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _209 = 0.0;
    float _211 = _207;
    if (!_185)
    {
        float _213 = _207 * _207;
        float _215 = _213 * 0.5;
        _209 = _215;
    }
    float _217 = _209;
    bool _219 = !_201;
    float _221 = _219 ? (-0.5) : 0.5;
    bool _223 = !_205;
    float _225 = _223 ? (-0.5) : 0.5;
    float _227 = _217;
    if (!_185)
    {
        float _229 = _217 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _227 = _229;
    }
    float _231 = _227;
    bool _233 = !_185;
    float _235 = _231;
    if (!_233)
    {
        float _237 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _239 = log2(_237);
        float _241 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _243 = _241 + 1.0;
        float _245 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _247 = _207 * _239;
        float _249 = exp2(_247);
        float _251 = _245 * 0.693147182464599609375;
        float _253 = 1.0 / _251;
        float _255 = 1.0 / _243;
        float _257 = _249 + (-1.0);
        float _259 = -_257;
        float _261 = fma(_259, _253, _207);
        float _263 = _261 * _255;
        float _265 = _263 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _235 = _265;
    }
    float _267 = _235;
    bool _269 = !_185;
    if (!_269)
    {
        float _271 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _273 = log2(_271);
        float _275 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _277 = _275 + 1.0;
        float _279 = 1.0 / _277;
        float _281 = _207 * _273;
        float _283 = exp2(_281);
        float _285 = -_283;
        float _287 = _285 + 1.0;
        float _289 = _287 * _279;
        _211 = _289;
    }
    float _291 = _211;
    bool _293 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _295 = _267 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _297 = _267 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _299 = _267 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _301 = fma(_291, _187, _295);
    float _303 = fma(_291, _189, _297);
    float _305 = fma(_291, _191, _299);
    float _307 = fma(_301, _175, _193);
    float _309 = fma(_303, _175, _195);
    float _311 = fma(_305, _175, _197);
    bool _313 = !_293;
    float _333;
    float _335;
    if (!_313)
    {
        float _315 = in.m_70.x;
        float _317 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _319 = _315 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _321 = fma(_319, (*spvDescriptorSet0.vp_c9)._m0[12].x, _153);
        float _323 = _321 * _317;
        float _325 = float(_119);
        float _327 = floor(_323);
        float _329 = -_327;
        float _331 = _323 + _329;
        _333 = _325;
        _335 = _331;
        _337 = true;
    }
    else
    {
        float _339 = float(_119);
        float _341 = 1.0 / _339;
        float _343 = _153 * _341;
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
    out.m_72.x = (*spvDescriptorSet0.vp_c8)._m0[24].x;
    out.m_72.y = (*spvDescriptorSet0.vp_c8)._m0[25].x;
    out.m_72.z = (*spvDescriptorSet0.vp_c8)._m0[26].x;
    float _357 = float(_351);
    float _359 = 1.0 / _357;
    float _361 = float(uint(_355));
    int _363 = ~_355;
    int _365 = _363 + 1;
    int _367 = ~_355;
    int _369 = _367 + 1;
    float _371 = 1.0 / _361;
    float _373 = _153 * _359;
    float _375 = trunc(_373);
    int _377 = int(_375);
    int _379 = as_type<int>(_371) + (-2);
    float _381 = float(uint(_377));
    float _383 = as_type<float>(_379) * _381;
    float _385 = in.m_70.x;
    float _387 = in.m_70.y;
    float _389 = in.m_70.z;
    float _391 = in.m_70.w;
    float _393 = trunc(_383);
    float _395 = precise::max(_393, 0.0);
    uint _398 = uint(_395);
    float _400 = float(_355);
    int _402 = _365 * int(_398);
    int _404 = _402 + _377;
    float _406 = float(_377);
    float _408 = float(uint(_404));
    bool _410 = _406 >= _400;
    bool _412 = isnan(_406);
    bool _414 = _410 || _412;
    bool _416 = isnan(_400);
    bool _418 = _414 || _416;
    float _420 = float(_418);
    float _422 = as_type<float>(_379) * _408;
    int _424 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _426 = _424 != 0;
    float _428 = trunc(_422);
    float _430 = precise::max(_428, 0.0);
    uint _432 = uint(_430);
    bool _434 = !_426;
    float _436 = _434 ? 7.345489978790283203125 : 1.0;
    float _438 = _436 * _385;
    float _440 = trunc(_420);
    int _442 = int(_440);
    int _444 = int(_398) + int(_432);
    float _446 = floor(_438);
    int _448 = _369 * _444;
    int _450 = _448 + _377;
    bool _452 = uint(_450) >= uint(_355);
    float _454 = 1.0 / _345;
    bool _456 = !_452;
    int _458 = _456 ? 0 : (-1);
    float _460 = -_446;
    float _462 = _438 + _460;
    bool _464 = _355 == 0;
    int _466 = ~_444;
    int _468 = _466 + _458;
    int _470 = _468 + 1;
    float _472 = _462 * _400;
    float _474 = _153 * _400;
    int _476 = ~_442;
    int _478 = _476 + 1;
    int _480 = _478 + 1;
    int _482 = _355 * _470;
    int _484 = _482 + _377;
    int _486 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _488 = _486 != 0;
    int _490 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _492 = _490 != 0;
    int _494 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _496 = _494 != 0;
    float _498 = trunc(_472);
    int _500 = int(_498);
    int _502 = _355 + (-1);
    bool _504 = !_464;
    int _506 = _504 ? _484 : (-1);
    float _508 = _474 * _454;
    int _510 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _512 = _510 != 0;
    int _514 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _516 = _514 != 0;
    int _518 = _506 * _480;
    bool _520 = !_492;
    int _522 = _520 ? 0 : 1;
    float _524 = trunc(_508);
    int _526 = int(_524);
    bool _528 = !_512;
    int _530 = _528 ? 0 : 1;
    int _532 = _442 * _502;
    int _534 = _532 + _518;
    bool _536 = !_488;
    int _538 = _536 ? 0 : 1;
    int _540 = abs(_522);
    int _542 = abs(_530);
    bool _544 = !_496;
    int _546 = _544 ? 0 : 1;
    int _548 = abs(_538);
    int _550 = _500 * _542;
    int _552 = _550 + _377;
    bool _554 = !_516;
    int _556 = _554 ? 0 : 1;
    int _558 = abs(_546);
    int _560 = _534 * _540;
    int _562 = abs(_556);
    int _564 = _526 * _548;
    int _566 = _564 + _560;
    float _568 = float(uint(_552));
    int _570 = _552 * _558;
    int _572 = _570 + _566;
    int _574 = ~_355;
    int _576 = _574 + 1;
    int _578 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _580 = _578 != 0;
    int _582 = _500 * _562;
    int _584 = _582 + _572;
    float _586 = as_type<float>(_379) * _568;
    float _588 = float(uint(_584));
    float _590 = trunc(_586);
    float _592 = precise::max(_590, 0.0);
    uint _594 = uint(_592);
    float _596 = as_type<float>(_379) * _588;
    float _598 = trunc(_596);
    float _600 = precise::max(_598, 0.0);
    uint _602 = uint(_600);
    int _604 = ~_355;
    int _606 = _604 + 1;
    int _608 = _606 * int(_594);
    int _610 = _608 + _552;
    int _612 = _576 * int(_602);
    int _614 = _612 + _584;
    float _616 = float(uint(_610));
    float _618 = float(uint(_614));
    int _620 = ~_355;
    int _622 = _620 + 1;
    float _624 = as_type<float>(_379) * _618;
    float _626 = as_type<float>(_379) * _616;
    float _628 = in.m_74.x;
    float _630 = in.m_74.y;
    float _632 = in.m_74.z;
    float _634 = trunc(_624);
    float _636 = precise::max(_634, 0.0);
    uint _638 = uint(_636);
    int _640 = int(_602) + int(_638);
    float _642 = trunc(_626);
    float _644 = precise::max(_642, 0.0);
    uint _646 = uint(_644);
    int _648 = _622 * _640;
    int _650 = _648 + _584;
    bool _652 = uint(_650) >= uint(_355);
    bool _654 = !_652;
    int _656 = _654 ? 0 : (-1);
    int _658 = ~_640;
    int _660 = _658 + _656;
    int _662 = _660 + 1;
    int _664 = int(_594) + int(_646);
    float _666 = in.m_76.x;
    float _668 = in.m_76.y;
    float _670 = in.m_76.z;
    int _672 = _355 * _662;
    int _674 = _672 + _584;
    float _676 = in.m_78.x;
    float _678 = in.m_78.y;
    float _680 = in.m_78.z;
    bool _682 = !_464;
    int _684 = _682 ? _674 : (-1);
    int _686 = ~_355;
    int _688 = _686 + 1;
    int _690 = _684 & 3;
    bool _692 = _690 != 0;
    int _694 = _684 & 3;
    bool _696 = _694 != 0;
    bool _698 = uint(_690) > 1u;
    bool _700 = _690 != 3;
    int _702 = _696 ? 0 : 1;
    int _704 = _688 * _664;
    int _706 = _704 + _552;
    bool _708 = uint(_690) >= 2u;
    bool _710 = _389 > 0.5;
    int _712 = ~_702;
    int _714 = _712 + 1;
    int _716 = _714 + 1;
    int _718 = _708 ? 0 : 1;
    float _720 = _309 * _678;
    int _722 = _716;
    if (!_698)
    {
        int _724 = ~_702;
        int _726 = _724 + 1;
        _722 = _726;
    }
    int _728 = _722;
    bool _730 = uint(_706) >= uint(_355);
    bool _732 = _690 != 3;
    bool _734 = !_580;
    int _736 = _734 ? 0 : 1;
    bool _738 = _391 > 0.5;
    int _740 = ~_718;
    int _742 = _740 + 1;
    int _744 = _742 + 1;
    int _746 = _744;
    if (_700)
    {
        int _748 = ~_718;
        int _750 = _748 + 1;
        _746 = _750;
    }
    int _752 = _746;
    bool _754 = !_692;
    int _756 = _754 ? 0 : 1;
    bool _758 = !_732;
    int _760 = _758 ? 0 : (-1);
    bool _762 = !_730;
    int _764 = _762 ? 0 : (-1);
    int _766 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _768 = _766 != 0;
    int _770 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _772 = _770 != 0;
    int _774 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _776 = _774 != 0;
    int _778 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _780 = _778 != 0;
    float _782 = _309 * _630;
    float _784 = _309 * _668;
    float _786 = fma(_307, _628, _782);
    int _788 = ~_664;
    int _790 = _788 + _764;
    int _792 = _790 + 1;
    float _794 = fma(_307, _666, _784);
    float _796 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _798 = _385 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _800 = fma(_307, _676, _720);
    float _802 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _804 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _802;
    float _806 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _808 = _806 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _810 = -_796;
    float _812 = fma(_798, 2.0, _810);
    float _814 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _816 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _814;
    int _818 = _684 >> 31;
    int _820 = _355 * _792;
    int _822 = _820 + _552;
    float _824 = 1.0 / _804;
    float _826 = fma(_311, _632, _786);
    bool _828 = !_464;
    int _830 = _828 ? _822 : (-1);
    bool _832 = _385 > 0.5;
    float _834 = 1.0 / _808;
    int _836 = _818 & 3;
    float _838 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _840 = _684 + _836;
    float _842 = fma(_385, (*spvDescriptorSet0.vp_c9)._m0[78].z, _838);
    float _844 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _846 = _347 + _844;
    float _848 = 1.0 / _816;
    int _850 = _840 >> 2;
    float _852 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _854 = _387 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _856 = _347 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _858 = isnan(_347);
    bool _860 = _856 || _858;
    bool _862 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _864 = _860 || _862;
    float _866 = float(_864);
    int _868 = _850 << 4;
    int _870 = _868 + 368;
    float _872 = fma(_854, -2.0, _852);
    float _874 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _876 = _347 + _874;
    float _878 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _880 = _347 + _878;
    int _882 = _870 + 8;
    uint _884 = uint(int(uint(_882) >> uint(2)));
    uint _886 = uint(int(uint(int(_884)) >> uint(2)));
    int _888 = int(_884) & 3;
    float _890 = (*spvDescriptorSet0.vp_c9)._m0[int(_886)][_888];
    int _892 = int(_884) + 1;
    uint _894 = uint(int(uint(_892) >> uint(2)));
    int _896 = _892 & 3;
    float _898 = (*spvDescriptorSet0.vp_c9)._m0[int(_894)][_896];
    bool _900 = _347 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _902 = isnan(_347);
    bool _904 = _900 || _902;
    bool _906 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _908 = _904 || _906;
    float _910 = float(_908);
    float _912 = _876 * _824;
    float _914 = _880 * _834;
    float _916 = -_866;
    float _918 = _916 + 1.0;
    float _920 = _846 * _848;
    float _922 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _924 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _922;
    uint _926 = uint(int(uint(_870) >> uint(2)));
    uint _928 = uint(int(uint(int(_926)) >> uint(2)));
    int _930 = int(_926) & 3;
    float _932 = (*spvDescriptorSet0.vp_c9)._m0[int(_928)][_930];
    int _934 = int(_926) + 1;
    uint _936 = uint(int(uint(_934) >> uint(2)));
    int _938 = _934 & 3;
    float _940 = (*spvDescriptorSet0.vp_c9)._m0[int(_936)][_938];
    float _942 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _944 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _942;
    bool _946 = _347 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _948 = isnan(_347);
    bool _950 = _946 || _948;
    bool _952 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _954 = _950 || _952;
    float _956 = float(_954);
    float _958 = fma(_924, _912, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _960 = fma(_944, _912, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _962 = _347 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _964 = isnan(_347);
    bool _966 = _962 || _964;
    bool _968 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _970 = _966 || _968;
    float _972 = float(_970);
    float _974 = _910 * _918;
    float _976 = -_910;
    float _978 = _976 + 1.0;
    float _980 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _982 = _980 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _984 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _986 = _984 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _988 = -_972;
    float _990 = _988 + 1.0;
    float _992 = _956 * _978;
    float _994 = -_956;
    float _996 = _994 + 1.0;
    float _998 = fma(_982, _914, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _1000 = fma(_986, _914, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    int _1002 = abs(_756);
    float _1004 = _972 * _996;
    float _1006 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1008 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _1006;
    float _1010 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1012 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _1010;
    float _1014 = _960 * _1004;
    float _1016 = _958 * _1004;
    float _1018 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1020 = int(_1018);
    float _1022 = fma(_1012, _920, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _1024 = fma(_990, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1014);
    float _1026 = fma(_990, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1016);
    int _1028 = abs(_728);
    float _1030 = fma(_1008, _920, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _1032 = fma(_998, _992, _1024);
    float _1034 = fma(_1000, _992, _1026);
    int _1036 = abs(_752);
    float _1038 = in.m_68.x;
    float _1040 = in.m_68.y;
    int _1042 = ~_1028;
    int _1044 = _1042 + 1;
    int _1046 = _1044 + 1;
    float _1048 = fma(_1030, _974, _1032);
    float _1050 = fma(_1022, _974, _1034);
    int _1052 = ~_1002;
    int _1054 = _1052 + 1;
    int _1056 = _1054 + 1;
    float _1058 = fma(_866, (*spvDescriptorSet0.vp_c9)._m0[146].x, _1048);
    int _1060 = abs(_1020);
    float _1062 = fma(_866, (*spvDescriptorSet0.vp_c9)._m0[146].y, _1050);
    float _1064 = -_221;
    int _1066 = _710 ? as_type<int>(_1064) : as_type<int>(_221);
    bool _1068 = _387 > 0.5;
    int _1070 = _1046 * as_type<int>(_940);
    int _1072 = abs(_760);
    int _1074 = ~_1036;
    int _1076 = _1074 + 1;
    int _1078 = _1076 + 1;
    int _1080 = _1056 * as_type<int>(_932);
    int _1082 = _1080 + _1070;
    float _1084 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _225);
    int _1086 = abs(_736);
    int _1088 = _1078 * as_type<int>(_890);
    int _1090 = _1088 + _1082;
    int _1092 = ~_1072;
    int _1094 = _1092 + 1;
    int _1096 = _1094 + 1;
    float _1098 = _1058 * _1038;
    float _1100 = float(uint(_1060));
    float _1102 = _1062 * _1040;
    int _1104 = ~_1086;
    int _1106 = _1104 + 1;
    int _1108 = _1106 + 1;
    int _1110 = _1096 * as_type<int>(_898);
    int _1112 = _1110 + _1090;
    float _1114 = 1.0 / _1100;
    float _1116 = float(uint(_1020));
    float _1118 = _1098 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1120 = _1112 * _1108;
    float _1122 = _1102 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1124 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _221);
    float _1126 = _826 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1128 = _830 * _1086;
    int _1130 = _1128 + _1120;
    float _1132 = 1.0 / _1116;
    float _1134 = fma(_311, _670, _794);
    float _1136 = _1122 * _1084;
    float _1138 = _1118 * _1124;
    int _1140 = abs(_1130);
    float _1142 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1144 = _1136 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1146 = _1136 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _1148 = as_type<int>(_1114) + (-2);
    float _1150 = _1134 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1152 = float(uint(_1140));
    float _1154 = fma(_1138, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1144);
    float _1156 = float(uint(_1130));
    float _1158 = fma(_1138, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1146);
    float _1160 = as_type<float>(_1148) * _1152;
    int _1162 = as_type<int>(_1132) + (-2);
    float _1164 = fma(_1142, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1154);
    float _1166 = fma(_1142, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1158);
    int _1168 = ~_1060;
    int _1170 = _1168 + 1;
    float _1172 = fma(_311, _680, _800);
    float _1174 = trunc(_1160);
    float _1176 = precise::max(_1174, 0.0);
    uint _1178 = uint(_1176);
    float _1180 = as_type<float>(_1162) * _1156;
    float _1182 = _1164 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1184 = _1166 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1186 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1188 = _1136 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1190 = _1126 + _1182;
    float _1192 = _1150 + _1184;
    float _1194 = trunc(_1180);
    float _1196 = precise::max(_1194, 0.0);
    uint _1198 = uint(_1196);
    float _1200 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1202 = _1190 + _1200;
    float _1204 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1206 = _1192 + _1204;
    int _1208 = ~_1020;
    int _1210 = _1208 + 1;
    float _1212 = fma(_1138, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1188);
    float _1214 = _1202 * _1202;
    float _1216 = _1206 * _1206;
    int _1218 = _1170 * int(_1178);
    int _1220 = _1218 + _1140;
    float _1222 = -_221;
    int _1224 = _832 ? as_type<int>(_1222) : as_type<int>(_221);
    float _1226 = fma(_387, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1186);
    float _1228 = _1214 + _1216;
    float _1230 = -_225;
    int _1232 = _1068 ? as_type<int>(_1230) : as_type<int>(_225);
    float _1234 = _225 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1236 = float(uint(_1220));
    float _1238 = sqrt(_1228);
    int _1240 = _1210 * int(_1198);
    int _1242 = _1240 + _1130;
    float _1244 = _221 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _1246 = !_768;
    float _1248 = _1246 ? _221 : as_type<float>(_1066);
    float _1250 = as_type<float>(_1148) * _1236;
    bool _1252 = !_776;
    float _1254 = _1252 ? _221 : as_type<float>(_1224);
    float _1256 = fma(_1142, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1212);
    float _1258 = float(uint(_1242));
    float _1260 = _1234 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _1262 = !_780;
    float _1264 = _1262 ? _225 : as_type<float>(_1232);
    float _1266 = trunc(_1250);
    float _1268 = precise::max(_1266, 0.0);
    uint _1270 = uint(_1268);
    float _1272 = _1234 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1274 = as_type<float>(_1162) * _1258;
    float _1276 = -_225;
    int _1278 = _738 ? as_type<int>(_1276) : as_type<int>(_225);
    float _1280 = _1234 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1282 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1260);
    bool _1284 = _1238 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1286 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1272);
    float _1288 = trunc(_1274);
    float _1290 = precise::max(_1288, 0.0);
    uint _1292 = uint(_1290);
    bool _1294 = !_772;
    float _1296 = _1294 ? _225 : as_type<float>(_1278);
    float _1298 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1280);
    int _1300 = ~_1060;
    int _1302 = _1300 + 1;
    int _1304 = ~_1020;
    int _1306 = _1304 + 1;
    float _1308 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1310 = int(_1178) + int(_1270);
    float _1312 = _1172 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1314 = _1256 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1316 = _1172;
    float _1318 = _1314;
    float _1320 = _1190;
    float _1322 = _1214;
    float _1324 = _1216;
    float _1326 = _1192;
    float _1328 = _1150;
    float _1330 = _1126;
    if (!_1284)
    {
        _1316 = _1192;
    }
    float _1332 = _1316;
    int _1334 = _1302 * _1310;
    int _1336 = _1334 + _1140;
    float _1338 = _1312 + _1314;
    int _1340 = int(_1198) + int(_1292);
    float _1342 = _1332;
    if (!_1284)
    {
        _1318 = _1190;
    }
    float _1344 = _1318;
    float _1346 = _1344;
    if (!_1284)
    {
        _1320 = _1338;
    }
    float _1348 = _1320;
    int _1350 = _1306 * _1340;
    int _1352 = _1350 + _1130;
    bool _1354 = !_1284;
    float _1356 = _1348;
    if (!_1354)
    {
        float _1358 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1360 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1362 = _1238 + _1360;
        float _1364 = _1338 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1366 = rsqrt(_1228);
        float _1368 = _1362 * _1358;
        float _1370 = _1368 * 0.15915493667125701904296875;
        float _1372 = _1370 * 6.283185482025146484375;
        float _1374 = sin(_1372);
        float _1376 = _1370 * 6.283185482025146484375;
        float _1378 = cos(_1376);
        float _1380 = fma(_1374, _1364, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1382 = _1366 * _1380;
        float _1384 = _1378 + (-1.0);
        float _1386 = fma(_1202, _1382, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1388 = fma(_1206, _1382, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1390 = _1384 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1392 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1394 = _1386 + _1392;
        float _1396 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1398 = _1388 + _1396;
        float _1400 = fma(_1338, _1378, _1390);
        float _1402 = _1394 * _1394;
        float _1404 = _1398 * _1398;
        _1356 = _1400;
        _1322 = _1402;
        _1324 = _1404;
        _1346 = _1386;
        _1342 = _1388;
        _1326 = _1382;
    }
    float _1406 = _1356;
    float _1408 = _1322;
    float _1410 = _1324;
    float _1412 = _1346;
    float _1414 = _1342;
    float _1416 = _1326;
    bool _1418 = uint(_1336) >= uint(_1060);
    float _1420 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1422 = _1130 ^ _1020;
    float _1424 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1426 = _1406 + _1424;
    bool _1428 = uint(_1352) >= uint(_1020);
    float _1430 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[76].y, _872);
    bool _1432 = !_1418;
    int _1434 = _1432 ? 0 : (-1);
    float _1436 = fma(_1426, _1426, _1408);
    uint _1438 = uint(int(uint(_1422) >> uint(31)));
    float _1440 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1442 = !_1428;
    int _1444 = _1442 ? 0 : (-1);
    float _1446 = -_153;
    float _1448 = fma(_1446, (*spvDescriptorSet0.vp_c9)._m0[76].x, _812);
    int _1450 = ~_1434;
    int _1452 = _1310 + _1450;
    int _1454 = _1452 + 1;
    float _1456 = fma(_1234, _1234, 1.0);
    int _1458 = ~int(_1438);
    int _1460 = _1458 + 1;
    float _1462 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1226);
    int _1464 = ~_1340;
    int _1466 = _1464 + _1444;
    int _1468 = _1466 + 1;
    float _1470 = _1420 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _1472 = _1454 ^ _1460;
    float _1474 = _1248 + 0.5;
    bool _1476 = _1020 == 0;
    float _1478 = -_1296;
    float _1480 = _1478 + 0.5;
    bool _1482 = _1020 == 0;
    int _1484 = _1020 * _1468;
    int _1486 = _1484 + _1130;
    int _1488 = ~_1460;
    int _1490 = _1488 + _1472;
    int _1492 = _1490 + 1;
    float _1494 = rsqrt(_1456);
    float _1496 = _1308 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1498 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[77].z, _842);
    bool _1500 = !_1482;
    int _1502 = _1500 ? _1492 : (-1);
    float _1504 = _1264 + (-0.5);
    bool _1506 = !_1476;
    int _1508 = _1506 ? _1486 : (-1);
    float _1510 = _1480 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1512 = float(_1502);
    float _1514 = -_1498;
    float _1516 = _1514 + 1.0;
    float _1518 = float(_1508);
    float _1520 = -_1462;
    float _1522 = _1520 + 1.0;
    float _1524 = _1436 + _1410;
    float _1526 = -_1430;
    float _1528 = fma(_1470, _1512, _1526);
    float _1530 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1532 = fma(_1496, _1518, _1448);
    float _1534 = _1234 * _1494;
    float _1536 = _1254 + 0.5;
    float _1538 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1540 = -(*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _1542 = _1534 * _1540;
    float _1544 = fma(_1496, _1536, _1532);
    float _1546 = -_1470;
    float _1548 = fma(_1546, _1504, _1528);
    float _1550 = -(*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _1552 = _1534 * _1550;
    float _1554 = fma(_1494, (*spvDescriptorSet0.vp_c8)._m0[24].y, _1542);
    float _1556 = _1474 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1558 = -(*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _1560 = _1534 * _1558;
    float _1562 = fma(_1494, (*spvDescriptorSet0.vp_c8)._m0[25].y, _1552);
    float _1564 = fma(_1264, _1522, _1548);
    float _1566 = _1556 * _1440;
    float _1568 = fma(_1494, (*spvDescriptorSet0.vp_c8)._m0[26].y, _1560);
    float _1570 = _1510 * _1530;
    float _1572 = -_1516;
    float _1574 = fma(_1254, _1572, _1544);
    float _1576 = sqrt(_1524);
    float _1578 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1580 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1582 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1584 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1586 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1588 = _1580 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1590 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1592 = _1538 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1594 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1596 = _1582 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1598 = _1584 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1600 = _1586 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1602 = _1590 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1604 = _1282 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _1606 = _1286 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _1608 = _1298 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    out.m_80.x = _1588;
    out.m_80.y = _1592;
    out.m_80.z = _1596;
    out.m_80.w = _1578;
    bool _1610 = _1576 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1612 = isnan(_1576);
    bool _1614 = _1610 || _1612;
    bool _1616 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1618 = _1614 || _1616;
    out.m_82.x = _1598;
    out.m_82.y = _1600;
    out.m_82.z = _1602;
    out.m_82.w = _1594;
    out.m_84.x = _1554;
    out.m_84.y = _1562;
    out.m_84.z = _1568;
    out.m_86.x = _1574;
    out.m_86.y = _1564;
    out.m_86.z = _1566;
    out.m_86.w = _1570;
    float _1620 = _1556;
    float _1622 = _1416;
    if (!_1618)
    {
        _1620 = 1.0;
    }
    float _1624 = _1620;
    out.m_88.x = _1604;
    out.m_88.y = _1606;
    out.m_88.z = _1608;
    bool _1626 = !_1618;
    float _1628 = _1624;
    if (!_1626)
    {
        bool _1630 = _1576 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1632 = isnan(_1576);
        bool _1634 = _1630 || _1632;
        bool _1636 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1638 = _1634 || _1636;
        if (!_1638)
        {
            float _1640 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1642 = _1576 + _1640;
            float _1644 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1646 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1644;
            float _1648 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1650 = _1648 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1652 = 1.0 / _1646;
            float _1654 = _1642 * _1652;
            float _1656 = fma(_1654, _1650, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1628 = _1656;
            _1658 = true;
        }
        else
        {
            bool _1660 = _1576 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1662 = isnan(_1576);
            bool _1664 = _1660 || _1662;
            bool _1666 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1668 = _1664 || _1666;
            if (!_1668)
            {
                float _1670 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1672 = _1576 + _1670;
                float _1674 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1676 = _1674 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1678 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1680 = _1678 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1682 = 1.0 / _1676;
                float _1684 = _1672 * _1682;
                float _1686 = fma(_1684, _1680, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1628 = _1686;
                _1658 = true;
            }
            else
            {
                _1628 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1658 = false;
    float _1688 = _1628;
    float _1690 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1692 = _1406 + _1690;
    float _1694 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1696 = _1412 + _1694;
    float _1698 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1700 = _1414 + _1698;
    float _1702 = fma(_1692, _1688, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1704 = fma(_1696, _1688, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1706 = fma(_1700, _1688, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1708 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1710 = _1702 + _1708;
    float _1712 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1714 = _1704 + _1712;
    float _1716 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1718 = _1706 + _1716;
    float _1720 = _1710 * _1710;
    float _1722 = _1702 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1724 = fma(_1714, _1714, _1720);
    float _1726 = fma(_1704, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1722);
    float _1728 = fma(_1718, _1718, _1724);
    float _1730 = _1312 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1732 = fma(_1150, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1734 = rsqrt(_1728);
    float _1736 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1730);
    float _1738 = fma(_1150, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1736);
    float _1740 = sqrt(_1728);
    float _1742 = _1738 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1744 = _1312 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1746 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1744);
    float _1748 = _1734 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1750 = 1.0 / _1742;
    float _1752 = fma(_1150, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1746);
    float _1754 = _1714 * _1748;
    float _1756 = _1718 * _1748;
    float _1758 = _1752 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1760 = _1754 * _1754;
    float _1762 = _1756 * _1756;
    float _1764 = _1758 + _1742;
    float _1766 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _1768 = floor(_1732);
    float _1770 = _1760 + _1762;
    float _1772 = _1312 + _1766;
    float _1774 = _1764 * _1750;
    float _1776 = _1774 * 0.5;
    float _1778 = _1772 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1780 = sqrt(_1770);
    float _1782 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1784 = fma(_1776, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1782);
    float _1786 = _1772 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1788 = fma(_1126, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1778);
    float _1790 = fma(_1126, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1786);
    float _1792 = fma(_1150, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1788);
    float _1794 = 1.0 / _1784;
    float _1796 = -_1768;
    float _1798 = _1732 + _1796;
    float _1800 = fma(_1150, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1790);
    float _1802 = _1792 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1804 = _1800 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    bool _1806 = _1780 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1808 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1810 = _1780 + _1808;
    float _1812 = trunc(_1802);
    int _1814 = int(_1812);
    float _1816 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1818 = _1794 * _1816;
    float _1820 = trunc(_1804);
    int _1822 = int(_1820);
    bool _1824 = _1818 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1826 = fma(_1126, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    bool _1828 = _1818 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1830 = _1598;
    int _1832 = 2;
    float _1834 = _1810;
    float _1836 = _1754;
    float _1838 = _1756;
    float _1840 = _1726;
    if (_1806)
    {
        float _1842 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1830 = _1842;
    }
    float _1844 = _1830;
    int _1846 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1848 = _1814 + _1846;
    int _1850 = _1848 + 1;
    if (!_1824)
    {
        _1832 = 1;
    }
    int _1852 = _1832;
    float _1854 = floor(_1826);
    int _1856 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1858 = _1822 + _1856;
    int _1860 = _1858 + 1;
    int _1862 = _1852;
    if (_1806)
    {
        float _1864 = _1810 * _1844;
        _1834 = _1864;
    }
    float _1866 = _1834;
    float _1868 = 0.0;
    if (_1806)
    {
        float _1870 = _1866 * 0.15915493667125701904296875;
        _1868 = _1870;
    }
    float _1872 = _1868;
    float _1874 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1876 = _1792;
    if (_1806)
    {
        float _1878 = _1872 * 6.283185482025146484375;
        float _1880 = sin(_1878);
        _1876 = _1880;
    }
    float _1882 = _1876;
    float _1884 = -_1854;
    float _1886 = _1826 + _1884;
    float _1888 = precise::max(0.0, _1874);
    bool _1890 = !_1824;
    int _1892 = _1890 ? 0 : 1;
    float _1894 = -_1748;
    float _1896 = -_1888;
    float _1898 = fma(_1710, _1894, _1896);
    float _1900 = as_type<float>(_1892);
    float _1902 = _1898;
    if (!_1828)
    {
        _1862 = _1892;
    }
    int _1904 = _1862;
    float _1906 = _1888;
    if (_1806)
    {
        float _1908 = rsqrt(_1770);
        _1906 = _1908;
    }
    float _1910 = _1906;
    bool _1912 = _1850 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    if (_1806)
    {
        float _1914 = _1898 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1900 = _1914;
    }
    float _1916 = _1900;
    int _1918 = _1904 << 6;
    int _1920 = _1850 | _1860;
    int _1922 = _1918 + 64;
    uint _1924 = uint(int(uint(_1922) >> uint(2)));
    uint _1926 = uint(int(uint(int(_1924)) >> uint(2)));
    int _1928 = int(_1924) & 3;
    float _1930 = (*spvDescriptorSet0.vp_c15)._m0[int(_1926)][_1928];
    int _1932 = int(_1924) + 1;
    uint _1934 = uint(int(uint(_1932) >> uint(2)));
    int _1936 = _1932 & 3;
    float _1938 = (*spvDescriptorSet0.vp_c15)._m0[int(_1934)][_1936];
    float _1940 = _1872;
    if (_1806)
    {
        float _1942 = _1872 * 6.283185482025146484375;
        float _1944 = cos(_1942);
        _1940 = _1944;
    }
    float _1946 = _1940;
    float _1948 = _1882;
    if (_1806)
    {
        float _1950 = fma(_1882, _1916, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1948 = _1950;
    }
    float _1952 = _1948;
    bool _1954 = _1920 < 0;
    bool _1956 = _1954 || _1912;
    bool _1958 = _1860 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1960 = _1958 || _1956;
    int _1962 = _1918 + 96;
    uint _1964 = uint(int(uint(_1962) >> uint(2)));
    uint _1966 = uint(int(uint(int(_1964)) >> uint(2)));
    int _1968 = int(_1964) & 3;
    float _1970 = (*spvDescriptorSet0.vp_c15)._m0[int(_1966)][_1968];
    int _1972 = int(_1964) + 1;
    uint _1974 = uint(int(uint(_1972) >> uint(2)));
    int _1976 = _1972 & 3;
    float _1978 = (*spvDescriptorSet0.vp_c15)._m0[int(_1974)][_1976];
    float _1980 = 0.0;
    if (_1806)
    {
        float _1982 = _1910 * _1952;
        _1980 = _1982;
    }
    float _1984 = _1980;
    float _1986 = _1984;
    if (_1806)
    {
        float _1988 = _1754 * _1984;
        _1836 = _1988;
    }
    float _1990 = _1836;
    if (_1806)
    {
        float _1992 = _1756 * _1984;
        _1838 = _1992;
    }
    float _1994 = _1838;
    if (!_1806)
    {
        _1986 = _1762;
    }
    float _1996 = _1986;
    int _1998 = _1918 + 104;
    uint _2000 = uint(int(uint(_1998) >> uint(2)));
    uint _2002 = uint(int(uint(int(_2000)) >> uint(2)));
    int _2004 = int(_2000) & 3;
    float _2006 = (*spvDescriptorSet0.vp_c15)._m0[int(_2002)][_2004];
    int _2008 = int(_2000) + 1;
    uint _2010 = uint(int(uint(_2008) >> uint(2)));
    int _2012 = _2008 & 3;
    float _2014 = (*spvDescriptorSet0.vp_c15)._m0[int(_2010)][_2012];
    float _2016 = _1996;
    if (_1806)
    {
        float _2018 = _1946 + (-1.0);
        _1622 = _2018;
    }
    float _2020 = _1622;
    if (_1806)
    {
        float _2022 = _1994 * _1994;
        _2016 = _2022;
    }
    float _2024 = _2016;
    float _2026 = 0.0;
    if (!_1960)
    {
        float _2028 = floor(_1804);
        _2026 = _2028;
    }
    float _2030 = _2026;
    float _2032 = 0.0;
    if (_1806)
    {
        float _2034 = _2020 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2032 = _2034;
    }
    float _2036 = _2032;
    float _2038 = fma(_1706, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1726);
    if (!_1806)
    {
        _1840 = _1760;
    }
    float _2040 = _1840;
    int _2042 = _1918 + 48;
    uint _2044 = uint(int(uint(_2042) >> uint(2)));
    uint _2046 = uint(int(uint(int(_2044)) >> uint(2)));
    int _2048 = int(_2044) & 3;
    float _2050 = (*spvDescriptorSet0.vp_c15)._m0[int(_2046)][_2048];
    int _2052 = int(_2044) + 1;
    uint _2054 = uint(int(uint(_2052) >> uint(2)));
    int _2056 = _2052 & 3;
    float _2058 = (*spvDescriptorSet0.vp_c15)._m0[int(_2054)][_2056];
    float _2060 = _2040;
    if (_1806)
    {
        float _2062 = fma(_1898, _1946, _2036);
        _1902 = _2062;
    }
    float _2064 = _1902;
    if (_1806)
    {
        float _2066 = _1990 * _1990;
        _2060 = _2066;
    }
    float _2068 = _2060;
    float _2070 = _2038 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2072 = fma(_2064, _2064, _2068);
    int _2074 = _1918 + 56;
    uint _2076 = uint(int(uint(_2074) >> uint(2)));
    uint _2078 = uint(int(uint(int(_2076)) >> uint(2)));
    int _2080 = int(_2076) & 3;
    float _2082 = (*spvDescriptorSet0.vp_c15)._m0[int(_2078)][_2080];
    int _2084 = int(_2076) + 1;
    uint _2086 = uint(int(uint(_2084) >> uint(2)));
    int _2088 = _2084 & 3;
    float _2090 = (*spvDescriptorSet0.vp_c15)._m0[int(_2086)][_2088];
    float _2092 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2094 = _2070 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2096 = _2072 + _2024;
    float _2098 = -_2094;
    float _2100 = fma(_2098, _2092, 1.0);
    int _2102 = as_type<int>(_2094);
    if (!_1960)
    {
        int _2104 = _1860 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _2106 = _2104 + _1850;
        _2102 = _2106;
    }
    int _2108 = _2102;
    int _2110 = _1918 + 80;
    uint _2112 = uint(int(uint(_2110) >> uint(2)));
    uint _2114 = uint(int(uint(int(_2112)) >> uint(2)));
    int _2116 = int(_2112) & 3;
    float _2118 = (*spvDescriptorSet0.vp_c15)._m0[int(_2114)][_2116];
    int _2120 = int(_2112) + 1;
    uint _2122 = uint(int(uint(_2120) >> uint(2)));
    int _2124 = _2120 & 3;
    float _2126 = (*spvDescriptorSet0.vp_c15)._m0[int(_2122)][_2124];
    float _2128 = log2(_2100);
    int _2130 = _1918 + 72;
    uint _2132 = uint(int(uint(_2130) >> uint(2)));
    uint _2134 = uint(int(uint(int(_2132)) >> uint(2)));
    int _2136 = int(_2132) & 3;
    float _2138 = (*spvDescriptorSet0.vp_c15)._m0[int(_2134)][_2136];
    int _2140 = int(_2132) + 1;
    uint _2142 = uint(int(uint(_2140) >> uint(2)));
    int _2144 = _2140 & 3;
    float _2146 = (*spvDescriptorSet0.vp_c15)._m0[int(_2142)][_2144];
    float _2148 = _1772 * _1938;
    float _2150 = rsqrt(_2096);
    float _2152 = fma(_1126, _1930, _2148);
    int _2154 = _1918 + 88;
    uint _2156 = uint(int(uint(_2154) >> uint(2)));
    uint _2158 = uint(int(uint(int(_2156)) >> uint(2)));
    int _2160 = int(_2156) & 3;
    float _2162 = (*spvDescriptorSet0.vp_c15)._m0[int(_2158)][_2160];
    int _2164 = int(_2156) + 1;
    uint _2166 = uint(int(uint(_2164) >> uint(2)));
    int _2168 = _2164 & 3;
    float _2170 = (*spvDescriptorSet0.vp_c15)._m0[int(_2166)][_2168];
    float _2172 = _1772 * _1978;
    float2 _6262 = float2(_1886, _1798);
    float _2174 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6262, float2(0.0), isnan(_6262)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6262, float2(0.0), isnan(_6262)), level(0.0)).x;
    float _2176 = _2128 * 0.693147182464599609375;
    float _2178 = fma(_1126, _1970, _2172);
    float _2180 = _1970;
    if (!_1960)
    {
        float _2182 = floor(_1802);
        _2180 = _2182;
    }
    float _2184 = _2180;
    float _2186 = fma(_1150, _2006, _2178);
    float _2188 = _2150 * _1990;
    float _2190 = _2186 + _2014;
    float _2192 = _2150 * _2064;
    float _2194 = _2150 * _1994;
    float _2196 = _1772 * _2058;
    float _2198 = _2058;
    int _2200 = as_type<int>(_2196);
    float _2202 = _2192;
    if (!_1960)
    {
        float _2204 = -_2030;
        float _2206 = _1804 + _2204;
        _2198 = _2206;
    }
    float _2208 = _2198;
    float _2210 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2212 = fma(_1740, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2210);
    float _2214 = precise::clamp(_2212, 0.0, 1.0);
    float _2216 = 1.0 / _2190;
    float _2218 = _2188 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2220 = fma(_1126, _2050, _2196);
    float _2222 = -_2214;
    float _2224 = _2222 + 1.0;
    if (!_1960)
    {
        int _2226 = _2108 << 2;
        _2200 = _2226;
    }
    int _2228 = _2200;
    float _2230 = -_2218;
    float _2232 = fma(_2192, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2230);
    float _2234 = fma(_1150, _2082, _2220);
    float _2236 = _2176 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2238 = abs(_2224);
    float _2240 = log2(_2238);
    int _2242 = _2228;
    int _2244 = as_type<int>(_2126);
    if (!_1960)
    {
        int _2246 = 12 & _2228;
        _2242 = _2246;
    }
    int _2248 = _2242;
    float _2250 = _2234 + _2090;
    float _2252 = _1702 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2254 = _1772 * _2126;
    int _2256 = as_type<int>(_2254);
    if (!_1960)
    {
        uint _2258 = uint(int(uint(_2108) >> uint(2)));
        _2244 = int(_2258);
    }
    int _2260 = _2244;
    float _2262 = fma(_1704, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2252);
    float _2264 = fma(_1126, _2118, _2254);
    if (!_1960)
    {
        int _2266 = _2260 << 4;
        int _2268 = _2266 + _2248;
        _2256 = _2268;
    }
    int _2270 = _2256;
    float _2272 = fma(_1706, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2262);
    float _2274 = fma(_1150, _2138, _2152);
    float _2276 = -_2194;
    float _2278 = fma(_2276, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2232);
    float _2280 = _1702 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2282 = _2240 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2284 = _2274 + _2146;
    float _2286 = _1702 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2288 = fma(_1704, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2280);
    float _2290 = _2250 * _2216;
    float _2292 = fma(_1150, _2162, _2264);
    float _2294 = fma(_1704, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2286);
    float _2296 = _2284 * _2216;
    float _2298 = _2272 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _2300 = _2290 >= 0.0;
    float _2302 = fma(_1706, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2294);
    float _2304 = exp2(_2282);
    float _2306 = _2298 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _2308 = _2290 <= 1.0;
    bool _2310 = _2308 && _2300;
    float _2312 = _2302 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2314 = fma(_1706, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2288);
    float _2316 = fma(_2278, -0.5, 0.5);
    bool _2318 = _2296 >= 0.0;
    bool _2320 = _2318 && _2310;
    float _2322 = fma(_2312, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2306);
    float _2324 = _2224;
    if (!_1960)
    {
        int _2326 = _2270 + 400;
        uint _2328 = uint(int(uint(_2326) >> uint(2)));
        uint _2330 = uint(int(uint(int(_2328)) >> uint(2)));
        int _2332 = int(_2328) & 3;
        float _2334 = (*spvDescriptorSet0.vp_c15)._m0[int(_2330)][_2332];
        _2324 = _2334;
    }
    float _2336 = _2324;
    float _2338 = _2314 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    bool _2340 = _2296 <= 1.0;
    bool _2342 = _2340 && _2320;
    float _2344 = fma(_2070, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2322);
    float _2346 = sqrt(_2316);
    float _2348 = fma(_2278, 0.5, 0.5);
    float _2350 = _2292 + _2170;
    float _2352 = fma(_2338, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2344);
    float _2354 = _2192 + 1.0;
    float _2356 = fma(_2348, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2358 = _2298 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2360 = _2298 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2362 = -_2192;
    float _2364 = fma(_2304, _2354, _2362);
    float _2366 = 1.0 / _2352;
    float _2368 = fma(_2312, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2358);
    float _2370 = _2354;
    if (_2342)
    {
        float _2372 = float(_1904);
        _2370 = _2372;
    }
    float _2374 = _2370;
    float _2376 = fma(_2312, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2360);
    float _2378 = fma(_2348, _2356, -0.212114393711090087890625);
    float _2380 = fma(_2070, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2368);
    if (!_1960)
    {
        float _2382 = -_2184;
        float _2384 = _1802 + _2382;
        _2202 = _2384;
    }
    float _2386 = _2202;
    float _2388 = fma(_2070, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2376);
    float _2390 = _2374;
    float _2392 = _2386;
    if (_2342)
    {
        float _2394 = rint(_2374);
        float _2396 = precise::max(_2394, 0.0);
        uint _2398 = uint(_2396);
        uint _2400 = clamp(_2398, 0u, 65535u);
        _2390 = as_type<float>(_2400);
    }
    float _2402 = _2390;
    float _2404 = fma(_2348, _2378, 1.570728778839111328125);
    float _2406 = _2346 * 0.636619746685028076171875;
    float _2408 = fma(_2338, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2380);
    float _2410 = fma(_2338, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2388);
    float _2412 = _2350 * _2216;
    float _2414 = -_2404;
    float _2416 = fma(_2406, _2414, 1.0);
    float _2418 = fma(_2364, 0.5, 0.5);
    float _2420 = _2408 * _2366;
    float _2422 = _2410 * _2366;
    float _2424 = fma(_2420, 0.5, 0.5);
    float _2426 = fma(_2422, -0.5, 0.5);
    float _2428 = _2402;
    if (_2342)
    {
        float3 _6698 = float3(_2290, _2296, float(as_type<int>(_2402)));
        float3 _6702 = select(_6698, float3(0.0), isnan(_6698));
        float _2430 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6702.xy, uint(rint(_6702.z)), _2412, level(0.0));
        _2428 = _2430;
    }
    float _2432 = _2428;
    float3 _6712 = float3(_2424, _2426, _2236);
    float _2434 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6712, float3(0.0), isnan(_6712)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6712, float3(0.0), isnan(_6712)), level(0.0)).x;
    float3 _6721 = float3(_2424, _2426, _2236);
    float4 _2437 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6721, float3(0.0), isnan(_6721)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6721, float3(0.0), isnan(_6721)), level(0.0)).xyzw;
    float _2439 = _2437.x;
    float _2441 = _2437.y;
    float _2443 = _2437.z;
    float _2445 = _2437.w;
    float2 _6737 = float2(_2416, _2418);
    float3 _2449 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6737, float2(0.0), isnan(_6737)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6737, float2(0.0), isnan(_6737)), level(0.0)).xyz;
    float _2451 = _2449.x;
    float _2453 = _2449.y;
    float _2455 = _2449.z;
    float _2457 = _2216;
    if (!_1960)
    {
        float _2459 = rint(_2336);
        float _2461 = precise::max(_2459, 0.0);
        uint _2463 = uint(_2461);
        uint _2465 = clamp(_2463, 0u, 65535u);
        _2457 = as_type<float>(_2465);
    }
    float _2467 = _2457;
    float _2469 = _2467;
    if (!_1960)
    {
        float3 _6774 = float3(_2386, _2208, float(as_type<int>(_2467)));
        float3 _6776 = select(_6774, float3(0.0), isnan(_6774));
        float _2471 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6776.xy, uint(rint(_6776.z)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6776.xy, uint(rint(_6776.z)), level(0.0)).x;
        _2469 = _2471;
    }
    float _2473 = _2469;
    float _2475 = abs(_1818);
    float _2477 = log2(_2475);
    float _2479 = _2298 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2481 = fma(_2312, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2479);
    float _2483 = fma(_2070, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2481);
    float _2485 = _2240 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2487 = _1818 <= 8000.0;
    bool _2489 = isnan(_1818);
    bool _2491 = _2487 || _2489;
    bool _2493 = isnan(8000.0);
    bool _2495 = _2491 || _2493;
    float _2497 = float(_2495);
    float _2499 = fma(_2338, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2483);
    float _2501 = _2477 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2503 = exp2(_2485);
    if (!_2342)
    {
        _2392 = 1.0;
    }
    float _2505 = _2392;
    out.gl_Position.x = _2408;
    out.gl_Position.y = _2410;
    out.gl_Position.z = _2499;
    out.gl_Position.w = _2352;
    float _2507 = exp2(_2501);
    float _2509 = fma(_2507, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2511 = precise::clamp(_2509, 0.0, 1.0);
    float _2513 = fma(_2511, -2.0, 3.0);
    float _2515 = _2511 * _2511;
    float _2517 = _2515 * _2513;
    float _2519 = _2499 + _2352;
    float _2521 = _2519 * 0.5;
    float _2523 = -_2517;
    float _2525 = _2523 + 1.0;
    out.m_90.z = _2521;
    out.m_90.w = _2352;
    float _2527 = fma(_2525, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2517);
    float _2529 = _2497 * _2527;
    float _2531 = -_2503;
    float _2533 = _2531 + 1.0;
    float _2535 = _2529 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2537 = _2533 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2539 = -_2174;
    float _2541 = _2539 + 1.0;
    float _2543 = _2505;
    float _2545 = _2535;
    if (_2342)
    {
        bool _2547 = _2432 >= _2412;
        bool _2549 = isnan(_2432);
        bool _2551 = _2547 || _2549;
        bool _2553 = isnan(_2412);
        bool _2555 = _2551 || _2553;
        float _2557 = float(_2555);
        _2543 = _2557;
    }
    float _2559 = _2543;
    float _2561 = _2541 * _2535;
    float _2563 = precise::clamp(_2561, 0.0, 1.0);
    if (_1960)
    {
        _2545 = 1.0;
    }
    float _2565 = _2545;
    float _2567 = _2565;
    if (!_1960)
    {
        int _2569 = _2108 << 4;
        int _2571 = _2569 + 2048;
        uint _2573 = uint(int(uint(_2571) >> uint(2)));
        uint _2575 = uint(int(uint(int(_2573)) >> uint(2)));
        int _2577 = int(_2573) & 3;
        float _2579 = (*spvDescriptorSet0.vp_c15)._m0[int(_2575)][_2577];
        int _2581 = int(_2573) + 1;
        uint _2583 = uint(int(uint(_2581) >> uint(2)));
        int _2585 = _2581 & 3;
        float _2587 = (*spvDescriptorSet0.vp_c15)._m0[int(_2583)][_2585];
        int _2589 = _2571 + 8;
        uint _2591 = uint(int(uint(_2589) >> uint(2)));
        uint _2593 = uint(int(uint(int(_2591)) >> uint(2)));
        int _2595 = int(_2591) & 3;
        float _2597 = (*spvDescriptorSet0.vp_c15)._m0[int(_2593)][_2595];
        int _2599 = int(_2591) + 1;
        uint _2601 = uint(int(uint(_2599) >> uint(2)));
        int _2603 = _2599 & 3;
        float _2605 = (*spvDescriptorSet0.vp_c15)._m0[int(_2601)][_2603];
        float _2607 = _1772 * _2587;
        float _2609 = fma(_1126, _2579, _2607);
        float _2611 = fma(_1150, _2597, _2609);
        float _2613 = _2611 + _2605;
        float _2615 = precise::clamp(_2613, 0.0, 1.0);
        float _2617 = -_2615;
        float _2619 = _2617 + _2473;
        float _2621 = fma(_2619, 500.0, 1.5);
        float _2623 = exp2(_2621);
        float _2625 = 0.0 + _2623;
        float _2627 = precise::clamp(_2625, 0.0, 1.0);
        _2567 = _2627;
        _1328 = _2623;
    }
    float _2629 = _2567;
    float _2631 = _1328;
    float _2633 = _2537 * _2434;
    float _2635 = _2559 * _2629;
    float _2637 = -_2563;
    float _2639 = fma(_2637, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2641 = -_2537;
    float _2643 = _2641 + 1.0;
    float _2645 = _2445 * _2633;
    float _2647 = _2455 * _2633;
    float _2649 = -_2635;
    float _2651 = fma(_2649, _2639, 1.0);
    float _2653 = precise::clamp(_2651, 0.0, 1.0);
    float _2655 = _2445 * _2643;
    float _2657 = fma(_2451, _2645, _2439);
    float _2659 = fma(_2453, _2645, _2441);
    float _2661 = _2653 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2663 = fma(_2445, _2647, _2443);
    out.m_92.x = _1704;
    out.m_92.y = _1702;
    out.m_92.z = _1706;
    bool _2665 = _1740 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2667 = isnan(_1740);
    bool _2669 = _2665 || _2667;
    bool _2671 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2673 = _2669 || _2671;
    out.m_94.x = _2661;
    out.m_96.x = _2657;
    out.m_96.y = _2659;
    out.m_96.z = _2663;
    out.m_96.w = _2655;
    float _2675 = _2633;
    float _2677 = _2643;
    float _2679 = _2635;
    float _2681 = _2653;
    float _2683 = _2631;
    if (!_2673)
    {
        _2675 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2685 = _2675;
    float _2687 = _2685;
    float _2689 = _2685;
    if (!_2673)
    {
        _2677 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2691 = _2677;
    float _2693 = _2691;
    float _2695 = _2691;
    if (!_2673)
    {
        _2679 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2697 = _2679;
    float _2699 = _2697;
    float _2701 = _2697;
    if (!_2673)
    {
        _2681 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2703 = _2681;
    float _2705 = _2703;
    float _2707 = _2703;
    if (!_2673)
    {
        _1330 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2709 = _1330;
    float _2711 = _2709;
    float _2713 = _2709;
    if (!_2673)
    {
        _2683 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2715 = _2683;
    bool _2717 = !_2673;
    float _2719 = _2715;
    float _2721 = _2715;
    if (!_2717)
    {
        bool _2723 = _1740 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2725 = isnan(_1740);
        bool _2727 = _2723 || _2725;
        bool _2729 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2731 = _2727 || _2729;
        if (!_2731)
        {
            float _2733 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2735 = _1740 + _2733;
            float _2737 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2739 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2737;
            float _2741 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2743 = _2741 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2745 = 1.0 / _2739;
            float _2747 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2749 = _2747 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2751 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2753 = _2751 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2755 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2757 = _2755 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2759 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2761 = _2759 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2763 = _2735 * _2745;
            float _2765 = precise::clamp(_2763, 0.0, 1.0);
            float _2767 = fma(_2765, _2743, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2769 = fma(_2765, _2749, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2771 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2773 = _2771 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2775 = fma(_2765, _2753, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2777 = fma(_2765, _2757, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2779 = fma(_2765, _2761, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            float _2781 = fma(_2765, _2773, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _2695 = _2769;
            _2713 = _2777;
            _2689 = _2767;
            _2707 = _2775;
            _2701 = _2781;
            _2721 = _2779;
            _2783 = true;
        }
        else
        {
            bool _2785 = _1740 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2787 = isnan(_1740);
            bool _2789 = _2785 || _2787;
            bool _2791 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2793 = _2789 || _2791;
            if (!_2793)
            {
                _2687 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2795 = _2687;
            _2689 = _2795;
            if (!_2793)
            {
                _2693 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2797 = _2693;
            _2695 = _2797;
            if (!_2793)
            {
                _2699 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2799 = _2699;
            _2701 = _2799;
            if (!_2793)
            {
                _2705 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2801 = _2705;
            _2707 = _2801;
            if (!_2793)
            {
                _2711 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2803 = _2711;
            _2713 = _2803;
            if (!_2793)
            {
                _2719 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2805 = _2719;
            bool _2807 = !_2793;
            _2721 = _2805;
            if (!_2807)
            {
                bool _2809 = _1740 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2811 = isnan(_1740);
                bool _2813 = _2809 || _2811;
                bool _2815 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2817 = _2813 || _2815;
                if (!_2817)
                {
                    float _2819 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2821 = _1740 + _2819;
                    float _2823 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2825 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2823;
                    float _2827 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2829 = _2827 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2831 = 1.0 / _2825;
                    float _2833 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2835 = _2833 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2837 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2839 = _2837 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2841 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2843 = _2841 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2845 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2847 = _2845 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2849 = _2821 * _2831;
                    float _2851 = precise::clamp(_2849, 0.0, 1.0);
                    float _2853 = fma(_2851, _2829, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2855 = fma(_2851, _2835, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2857 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2859 = _2857 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2861 = fma(_2851, _2839, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2863 = fma(_2851, _2843, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2865 = fma(_2851, _2847, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    float _2867 = fma(_2851, _2859, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _2695 = _2855;
                    _2713 = _2863;
                    _2689 = _2853;
                    _2707 = _2861;
                    _2701 = _2867;
                    _2721 = _2865;
                    _2783 = true;
                }
                else
                {
                    _2695 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2713 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2689 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2707 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2701 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2721 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2783 = false;
    float _2869 = _2695;
    float _2871 = _2713;
    float _2873 = _2689;
    float _2875 = _2707;
    float _2877 = _2701;
    float _2879 = _2721;
    float _2881 = fma(_1606, -0.5, 0.5);
    float _2883 = precise::clamp(_2881, 0.0, 1.0);
    float _2885 = -_2869;
    float _2887 = _2885 + _2871;
    float _2889 = -_2873;
    float _2891 = _2889 + _2875;
    float _2893 = -_2877;
    float _2895 = _2893 + _2879;
    bool _2897 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2899 = fma(_2883, _2887, _2869);
    float _2901 = fma(_2883, _2891, _2873);
    float _2903 = fma(_2883, _2895, _2877);
    float _2905 = _2899 * 0.586610972881317138671875;
    out.m_98.x = 0.0;
    float _2907 = fma(_2901, 0.298911988735198974609375, _2905);
    float _2909 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2911 = fma(_2903, 0.114477999508380889892578125, _2907);
    out.m_61.x = _2909;
    float _2913 = -_2911;
    float _2915 = _2901 + _2913;
    float _2917 = -_2911;
    float _2919 = _2899 + _2917;
    float _2921 = -_2911;
    float _2923 = _2903 + _2921;
    float _2925 = fma(_2915, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2911);
    float _2927 = fma(_2919, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2911);
    float _2929 = fma(_2923, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2911);
    out.m_100.x = _2925;
    out.m_100.y = _2927;
    out.m_100.z = _2929;
    if (!_2897)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2931 = -_1702;
    float _2933 = _2931 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2935 = -_1704;
    float _2937 = _2935 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2939 = -_1706;
    float _2941 = _2939 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2943 = _2933 * _2933;
    float _2945 = fma(_2937, _2937, _2943);
    float _2947 = fma(_2941, _2941, _2945);
    float _2949 = sqrt(_2947);
    float _2951 = rsqrt(_2947);
    float _2953 = -_2949;
    float _2955 = _2953 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2957 = _2955 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2959 = precise::clamp(_2957, 0.0, 1.0);
    float _2961 = _2937 * _2951;
    float _2963 = _2933 * _2951;
    float _2965 = abs(_2959);
    float _2967 = log2(_2965);
    float _2969 = _2941 * _2951;
    float _2971 = _2961 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2973 = _1606 * _2963;
    float _2975 = -_2963;
    float _2977 = -_2971;
    float _2979 = fma(_2975, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2977);
    float _2981 = fma(_1604, _2961, _2973);
    float _2983 = -_2969;
    float _2985 = fma(_2983, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2979);
    float _2987 = fma(_1608, _2969, _2981);
    float _2989 = precise::clamp(_2987, 0.0, 1.0);
    float _2991 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2993 = _2985 + _2991;
    float _2995 = _2967 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2997 = _2993 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2999 = precise::clamp(_2997, 0.0, 1.0);
    float _3001 = exp2(_2995);
    float _3003 = _3001 * _2999;
    float _3005 = _2989 * _3003;
    float _3007 = _3005 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3009 = _3005 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3011 = _3005 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_98.x = _3007;
    out.m_98.y = _3009;
    out.m_98.z = _3011;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2783 = false;
    bool _1658 = false;
    bool _337 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _114 = in.m_58.w;
    float _116 = trunc(_114);
    int _119 = int(_116);
    bool _123 = _119 >= 1;
    float _125 = 0.0;
    if (!_123)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _127 = _125;
    float _129 = _127;
    if (!_123)
    {
        out.m_61.x = 0.0;
    }
    int _131 = 0;
    if (!_123)
    {
        float _133 = _127 * 5.0;
        _131 = as_type<int>(_133);
    }
    int _135 = _131;
    int _137 = _135;
    if (!_123)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3068 = as_type<float>(_135);
        out.gl_Position.z = _3068;
    }
    if (!_123)
    {
        return out;
    }
    float _139 = in.m_63.w;
    bool _141 = _139 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _143 = isnan(_139);
    bool _145 = _141 || _143;
    bool _147 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _149 = _145 || _147;
    float _151 = -_139;
    float _153 = _151 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_149)
    {
        float _155 = float(_119);
        _129 = _155;
    }
    float _157 = _129;
    bool _159 = _153 >= _157;
    bool _161 = !_149;
    bool _163 = _159 || _161;
    float _165 = _157;
    if (_163)
    {
        _165 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _167 = _165;
    if (_163)
    {
        out.m_61.x = 0.0;
    }
    if (_163)
    {
        float _169 = _167 * 5.0;
        _137 = as_type<int>(_169);
    }
    int _171 = _137;
    if (_163)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3137 = as_type<float>(_171);
        out.gl_Position.z = _3137;
    }
    if (_163)
    {
        return out;
    }
    float _173 = as_type<float>(int(gl_VertexIndex));
    float _175 = in.m_68.w;
    bool _177 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _179 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _181 = _177 || _179;
    bool _183 = isnan(1.0);
    bool _185 = _181 || _183;
    float _187 = in.m_63.x;
    float _189 = in.m_63.y;
    float _191 = in.m_63.z;
    float _193 = in.m_58.x;
    float _195 = in.m_58.y;
    float _197 = in.m_58.z;
    int _199 = as_type<int>(_173) & 1;
    bool _201 = _199 != 0;
    int _203 = as_type<int>(_173) & 2;
    bool _205 = _203 != 0;
    float _207 = _153 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _209 = 0.0;
    float _211 = _207;
    if (!_185)
    {
        float _213 = _207 * _207;
        float _215 = _213 * 0.5;
        _209 = _215;
    }
    float _217 = _209;
    bool _219 = !_201;
    float _221 = _219 ? (-0.5) : 0.5;
    bool _223 = !_205;
    float _225 = _223 ? (-0.5) : 0.5;
    float _227 = _217;
    if (!_185)
    {
        float _229 = _217 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _227 = _229;
    }
    float _231 = _227;
    bool _233 = !_185;
    float _235 = _231;
    if (!_233)
    {
        float _237 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _239 = log2(_237);
        float _241 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _243 = _241 + 1.0;
        float _245 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _247 = _207 * _239;
        float _249 = exp2(_247);
        float _251 = _245 * 0.693147182464599609375;
        float _253 = 1.0 / _251;
        float _255 = 1.0 / _243;
        float _257 = _249 + (-1.0);
        float _259 = -_257;
        float _261 = fma(_259, _253, _207);
        float _263 = _261 * _255;
        float _265 = _263 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _235 = _265;
    }
    float _267 = _235;
    bool _269 = !_185;
    if (!_269)
    {
        float _271 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _273 = log2(_271);
        float _275 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _277 = _275 + 1.0;
        float _279 = 1.0 / _277;
        float _281 = _207 * _273;
        float _283 = exp2(_281);
        float _285 = -_283;
        float _287 = _285 + 1.0;
        float _289 = _287 * _279;
        _211 = _289;
    }
    float _291 = _211;
    bool _293 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _295 = _267 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _297 = _267 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _299 = _267 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _301 = fma(_291, _187, _295);
    float _303 = fma(_291, _189, _297);
    float _305 = fma(_291, _191, _299);
    float _307 = fma(_301, _175, _193);
    float _309 = fma(_303, _175, _195);
    float _311 = fma(_305, _175, _197);
    bool _313 = !_293;
    float _333;
    float _335;
    if (!_313)
    {
        float _315 = in.m_70.x;
        float _317 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _319 = _315 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _321 = fma(_319, (*spvDescriptorSet0.vp_c9)._m0[12].x, _153);
        float _323 = _321 * _317;
        float _325 = float(_119);
        float _327 = floor(_323);
        float _329 = -_327;
        float _331 = _323 + _329;
        _333 = _325;
        _335 = _331;
        _337 = true;
    }
    else
    {
        float _339 = float(_119);
        float _341 = 1.0 / _339;
        float _343 = _153 * _341;
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
    out.m_72.x = (*spvDescriptorSet0.vp_c8)._m0[24].x;
    out.m_72.y = (*spvDescriptorSet0.vp_c8)._m0[25].x;
    out.m_72.z = (*spvDescriptorSet0.vp_c8)._m0[26].x;
    float _357 = float(_351);
    float _359 = 1.0 / _357;
    float _361 = float(uint(_355));
    int _363 = ~_355;
    int _365 = _363 + 1;
    int _367 = ~_355;
    int _369 = _367 + 1;
    float _371 = 1.0 / _361;
    float _373 = _153 * _359;
    float _375 = trunc(_373);
    int _377 = int(_375);
    int _379 = as_type<int>(_371) + (-2);
    float _381 = float(uint(_377));
    float _383 = as_type<float>(_379) * _381;
    float _385 = in.m_70.x;
    float _387 = in.m_70.y;
    float _389 = in.m_70.z;
    float _391 = in.m_70.w;
    float _393 = trunc(_383);
    float _395 = precise::max(_393, 0.0);
    uint _398 = uint(_395);
    float _400 = float(_355);
    int _402 = _365 * int(_398);
    int _404 = _402 + _377;
    float _406 = float(_377);
    float _408 = float(uint(_404));
    bool _410 = _406 >= _400;
    bool _412 = isnan(_406);
    bool _414 = _410 || _412;
    bool _416 = isnan(_400);
    bool _418 = _414 || _416;
    float _420 = float(_418);
    float _422 = as_type<float>(_379) * _408;
    int _424 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _426 = _424 != 0;
    float _428 = trunc(_422);
    float _430 = precise::max(_428, 0.0);
    uint _432 = uint(_430);
    bool _434 = !_426;
    float _436 = _434 ? 7.345489978790283203125 : 1.0;
    float _438 = _436 * _385;
    float _440 = trunc(_420);
    int _442 = int(_440);
    int _444 = int(_398) + int(_432);
    float _446 = floor(_438);
    int _448 = _369 * _444;
    int _450 = _448 + _377;
    bool _452 = uint(_450) >= uint(_355);
    float _454 = 1.0 / _345;
    bool _456 = !_452;
    int _458 = _456 ? 0 : (-1);
    float _460 = -_446;
    float _462 = _438 + _460;
    bool _464 = _355 == 0;
    int _466 = ~_444;
    int _468 = _466 + _458;
    int _470 = _468 + 1;
    float _472 = _462 * _400;
    float _474 = _153 * _400;
    int _476 = ~_442;
    int _478 = _476 + 1;
    int _480 = _478 + 1;
    int _482 = _355 * _470;
    int _484 = _482 + _377;
    int _486 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _488 = _486 != 0;
    int _490 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _492 = _490 != 0;
    int _494 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _496 = _494 != 0;
    float _498 = trunc(_472);
    int _500 = int(_498);
    int _502 = _355 + (-1);
    bool _504 = !_464;
    int _506 = _504 ? _484 : (-1);
    float _508 = _474 * _454;
    int _510 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _512 = _510 != 0;
    int _514 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _516 = _514 != 0;
    int _518 = _506 * _480;
    bool _520 = !_492;
    int _522 = _520 ? 0 : 1;
    float _524 = trunc(_508);
    int _526 = int(_524);
    bool _528 = !_512;
    int _530 = _528 ? 0 : 1;
    int _532 = _442 * _502;
    int _534 = _532 + _518;
    bool _536 = !_488;
    int _538 = _536 ? 0 : 1;
    int _540 = abs(_522);
    int _542 = abs(_530);
    bool _544 = !_496;
    int _546 = _544 ? 0 : 1;
    int _548 = abs(_538);
    int _550 = _500 * _542;
    int _552 = _550 + _377;
    bool _554 = !_516;
    int _556 = _554 ? 0 : 1;
    int _558 = abs(_546);
    int _560 = _534 * _540;
    int _562 = abs(_556);
    int _564 = _526 * _548;
    int _566 = _564 + _560;
    float _568 = float(uint(_552));
    int _570 = _552 * _558;
    int _572 = _570 + _566;
    int _574 = ~_355;
    int _576 = _574 + 1;
    int _578 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _580 = _578 != 0;
    int _582 = _500 * _562;
    int _584 = _582 + _572;
    float _586 = as_type<float>(_379) * _568;
    float _588 = float(uint(_584));
    float _590 = trunc(_586);
    float _592 = precise::max(_590, 0.0);
    uint _594 = uint(_592);
    float _596 = as_type<float>(_379) * _588;
    float _598 = trunc(_596);
    float _600 = precise::max(_598, 0.0);
    uint _602 = uint(_600);
    int _604 = ~_355;
    int _606 = _604 + 1;
    int _608 = _606 * int(_594);
    int _610 = _608 + _552;
    int _612 = _576 * int(_602);
    int _614 = _612 + _584;
    float _616 = float(uint(_610));
    float _618 = float(uint(_614));
    int _620 = ~_355;
    int _622 = _620 + 1;
    float _624 = as_type<float>(_379) * _618;
    float _626 = as_type<float>(_379) * _616;
    float _628 = in.m_74.x;
    float _630 = in.m_74.y;
    float _632 = in.m_74.z;
    float _634 = trunc(_624);
    float _636 = precise::max(_634, 0.0);
    uint _638 = uint(_636);
    int _640 = int(_602) + int(_638);
    float _642 = trunc(_626);
    float _644 = precise::max(_642, 0.0);
    uint _646 = uint(_644);
    int _648 = _622 * _640;
    int _650 = _648 + _584;
    bool _652 = uint(_650) >= uint(_355);
    bool _654 = !_652;
    int _656 = _654 ? 0 : (-1);
    int _658 = ~_640;
    int _660 = _658 + _656;
    int _662 = _660 + 1;
    int _664 = int(_594) + int(_646);
    float _666 = in.m_76.x;
    float _668 = in.m_76.y;
    float _670 = in.m_76.z;
    int _672 = _355 * _662;
    int _674 = _672 + _584;
    float _676 = in.m_78.x;
    float _678 = in.m_78.y;
    float _680 = in.m_78.z;
    bool _682 = !_464;
    int _684 = _682 ? _674 : (-1);
    int _686 = ~_355;
    int _688 = _686 + 1;
    int _690 = _684 & 3;
    bool _692 = _690 != 0;
    int _694 = _684 & 3;
    bool _696 = _694 != 0;
    bool _698 = uint(_690) > 1u;
    bool _700 = _690 != 3;
    int _702 = _696 ? 0 : 1;
    int _704 = _688 * _664;
    int _706 = _704 + _552;
    bool _708 = uint(_690) >= 2u;
    bool _710 = _389 > 0.5;
    int _712 = ~_702;
    int _714 = _712 + 1;
    int _716 = _714 + 1;
    int _718 = _708 ? 0 : 1;
    float _720 = _309 * _678;
    int _722 = _716;
    if (!_698)
    {
        int _724 = ~_702;
        int _726 = _724 + 1;
        _722 = _726;
    }
    int _728 = _722;
    bool _730 = uint(_706) >= uint(_355);
    bool _732 = _690 != 3;
    bool _734 = !_580;
    int _736 = _734 ? 0 : 1;
    bool _738 = _391 > 0.5;
    int _740 = ~_718;
    int _742 = _740 + 1;
    int _744 = _742 + 1;
    int _746 = _744;
    if (_700)
    {
        int _748 = ~_718;
        int _750 = _748 + 1;
        _746 = _750;
    }
    int _752 = _746;
    bool _754 = !_692;
    int _756 = _754 ? 0 : 1;
    bool _758 = !_732;
    int _760 = _758 ? 0 : (-1);
    bool _762 = !_730;
    int _764 = _762 ? 0 : (-1);
    int _766 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _768 = _766 != 0;
    int _770 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _772 = _770 != 0;
    int _774 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _776 = _774 != 0;
    int _778 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _780 = _778 != 0;
    float _782 = _309 * _630;
    float _784 = _309 * _668;
    float _786 = fma(_307, _628, _782);
    int _788 = ~_664;
    int _790 = _788 + _764;
    int _792 = _790 + 1;
    float _794 = fma(_307, _666, _784);
    float _796 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _798 = _385 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _800 = fma(_307, _676, _720);
    float _802 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _804 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _802;
    float _806 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _808 = _806 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _810 = -_796;
    float _812 = fma(_798, 2.0, _810);
    float _814 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _816 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _814;
    int _818 = _684 >> 31;
    int _820 = _355 * _792;
    int _822 = _820 + _552;
    float _824 = 1.0 / _804;
    float _826 = fma(_311, _632, _786);
    bool _828 = !_464;
    int _830 = _828 ? _822 : (-1);
    bool _832 = _385 > 0.5;
    float _834 = 1.0 / _808;
    int _836 = _818 & 3;
    float _838 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _840 = _684 + _836;
    float _842 = fma(_385, (*spvDescriptorSet0.vp_c9)._m0[78].z, _838);
    float _844 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _846 = _347 + _844;
    float _848 = 1.0 / _816;
    int _850 = _840 >> 2;
    float _852 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _854 = _387 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _856 = _347 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _858 = isnan(_347);
    bool _860 = _856 || _858;
    bool _862 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _864 = _860 || _862;
    float _866 = float(_864);
    int _868 = _850 << 4;
    int _870 = _868 + 368;
    float _872 = fma(_854, -2.0, _852);
    float _874 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _876 = _347 + _874;
    float _878 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _880 = _347 + _878;
    int _882 = _870 + 8;
    uint _884 = uint(int(uint(_882) >> uint(2)));
    uint _886 = uint(int(uint(int(_884)) >> uint(2)));
    int _888 = int(_884) & 3;
    float _890 = (*spvDescriptorSet0.vp_c9)._m0[int(_886)][_888];
    int _892 = int(_884) + 1;
    uint _894 = uint(int(uint(_892) >> uint(2)));
    int _896 = _892 & 3;
    float _898 = (*spvDescriptorSet0.vp_c9)._m0[int(_894)][_896];
    bool _900 = _347 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _902 = isnan(_347);
    bool _904 = _900 || _902;
    bool _906 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _908 = _904 || _906;
    float _910 = float(_908);
    float _912 = _876 * _824;
    float _914 = _880 * _834;
    float _916 = -_866;
    float _918 = _916 + 1.0;
    float _920 = _846 * _848;
    float _922 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _924 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _922;
    uint _926 = uint(int(uint(_870) >> uint(2)));
    uint _928 = uint(int(uint(int(_926)) >> uint(2)));
    int _930 = int(_926) & 3;
    float _932 = (*spvDescriptorSet0.vp_c9)._m0[int(_928)][_930];
    int _934 = int(_926) + 1;
    uint _936 = uint(int(uint(_934) >> uint(2)));
    int _938 = _934 & 3;
    float _940 = (*spvDescriptorSet0.vp_c9)._m0[int(_936)][_938];
    float _942 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _944 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _942;
    bool _946 = _347 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _948 = isnan(_347);
    bool _950 = _946 || _948;
    bool _952 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _954 = _950 || _952;
    float _956 = float(_954);
    float _958 = fma(_924, _912, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _960 = fma(_944, _912, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _962 = _347 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _964 = isnan(_347);
    bool _966 = _962 || _964;
    bool _968 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _970 = _966 || _968;
    float _972 = float(_970);
    float _974 = _910 * _918;
    float _976 = -_910;
    float _978 = _976 + 1.0;
    float _980 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _982 = _980 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _984 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _986 = _984 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _988 = -_972;
    float _990 = _988 + 1.0;
    float _992 = _956 * _978;
    float _994 = -_956;
    float _996 = _994 + 1.0;
    float _998 = fma(_982, _914, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _1000 = fma(_986, _914, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    int _1002 = abs(_756);
    float _1004 = _972 * _996;
    float _1006 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1008 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _1006;
    float _1010 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1012 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _1010;
    float _1014 = _960 * _1004;
    float _1016 = _958 * _1004;
    float _1018 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1020 = int(_1018);
    float _1022 = fma(_1012, _920, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _1024 = fma(_990, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1014);
    float _1026 = fma(_990, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1016);
    int _1028 = abs(_728);
    float _1030 = fma(_1008, _920, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _1032 = fma(_998, _992, _1024);
    float _1034 = fma(_1000, _992, _1026);
    int _1036 = abs(_752);
    float _1038 = in.m_68.x;
    float _1040 = in.m_68.y;
    int _1042 = ~_1028;
    int _1044 = _1042 + 1;
    int _1046 = _1044 + 1;
    float _1048 = fma(_1030, _974, _1032);
    float _1050 = fma(_1022, _974, _1034);
    int _1052 = ~_1002;
    int _1054 = _1052 + 1;
    int _1056 = _1054 + 1;
    float _1058 = fma(_866, (*spvDescriptorSet0.vp_c9)._m0[146].x, _1048);
    int _1060 = abs(_1020);
    float _1062 = fma(_866, (*spvDescriptorSet0.vp_c9)._m0[146].y, _1050);
    float _1064 = -_221;
    int _1066 = _710 ? as_type<int>(_1064) : as_type<int>(_221);
    bool _1068 = _387 > 0.5;
    int _1070 = _1046 * as_type<int>(_940);
    int _1072 = abs(_760);
    int _1074 = ~_1036;
    int _1076 = _1074 + 1;
    int _1078 = _1076 + 1;
    int _1080 = _1056 * as_type<int>(_932);
    int _1082 = _1080 + _1070;
    float _1084 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _225);
    int _1086 = abs(_736);
    int _1088 = _1078 * as_type<int>(_890);
    int _1090 = _1088 + _1082;
    int _1092 = ~_1072;
    int _1094 = _1092 + 1;
    int _1096 = _1094 + 1;
    float _1098 = _1058 * _1038;
    float _1100 = float(uint(_1060));
    float _1102 = _1062 * _1040;
    int _1104 = ~_1086;
    int _1106 = _1104 + 1;
    int _1108 = _1106 + 1;
    int _1110 = _1096 * as_type<int>(_898);
    int _1112 = _1110 + _1090;
    float _1114 = 1.0 / _1100;
    float _1116 = float(uint(_1020));
    float _1118 = _1098 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1120 = _1112 * _1108;
    float _1122 = _1102 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1124 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _221);
    float _1126 = _826 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1128 = _830 * _1086;
    int _1130 = _1128 + _1120;
    float _1132 = 1.0 / _1116;
    float _1134 = fma(_311, _670, _794);
    float _1136 = _1122 * _1084;
    float _1138 = _1118 * _1124;
    int _1140 = abs(_1130);
    float _1142 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1144 = _1136 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1146 = _1136 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _1148 = as_type<int>(_1114) + (-2);
    float _1150 = _1134 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1152 = float(uint(_1140));
    float _1154 = fma(_1138, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1144);
    float _1156 = float(uint(_1130));
    float _1158 = fma(_1138, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1146);
    float _1160 = as_type<float>(_1148) * _1152;
    int _1162 = as_type<int>(_1132) + (-2);
    float _1164 = fma(_1142, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1154);
    float _1166 = fma(_1142, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1158);
    int _1168 = ~_1060;
    int _1170 = _1168 + 1;
    float _1172 = fma(_311, _680, _800);
    float _1174 = trunc(_1160);
    float _1176 = precise::max(_1174, 0.0);
    uint _1178 = uint(_1176);
    float _1180 = as_type<float>(_1162) * _1156;
    float _1182 = _1164 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1184 = _1166 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1186 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1188 = _1136 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1190 = _1126 + _1182;
    float _1192 = _1150 + _1184;
    float _1194 = trunc(_1180);
    float _1196 = precise::max(_1194, 0.0);
    uint _1198 = uint(_1196);
    float _1200 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1202 = _1190 + _1200;
    float _1204 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1206 = _1192 + _1204;
    int _1208 = ~_1020;
    int _1210 = _1208 + 1;
    float _1212 = fma(_1138, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1188);
    float _1214 = _1202 * _1202;
    float _1216 = _1206 * _1206;
    int _1218 = _1170 * int(_1178);
    int _1220 = _1218 + _1140;
    float _1222 = -_221;
    int _1224 = _832 ? as_type<int>(_1222) : as_type<int>(_221);
    float _1226 = fma(_387, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1186);
    float _1228 = _1214 + _1216;
    float _1230 = -_225;
    int _1232 = _1068 ? as_type<int>(_1230) : as_type<int>(_225);
    float _1234 = _225 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1236 = float(uint(_1220));
    float _1238 = sqrt(_1228);
    int _1240 = _1210 * int(_1198);
    int _1242 = _1240 + _1130;
    float _1244 = _221 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _1246 = !_768;
    float _1248 = _1246 ? _221 : as_type<float>(_1066);
    float _1250 = as_type<float>(_1148) * _1236;
    bool _1252 = !_776;
    float _1254 = _1252 ? _221 : as_type<float>(_1224);
    float _1256 = fma(_1142, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1212);
    float _1258 = float(uint(_1242));
    float _1260 = _1234 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _1262 = !_780;
    float _1264 = _1262 ? _225 : as_type<float>(_1232);
    float _1266 = trunc(_1250);
    float _1268 = precise::max(_1266, 0.0);
    uint _1270 = uint(_1268);
    float _1272 = _1234 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1274 = as_type<float>(_1162) * _1258;
    float _1276 = -_225;
    int _1278 = _738 ? as_type<int>(_1276) : as_type<int>(_225);
    float _1280 = _1234 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1282 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1260);
    bool _1284 = _1238 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1286 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1272);
    float _1288 = trunc(_1274);
    float _1290 = precise::max(_1288, 0.0);
    uint _1292 = uint(_1290);
    bool _1294 = !_772;
    float _1296 = _1294 ? _225 : as_type<float>(_1278);
    float _1298 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1280);
    int _1300 = ~_1060;
    int _1302 = _1300 + 1;
    int _1304 = ~_1020;
    int _1306 = _1304 + 1;
    float _1308 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1310 = int(_1178) + int(_1270);
    float _1312 = _1172 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1314 = _1256 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1316 = _1172;
    float _1318 = _1314;
    float _1320 = _1190;
    float _1322 = _1214;
    float _1324 = _1216;
    float _1326 = _1192;
    float _1328 = _1150;
    float _1330 = _1126;
    if (!_1284)
    {
        _1316 = _1192;
    }
    float _1332 = _1316;
    int _1334 = _1302 * _1310;
    int _1336 = _1334 + _1140;
    float _1338 = _1312 + _1314;
    int _1340 = int(_1198) + int(_1292);
    float _1342 = _1332;
    if (!_1284)
    {
        _1318 = _1190;
    }
    float _1344 = _1318;
    float _1346 = _1344;
    if (!_1284)
    {
        _1320 = _1338;
    }
    float _1348 = _1320;
    int _1350 = _1306 * _1340;
    int _1352 = _1350 + _1130;
    bool _1354 = !_1284;
    float _1356 = _1348;
    if (!_1354)
    {
        float _1358 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1360 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1362 = _1238 + _1360;
        float _1364 = _1338 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1366 = rsqrt(_1228);
        float _1368 = _1362 * _1358;
        float _1370 = _1368 * 0.15915493667125701904296875;
        float _1372 = _1370 * 6.283185482025146484375;
        float _1374 = sin(_1372);
        float _1376 = _1370 * 6.283185482025146484375;
        float _1378 = cos(_1376);
        float _1380 = fma(_1374, _1364, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1382 = _1366 * _1380;
        float _1384 = _1378 + (-1.0);
        float _1386 = fma(_1202, _1382, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1388 = fma(_1206, _1382, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1390 = _1384 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1392 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1394 = _1386 + _1392;
        float _1396 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1398 = _1388 + _1396;
        float _1400 = fma(_1338, _1378, _1390);
        float _1402 = _1394 * _1394;
        float _1404 = _1398 * _1398;
        _1356 = _1400;
        _1322 = _1402;
        _1324 = _1404;
        _1346 = _1386;
        _1342 = _1388;
        _1326 = _1382;
    }
    float _1406 = _1356;
    float _1408 = _1322;
    float _1410 = _1324;
    float _1412 = _1346;
    float _1414 = _1342;
    float _1416 = _1326;
    bool _1418 = uint(_1336) >= uint(_1060);
    float _1420 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1422 = _1130 ^ _1020;
    float _1424 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1426 = _1406 + _1424;
    bool _1428 = uint(_1352) >= uint(_1020);
    float _1430 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[76].y, _872);
    bool _1432 = !_1418;
    int _1434 = _1432 ? 0 : (-1);
    float _1436 = fma(_1426, _1426, _1408);
    uint _1438 = uint(int(uint(_1422) >> uint(31)));
    float _1440 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1442 = !_1428;
    int _1444 = _1442 ? 0 : (-1);
    float _1446 = -_153;
    float _1448 = fma(_1446, (*spvDescriptorSet0.vp_c9)._m0[76].x, _812);
    int _1450 = ~_1434;
    int _1452 = _1310 + _1450;
    int _1454 = _1452 + 1;
    float _1456 = fma(_1234, _1234, 1.0);
    int _1458 = ~int(_1438);
    int _1460 = _1458 + 1;
    float _1462 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1226);
    int _1464 = ~_1340;
    int _1466 = _1464 + _1444;
    int _1468 = _1466 + 1;
    float _1470 = _1420 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _1472 = _1454 ^ _1460;
    float _1474 = _1248 + 0.5;
    bool _1476 = _1020 == 0;
    float _1478 = -_1296;
    float _1480 = _1478 + 0.5;
    bool _1482 = _1020 == 0;
    int _1484 = _1020 * _1468;
    int _1486 = _1484 + _1130;
    int _1488 = ~_1460;
    int _1490 = _1488 + _1472;
    int _1492 = _1490 + 1;
    float _1494 = rsqrt(_1456);
    float _1496 = _1308 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1498 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[77].z, _842);
    bool _1500 = !_1482;
    int _1502 = _1500 ? _1492 : (-1);
    float _1504 = _1264 + (-0.5);
    bool _1506 = !_1476;
    int _1508 = _1506 ? _1486 : (-1);
    float _1510 = _1480 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1512 = float(_1502);
    float _1514 = -_1498;
    float _1516 = _1514 + 1.0;
    float _1518 = float(_1508);
    float _1520 = -_1462;
    float _1522 = _1520 + 1.0;
    float _1524 = _1436 + _1410;
    float _1526 = -_1430;
    float _1528 = fma(_1470, _1512, _1526);
    float _1530 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1532 = fma(_1496, _1518, _1448);
    float _1534 = _1234 * _1494;
    float _1536 = _1254 + 0.5;
    float _1538 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1540 = -(*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _1542 = _1534 * _1540;
    float _1544 = fma(_1496, _1536, _1532);
    float _1546 = -_1470;
    float _1548 = fma(_1546, _1504, _1528);
    float _1550 = -(*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _1552 = _1534 * _1550;
    float _1554 = fma(_1494, (*spvDescriptorSet0.vp_c8)._m0[24].y, _1542);
    float _1556 = _1474 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1558 = -(*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _1560 = _1534 * _1558;
    float _1562 = fma(_1494, (*spvDescriptorSet0.vp_c8)._m0[25].y, _1552);
    float _1564 = fma(_1264, _1522, _1548);
    float _1566 = _1556 * _1440;
    float _1568 = fma(_1494, (*spvDescriptorSet0.vp_c8)._m0[26].y, _1560);
    float _1570 = _1510 * _1530;
    float _1572 = -_1516;
    float _1574 = fma(_1254, _1572, _1544);
    float _1576 = sqrt(_1524);
    float _1578 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1580 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1582 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1584 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1586 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1588 = _1580 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1590 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1592 = _1538 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1594 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1596 = _1582 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1598 = _1584 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1600 = _1586 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1602 = _1590 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1604 = _1282 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _1606 = _1286 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _1608 = _1298 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    out.m_80.x = _1588;
    out.m_80.y = _1592;
    out.m_80.z = _1596;
    out.m_80.w = _1578;
    bool _1610 = _1576 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1612 = isnan(_1576);
    bool _1614 = _1610 || _1612;
    bool _1616 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1618 = _1614 || _1616;
    out.m_82.x = _1598;
    out.m_82.y = _1600;
    out.m_82.z = _1602;
    out.m_82.w = _1594;
    out.m_84.x = _1554;
    out.m_84.y = _1562;
    out.m_84.z = _1568;
    out.m_86.x = _1574;
    out.m_86.y = _1564;
    out.m_86.z = _1566;
    out.m_86.w = _1570;
    float _1620 = _1556;
    float _1622 = _1416;
    if (!_1618)
    {
        _1620 = 1.0;
    }
    float _1624 = _1620;
    out.m_88.x = _1604;
    out.m_88.y = _1606;
    out.m_88.z = _1608;
    bool _1626 = !_1618;
    float _1628 = _1624;
    if (!_1626)
    {
        bool _1630 = _1576 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1632 = isnan(_1576);
        bool _1634 = _1630 || _1632;
        bool _1636 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1638 = _1634 || _1636;
        if (!_1638)
        {
            float _1640 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1642 = _1576 + _1640;
            float _1644 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1646 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1644;
            float _1648 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1650 = _1648 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1652 = 1.0 / _1646;
            float _1654 = _1642 * _1652;
            float _1656 = fma(_1654, _1650, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1628 = _1656;
            _1658 = true;
        }
        else
        {
            bool _1660 = _1576 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1662 = isnan(_1576);
            bool _1664 = _1660 || _1662;
            bool _1666 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1668 = _1664 || _1666;
            if (!_1668)
            {
                float _1670 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1672 = _1576 + _1670;
                float _1674 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1676 = _1674 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1678 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1680 = _1678 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1682 = 1.0 / _1676;
                float _1684 = _1672 * _1682;
                float _1686 = fma(_1684, _1680, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1628 = _1686;
                _1658 = true;
            }
            else
            {
                _1628 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1658 = false;
    float _1688 = _1628;
    float _1690 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1692 = _1406 + _1690;
    float _1694 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1696 = _1412 + _1694;
    float _1698 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1700 = _1414 + _1698;
    float _1702 = fma(_1692, _1688, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1704 = fma(_1696, _1688, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1706 = fma(_1700, _1688, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1708 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1710 = _1702 + _1708;
    float _1712 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1714 = _1704 + _1712;
    float _1716 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1718 = _1706 + _1716;
    float _1720 = _1710 * _1710;
    float _1722 = _1702 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1724 = fma(_1714, _1714, _1720);
    float _1726 = fma(_1704, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1722);
    float _1728 = fma(_1718, _1718, _1724);
    float _1730 = _1312 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1732 = fma(_1150, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1734 = rsqrt(_1728);
    float _1736 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1730);
    float _1738 = fma(_1150, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1736);
    float _1740 = sqrt(_1728);
    float _1742 = _1738 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1744 = _1312 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1746 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1744);
    float _1748 = _1734 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1750 = 1.0 / _1742;
    float _1752 = fma(_1150, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1746);
    float _1754 = _1714 * _1748;
    float _1756 = _1718 * _1748;
    float _1758 = _1752 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1760 = _1754 * _1754;
    float _1762 = _1756 * _1756;
    float _1764 = _1758 + _1742;
    float _1766 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _1768 = floor(_1732);
    float _1770 = _1760 + _1762;
    float _1772 = _1312 + _1766;
    float _1774 = _1764 * _1750;
    float _1776 = _1774 * 0.5;
    float _1778 = _1772 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1780 = sqrt(_1770);
    float _1782 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1784 = fma(_1776, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1782);
    float _1786 = _1772 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1788 = fma(_1126, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1778);
    float _1790 = fma(_1126, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1786);
    float _1792 = fma(_1150, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1788);
    float _1794 = 1.0 / _1784;
    float _1796 = -_1768;
    float _1798 = _1732 + _1796;
    float _1800 = fma(_1150, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1790);
    float _1802 = _1792 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1804 = _1800 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    bool _1806 = _1780 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1808 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1810 = _1780 + _1808;
    float _1812 = trunc(_1802);
    int _1814 = int(_1812);
    float _1816 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1818 = _1794 * _1816;
    float _1820 = trunc(_1804);
    int _1822 = int(_1820);
    bool _1824 = _1818 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1826 = fma(_1126, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    bool _1828 = _1818 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1830 = _1598;
    int _1832 = 2;
    float _1834 = _1810;
    float _1836 = _1754;
    float _1838 = _1756;
    float _1840 = _1726;
    if (_1806)
    {
        float _1842 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1830 = _1842;
    }
    float _1844 = _1830;
    int _1846 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1848 = _1814 + _1846;
    int _1850 = _1848 + 1;
    if (!_1824)
    {
        _1832 = 1;
    }
    int _1852 = _1832;
    float _1854 = floor(_1826);
    int _1856 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1858 = _1822 + _1856;
    int _1860 = _1858 + 1;
    int _1862 = _1852;
    if (_1806)
    {
        float _1864 = _1810 * _1844;
        _1834 = _1864;
    }
    float _1866 = _1834;
    float _1868 = 0.0;
    if (_1806)
    {
        float _1870 = _1866 * 0.15915493667125701904296875;
        _1868 = _1870;
    }
    float _1872 = _1868;
    float _1874 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1876 = _1792;
    if (_1806)
    {
        float _1878 = _1872 * 6.283185482025146484375;
        float _1880 = sin(_1878);
        _1876 = _1880;
    }
    float _1882 = _1876;
    float _1884 = -_1854;
    float _1886 = _1826 + _1884;
    float _1888 = precise::max(0.0, _1874);
    bool _1890 = !_1824;
    int _1892 = _1890 ? 0 : 1;
    float _1894 = -_1748;
    float _1896 = -_1888;
    float _1898 = fma(_1710, _1894, _1896);
    float _1900 = as_type<float>(_1892);
    float _1902 = _1898;
    if (!_1828)
    {
        _1862 = _1892;
    }
    int _1904 = _1862;
    float _1906 = _1888;
    if (_1806)
    {
        float _1908 = rsqrt(_1770);
        _1906 = _1908;
    }
    float _1910 = _1906;
    bool _1912 = _1850 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    if (_1806)
    {
        float _1914 = _1898 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1900 = _1914;
    }
    float _1916 = _1900;
    int _1918 = _1904 << 6;
    int _1920 = _1850 | _1860;
    int _1922 = _1918 + 64;
    uint _1924 = uint(int(uint(_1922) >> uint(2)));
    uint _1926 = uint(int(uint(int(_1924)) >> uint(2)));
    int _1928 = int(_1924) & 3;
    float _1930 = (*spvDescriptorSet0.vp_c15)._m0[int(_1926)][_1928];
    int _1932 = int(_1924) + 1;
    uint _1934 = uint(int(uint(_1932) >> uint(2)));
    int _1936 = _1932 & 3;
    float _1938 = (*spvDescriptorSet0.vp_c15)._m0[int(_1934)][_1936];
    float _1940 = _1872;
    if (_1806)
    {
        float _1942 = _1872 * 6.283185482025146484375;
        float _1944 = cos(_1942);
        _1940 = _1944;
    }
    float _1946 = _1940;
    float _1948 = _1882;
    if (_1806)
    {
        float _1950 = fma(_1882, _1916, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1948 = _1950;
    }
    float _1952 = _1948;
    bool _1954 = _1920 < 0;
    bool _1956 = _1954 || _1912;
    bool _1958 = _1860 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1960 = _1958 || _1956;
    int _1962 = _1918 + 96;
    uint _1964 = uint(int(uint(_1962) >> uint(2)));
    uint _1966 = uint(int(uint(int(_1964)) >> uint(2)));
    int _1968 = int(_1964) & 3;
    float _1970 = (*spvDescriptorSet0.vp_c15)._m0[int(_1966)][_1968];
    int _1972 = int(_1964) + 1;
    uint _1974 = uint(int(uint(_1972) >> uint(2)));
    int _1976 = _1972 & 3;
    float _1978 = (*spvDescriptorSet0.vp_c15)._m0[int(_1974)][_1976];
    float _1980 = 0.0;
    if (_1806)
    {
        float _1982 = _1910 * _1952;
        _1980 = _1982;
    }
    float _1984 = _1980;
    float _1986 = _1984;
    if (_1806)
    {
        float _1988 = _1754 * _1984;
        _1836 = _1988;
    }
    float _1990 = _1836;
    if (_1806)
    {
        float _1992 = _1756 * _1984;
        _1838 = _1992;
    }
    float _1994 = _1838;
    if (!_1806)
    {
        _1986 = _1762;
    }
    float _1996 = _1986;
    int _1998 = _1918 + 104;
    uint _2000 = uint(int(uint(_1998) >> uint(2)));
    uint _2002 = uint(int(uint(int(_2000)) >> uint(2)));
    int _2004 = int(_2000) & 3;
    float _2006 = (*spvDescriptorSet0.vp_c15)._m0[int(_2002)][_2004];
    int _2008 = int(_2000) + 1;
    uint _2010 = uint(int(uint(_2008) >> uint(2)));
    int _2012 = _2008 & 3;
    float _2014 = (*spvDescriptorSet0.vp_c15)._m0[int(_2010)][_2012];
    float _2016 = _1996;
    if (_1806)
    {
        float _2018 = _1946 + (-1.0);
        _1622 = _2018;
    }
    float _2020 = _1622;
    if (_1806)
    {
        float _2022 = _1994 * _1994;
        _2016 = _2022;
    }
    float _2024 = _2016;
    float _2026 = 0.0;
    if (!_1960)
    {
        float _2028 = floor(_1804);
        _2026 = _2028;
    }
    float _2030 = _2026;
    float _2032 = 0.0;
    if (_1806)
    {
        float _2034 = _2020 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2032 = _2034;
    }
    float _2036 = _2032;
    float _2038 = fma(_1706, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1726);
    if (!_1806)
    {
        _1840 = _1760;
    }
    float _2040 = _1840;
    int _2042 = _1918 + 48;
    uint _2044 = uint(int(uint(_2042) >> uint(2)));
    uint _2046 = uint(int(uint(int(_2044)) >> uint(2)));
    int _2048 = int(_2044) & 3;
    float _2050 = (*spvDescriptorSet0.vp_c15)._m0[int(_2046)][_2048];
    int _2052 = int(_2044) + 1;
    uint _2054 = uint(int(uint(_2052) >> uint(2)));
    int _2056 = _2052 & 3;
    float _2058 = (*spvDescriptorSet0.vp_c15)._m0[int(_2054)][_2056];
    float _2060 = _2040;
    if (_1806)
    {
        float _2062 = fma(_1898, _1946, _2036);
        _1902 = _2062;
    }
    float _2064 = _1902;
    if (_1806)
    {
        float _2066 = _1990 * _1990;
        _2060 = _2066;
    }
    float _2068 = _2060;
    float _2070 = _2038 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2072 = fma(_2064, _2064, _2068);
    int _2074 = _1918 + 56;
    uint _2076 = uint(int(uint(_2074) >> uint(2)));
    uint _2078 = uint(int(uint(int(_2076)) >> uint(2)));
    int _2080 = int(_2076) & 3;
    float _2082 = (*spvDescriptorSet0.vp_c15)._m0[int(_2078)][_2080];
    int _2084 = int(_2076) + 1;
    uint _2086 = uint(int(uint(_2084) >> uint(2)));
    int _2088 = _2084 & 3;
    float _2090 = (*spvDescriptorSet0.vp_c15)._m0[int(_2086)][_2088];
    float _2092 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2094 = _2070 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2096 = _2072 + _2024;
    float _2098 = -_2094;
    float _2100 = fma(_2098, _2092, 1.0);
    int _2102 = as_type<int>(_2094);
    if (!_1960)
    {
        int _2104 = _1860 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _2106 = _2104 + _1850;
        _2102 = _2106;
    }
    int _2108 = _2102;
    int _2110 = _1918 + 80;
    uint _2112 = uint(int(uint(_2110) >> uint(2)));
    uint _2114 = uint(int(uint(int(_2112)) >> uint(2)));
    int _2116 = int(_2112) & 3;
    float _2118 = (*spvDescriptorSet0.vp_c15)._m0[int(_2114)][_2116];
    int _2120 = int(_2112) + 1;
    uint _2122 = uint(int(uint(_2120) >> uint(2)));
    int _2124 = _2120 & 3;
    float _2126 = (*spvDescriptorSet0.vp_c15)._m0[int(_2122)][_2124];
    float _2128 = log2(_2100);
    int _2130 = _1918 + 72;
    uint _2132 = uint(int(uint(_2130) >> uint(2)));
    uint _2134 = uint(int(uint(int(_2132)) >> uint(2)));
    int _2136 = int(_2132) & 3;
    float _2138 = (*spvDescriptorSet0.vp_c15)._m0[int(_2134)][_2136];
    int _2140 = int(_2132) + 1;
    uint _2142 = uint(int(uint(_2140) >> uint(2)));
    int _2144 = _2140 & 3;
    float _2146 = (*spvDescriptorSet0.vp_c15)._m0[int(_2142)][_2144];
    float _2148 = _1772 * _1938;
    float _2150 = rsqrt(_2096);
    float _2152 = fma(_1126, _1930, _2148);
    int _2154 = _1918 + 88;
    uint _2156 = uint(int(uint(_2154) >> uint(2)));
    uint _2158 = uint(int(uint(int(_2156)) >> uint(2)));
    int _2160 = int(_2156) & 3;
    float _2162 = (*spvDescriptorSet0.vp_c15)._m0[int(_2158)][_2160];
    int _2164 = int(_2156) + 1;
    uint _2166 = uint(int(uint(_2164) >> uint(2)));
    int _2168 = _2164 & 3;
    float _2170 = (*spvDescriptorSet0.vp_c15)._m0[int(_2166)][_2168];
    float _2172 = _1772 * _1978;
    float2 _6262 = float2(_1886, _1798);
    float _2174 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6262, float2(0.0), isnan(_6262)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6262, float2(0.0), isnan(_6262)), level(0.0)).x;
    float _2176 = _2128 * 0.693147182464599609375;
    float _2178 = fma(_1126, _1970, _2172);
    float _2180 = _1970;
    if (!_1960)
    {
        float _2182 = floor(_1802);
        _2180 = _2182;
    }
    float _2184 = _2180;
    float _2186 = fma(_1150, _2006, _2178);
    float _2188 = _2150 * _1990;
    float _2190 = _2186 + _2014;
    float _2192 = _2150 * _2064;
    float _2194 = _2150 * _1994;
    float _2196 = _1772 * _2058;
    float _2198 = _2058;
    int _2200 = as_type<int>(_2196);
    float _2202 = _2192;
    if (!_1960)
    {
        float _2204 = -_2030;
        float _2206 = _1804 + _2204;
        _2198 = _2206;
    }
    float _2208 = _2198;
    float _2210 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2212 = fma(_1740, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2210);
    float _2214 = precise::clamp(_2212, 0.0, 1.0);
    float _2216 = 1.0 / _2190;
    float _2218 = _2188 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2220 = fma(_1126, _2050, _2196);
    float _2222 = -_2214;
    float _2224 = _2222 + 1.0;
    if (!_1960)
    {
        int _2226 = _2108 << 2;
        _2200 = _2226;
    }
    int _2228 = _2200;
    float _2230 = -_2218;
    float _2232 = fma(_2192, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2230);
    float _2234 = fma(_1150, _2082, _2220);
    float _2236 = _2176 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2238 = abs(_2224);
    float _2240 = log2(_2238);
    int _2242 = _2228;
    int _2244 = as_type<int>(_2126);
    if (!_1960)
    {
        int _2246 = 12 & _2228;
        _2242 = _2246;
    }
    int _2248 = _2242;
    float _2250 = _2234 + _2090;
    float _2252 = _1702 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2254 = _1772 * _2126;
    int _2256 = as_type<int>(_2254);
    if (!_1960)
    {
        uint _2258 = uint(int(uint(_2108) >> uint(2)));
        _2244 = int(_2258);
    }
    int _2260 = _2244;
    float _2262 = fma(_1704, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2252);
    float _2264 = fma(_1126, _2118, _2254);
    if (!_1960)
    {
        int _2266 = _2260 << 4;
        int _2268 = _2266 + _2248;
        _2256 = _2268;
    }
    int _2270 = _2256;
    float _2272 = fma(_1706, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2262);
    float _2274 = fma(_1150, _2138, _2152);
    float _2276 = -_2194;
    float _2278 = fma(_2276, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2232);
    float _2280 = _1702 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2282 = _2240 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2284 = _2274 + _2146;
    float _2286 = _1702 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2288 = fma(_1704, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2280);
    float _2290 = _2250 * _2216;
    float _2292 = fma(_1150, _2162, _2264);
    float _2294 = fma(_1704, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2286);
    float _2296 = _2284 * _2216;
    float _2298 = _2272 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _2300 = _2290 >= 0.0;
    float _2302 = fma(_1706, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2294);
    float _2304 = exp2(_2282);
    float _2306 = _2298 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _2308 = _2290 <= 1.0;
    bool _2310 = _2308 && _2300;
    float _2312 = _2302 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2314 = fma(_1706, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2288);
    float _2316 = fma(_2278, -0.5, 0.5);
    bool _2318 = _2296 >= 0.0;
    bool _2320 = _2318 && _2310;
    float _2322 = fma(_2312, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2306);
    float _2324 = _2224;
    if (!_1960)
    {
        int _2326 = _2270 + 400;
        uint _2328 = uint(int(uint(_2326) >> uint(2)));
        uint _2330 = uint(int(uint(int(_2328)) >> uint(2)));
        int _2332 = int(_2328) & 3;
        float _2334 = (*spvDescriptorSet0.vp_c15)._m0[int(_2330)][_2332];
        _2324 = _2334;
    }
    float _2336 = _2324;
    float _2338 = _2314 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    bool _2340 = _2296 <= 1.0;
    bool _2342 = _2340 && _2320;
    float _2344 = fma(_2070, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2322);
    float _2346 = sqrt(_2316);
    float _2348 = fma(_2278, 0.5, 0.5);
    float _2350 = _2292 + _2170;
    float _2352 = fma(_2338, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2344);
    float _2354 = _2192 + 1.0;
    float _2356 = fma(_2348, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2358 = _2298 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2360 = _2298 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2362 = -_2192;
    float _2364 = fma(_2304, _2354, _2362);
    float _2366 = 1.0 / _2352;
    float _2368 = fma(_2312, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2358);
    float _2370 = _2354;
    if (_2342)
    {
        float _2372 = float(_1904);
        _2370 = _2372;
    }
    float _2374 = _2370;
    float _2376 = fma(_2312, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2360);
    float _2378 = fma(_2348, _2356, -0.212114393711090087890625);
    float _2380 = fma(_2070, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2368);
    if (!_1960)
    {
        float _2382 = -_2184;
        float _2384 = _1802 + _2382;
        _2202 = _2384;
    }
    float _2386 = _2202;
    float _2388 = fma(_2070, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2376);
    float _2390 = _2374;
    float _2392 = _2386;
    if (_2342)
    {
        float _2394 = rint(_2374);
        float _2396 = precise::max(_2394, 0.0);
        uint _2398 = uint(_2396);
        uint _2400 = clamp(_2398, 0u, 65535u);
        _2390 = as_type<float>(_2400);
    }
    float _2402 = _2390;
    float _2404 = fma(_2348, _2378, 1.570728778839111328125);
    float _2406 = _2346 * 0.636619746685028076171875;
    float _2408 = fma(_2338, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2380);
    float _2410 = fma(_2338, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2388);
    float _2412 = _2350 * _2216;
    float _2414 = -_2404;
    float _2416 = fma(_2406, _2414, 1.0);
    float _2418 = fma(_2364, 0.5, 0.5);
    float _2420 = _2408 * _2366;
    float _2422 = _2410 * _2366;
    float _2424 = fma(_2420, 0.5, 0.5);
    float _2426 = fma(_2422, -0.5, 0.5);
    float _2428 = _2402;
    if (_2342)
    {
        float3 _6698 = float3(_2290, _2296, float(as_type<int>(_2402)));
        float3 _6702 = select(_6698, float3(0.0), isnan(_6698));
        float _2430 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6702.xy, uint(rint(_6702.z)), _2412, level(0.0));
        _2428 = _2430;
    }
    float _2432 = _2428;
    float3 _6712 = float3(_2424, _2426, _2236);
    float _2434 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6712, float3(0.0), isnan(_6712)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6712, float3(0.0), isnan(_6712)), level(0.0)).x;
    float3 _6721 = float3(_2424, _2426, _2236);
    float4 _2437 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6721, float3(0.0), isnan(_6721)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6721, float3(0.0), isnan(_6721)), level(0.0)).xyzw;
    float _2439 = _2437.x;
    float _2441 = _2437.y;
    float _2443 = _2437.z;
    float _2445 = _2437.w;
    float2 _6737 = float2(_2416, _2418);
    float3 _2449 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6737, float2(0.0), isnan(_6737)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6737, float2(0.0), isnan(_6737)), level(0.0)).xyz;
    float _2451 = _2449.x;
    float _2453 = _2449.y;
    float _2455 = _2449.z;
    float _2457 = _2216;
    if (!_1960)
    {
        float _2459 = rint(_2336);
        float _2461 = precise::max(_2459, 0.0);
        uint _2463 = uint(_2461);
        uint _2465 = clamp(_2463, 0u, 65535u);
        _2457 = as_type<float>(_2465);
    }
    float _2467 = _2457;
    float _2469 = _2467;
    if (!_1960)
    {
        float3 _6774 = float3(_2386, _2208, float(as_type<int>(_2467)));
        float3 _6776 = select(_6774, float3(0.0), isnan(_6774));
        float _2471 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6776.xy, uint(rint(_6776.z)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6776.xy, uint(rint(_6776.z)), level(0.0)).x;
        _2469 = _2471;
    }
    float _2473 = _2469;
    float _2475 = abs(_1818);
    float _2477 = log2(_2475);
    float _2479 = _2298 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2481 = fma(_2312, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2479);
    float _2483 = fma(_2070, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2481);
    float _2485 = _2240 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2487 = _1818 <= 8000.0;
    bool _2489 = isnan(_1818);
    bool _2491 = _2487 || _2489;
    bool _2493 = isnan(8000.0);
    bool _2495 = _2491 || _2493;
    float _2497 = float(_2495);
    float _2499 = fma(_2338, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2483);
    float _2501 = _2477 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2503 = exp2(_2485);
    if (!_2342)
    {
        _2392 = 1.0;
    }
    float _2505 = _2392;
    out.gl_Position.x = _2408;
    out.gl_Position.y = _2410;
    out.gl_Position.z = _2499;
    out.gl_Position.w = _2352;
    float _2507 = exp2(_2501);
    float _2509 = fma(_2507, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2511 = precise::clamp(_2509, 0.0, 1.0);
    float _2513 = fma(_2511, -2.0, 3.0);
    float _2515 = _2511 * _2511;
    float _2517 = _2515 * _2513;
    float _2519 = _2499 + _2352;
    float _2521 = _2519 * 0.5;
    float _2523 = -_2517;
    float _2525 = _2523 + 1.0;
    out.m_90.z = _2521;
    out.m_90.w = _2352;
    float _2527 = fma(_2525, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2517);
    float _2529 = _2497 * _2527;
    float _2531 = -_2503;
    float _2533 = _2531 + 1.0;
    float _2535 = _2529 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2537 = _2533 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2539 = -_2174;
    float _2541 = _2539 + 1.0;
    float _2543 = _2505;
    float _2545 = _2535;
    if (_2342)
    {
        bool _2547 = _2432 >= _2412;
        bool _2549 = isnan(_2432);
        bool _2551 = _2547 || _2549;
        bool _2553 = isnan(_2412);
        bool _2555 = _2551 || _2553;
        float _2557 = float(_2555);
        _2543 = _2557;
    }
    float _2559 = _2543;
    float _2561 = _2541 * _2535;
    float _2563 = precise::clamp(_2561, 0.0, 1.0);
    if (_1960)
    {
        _2545 = 1.0;
    }
    float _2565 = _2545;
    float _2567 = _2565;
    if (!_1960)
    {
        int _2569 = _2108 << 4;
        int _2571 = _2569 + 2048;
        uint _2573 = uint(int(uint(_2571) >> uint(2)));
        uint _2575 = uint(int(uint(int(_2573)) >> uint(2)));
        int _2577 = int(_2573) & 3;
        float _2579 = (*spvDescriptorSet0.vp_c15)._m0[int(_2575)][_2577];
        int _2581 = int(_2573) + 1;
        uint _2583 = uint(int(uint(_2581) >> uint(2)));
        int _2585 = _2581 & 3;
        float _2587 = (*spvDescriptorSet0.vp_c15)._m0[int(_2583)][_2585];
        int _2589 = _2571 + 8;
        uint _2591 = uint(int(uint(_2589) >> uint(2)));
        uint _2593 = uint(int(uint(int(_2591)) >> uint(2)));
        int _2595 = int(_2591) & 3;
        float _2597 = (*spvDescriptorSet0.vp_c15)._m0[int(_2593)][_2595];
        int _2599 = int(_2591) + 1;
        uint _2601 = uint(int(uint(_2599) >> uint(2)));
        int _2603 = _2599 & 3;
        float _2605 = (*spvDescriptorSet0.vp_c15)._m0[int(_2601)][_2603];
        float _2607 = _1772 * _2587;
        float _2609 = fma(_1126, _2579, _2607);
        float _2611 = fma(_1150, _2597, _2609);
        float _2613 = _2611 + _2605;
        float _2615 = precise::clamp(_2613, 0.0, 1.0);
        float _2617 = -_2615;
        float _2619 = _2617 + _2473;
        float _2621 = fma(_2619, 500.0, 1.5);
        float _2623 = exp2(_2621);
        float _2625 = 0.0 + _2623;
        float _2627 = precise::clamp(_2625, 0.0, 1.0);
        _2567 = _2627;
        _1328 = _2623;
    }
    float _2629 = _2567;
    float _2631 = _1328;
    float _2633 = _2537 * _2434;
    float _2635 = _2559 * _2629;
    float _2637 = -_2563;
    float _2639 = fma(_2637, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2641 = -_2537;
    float _2643 = _2641 + 1.0;
    float _2645 = _2445 * _2633;
    float _2647 = _2455 * _2633;
    float _2649 = -_2635;
    float _2651 = fma(_2649, _2639, 1.0);
    float _2653 = precise::clamp(_2651, 0.0, 1.0);
    float _2655 = _2445 * _2643;
    float _2657 = fma(_2451, _2645, _2439);
    float _2659 = fma(_2453, _2645, _2441);
    float _2661 = _2653 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2663 = fma(_2445, _2647, _2443);
    out.m_92.x = _1704;
    out.m_92.y = _1702;
    out.m_92.z = _1706;
    bool _2665 = _1740 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2667 = isnan(_1740);
    bool _2669 = _2665 || _2667;
    bool _2671 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2673 = _2669 || _2671;
    out.m_94.x = _2661;
    out.m_96.x = _2657;
    out.m_96.y = _2659;
    out.m_96.z = _2663;
    out.m_96.w = _2655;
    float _2675 = _2633;
    float _2677 = _2643;
    float _2679 = _2635;
    float _2681 = _2653;
    float _2683 = _2631;
    if (!_2673)
    {
        _2675 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2685 = _2675;
    float _2687 = _2685;
    float _2689 = _2685;
    if (!_2673)
    {
        _2677 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2691 = _2677;
    float _2693 = _2691;
    float _2695 = _2691;
    if (!_2673)
    {
        _2679 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2697 = _2679;
    float _2699 = _2697;
    float _2701 = _2697;
    if (!_2673)
    {
        _2681 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2703 = _2681;
    float _2705 = _2703;
    float _2707 = _2703;
    if (!_2673)
    {
        _1330 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2709 = _1330;
    float _2711 = _2709;
    float _2713 = _2709;
    if (!_2673)
    {
        _2683 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2715 = _2683;
    bool _2717 = !_2673;
    float _2719 = _2715;
    float _2721 = _2715;
    if (!_2717)
    {
        bool _2723 = _1740 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2725 = isnan(_1740);
        bool _2727 = _2723 || _2725;
        bool _2729 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2731 = _2727 || _2729;
        if (!_2731)
        {
            float _2733 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2735 = _1740 + _2733;
            float _2737 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2739 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2737;
            float _2741 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2743 = _2741 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2745 = 1.0 / _2739;
            float _2747 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2749 = _2747 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2751 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2753 = _2751 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2755 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2757 = _2755 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2759 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2761 = _2759 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2763 = _2735 * _2745;
            float _2765 = precise::clamp(_2763, 0.0, 1.0);
            float _2767 = fma(_2765, _2743, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2769 = fma(_2765, _2749, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2771 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2773 = _2771 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2775 = fma(_2765, _2753, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2777 = fma(_2765, _2757, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2779 = fma(_2765, _2761, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            float _2781 = fma(_2765, _2773, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _2695 = _2769;
            _2713 = _2777;
            _2689 = _2767;
            _2707 = _2775;
            _2701 = _2781;
            _2721 = _2779;
            _2783 = true;
        }
        else
        {
            bool _2785 = _1740 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2787 = isnan(_1740);
            bool _2789 = _2785 || _2787;
            bool _2791 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2793 = _2789 || _2791;
            if (!_2793)
            {
                _2687 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2795 = _2687;
            _2689 = _2795;
            if (!_2793)
            {
                _2693 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2797 = _2693;
            _2695 = _2797;
            if (!_2793)
            {
                _2699 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2799 = _2699;
            _2701 = _2799;
            if (!_2793)
            {
                _2705 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2801 = _2705;
            _2707 = _2801;
            if (!_2793)
            {
                _2711 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2803 = _2711;
            _2713 = _2803;
            if (!_2793)
            {
                _2719 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2805 = _2719;
            bool _2807 = !_2793;
            _2721 = _2805;
            if (!_2807)
            {
                bool _2809 = _1740 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2811 = isnan(_1740);
                bool _2813 = _2809 || _2811;
                bool _2815 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2817 = _2813 || _2815;
                if (!_2817)
                {
                    float _2819 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2821 = _1740 + _2819;
                    float _2823 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2825 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2823;
                    float _2827 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2829 = _2827 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2831 = 1.0 / _2825;
                    float _2833 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2835 = _2833 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2837 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2839 = _2837 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2841 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2843 = _2841 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2845 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2847 = _2845 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2849 = _2821 * _2831;
                    float _2851 = precise::clamp(_2849, 0.0, 1.0);
                    float _2853 = fma(_2851, _2829, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2855 = fma(_2851, _2835, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2857 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2859 = _2857 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2861 = fma(_2851, _2839, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2863 = fma(_2851, _2843, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2865 = fma(_2851, _2847, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    float _2867 = fma(_2851, _2859, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _2695 = _2855;
                    _2713 = _2863;
                    _2689 = _2853;
                    _2707 = _2861;
                    _2701 = _2867;
                    _2721 = _2865;
                    _2783 = true;
                }
                else
                {
                    _2695 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2713 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2689 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2707 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2701 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2721 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2783 = false;
    float _2869 = _2695;
    float _2871 = _2713;
    float _2873 = _2689;
    float _2875 = _2707;
    float _2877 = _2701;
    float _2879 = _2721;
    float _2881 = fma(_1606, -0.5, 0.5);
    float _2883 = precise::clamp(_2881, 0.0, 1.0);
    float _2885 = -_2869;
    float _2887 = _2885 + _2871;
    float _2889 = -_2873;
    float _2891 = _2889 + _2875;
    float _2893 = -_2877;
    float _2895 = _2893 + _2879;
    bool _2897 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2899 = fma(_2883, _2887, _2869);
    float _2901 = fma(_2883, _2891, _2873);
    float _2903 = fma(_2883, _2895, _2877);
    float _2905 = _2899 * 0.586610972881317138671875;
    out.m_98.x = 0.0;
    float _2907 = fma(_2901, 0.298911988735198974609375, _2905);
    float _2909 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2911 = fma(_2903, 0.114477999508380889892578125, _2907);
    out.m_61.x = _2909;
    float _2913 = -_2911;
    float _2915 = _2901 + _2913;
    float _2917 = -_2911;
    float _2919 = _2899 + _2917;
    float _2921 = -_2911;
    float _2923 = _2903 + _2921;
    float _2925 = fma(_2915, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2911);
    float _2927 = fma(_2919, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2911);
    float _2929 = fma(_2923, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2911);
    out.m_100.x = _2925;
    out.m_100.y = _2927;
    out.m_100.z = _2929;
    if (!_2897)
    {
        return out;
    }
    float _2931 = -_1702;
    float _2933 = _2931 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2935 = -_1704;
    float _2937 = _2935 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2939 = -_1706;
    float _2941 = _2939 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2943 = _2933 * _2933;
    float _2945 = fma(_2937, _2937, _2943);
    float _2947 = fma(_2941, _2941, _2945);
    float _2949 = sqrt(_2947);
    float _2951 = rsqrt(_2947);
    float _2953 = -_2949;
    float _2955 = _2953 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2957 = _2955 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2959 = precise::clamp(_2957, 0.0, 1.0);
    float _2961 = _2937 * _2951;
    float _2963 = _2933 * _2951;
    float _2965 = abs(_2959);
    float _2967 = log2(_2965);
    float _2969 = _2941 * _2951;
    float _2971 = _2961 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2973 = _1606 * _2963;
    float _2975 = -_2963;
    float _2977 = -_2971;
    float _2979 = fma(_2975, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2977);
    float _2981 = fma(_1604, _2961, _2973);
    float _2983 = -_2969;
    float _2985 = fma(_2983, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2979);
    float _2987 = fma(_1608, _2969, _2981);
    float _2989 = precise::clamp(_2987, 0.0, 1.0);
    float _2991 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2993 = _2985 + _2991;
    float _2995 = _2967 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2997 = _2993 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2999 = precise::clamp(_2997, 0.0, 1.0);
    float _3001 = exp2(_2995);
    float _3003 = _3001 * _2999;
    float _3005 = _2989 * _3003;
    float _3007 = _3005 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3009 = _3005 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3011 = _3005 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_98.x = _3007;
    out.m_98.y = _3009;
    out.m_98.z = _3011;
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
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2783 = false;
    bool _1658 = false;
    bool _337 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _114 = in.m_58.w;
    float _116 = trunc(_114);
    int _119 = int(_116);
    bool _123 = _119 >= 1;
    float _125 = 0.0;
    if (!_123)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _127 = _125;
    float _129 = _127;
    if (!_123)
    {
        out.m_61.x = 0.0;
    }
    int _131 = 0;
    if (!_123)
    {
        float _133 = _127 * 5.0;
        _131 = as_type<int>(_133);
    }
    int _135 = _131;
    int _137 = _135;
    if (!_123)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3068 = as_type<float>(_135);
        out.gl_Position.z = _3068;
    }
    if (!_123)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _139 = in.m_63.w;
    bool _141 = _139 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _143 = isnan(_139);
    bool _145 = _141 || _143;
    bool _147 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _149 = _145 || _147;
    float _151 = -_139;
    float _153 = _151 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_149)
    {
        float _155 = float(_119);
        _129 = _155;
    }
    float _157 = _129;
    bool _159 = _153 >= _157;
    bool _161 = !_149;
    bool _163 = _159 || _161;
    float _165 = _157;
    if (_163)
    {
        _165 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _167 = _165;
    if (_163)
    {
        out.m_61.x = 0.0;
    }
    if (_163)
    {
        float _169 = _167 * 5.0;
        _137 = as_type<int>(_169);
    }
    int _171 = _137;
    if (_163)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3137 = as_type<float>(_171);
        out.gl_Position.z = _3137;
    }
    if (_163)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _173 = as_type<float>(int(gl_VertexIndex));
    float _175 = in.m_68.w;
    bool _177 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _179 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _181 = _177 || _179;
    bool _183 = isnan(1.0);
    bool _185 = _181 || _183;
    float _187 = in.m_63.x;
    float _189 = in.m_63.y;
    float _191 = in.m_63.z;
    float _193 = in.m_58.x;
    float _195 = in.m_58.y;
    float _197 = in.m_58.z;
    int _199 = as_type<int>(_173) & 1;
    bool _201 = _199 != 0;
    int _203 = as_type<int>(_173) & 2;
    bool _205 = _203 != 0;
    float _207 = _153 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _209 = 0.0;
    float _211 = _207;
    if (!_185)
    {
        float _213 = _207 * _207;
        float _215 = _213 * 0.5;
        _209 = _215;
    }
    float _217 = _209;
    bool _219 = !_201;
    float _221 = _219 ? (-0.5) : 0.5;
    bool _223 = !_205;
    float _225 = _223 ? (-0.5) : 0.5;
    float _227 = _217;
    if (!_185)
    {
        float _229 = _217 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _227 = _229;
    }
    float _231 = _227;
    bool _233 = !_185;
    float _235 = _231;
    if (!_233)
    {
        float _237 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _239 = log2(_237);
        float _241 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _243 = _241 + 1.0;
        float _245 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _247 = _207 * _239;
        float _249 = exp2(_247);
        float _251 = _245 * 0.693147182464599609375;
        float _253 = 1.0 / _251;
        float _255 = 1.0 / _243;
        float _257 = _249 + (-1.0);
        float _259 = -_257;
        float _261 = fma(_259, _253, _207);
        float _263 = _261 * _255;
        float _265 = _263 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _235 = _265;
    }
    float _267 = _235;
    bool _269 = !_185;
    if (!_269)
    {
        float _271 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _273 = log2(_271);
        float _275 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _277 = _275 + 1.0;
        float _279 = 1.0 / _277;
        float _281 = _207 * _273;
        float _283 = exp2(_281);
        float _285 = -_283;
        float _287 = _285 + 1.0;
        float _289 = _287 * _279;
        _211 = _289;
    }
    float _291 = _211;
    bool _293 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _295 = _267 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _297 = _267 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _299 = _267 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _301 = fma(_291, _187, _295);
    float _303 = fma(_291, _189, _297);
    float _305 = fma(_291, _191, _299);
    float _307 = fma(_301, _175, _193);
    float _309 = fma(_303, _175, _195);
    float _311 = fma(_305, _175, _197);
    bool _313 = !_293;
    float _333;
    float _335;
    if (!_313)
    {
        float _315 = in.m_70.x;
        float _317 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _319 = _315 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _321 = fma(_319, (*spvDescriptorSet0.vp_c9)._m0[12].x, _153);
        float _323 = _321 * _317;
        float _325 = float(_119);
        float _327 = floor(_323);
        float _329 = -_327;
        float _331 = _323 + _329;
        _333 = _325;
        _335 = _331;
        _337 = true;
    }
    else
    {
        float _339 = float(_119);
        float _341 = 1.0 / _339;
        float _343 = _153 * _341;
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
    out.m_72.x = (*spvDescriptorSet0.vp_c8)._m0[24].x;
    out.m_72.y = (*spvDescriptorSet0.vp_c8)._m0[25].x;
    out.m_72.z = (*spvDescriptorSet0.vp_c8)._m0[26].x;
    float _357 = float(_351);
    float _359 = 1.0 / _357;
    float _361 = float(uint(_355));
    int _363 = ~_355;
    int _365 = _363 + 1;
    int _367 = ~_355;
    int _369 = _367 + 1;
    float _371 = 1.0 / _361;
    float _373 = _153 * _359;
    float _375 = trunc(_373);
    int _377 = int(_375);
    int _379 = as_type<int>(_371) + (-2);
    float _381 = float(uint(_377));
    float _383 = as_type<float>(_379) * _381;
    float _385 = in.m_70.x;
    float _387 = in.m_70.y;
    float _389 = in.m_70.z;
    float _391 = in.m_70.w;
    float _393 = trunc(_383);
    float _395 = precise::max(_393, 0.0);
    uint _398 = uint(_395);
    float _400 = float(_355);
    int _402 = _365 * int(_398);
    int _404 = _402 + _377;
    float _406 = float(_377);
    float _408 = float(uint(_404));
    bool _410 = _406 >= _400;
    bool _412 = isnan(_406);
    bool _414 = _410 || _412;
    bool _416 = isnan(_400);
    bool _418 = _414 || _416;
    float _420 = float(_418);
    float _422 = as_type<float>(_379) * _408;
    int _424 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _426 = _424 != 0;
    float _428 = trunc(_422);
    float _430 = precise::max(_428, 0.0);
    uint _432 = uint(_430);
    bool _434 = !_426;
    float _436 = _434 ? 7.345489978790283203125 : 1.0;
    float _438 = _436 * _385;
    float _440 = trunc(_420);
    int _442 = int(_440);
    int _444 = int(_398) + int(_432);
    float _446 = floor(_438);
    int _448 = _369 * _444;
    int _450 = _448 + _377;
    bool _452 = uint(_450) >= uint(_355);
    float _454 = 1.0 / _345;
    bool _456 = !_452;
    int _458 = _456 ? 0 : (-1);
    float _460 = -_446;
    float _462 = _438 + _460;
    bool _464 = _355 == 0;
    int _466 = ~_444;
    int _468 = _466 + _458;
    int _470 = _468 + 1;
    float _472 = _462 * _400;
    float _474 = _153 * _400;
    int _476 = ~_442;
    int _478 = _476 + 1;
    int _480 = _478 + 1;
    int _482 = _355 * _470;
    int _484 = _482 + _377;
    int _486 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _488 = _486 != 0;
    int _490 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _492 = _490 != 0;
    int _494 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _496 = _494 != 0;
    float _498 = trunc(_472);
    int _500 = int(_498);
    int _502 = _355 + (-1);
    bool _504 = !_464;
    int _506 = _504 ? _484 : (-1);
    float _508 = _474 * _454;
    int _510 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _512 = _510 != 0;
    int _514 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _516 = _514 != 0;
    int _518 = _506 * _480;
    bool _520 = !_492;
    int _522 = _520 ? 0 : 1;
    float _524 = trunc(_508);
    int _526 = int(_524);
    bool _528 = !_512;
    int _530 = _528 ? 0 : 1;
    int _532 = _442 * _502;
    int _534 = _532 + _518;
    bool _536 = !_488;
    int _538 = _536 ? 0 : 1;
    int _540 = abs(_522);
    int _542 = abs(_530);
    bool _544 = !_496;
    int _546 = _544 ? 0 : 1;
    int _548 = abs(_538);
    int _550 = _500 * _542;
    int _552 = _550 + _377;
    bool _554 = !_516;
    int _556 = _554 ? 0 : 1;
    int _558 = abs(_546);
    int _560 = _534 * _540;
    int _562 = abs(_556);
    int _564 = _526 * _548;
    int _566 = _564 + _560;
    float _568 = float(uint(_552));
    int _570 = _552 * _558;
    int _572 = _570 + _566;
    int _574 = ~_355;
    int _576 = _574 + 1;
    int _578 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _580 = _578 != 0;
    int _582 = _500 * _562;
    int _584 = _582 + _572;
    float _586 = as_type<float>(_379) * _568;
    float _588 = float(uint(_584));
    float _590 = trunc(_586);
    float _592 = precise::max(_590, 0.0);
    uint _594 = uint(_592);
    float _596 = as_type<float>(_379) * _588;
    float _598 = trunc(_596);
    float _600 = precise::max(_598, 0.0);
    uint _602 = uint(_600);
    int _604 = ~_355;
    int _606 = _604 + 1;
    int _608 = _606 * int(_594);
    int _610 = _608 + _552;
    int _612 = _576 * int(_602);
    int _614 = _612 + _584;
    float _616 = float(uint(_610));
    float _618 = float(uint(_614));
    int _620 = ~_355;
    int _622 = _620 + 1;
    float _624 = as_type<float>(_379) * _618;
    float _626 = as_type<float>(_379) * _616;
    float _628 = in.m_74.x;
    float _630 = in.m_74.y;
    float _632 = in.m_74.z;
    float _634 = trunc(_624);
    float _636 = precise::max(_634, 0.0);
    uint _638 = uint(_636);
    int _640 = int(_602) + int(_638);
    float _642 = trunc(_626);
    float _644 = precise::max(_642, 0.0);
    uint _646 = uint(_644);
    int _648 = _622 * _640;
    int _650 = _648 + _584;
    bool _652 = uint(_650) >= uint(_355);
    bool _654 = !_652;
    int _656 = _654 ? 0 : (-1);
    int _658 = ~_640;
    int _660 = _658 + _656;
    int _662 = _660 + 1;
    int _664 = int(_594) + int(_646);
    float _666 = in.m_76.x;
    float _668 = in.m_76.y;
    float _670 = in.m_76.z;
    int _672 = _355 * _662;
    int _674 = _672 + _584;
    float _676 = in.m_78.x;
    float _678 = in.m_78.y;
    float _680 = in.m_78.z;
    bool _682 = !_464;
    int _684 = _682 ? _674 : (-1);
    int _686 = ~_355;
    int _688 = _686 + 1;
    int _690 = _684 & 3;
    bool _692 = _690 != 0;
    int _694 = _684 & 3;
    bool _696 = _694 != 0;
    bool _698 = uint(_690) > 1u;
    bool _700 = _690 != 3;
    int _702 = _696 ? 0 : 1;
    int _704 = _688 * _664;
    int _706 = _704 + _552;
    bool _708 = uint(_690) >= 2u;
    bool _710 = _389 > 0.5;
    int _712 = ~_702;
    int _714 = _712 + 1;
    int _716 = _714 + 1;
    int _718 = _708 ? 0 : 1;
    float _720 = _309 * _678;
    int _722 = _716;
    if (!_698)
    {
        int _724 = ~_702;
        int _726 = _724 + 1;
        _722 = _726;
    }
    int _728 = _722;
    bool _730 = uint(_706) >= uint(_355);
    bool _732 = _690 != 3;
    bool _734 = !_580;
    int _736 = _734 ? 0 : 1;
    bool _738 = _391 > 0.5;
    int _740 = ~_718;
    int _742 = _740 + 1;
    int _744 = _742 + 1;
    int _746 = _744;
    if (_700)
    {
        int _748 = ~_718;
        int _750 = _748 + 1;
        _746 = _750;
    }
    int _752 = _746;
    bool _754 = !_692;
    int _756 = _754 ? 0 : 1;
    bool _758 = !_732;
    int _760 = _758 ? 0 : (-1);
    bool _762 = !_730;
    int _764 = _762 ? 0 : (-1);
    int _766 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _768 = _766 != 0;
    int _770 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _772 = _770 != 0;
    int _774 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _776 = _774 != 0;
    int _778 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _780 = _778 != 0;
    float _782 = _309 * _630;
    float _784 = _309 * _668;
    float _786 = fma(_307, _628, _782);
    int _788 = ~_664;
    int _790 = _788 + _764;
    int _792 = _790 + 1;
    float _794 = fma(_307, _666, _784);
    float _796 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _798 = _385 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _800 = fma(_307, _676, _720);
    float _802 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _804 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _802;
    float _806 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _808 = _806 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _810 = -_796;
    float _812 = fma(_798, 2.0, _810);
    float _814 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _816 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _814;
    int _818 = _684 >> 31;
    int _820 = _355 * _792;
    int _822 = _820 + _552;
    float _824 = 1.0 / _804;
    float _826 = fma(_311, _632, _786);
    bool _828 = !_464;
    int _830 = _828 ? _822 : (-1);
    bool _832 = _385 > 0.5;
    float _834 = 1.0 / _808;
    int _836 = _818 & 3;
    float _838 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _840 = _684 + _836;
    float _842 = fma(_385, (*spvDescriptorSet0.vp_c9)._m0[78].z, _838);
    float _844 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _846 = _347 + _844;
    float _848 = 1.0 / _816;
    int _850 = _840 >> 2;
    float _852 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _854 = _387 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _856 = _347 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _858 = isnan(_347);
    bool _860 = _856 || _858;
    bool _862 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _864 = _860 || _862;
    float _866 = float(_864);
    int _868 = _850 << 4;
    int _870 = _868 + 368;
    float _872 = fma(_854, -2.0, _852);
    float _874 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _876 = _347 + _874;
    float _878 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _880 = _347 + _878;
    int _882 = _870 + 8;
    uint _884 = uint(int(uint(_882) >> uint(2)));
    uint _886 = uint(int(uint(int(_884)) >> uint(2)));
    int _888 = int(_884) & 3;
    float _890 = (*spvDescriptorSet0.vp_c9)._m0[int(_886)][_888];
    int _892 = int(_884) + 1;
    uint _894 = uint(int(uint(_892) >> uint(2)));
    int _896 = _892 & 3;
    float _898 = (*spvDescriptorSet0.vp_c9)._m0[int(_894)][_896];
    bool _900 = _347 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _902 = isnan(_347);
    bool _904 = _900 || _902;
    bool _906 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _908 = _904 || _906;
    float _910 = float(_908);
    float _912 = _876 * _824;
    float _914 = _880 * _834;
    float _916 = -_866;
    float _918 = _916 + 1.0;
    float _920 = _846 * _848;
    float _922 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _924 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _922;
    uint _926 = uint(int(uint(_870) >> uint(2)));
    uint _928 = uint(int(uint(int(_926)) >> uint(2)));
    int _930 = int(_926) & 3;
    float _932 = (*spvDescriptorSet0.vp_c9)._m0[int(_928)][_930];
    int _934 = int(_926) + 1;
    uint _936 = uint(int(uint(_934) >> uint(2)));
    int _938 = _934 & 3;
    float _940 = (*spvDescriptorSet0.vp_c9)._m0[int(_936)][_938];
    float _942 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _944 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _942;
    bool _946 = _347 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _948 = isnan(_347);
    bool _950 = _946 || _948;
    bool _952 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _954 = _950 || _952;
    float _956 = float(_954);
    float _958 = fma(_924, _912, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _960 = fma(_944, _912, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _962 = _347 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _964 = isnan(_347);
    bool _966 = _962 || _964;
    bool _968 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _970 = _966 || _968;
    float _972 = float(_970);
    float _974 = _910 * _918;
    float _976 = -_910;
    float _978 = _976 + 1.0;
    float _980 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _982 = _980 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _984 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _986 = _984 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _988 = -_972;
    float _990 = _988 + 1.0;
    float _992 = _956 * _978;
    float _994 = -_956;
    float _996 = _994 + 1.0;
    float _998 = fma(_982, _914, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _1000 = fma(_986, _914, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    int _1002 = abs(_756);
    float _1004 = _972 * _996;
    float _1006 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1008 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _1006;
    float _1010 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1012 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _1010;
    float _1014 = _960 * _1004;
    float _1016 = _958 * _1004;
    float _1018 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1020 = int(_1018);
    float _1022 = fma(_1012, _920, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _1024 = fma(_990, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1014);
    float _1026 = fma(_990, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1016);
    int _1028 = abs(_728);
    float _1030 = fma(_1008, _920, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _1032 = fma(_998, _992, _1024);
    float _1034 = fma(_1000, _992, _1026);
    int _1036 = abs(_752);
    float _1038 = in.m_68.x;
    float _1040 = in.m_68.y;
    int _1042 = ~_1028;
    int _1044 = _1042 + 1;
    int _1046 = _1044 + 1;
    float _1048 = fma(_1030, _974, _1032);
    float _1050 = fma(_1022, _974, _1034);
    int _1052 = ~_1002;
    int _1054 = _1052 + 1;
    int _1056 = _1054 + 1;
    float _1058 = fma(_866, (*spvDescriptorSet0.vp_c9)._m0[146].x, _1048);
    int _1060 = abs(_1020);
    float _1062 = fma(_866, (*spvDescriptorSet0.vp_c9)._m0[146].y, _1050);
    float _1064 = -_221;
    int _1066 = _710 ? as_type<int>(_1064) : as_type<int>(_221);
    bool _1068 = _387 > 0.5;
    int _1070 = _1046 * as_type<int>(_940);
    int _1072 = abs(_760);
    int _1074 = ~_1036;
    int _1076 = _1074 + 1;
    int _1078 = _1076 + 1;
    int _1080 = _1056 * as_type<int>(_932);
    int _1082 = _1080 + _1070;
    float _1084 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _225);
    int _1086 = abs(_736);
    int _1088 = _1078 * as_type<int>(_890);
    int _1090 = _1088 + _1082;
    int _1092 = ~_1072;
    int _1094 = _1092 + 1;
    int _1096 = _1094 + 1;
    float _1098 = _1058 * _1038;
    float _1100 = float(uint(_1060));
    float _1102 = _1062 * _1040;
    int _1104 = ~_1086;
    int _1106 = _1104 + 1;
    int _1108 = _1106 + 1;
    int _1110 = _1096 * as_type<int>(_898);
    int _1112 = _1110 + _1090;
    float _1114 = 1.0 / _1100;
    float _1116 = float(uint(_1020));
    float _1118 = _1098 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1120 = _1112 * _1108;
    float _1122 = _1102 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1124 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _221);
    float _1126 = _826 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1128 = _830 * _1086;
    int _1130 = _1128 + _1120;
    float _1132 = 1.0 / _1116;
    float _1134 = fma(_311, _670, _794);
    float _1136 = _1122 * _1084;
    float _1138 = _1118 * _1124;
    int _1140 = abs(_1130);
    float _1142 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1144 = _1136 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1146 = _1136 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _1148 = as_type<int>(_1114) + (-2);
    float _1150 = _1134 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1152 = float(uint(_1140));
    float _1154 = fma(_1138, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1144);
    float _1156 = float(uint(_1130));
    float _1158 = fma(_1138, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1146);
    float _1160 = as_type<float>(_1148) * _1152;
    int _1162 = as_type<int>(_1132) + (-2);
    float _1164 = fma(_1142, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1154);
    float _1166 = fma(_1142, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1158);
    int _1168 = ~_1060;
    int _1170 = _1168 + 1;
    float _1172 = fma(_311, _680, _800);
    float _1174 = trunc(_1160);
    float _1176 = precise::max(_1174, 0.0);
    uint _1178 = uint(_1176);
    float _1180 = as_type<float>(_1162) * _1156;
    float _1182 = _1164 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1184 = _1166 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1186 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1188 = _1136 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1190 = _1126 + _1182;
    float _1192 = _1150 + _1184;
    float _1194 = trunc(_1180);
    float _1196 = precise::max(_1194, 0.0);
    uint _1198 = uint(_1196);
    float _1200 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1202 = _1190 + _1200;
    float _1204 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1206 = _1192 + _1204;
    int _1208 = ~_1020;
    int _1210 = _1208 + 1;
    float _1212 = fma(_1138, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1188);
    float _1214 = _1202 * _1202;
    float _1216 = _1206 * _1206;
    int _1218 = _1170 * int(_1178);
    int _1220 = _1218 + _1140;
    float _1222 = -_221;
    int _1224 = _832 ? as_type<int>(_1222) : as_type<int>(_221);
    float _1226 = fma(_387, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1186);
    float _1228 = _1214 + _1216;
    float _1230 = -_225;
    int _1232 = _1068 ? as_type<int>(_1230) : as_type<int>(_225);
    float _1234 = _225 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1236 = float(uint(_1220));
    float _1238 = sqrt(_1228);
    int _1240 = _1210 * int(_1198);
    int _1242 = _1240 + _1130;
    float _1244 = _221 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _1246 = !_768;
    float _1248 = _1246 ? _221 : as_type<float>(_1066);
    float _1250 = as_type<float>(_1148) * _1236;
    bool _1252 = !_776;
    float _1254 = _1252 ? _221 : as_type<float>(_1224);
    float _1256 = fma(_1142, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1212);
    float _1258 = float(uint(_1242));
    float _1260 = _1234 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _1262 = !_780;
    float _1264 = _1262 ? _225 : as_type<float>(_1232);
    float _1266 = trunc(_1250);
    float _1268 = precise::max(_1266, 0.0);
    uint _1270 = uint(_1268);
    float _1272 = _1234 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1274 = as_type<float>(_1162) * _1258;
    float _1276 = -_225;
    int _1278 = _738 ? as_type<int>(_1276) : as_type<int>(_225);
    float _1280 = _1234 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1282 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1260);
    bool _1284 = _1238 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1286 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1272);
    float _1288 = trunc(_1274);
    float _1290 = precise::max(_1288, 0.0);
    uint _1292 = uint(_1290);
    bool _1294 = !_772;
    float _1296 = _1294 ? _225 : as_type<float>(_1278);
    float _1298 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1280);
    int _1300 = ~_1060;
    int _1302 = _1300 + 1;
    int _1304 = ~_1020;
    int _1306 = _1304 + 1;
    float _1308 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1310 = int(_1178) + int(_1270);
    float _1312 = _1172 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1314 = _1256 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1316 = _1172;
    float _1318 = _1314;
    float _1320 = _1190;
    float _1322 = _1214;
    float _1324 = _1216;
    float _1326 = _1192;
    float _1328 = _1150;
    float _1330 = _1126;
    if (!_1284)
    {
        _1316 = _1192;
    }
    float _1332 = _1316;
    int _1334 = _1302 * _1310;
    int _1336 = _1334 + _1140;
    float _1338 = _1312 + _1314;
    int _1340 = int(_1198) + int(_1292);
    float _1342 = _1332;
    if (!_1284)
    {
        _1318 = _1190;
    }
    float _1344 = _1318;
    float _1346 = _1344;
    if (!_1284)
    {
        _1320 = _1338;
    }
    float _1348 = _1320;
    int _1350 = _1306 * _1340;
    int _1352 = _1350 + _1130;
    bool _1354 = !_1284;
    float _1356 = _1348;
    if (!_1354)
    {
        float _1358 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1360 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1362 = _1238 + _1360;
        float _1364 = _1338 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1366 = rsqrt(_1228);
        float _1368 = _1362 * _1358;
        float _1370 = _1368 * 0.15915493667125701904296875;
        float _1372 = _1370 * 6.283185482025146484375;
        float _1374 = sin(_1372);
        float _1376 = _1370 * 6.283185482025146484375;
        float _1378 = cos(_1376);
        float _1380 = fma(_1374, _1364, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1382 = _1366 * _1380;
        float _1384 = _1378 + (-1.0);
        float _1386 = fma(_1202, _1382, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1388 = fma(_1206, _1382, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1390 = _1384 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1392 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1394 = _1386 + _1392;
        float _1396 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1398 = _1388 + _1396;
        float _1400 = fma(_1338, _1378, _1390);
        float _1402 = _1394 * _1394;
        float _1404 = _1398 * _1398;
        _1356 = _1400;
        _1322 = _1402;
        _1324 = _1404;
        _1346 = _1386;
        _1342 = _1388;
        _1326 = _1382;
    }
    float _1406 = _1356;
    float _1408 = _1322;
    float _1410 = _1324;
    float _1412 = _1346;
    float _1414 = _1342;
    float _1416 = _1326;
    bool _1418 = uint(_1336) >= uint(_1060);
    float _1420 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1422 = _1130 ^ _1020;
    float _1424 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1426 = _1406 + _1424;
    bool _1428 = uint(_1352) >= uint(_1020);
    float _1430 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[76].y, _872);
    bool _1432 = !_1418;
    int _1434 = _1432 ? 0 : (-1);
    float _1436 = fma(_1426, _1426, _1408);
    uint _1438 = uint(int(uint(_1422) >> uint(31)));
    float _1440 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1442 = !_1428;
    int _1444 = _1442 ? 0 : (-1);
    float _1446 = -_153;
    float _1448 = fma(_1446, (*spvDescriptorSet0.vp_c9)._m0[76].x, _812);
    int _1450 = ~_1434;
    int _1452 = _1310 + _1450;
    int _1454 = _1452 + 1;
    float _1456 = fma(_1234, _1234, 1.0);
    int _1458 = ~int(_1438);
    int _1460 = _1458 + 1;
    float _1462 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1226);
    int _1464 = ~_1340;
    int _1466 = _1464 + _1444;
    int _1468 = _1466 + 1;
    float _1470 = _1420 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _1472 = _1454 ^ _1460;
    float _1474 = _1248 + 0.5;
    bool _1476 = _1020 == 0;
    float _1478 = -_1296;
    float _1480 = _1478 + 0.5;
    bool _1482 = _1020 == 0;
    int _1484 = _1020 * _1468;
    int _1486 = _1484 + _1130;
    int _1488 = ~_1460;
    int _1490 = _1488 + _1472;
    int _1492 = _1490 + 1;
    float _1494 = rsqrt(_1456);
    float _1496 = _1308 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1498 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[77].z, _842);
    bool _1500 = !_1482;
    int _1502 = _1500 ? _1492 : (-1);
    float _1504 = _1264 + (-0.5);
    bool _1506 = !_1476;
    int _1508 = _1506 ? _1486 : (-1);
    float _1510 = _1480 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1512 = float(_1502);
    float _1514 = -_1498;
    float _1516 = _1514 + 1.0;
    float _1518 = float(_1508);
    float _1520 = -_1462;
    float _1522 = _1520 + 1.0;
    float _1524 = _1436 + _1410;
    float _1526 = -_1430;
    float _1528 = fma(_1470, _1512, _1526);
    float _1530 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1532 = fma(_1496, _1518, _1448);
    float _1534 = _1234 * _1494;
    float _1536 = _1254 + 0.5;
    float _1538 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1540 = -(*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _1542 = _1534 * _1540;
    float _1544 = fma(_1496, _1536, _1532);
    float _1546 = -_1470;
    float _1548 = fma(_1546, _1504, _1528);
    float _1550 = -(*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _1552 = _1534 * _1550;
    float _1554 = fma(_1494, (*spvDescriptorSet0.vp_c8)._m0[24].y, _1542);
    float _1556 = _1474 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1558 = -(*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _1560 = _1534 * _1558;
    float _1562 = fma(_1494, (*spvDescriptorSet0.vp_c8)._m0[25].y, _1552);
    float _1564 = fma(_1264, _1522, _1548);
    float _1566 = _1556 * _1440;
    float _1568 = fma(_1494, (*spvDescriptorSet0.vp_c8)._m0[26].y, _1560);
    float _1570 = _1510 * _1530;
    float _1572 = -_1516;
    float _1574 = fma(_1254, _1572, _1544);
    float _1576 = sqrt(_1524);
    float _1578 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1580 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1582 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1584 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1586 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1588 = _1580 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1590 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1592 = _1538 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1594 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1596 = _1582 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1598 = _1584 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1600 = _1586 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1602 = _1590 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1604 = _1282 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _1606 = _1286 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _1608 = _1298 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    out.m_80.x = _1588;
    out.m_80.y = _1592;
    out.m_80.z = _1596;
    out.m_80.w = _1578;
    bool _1610 = _1576 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1612 = isnan(_1576);
    bool _1614 = _1610 || _1612;
    bool _1616 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1618 = _1614 || _1616;
    out.m_82.x = _1598;
    out.m_82.y = _1600;
    out.m_82.z = _1602;
    out.m_82.w = _1594;
    out.m_84.x = _1554;
    out.m_84.y = _1562;
    out.m_84.z = _1568;
    out.m_86.x = _1574;
    out.m_86.y = _1564;
    out.m_86.z = _1566;
    out.m_86.w = _1570;
    float _1620 = _1556;
    float _1622 = _1416;
    if (!_1618)
    {
        _1620 = 1.0;
    }
    float _1624 = _1620;
    out.m_88.x = _1604;
    out.m_88.y = _1606;
    out.m_88.z = _1608;
    bool _1626 = !_1618;
    float _1628 = _1624;
    if (!_1626)
    {
        bool _1630 = _1576 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1632 = isnan(_1576);
        bool _1634 = _1630 || _1632;
        bool _1636 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1638 = _1634 || _1636;
        if (!_1638)
        {
            float _1640 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1642 = _1576 + _1640;
            float _1644 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1646 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1644;
            float _1648 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1650 = _1648 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1652 = 1.0 / _1646;
            float _1654 = _1642 * _1652;
            float _1656 = fma(_1654, _1650, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1628 = _1656;
            _1658 = true;
        }
        else
        {
            bool _1660 = _1576 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1662 = isnan(_1576);
            bool _1664 = _1660 || _1662;
            bool _1666 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1668 = _1664 || _1666;
            if (!_1668)
            {
                float _1670 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1672 = _1576 + _1670;
                float _1674 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1676 = _1674 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1678 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1680 = _1678 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1682 = 1.0 / _1676;
                float _1684 = _1672 * _1682;
                float _1686 = fma(_1684, _1680, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1628 = _1686;
                _1658 = true;
            }
            else
            {
                _1628 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1658 = false;
    float _1688 = _1628;
    float _1690 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1692 = _1406 + _1690;
    float _1694 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1696 = _1412 + _1694;
    float _1698 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1700 = _1414 + _1698;
    float _1702 = fma(_1692, _1688, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1704 = fma(_1696, _1688, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1706 = fma(_1700, _1688, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1708 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1710 = _1702 + _1708;
    float _1712 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1714 = _1704 + _1712;
    float _1716 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1718 = _1706 + _1716;
    float _1720 = _1710 * _1710;
    float _1722 = _1702 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1724 = fma(_1714, _1714, _1720);
    float _1726 = fma(_1704, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1722);
    float _1728 = fma(_1718, _1718, _1724);
    float _1730 = _1312 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1732 = fma(_1150, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1734 = rsqrt(_1728);
    float _1736 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1730);
    float _1738 = fma(_1150, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1736);
    float _1740 = sqrt(_1728);
    float _1742 = _1738 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1744 = _1312 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1746 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1744);
    float _1748 = _1734 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1750 = 1.0 / _1742;
    float _1752 = fma(_1150, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1746);
    float _1754 = _1714 * _1748;
    float _1756 = _1718 * _1748;
    float _1758 = _1752 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1760 = _1754 * _1754;
    float _1762 = _1756 * _1756;
    float _1764 = _1758 + _1742;
    float _1766 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _1768 = floor(_1732);
    float _1770 = _1760 + _1762;
    float _1772 = _1312 + _1766;
    float _1774 = _1764 * _1750;
    float _1776 = _1774 * 0.5;
    float _1778 = _1772 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1780 = sqrt(_1770);
    float _1782 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1784 = fma(_1776, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1782);
    float _1786 = _1772 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1788 = fma(_1126, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1778);
    float _1790 = fma(_1126, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1786);
    float _1792 = fma(_1150, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1788);
    float _1794 = 1.0 / _1784;
    float _1796 = -_1768;
    float _1798 = _1732 + _1796;
    float _1800 = fma(_1150, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1790);
    float _1802 = _1792 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1804 = _1800 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    bool _1806 = _1780 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1808 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1810 = _1780 + _1808;
    float _1812 = trunc(_1802);
    int _1814 = int(_1812);
    float _1816 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1818 = _1794 * _1816;
    float _1820 = trunc(_1804);
    int _1822 = int(_1820);
    bool _1824 = _1818 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1826 = fma(_1126, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    bool _1828 = _1818 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1830 = _1598;
    int _1832 = 2;
    float _1834 = _1810;
    float _1836 = _1754;
    float _1838 = _1756;
    float _1840 = _1726;
    if (_1806)
    {
        float _1842 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1830 = _1842;
    }
    float _1844 = _1830;
    int _1846 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1848 = _1814 + _1846;
    int _1850 = _1848 + 1;
    if (!_1824)
    {
        _1832 = 1;
    }
    int _1852 = _1832;
    float _1854 = floor(_1826);
    int _1856 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1858 = _1822 + _1856;
    int _1860 = _1858 + 1;
    int _1862 = _1852;
    if (_1806)
    {
        float _1864 = _1810 * _1844;
        _1834 = _1864;
    }
    float _1866 = _1834;
    float _1868 = 0.0;
    if (_1806)
    {
        float _1870 = _1866 * 0.15915493667125701904296875;
        _1868 = _1870;
    }
    float _1872 = _1868;
    float _1874 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1876 = _1792;
    if (_1806)
    {
        float _1878 = _1872 * 6.283185482025146484375;
        float _1880 = sin(_1878);
        _1876 = _1880;
    }
    float _1882 = _1876;
    float _1884 = -_1854;
    float _1886 = _1826 + _1884;
    float _1888 = precise::max(0.0, _1874);
    bool _1890 = !_1824;
    int _1892 = _1890 ? 0 : 1;
    float _1894 = -_1748;
    float _1896 = -_1888;
    float _1898 = fma(_1710, _1894, _1896);
    float _1900 = as_type<float>(_1892);
    float _1902 = _1898;
    if (!_1828)
    {
        _1862 = _1892;
    }
    int _1904 = _1862;
    float _1906 = _1888;
    if (_1806)
    {
        float _1908 = rsqrt(_1770);
        _1906 = _1908;
    }
    float _1910 = _1906;
    bool _1912 = _1850 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    if (_1806)
    {
        float _1914 = _1898 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1900 = _1914;
    }
    float _1916 = _1900;
    int _1918 = _1904 << 6;
    int _1920 = _1850 | _1860;
    int _1922 = _1918 + 64;
    uint _1924 = uint(int(uint(_1922) >> uint(2)));
    uint _1926 = uint(int(uint(int(_1924)) >> uint(2)));
    int _1928 = int(_1924) & 3;
    float _1930 = (*spvDescriptorSet0.vp_c15)._m0[int(_1926)][_1928];
    int _1932 = int(_1924) + 1;
    uint _1934 = uint(int(uint(_1932) >> uint(2)));
    int _1936 = _1932 & 3;
    float _1938 = (*spvDescriptorSet0.vp_c15)._m0[int(_1934)][_1936];
    float _1940 = _1872;
    if (_1806)
    {
        float _1942 = _1872 * 6.283185482025146484375;
        float _1944 = cos(_1942);
        _1940 = _1944;
    }
    float _1946 = _1940;
    float _1948 = _1882;
    if (_1806)
    {
        float _1950 = fma(_1882, _1916, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1948 = _1950;
    }
    float _1952 = _1948;
    bool _1954 = _1920 < 0;
    bool _1956 = _1954 || _1912;
    bool _1958 = _1860 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1960 = _1958 || _1956;
    int _1962 = _1918 + 96;
    uint _1964 = uint(int(uint(_1962) >> uint(2)));
    uint _1966 = uint(int(uint(int(_1964)) >> uint(2)));
    int _1968 = int(_1964) & 3;
    float _1970 = (*spvDescriptorSet0.vp_c15)._m0[int(_1966)][_1968];
    int _1972 = int(_1964) + 1;
    uint _1974 = uint(int(uint(_1972) >> uint(2)));
    int _1976 = _1972 & 3;
    float _1978 = (*spvDescriptorSet0.vp_c15)._m0[int(_1974)][_1976];
    float _1980 = 0.0;
    if (_1806)
    {
        float _1982 = _1910 * _1952;
        _1980 = _1982;
    }
    float _1984 = _1980;
    float _1986 = _1984;
    if (_1806)
    {
        float _1988 = _1754 * _1984;
        _1836 = _1988;
    }
    float _1990 = _1836;
    if (_1806)
    {
        float _1992 = _1756 * _1984;
        _1838 = _1992;
    }
    float _1994 = _1838;
    if (!_1806)
    {
        _1986 = _1762;
    }
    float _1996 = _1986;
    int _1998 = _1918 + 104;
    uint _2000 = uint(int(uint(_1998) >> uint(2)));
    uint _2002 = uint(int(uint(int(_2000)) >> uint(2)));
    int _2004 = int(_2000) & 3;
    float _2006 = (*spvDescriptorSet0.vp_c15)._m0[int(_2002)][_2004];
    int _2008 = int(_2000) + 1;
    uint _2010 = uint(int(uint(_2008) >> uint(2)));
    int _2012 = _2008 & 3;
    float _2014 = (*spvDescriptorSet0.vp_c15)._m0[int(_2010)][_2012];
    float _2016 = _1996;
    if (_1806)
    {
        float _2018 = _1946 + (-1.0);
        _1622 = _2018;
    }
    float _2020 = _1622;
    if (_1806)
    {
        float _2022 = _1994 * _1994;
        _2016 = _2022;
    }
    float _2024 = _2016;
    float _2026 = 0.0;
    if (!_1960)
    {
        float _2028 = floor(_1804);
        _2026 = _2028;
    }
    float _2030 = _2026;
    float _2032 = 0.0;
    if (_1806)
    {
        float _2034 = _2020 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2032 = _2034;
    }
    float _2036 = _2032;
    float _2038 = fma(_1706, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1726);
    if (!_1806)
    {
        _1840 = _1760;
    }
    float _2040 = _1840;
    int _2042 = _1918 + 48;
    uint _2044 = uint(int(uint(_2042) >> uint(2)));
    uint _2046 = uint(int(uint(int(_2044)) >> uint(2)));
    int _2048 = int(_2044) & 3;
    float _2050 = (*spvDescriptorSet0.vp_c15)._m0[int(_2046)][_2048];
    int _2052 = int(_2044) + 1;
    uint _2054 = uint(int(uint(_2052) >> uint(2)));
    int _2056 = _2052 & 3;
    float _2058 = (*spvDescriptorSet0.vp_c15)._m0[int(_2054)][_2056];
    float _2060 = _2040;
    if (_1806)
    {
        float _2062 = fma(_1898, _1946, _2036);
        _1902 = _2062;
    }
    float _2064 = _1902;
    if (_1806)
    {
        float _2066 = _1990 * _1990;
        _2060 = _2066;
    }
    float _2068 = _2060;
    float _2070 = _2038 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2072 = fma(_2064, _2064, _2068);
    int _2074 = _1918 + 56;
    uint _2076 = uint(int(uint(_2074) >> uint(2)));
    uint _2078 = uint(int(uint(int(_2076)) >> uint(2)));
    int _2080 = int(_2076) & 3;
    float _2082 = (*spvDescriptorSet0.vp_c15)._m0[int(_2078)][_2080];
    int _2084 = int(_2076) + 1;
    uint _2086 = uint(int(uint(_2084) >> uint(2)));
    int _2088 = _2084 & 3;
    float _2090 = (*spvDescriptorSet0.vp_c15)._m0[int(_2086)][_2088];
    float _2092 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2094 = _2070 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2096 = _2072 + _2024;
    float _2098 = -_2094;
    float _2100 = fma(_2098, _2092, 1.0);
    int _2102 = as_type<int>(_2094);
    if (!_1960)
    {
        int _2104 = _1860 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _2106 = _2104 + _1850;
        _2102 = _2106;
    }
    int _2108 = _2102;
    int _2110 = _1918 + 80;
    uint _2112 = uint(int(uint(_2110) >> uint(2)));
    uint _2114 = uint(int(uint(int(_2112)) >> uint(2)));
    int _2116 = int(_2112) & 3;
    float _2118 = (*spvDescriptorSet0.vp_c15)._m0[int(_2114)][_2116];
    int _2120 = int(_2112) + 1;
    uint _2122 = uint(int(uint(_2120) >> uint(2)));
    int _2124 = _2120 & 3;
    float _2126 = (*spvDescriptorSet0.vp_c15)._m0[int(_2122)][_2124];
    float _2128 = log2(_2100);
    int _2130 = _1918 + 72;
    uint _2132 = uint(int(uint(_2130) >> uint(2)));
    uint _2134 = uint(int(uint(int(_2132)) >> uint(2)));
    int _2136 = int(_2132) & 3;
    float _2138 = (*spvDescriptorSet0.vp_c15)._m0[int(_2134)][_2136];
    int _2140 = int(_2132) + 1;
    uint _2142 = uint(int(uint(_2140) >> uint(2)));
    int _2144 = _2140 & 3;
    float _2146 = (*spvDescriptorSet0.vp_c15)._m0[int(_2142)][_2144];
    float _2148 = _1772 * _1938;
    float _2150 = rsqrt(_2096);
    float _2152 = fma(_1126, _1930, _2148);
    int _2154 = _1918 + 88;
    uint _2156 = uint(int(uint(_2154) >> uint(2)));
    uint _2158 = uint(int(uint(int(_2156)) >> uint(2)));
    int _2160 = int(_2156) & 3;
    float _2162 = (*spvDescriptorSet0.vp_c15)._m0[int(_2158)][_2160];
    int _2164 = int(_2156) + 1;
    uint _2166 = uint(int(uint(_2164) >> uint(2)));
    int _2168 = _2164 & 3;
    float _2170 = (*spvDescriptorSet0.vp_c15)._m0[int(_2166)][_2168];
    float _2172 = _1772 * _1978;
    float2 _6262 = float2(_1886, _1798);
    float _2174 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6262, float2(0.0), isnan(_6262)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6262, float2(0.0), isnan(_6262)), level(0.0)).x;
    float _2176 = _2128 * 0.693147182464599609375;
    float _2178 = fma(_1126, _1970, _2172);
    float _2180 = _1970;
    if (!_1960)
    {
        float _2182 = floor(_1802);
        _2180 = _2182;
    }
    float _2184 = _2180;
    float _2186 = fma(_1150, _2006, _2178);
    float _2188 = _2150 * _1990;
    float _2190 = _2186 + _2014;
    float _2192 = _2150 * _2064;
    float _2194 = _2150 * _1994;
    float _2196 = _1772 * _2058;
    float _2198 = _2058;
    int _2200 = as_type<int>(_2196);
    float _2202 = _2192;
    if (!_1960)
    {
        float _2204 = -_2030;
        float _2206 = _1804 + _2204;
        _2198 = _2206;
    }
    float _2208 = _2198;
    float _2210 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2212 = fma(_1740, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2210);
    float _2214 = precise::clamp(_2212, 0.0, 1.0);
    float _2216 = 1.0 / _2190;
    float _2218 = _2188 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2220 = fma(_1126, _2050, _2196);
    float _2222 = -_2214;
    float _2224 = _2222 + 1.0;
    if (!_1960)
    {
        int _2226 = _2108 << 2;
        _2200 = _2226;
    }
    int _2228 = _2200;
    float _2230 = -_2218;
    float _2232 = fma(_2192, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2230);
    float _2234 = fma(_1150, _2082, _2220);
    float _2236 = _2176 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2238 = abs(_2224);
    float _2240 = log2(_2238);
    int _2242 = _2228;
    int _2244 = as_type<int>(_2126);
    if (!_1960)
    {
        int _2246 = 12 & _2228;
        _2242 = _2246;
    }
    int _2248 = _2242;
    float _2250 = _2234 + _2090;
    float _2252 = _1702 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2254 = _1772 * _2126;
    int _2256 = as_type<int>(_2254);
    if (!_1960)
    {
        uint _2258 = uint(int(uint(_2108) >> uint(2)));
        _2244 = int(_2258);
    }
    int _2260 = _2244;
    float _2262 = fma(_1704, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2252);
    float _2264 = fma(_1126, _2118, _2254);
    if (!_1960)
    {
        int _2266 = _2260 << 4;
        int _2268 = _2266 + _2248;
        _2256 = _2268;
    }
    int _2270 = _2256;
    float _2272 = fma(_1706, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2262);
    float _2274 = fma(_1150, _2138, _2152);
    float _2276 = -_2194;
    float _2278 = fma(_2276, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2232);
    float _2280 = _1702 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2282 = _2240 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2284 = _2274 + _2146;
    float _2286 = _1702 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2288 = fma(_1704, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2280);
    float _2290 = _2250 * _2216;
    float _2292 = fma(_1150, _2162, _2264);
    float _2294 = fma(_1704, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2286);
    float _2296 = _2284 * _2216;
    float _2298 = _2272 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _2300 = _2290 >= 0.0;
    float _2302 = fma(_1706, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2294);
    float _2304 = exp2(_2282);
    float _2306 = _2298 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _2308 = _2290 <= 1.0;
    bool _2310 = _2308 && _2300;
    float _2312 = _2302 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2314 = fma(_1706, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2288);
    float _2316 = fma(_2278, -0.5, 0.5);
    bool _2318 = _2296 >= 0.0;
    bool _2320 = _2318 && _2310;
    float _2322 = fma(_2312, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2306);
    float _2324 = _2224;
    if (!_1960)
    {
        int _2326 = _2270 + 400;
        uint _2328 = uint(int(uint(_2326) >> uint(2)));
        uint _2330 = uint(int(uint(int(_2328)) >> uint(2)));
        int _2332 = int(_2328) & 3;
        float _2334 = (*spvDescriptorSet0.vp_c15)._m0[int(_2330)][_2332];
        _2324 = _2334;
    }
    float _2336 = _2324;
    float _2338 = _2314 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    bool _2340 = _2296 <= 1.0;
    bool _2342 = _2340 && _2320;
    float _2344 = fma(_2070, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2322);
    float _2346 = sqrt(_2316);
    float _2348 = fma(_2278, 0.5, 0.5);
    float _2350 = _2292 + _2170;
    float _2352 = fma(_2338, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2344);
    float _2354 = _2192 + 1.0;
    float _2356 = fma(_2348, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2358 = _2298 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2360 = _2298 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2362 = -_2192;
    float _2364 = fma(_2304, _2354, _2362);
    float _2366 = 1.0 / _2352;
    float _2368 = fma(_2312, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2358);
    float _2370 = _2354;
    if (_2342)
    {
        float _2372 = float(_1904);
        _2370 = _2372;
    }
    float _2374 = _2370;
    float _2376 = fma(_2312, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2360);
    float _2378 = fma(_2348, _2356, -0.212114393711090087890625);
    float _2380 = fma(_2070, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2368);
    if (!_1960)
    {
        float _2382 = -_2184;
        float _2384 = _1802 + _2382;
        _2202 = _2384;
    }
    float _2386 = _2202;
    float _2388 = fma(_2070, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2376);
    float _2390 = _2374;
    float _2392 = _2386;
    if (_2342)
    {
        float _2394 = rint(_2374);
        float _2396 = precise::max(_2394, 0.0);
        uint _2398 = uint(_2396);
        uint _2400 = clamp(_2398, 0u, 65535u);
        _2390 = as_type<float>(_2400);
    }
    float _2402 = _2390;
    float _2404 = fma(_2348, _2378, 1.570728778839111328125);
    float _2406 = _2346 * 0.636619746685028076171875;
    float _2408 = fma(_2338, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2380);
    float _2410 = fma(_2338, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2388);
    float _2412 = _2350 * _2216;
    float _2414 = -_2404;
    float _2416 = fma(_2406, _2414, 1.0);
    float _2418 = fma(_2364, 0.5, 0.5);
    float _2420 = _2408 * _2366;
    float _2422 = _2410 * _2366;
    float _2424 = fma(_2420, 0.5, 0.5);
    float _2426 = fma(_2422, -0.5, 0.5);
    float _2428 = _2402;
    if (_2342)
    {
        float3 _6698 = float3(_2290, _2296, float(as_type<int>(_2402)));
        float3 _6702 = select(_6698, float3(0.0), isnan(_6698));
        float _2430 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6702.xy, uint(rint(_6702.z)), _2412, level(0.0));
        _2428 = _2430;
    }
    float _2432 = _2428;
    float3 _6712 = float3(_2424, _2426, _2236);
    float _2434 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6712, float3(0.0), isnan(_6712)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6712, float3(0.0), isnan(_6712)), level(0.0)).x;
    float3 _6721 = float3(_2424, _2426, _2236);
    float4 _2437 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6721, float3(0.0), isnan(_6721)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6721, float3(0.0), isnan(_6721)), level(0.0)).xyzw;
    float _2439 = _2437.x;
    float _2441 = _2437.y;
    float _2443 = _2437.z;
    float _2445 = _2437.w;
    float2 _6737 = float2(_2416, _2418);
    float3 _2449 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6737, float2(0.0), isnan(_6737)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6737, float2(0.0), isnan(_6737)), level(0.0)).xyz;
    float _2451 = _2449.x;
    float _2453 = _2449.y;
    float _2455 = _2449.z;
    float _2457 = _2216;
    if (!_1960)
    {
        float _2459 = rint(_2336);
        float _2461 = precise::max(_2459, 0.0);
        uint _2463 = uint(_2461);
        uint _2465 = clamp(_2463, 0u, 65535u);
        _2457 = as_type<float>(_2465);
    }
    float _2467 = _2457;
    float _2469 = _2467;
    if (!_1960)
    {
        float3 _6774 = float3(_2386, _2208, float(as_type<int>(_2467)));
        float3 _6776 = select(_6774, float3(0.0), isnan(_6774));
        float _2471 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6776.xy, uint(rint(_6776.z)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6776.xy, uint(rint(_6776.z)), level(0.0)).x;
        _2469 = _2471;
    }
    float _2473 = _2469;
    float _2475 = abs(_1818);
    float _2477 = log2(_2475);
    float _2479 = _2298 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2481 = fma(_2312, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2479);
    float _2483 = fma(_2070, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2481);
    float _2485 = _2240 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2487 = _1818 <= 8000.0;
    bool _2489 = isnan(_1818);
    bool _2491 = _2487 || _2489;
    bool _2493 = isnan(8000.0);
    bool _2495 = _2491 || _2493;
    float _2497 = float(_2495);
    float _2499 = fma(_2338, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2483);
    float _2501 = _2477 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2503 = exp2(_2485);
    if (!_2342)
    {
        _2392 = 1.0;
    }
    float _2505 = _2392;
    out.gl_Position.x = _2408;
    out.gl_Position.y = _2410;
    out.gl_Position.z = _2499;
    out.gl_Position.w = _2352;
    float _2507 = exp2(_2501);
    float _2509 = fma(_2507, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2511 = precise::clamp(_2509, 0.0, 1.0);
    float _2513 = fma(_2511, -2.0, 3.0);
    float _2515 = _2511 * _2511;
    float _2517 = _2515 * _2513;
    float _2519 = _2499 + _2352;
    float _2521 = _2519 * 0.5;
    float _2523 = -_2517;
    float _2525 = _2523 + 1.0;
    out.m_90.z = _2521;
    out.m_90.w = _2352;
    float _2527 = fma(_2525, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2517);
    float _2529 = _2497 * _2527;
    float _2531 = -_2503;
    float _2533 = _2531 + 1.0;
    float _2535 = _2529 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2537 = _2533 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2539 = -_2174;
    float _2541 = _2539 + 1.0;
    float _2543 = _2505;
    float _2545 = _2535;
    if (_2342)
    {
        bool _2547 = _2432 >= _2412;
        bool _2549 = isnan(_2432);
        bool _2551 = _2547 || _2549;
        bool _2553 = isnan(_2412);
        bool _2555 = _2551 || _2553;
        float _2557 = float(_2555);
        _2543 = _2557;
    }
    float _2559 = _2543;
    float _2561 = _2541 * _2535;
    float _2563 = precise::clamp(_2561, 0.0, 1.0);
    if (_1960)
    {
        _2545 = 1.0;
    }
    float _2565 = _2545;
    float _2567 = _2565;
    if (!_1960)
    {
        int _2569 = _2108 << 4;
        int _2571 = _2569 + 2048;
        uint _2573 = uint(int(uint(_2571) >> uint(2)));
        uint _2575 = uint(int(uint(int(_2573)) >> uint(2)));
        int _2577 = int(_2573) & 3;
        float _2579 = (*spvDescriptorSet0.vp_c15)._m0[int(_2575)][_2577];
        int _2581 = int(_2573) + 1;
        uint _2583 = uint(int(uint(_2581) >> uint(2)));
        int _2585 = _2581 & 3;
        float _2587 = (*spvDescriptorSet0.vp_c15)._m0[int(_2583)][_2585];
        int _2589 = _2571 + 8;
        uint _2591 = uint(int(uint(_2589) >> uint(2)));
        uint _2593 = uint(int(uint(int(_2591)) >> uint(2)));
        int _2595 = int(_2591) & 3;
        float _2597 = (*spvDescriptorSet0.vp_c15)._m0[int(_2593)][_2595];
        int _2599 = int(_2591) + 1;
        uint _2601 = uint(int(uint(_2599) >> uint(2)));
        int _2603 = _2599 & 3;
        float _2605 = (*spvDescriptorSet0.vp_c15)._m0[int(_2601)][_2603];
        float _2607 = _1772 * _2587;
        float _2609 = fma(_1126, _2579, _2607);
        float _2611 = fma(_1150, _2597, _2609);
        float _2613 = _2611 + _2605;
        float _2615 = precise::clamp(_2613, 0.0, 1.0);
        float _2617 = -_2615;
        float _2619 = _2617 + _2473;
        float _2621 = fma(_2619, 500.0, 1.5);
        float _2623 = exp2(_2621);
        float _2625 = 0.0 + _2623;
        float _2627 = precise::clamp(_2625, 0.0, 1.0);
        _2567 = _2627;
        _1328 = _2623;
    }
    float _2629 = _2567;
    float _2631 = _1328;
    float _2633 = _2537 * _2434;
    float _2635 = _2559 * _2629;
    float _2637 = -_2563;
    float _2639 = fma(_2637, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2641 = -_2537;
    float _2643 = _2641 + 1.0;
    float _2645 = _2445 * _2633;
    float _2647 = _2455 * _2633;
    float _2649 = -_2635;
    float _2651 = fma(_2649, _2639, 1.0);
    float _2653 = precise::clamp(_2651, 0.0, 1.0);
    float _2655 = _2445 * _2643;
    float _2657 = fma(_2451, _2645, _2439);
    float _2659 = fma(_2453, _2645, _2441);
    float _2661 = _2653 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2663 = fma(_2445, _2647, _2443);
    out.m_92.x = _1704;
    out.m_92.y = _1702;
    out.m_92.z = _1706;
    bool _2665 = _1740 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2667 = isnan(_1740);
    bool _2669 = _2665 || _2667;
    bool _2671 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2673 = _2669 || _2671;
    out.m_94.x = _2661;
    out.m_96.x = _2657;
    out.m_96.y = _2659;
    out.m_96.z = _2663;
    out.m_96.w = _2655;
    float _2675 = _2633;
    float _2677 = _2643;
    float _2679 = _2635;
    float _2681 = _2653;
    float _2683 = _2631;
    if (!_2673)
    {
        _2675 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2685 = _2675;
    float _2687 = _2685;
    float _2689 = _2685;
    if (!_2673)
    {
        _2677 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2691 = _2677;
    float _2693 = _2691;
    float _2695 = _2691;
    if (!_2673)
    {
        _2679 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2697 = _2679;
    float _2699 = _2697;
    float _2701 = _2697;
    if (!_2673)
    {
        _2681 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2703 = _2681;
    float _2705 = _2703;
    float _2707 = _2703;
    if (!_2673)
    {
        _1330 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2709 = _1330;
    float _2711 = _2709;
    float _2713 = _2709;
    if (!_2673)
    {
        _2683 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2715 = _2683;
    bool _2717 = !_2673;
    float _2719 = _2715;
    float _2721 = _2715;
    if (!_2717)
    {
        bool _2723 = _1740 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2725 = isnan(_1740);
        bool _2727 = _2723 || _2725;
        bool _2729 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2731 = _2727 || _2729;
        if (!_2731)
        {
            float _2733 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2735 = _1740 + _2733;
            float _2737 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2739 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2737;
            float _2741 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2743 = _2741 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2745 = 1.0 / _2739;
            float _2747 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2749 = _2747 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2751 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2753 = _2751 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2755 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2757 = _2755 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2759 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2761 = _2759 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2763 = _2735 * _2745;
            float _2765 = precise::clamp(_2763, 0.0, 1.0);
            float _2767 = fma(_2765, _2743, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2769 = fma(_2765, _2749, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2771 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2773 = _2771 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2775 = fma(_2765, _2753, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2777 = fma(_2765, _2757, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2779 = fma(_2765, _2761, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            float _2781 = fma(_2765, _2773, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _2695 = _2769;
            _2713 = _2777;
            _2689 = _2767;
            _2707 = _2775;
            _2701 = _2781;
            _2721 = _2779;
            _2783 = true;
        }
        else
        {
            bool _2785 = _1740 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2787 = isnan(_1740);
            bool _2789 = _2785 || _2787;
            bool _2791 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2793 = _2789 || _2791;
            if (!_2793)
            {
                _2687 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2795 = _2687;
            _2689 = _2795;
            if (!_2793)
            {
                _2693 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2797 = _2693;
            _2695 = _2797;
            if (!_2793)
            {
                _2699 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2799 = _2699;
            _2701 = _2799;
            if (!_2793)
            {
                _2705 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2801 = _2705;
            _2707 = _2801;
            if (!_2793)
            {
                _2711 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2803 = _2711;
            _2713 = _2803;
            if (!_2793)
            {
                _2719 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2805 = _2719;
            bool _2807 = !_2793;
            _2721 = _2805;
            if (!_2807)
            {
                bool _2809 = _1740 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2811 = isnan(_1740);
                bool _2813 = _2809 || _2811;
                bool _2815 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2817 = _2813 || _2815;
                if (!_2817)
                {
                    float _2819 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2821 = _1740 + _2819;
                    float _2823 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2825 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2823;
                    float _2827 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2829 = _2827 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2831 = 1.0 / _2825;
                    float _2833 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2835 = _2833 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2837 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2839 = _2837 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2841 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2843 = _2841 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2845 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2847 = _2845 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2849 = _2821 * _2831;
                    float _2851 = precise::clamp(_2849, 0.0, 1.0);
                    float _2853 = fma(_2851, _2829, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2855 = fma(_2851, _2835, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2857 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2859 = _2857 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2861 = fma(_2851, _2839, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2863 = fma(_2851, _2843, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2865 = fma(_2851, _2847, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    float _2867 = fma(_2851, _2859, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _2695 = _2855;
                    _2713 = _2863;
                    _2689 = _2853;
                    _2707 = _2861;
                    _2701 = _2867;
                    _2721 = _2865;
                    _2783 = true;
                }
                else
                {
                    _2695 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2713 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2689 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2707 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2701 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2721 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2783 = false;
    float _2869 = _2695;
    float _2871 = _2713;
    float _2873 = _2689;
    float _2875 = _2707;
    float _2877 = _2701;
    float _2879 = _2721;
    float _2881 = fma(_1606, -0.5, 0.5);
    float _2883 = precise::clamp(_2881, 0.0, 1.0);
    float _2885 = -_2869;
    float _2887 = _2885 + _2871;
    float _2889 = -_2873;
    float _2891 = _2889 + _2875;
    float _2893 = -_2877;
    float _2895 = _2893 + _2879;
    bool _2897 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2899 = fma(_2883, _2887, _2869);
    float _2901 = fma(_2883, _2891, _2873);
    float _2903 = fma(_2883, _2895, _2877);
    float _2905 = _2899 * 0.586610972881317138671875;
    out.m_98.x = 0.0;
    float _2907 = fma(_2901, 0.298911988735198974609375, _2905);
    float _2909 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2911 = fma(_2903, 0.114477999508380889892578125, _2907);
    out.m_61.x = _2909;
    float _2913 = -_2911;
    float _2915 = _2901 + _2913;
    float _2917 = -_2911;
    float _2919 = _2899 + _2917;
    float _2921 = -_2911;
    float _2923 = _2903 + _2921;
    float _2925 = fma(_2915, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2911);
    float _2927 = fma(_2919, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2911);
    float _2929 = fma(_2923, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2911);
    out.m_100.x = _2925;
    out.m_100.y = _2927;
    out.m_100.z = _2929;
    if (!_2897)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2931 = -_1702;
    float _2933 = _2931 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2935 = -_1704;
    float _2937 = _2935 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2939 = -_1706;
    float _2941 = _2939 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2943 = _2933 * _2933;
    float _2945 = fma(_2937, _2937, _2943);
    float _2947 = fma(_2941, _2941, _2945);
    float _2949 = sqrt(_2947);
    float _2951 = rsqrt(_2947);
    float _2953 = -_2949;
    float _2955 = _2953 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2957 = _2955 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2959 = precise::clamp(_2957, 0.0, 1.0);
    float _2961 = _2937 * _2951;
    float _2963 = _2933 * _2951;
    float _2965 = abs(_2959);
    float _2967 = log2(_2965);
    float _2969 = _2941 * _2951;
    float _2971 = _2961 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2973 = _1606 * _2963;
    float _2975 = -_2963;
    float _2977 = -_2971;
    float _2979 = fma(_2975, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2977);
    float _2981 = fma(_1604, _2961, _2973);
    float _2983 = -_2969;
    float _2985 = fma(_2983, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2979);
    float _2987 = fma(_1608, _2969, _2981);
    float _2989 = precise::clamp(_2987, 0.0, 1.0);
    float _2991 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2993 = _2985 + _2991;
    float _2995 = _2967 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2997 = _2993 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2999 = precise::clamp(_2997, 0.0, 1.0);
    float _3001 = exp2(_2995);
    float _3003 = _3001 * _2999;
    float _3005 = _2989 * _3003;
    float _3007 = _3005 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3009 = _3005 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3011 = _3005 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_98.x = _3007;
    out.m_98.y = _3009;
    out.m_98.z = _3011;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

