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
    float4 m_74 [[user(locn1)]];
    float4 m_94 [[user(locn2)]];
    float4 m_82 [[user(locn3)]];
    float4 m_61 [[user(locn4)]];
    float4 m_78 [[user(locn6)]];
    float4 m_84 [[user(locn7)]];
    float4 m_86 [[user(locn8)]];
    float4 m_76 [[user(locn9)]];
    float4 m_92 [[user(locn10)]];
    float4 m_88 [[user(locn11)]];
    float4 m_90 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_70 [[attribute(1)]];
    float4 m_58 [[attribute(2)]];
    float4 m_63 [[attribute(3)]];
    float4 m_68 [[attribute(4)]];
    float4 m_72 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3783 = false;
    bool _2660 = false;
    bool _209 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _108 = in.m_58.w;
    float _110 = trunc(_108);
    int _113 = int(_110);
    bool _117 = _113 >= 1;
    float _119 = 0.0;
    if (!_117)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _119;
    float _123 = _121;
    if (!_117)
    {
        out.m_61.x = 0.0;
    }
    int _125 = 0;
    if (!_117)
    {
        float _127 = _121 * 5.0;
        _125 = as_type<int>(_127);
    }
    int _129 = _125;
    int _131 = _129;
    if (!_117)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4068 = as_type<float>(_129);
        out.gl_Position.z = _4068;
    }
    if (!_117)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _133 = in.m_63.w;
    bool _135 = _133 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _137 = isnan(_133);
    bool _139 = _135 || _137;
    bool _141 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _143 = _139 || _141;
    float _145 = -_133;
    float _147 = _145 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _149 = 0.0;
    float _151 = _147;
    if (_143)
    {
        float _153 = float(_113);
        _149 = _153;
    }
    float _155 = _149;
    bool _157 = _147 >= _155;
    bool _159 = !_143;
    bool _161 = _157 || _159;
    if (_161)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _163 = _123;
    if (_161)
    {
        out.m_61.x = 0.0;
    }
    if (_161)
    {
        float _165 = _163 * 5.0;
        _131 = as_type<int>(_165);
    }
    int _167 = _131;
    if (_161)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4137 = as_type<float>(_167);
        out.gl_Position.z = _4137;
    }
    if (_161)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _169 = as_type<float>(int(gl_VertexIndex));
    bool _171 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _173 = as_type<int>(_169) & 1;
    bool _175 = _173 != 0;
    int _177 = as_type<int>(_169) & 2;
    bool _179 = _177 != 0;
    bool _181 = !_175;
    float _183 = _181 ? (-0.5) : 0.5;
    bool _185 = !_179;
    float _187 = _185 ? (-0.5) : 0.5;
    bool _189 = !_171;
    float _207;
    if (!_189)
    {
        float _191 = in.m_68.x;
        float _193 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _195 = _191 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _197 = fma(_195, (*spvDescriptorSet0.vp_c9)._m0[12].x, _147);
        float _199 = _197 * _193;
        float _201 = floor(_199);
        float _203 = -_201;
        float _205 = _199 + _203;
        _207 = _205;
        _209 = true;
    }
    else
    {
        float _211 = float(_113);
        float _213 = 1.0 / _211;
        float _215 = _147 * _213;
        _207 = _215;
    }
    _209 = false;
    float _217 = _207;
    float _219 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _221 = int(_219);
    float _223 = in.m_68.x;
    float _225 = float(_113);
    float _227 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _229 = _217 + _227;
    float _231 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _233 = _217 + _231;
    float _235 = in.m_68.y;
    float _237 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _239 = int(_237);
    float _241 = in.m_68.z;
    bool _243 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _245 = isnan(_217);
    bool _247 = _243 || _245;
    bool _249 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _251 = _247 || _249;
    float _253 = float(_251);
    float _255 = in.m_68.w;
    float _257 = float(_221);
    float _259 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _261 = int(_259);
    float _263 = -_253;
    float _265 = _263 + 1.0;
    float _267 = float(_239);
    float _269 = 1.0 / _257;
    float _271 = _223 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _273 = _235 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _275 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _277 = int(_275);
    float _279 = float(uint(_261));
    bool _281 = _261 == 0;
    int _283 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _285 = _283 != 0;
    float _287 = 1.0 / _267;
    float _289 = _269 * _147;
    float _291 = float(uint(_277));
    float _293 = 1.0 / _279;
    int _295 = ~_277;
    int _297 = _295 + 1;
    int _299 = ~_277;
    int _301 = _299 + 1;
    float _303 = _287 * _147;
    float _305 = trunc(_289);
    int _307 = int(_305);
    float _309 = 1.0 / _291;
    int _311 = as_type<int>(_293) + (-2);
    float _313 = trunc(_303);
    int _315 = int(_313);
    float _317 = float(uint(_307));
    float _319 = as_type<float>(_311) * _317;
    float _321 = _317;
    int _323 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    if (_285)
    {
        _321 = 1.0;
    }
    float _325 = _321;
    float _327 = 1.0 / _225;
    int _329 = as_type<int>(_309) + (-2);
    int _331 = ~_261;
    int _333 = _331 + 1;
    float _335 = _325;
    if (!_285)
    {
        _335 = 7.345489978790283203125;
    }
    float _337 = _335;
    float _339 = float(uint(_315));
    float _341 = trunc(_319);
    float _343 = precise::max(_341, 0.0);
    uint _346 = uint(_343);
    float _348 = as_type<float>(_329) * _339;
    float _350 = trunc(_348);
    float _352 = precise::max(_350, 0.0);
    uint _354 = uint(_352);
    int _356 = _333 * int(_346);
    int _358 = _356 + _307;
    float _360 = _337 * _223;
    float _362 = float(uint(_358));
    float _364 = floor(_360);
    int _366 = _297 * int(_354);
    int _368 = _366 + _315;
    float _370 = float(uint(_368));
    float _372 = as_type<float>(_311) * _362;
    float _374 = _362;
    float _376 = _370;
    if (_285)
    {
        _374 = 1.0;
    }
    float _378 = _374;
    float _380 = _378;
    if (!_285)
    {
        _380 = 1.2345600128173828125;
    }
    float _382 = _380;
    float _384 = trunc(_372);
    float _386 = precise::max(_384, 0.0);
    uint _388 = uint(_386);
    float _390 = as_type<float>(_329) * _370;
    if (_285)
    {
        _376 = _223;
    }
    float _392 = _376;
    float _394 = _392;
    if (!_285)
    {
        _394 = _235;
    }
    float _396 = _394;
    float _398 = -_364;
    float _400 = _360 + _398;
    int _402 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _404 = _402 != 0;
    float _406 = trunc(_390);
    float _408 = precise::max(_406, 0.0);
    uint _410 = uint(_408);
    float _412 = _396 * _382;
    int _414 = ~_261;
    int _416 = _414 + 1;
    float _418 = float(_261);
    float _420 = float(_307);
    int _422 = int(_346) + int(_388);
    float _424 = floor(_412);
    bool _426 = _420 >= _418;
    bool _428 = isnan(_420);
    bool _430 = _426 || _428;
    bool _432 = isnan(_418);
    bool _434 = _430 || _432;
    float _436 = float(_434);
    float _438 = _400 * _418;
    int _440 = _416 * _422;
    int _442 = _440 + _307;
    int _444 = int(_354) + int(_410);
    float _446 = trunc(_436);
    int _448 = int(_446);
    bool _450 = uint(_442) >= uint(_261);
    int _452 = _301 * _444;
    int _454 = _452 + _315;
    bool _456 = !_404;
    int _458 = _456 ? 0 : 1;
    bool _460 = !_450;
    int _462 = _460 ? 0 : (-1);
    float _464 = trunc(_438);
    int _466 = int(_464);
    float _468 = -_424;
    float _470 = _412 + _468;
    int _472 = abs(_458);
    int _474 = ~_422;
    int _476 = _474 + _462;
    int _478 = _476 + 1;
    bool _480 = uint(_454) >= uint(_277);
    float _482 = _327 * _147;
    int _484 = _261 * _478;
    int _486 = _484 + _307;
    int _488 = ~_448;
    int _490 = _488 + 1;
    int _492 = _490 + 1;
    float _494 = _418 * _482;
    int _496 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _498 = _496 != 0;
    int _500 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _502 = _500 != 0;
    int _504 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _506 = _504 != 0;
    bool _508 = !_281;
    int _510 = _508 ? _486 : (-1);
    bool _512 = !_480;
    int _514 = _512 ? 0 : (-1);
    int _516 = _466 * _472;
    int _518 = _516 + _307;
    float _520 = float(_277);
    int _522 = _510 * _492;
    bool _524 = !_502;
    int _526 = _524 ? 0 : 1;
    float _528 = trunc(_494);
    int _530 = int(_528);
    float _532 = float(_315);
    int _534 = ~_444;
    int _536 = _534 + _514;
    int _538 = _536 + 1;
    int _540 = _261 + (-1);
    int _542 = abs(_526);
    int _544 = _277 * _538;
    int _546 = _544 + _315;
    bool _548 = _532 >= _520;
    bool _550 = isnan(_532);
    bool _552 = _548 || _550;
    bool _554 = isnan(_520);
    bool _556 = _552 || _554;
    float _558 = float(_556);
    int _560 = _448 * _540;
    int _562 = _560 + _522;
    bool _564 = !_506;
    int _566 = _564 ? 0 : 1;
    bool _568 = !_498;
    int _570 = _568 ? 0 : 1;
    int _572 = _562 * _542;
    int _574 = abs(_566);
    float _576 = trunc(_558);
    int _578 = int(_576);
    float _580 = _470 * _520;
    int _582 = abs(_570);
    float _584 = _520 * _482;
    int _586 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _588 = _586 != 0;
    int _590 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _592 = _590 != 0;
    int _594 = _530 * _582;
    int _596 = _594 + _572;
    float _598 = trunc(_580);
    int _600 = int(_598);
    bool _602 = !_588;
    int _604 = _602 ? 0 : 1;
    bool _606 = !_592;
    int _608 = _606 ? 0 : 1;
    int _610 = _518 * _574;
    int _612 = _610 + _596;
    bool _614 = _277 == 0;
    int _616 = abs(_604);
    float _618 = trunc(_584);
    int _620 = int(_618);
    int _622 = abs(_608);
    int _624 = ~_578;
    int _626 = _624 + 1;
    int _628 = _626 + 1;
    bool _630 = !_614;
    int _632 = _630 ? _546 : (-1);
    int _634 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _636 = _634 != 0;
    int _638 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _640 = _638 != 0;
    int _642 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _644 = _642 != 0;
    int _646 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _648 = _646 != 0;
    int _650 = _600 * _616;
    int _652 = _650 + _315;
    int _654 = _277 + (-1);
    int _656 = _632 * _628;
    bool _658 = _261 == 0;
    int _660 = _466 * _622;
    int _662 = _660 + _612;
    bool _664 = !_640;
    int _666 = _664 ? 0 : 1;
    int _668 = _578 * _654;
    int _670 = _668 + _656;
    bool _672 = !_636;
    int _674 = _672 ? 0 : 1;
    float _676 = float(uint(_662));
    int _678 = abs(_666);
    bool _680 = !_644;
    int _682 = _680 ? 0 : 1;
    float _684 = as_type<float>(_311) * _676;
    int _686 = abs(_674);
    bool _688 = !_648;
    int _690 = _688 ? 0 : 1;
    int _692 = abs(_682);
    int _694 = _670 * _678;
    int _696 = abs(_690);
    float _698 = trunc(_684);
    float _700 = precise::max(_698, 0.0);
    uint _702 = uint(_700);
    int _704 = _620 * _686;
    int _706 = _704 + _694;
    float _708 = float(uint(_518));
    int _710 = _652 * _692;
    int _712 = _710 + _706;
    int _714 = ~_261;
    int _716 = _714 + 1;
    int _718 = ~_277;
    int _720 = _718 + 1;
    int _722 = _600 * _696;
    int _724 = _722 + _712;
    float _726 = as_type<float>(_311) * _708;
    float _728 = float(uint(_652));
    float _730 = float(uint(_724));
    int _732 = _716 * int(_702);
    int _734 = _732 + _662;
    int _736 = ~_261;
    int _738 = _736 + 1;
    float _740 = as_type<float>(_329) * _728;
    int _742 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _744 = _742 != 0;
    float _746 = as_type<float>(_329) * _730;
    float _748 = float(uint(_734));
    float _750 = trunc(_726);
    float _752 = precise::max(_750, 0.0);
    uint _754 = uint(_752);
    int _756 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _758 = _756 != 0;
    float _760 = as_type<float>(_311) * _748;
    bool _762 = !_758;
    int _764 = _762 ? 0 : 1;
    float _766 = trunc(_746);
    float _768 = precise::max(_766, 0.0);
    uint _770 = uint(_768);
    float _772 = as_type<float>(_518);
    if (_744)
    {
        _323 = 0;
    }
    int _774 = _323;
    int _776 = _774;
    if (!_744)
    {
        _776 = 1;
    }
    int _778 = _776;
    float _780 = trunc(_760);
    float _782 = precise::max(_780, 0.0);
    uint _784 = uint(_782);
    int _786 = ~_261;
    int _788 = _786 + 1;
    int _790 = _788 * int(_754);
    int _792 = _790 + _518;
    int _794 = _720 * int(_770);
    int _796 = _794 + _724;
    float _798 = trunc(_740);
    float _800 = precise::max(_798, 0.0);
    uint _802 = uint(_800);
    float _804 = float(uint(_792));
    float _806 = float(uint(_796));
    int _808 = ~_277;
    int _810 = _808 + 1;
    float _812 = as_type<float>(_311) * _804;
    int _814 = int(_702) + int(_784);
    float _816 = as_type<float>(_329) * _806;
    float _818 = trunc(_816);
    float _820 = precise::max(_818, 0.0);
    uint _822 = uint(_820);
    int _824 = _738 * _814;
    int _826 = _824 + _662;
    int _828 = _810 * int(_802);
    int _830 = _828 + _652;
    bool _832 = uint(_826) >= uint(_261);
    float _834 = trunc(_812);
    float _836 = precise::max(_834, 0.0);
    uint _838 = uint(_836);
    float _840 = float(uint(_830));
    bool _842 = !_832;
    int _844 = _842 ? 0 : (-1);
    int _846 = ~_814;
    int _848 = _846 + _844;
    int _850 = _848 + 1;
    int _852 = ~_277;
    int _854 = _852 + 1;
    int _856 = int(_770) + int(_822);
    int _858 = _261 * _850;
    int _860 = _858 + _662;
    float _862 = as_type<float>(_329) * _840;
    int _864 = _854 * _856;
    int _866 = _864 + _724;
    bool _868 = !_658;
    int _870 = _868 ? _860 : (-1);
    int _872 = int(_754) + int(_838);
    int _874 = _870 & 3;
    bool _876 = _874 != 0;
    float _878 = trunc(_862);
    float _880 = precise::max(_878, 0.0);
    uint _882 = uint(_880);
    bool _884 = uint(_866) >= uint(_277);
    bool _886 = uint(_874) >= 2u;
    bool _888 = !_884;
    int _890 = _888 ? 0 : (-1);
    int _892 = _886 ? 0 : 1;
    bool _894 = _874 != 3;
    int _896 = _870 & 3;
    bool _898 = _896 != 0;
    int _900 = ~_856;
    int _902 = _900 + _890;
    int _904 = _902 + 1;
    int _906 = _898 ? 0 : 1;
    int _908 = ~_261;
    int _910 = _908 + 1;
    int _912 = _277 * _904;
    int _914 = _912 + _724;
    bool _916 = uint(_874) > 1u;
    int _918 = ~_892;
    int _920 = _918 + 1;
    int _922 = _920 + 1;
    int _924 = _910 * _872;
    int _926 = _924 + _518;
    int _928 = _922;
    if (_894)
    {
        int _930 = ~_892;
        int _932 = _930 + 1;
        _928 = _932;
    }
    int _934 = _928;
    float _936 = _223 * 2.0;
    bool _938 = _277 == 0;
    float _940 = _235 * 2.0;
    int _942 = int(_802) + int(_882);
    bool _944 = !_938;
    int _946 = _944 ? _914 : (-1);
    float _948 = floor(_940);
    bool _950 = uint(_926) >= uint(_261);
    int _952 = _946 & 3;
    bool _954 = _952 != 0;
    int _956 = ~_906;
    int _958 = _956 + 1;
    int _960 = _958 + 1;
    int _962 = _960;
    float _964 = _940;
    if (!_916)
    {
        int _966 = ~_906;
        int _968 = _966 + 1;
        _962 = _968;
    }
    int _970 = _962;
    float _972 = floor(_936);
    int _974 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _976 = _974 != 0;
    bool _978 = !_950;
    int _980 = _978 ? 0 : (-1);
    bool _982 = uint(_952) > 1u;
    bool _984 = !_976;
    int _986 = _984 ? 0 : 1;
    int _988 = ~_277;
    int _990 = _988 + 1;
    int _992 = _946 & 3;
    bool _994 = _992 != 0;
    bool _996 = _952 != 3;
    int _998 = _990 * _942;
    int _1000 = _998 + _652;
    int _1002 = _994 ? 0 : 1;
    bool _1004 = uint(_952) >= 2u;
    int _1006 = ~_1002;
    int _1008 = _1006 + 1;
    int _1010 = _1008 + 1;
    int _1012 = _1010;
    if (!_982)
    {
        int _1014 = ~_1002;
        int _1016 = _1014 + 1;
        _1012 = _1016;
    }
    int _1018 = _1012;
    bool _1020 = uint(_1000) >= uint(_277);
    float _1022 = _1004 ? 0.0 : 1.4012984643248170709237295832899e-45;
    bool _1024 = _778 != 1;
    bool _1026 = !_1020;
    int _1028 = _1026 ? 0 : (-1);
    bool _1030 = _972 > 0.0;
    int _1032 = ~as_type<int>(_1022);
    int _1034 = _1032 + 1;
    int _1036 = _1034 + 1;
    int _1038 = ~_872;
    int _1040 = _1038 + _980;
    int _1042 = _1040 + 1;
    int _1044 = _1036;
    float _1046 = _972;
    float _1048 = _1022;
    if (_996)
    {
        int _1050 = ~as_type<int>(_1022);
        int _1052 = _1050 + 1;
        _1044 = _1052;
    }
    int _1054 = _1044;
    bool _1056 = _972 >= 0.0;
    bool _1058 = isnan(_972);
    bool _1060 = _1056 || _1058;
    bool _1062 = isnan(0.0);
    bool _1064 = _1060 || _1062;
    int _1066 = _261 * _1042;
    int _1068 = _1066 + _518;
    if (!_1024)
    {
        _772 = _235;
    }
    float _1070 = _772;
    int _1072 = _1064 ? 0 : 1;
    float _1074 = _1070;
    if (!_1024)
    {
        _1046 = _235;
    }
    float _1076 = _1046;
    float _1078 = _1076;
    if (!_1024)
    {
        _1048 = _241;
    }
    float _1080 = _1048;
    float _1082 = _1080;
    if (!_1024)
    {
        _964 = _241;
    }
    float _1084 = _964;
    int _1086 = ~_1072;
    int _1088 = _1086 + 1;
    int _1090 = _1088 + 1;
    float _1092 = _1084;
    int _1094 = _1090;
    if (_1024)
    {
        _1074 = _223;
    }
    float _1096 = _1074;
    if (_1024)
    {
        _1078 = _223;
    }
    float _1098 = _1078;
    if (_1024)
    {
        _1082 = _235;
    }
    float _1100 = _1082;
    if (_1024)
    {
        _1092 = _235;
    }
    float _1102 = _1092;
    if (!_1030)
    {
        int _1104 = ~_1072;
        int _1106 = _1104 + 1;
        _1094 = _1106;
    }
    int _1108 = _1094;
    float _1110 = _1100 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _1112 = !_876;
    int _1114 = _1112 ? 0 : 1;
    bool _1116 = !_954;
    int _1118 = _1116 ? 0 : 1;
    int _1120 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1122 = _1120 != 0;
    int _1124 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1126 = _1124 != 0;
    int _1128 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1130 = _1128 != 0;
    bool _1132 = _874 != 3;
    float _1134 = in.m_58.x;
    float _1136 = in.m_58.y;
    float _1138 = in.m_58.z;
    float _1140 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1142 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _1140;
    float _1144 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1146 = _1144 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1148 = _948 > 0.0;
    bool _1150 = _948 >= 0.0;
    bool _1152 = isnan(_948);
    bool _1154 = _1150 || _1152;
    bool _1156 = isnan(0.0);
    bool _1158 = _1154 || _1156;
    float _1160 = 1.0 / _1146;
    bool _1162 = !_658;
    int _1164 = _1162 ? _1068 : (-1);
    int _1166 = _1158 ? 0 : 1;
    bool _1168 = _952 != 3;
    int _1170 = ~_1166;
    int _1172 = _1170 + 1;
    int _1174 = _1172 + 1;
    float _1176 = 1.0 / _1142;
    bool _1178 = !_1168;
    int _1180 = _1178 ? 0 : (-1);
    int _1182 = _1174;
    if (!_1148)
    {
        int _1184 = ~_1166;
        int _1186 = _1184 + 1;
        _1182 = _1186;
    }
    int _1188 = _1182;
    int _1190 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1192 = _1190 != 0;
    int _1194 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1196 = _1194 != 0;
    int _1198 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1200 = _1198 != 0;
    float _1202 = _229 * _1160;
    float _1204 = _241 * 2.0;
    bool _1206 = !_1196;
    int _1208 = _1206 ? 0 : 1;
    float _1210 = _1136 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _1212 = _255 > 0.5;
    float _1214 = _1136 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1216 = _1136 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1218 = floor(_1204);
    float _1220 = fma(_1134, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1210);
    float _1222 = fma(_1134, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1214);
    float _1224 = fma(_1134, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1216);
    float _1226 = _223 + _235;
    float _1228 = _223 + _241;
    float _1230 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1232 = _233 * _1176;
    float _1234 = _241 + _235;
    float _1236 = _1226 + (-1.0);
    float _1238 = _1228 + (-1.0);
    bool _1240 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1242 = isnan(_217);
    bool _1244 = _1240 || _1242;
    bool _1246 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _1248 = _1244 || _1246;
    float _1250 = float(_1248);
    float _1252 = -_1230;
    float _1254 = fma(_271, 2.0, _1252);
    float _1256 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1258 = _1234 + (-1.0);
    float _1260 = fma(_1236, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1262 = fma(_1238, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1264 = -_1250;
    float _1266 = _1264 + 1.0;
    float _1268 = fma(_273, -2.0, _1256);
    float _1270 = fma(_1258, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1272 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1274 = isnan(_217);
    bool _1276 = _1272 || _1274;
    bool _1278 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1280 = _1276 || _1278;
    float _1282 = float(_1280);
    float _1284 = _253 * _1266;
    bool _1286 = !_1192;
    int _1288 = _1286 ? 0 : 1;
    float _1290 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1292 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1290;
    float _1294 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1296 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1294;
    bool _1298 = _1218 >= 0.0;
    bool _1300 = isnan(_1218);
    bool _1302 = _1298 || _1300;
    bool _1304 = isnan(0.0);
    bool _1306 = _1302 || _1304;
    float _1308 = _1282 * _265;
    float _1310 = fma(_1292, _1232, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _1312 = fma(_1296, _1232, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    int _1314 = _1306 ? 0 : 1;
    float _1316 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1318 = _1316 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _1320 = _1218 > 0.0;
    float _1322 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1324 = log2(_1322);
    float _1326 = _1310 * _1308;
    float _1328 = _1312 * _1308;
    float _1330 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1332 = _1330 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1334 = -_1282;
    float _1336 = _1334 + 1.0;
    bool _1338 = !_1132;
    int _1340 = _1338 ? 0 : (-1);
    float _1342 = fma(_1318, _1202, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    int _1344 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1346 = _1344 != 0;
    float _1348 = fma(_1332, _1202, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _1350 = !_1200;
    int _1352 = _1350 ? 0 : 1;
    float _1354 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _1356 = ~_1314;
    int _1358 = _1356 + 1;
    int _1360 = _1358 + 1;
    float _1362 = fma(_1336, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1326);
    int _1364 = _1360;
    if (!_1320)
    {
        int _1366 = ~_1314;
        int _1368 = _1366 + 1;
        _1364 = _1368;
    }
    int _1370 = _1364;
    float _1372 = fma(_1098, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1354);
    float _1374 = fma(_1336, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1328);
    float _1376 = fma(_1342, _1284, _1362);
    int _1378 = abs(_1352);
    float _1380 = _1324 * _147;
    float _1382 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _1384 = abs(_1208);
    float _1386 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1388 = float(_1108);
    float _1390 = exp2(_1380);
    float _1392 = float(_1188);
    float _1394 = _1096 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1396 = float(_1378);
    float _1398 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1400 = float(_1384);
    float _1402 = fma(_1110, -2.0, _1382);
    bool _1404 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1406 = isnan(0.0);
    bool _1408 = _1404 || _1406;
    bool _1410 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1412 = _1408 || _1410;
    float _1414 = -_1398;
    float _1416 = fma(_1394, 2.0, _1414);
    float _1418 = _1396 * _1392;
    int _1420 = abs(_1288);
    float _1422 = _1400 * _1388;
    float _1424 = in.m_70.x;
    float _1426 = in.m_70.y;
    float _1428 = in.m_70.z;
    float _1430 = fma(_1102, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1386);
    float _1432 = float(_1420);
    float _1434 = -_1390;
    float _1436 = _1434 + 1.0;
    float _1438 = float(_1370);
    float _1440 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1442 = 1.0 + _1440;
    float _1444 = _1422 * (-2.0);
    float _1446 = _1432 * _1438;
    float _1448 = _1412 ? _1436 : 0.0;
    float _1450 = 1.0 / _1442;
    bool _1452 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1454 = isnan(1.0);
    bool _1456 = _1452 || _1454;
    bool _1458 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1460 = _1456 || _1458;
    float _1462 = -_147;
    float _1464 = fma(_1462, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1254);
    float _1466 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1468 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1470 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1430);
    float _1472 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1372);
    float _1474 = fma(_1270, _1444, _1270);
    float _1476 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1402);
    float _1478 = _1446 * (-2.0);
    int _1480 = ~_942;
    int _1482 = _1480 + _1028;
    int _1484 = _1482 + 1;
    float _1486 = _1418 * (-2.0);
    float _1488 = fma(_223, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1466);
    float _1490 = fma(_235, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1468);
    float _1492 = fma(_1444, _1426, _1426);
    float _1494 = fma(_1260, _1478, _1260);
    float _1496 = fma(_1478, _1424, _1424);
    float _1498 = fma(_1262, _1486, _1262);
    float _1500 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1488);
    int _1502 = _277 * _1484;
    int _1504 = _1502 + _652;
    float _1506 = in.m_72.x;
    float _1508 = in.m_72.y;
    float _1510 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1268);
    float _1512 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1490);
    float _1514 = -_147;
    float _1516 = fma(_1514, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1416);
    float _1518 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    if (_1460)
    {
        float _1520 = _1448 * _1450;
        _151 = _1520;
    }
    float _1522 = _151;
    bool _1524 = _277 == 0;
    float _1526 = _223 + (-0.5);
    bool _1528 = _235 > 0.5;
    float _1530 = _1518 * _223;
    bool _1532 = !_1524;
    int _1534 = _1532 ? _1504 : (-1);
    float _1536 = fma(_1486, _1428, _1428);
    bool _1538 = _223 > 0.5;
    float _1540 = _235 + (-0.5);
    float _1542 = -_187;
    int _1544 = _1528 ? as_type<int>(_1542) : as_type<int>(_187);
    float _1546 = fma(_1526, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1496);
    bool _1548 = _241 > 0.5;
    float _1550 = _241 + (-0.5);
    float _1552 = fma(_1540, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1492);
    float _1554 = fma(_1550, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1536);
    float _1556 = fma(_1494, _1522, _1546);
    float _1558 = fma(_1348, _1284, _1374);
    float _1560 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1562 = fma(_1498, _1522, _1554);
    float _1564 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1566 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1568 = fma(_1250, (*spvDescriptorSet0.vp_c9)._m0[145].x, _1376);
    float _1570 = fma(_1474, _1522, _1552);
    float _1572 = _1560 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1574 = _1556 * 0.15915493667125701904296875;
    float _1576 = _1564 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1578 = _1566 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1580 = _1562 * 0.15915493667125701904296875;
    float _1582 = _1568 * _1506;
    float _1584 = _1570 * 0.15915493667125701904296875;
    float _1586 = fma(_1250, (*spvDescriptorSet0.vp_c9)._m0[145].y, _1558);
    float _1588 = fma(_1138, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1220);
    float _1590 = fma(_1138, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1222);
    float _1592 = fma(_1138, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1224);
    float _1594 = _1580 * 6.283185482025146484375;
    float _1596 = cos(_1594);
    float _1598 = _1582 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    out.m_74.x = _1572;
    out.m_74.y = _1576;
    out.m_74.z = _1578;
    int _1600 = _870 >> 31;
    float _1602 = _1586 * _1508;
    float _1604 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _183);
    int _1606 = abs(_1018);
    float _1608 = _1590 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1610 = _1574 * 6.283185482025146484375;
    float _1612 = cos(_1610);
    float _1614 = _1598 * _1604;
    float _1616 = _1602 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _1618 = abs(_1118);
    int _1620 = ~_1606;
    int _1622 = _1620 + 1;
    int _1624 = _1622 + 1;
    int _1626 = _946 >> 31;
    float _1628 = _1584 * 6.283185482025146484375;
    float _1630 = sin(_1628);
    int _1632 = _1600 & 3;
    int _1634 = _1626 & 3;
    float _1636 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _187);
    int _1638 = _870 + _1632;
    int _1640 = _946 + _1634;
    float _1642 = _1584 * 6.283185482025146484375;
    float _1644 = cos(_1642);
    float _1646 = _1616 * _1636;
    int _1648 = _1638 >> 2;
    float _1650 = _1612 * _1596;
    int _1652 = _1640 >> 2;
    int _1654 = _1648 << 4;
    int _1656 = _1654 + 368;
    float _1658 = _1650 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1660 = _1574 * 6.283185482025146484375;
    float _1662 = sin(_1660);
    float _1664 = _1612 * _1630;
    float _1666 = _1650 * _1646;
    float _1668 = _1650 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _1670 = abs(_1180);
    bool _1672 = !_1122;
    float _1674 = _1672 ? _187 : as_type<float>(_1544);
    float _1676 = _1580 * 6.283185482025146484375;
    float _1678 = sin(_1676);
    float _1680 = _1644 * _1596;
    float _1682 = _1662 * _1630;
    float _1684 = _1662 * _1644;
    float _1686 = _1662 * _1596;
    int _1688 = _1652 << 4;
    int _1690 = _1688 + 512;
    float _1692 = _1612 * _1644;
    uint _1694 = uint(int(uint(_1656) >> uint(2)));
    uint _1696 = uint(int(uint(int(_1694)) >> uint(2)));
    int _1698 = int(_1694) & 3;
    float _1700 = (*spvDescriptorSet0.vp_c9)._m0[int(_1696)][_1698];
    int _1702 = int(_1694) + 1;
    uint _1704 = uint(int(uint(_1702) >> uint(2)));
    int _1706 = _1702 & 3;
    float _1708 = (*spvDescriptorSet0.vp_c9)._m0[int(_1704)][_1706];
    float _1710 = _1630 * _1596;
    float _1712 = _1650 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1714 = fma(_1678, _1692, _1682);
    float _1716 = fma(_1678, _1682, _1692);
    float _1718 = -_1678;
    float _1720 = fma(_1718, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1658);
    float _1722 = -_1646;
    float _1724 = _1678 * _1722;
    float _1726 = _1686 * _1646;
    uint _1728 = uint(int(uint(_1690) >> uint(2)));
    uint _1730 = uint(int(uint(int(_1728)) >> uint(2)));
    int _1732 = int(_1728) & 3;
    float _1734 = (*spvDescriptorSet0.vp_c9)._m0[int(_1730)][_1732];
    int _1736 = int(_1728) + 1;
    uint _1738 = uint(int(uint(_1736) >> uint(2)));
    int _1740 = _1736 & 3;
    float _1742 = (*spvDescriptorSet0.vp_c9)._m0[int(_1738)][_1740];
    float _1744 = -_1664;
    float _1746 = fma(_1678, _1684, _1744);
    float _1748 = fma(_1680, _1614, _1724);
    float _1750 = fma(_1714, _1614, _1666);
    float _1752 = -_1684;
    float _1754 = fma(_1678, _1664, _1752);
    float _1756 = fma(_1746, _1614, _1726);
    float _1758 = -_1678;
    float _1760 = fma(_1758, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1712);
    float _1762 = -_1678;
    float _1764 = fma(_1762, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1668);
    int _1766 = _1690 + 8;
    uint _1768 = uint(int(uint(_1766) >> uint(2)));
    uint _1770 = uint(int(uint(int(_1768)) >> uint(2)));
    int _1772 = int(_1768) & 3;
    float _1774 = (*spvDescriptorSet0.vp_c9)._m0[int(_1770)][_1772];
    int _1776 = int(_1768) + 1;
    uint _1778 = uint(int(uint(_1776) >> uint(2)));
    int _1780 = _1776 & 3;
    float _1782 = (*spvDescriptorSet0.vp_c9)._m0[int(_1778)][_1780];
    float _1784 = _1714 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1786 = _1714 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1788 = _1714 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1790 = fma(_1686, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1720);
    float _1792 = fma(_1686, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1760);
    float _1794 = fma(_1680, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1784);
    float _1796 = fma(_1680, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1786);
    int _1798 = _1656 + 8;
    uint _1800 = uint(int(uint(_1798) >> uint(2)));
    uint _1802 = uint(int(uint(int(_1800)) >> uint(2)));
    int _1804 = int(_1800) & 3;
    float _1806 = (*spvDescriptorSet0.vp_c9)._m0[int(_1802)][_1804];
    int _1808 = int(_1800) + 1;
    uint _1810 = uint(int(uint(_1808) >> uint(2)));
    int _1812 = _1808 & 3;
    float _1814 = (*spvDescriptorSet0.vp_c9)._m0[int(_1810)][_1812];
    float _1816 = fma(_1680, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1788);
    int _1818 = abs(_970);
    float _1820 = _1754 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1822 = _1754 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1824 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1826 = int(_1824);
    float _1828 = fma(_1710, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1820);
    int _1830 = abs(_1114);
    float _1832 = fma(_1710, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1822);
    int _1834 = ~_1818;
    int _1836 = _1834 + 1;
    int _1838 = _1836 + 1;
    float _1840 = fma(_1686, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1764);
    int _1842 = abs(_934);
    float _1844 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    int _1846 = ~_1830;
    int _1848 = _1846 + 1;
    int _1850 = _1848 + 1;
    float _1852 = fma(_1710, _1844, _1748);
    int _1854 = abs(_1054);
    float _1856 = fma(_1716, _1844, _1756);
    int _1858 = ~_1618;
    int _1860 = _1858 + 1;
    int _1862 = _1860 + 1;
    float _1864 = _1754 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _1866 = _1838 * as_type<int>(_1708);
    float _1868 = float(uint(_1826));
    float _1870 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _1872 = int(_1870);
    int _1874 = ~_1842;
    int _1876 = _1874 + 1;
    int _1878 = _1876 + 1;
    int _1880 = _1850 * as_type<int>(_1700);
    int _1882 = _1880 + _1866;
    int _1884 = ~_1854;
    int _1886 = _1884 + 1;
    int _1888 = _1886 + 1;
    float _1890 = fma(_1710, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1864);
    int _1892 = ~_1826;
    int _1894 = _1892 + 1;
    int _1896 = _1624 * as_type<int>(_1742);
    float _1898 = 1.0 / _1868;
    int _1900 = _1862 * as_type<int>(_1734);
    int _1902 = _1900 + _1896;
    int _1904 = abs(_1826);
    int _1906 = _1888 * as_type<int>(_1774);
    int _1908 = _1906 + _1902;
    int _1910 = abs(_986);
    int _1912 = abs(_1340);
    int _1914 = abs(_764);
    int _1916 = _1878 * as_type<int>(_1806);
    int _1918 = _1916 + _1882;
    float _1920 = float(uint(_1872));
    float _1922 = fma(_1716, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1828);
    float _1924 = float(uint(_1904));
    int _1926 = ~_1670;
    int _1928 = _1926 + 1;
    int _1930 = _1928 + 1;
    float _1932 = 1.0 / _1920;
    int _1934 = ~_1912;
    int _1936 = _1934 + 1;
    int _1938 = _1936 + 1;
    int _1940 = abs(_1872);
    int _1942 = _1930 * as_type<int>(_1782);
    int _1944 = _1942 + _1908;
    int _1946 = ~_1914;
    int _1948 = _1946 + 1;
    int _1950 = _1948 + 1;
    int _1952 = _1938 * as_type<int>(_1814);
    int _1954 = _1952 + _1918;
    float _1956 = float(uint(_1940));
    float _1958 = 1.0 / _1924;
    int _1960 = ~_1910;
    int _1962 = _1960 + 1;
    int _1964 = _1962 + 1;
    int _1966 = _1944 * _1950;
    float _1968 = fma(_1716, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1832);
    float _1970 = _1592 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1972 = ~_1940;
    int _1974 = _1972 + 1;
    int _1976 = _1954 * _1964;
    float _1978 = fma(_1754, _1844, _1750);
    float _1980 = 1.0 / _1956;
    int _1982 = _1534 * _1914;
    int _1984 = _1982 + _1966;
    int _1986 = as_type<int>(_1932) + (-2);
    float _1988 = _1978 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _1990 = _1164 * _1910;
    int _1992 = _1990 + _1976;
    int _1994 = as_type<int>(_1898) + (-2);
    float _1996 = _1978 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1998 = fma(_1852, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1988);
    int _2000 = abs(_1984);
    float _2002 = _1588 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2004 = float(uint(_1992));
    float _2006 = fma(_1852, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1996);
    int _2008 = as_type<int>(_1958) + (-2);
    float _2010 = fma(_1856, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1998);
    float _2012 = as_type<float>(_1994) * _2004;
    int _2014 = abs(_1992);
    float _2016 = fma(_1856, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2006);
    float _2018 = float(uint(_1984));
    float _2020 = trunc(_2012);
    float _2022 = precise::max(_2020, 0.0);
    uint _2024 = uint(_2022);
    int _2026 = as_type<int>(_1980) + (-2);
    float _2028 = _2010 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2030 = float(uint(_2000));
    float _2032 = as_type<float>(_1986) * _2018;
    float _2034 = float(uint(_2014));
    float _2036 = fma(_1716, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1890);
    int _2038 = ~_1872;
    int _2040 = _2038 + 1;
    float _2042 = as_type<float>(_2026) * _2030;
    float _2044 = _2016 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2046 = as_type<float>(_2008) * _2034;
    float _2048 = trunc(_2032);
    float _2050 = precise::max(_2048, 0.0);
    uint _2052 = uint(_2050);
    float _2054 = _1970 + _2028;
    float _2056 = _2002 + _2044;
    int _2058 = ~_1904;
    int _2060 = _2058 + 1;
    float _2062 = _1978 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2064 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2066 = _2054 + _2064;
    float _2068 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2070 = _2056 + _2068;
    int _2072 = _1894 * int(_2024);
    int _2074 = _2072 + _1992;
    float _2076 = trunc(_2046);
    float _2078 = precise::max(_2076, 0.0);
    uint _2080 = uint(_2078);
    float _2082 = _2066 * _2066;
    float _2084 = _2070 * _2070;
    float _2086 = fma(_1852, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2062);
    float _2088 = float(uint(_2074));
    float _2090 = _2084 + _2082;
    float _2092 = -_183;
    int _2094 = _1538 ? as_type<int>(_2092) : as_type<int>(_183);
    float _2096 = trunc(_2042);
    float _2098 = precise::max(_2096, 0.0);
    uint _2100 = uint(_2098);
    int _2102 = _2040 * int(_2052);
    int _2104 = _2102 + _1984;
    float _2106 = as_type<float>(_1994) * _2088;
    bool _2108 = !_1346;
    float _2110 = _2108 ? _183 : as_type<float>(_2094);
    float _2112 = float(uint(_2104));
    float _2114 = sqrt(_2090);
    int _2116 = _2060 * int(_2080);
    int _2118 = _2116 + _2014;
    float _2120 = as_type<float>(_1986) * _2112;
    float _2122 = -_187;
    int _2124 = _1212 ? as_type<int>(_2122) : as_type<int>(_187);
    float _2126 = float(uint(_2118));
    float _2128 = fma(_1856, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2086);
    int _2130 = _1974 * int(_2100);
    int _2132 = _2130 + _2000;
    float _2134 = _187 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2136 = trunc(_2106);
    float _2138 = precise::max(_2136, 0.0);
    uint _2140 = uint(_2138);
    float _2142 = as_type<float>(_2008) * _2126;
    float _2144 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1794);
    float _2146 = float(uint(_2132));
    float _2148 = _2128 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2150 = _2134 * _1792;
    bool _2152 = _2114 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2154 = _2134 * _1840;
    float _2156 = as_type<float>(_2026) * _2146;
    float _2158 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1796);
    float _2160 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1816);
    bool _2162 = !_1130;
    float _2164 = _2162 ? _187 : as_type<float>(_2124);
    float _2166 = trunc(_2142);
    float _2168 = precise::max(_2166, 0.0);
    uint _2170 = uint(_2168);
    float _2172 = -_183;
    int _2174 = _1548 ? as_type<int>(_2172) : as_type<int>(_183);
    float _2176 = _183 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _2178 = !_1126;
    float _2180 = _2178 ? _183 : as_type<float>(_2174);
    float _2182 = _2134 * _1790;
    float _2184 = fma(_2176, _2158, _2150);
    float _2186 = trunc(_2156);
    float _2188 = precise::max(_2186, 0.0);
    uint _2190 = uint(_2188);
    float _2192 = trunc(_2120);
    float _2194 = precise::max(_2192, 0.0);
    uint _2196 = uint(_2194);
    float _2198 = fma(_2176, _2144, _2182);
    float _2200 = _1608 + _2148;
    float _2202 = _2148;
    float _2204 = _2084;
    float _2206 = _2082;
    float _2208 = _2056;
    float _2210 = _2054;
    if (!_2152)
    {
        _2202 = _2084;
    }
    float _2212 = _2202;
    float _2214 = fma(_2176, _2160, _2154);
    float _2216 = _2212;
    if (!_2152)
    {
        _2204 = _2200;
    }
    float _2218 = _2204;
    bool _2220 = !_2152;
    float _2222 = _2218;
    if (!_2220)
    {
        float _2224 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2226 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2228 = _2114 + _2226;
        float _2230 = rsqrt(_2090);
        float _2232 = _2228 * _2224;
        float _2234 = _2200 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2236 = _2232 * 0.15915493667125701904296875;
        float _2238 = _2236 * 6.283185482025146484375;
        float _2240 = sin(_2238);
        float _2242 = _2236 * 6.283185482025146484375;
        float _2244 = cos(_2242);
        float _2246 = fma(_2240, _2234, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2248 = _2230 * _2246;
        float _2250 = _2244 + (-1.0);
        float _2252 = fma(_2070, _2248, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2254 = fma(_2066, _2248, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2256 = _2250 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2258 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2260 = _2252 + _2258;
        float _2262 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2264 = _2254 + _2262;
        float _2266 = fma(_2200, _2244, _2256);
        float _2268 = _2260 * _2260;
        float _2270 = _2264 * _2264;
        _2222 = _2266;
        _2216 = _2268;
        _2206 = _2270;
        _2208 = _2252;
        _2210 = _2254;
    }
    float _2272 = _2222;
    float _2274 = _2216;
    float _2276 = _2206;
    float _2278 = _2208;
    float _2280 = _2210;
    int _2282 = int(_2024) + int(_2140);
    float _2284 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2286 = _2272 + _2284;
    int _2288 = ~_1826;
    int _2290 = _2288 + 1;
    float _2292 = -_1472;
    float _2294 = _2292 + 1.0;
    int _2296 = int(_2052) + int(_2196);
    float _2298 = fma(_2286, _2286, _2274);
    int _2300 = int(_2080) + int(_2170);
    float _2302 = trunc(_1530);
    int _2304 = int(_2302);
    int _2306 = ~_1904;
    int _2308 = _2306 + 1;
    int _2310 = _2290 * _2282;
    int _2312 = _2310 + _1992;
    int _2314 = ~_1872;
    int _2316 = _2314 + 1;
    float _2318 = _2298 + _2276;
    int _2320 = int(_2100) + int(_2190);
    int _2322 = _2308 * _2300;
    int _2324 = _2322 + _2014;
    int _2326 = ~_1940;
    int _2328 = _2326 + 1;
    int _2330 = _2316 * _2296;
    int _2332 = _2330 + _1984;
    bool _2334 = uint(_2312) >= uint(_1826);
    float _2336 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2338 = uint(_2324) >= uint(_1904);
    int _2340 = _2328 * _2320;
    int _2342 = _2340 + _2000;
    bool _2344 = !_2334;
    int _2346 = _2344 ? 0 : (-1);
    float _2348 = -_1512;
    float _2350 = _2348 + 1.0;
    bool _2352 = uint(_2332) >= uint(_1872);
    float _2354 = -_1470;
    float _2356 = _2354 + 1.0;
    int _2358 = ~_2282;
    int _2360 = _2358 + _2346;
    int _2362 = _2360 + 1;
    float _2364 = sqrt(_2318);
    bool _2366 = uint(_2342) >= uint(_1940);
    out.m_76.x = _2144;
    out.m_76.y = _2158;
    out.m_76.z = _2160;
    int _2368 = _2304 << 4;
    int _2370 = _2368 + 1712;
    bool _2372 = !_2352;
    int _2374 = _2372 ? 0 : (-1);
    int _2376 = _1992 ^ _1826;
    int _2378 = _1826 * _2362;
    int _2380 = _2378 + _1992;
    bool _2382 = _1826 == 0;
    float _2384 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _2386 = _1826 == 0;
    uint _2388 = uint(int(uint(_2370) >> uint(2)));
    uint _2390 = uint(int(uint(int(_2388)) >> uint(2)));
    int _2392 = int(_2388) & 3;
    float _2394 = (*spvDescriptorSet0.vp_c9)._m0[int(_2390)][_2392];
    int _2396 = int(_2388) + 1;
    uint _2398 = uint(int(uint(_2396) >> uint(2)));
    int _2400 = _2396 & 3;
    float _2402 = (*spvDescriptorSet0.vp_c9)._m0[int(_2398)][_2400];
    int _2404 = ~_2296;
    int _2406 = _2404 + _2374;
    int _2408 = _2406 + 1;
    int _2410 = _1984 ^ _1872;
    bool _2412 = !_2366;
    int _2414 = _2412 ? 0 : (-1);
    int _2416 = _1872 * _2408;
    int _2418 = _2416 + _1984;
    bool _2420 = _1872 == 0;
    float _2422 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2424 = _1872 == 0;
    bool _2426 = !_2338;
    int _2428 = _2426 ? 0 : (-1);
    int _2430 = _2370 + 8;
    uint _2432 = uint(int(uint(_2430) >> uint(2)));
    uint _2434 = uint(int(uint(int(_2432)) >> uint(2)));
    int _2436 = int(_2432) & 3;
    float _2438 = (*spvDescriptorSet0.vp_c9)._m0[int(_2434)][_2436];
    uint _2440 = uint(int(uint(_2376) >> uint(31)));
    int _2442 = ~_2414;
    int _2444 = _2320 + _2442;
    int _2446 = _2444 + 1;
    uint _2448 = uint(int(uint(_2410) >> uint(31)));
    int _2450 = ~_2428;
    int _2452 = _2300 + _2450;
    int _2454 = _2452 + 1;
    int _2456 = ~int(_2440);
    int _2458 = _2456 + 1;
    bool _2460 = !_2382;
    int _2462 = _2460 ? _2380 : (-1);
    float _2464 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2466 = ~int(_2448);
    int _2468 = _2466 + 1;
    int _2470 = _2454 ^ _2458;
    float _2472 = float(_2462);
    float _2474 = _2336 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2476 = fma(_2134, _2134, 1.0);
    int _2478 = _2446 ^ _2468;
    int _2480 = ~_2458;
    int _2482 = _2480 + _2470;
    int _2484 = _2482 + 1;
    float _2486 = fma(_2474, _2472, _1464);
    float _2488 = _2384 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2490 = rsqrt(_2476);
    int _2492 = ~_2468;
    int _2494 = _2492 + _2478;
    int _2496 = _2494 + 1;
    float _2498 = _2422 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _2500 = !_2386;
    int _2502 = _2500 ? _2484 : (-1);
    float _2504 = _2464 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _2506 = !_2420;
    int _2508 = _2506 ? _2418 : (-1);
    float _2510 = _2180 + 0.5;
    bool _2512 = !_2424;
    int _2514 = _2512 ? _2496 : (-1);
    float _2516 = float(_2502);
    float _2518 = float(_2508);
    float _2520 = _2110 + 0.5;
    float _2522 = float(_2514);
    float _2524 = -_1510;
    float _2526 = fma(_2498, _2516, _2524);
    float _2528 = _1674 + (-0.5);
    float _2530 = _2134 * _2490;
    float _2532 = fma(_2488, _2518, _1516);
    float _2534 = -_1476;
    float _2536 = fma(_2504, _2522, _2534);
    float _2538 = _2164 + (-0.5);
    float _2540 = -_2498;
    float _2542 = fma(_2540, _2528, _2526);
    float _2544 = -_1922;
    float _2546 = _2530 * _2544;
    float _2548 = fma(_2488, _2510, _2532);
    float _2550 = -_2504;
    float _2552 = fma(_2550, _2538, _2536);
    float _2554 = _2394 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2556 = -_1968;
    float _2558 = _2530 * _2556;
    float _2560 = fma(_2490, _1790, _2546);
    float _2562 = -_2036;
    float _2564 = _2530 * _2562;
    float _2566 = _2402 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2568 = fma(_2490, _1792, _2558);
    float _2570 = fma(_2490, _1840, _2564);
    float _2572 = fma(_2474, _2520, _2486);
    float _2574 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2576 = -_1500;
    float _2578 = _2576 + 1.0;
    float _2580 = _2438 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2582 = _1968 + _2184;
    float _2584 = -_2294;
    float _2586 = fma(_2180, _2584, _2548);
    float _2588 = _1922 + _2198;
    float _2590 = -_2578;
    float _2592 = fma(_2110, _2590, _2572);
    float _2594 = _2554 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2596 = _2566 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2598 = _2580 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2600 = fma(_1674, _2350, _2542);
    float _2602 = fma(_2164, _2356, _2552);
    float _2604 = _2036 + _2214;
    out.m_78.x = _2560;
    out.m_78.y = _2568;
    out.m_78.z = _2570;
    bool _2606 = _2364 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2608 = isnan(_2364);
    bool _2610 = _2606 || _2608;
    bool _2612 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2614 = _2610 || _2612;
    out.m_80.x = _2594;
    out.m_80.y = _2596;
    out.m_80.z = _2598;
    out.m_80.w = _2574;
    out.m_82.x = _2592;
    out.m_82.y = _2600;
    out.m_82.z = _2586;
    out.m_82.w = _2602;
    out.m_84.x = _2588;
    out.m_84.y = _2582;
    out.m_84.z = _2604;
    float _2616 = _2356;
    float _2618 = as_type<float>(_2300);
    float _2620 = as_type<float>(_2332);
    float _2622 = as_type<float>(_2312);
    float _2624 = _2486;
    if (!_2614)
    {
        _2616 = 1.0;
    }
    float _2626 = _2616;
    bool _2628 = !_2614;
    float _2630 = _2626;
    if (!_2628)
    {
        bool _2632 = _2364 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2634 = isnan(_2364);
        bool _2636 = _2632 || _2634;
        bool _2638 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2640 = _2636 || _2638;
        if (!_2640)
        {
            float _2642 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2644 = _2364 + _2642;
            float _2646 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2648 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2646;
            float _2650 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2652 = _2650 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2654 = 1.0 / _2648;
            float _2656 = _2644 * _2654;
            float _2658 = fma(_2656, _2652, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2630 = _2658;
            _2660 = true;
        }
        else
        {
            bool _2662 = _2364 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2664 = isnan(_2364);
            bool _2666 = _2662 || _2664;
            bool _2668 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2670 = _2666 || _2668;
            if (!_2670)
            {
                float _2672 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2674 = _2364 + _2672;
                float _2676 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2678 = _2676 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2680 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2682 = _2680 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2684 = 1.0 / _2678;
                float _2686 = _2674 * _2684;
                float _2688 = fma(_2686, _2682, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2630 = _2688;
                _2660 = true;
            }
            else
            {
                _2630 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2660 = false;
    float _2690 = _2630;
    float _2692 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2694 = _2272 + _2692;
    float _2696 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2698 = _2278 + _2696;
    float _2700 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2702 = _2280 + _2700;
    float _2704 = _1608 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2706 = fma(_2694, _2690, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2708 = fma(_2698, _2690, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2710 = fma(_2702, _2690, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2712 = fma(_2002, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2704);
    float _2714 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2716 = _2706 + _2714;
    float _2718 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2720 = _2708 + _2718;
    float _2722 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2724 = _2710 + _2722;
    float _2726 = fma(_1970, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2712);
    float _2728 = _2716 * _2716;
    float _2730 = _1608 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2732 = _2726 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2734 = fma(_2720, _2720, _2728);
    float _2736 = fma(_2002, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2730);
    float _2738 = 1.0 / _2732;
    float _2740 = fma(_2724, _2724, _2734);
    float _2742 = fma(_1970, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2736);
    float _2744 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _2746 = _2742 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2748 = rsqrt(_2740);
    float _2750 = _1608 + _2744;
    float _2752 = _2746 + _2732;
    float _2754 = fma(_2002, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2756 = _2750 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _2758 = _2750 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _2760 = _2752 * _2738;
    float _2762 = _2760 * 0.5;
    float _2764 = fma(_2002, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2756);
    float _2766 = fma(_2002, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2758);
    float _2768 = floor(_2754);
    float _2770 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2772 = fma(_2762, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2770);
    float _2774 = fma(_1970, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2764);
    float _2776 = fma(_1970, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2766);
    float _2778 = _2748 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2780 = _2774 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _2782 = _2776 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _2784 = 1.0 / _2772;
    float _2786 = _2720 * _2778;
    float _2788 = _2724 * _2778;
    float _2790 = _2786 * _2786;
    float _2792 = _2788 * _2788;
    float _2794 = trunc(_2780);
    int _2796 = int(_2794);
    float _2798 = -_2768;
    float _2800 = _2754 + _2798;
    float _2802 = _2790 + _2792;
    float _2804 = sqrt(_2802);
    float _2806 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2808 = _2784 * _2806;
    bool _2810 = _2808 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _2812 = _2808 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _2814 = trunc(_2782);
    int _2816 = int(_2814);
    int _2818 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2820 = _2796 + _2818;
    int _2822 = _2820 + 1;
    bool _2824 = _2804 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2826 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2828 = _2804 + _2826;
    float _2830 = sqrt(_2740);
    int _2832 = 2;
    float _2834 = _2802;
    float _2836 = _2828;
    float _2838 = _2778;
    float _2840 = _2786;
    float _2842 = _2768;
    float _2844 = _2790;
    if (!_2810)
    {
        _2832 = 1;
    }
    int _2846 = _2832;
    int _2848 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _2850 = _2816 + _2848;
    int _2852 = _2850 + 1;
    float _2854 = _2732;
    int _2856 = _2846;
    if (_2824)
    {
        float _2858 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2854 = _2858;
    }
    float _2860 = _2854;
    if (_2824)
    {
        float _2862 = rsqrt(_2802);
        _2834 = _2862;
    }
    float _2864 = _2834;
    float _2866 = _2864;
    if (_2824)
    {
        float _2868 = _2828 * _2860;
        _2836 = _2868;
    }
    float _2870 = _2836;
    if (_2824)
    {
        float _2872 = _2870 * 0.15915493667125701904296875;
        _2618 = _2872;
    }
    float _2874 = _2618;
    bool _2876 = !_2810;
    int _2878 = _2876 ? 0 : 1;
    float _2880 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2882 = _2774;
    if (_2824)
    {
        float _2884 = _2874 * 6.283185482025146484375;
        float _2886 = sin(_2884);
        _2882 = _2886;
    }
    float _2888 = _2882;
    if (!_2812)
    {
        _2856 = _2878;
    }
    int _2890 = _2856;
    float _2892 = precise::max(0.0, _2880);
    int _2894 = _2890 << 6;
    bool _2896 = _2822 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _2898 = -_2778;
    float _2900 = -_2892;
    float _2902 = fma(_2716, _2898, _2900);
    int _2904 = _2894 + 96;
    uint _2906 = uint(int(uint(_2904) >> uint(2)));
    uint _2908 = uint(int(uint(int(_2906)) >> uint(2)));
    int _2910 = int(_2906) & 3;
    float _2912 = (*spvDescriptorSet0.vp_c15)._m0[int(_2908)][_2910];
    int _2914 = int(_2906) + 1;
    uint _2916 = uint(int(uint(_2914) >> uint(2)));
    int _2918 = _2914 & 3;
    float _2920 = (*spvDescriptorSet0.vp_c15)._m0[int(_2916)][_2918];
    int _2922 = _2822 | _2852;
    float _2924 = _2874;
    float _2926 = as_type<float>(_2922);
    if (_2824)
    {
        float _2928 = _2874 * 6.283185482025146484375;
        float _2930 = cos(_2928);
        _2924 = _2930;
    }
    float _2932 = _2924;
    if (_2824)
    {
        float _2934 = _2902 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2838 = _2934;
    }
    float _2936 = _2838;
    bool _2938 = _2922 < 0;
    bool _2940 = _2938 || _2896;
    if (_2824)
    {
        float _2942 = fma(_2888, _2936, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2926 = _2942;
    }
    float _2944 = _2926;
    int _2946 = _2894 + 48;
    uint _2948 = uint(int(uint(_2946) >> uint(2)));
    uint _2950 = uint(int(uint(int(_2948)) >> uint(2)));
    int _2952 = int(_2948) & 3;
    float _2954 = (*spvDescriptorSet0.vp_c15)._m0[int(_2950)][_2952];
    int _2956 = int(_2948) + 1;
    uint _2958 = uint(int(uint(_2956) >> uint(2)));
    int _2960 = _2956 & 3;
    float _2962 = (*spvDescriptorSet0.vp_c15)._m0[int(_2958)][_2960];
    float _2964 = fma(_1970, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2966 = _2706 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_2824)
    {
        float _2968 = _2864 * _2944;
        _2620 = _2968;
    }
    float _2970 = _2620;
    bool _2972 = _2852 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _2974 = _2972 || _2940;
    float _2976 = floor(_2964);
    float _2978 = fma(_2708, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2966);
    if (_2824)
    {
        float _2980 = _2786 * _2970;
        _2840 = _2980;
    }
    float _2982 = _2840;
    int _2984 = _2894 + 64;
    uint _2986 = uint(int(uint(_2984) >> uint(2)));
    uint _2988 = uint(int(uint(int(_2986)) >> uint(2)));
    int _2990 = int(_2986) & 3;
    float _2992 = (*spvDescriptorSet0.vp_c15)._m0[int(_2988)][_2990];
    int _2994 = int(_2986) + 1;
    uint _2996 = uint(int(uint(_2994) >> uint(2)));
    int _2998 = _2994 & 3;
    float _3000 = (*spvDescriptorSet0.vp_c15)._m0[int(_2996)][_2998];
    if (!_2824)
    {
        _2842 = _2902;
    }
    float _3002 = _2842;
    float _3004 = _3002;
    if (_2824)
    {
        float _3006 = _2932 + (-1.0);
        _2866 = _3006;
    }
    float _3008 = _2866;
    float _3010 = fma(_2710, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2978);
    float _3012 = _3008;
    float _3014 = _3010;
    if (_2824)
    {
        float _3016 = _2982 * _2982;
        _2844 = _3016;
    }
    float _3018 = _2844;
    if (_2824)
    {
        float _3020 = _3008 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2622 = _3020;
    }
    float _3022 = _2622;
    if (!_2824)
    {
        _3012 = _2788;
    }
    float _3024 = _3012;
    int _3026 = _2894 + 104;
    uint _3028 = uint(int(uint(_3026) >> uint(2)));
    uint _3030 = uint(int(uint(int(_3028)) >> uint(2)));
    int _3032 = int(_3028) & 3;
    float _3034 = (*spvDescriptorSet0.vp_c15)._m0[int(_3030)][_3032];
    int _3036 = int(_3028) + 1;
    uint _3038 = uint(int(uint(_3036) >> uint(2)));
    int _3040 = _3036 & 3;
    float _3042 = (*spvDescriptorSet0.vp_c15)._m0[int(_3038)][_3040];
    float _3044 = _3024;
    if (_2824)
    {
        float _3046 = _2788 * _2970;
        _3044 = _3046;
    }
    float _3048 = _3044;
    if (_2824)
    {
        float _3050 = fma(_2902, _2932, _3022);
        _3004 = _3050;
    }
    float _3052 = _3004;
    float _3054 = _3010 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    if (!_2824)
    {
        _3014 = _2792;
    }
    float _3056 = _3014;
    float _3058 = _3056;
    if (_2824)
    {
        float _3060 = _3048 * _3048;
        _3058 = _3060;
    }
    float _3062 = _3058;
    float _3064 = fma(_3052, _3052, _3018);
    if (!_2974)
    {
        float _3066 = floor(_2782);
        _2624 = _3066;
    }
    float _3068 = _2624;
    int _3070 = _2894 + 80;
    uint _3072 = uint(int(uint(_3070) >> uint(2)));
    uint _3074 = uint(int(uint(int(_3072)) >> uint(2)));
    int _3076 = int(_3072) & 3;
    float _3078 = (*spvDescriptorSet0.vp_c15)._m0[int(_3074)][_3076];
    int _3080 = int(_3072) + 1;
    uint _3082 = uint(int(uint(_3080) >> uint(2)));
    int _3084 = _3080 & 3;
    float _3086 = (*spvDescriptorSet0.vp_c15)._m0[int(_3082)][_3084];
    float _3088 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3090 = _3054 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3092 = -_2976;
    float _3094 = _2964 + _3092;
    float _3096 = _3064 + _3062;
    float _3098 = -_3090;
    float _3100 = fma(_3098, _3088, 1.0);
    int _3102 = as_type<int>(_3090);
    if (!_2974)
    {
        int _3104 = _2852 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _3106 = _3104 + _2822;
        _3102 = _3106;
    }
    int _3108 = _3102;
    int _3110 = _2894 + 56;
    uint _3112 = uint(int(uint(_3110) >> uint(2)));
    uint _3114 = uint(int(uint(int(_3112)) >> uint(2)));
    int _3116 = int(_3112) & 3;
    float _3118 = (*spvDescriptorSet0.vp_c15)._m0[int(_3114)][_3116];
    int _3120 = int(_3112) + 1;
    uint _3122 = uint(int(uint(_3120) >> uint(2)));
    int _3124 = _3120 & 3;
    float _3126 = (*spvDescriptorSet0.vp_c15)._m0[int(_3122)][_3124];
    float _3128 = log2(_3100);
    int _3130 = _2894 + 72;
    uint _3132 = uint(int(uint(_3130) >> uint(2)));
    uint _3134 = uint(int(uint(int(_3132)) >> uint(2)));
    int _3136 = int(_3132) & 3;
    float _3138 = (*spvDescriptorSet0.vp_c15)._m0[int(_3134)][_3136];
    int _3140 = int(_3132) + 1;
    uint _3142 = uint(int(uint(_3140) >> uint(2)));
    int _3144 = _3140 & 3;
    float _3146 = (*spvDescriptorSet0.vp_c15)._m0[int(_3142)][_3144];
    float _3148 = _2750 * _2920;
    float _3150 = fma(_2002, _2912, _3148);
    int _3152 = _2894 + 88;
    uint _3154 = uint(int(uint(_3152) >> uint(2)));
    uint _3156 = uint(int(uint(int(_3154)) >> uint(2)));
    int _3158 = int(_3154) & 3;
    float _3160 = (*spvDescriptorSet0.vp_c15)._m0[int(_3156)][_3158];
    int _3162 = int(_3154) + 1;
    uint _3164 = uint(int(uint(_3162) >> uint(2)));
    int _3166 = _3162 & 3;
    float _3168 = (*spvDescriptorSet0.vp_c15)._m0[int(_3164)][_3166];
    float _3170 = _2750 * _2962;
    float _3172 = rsqrt(_3096);
    float _3174 = _3128 * 0.693147182464599609375;
    float _3176 = fma(_2002, _2954, _3170);
    int _3178 = as_type<int>(_3170);
    int _3180 = as_type<int>(_2912);
    if (!_2974)
    {
        int _3182 = _3108 << 2;
        _3178 = _3182;
    }
    int _3184 = _3178;
    float _3186 = _2750 * _3000;
    float _3188 = _3000;
    int _3190 = _3184;
    int _3192 = as_type<int>(_3086);
    if (!_2974)
    {
        float _3194 = -_3068;
        float _3196 = _2782 + _3194;
        _3188 = _3196;
    }
    float _3198 = _3188;
    if (!_2974)
    {
        int _3200 = 12 & _3184;
        _3190 = _3200;
    }
    int _3202 = _3190;
    float _3204 = fma(_2002, _2992, _3186);
    float2 _8729 = float2(_2800, _3094);
    float _3206 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8729, float2(0.0), isnan(_8729)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8729, float2(0.0), isnan(_8729)), level(0.0)).x;
    float _3208 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3210 = fma(_2830, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3208);
    float _3212 = precise::clamp(_3210, 0.0, 1.0);
    float _3214 = _3174 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3216 = fma(_1970, _3034, _3150);
    float _3218 = _3172 * _2982;
    float _3220 = _3216 + _3042;
    float _3222 = _3172 * _3052;
    float _3224 = _3172 * _3048;
    float _3226 = _3218 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3228 = _2750 * _3086;
    if (!_2974)
    {
        uint _3230 = uint(int(uint(_3108) >> uint(2)));
        _3192 = int(_3230);
    }
    int _3232 = _3192;
    float _3234 = 1.0 / _3220;
    float _3236 = fma(_2002, _3078, _3228);
    float _3238 = -_3212;
    float _3240 = _3238 + 1.0;
    if (!_2974)
    {
        int _3242 = _3232 << 4;
        int _3244 = _3242 + _3202;
        _3180 = _3244;
    }
    int _3246 = _3180;
    float _3248 = fma(_1970, _3118, _3176);
    float _3250 = abs(_3240);
    float _3252 = log2(_3250);
    float _3254 = _3248 + _3126;
    float _3256 = _2706 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3258 = _3248;
    if (!_2974)
    {
        int _3260 = _3246 + 400;
        uint _3262 = uint(int(uint(_3260) >> uint(2)));
        uint _3264 = uint(int(uint(int(_3262)) >> uint(2)));
        int _3266 = int(_3262) & 3;
        float _3268 = (*spvDescriptorSet0.vp_c15)._m0[int(_3264)][_3266];
        _3258 = _3268;
    }
    float _3270 = _3258;
    float _3272 = fma(_1970, _3138, _3204);
    float _3274 = fma(_2708, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3256);
    float _3276 = _3272 + _3146;
    float _3278 = _2706 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3280 = fma(_2710, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3274);
    float _3282 = fma(_1970, _3160, _3236);
    float _3284 = -_3226;
    float _3286 = fma(_3222, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3284);
    float _3288 = _2706 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3290 = fma(_2708, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3278);
    float _3292 = _3280 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3294 = -_3224;
    float _3296 = fma(_3294, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3286);
    float _3298 = fma(_2708, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3288);
    float _3300 = fma(_2710, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3290);
    float _3302 = _3254 * _3234;
    float _3304 = _3292 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3306 = _3252 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3308 = _3300 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3310 = fma(_2710, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3298);
    bool _3312 = _3302 >= 0.0;
    float _3314 = fma(_3296, 0.5, 0.5);
    float _3316 = fma(_3308, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3304);
    float _3318 = _3276 * _3234;
    bool _3320 = _3302 <= 1.0;
    bool _3322 = _3320 && _3312;
    float _3324 = exp2(_3306);
    float _3326 = fma(_3296, -0.5, 0.5);
    float _3328 = _3310 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    bool _3330 = _3318 >= 0.0;
    bool _3332 = _3330 && _3322;
    float _3334 = fma(_3054, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3316);
    float _3336 = _3282 + _3168;
    float _3338 = fma(_3314, -0.0187292993068695068359375, 0.07426099479198455810546875);
    bool _3340 = _3318 <= 1.0;
    bool _3342 = _3340 && _3332;
    float _3344 = _3222 + 1.0;
    float _3346 = _3292 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3348 = fma(_3328, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3334);
    float _3350 = fma(_3314, _3338, -0.212114393711090087890625);
    float _3352 = _3298;
    float _3354 = _3346;
    float _3356 = _3348;
    if (!_2974)
    {
        float _3358 = floor(_2780);
        _3352 = _3358;
    }
    float _3360 = _3352;
    float _3362 = _3292 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3364 = _3336 * _3234;
    float _3366 = fma(_3314, _3350, 1.570728778839111328125);
    float _3368 = -_3222;
    float _3370 = fma(_3324, _3344, _3368);
    float _3372 = fma(_3308, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3346);
    float _3374 = fma(_3308, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3362);
    float _3376 = 1.0 / _3348;
    if (_3342)
    {
        float _3378 = float(_2890);
        _3354 = _3378;
    }
    float _3380 = _3354;
    float _3382 = fma(_3054, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3374);
    float _3384 = fma(_3054, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3372);
    float _3386 = fma(_3370, 0.5, 0.5);
    float _3388 = fma(_3328, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3382);
    float _3390 = fma(_3328, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3384);
    float _3392 = sqrt(_3326);
    float _3394 = _3384;
    float _3396 = _3388;
    if (!_2974)
    {
        float _3398 = -_3360;
        float _3400 = _2780 + _3398;
        _3394 = _3400;
    }
    float _3402 = _3394;
    float _3404 = _3380;
    if (_3342)
    {
        float _3406 = rint(_3380);
        float _3408 = precise::max(_3406, 0.0);
        uint _3410 = uint(_3408);
        uint _3412 = clamp(_3410, 0u, 65535u);
        _3404 = as_type<float>(_3412);
    }
    float _3414 = _3404;
    float _3416 = _3388 * _3376;
    float _3418 = _3390 * _3376;
    float _3420 = fma(_3416, 0.5, 0.5);
    float _3422 = fma(_3418, -0.5, 0.5);
    float _3424 = _3392 * 0.636619746685028076171875;
    float _3426 = _3270;
    if (!_2974)
    {
        float _3428 = rint(_3270);
        float _3430 = precise::max(_3428, 0.0);
        uint _3432 = uint(_3430);
        uint _3434 = clamp(_3432, 0u, 65535u);
        _3426 = as_type<float>(_3434);
    }
    float _3436 = _3426;
    float _3438 = -_3366;
    float _3440 = fma(_3424, _3438, 1.0);
    float _3442 = _3414;
    if (_3342)
    {
        float3 _9134 = float3(_3302, _3318, float(as_type<int>(_3414)));
        float3 _9138 = select(_9134, float3(0.0), isnan(_9134));
        float _3444 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _9138.xy, uint(rint(_9138.z)), _3364, level(0.0));
        _3442 = _3444;
    }
    float _3446 = _3442;
    float3 _9148 = float3(_3420, _3422, _3214);
    float _3448 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9148, float3(0.0), isnan(_9148)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9148, float3(0.0), isnan(_9148)), level(0.0)).x;
    float3 _9157 = float3(_3420, _3422, _3214);
    float4 _3451 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9157, float3(0.0), isnan(_9157)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9157, float3(0.0), isnan(_9157)), level(0.0)).xyzw;
    float _3453 = _3451.x;
    float _3455 = _3451.y;
    float _3457 = _3451.z;
    float _3459 = _3451.w;
    float2 _9173 = float2(_3440, _3386);
    float3 _3463 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9173, float2(0.0), isnan(_9173)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9173, float2(0.0), isnan(_9173)), level(0.0)).xyz;
    float _3465 = _3463.x;
    float _3467 = _3463.y;
    float _3469 = _3463.z;
    float _3471 = _3402;
    if (!_2974)
    {
        float3 _9194 = float3(_3402, _3198, float(as_type<int>(_3436)));
        float3 _9196 = select(_9194, float3(0.0), isnan(_9194));
        float _3473 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _9196.xy, uint(rint(_9196.z)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _9196.xy, uint(rint(_9196.z)), level(0.0)).x;
        _3471 = _3473;
    }
    float _3475 = _3471;
    float _3477 = abs(_2808);
    float _3479 = log2(_3477);
    float _3481 = _3252 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3483 = _3292 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3485 = exp2(_3481);
    float _3487 = fma(_3308, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3483);
    bool _3489 = _2808 <= 8000.0;
    bool _3491 = isnan(_2808);
    bool _3493 = _3489 || _3491;
    bool _3495 = isnan(8000.0);
    bool _3497 = _3493 || _3495;
    float _3499 = float(_3497);
    float _3501 = fma(_3054, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3487);
    float _3503 = _3479 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3505 = fma(_3328, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3501);
    float _3507 = exp2(_3503);
    out.gl_Position.x = _3388;
    out.gl_Position.y = _3390;
    out.gl_Position.z = _3505;
    out.gl_Position.w = _3348;
    float _3509 = -_3485;
    float _3511 = _3509 + 1.0;
    float _3513 = _3511 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (_2974)
    {
        _3396 = 1.0;
    }
    float _3515 = _3396;
    float _3517 = fma(_3507, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3519 = precise::clamp(_3517, 0.0, 1.0);
    float _3521 = fma(_3519, -2.0, 3.0);
    float _3523 = _3519 * _3519;
    float _3525 = _3523 * _3521;
    float _3527 = -_3525;
    float _3529 = _3527 + 1.0;
    float _3531 = fma(_3529, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3525);
    float _3533 = _3499 * _3531;
    float _3535 = _3533 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3537 = _3533;
    float _3539 = _3515;
    if (!_3342)
    {
        _3537 = 1.0;
    }
    float _3541 = _3537;
    float _3543 = -_3206;
    float _3545 = _3543 + 1.0;
    float _3547 = _3545 * _3535;
    float _3549 = precise::clamp(_3547, 0.0, 1.0);
    float _3551 = _3541;
    float _3553 = _3549;
    if (_3342)
    {
        bool _3555 = _3446 >= _3364;
        bool _3557 = isnan(_3446);
        bool _3559 = _3555 || _3557;
        bool _3561 = isnan(_3364);
        bool _3563 = _3559 || _3561;
        float _3565 = float(_3563);
        _3551 = _3565;
    }
    float _3567 = _3551;
    float _3569 = _3567;
    if (!_2974)
    {
        int _3571 = _3108 << 4;
        int _3573 = _3571 + 2048;
        uint _3575 = uint(int(uint(_3573) >> uint(2)));
        uint _3577 = uint(int(uint(int(_3575)) >> uint(2)));
        int _3579 = int(_3575) & 3;
        float _3581 = (*spvDescriptorSet0.vp_c15)._m0[int(_3577)][_3579];
        int _3583 = int(_3575) + 1;
        uint _3585 = uint(int(uint(_3583) >> uint(2)));
        int _3587 = _3583 & 3;
        float _3589 = (*spvDescriptorSet0.vp_c15)._m0[int(_3585)][_3587];
        int _3591 = _3573 + 8;
        uint _3593 = uint(int(uint(_3591) >> uint(2)));
        uint _3595 = uint(int(uint(int(_3593)) >> uint(2)));
        int _3597 = int(_3593) & 3;
        float _3599 = (*spvDescriptorSet0.vp_c15)._m0[int(_3595)][_3597];
        int _3601 = int(_3593) + 1;
        uint _3603 = uint(int(uint(_3601) >> uint(2)));
        int _3605 = _3601 & 3;
        float _3607 = (*spvDescriptorSet0.vp_c15)._m0[int(_3603)][_3605];
        float _3609 = _2750 * _3589;
        float _3611 = fma(_2002, _3581, _3609);
        float _3613 = fma(_1970, _3599, _3611);
        float _3615 = _3613 + _3607;
        float _3617 = precise::clamp(_3615, 0.0, 1.0);
        float _3619 = -_3617;
        float _3621 = _3619 + _3475;
        float _3623 = fma(_3621, 500.0, 1.5);
        float _3625 = exp2(_3623);
        float _3627 = 0.0 + _3625;
        float _3629 = precise::clamp(_3627, 0.0, 1.0);
        _3539 = _3629;
        _3356 = _3607;
    }
    float _3631 = _3539;
    float _3633 = _3356;
    float _3635 = _3567 * _3631;
    float _3637 = _3513 * _3448;
    float _3639 = -_3549;
    float _3641 = fma(_3639, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3643 = -_3513;
    float _3645 = _3643 + 1.0;
    out.m_86.x = _2708;
    out.m_86.y = _2706;
    out.m_86.z = _2710;
    float _3647 = _3459 * _3637;
    float _3649 = -_3635;
    float _3651 = fma(_3649, _3641, 1.0);
    float _3653 = precise::clamp(_3651, 0.0, 1.0);
    float _3655 = _3469 * _3637;
    float _3657 = _3459 * _3645;
    float _3659 = fma(_3465, _3647, _3453);
    float _3661 = fma(_3467, _3647, _3455);
    float _3663 = _3653 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3665 = fma(_3459, _3655, _3457);
    bool _3667 = _2830 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3669 = isnan(_2830);
    bool _3671 = _3667 || _3669;
    bool _3673 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3675 = _3671 || _3673;
    out.m_88.x = _3663;
    out.m_90.x = _3659;
    out.m_90.y = _3661;
    out.m_90.z = _3665;
    out.m_90.w = _3657;
    float _3677 = _3633;
    float _3679 = _3647;
    float _3681 = _3641;
    float _3683 = _3653;
    if (!_3675)
    {
        _3569 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3685 = _3569;
    float _3687 = _3685;
    float _3689 = _3685;
    if (!_3675)
    {
        _3553 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3691 = _3553;
    float _3693 = _3691;
    float _3695 = _3691;
    if (!_3675)
    {
        _3677 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3697 = _3677;
    float _3699 = _3697;
    float _3701 = _3697;
    if (!_3675)
    {
        _3679 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3703 = _3679;
    float _3705 = _3703;
    float _3707 = _3703;
    if (!_3675)
    {
        _3681 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3709 = _3681;
    float _3711 = _3709;
    float _3713 = _3709;
    if (!_3675)
    {
        _3683 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3715 = _3683;
    bool _3717 = !_3675;
    float _3719 = _3715;
    float _3721 = _3715;
    if (!_3717)
    {
        bool _3723 = _2830 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3725 = isnan(_2830);
        bool _3727 = _3723 || _3725;
        bool _3729 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3731 = _3727 || _3729;
        if (!_3731)
        {
            float _3733 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3735 = _2830 + _3733;
            float _3737 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3739 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3737;
            float _3741 = 1.0 / _3739;
            float _3743 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3745 = _3743 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3747 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3749 = _3747 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3751 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3753 = _3751 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3755 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3757 = _3755 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3759 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3761 = _3759 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3763 = _3735 * _3741;
            float _3765 = precise::clamp(_3763, 0.0, 1.0);
            float _3767 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3769 = _3767 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3771 = fma(_3765, _3745, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3773 = fma(_3765, _3769, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3775 = fma(_3765, _3749, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3777 = fma(_3765, _3753, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3779 = fma(_3765, _3757, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3781 = fma(_3765, _3761, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3695 = _3773;
            _3713 = _3779;
            _3689 = _3771;
            _3707 = _3777;
            _3701 = _3775;
            _3721 = _3781;
            _3783 = true;
        }
        else
        {
            bool _3785 = _2830 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3787 = isnan(_2830);
            bool _3789 = _3785 || _3787;
            bool _3791 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3793 = _3789 || _3791;
            if (!_3793)
            {
                _3687 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3795 = _3687;
            _3689 = _3795;
            if (!_3793)
            {
                _3693 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3797 = _3693;
            _3695 = _3797;
            if (!_3793)
            {
                _3699 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3799 = _3699;
            _3701 = _3799;
            if (!_3793)
            {
                _3705 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3801 = _3705;
            _3707 = _3801;
            if (!_3793)
            {
                _3711 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3803 = _3711;
            _3713 = _3803;
            if (!_3793)
            {
                _3719 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3805 = _3719;
            bool _3807 = !_3793;
            _3721 = _3805;
            if (!_3807)
            {
                bool _3809 = _2830 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3811 = isnan(_2830);
                bool _3813 = _3809 || _3811;
                bool _3815 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3817 = _3813 || _3815;
                if (!_3817)
                {
                    float _3819 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3821 = _2830 + _3819;
                    float _3823 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3825 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3823;
                    float _3827 = 1.0 / _3825;
                    float _3829 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3831 = _3829 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3833 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3835 = _3833 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3837 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3839 = _3837 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3841 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3843 = _3841 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3845 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3847 = _3845 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3849 = _3821 * _3827;
                    float _3851 = precise::clamp(_3849, 0.0, 1.0);
                    float _3853 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3855 = _3853 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3857 = fma(_3851, _3831, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3859 = fma(_3851, _3855, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3861 = fma(_3851, _3835, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3863 = fma(_3851, _3839, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3865 = fma(_3851, _3843, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3867 = fma(_3851, _3847, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3695 = _3859;
                    _3713 = _3865;
                    _3689 = _3857;
                    _3707 = _3863;
                    _3701 = _3861;
                    _3721 = _3867;
                    _3783 = true;
                }
                else
                {
                    _3695 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3713 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3689 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3707 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3701 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3721 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3783 = false;
    float _3869 = _3695;
    float _3871 = _3713;
    float _3873 = _3689;
    float _3875 = _3707;
    float _3877 = _3701;
    float _3879 = _3721;
    float _3881 = fma(_2582, -0.5, 0.5);
    float _3883 = precise::clamp(_3881, 0.0, 1.0);
    float _3885 = -_3869;
    float _3887 = _3885 + _3871;
    float _3889 = -_3873;
    float _3891 = _3889 + _3875;
    float _3893 = -_3877;
    float _3895 = _3893 + _3879;
    bool _3897 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3899 = fma(_3883, _3887, _3869);
    float _3901 = fma(_3883, _3891, _3873);
    float _3903 = fma(_3883, _3895, _3877);
    float _3905 = _3899 * 0.586610972881317138671875;
    out.m_61.x = 1.0;
    float _3907 = fma(_3901, 0.298911988735198974609375, _3905);
    float _3909 = fma(_3903, 0.114477999508380889892578125, _3907);
    out.m_92.x = 0.0;
    float _3911 = -_3909;
    float _3913 = _3901 + _3911;
    float _3915 = -_3909;
    float _3917 = _3899 + _3915;
    float _3919 = -_3909;
    float _3921 = _3903 + _3919;
    float _3923 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3925 = fma(_3913, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3909);
    float _3927 = fma(_3917, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3909);
    float _3929 = fma(_3921, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3909);
    out.m_88.w = _3923;
    out.m_94.x = _3925;
    out.m_94.y = _3927;
    out.m_94.z = _3929;
    if (!_3897)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3931 = -_2706;
    float _3933 = _3931 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3935 = -_2708;
    float _3937 = _3935 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3939 = -_2710;
    float _3941 = _3939 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3943 = _3933 * _3933;
    float _3945 = fma(_3937, _3937, _3943);
    float _3947 = fma(_3941, _3941, _3945);
    float _3949 = sqrt(_3947);
    float _3951 = rsqrt(_3947);
    float _3953 = -_3949;
    float _3955 = _3953 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3957 = _3955 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3959 = precise::clamp(_3957, 0.0, 1.0);
    float _3961 = _3937 * _3951;
    float _3963 = _3933 * _3951;
    float _3965 = abs(_3959);
    float _3967 = log2(_3965);
    float _3969 = _3941 * _3951;
    float _3971 = _3961 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3973 = _2582 * _3963;
    float _3975 = -_3963;
    float _3977 = -_3971;
    float _3979 = fma(_3975, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3977);
    float _3981 = fma(_2588, _3961, _3973);
    float _3983 = -_3969;
    float _3985 = fma(_3983, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3979);
    float _3987 = fma(_2604, _3969, _3981);
    float _3989 = precise::clamp(_3987, 0.0, 1.0);
    float _3991 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3993 = _3985 + _3991;
    float _3995 = _3967 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3997 = _3993 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3999 = precise::clamp(_3997, 0.0, 1.0);
    float _4001 = exp2(_3995);
    float _4003 = _4001 * _3999;
    float _4005 = _3989 * _4003;
    float _4007 = _4005 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4009 = _4005 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4011 = _4005 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_92.x = _4007;
    out.m_92.y = _4009;
    out.m_92.z = _4011;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3783 = false;
    bool _2660 = false;
    bool _209 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _108 = in.m_58.w;
    float _110 = trunc(_108);
    int _113 = int(_110);
    bool _117 = _113 >= 1;
    float _119 = 0.0;
    if (!_117)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _119;
    float _123 = _121;
    if (!_117)
    {
        out.m_61.x = 0.0;
    }
    int _125 = 0;
    if (!_117)
    {
        float _127 = _121 * 5.0;
        _125 = as_type<int>(_127);
    }
    int _129 = _125;
    int _131 = _129;
    if (!_117)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4068 = as_type<float>(_129);
        out.gl_Position.z = _4068;
    }
    if (!_117)
    {
        return out;
    }
    float _133 = in.m_63.w;
    bool _135 = _133 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _137 = isnan(_133);
    bool _139 = _135 || _137;
    bool _141 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _143 = _139 || _141;
    float _145 = -_133;
    float _147 = _145 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _149 = 0.0;
    float _151 = _147;
    if (_143)
    {
        float _153 = float(_113);
        _149 = _153;
    }
    float _155 = _149;
    bool _157 = _147 >= _155;
    bool _159 = !_143;
    bool _161 = _157 || _159;
    if (_161)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _163 = _123;
    if (_161)
    {
        out.m_61.x = 0.0;
    }
    if (_161)
    {
        float _165 = _163 * 5.0;
        _131 = as_type<int>(_165);
    }
    int _167 = _131;
    if (_161)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4137 = as_type<float>(_167);
        out.gl_Position.z = _4137;
    }
    if (_161)
    {
        return out;
    }
    float _169 = as_type<float>(int(gl_VertexIndex));
    bool _171 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _173 = as_type<int>(_169) & 1;
    bool _175 = _173 != 0;
    int _177 = as_type<int>(_169) & 2;
    bool _179 = _177 != 0;
    bool _181 = !_175;
    float _183 = _181 ? (-0.5) : 0.5;
    bool _185 = !_179;
    float _187 = _185 ? (-0.5) : 0.5;
    bool _189 = !_171;
    float _207;
    if (!_189)
    {
        float _191 = in.m_68.x;
        float _193 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _195 = _191 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _197 = fma(_195, (*spvDescriptorSet0.vp_c9)._m0[12].x, _147);
        float _199 = _197 * _193;
        float _201 = floor(_199);
        float _203 = -_201;
        float _205 = _199 + _203;
        _207 = _205;
        _209 = true;
    }
    else
    {
        float _211 = float(_113);
        float _213 = 1.0 / _211;
        float _215 = _147 * _213;
        _207 = _215;
    }
    _209 = false;
    float _217 = _207;
    float _219 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _221 = int(_219);
    float _223 = in.m_68.x;
    float _225 = float(_113);
    float _227 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _229 = _217 + _227;
    float _231 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _233 = _217 + _231;
    float _235 = in.m_68.y;
    float _237 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _239 = int(_237);
    float _241 = in.m_68.z;
    bool _243 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _245 = isnan(_217);
    bool _247 = _243 || _245;
    bool _249 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _251 = _247 || _249;
    float _253 = float(_251);
    float _255 = in.m_68.w;
    float _257 = float(_221);
    float _259 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _261 = int(_259);
    float _263 = -_253;
    float _265 = _263 + 1.0;
    float _267 = float(_239);
    float _269 = 1.0 / _257;
    float _271 = _223 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _273 = _235 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _275 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _277 = int(_275);
    float _279 = float(uint(_261));
    bool _281 = _261 == 0;
    int _283 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _285 = _283 != 0;
    float _287 = 1.0 / _267;
    float _289 = _269 * _147;
    float _291 = float(uint(_277));
    float _293 = 1.0 / _279;
    int _295 = ~_277;
    int _297 = _295 + 1;
    int _299 = ~_277;
    int _301 = _299 + 1;
    float _303 = _287 * _147;
    float _305 = trunc(_289);
    int _307 = int(_305);
    float _309 = 1.0 / _291;
    int _311 = as_type<int>(_293) + (-2);
    float _313 = trunc(_303);
    int _315 = int(_313);
    float _317 = float(uint(_307));
    float _319 = as_type<float>(_311) * _317;
    float _321 = _317;
    int _323 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    if (_285)
    {
        _321 = 1.0;
    }
    float _325 = _321;
    float _327 = 1.0 / _225;
    int _329 = as_type<int>(_309) + (-2);
    int _331 = ~_261;
    int _333 = _331 + 1;
    float _335 = _325;
    if (!_285)
    {
        _335 = 7.345489978790283203125;
    }
    float _337 = _335;
    float _339 = float(uint(_315));
    float _341 = trunc(_319);
    float _343 = precise::max(_341, 0.0);
    uint _346 = uint(_343);
    float _348 = as_type<float>(_329) * _339;
    float _350 = trunc(_348);
    float _352 = precise::max(_350, 0.0);
    uint _354 = uint(_352);
    int _356 = _333 * int(_346);
    int _358 = _356 + _307;
    float _360 = _337 * _223;
    float _362 = float(uint(_358));
    float _364 = floor(_360);
    int _366 = _297 * int(_354);
    int _368 = _366 + _315;
    float _370 = float(uint(_368));
    float _372 = as_type<float>(_311) * _362;
    float _374 = _362;
    float _376 = _370;
    if (_285)
    {
        _374 = 1.0;
    }
    float _378 = _374;
    float _380 = _378;
    if (!_285)
    {
        _380 = 1.2345600128173828125;
    }
    float _382 = _380;
    float _384 = trunc(_372);
    float _386 = precise::max(_384, 0.0);
    uint _388 = uint(_386);
    float _390 = as_type<float>(_329) * _370;
    if (_285)
    {
        _376 = _223;
    }
    float _392 = _376;
    float _394 = _392;
    if (!_285)
    {
        _394 = _235;
    }
    float _396 = _394;
    float _398 = -_364;
    float _400 = _360 + _398;
    int _402 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _404 = _402 != 0;
    float _406 = trunc(_390);
    float _408 = precise::max(_406, 0.0);
    uint _410 = uint(_408);
    float _412 = _396 * _382;
    int _414 = ~_261;
    int _416 = _414 + 1;
    float _418 = float(_261);
    float _420 = float(_307);
    int _422 = int(_346) + int(_388);
    float _424 = floor(_412);
    bool _426 = _420 >= _418;
    bool _428 = isnan(_420);
    bool _430 = _426 || _428;
    bool _432 = isnan(_418);
    bool _434 = _430 || _432;
    float _436 = float(_434);
    float _438 = _400 * _418;
    int _440 = _416 * _422;
    int _442 = _440 + _307;
    int _444 = int(_354) + int(_410);
    float _446 = trunc(_436);
    int _448 = int(_446);
    bool _450 = uint(_442) >= uint(_261);
    int _452 = _301 * _444;
    int _454 = _452 + _315;
    bool _456 = !_404;
    int _458 = _456 ? 0 : 1;
    bool _460 = !_450;
    int _462 = _460 ? 0 : (-1);
    float _464 = trunc(_438);
    int _466 = int(_464);
    float _468 = -_424;
    float _470 = _412 + _468;
    int _472 = abs(_458);
    int _474 = ~_422;
    int _476 = _474 + _462;
    int _478 = _476 + 1;
    bool _480 = uint(_454) >= uint(_277);
    float _482 = _327 * _147;
    int _484 = _261 * _478;
    int _486 = _484 + _307;
    int _488 = ~_448;
    int _490 = _488 + 1;
    int _492 = _490 + 1;
    float _494 = _418 * _482;
    int _496 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _498 = _496 != 0;
    int _500 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _502 = _500 != 0;
    int _504 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _506 = _504 != 0;
    bool _508 = !_281;
    int _510 = _508 ? _486 : (-1);
    bool _512 = !_480;
    int _514 = _512 ? 0 : (-1);
    int _516 = _466 * _472;
    int _518 = _516 + _307;
    float _520 = float(_277);
    int _522 = _510 * _492;
    bool _524 = !_502;
    int _526 = _524 ? 0 : 1;
    float _528 = trunc(_494);
    int _530 = int(_528);
    float _532 = float(_315);
    int _534 = ~_444;
    int _536 = _534 + _514;
    int _538 = _536 + 1;
    int _540 = _261 + (-1);
    int _542 = abs(_526);
    int _544 = _277 * _538;
    int _546 = _544 + _315;
    bool _548 = _532 >= _520;
    bool _550 = isnan(_532);
    bool _552 = _548 || _550;
    bool _554 = isnan(_520);
    bool _556 = _552 || _554;
    float _558 = float(_556);
    int _560 = _448 * _540;
    int _562 = _560 + _522;
    bool _564 = !_506;
    int _566 = _564 ? 0 : 1;
    bool _568 = !_498;
    int _570 = _568 ? 0 : 1;
    int _572 = _562 * _542;
    int _574 = abs(_566);
    float _576 = trunc(_558);
    int _578 = int(_576);
    float _580 = _470 * _520;
    int _582 = abs(_570);
    float _584 = _520 * _482;
    int _586 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _588 = _586 != 0;
    int _590 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _592 = _590 != 0;
    int _594 = _530 * _582;
    int _596 = _594 + _572;
    float _598 = trunc(_580);
    int _600 = int(_598);
    bool _602 = !_588;
    int _604 = _602 ? 0 : 1;
    bool _606 = !_592;
    int _608 = _606 ? 0 : 1;
    int _610 = _518 * _574;
    int _612 = _610 + _596;
    bool _614 = _277 == 0;
    int _616 = abs(_604);
    float _618 = trunc(_584);
    int _620 = int(_618);
    int _622 = abs(_608);
    int _624 = ~_578;
    int _626 = _624 + 1;
    int _628 = _626 + 1;
    bool _630 = !_614;
    int _632 = _630 ? _546 : (-1);
    int _634 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _636 = _634 != 0;
    int _638 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _640 = _638 != 0;
    int _642 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _644 = _642 != 0;
    int _646 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _648 = _646 != 0;
    int _650 = _600 * _616;
    int _652 = _650 + _315;
    int _654 = _277 + (-1);
    int _656 = _632 * _628;
    bool _658 = _261 == 0;
    int _660 = _466 * _622;
    int _662 = _660 + _612;
    bool _664 = !_640;
    int _666 = _664 ? 0 : 1;
    int _668 = _578 * _654;
    int _670 = _668 + _656;
    bool _672 = !_636;
    int _674 = _672 ? 0 : 1;
    float _676 = float(uint(_662));
    int _678 = abs(_666);
    bool _680 = !_644;
    int _682 = _680 ? 0 : 1;
    float _684 = as_type<float>(_311) * _676;
    int _686 = abs(_674);
    bool _688 = !_648;
    int _690 = _688 ? 0 : 1;
    int _692 = abs(_682);
    int _694 = _670 * _678;
    int _696 = abs(_690);
    float _698 = trunc(_684);
    float _700 = precise::max(_698, 0.0);
    uint _702 = uint(_700);
    int _704 = _620 * _686;
    int _706 = _704 + _694;
    float _708 = float(uint(_518));
    int _710 = _652 * _692;
    int _712 = _710 + _706;
    int _714 = ~_261;
    int _716 = _714 + 1;
    int _718 = ~_277;
    int _720 = _718 + 1;
    int _722 = _600 * _696;
    int _724 = _722 + _712;
    float _726 = as_type<float>(_311) * _708;
    float _728 = float(uint(_652));
    float _730 = float(uint(_724));
    int _732 = _716 * int(_702);
    int _734 = _732 + _662;
    int _736 = ~_261;
    int _738 = _736 + 1;
    float _740 = as_type<float>(_329) * _728;
    int _742 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _744 = _742 != 0;
    float _746 = as_type<float>(_329) * _730;
    float _748 = float(uint(_734));
    float _750 = trunc(_726);
    float _752 = precise::max(_750, 0.0);
    uint _754 = uint(_752);
    int _756 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _758 = _756 != 0;
    float _760 = as_type<float>(_311) * _748;
    bool _762 = !_758;
    int _764 = _762 ? 0 : 1;
    float _766 = trunc(_746);
    float _768 = precise::max(_766, 0.0);
    uint _770 = uint(_768);
    float _772 = as_type<float>(_518);
    if (_744)
    {
        _323 = 0;
    }
    int _774 = _323;
    int _776 = _774;
    if (!_744)
    {
        _776 = 1;
    }
    int _778 = _776;
    float _780 = trunc(_760);
    float _782 = precise::max(_780, 0.0);
    uint _784 = uint(_782);
    int _786 = ~_261;
    int _788 = _786 + 1;
    int _790 = _788 * int(_754);
    int _792 = _790 + _518;
    int _794 = _720 * int(_770);
    int _796 = _794 + _724;
    float _798 = trunc(_740);
    float _800 = precise::max(_798, 0.0);
    uint _802 = uint(_800);
    float _804 = float(uint(_792));
    float _806 = float(uint(_796));
    int _808 = ~_277;
    int _810 = _808 + 1;
    float _812 = as_type<float>(_311) * _804;
    int _814 = int(_702) + int(_784);
    float _816 = as_type<float>(_329) * _806;
    float _818 = trunc(_816);
    float _820 = precise::max(_818, 0.0);
    uint _822 = uint(_820);
    int _824 = _738 * _814;
    int _826 = _824 + _662;
    int _828 = _810 * int(_802);
    int _830 = _828 + _652;
    bool _832 = uint(_826) >= uint(_261);
    float _834 = trunc(_812);
    float _836 = precise::max(_834, 0.0);
    uint _838 = uint(_836);
    float _840 = float(uint(_830));
    bool _842 = !_832;
    int _844 = _842 ? 0 : (-1);
    int _846 = ~_814;
    int _848 = _846 + _844;
    int _850 = _848 + 1;
    int _852 = ~_277;
    int _854 = _852 + 1;
    int _856 = int(_770) + int(_822);
    int _858 = _261 * _850;
    int _860 = _858 + _662;
    float _862 = as_type<float>(_329) * _840;
    int _864 = _854 * _856;
    int _866 = _864 + _724;
    bool _868 = !_658;
    int _870 = _868 ? _860 : (-1);
    int _872 = int(_754) + int(_838);
    int _874 = _870 & 3;
    bool _876 = _874 != 0;
    float _878 = trunc(_862);
    float _880 = precise::max(_878, 0.0);
    uint _882 = uint(_880);
    bool _884 = uint(_866) >= uint(_277);
    bool _886 = uint(_874) >= 2u;
    bool _888 = !_884;
    int _890 = _888 ? 0 : (-1);
    int _892 = _886 ? 0 : 1;
    bool _894 = _874 != 3;
    int _896 = _870 & 3;
    bool _898 = _896 != 0;
    int _900 = ~_856;
    int _902 = _900 + _890;
    int _904 = _902 + 1;
    int _906 = _898 ? 0 : 1;
    int _908 = ~_261;
    int _910 = _908 + 1;
    int _912 = _277 * _904;
    int _914 = _912 + _724;
    bool _916 = uint(_874) > 1u;
    int _918 = ~_892;
    int _920 = _918 + 1;
    int _922 = _920 + 1;
    int _924 = _910 * _872;
    int _926 = _924 + _518;
    int _928 = _922;
    if (_894)
    {
        int _930 = ~_892;
        int _932 = _930 + 1;
        _928 = _932;
    }
    int _934 = _928;
    float _936 = _223 * 2.0;
    bool _938 = _277 == 0;
    float _940 = _235 * 2.0;
    int _942 = int(_802) + int(_882);
    bool _944 = !_938;
    int _946 = _944 ? _914 : (-1);
    float _948 = floor(_940);
    bool _950 = uint(_926) >= uint(_261);
    int _952 = _946 & 3;
    bool _954 = _952 != 0;
    int _956 = ~_906;
    int _958 = _956 + 1;
    int _960 = _958 + 1;
    int _962 = _960;
    float _964 = _940;
    if (!_916)
    {
        int _966 = ~_906;
        int _968 = _966 + 1;
        _962 = _968;
    }
    int _970 = _962;
    float _972 = floor(_936);
    int _974 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _976 = _974 != 0;
    bool _978 = !_950;
    int _980 = _978 ? 0 : (-1);
    bool _982 = uint(_952) > 1u;
    bool _984 = !_976;
    int _986 = _984 ? 0 : 1;
    int _988 = ~_277;
    int _990 = _988 + 1;
    int _992 = _946 & 3;
    bool _994 = _992 != 0;
    bool _996 = _952 != 3;
    int _998 = _990 * _942;
    int _1000 = _998 + _652;
    int _1002 = _994 ? 0 : 1;
    bool _1004 = uint(_952) >= 2u;
    int _1006 = ~_1002;
    int _1008 = _1006 + 1;
    int _1010 = _1008 + 1;
    int _1012 = _1010;
    if (!_982)
    {
        int _1014 = ~_1002;
        int _1016 = _1014 + 1;
        _1012 = _1016;
    }
    int _1018 = _1012;
    bool _1020 = uint(_1000) >= uint(_277);
    float _1022 = _1004 ? 0.0 : 1.4012984643248170709237295832899e-45;
    bool _1024 = _778 != 1;
    bool _1026 = !_1020;
    int _1028 = _1026 ? 0 : (-1);
    bool _1030 = _972 > 0.0;
    int _1032 = ~as_type<int>(_1022);
    int _1034 = _1032 + 1;
    int _1036 = _1034 + 1;
    int _1038 = ~_872;
    int _1040 = _1038 + _980;
    int _1042 = _1040 + 1;
    int _1044 = _1036;
    float _1046 = _972;
    float _1048 = _1022;
    if (_996)
    {
        int _1050 = ~as_type<int>(_1022);
        int _1052 = _1050 + 1;
        _1044 = _1052;
    }
    int _1054 = _1044;
    bool _1056 = _972 >= 0.0;
    bool _1058 = isnan(_972);
    bool _1060 = _1056 || _1058;
    bool _1062 = isnan(0.0);
    bool _1064 = _1060 || _1062;
    int _1066 = _261 * _1042;
    int _1068 = _1066 + _518;
    if (!_1024)
    {
        _772 = _235;
    }
    float _1070 = _772;
    int _1072 = _1064 ? 0 : 1;
    float _1074 = _1070;
    if (!_1024)
    {
        _1046 = _235;
    }
    float _1076 = _1046;
    float _1078 = _1076;
    if (!_1024)
    {
        _1048 = _241;
    }
    float _1080 = _1048;
    float _1082 = _1080;
    if (!_1024)
    {
        _964 = _241;
    }
    float _1084 = _964;
    int _1086 = ~_1072;
    int _1088 = _1086 + 1;
    int _1090 = _1088 + 1;
    float _1092 = _1084;
    int _1094 = _1090;
    if (_1024)
    {
        _1074 = _223;
    }
    float _1096 = _1074;
    if (_1024)
    {
        _1078 = _223;
    }
    float _1098 = _1078;
    if (_1024)
    {
        _1082 = _235;
    }
    float _1100 = _1082;
    if (_1024)
    {
        _1092 = _235;
    }
    float _1102 = _1092;
    if (!_1030)
    {
        int _1104 = ~_1072;
        int _1106 = _1104 + 1;
        _1094 = _1106;
    }
    int _1108 = _1094;
    float _1110 = _1100 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _1112 = !_876;
    int _1114 = _1112 ? 0 : 1;
    bool _1116 = !_954;
    int _1118 = _1116 ? 0 : 1;
    int _1120 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1122 = _1120 != 0;
    int _1124 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1126 = _1124 != 0;
    int _1128 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1130 = _1128 != 0;
    bool _1132 = _874 != 3;
    float _1134 = in.m_58.x;
    float _1136 = in.m_58.y;
    float _1138 = in.m_58.z;
    float _1140 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1142 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _1140;
    float _1144 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1146 = _1144 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1148 = _948 > 0.0;
    bool _1150 = _948 >= 0.0;
    bool _1152 = isnan(_948);
    bool _1154 = _1150 || _1152;
    bool _1156 = isnan(0.0);
    bool _1158 = _1154 || _1156;
    float _1160 = 1.0 / _1146;
    bool _1162 = !_658;
    int _1164 = _1162 ? _1068 : (-1);
    int _1166 = _1158 ? 0 : 1;
    bool _1168 = _952 != 3;
    int _1170 = ~_1166;
    int _1172 = _1170 + 1;
    int _1174 = _1172 + 1;
    float _1176 = 1.0 / _1142;
    bool _1178 = !_1168;
    int _1180 = _1178 ? 0 : (-1);
    int _1182 = _1174;
    if (!_1148)
    {
        int _1184 = ~_1166;
        int _1186 = _1184 + 1;
        _1182 = _1186;
    }
    int _1188 = _1182;
    int _1190 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1192 = _1190 != 0;
    int _1194 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1196 = _1194 != 0;
    int _1198 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1200 = _1198 != 0;
    float _1202 = _229 * _1160;
    float _1204 = _241 * 2.0;
    bool _1206 = !_1196;
    int _1208 = _1206 ? 0 : 1;
    float _1210 = _1136 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _1212 = _255 > 0.5;
    float _1214 = _1136 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1216 = _1136 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1218 = floor(_1204);
    float _1220 = fma(_1134, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1210);
    float _1222 = fma(_1134, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1214);
    float _1224 = fma(_1134, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1216);
    float _1226 = _223 + _235;
    float _1228 = _223 + _241;
    float _1230 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1232 = _233 * _1176;
    float _1234 = _241 + _235;
    float _1236 = _1226 + (-1.0);
    float _1238 = _1228 + (-1.0);
    bool _1240 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1242 = isnan(_217);
    bool _1244 = _1240 || _1242;
    bool _1246 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _1248 = _1244 || _1246;
    float _1250 = float(_1248);
    float _1252 = -_1230;
    float _1254 = fma(_271, 2.0, _1252);
    float _1256 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1258 = _1234 + (-1.0);
    float _1260 = fma(_1236, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1262 = fma(_1238, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1264 = -_1250;
    float _1266 = _1264 + 1.0;
    float _1268 = fma(_273, -2.0, _1256);
    float _1270 = fma(_1258, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1272 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1274 = isnan(_217);
    bool _1276 = _1272 || _1274;
    bool _1278 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1280 = _1276 || _1278;
    float _1282 = float(_1280);
    float _1284 = _253 * _1266;
    bool _1286 = !_1192;
    int _1288 = _1286 ? 0 : 1;
    float _1290 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1292 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1290;
    float _1294 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1296 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1294;
    bool _1298 = _1218 >= 0.0;
    bool _1300 = isnan(_1218);
    bool _1302 = _1298 || _1300;
    bool _1304 = isnan(0.0);
    bool _1306 = _1302 || _1304;
    float _1308 = _1282 * _265;
    float _1310 = fma(_1292, _1232, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _1312 = fma(_1296, _1232, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    int _1314 = _1306 ? 0 : 1;
    float _1316 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1318 = _1316 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _1320 = _1218 > 0.0;
    float _1322 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1324 = log2(_1322);
    float _1326 = _1310 * _1308;
    float _1328 = _1312 * _1308;
    float _1330 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1332 = _1330 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1334 = -_1282;
    float _1336 = _1334 + 1.0;
    bool _1338 = !_1132;
    int _1340 = _1338 ? 0 : (-1);
    float _1342 = fma(_1318, _1202, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    int _1344 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1346 = _1344 != 0;
    float _1348 = fma(_1332, _1202, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _1350 = !_1200;
    int _1352 = _1350 ? 0 : 1;
    float _1354 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _1356 = ~_1314;
    int _1358 = _1356 + 1;
    int _1360 = _1358 + 1;
    float _1362 = fma(_1336, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1326);
    int _1364 = _1360;
    if (!_1320)
    {
        int _1366 = ~_1314;
        int _1368 = _1366 + 1;
        _1364 = _1368;
    }
    int _1370 = _1364;
    float _1372 = fma(_1098, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1354);
    float _1374 = fma(_1336, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1328);
    float _1376 = fma(_1342, _1284, _1362);
    int _1378 = abs(_1352);
    float _1380 = _1324 * _147;
    float _1382 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _1384 = abs(_1208);
    float _1386 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1388 = float(_1108);
    float _1390 = exp2(_1380);
    float _1392 = float(_1188);
    float _1394 = _1096 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1396 = float(_1378);
    float _1398 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1400 = float(_1384);
    float _1402 = fma(_1110, -2.0, _1382);
    bool _1404 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1406 = isnan(0.0);
    bool _1408 = _1404 || _1406;
    bool _1410 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1412 = _1408 || _1410;
    float _1414 = -_1398;
    float _1416 = fma(_1394, 2.0, _1414);
    float _1418 = _1396 * _1392;
    int _1420 = abs(_1288);
    float _1422 = _1400 * _1388;
    float _1424 = in.m_70.x;
    float _1426 = in.m_70.y;
    float _1428 = in.m_70.z;
    float _1430 = fma(_1102, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1386);
    float _1432 = float(_1420);
    float _1434 = -_1390;
    float _1436 = _1434 + 1.0;
    float _1438 = float(_1370);
    float _1440 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1442 = 1.0 + _1440;
    float _1444 = _1422 * (-2.0);
    float _1446 = _1432 * _1438;
    float _1448 = _1412 ? _1436 : 0.0;
    float _1450 = 1.0 / _1442;
    bool _1452 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1454 = isnan(1.0);
    bool _1456 = _1452 || _1454;
    bool _1458 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1460 = _1456 || _1458;
    float _1462 = -_147;
    float _1464 = fma(_1462, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1254);
    float _1466 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1468 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1470 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1430);
    float _1472 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1372);
    float _1474 = fma(_1270, _1444, _1270);
    float _1476 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1402);
    float _1478 = _1446 * (-2.0);
    int _1480 = ~_942;
    int _1482 = _1480 + _1028;
    int _1484 = _1482 + 1;
    float _1486 = _1418 * (-2.0);
    float _1488 = fma(_223, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1466);
    float _1490 = fma(_235, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1468);
    float _1492 = fma(_1444, _1426, _1426);
    float _1494 = fma(_1260, _1478, _1260);
    float _1496 = fma(_1478, _1424, _1424);
    float _1498 = fma(_1262, _1486, _1262);
    float _1500 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1488);
    int _1502 = _277 * _1484;
    int _1504 = _1502 + _652;
    float _1506 = in.m_72.x;
    float _1508 = in.m_72.y;
    float _1510 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1268);
    float _1512 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1490);
    float _1514 = -_147;
    float _1516 = fma(_1514, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1416);
    float _1518 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    if (_1460)
    {
        float _1520 = _1448 * _1450;
        _151 = _1520;
    }
    float _1522 = _151;
    bool _1524 = _277 == 0;
    float _1526 = _223 + (-0.5);
    bool _1528 = _235 > 0.5;
    float _1530 = _1518 * _223;
    bool _1532 = !_1524;
    int _1534 = _1532 ? _1504 : (-1);
    float _1536 = fma(_1486, _1428, _1428);
    bool _1538 = _223 > 0.5;
    float _1540 = _235 + (-0.5);
    float _1542 = -_187;
    int _1544 = _1528 ? as_type<int>(_1542) : as_type<int>(_187);
    float _1546 = fma(_1526, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1496);
    bool _1548 = _241 > 0.5;
    float _1550 = _241 + (-0.5);
    float _1552 = fma(_1540, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1492);
    float _1554 = fma(_1550, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1536);
    float _1556 = fma(_1494, _1522, _1546);
    float _1558 = fma(_1348, _1284, _1374);
    float _1560 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1562 = fma(_1498, _1522, _1554);
    float _1564 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1566 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1568 = fma(_1250, (*spvDescriptorSet0.vp_c9)._m0[145].x, _1376);
    float _1570 = fma(_1474, _1522, _1552);
    float _1572 = _1560 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1574 = _1556 * 0.15915493667125701904296875;
    float _1576 = _1564 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1578 = _1566 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1580 = _1562 * 0.15915493667125701904296875;
    float _1582 = _1568 * _1506;
    float _1584 = _1570 * 0.15915493667125701904296875;
    float _1586 = fma(_1250, (*spvDescriptorSet0.vp_c9)._m0[145].y, _1558);
    float _1588 = fma(_1138, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1220);
    float _1590 = fma(_1138, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1222);
    float _1592 = fma(_1138, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1224);
    float _1594 = _1580 * 6.283185482025146484375;
    float _1596 = cos(_1594);
    float _1598 = _1582 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    out.m_74.x = _1572;
    out.m_74.y = _1576;
    out.m_74.z = _1578;
    int _1600 = _870 >> 31;
    float _1602 = _1586 * _1508;
    float _1604 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _183);
    int _1606 = abs(_1018);
    float _1608 = _1590 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1610 = _1574 * 6.283185482025146484375;
    float _1612 = cos(_1610);
    float _1614 = _1598 * _1604;
    float _1616 = _1602 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _1618 = abs(_1118);
    int _1620 = ~_1606;
    int _1622 = _1620 + 1;
    int _1624 = _1622 + 1;
    int _1626 = _946 >> 31;
    float _1628 = _1584 * 6.283185482025146484375;
    float _1630 = sin(_1628);
    int _1632 = _1600 & 3;
    int _1634 = _1626 & 3;
    float _1636 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _187);
    int _1638 = _870 + _1632;
    int _1640 = _946 + _1634;
    float _1642 = _1584 * 6.283185482025146484375;
    float _1644 = cos(_1642);
    float _1646 = _1616 * _1636;
    int _1648 = _1638 >> 2;
    float _1650 = _1612 * _1596;
    int _1652 = _1640 >> 2;
    int _1654 = _1648 << 4;
    int _1656 = _1654 + 368;
    float _1658 = _1650 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1660 = _1574 * 6.283185482025146484375;
    float _1662 = sin(_1660);
    float _1664 = _1612 * _1630;
    float _1666 = _1650 * _1646;
    float _1668 = _1650 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _1670 = abs(_1180);
    bool _1672 = !_1122;
    float _1674 = _1672 ? _187 : as_type<float>(_1544);
    float _1676 = _1580 * 6.283185482025146484375;
    float _1678 = sin(_1676);
    float _1680 = _1644 * _1596;
    float _1682 = _1662 * _1630;
    float _1684 = _1662 * _1644;
    float _1686 = _1662 * _1596;
    int _1688 = _1652 << 4;
    int _1690 = _1688 + 512;
    float _1692 = _1612 * _1644;
    uint _1694 = uint(int(uint(_1656) >> uint(2)));
    uint _1696 = uint(int(uint(int(_1694)) >> uint(2)));
    int _1698 = int(_1694) & 3;
    float _1700 = (*spvDescriptorSet0.vp_c9)._m0[int(_1696)][_1698];
    int _1702 = int(_1694) + 1;
    uint _1704 = uint(int(uint(_1702) >> uint(2)));
    int _1706 = _1702 & 3;
    float _1708 = (*spvDescriptorSet0.vp_c9)._m0[int(_1704)][_1706];
    float _1710 = _1630 * _1596;
    float _1712 = _1650 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1714 = fma(_1678, _1692, _1682);
    float _1716 = fma(_1678, _1682, _1692);
    float _1718 = -_1678;
    float _1720 = fma(_1718, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1658);
    float _1722 = -_1646;
    float _1724 = _1678 * _1722;
    float _1726 = _1686 * _1646;
    uint _1728 = uint(int(uint(_1690) >> uint(2)));
    uint _1730 = uint(int(uint(int(_1728)) >> uint(2)));
    int _1732 = int(_1728) & 3;
    float _1734 = (*spvDescriptorSet0.vp_c9)._m0[int(_1730)][_1732];
    int _1736 = int(_1728) + 1;
    uint _1738 = uint(int(uint(_1736) >> uint(2)));
    int _1740 = _1736 & 3;
    float _1742 = (*spvDescriptorSet0.vp_c9)._m0[int(_1738)][_1740];
    float _1744 = -_1664;
    float _1746 = fma(_1678, _1684, _1744);
    float _1748 = fma(_1680, _1614, _1724);
    float _1750 = fma(_1714, _1614, _1666);
    float _1752 = -_1684;
    float _1754 = fma(_1678, _1664, _1752);
    float _1756 = fma(_1746, _1614, _1726);
    float _1758 = -_1678;
    float _1760 = fma(_1758, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1712);
    float _1762 = -_1678;
    float _1764 = fma(_1762, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1668);
    int _1766 = _1690 + 8;
    uint _1768 = uint(int(uint(_1766) >> uint(2)));
    uint _1770 = uint(int(uint(int(_1768)) >> uint(2)));
    int _1772 = int(_1768) & 3;
    float _1774 = (*spvDescriptorSet0.vp_c9)._m0[int(_1770)][_1772];
    int _1776 = int(_1768) + 1;
    uint _1778 = uint(int(uint(_1776) >> uint(2)));
    int _1780 = _1776 & 3;
    float _1782 = (*spvDescriptorSet0.vp_c9)._m0[int(_1778)][_1780];
    float _1784 = _1714 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1786 = _1714 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1788 = _1714 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1790 = fma(_1686, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1720);
    float _1792 = fma(_1686, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1760);
    float _1794 = fma(_1680, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1784);
    float _1796 = fma(_1680, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1786);
    int _1798 = _1656 + 8;
    uint _1800 = uint(int(uint(_1798) >> uint(2)));
    uint _1802 = uint(int(uint(int(_1800)) >> uint(2)));
    int _1804 = int(_1800) & 3;
    float _1806 = (*spvDescriptorSet0.vp_c9)._m0[int(_1802)][_1804];
    int _1808 = int(_1800) + 1;
    uint _1810 = uint(int(uint(_1808) >> uint(2)));
    int _1812 = _1808 & 3;
    float _1814 = (*spvDescriptorSet0.vp_c9)._m0[int(_1810)][_1812];
    float _1816 = fma(_1680, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1788);
    int _1818 = abs(_970);
    float _1820 = _1754 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1822 = _1754 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1824 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1826 = int(_1824);
    float _1828 = fma(_1710, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1820);
    int _1830 = abs(_1114);
    float _1832 = fma(_1710, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1822);
    int _1834 = ~_1818;
    int _1836 = _1834 + 1;
    int _1838 = _1836 + 1;
    float _1840 = fma(_1686, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1764);
    int _1842 = abs(_934);
    float _1844 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    int _1846 = ~_1830;
    int _1848 = _1846 + 1;
    int _1850 = _1848 + 1;
    float _1852 = fma(_1710, _1844, _1748);
    int _1854 = abs(_1054);
    float _1856 = fma(_1716, _1844, _1756);
    int _1858 = ~_1618;
    int _1860 = _1858 + 1;
    int _1862 = _1860 + 1;
    float _1864 = _1754 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _1866 = _1838 * as_type<int>(_1708);
    float _1868 = float(uint(_1826));
    float _1870 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _1872 = int(_1870);
    int _1874 = ~_1842;
    int _1876 = _1874 + 1;
    int _1878 = _1876 + 1;
    int _1880 = _1850 * as_type<int>(_1700);
    int _1882 = _1880 + _1866;
    int _1884 = ~_1854;
    int _1886 = _1884 + 1;
    int _1888 = _1886 + 1;
    float _1890 = fma(_1710, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1864);
    int _1892 = ~_1826;
    int _1894 = _1892 + 1;
    int _1896 = _1624 * as_type<int>(_1742);
    float _1898 = 1.0 / _1868;
    int _1900 = _1862 * as_type<int>(_1734);
    int _1902 = _1900 + _1896;
    int _1904 = abs(_1826);
    int _1906 = _1888 * as_type<int>(_1774);
    int _1908 = _1906 + _1902;
    int _1910 = abs(_986);
    int _1912 = abs(_1340);
    int _1914 = abs(_764);
    int _1916 = _1878 * as_type<int>(_1806);
    int _1918 = _1916 + _1882;
    float _1920 = float(uint(_1872));
    float _1922 = fma(_1716, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1828);
    float _1924 = float(uint(_1904));
    int _1926 = ~_1670;
    int _1928 = _1926 + 1;
    int _1930 = _1928 + 1;
    float _1932 = 1.0 / _1920;
    int _1934 = ~_1912;
    int _1936 = _1934 + 1;
    int _1938 = _1936 + 1;
    int _1940 = abs(_1872);
    int _1942 = _1930 * as_type<int>(_1782);
    int _1944 = _1942 + _1908;
    int _1946 = ~_1914;
    int _1948 = _1946 + 1;
    int _1950 = _1948 + 1;
    int _1952 = _1938 * as_type<int>(_1814);
    int _1954 = _1952 + _1918;
    float _1956 = float(uint(_1940));
    float _1958 = 1.0 / _1924;
    int _1960 = ~_1910;
    int _1962 = _1960 + 1;
    int _1964 = _1962 + 1;
    int _1966 = _1944 * _1950;
    float _1968 = fma(_1716, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1832);
    float _1970 = _1592 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1972 = ~_1940;
    int _1974 = _1972 + 1;
    int _1976 = _1954 * _1964;
    float _1978 = fma(_1754, _1844, _1750);
    float _1980 = 1.0 / _1956;
    int _1982 = _1534 * _1914;
    int _1984 = _1982 + _1966;
    int _1986 = as_type<int>(_1932) + (-2);
    float _1988 = _1978 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _1990 = _1164 * _1910;
    int _1992 = _1990 + _1976;
    int _1994 = as_type<int>(_1898) + (-2);
    float _1996 = _1978 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1998 = fma(_1852, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1988);
    int _2000 = abs(_1984);
    float _2002 = _1588 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2004 = float(uint(_1992));
    float _2006 = fma(_1852, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1996);
    int _2008 = as_type<int>(_1958) + (-2);
    float _2010 = fma(_1856, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1998);
    float _2012 = as_type<float>(_1994) * _2004;
    int _2014 = abs(_1992);
    float _2016 = fma(_1856, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2006);
    float _2018 = float(uint(_1984));
    float _2020 = trunc(_2012);
    float _2022 = precise::max(_2020, 0.0);
    uint _2024 = uint(_2022);
    int _2026 = as_type<int>(_1980) + (-2);
    float _2028 = _2010 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2030 = float(uint(_2000));
    float _2032 = as_type<float>(_1986) * _2018;
    float _2034 = float(uint(_2014));
    float _2036 = fma(_1716, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1890);
    int _2038 = ~_1872;
    int _2040 = _2038 + 1;
    float _2042 = as_type<float>(_2026) * _2030;
    float _2044 = _2016 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2046 = as_type<float>(_2008) * _2034;
    float _2048 = trunc(_2032);
    float _2050 = precise::max(_2048, 0.0);
    uint _2052 = uint(_2050);
    float _2054 = _1970 + _2028;
    float _2056 = _2002 + _2044;
    int _2058 = ~_1904;
    int _2060 = _2058 + 1;
    float _2062 = _1978 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2064 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2066 = _2054 + _2064;
    float _2068 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2070 = _2056 + _2068;
    int _2072 = _1894 * int(_2024);
    int _2074 = _2072 + _1992;
    float _2076 = trunc(_2046);
    float _2078 = precise::max(_2076, 0.0);
    uint _2080 = uint(_2078);
    float _2082 = _2066 * _2066;
    float _2084 = _2070 * _2070;
    float _2086 = fma(_1852, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2062);
    float _2088 = float(uint(_2074));
    float _2090 = _2084 + _2082;
    float _2092 = -_183;
    int _2094 = _1538 ? as_type<int>(_2092) : as_type<int>(_183);
    float _2096 = trunc(_2042);
    float _2098 = precise::max(_2096, 0.0);
    uint _2100 = uint(_2098);
    int _2102 = _2040 * int(_2052);
    int _2104 = _2102 + _1984;
    float _2106 = as_type<float>(_1994) * _2088;
    bool _2108 = !_1346;
    float _2110 = _2108 ? _183 : as_type<float>(_2094);
    float _2112 = float(uint(_2104));
    float _2114 = sqrt(_2090);
    int _2116 = _2060 * int(_2080);
    int _2118 = _2116 + _2014;
    float _2120 = as_type<float>(_1986) * _2112;
    float _2122 = -_187;
    int _2124 = _1212 ? as_type<int>(_2122) : as_type<int>(_187);
    float _2126 = float(uint(_2118));
    float _2128 = fma(_1856, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2086);
    int _2130 = _1974 * int(_2100);
    int _2132 = _2130 + _2000;
    float _2134 = _187 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2136 = trunc(_2106);
    float _2138 = precise::max(_2136, 0.0);
    uint _2140 = uint(_2138);
    float _2142 = as_type<float>(_2008) * _2126;
    float _2144 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1794);
    float _2146 = float(uint(_2132));
    float _2148 = _2128 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2150 = _2134 * _1792;
    bool _2152 = _2114 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2154 = _2134 * _1840;
    float _2156 = as_type<float>(_2026) * _2146;
    float _2158 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1796);
    float _2160 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1816);
    bool _2162 = !_1130;
    float _2164 = _2162 ? _187 : as_type<float>(_2124);
    float _2166 = trunc(_2142);
    float _2168 = precise::max(_2166, 0.0);
    uint _2170 = uint(_2168);
    float _2172 = -_183;
    int _2174 = _1548 ? as_type<int>(_2172) : as_type<int>(_183);
    float _2176 = _183 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _2178 = !_1126;
    float _2180 = _2178 ? _183 : as_type<float>(_2174);
    float _2182 = _2134 * _1790;
    float _2184 = fma(_2176, _2158, _2150);
    float _2186 = trunc(_2156);
    float _2188 = precise::max(_2186, 0.0);
    uint _2190 = uint(_2188);
    float _2192 = trunc(_2120);
    float _2194 = precise::max(_2192, 0.0);
    uint _2196 = uint(_2194);
    float _2198 = fma(_2176, _2144, _2182);
    float _2200 = _1608 + _2148;
    float _2202 = _2148;
    float _2204 = _2084;
    float _2206 = _2082;
    float _2208 = _2056;
    float _2210 = _2054;
    if (!_2152)
    {
        _2202 = _2084;
    }
    float _2212 = _2202;
    float _2214 = fma(_2176, _2160, _2154);
    float _2216 = _2212;
    if (!_2152)
    {
        _2204 = _2200;
    }
    float _2218 = _2204;
    bool _2220 = !_2152;
    float _2222 = _2218;
    if (!_2220)
    {
        float _2224 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2226 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2228 = _2114 + _2226;
        float _2230 = rsqrt(_2090);
        float _2232 = _2228 * _2224;
        float _2234 = _2200 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2236 = _2232 * 0.15915493667125701904296875;
        float _2238 = _2236 * 6.283185482025146484375;
        float _2240 = sin(_2238);
        float _2242 = _2236 * 6.283185482025146484375;
        float _2244 = cos(_2242);
        float _2246 = fma(_2240, _2234, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2248 = _2230 * _2246;
        float _2250 = _2244 + (-1.0);
        float _2252 = fma(_2070, _2248, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2254 = fma(_2066, _2248, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2256 = _2250 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2258 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2260 = _2252 + _2258;
        float _2262 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2264 = _2254 + _2262;
        float _2266 = fma(_2200, _2244, _2256);
        float _2268 = _2260 * _2260;
        float _2270 = _2264 * _2264;
        _2222 = _2266;
        _2216 = _2268;
        _2206 = _2270;
        _2208 = _2252;
        _2210 = _2254;
    }
    float _2272 = _2222;
    float _2274 = _2216;
    float _2276 = _2206;
    float _2278 = _2208;
    float _2280 = _2210;
    int _2282 = int(_2024) + int(_2140);
    float _2284 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2286 = _2272 + _2284;
    int _2288 = ~_1826;
    int _2290 = _2288 + 1;
    float _2292 = -_1472;
    float _2294 = _2292 + 1.0;
    int _2296 = int(_2052) + int(_2196);
    float _2298 = fma(_2286, _2286, _2274);
    int _2300 = int(_2080) + int(_2170);
    float _2302 = trunc(_1530);
    int _2304 = int(_2302);
    int _2306 = ~_1904;
    int _2308 = _2306 + 1;
    int _2310 = _2290 * _2282;
    int _2312 = _2310 + _1992;
    int _2314 = ~_1872;
    int _2316 = _2314 + 1;
    float _2318 = _2298 + _2276;
    int _2320 = int(_2100) + int(_2190);
    int _2322 = _2308 * _2300;
    int _2324 = _2322 + _2014;
    int _2326 = ~_1940;
    int _2328 = _2326 + 1;
    int _2330 = _2316 * _2296;
    int _2332 = _2330 + _1984;
    bool _2334 = uint(_2312) >= uint(_1826);
    float _2336 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2338 = uint(_2324) >= uint(_1904);
    int _2340 = _2328 * _2320;
    int _2342 = _2340 + _2000;
    bool _2344 = !_2334;
    int _2346 = _2344 ? 0 : (-1);
    float _2348 = -_1512;
    float _2350 = _2348 + 1.0;
    bool _2352 = uint(_2332) >= uint(_1872);
    float _2354 = -_1470;
    float _2356 = _2354 + 1.0;
    int _2358 = ~_2282;
    int _2360 = _2358 + _2346;
    int _2362 = _2360 + 1;
    float _2364 = sqrt(_2318);
    bool _2366 = uint(_2342) >= uint(_1940);
    out.m_76.x = _2144;
    out.m_76.y = _2158;
    out.m_76.z = _2160;
    int _2368 = _2304 << 4;
    int _2370 = _2368 + 1712;
    bool _2372 = !_2352;
    int _2374 = _2372 ? 0 : (-1);
    int _2376 = _1992 ^ _1826;
    int _2378 = _1826 * _2362;
    int _2380 = _2378 + _1992;
    bool _2382 = _1826 == 0;
    float _2384 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _2386 = _1826 == 0;
    uint _2388 = uint(int(uint(_2370) >> uint(2)));
    uint _2390 = uint(int(uint(int(_2388)) >> uint(2)));
    int _2392 = int(_2388) & 3;
    float _2394 = (*spvDescriptorSet0.vp_c9)._m0[int(_2390)][_2392];
    int _2396 = int(_2388) + 1;
    uint _2398 = uint(int(uint(_2396) >> uint(2)));
    int _2400 = _2396 & 3;
    float _2402 = (*spvDescriptorSet0.vp_c9)._m0[int(_2398)][_2400];
    int _2404 = ~_2296;
    int _2406 = _2404 + _2374;
    int _2408 = _2406 + 1;
    int _2410 = _1984 ^ _1872;
    bool _2412 = !_2366;
    int _2414 = _2412 ? 0 : (-1);
    int _2416 = _1872 * _2408;
    int _2418 = _2416 + _1984;
    bool _2420 = _1872 == 0;
    float _2422 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2424 = _1872 == 0;
    bool _2426 = !_2338;
    int _2428 = _2426 ? 0 : (-1);
    int _2430 = _2370 + 8;
    uint _2432 = uint(int(uint(_2430) >> uint(2)));
    uint _2434 = uint(int(uint(int(_2432)) >> uint(2)));
    int _2436 = int(_2432) & 3;
    float _2438 = (*spvDescriptorSet0.vp_c9)._m0[int(_2434)][_2436];
    uint _2440 = uint(int(uint(_2376) >> uint(31)));
    int _2442 = ~_2414;
    int _2444 = _2320 + _2442;
    int _2446 = _2444 + 1;
    uint _2448 = uint(int(uint(_2410) >> uint(31)));
    int _2450 = ~_2428;
    int _2452 = _2300 + _2450;
    int _2454 = _2452 + 1;
    int _2456 = ~int(_2440);
    int _2458 = _2456 + 1;
    bool _2460 = !_2382;
    int _2462 = _2460 ? _2380 : (-1);
    float _2464 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2466 = ~int(_2448);
    int _2468 = _2466 + 1;
    int _2470 = _2454 ^ _2458;
    float _2472 = float(_2462);
    float _2474 = _2336 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2476 = fma(_2134, _2134, 1.0);
    int _2478 = _2446 ^ _2468;
    int _2480 = ~_2458;
    int _2482 = _2480 + _2470;
    int _2484 = _2482 + 1;
    float _2486 = fma(_2474, _2472, _1464);
    float _2488 = _2384 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2490 = rsqrt(_2476);
    int _2492 = ~_2468;
    int _2494 = _2492 + _2478;
    int _2496 = _2494 + 1;
    float _2498 = _2422 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _2500 = !_2386;
    int _2502 = _2500 ? _2484 : (-1);
    float _2504 = _2464 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _2506 = !_2420;
    int _2508 = _2506 ? _2418 : (-1);
    float _2510 = _2180 + 0.5;
    bool _2512 = !_2424;
    int _2514 = _2512 ? _2496 : (-1);
    float _2516 = float(_2502);
    float _2518 = float(_2508);
    float _2520 = _2110 + 0.5;
    float _2522 = float(_2514);
    float _2524 = -_1510;
    float _2526 = fma(_2498, _2516, _2524);
    float _2528 = _1674 + (-0.5);
    float _2530 = _2134 * _2490;
    float _2532 = fma(_2488, _2518, _1516);
    float _2534 = -_1476;
    float _2536 = fma(_2504, _2522, _2534);
    float _2538 = _2164 + (-0.5);
    float _2540 = -_2498;
    float _2542 = fma(_2540, _2528, _2526);
    float _2544 = -_1922;
    float _2546 = _2530 * _2544;
    float _2548 = fma(_2488, _2510, _2532);
    float _2550 = -_2504;
    float _2552 = fma(_2550, _2538, _2536);
    float _2554 = _2394 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2556 = -_1968;
    float _2558 = _2530 * _2556;
    float _2560 = fma(_2490, _1790, _2546);
    float _2562 = -_2036;
    float _2564 = _2530 * _2562;
    float _2566 = _2402 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2568 = fma(_2490, _1792, _2558);
    float _2570 = fma(_2490, _1840, _2564);
    float _2572 = fma(_2474, _2520, _2486);
    float _2574 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2576 = -_1500;
    float _2578 = _2576 + 1.0;
    float _2580 = _2438 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2582 = _1968 + _2184;
    float _2584 = -_2294;
    float _2586 = fma(_2180, _2584, _2548);
    float _2588 = _1922 + _2198;
    float _2590 = -_2578;
    float _2592 = fma(_2110, _2590, _2572);
    float _2594 = _2554 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2596 = _2566 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2598 = _2580 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2600 = fma(_1674, _2350, _2542);
    float _2602 = fma(_2164, _2356, _2552);
    float _2604 = _2036 + _2214;
    out.m_78.x = _2560;
    out.m_78.y = _2568;
    out.m_78.z = _2570;
    bool _2606 = _2364 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2608 = isnan(_2364);
    bool _2610 = _2606 || _2608;
    bool _2612 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2614 = _2610 || _2612;
    out.m_80.x = _2594;
    out.m_80.y = _2596;
    out.m_80.z = _2598;
    out.m_80.w = _2574;
    out.m_82.x = _2592;
    out.m_82.y = _2600;
    out.m_82.z = _2586;
    out.m_82.w = _2602;
    out.m_84.x = _2588;
    out.m_84.y = _2582;
    out.m_84.z = _2604;
    float _2616 = _2356;
    float _2618 = as_type<float>(_2300);
    float _2620 = as_type<float>(_2332);
    float _2622 = as_type<float>(_2312);
    float _2624 = _2486;
    if (!_2614)
    {
        _2616 = 1.0;
    }
    float _2626 = _2616;
    bool _2628 = !_2614;
    float _2630 = _2626;
    if (!_2628)
    {
        bool _2632 = _2364 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2634 = isnan(_2364);
        bool _2636 = _2632 || _2634;
        bool _2638 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2640 = _2636 || _2638;
        if (!_2640)
        {
            float _2642 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2644 = _2364 + _2642;
            float _2646 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2648 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2646;
            float _2650 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2652 = _2650 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2654 = 1.0 / _2648;
            float _2656 = _2644 * _2654;
            float _2658 = fma(_2656, _2652, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2630 = _2658;
            _2660 = true;
        }
        else
        {
            bool _2662 = _2364 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2664 = isnan(_2364);
            bool _2666 = _2662 || _2664;
            bool _2668 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2670 = _2666 || _2668;
            if (!_2670)
            {
                float _2672 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2674 = _2364 + _2672;
                float _2676 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2678 = _2676 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2680 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2682 = _2680 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2684 = 1.0 / _2678;
                float _2686 = _2674 * _2684;
                float _2688 = fma(_2686, _2682, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2630 = _2688;
                _2660 = true;
            }
            else
            {
                _2630 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2660 = false;
    float _2690 = _2630;
    float _2692 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2694 = _2272 + _2692;
    float _2696 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2698 = _2278 + _2696;
    float _2700 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2702 = _2280 + _2700;
    float _2704 = _1608 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2706 = fma(_2694, _2690, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2708 = fma(_2698, _2690, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2710 = fma(_2702, _2690, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2712 = fma(_2002, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2704);
    float _2714 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2716 = _2706 + _2714;
    float _2718 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2720 = _2708 + _2718;
    float _2722 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2724 = _2710 + _2722;
    float _2726 = fma(_1970, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2712);
    float _2728 = _2716 * _2716;
    float _2730 = _1608 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2732 = _2726 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2734 = fma(_2720, _2720, _2728);
    float _2736 = fma(_2002, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2730);
    float _2738 = 1.0 / _2732;
    float _2740 = fma(_2724, _2724, _2734);
    float _2742 = fma(_1970, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2736);
    float _2744 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _2746 = _2742 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2748 = rsqrt(_2740);
    float _2750 = _1608 + _2744;
    float _2752 = _2746 + _2732;
    float _2754 = fma(_2002, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2756 = _2750 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _2758 = _2750 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _2760 = _2752 * _2738;
    float _2762 = _2760 * 0.5;
    float _2764 = fma(_2002, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2756);
    float _2766 = fma(_2002, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2758);
    float _2768 = floor(_2754);
    float _2770 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2772 = fma(_2762, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2770);
    float _2774 = fma(_1970, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2764);
    float _2776 = fma(_1970, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2766);
    float _2778 = _2748 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2780 = _2774 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _2782 = _2776 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _2784 = 1.0 / _2772;
    float _2786 = _2720 * _2778;
    float _2788 = _2724 * _2778;
    float _2790 = _2786 * _2786;
    float _2792 = _2788 * _2788;
    float _2794 = trunc(_2780);
    int _2796 = int(_2794);
    float _2798 = -_2768;
    float _2800 = _2754 + _2798;
    float _2802 = _2790 + _2792;
    float _2804 = sqrt(_2802);
    float _2806 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2808 = _2784 * _2806;
    bool _2810 = _2808 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _2812 = _2808 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _2814 = trunc(_2782);
    int _2816 = int(_2814);
    int _2818 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2820 = _2796 + _2818;
    int _2822 = _2820 + 1;
    bool _2824 = _2804 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2826 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2828 = _2804 + _2826;
    float _2830 = sqrt(_2740);
    int _2832 = 2;
    float _2834 = _2802;
    float _2836 = _2828;
    float _2838 = _2778;
    float _2840 = _2786;
    float _2842 = _2768;
    float _2844 = _2790;
    if (!_2810)
    {
        _2832 = 1;
    }
    int _2846 = _2832;
    int _2848 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _2850 = _2816 + _2848;
    int _2852 = _2850 + 1;
    float _2854 = _2732;
    int _2856 = _2846;
    if (_2824)
    {
        float _2858 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2854 = _2858;
    }
    float _2860 = _2854;
    if (_2824)
    {
        float _2862 = rsqrt(_2802);
        _2834 = _2862;
    }
    float _2864 = _2834;
    float _2866 = _2864;
    if (_2824)
    {
        float _2868 = _2828 * _2860;
        _2836 = _2868;
    }
    float _2870 = _2836;
    if (_2824)
    {
        float _2872 = _2870 * 0.15915493667125701904296875;
        _2618 = _2872;
    }
    float _2874 = _2618;
    bool _2876 = !_2810;
    int _2878 = _2876 ? 0 : 1;
    float _2880 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2882 = _2774;
    if (_2824)
    {
        float _2884 = _2874 * 6.283185482025146484375;
        float _2886 = sin(_2884);
        _2882 = _2886;
    }
    float _2888 = _2882;
    if (!_2812)
    {
        _2856 = _2878;
    }
    int _2890 = _2856;
    float _2892 = precise::max(0.0, _2880);
    int _2894 = _2890 << 6;
    bool _2896 = _2822 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _2898 = -_2778;
    float _2900 = -_2892;
    float _2902 = fma(_2716, _2898, _2900);
    int _2904 = _2894 + 96;
    uint _2906 = uint(int(uint(_2904) >> uint(2)));
    uint _2908 = uint(int(uint(int(_2906)) >> uint(2)));
    int _2910 = int(_2906) & 3;
    float _2912 = (*spvDescriptorSet0.vp_c15)._m0[int(_2908)][_2910];
    int _2914 = int(_2906) + 1;
    uint _2916 = uint(int(uint(_2914) >> uint(2)));
    int _2918 = _2914 & 3;
    float _2920 = (*spvDescriptorSet0.vp_c15)._m0[int(_2916)][_2918];
    int _2922 = _2822 | _2852;
    float _2924 = _2874;
    float _2926 = as_type<float>(_2922);
    if (_2824)
    {
        float _2928 = _2874 * 6.283185482025146484375;
        float _2930 = cos(_2928);
        _2924 = _2930;
    }
    float _2932 = _2924;
    if (_2824)
    {
        float _2934 = _2902 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2838 = _2934;
    }
    float _2936 = _2838;
    bool _2938 = _2922 < 0;
    bool _2940 = _2938 || _2896;
    if (_2824)
    {
        float _2942 = fma(_2888, _2936, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2926 = _2942;
    }
    float _2944 = _2926;
    int _2946 = _2894 + 48;
    uint _2948 = uint(int(uint(_2946) >> uint(2)));
    uint _2950 = uint(int(uint(int(_2948)) >> uint(2)));
    int _2952 = int(_2948) & 3;
    float _2954 = (*spvDescriptorSet0.vp_c15)._m0[int(_2950)][_2952];
    int _2956 = int(_2948) + 1;
    uint _2958 = uint(int(uint(_2956) >> uint(2)));
    int _2960 = _2956 & 3;
    float _2962 = (*spvDescriptorSet0.vp_c15)._m0[int(_2958)][_2960];
    float _2964 = fma(_1970, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2966 = _2706 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_2824)
    {
        float _2968 = _2864 * _2944;
        _2620 = _2968;
    }
    float _2970 = _2620;
    bool _2972 = _2852 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _2974 = _2972 || _2940;
    float _2976 = floor(_2964);
    float _2978 = fma(_2708, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2966);
    if (_2824)
    {
        float _2980 = _2786 * _2970;
        _2840 = _2980;
    }
    float _2982 = _2840;
    int _2984 = _2894 + 64;
    uint _2986 = uint(int(uint(_2984) >> uint(2)));
    uint _2988 = uint(int(uint(int(_2986)) >> uint(2)));
    int _2990 = int(_2986) & 3;
    float _2992 = (*spvDescriptorSet0.vp_c15)._m0[int(_2988)][_2990];
    int _2994 = int(_2986) + 1;
    uint _2996 = uint(int(uint(_2994) >> uint(2)));
    int _2998 = _2994 & 3;
    float _3000 = (*spvDescriptorSet0.vp_c15)._m0[int(_2996)][_2998];
    if (!_2824)
    {
        _2842 = _2902;
    }
    float _3002 = _2842;
    float _3004 = _3002;
    if (_2824)
    {
        float _3006 = _2932 + (-1.0);
        _2866 = _3006;
    }
    float _3008 = _2866;
    float _3010 = fma(_2710, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2978);
    float _3012 = _3008;
    float _3014 = _3010;
    if (_2824)
    {
        float _3016 = _2982 * _2982;
        _2844 = _3016;
    }
    float _3018 = _2844;
    if (_2824)
    {
        float _3020 = _3008 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2622 = _3020;
    }
    float _3022 = _2622;
    if (!_2824)
    {
        _3012 = _2788;
    }
    float _3024 = _3012;
    int _3026 = _2894 + 104;
    uint _3028 = uint(int(uint(_3026) >> uint(2)));
    uint _3030 = uint(int(uint(int(_3028)) >> uint(2)));
    int _3032 = int(_3028) & 3;
    float _3034 = (*spvDescriptorSet0.vp_c15)._m0[int(_3030)][_3032];
    int _3036 = int(_3028) + 1;
    uint _3038 = uint(int(uint(_3036) >> uint(2)));
    int _3040 = _3036 & 3;
    float _3042 = (*spvDescriptorSet0.vp_c15)._m0[int(_3038)][_3040];
    float _3044 = _3024;
    if (_2824)
    {
        float _3046 = _2788 * _2970;
        _3044 = _3046;
    }
    float _3048 = _3044;
    if (_2824)
    {
        float _3050 = fma(_2902, _2932, _3022);
        _3004 = _3050;
    }
    float _3052 = _3004;
    float _3054 = _3010 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    if (!_2824)
    {
        _3014 = _2792;
    }
    float _3056 = _3014;
    float _3058 = _3056;
    if (_2824)
    {
        float _3060 = _3048 * _3048;
        _3058 = _3060;
    }
    float _3062 = _3058;
    float _3064 = fma(_3052, _3052, _3018);
    if (!_2974)
    {
        float _3066 = floor(_2782);
        _2624 = _3066;
    }
    float _3068 = _2624;
    int _3070 = _2894 + 80;
    uint _3072 = uint(int(uint(_3070) >> uint(2)));
    uint _3074 = uint(int(uint(int(_3072)) >> uint(2)));
    int _3076 = int(_3072) & 3;
    float _3078 = (*spvDescriptorSet0.vp_c15)._m0[int(_3074)][_3076];
    int _3080 = int(_3072) + 1;
    uint _3082 = uint(int(uint(_3080) >> uint(2)));
    int _3084 = _3080 & 3;
    float _3086 = (*spvDescriptorSet0.vp_c15)._m0[int(_3082)][_3084];
    float _3088 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3090 = _3054 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3092 = -_2976;
    float _3094 = _2964 + _3092;
    float _3096 = _3064 + _3062;
    float _3098 = -_3090;
    float _3100 = fma(_3098, _3088, 1.0);
    int _3102 = as_type<int>(_3090);
    if (!_2974)
    {
        int _3104 = _2852 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _3106 = _3104 + _2822;
        _3102 = _3106;
    }
    int _3108 = _3102;
    int _3110 = _2894 + 56;
    uint _3112 = uint(int(uint(_3110) >> uint(2)));
    uint _3114 = uint(int(uint(int(_3112)) >> uint(2)));
    int _3116 = int(_3112) & 3;
    float _3118 = (*spvDescriptorSet0.vp_c15)._m0[int(_3114)][_3116];
    int _3120 = int(_3112) + 1;
    uint _3122 = uint(int(uint(_3120) >> uint(2)));
    int _3124 = _3120 & 3;
    float _3126 = (*spvDescriptorSet0.vp_c15)._m0[int(_3122)][_3124];
    float _3128 = log2(_3100);
    int _3130 = _2894 + 72;
    uint _3132 = uint(int(uint(_3130) >> uint(2)));
    uint _3134 = uint(int(uint(int(_3132)) >> uint(2)));
    int _3136 = int(_3132) & 3;
    float _3138 = (*spvDescriptorSet0.vp_c15)._m0[int(_3134)][_3136];
    int _3140 = int(_3132) + 1;
    uint _3142 = uint(int(uint(_3140) >> uint(2)));
    int _3144 = _3140 & 3;
    float _3146 = (*spvDescriptorSet0.vp_c15)._m0[int(_3142)][_3144];
    float _3148 = _2750 * _2920;
    float _3150 = fma(_2002, _2912, _3148);
    int _3152 = _2894 + 88;
    uint _3154 = uint(int(uint(_3152) >> uint(2)));
    uint _3156 = uint(int(uint(int(_3154)) >> uint(2)));
    int _3158 = int(_3154) & 3;
    float _3160 = (*spvDescriptorSet0.vp_c15)._m0[int(_3156)][_3158];
    int _3162 = int(_3154) + 1;
    uint _3164 = uint(int(uint(_3162) >> uint(2)));
    int _3166 = _3162 & 3;
    float _3168 = (*spvDescriptorSet0.vp_c15)._m0[int(_3164)][_3166];
    float _3170 = _2750 * _2962;
    float _3172 = rsqrt(_3096);
    float _3174 = _3128 * 0.693147182464599609375;
    float _3176 = fma(_2002, _2954, _3170);
    int _3178 = as_type<int>(_3170);
    int _3180 = as_type<int>(_2912);
    if (!_2974)
    {
        int _3182 = _3108 << 2;
        _3178 = _3182;
    }
    int _3184 = _3178;
    float _3186 = _2750 * _3000;
    float _3188 = _3000;
    int _3190 = _3184;
    int _3192 = as_type<int>(_3086);
    if (!_2974)
    {
        float _3194 = -_3068;
        float _3196 = _2782 + _3194;
        _3188 = _3196;
    }
    float _3198 = _3188;
    if (!_2974)
    {
        int _3200 = 12 & _3184;
        _3190 = _3200;
    }
    int _3202 = _3190;
    float _3204 = fma(_2002, _2992, _3186);
    float2 _8729 = float2(_2800, _3094);
    float _3206 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8729, float2(0.0), isnan(_8729)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8729, float2(0.0), isnan(_8729)), level(0.0)).x;
    float _3208 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3210 = fma(_2830, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3208);
    float _3212 = precise::clamp(_3210, 0.0, 1.0);
    float _3214 = _3174 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3216 = fma(_1970, _3034, _3150);
    float _3218 = _3172 * _2982;
    float _3220 = _3216 + _3042;
    float _3222 = _3172 * _3052;
    float _3224 = _3172 * _3048;
    float _3226 = _3218 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3228 = _2750 * _3086;
    if (!_2974)
    {
        uint _3230 = uint(int(uint(_3108) >> uint(2)));
        _3192 = int(_3230);
    }
    int _3232 = _3192;
    float _3234 = 1.0 / _3220;
    float _3236 = fma(_2002, _3078, _3228);
    float _3238 = -_3212;
    float _3240 = _3238 + 1.0;
    if (!_2974)
    {
        int _3242 = _3232 << 4;
        int _3244 = _3242 + _3202;
        _3180 = _3244;
    }
    int _3246 = _3180;
    float _3248 = fma(_1970, _3118, _3176);
    float _3250 = abs(_3240);
    float _3252 = log2(_3250);
    float _3254 = _3248 + _3126;
    float _3256 = _2706 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3258 = _3248;
    if (!_2974)
    {
        int _3260 = _3246 + 400;
        uint _3262 = uint(int(uint(_3260) >> uint(2)));
        uint _3264 = uint(int(uint(int(_3262)) >> uint(2)));
        int _3266 = int(_3262) & 3;
        float _3268 = (*spvDescriptorSet0.vp_c15)._m0[int(_3264)][_3266];
        _3258 = _3268;
    }
    float _3270 = _3258;
    float _3272 = fma(_1970, _3138, _3204);
    float _3274 = fma(_2708, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3256);
    float _3276 = _3272 + _3146;
    float _3278 = _2706 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3280 = fma(_2710, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3274);
    float _3282 = fma(_1970, _3160, _3236);
    float _3284 = -_3226;
    float _3286 = fma(_3222, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3284);
    float _3288 = _2706 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3290 = fma(_2708, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3278);
    float _3292 = _3280 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3294 = -_3224;
    float _3296 = fma(_3294, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3286);
    float _3298 = fma(_2708, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3288);
    float _3300 = fma(_2710, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3290);
    float _3302 = _3254 * _3234;
    float _3304 = _3292 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3306 = _3252 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3308 = _3300 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3310 = fma(_2710, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3298);
    bool _3312 = _3302 >= 0.0;
    float _3314 = fma(_3296, 0.5, 0.5);
    float _3316 = fma(_3308, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3304);
    float _3318 = _3276 * _3234;
    bool _3320 = _3302 <= 1.0;
    bool _3322 = _3320 && _3312;
    float _3324 = exp2(_3306);
    float _3326 = fma(_3296, -0.5, 0.5);
    float _3328 = _3310 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    bool _3330 = _3318 >= 0.0;
    bool _3332 = _3330 && _3322;
    float _3334 = fma(_3054, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3316);
    float _3336 = _3282 + _3168;
    float _3338 = fma(_3314, -0.0187292993068695068359375, 0.07426099479198455810546875);
    bool _3340 = _3318 <= 1.0;
    bool _3342 = _3340 && _3332;
    float _3344 = _3222 + 1.0;
    float _3346 = _3292 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3348 = fma(_3328, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3334);
    float _3350 = fma(_3314, _3338, -0.212114393711090087890625);
    float _3352 = _3298;
    float _3354 = _3346;
    float _3356 = _3348;
    if (!_2974)
    {
        float _3358 = floor(_2780);
        _3352 = _3358;
    }
    float _3360 = _3352;
    float _3362 = _3292 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3364 = _3336 * _3234;
    float _3366 = fma(_3314, _3350, 1.570728778839111328125);
    float _3368 = -_3222;
    float _3370 = fma(_3324, _3344, _3368);
    float _3372 = fma(_3308, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3346);
    float _3374 = fma(_3308, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3362);
    float _3376 = 1.0 / _3348;
    if (_3342)
    {
        float _3378 = float(_2890);
        _3354 = _3378;
    }
    float _3380 = _3354;
    float _3382 = fma(_3054, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3374);
    float _3384 = fma(_3054, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3372);
    float _3386 = fma(_3370, 0.5, 0.5);
    float _3388 = fma(_3328, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3382);
    float _3390 = fma(_3328, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3384);
    float _3392 = sqrt(_3326);
    float _3394 = _3384;
    float _3396 = _3388;
    if (!_2974)
    {
        float _3398 = -_3360;
        float _3400 = _2780 + _3398;
        _3394 = _3400;
    }
    float _3402 = _3394;
    float _3404 = _3380;
    if (_3342)
    {
        float _3406 = rint(_3380);
        float _3408 = precise::max(_3406, 0.0);
        uint _3410 = uint(_3408);
        uint _3412 = clamp(_3410, 0u, 65535u);
        _3404 = as_type<float>(_3412);
    }
    float _3414 = _3404;
    float _3416 = _3388 * _3376;
    float _3418 = _3390 * _3376;
    float _3420 = fma(_3416, 0.5, 0.5);
    float _3422 = fma(_3418, -0.5, 0.5);
    float _3424 = _3392 * 0.636619746685028076171875;
    float _3426 = _3270;
    if (!_2974)
    {
        float _3428 = rint(_3270);
        float _3430 = precise::max(_3428, 0.0);
        uint _3432 = uint(_3430);
        uint _3434 = clamp(_3432, 0u, 65535u);
        _3426 = as_type<float>(_3434);
    }
    float _3436 = _3426;
    float _3438 = -_3366;
    float _3440 = fma(_3424, _3438, 1.0);
    float _3442 = _3414;
    if (_3342)
    {
        float3 _9134 = float3(_3302, _3318, float(as_type<int>(_3414)));
        float3 _9138 = select(_9134, float3(0.0), isnan(_9134));
        float _3444 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _9138.xy, uint(rint(_9138.z)), _3364, level(0.0));
        _3442 = _3444;
    }
    float _3446 = _3442;
    float3 _9148 = float3(_3420, _3422, _3214);
    float _3448 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9148, float3(0.0), isnan(_9148)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9148, float3(0.0), isnan(_9148)), level(0.0)).x;
    float3 _9157 = float3(_3420, _3422, _3214);
    float4 _3451 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9157, float3(0.0), isnan(_9157)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9157, float3(0.0), isnan(_9157)), level(0.0)).xyzw;
    float _3453 = _3451.x;
    float _3455 = _3451.y;
    float _3457 = _3451.z;
    float _3459 = _3451.w;
    float2 _9173 = float2(_3440, _3386);
    float3 _3463 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9173, float2(0.0), isnan(_9173)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9173, float2(0.0), isnan(_9173)), level(0.0)).xyz;
    float _3465 = _3463.x;
    float _3467 = _3463.y;
    float _3469 = _3463.z;
    float _3471 = _3402;
    if (!_2974)
    {
        float3 _9194 = float3(_3402, _3198, float(as_type<int>(_3436)));
        float3 _9196 = select(_9194, float3(0.0), isnan(_9194));
        float _3473 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _9196.xy, uint(rint(_9196.z)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _9196.xy, uint(rint(_9196.z)), level(0.0)).x;
        _3471 = _3473;
    }
    float _3475 = _3471;
    float _3477 = abs(_2808);
    float _3479 = log2(_3477);
    float _3481 = _3252 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3483 = _3292 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3485 = exp2(_3481);
    float _3487 = fma(_3308, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3483);
    bool _3489 = _2808 <= 8000.0;
    bool _3491 = isnan(_2808);
    bool _3493 = _3489 || _3491;
    bool _3495 = isnan(8000.0);
    bool _3497 = _3493 || _3495;
    float _3499 = float(_3497);
    float _3501 = fma(_3054, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3487);
    float _3503 = _3479 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3505 = fma(_3328, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3501);
    float _3507 = exp2(_3503);
    out.gl_Position.x = _3388;
    out.gl_Position.y = _3390;
    out.gl_Position.z = _3505;
    out.gl_Position.w = _3348;
    float _3509 = -_3485;
    float _3511 = _3509 + 1.0;
    float _3513 = _3511 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (_2974)
    {
        _3396 = 1.0;
    }
    float _3515 = _3396;
    float _3517 = fma(_3507, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3519 = precise::clamp(_3517, 0.0, 1.0);
    float _3521 = fma(_3519, -2.0, 3.0);
    float _3523 = _3519 * _3519;
    float _3525 = _3523 * _3521;
    float _3527 = -_3525;
    float _3529 = _3527 + 1.0;
    float _3531 = fma(_3529, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3525);
    float _3533 = _3499 * _3531;
    float _3535 = _3533 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3537 = _3533;
    float _3539 = _3515;
    if (!_3342)
    {
        _3537 = 1.0;
    }
    float _3541 = _3537;
    float _3543 = -_3206;
    float _3545 = _3543 + 1.0;
    float _3547 = _3545 * _3535;
    float _3549 = precise::clamp(_3547, 0.0, 1.0);
    float _3551 = _3541;
    float _3553 = _3549;
    if (_3342)
    {
        bool _3555 = _3446 >= _3364;
        bool _3557 = isnan(_3446);
        bool _3559 = _3555 || _3557;
        bool _3561 = isnan(_3364);
        bool _3563 = _3559 || _3561;
        float _3565 = float(_3563);
        _3551 = _3565;
    }
    float _3567 = _3551;
    float _3569 = _3567;
    if (!_2974)
    {
        int _3571 = _3108 << 4;
        int _3573 = _3571 + 2048;
        uint _3575 = uint(int(uint(_3573) >> uint(2)));
        uint _3577 = uint(int(uint(int(_3575)) >> uint(2)));
        int _3579 = int(_3575) & 3;
        float _3581 = (*spvDescriptorSet0.vp_c15)._m0[int(_3577)][_3579];
        int _3583 = int(_3575) + 1;
        uint _3585 = uint(int(uint(_3583) >> uint(2)));
        int _3587 = _3583 & 3;
        float _3589 = (*spvDescriptorSet0.vp_c15)._m0[int(_3585)][_3587];
        int _3591 = _3573 + 8;
        uint _3593 = uint(int(uint(_3591) >> uint(2)));
        uint _3595 = uint(int(uint(int(_3593)) >> uint(2)));
        int _3597 = int(_3593) & 3;
        float _3599 = (*spvDescriptorSet0.vp_c15)._m0[int(_3595)][_3597];
        int _3601 = int(_3593) + 1;
        uint _3603 = uint(int(uint(_3601) >> uint(2)));
        int _3605 = _3601 & 3;
        float _3607 = (*spvDescriptorSet0.vp_c15)._m0[int(_3603)][_3605];
        float _3609 = _2750 * _3589;
        float _3611 = fma(_2002, _3581, _3609);
        float _3613 = fma(_1970, _3599, _3611);
        float _3615 = _3613 + _3607;
        float _3617 = precise::clamp(_3615, 0.0, 1.0);
        float _3619 = -_3617;
        float _3621 = _3619 + _3475;
        float _3623 = fma(_3621, 500.0, 1.5);
        float _3625 = exp2(_3623);
        float _3627 = 0.0 + _3625;
        float _3629 = precise::clamp(_3627, 0.0, 1.0);
        _3539 = _3629;
        _3356 = _3607;
    }
    float _3631 = _3539;
    float _3633 = _3356;
    float _3635 = _3567 * _3631;
    float _3637 = _3513 * _3448;
    float _3639 = -_3549;
    float _3641 = fma(_3639, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3643 = -_3513;
    float _3645 = _3643 + 1.0;
    out.m_86.x = _2708;
    out.m_86.y = _2706;
    out.m_86.z = _2710;
    float _3647 = _3459 * _3637;
    float _3649 = -_3635;
    float _3651 = fma(_3649, _3641, 1.0);
    float _3653 = precise::clamp(_3651, 0.0, 1.0);
    float _3655 = _3469 * _3637;
    float _3657 = _3459 * _3645;
    float _3659 = fma(_3465, _3647, _3453);
    float _3661 = fma(_3467, _3647, _3455);
    float _3663 = _3653 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3665 = fma(_3459, _3655, _3457);
    bool _3667 = _2830 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3669 = isnan(_2830);
    bool _3671 = _3667 || _3669;
    bool _3673 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3675 = _3671 || _3673;
    out.m_88.x = _3663;
    out.m_90.x = _3659;
    out.m_90.y = _3661;
    out.m_90.z = _3665;
    out.m_90.w = _3657;
    float _3677 = _3633;
    float _3679 = _3647;
    float _3681 = _3641;
    float _3683 = _3653;
    if (!_3675)
    {
        _3569 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3685 = _3569;
    float _3687 = _3685;
    float _3689 = _3685;
    if (!_3675)
    {
        _3553 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3691 = _3553;
    float _3693 = _3691;
    float _3695 = _3691;
    if (!_3675)
    {
        _3677 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3697 = _3677;
    float _3699 = _3697;
    float _3701 = _3697;
    if (!_3675)
    {
        _3679 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3703 = _3679;
    float _3705 = _3703;
    float _3707 = _3703;
    if (!_3675)
    {
        _3681 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3709 = _3681;
    float _3711 = _3709;
    float _3713 = _3709;
    if (!_3675)
    {
        _3683 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3715 = _3683;
    bool _3717 = !_3675;
    float _3719 = _3715;
    float _3721 = _3715;
    if (!_3717)
    {
        bool _3723 = _2830 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3725 = isnan(_2830);
        bool _3727 = _3723 || _3725;
        bool _3729 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3731 = _3727 || _3729;
        if (!_3731)
        {
            float _3733 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3735 = _2830 + _3733;
            float _3737 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3739 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3737;
            float _3741 = 1.0 / _3739;
            float _3743 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3745 = _3743 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3747 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3749 = _3747 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3751 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3753 = _3751 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3755 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3757 = _3755 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3759 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3761 = _3759 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3763 = _3735 * _3741;
            float _3765 = precise::clamp(_3763, 0.0, 1.0);
            float _3767 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3769 = _3767 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3771 = fma(_3765, _3745, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3773 = fma(_3765, _3769, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3775 = fma(_3765, _3749, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3777 = fma(_3765, _3753, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3779 = fma(_3765, _3757, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3781 = fma(_3765, _3761, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3695 = _3773;
            _3713 = _3779;
            _3689 = _3771;
            _3707 = _3777;
            _3701 = _3775;
            _3721 = _3781;
            _3783 = true;
        }
        else
        {
            bool _3785 = _2830 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3787 = isnan(_2830);
            bool _3789 = _3785 || _3787;
            bool _3791 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3793 = _3789 || _3791;
            if (!_3793)
            {
                _3687 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3795 = _3687;
            _3689 = _3795;
            if (!_3793)
            {
                _3693 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3797 = _3693;
            _3695 = _3797;
            if (!_3793)
            {
                _3699 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3799 = _3699;
            _3701 = _3799;
            if (!_3793)
            {
                _3705 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3801 = _3705;
            _3707 = _3801;
            if (!_3793)
            {
                _3711 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3803 = _3711;
            _3713 = _3803;
            if (!_3793)
            {
                _3719 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3805 = _3719;
            bool _3807 = !_3793;
            _3721 = _3805;
            if (!_3807)
            {
                bool _3809 = _2830 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3811 = isnan(_2830);
                bool _3813 = _3809 || _3811;
                bool _3815 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3817 = _3813 || _3815;
                if (!_3817)
                {
                    float _3819 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3821 = _2830 + _3819;
                    float _3823 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3825 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3823;
                    float _3827 = 1.0 / _3825;
                    float _3829 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3831 = _3829 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3833 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3835 = _3833 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3837 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3839 = _3837 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3841 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3843 = _3841 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3845 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3847 = _3845 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3849 = _3821 * _3827;
                    float _3851 = precise::clamp(_3849, 0.0, 1.0);
                    float _3853 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3855 = _3853 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3857 = fma(_3851, _3831, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3859 = fma(_3851, _3855, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3861 = fma(_3851, _3835, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3863 = fma(_3851, _3839, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3865 = fma(_3851, _3843, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3867 = fma(_3851, _3847, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3695 = _3859;
                    _3713 = _3865;
                    _3689 = _3857;
                    _3707 = _3863;
                    _3701 = _3861;
                    _3721 = _3867;
                    _3783 = true;
                }
                else
                {
                    _3695 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3713 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3689 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3707 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3701 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3721 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3783 = false;
    float _3869 = _3695;
    float _3871 = _3713;
    float _3873 = _3689;
    float _3875 = _3707;
    float _3877 = _3701;
    float _3879 = _3721;
    float _3881 = fma(_2582, -0.5, 0.5);
    float _3883 = precise::clamp(_3881, 0.0, 1.0);
    float _3885 = -_3869;
    float _3887 = _3885 + _3871;
    float _3889 = -_3873;
    float _3891 = _3889 + _3875;
    float _3893 = -_3877;
    float _3895 = _3893 + _3879;
    bool _3897 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3899 = fma(_3883, _3887, _3869);
    float _3901 = fma(_3883, _3891, _3873);
    float _3903 = fma(_3883, _3895, _3877);
    float _3905 = _3899 * 0.586610972881317138671875;
    out.m_61.x = 1.0;
    float _3907 = fma(_3901, 0.298911988735198974609375, _3905);
    float _3909 = fma(_3903, 0.114477999508380889892578125, _3907);
    out.m_92.x = 0.0;
    float _3911 = -_3909;
    float _3913 = _3901 + _3911;
    float _3915 = -_3909;
    float _3917 = _3899 + _3915;
    float _3919 = -_3909;
    float _3921 = _3903 + _3919;
    float _3923 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3925 = fma(_3913, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3909);
    float _3927 = fma(_3917, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3909);
    float _3929 = fma(_3921, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3909);
    out.m_88.w = _3923;
    out.m_94.x = _3925;
    out.m_94.y = _3927;
    out.m_94.z = _3929;
    if (!_3897)
    {
        return out;
    }
    float _3931 = -_2706;
    float _3933 = _3931 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3935 = -_2708;
    float _3937 = _3935 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3939 = -_2710;
    float _3941 = _3939 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3943 = _3933 * _3933;
    float _3945 = fma(_3937, _3937, _3943);
    float _3947 = fma(_3941, _3941, _3945);
    float _3949 = sqrt(_3947);
    float _3951 = rsqrt(_3947);
    float _3953 = -_3949;
    float _3955 = _3953 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3957 = _3955 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3959 = precise::clamp(_3957, 0.0, 1.0);
    float _3961 = _3937 * _3951;
    float _3963 = _3933 * _3951;
    float _3965 = abs(_3959);
    float _3967 = log2(_3965);
    float _3969 = _3941 * _3951;
    float _3971 = _3961 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3973 = _2582 * _3963;
    float _3975 = -_3963;
    float _3977 = -_3971;
    float _3979 = fma(_3975, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3977);
    float _3981 = fma(_2588, _3961, _3973);
    float _3983 = -_3969;
    float _3985 = fma(_3983, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3979);
    float _3987 = fma(_2604, _3969, _3981);
    float _3989 = precise::clamp(_3987, 0.0, 1.0);
    float _3991 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3993 = _3985 + _3991;
    float _3995 = _3967 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3997 = _3993 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3999 = precise::clamp(_3997, 0.0, 1.0);
    float _4001 = exp2(_3995);
    float _4003 = _4001 * _3999;
    float _4005 = _3989 * _4003;
    float _4007 = _4005 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4009 = _4005 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4011 = _4005 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_92.x = _4007;
    out.m_92.y = _4009;
    out.m_92.z = _4011;
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
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3783 = false;
    bool _2660 = false;
    bool _209 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _108 = in.m_58.w;
    float _110 = trunc(_108);
    int _113 = int(_110);
    bool _117 = _113 >= 1;
    float _119 = 0.0;
    if (!_117)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _119;
    float _123 = _121;
    if (!_117)
    {
        out.m_61.x = 0.0;
    }
    int _125 = 0;
    if (!_117)
    {
        float _127 = _121 * 5.0;
        _125 = as_type<int>(_127);
    }
    int _129 = _125;
    int _131 = _129;
    if (!_117)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4068 = as_type<float>(_129);
        out.gl_Position.z = _4068;
    }
    if (!_117)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _133 = in.m_63.w;
    bool _135 = _133 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _137 = isnan(_133);
    bool _139 = _135 || _137;
    bool _141 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _143 = _139 || _141;
    float _145 = -_133;
    float _147 = _145 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _149 = 0.0;
    float _151 = _147;
    if (_143)
    {
        float _153 = float(_113);
        _149 = _153;
    }
    float _155 = _149;
    bool _157 = _147 >= _155;
    bool _159 = !_143;
    bool _161 = _157 || _159;
    if (_161)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _163 = _123;
    if (_161)
    {
        out.m_61.x = 0.0;
    }
    if (_161)
    {
        float _165 = _163 * 5.0;
        _131 = as_type<int>(_165);
    }
    int _167 = _131;
    if (_161)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4137 = as_type<float>(_167);
        out.gl_Position.z = _4137;
    }
    if (_161)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _169 = as_type<float>(int(gl_VertexIndex));
    bool _171 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _173 = as_type<int>(_169) & 1;
    bool _175 = _173 != 0;
    int _177 = as_type<int>(_169) & 2;
    bool _179 = _177 != 0;
    bool _181 = !_175;
    float _183 = _181 ? (-0.5) : 0.5;
    bool _185 = !_179;
    float _187 = _185 ? (-0.5) : 0.5;
    bool _189 = !_171;
    float _207;
    if (!_189)
    {
        float _191 = in.m_68.x;
        float _193 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _195 = _191 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _197 = fma(_195, (*spvDescriptorSet0.vp_c9)._m0[12].x, _147);
        float _199 = _197 * _193;
        float _201 = floor(_199);
        float _203 = -_201;
        float _205 = _199 + _203;
        _207 = _205;
        _209 = true;
    }
    else
    {
        float _211 = float(_113);
        float _213 = 1.0 / _211;
        float _215 = _147 * _213;
        _207 = _215;
    }
    _209 = false;
    float _217 = _207;
    float _219 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _221 = int(_219);
    float _223 = in.m_68.x;
    float _225 = float(_113);
    float _227 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _229 = _217 + _227;
    float _231 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _233 = _217 + _231;
    float _235 = in.m_68.y;
    float _237 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _239 = int(_237);
    float _241 = in.m_68.z;
    bool _243 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _245 = isnan(_217);
    bool _247 = _243 || _245;
    bool _249 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _251 = _247 || _249;
    float _253 = float(_251);
    float _255 = in.m_68.w;
    float _257 = float(_221);
    float _259 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _261 = int(_259);
    float _263 = -_253;
    float _265 = _263 + 1.0;
    float _267 = float(_239);
    float _269 = 1.0 / _257;
    float _271 = _223 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _273 = _235 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _275 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _277 = int(_275);
    float _279 = float(uint(_261));
    bool _281 = _261 == 0;
    int _283 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _285 = _283 != 0;
    float _287 = 1.0 / _267;
    float _289 = _269 * _147;
    float _291 = float(uint(_277));
    float _293 = 1.0 / _279;
    int _295 = ~_277;
    int _297 = _295 + 1;
    int _299 = ~_277;
    int _301 = _299 + 1;
    float _303 = _287 * _147;
    float _305 = trunc(_289);
    int _307 = int(_305);
    float _309 = 1.0 / _291;
    int _311 = as_type<int>(_293) + (-2);
    float _313 = trunc(_303);
    int _315 = int(_313);
    float _317 = float(uint(_307));
    float _319 = as_type<float>(_311) * _317;
    float _321 = _317;
    int _323 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    if (_285)
    {
        _321 = 1.0;
    }
    float _325 = _321;
    float _327 = 1.0 / _225;
    int _329 = as_type<int>(_309) + (-2);
    int _331 = ~_261;
    int _333 = _331 + 1;
    float _335 = _325;
    if (!_285)
    {
        _335 = 7.345489978790283203125;
    }
    float _337 = _335;
    float _339 = float(uint(_315));
    float _341 = trunc(_319);
    float _343 = precise::max(_341, 0.0);
    uint _346 = uint(_343);
    float _348 = as_type<float>(_329) * _339;
    float _350 = trunc(_348);
    float _352 = precise::max(_350, 0.0);
    uint _354 = uint(_352);
    int _356 = _333 * int(_346);
    int _358 = _356 + _307;
    float _360 = _337 * _223;
    float _362 = float(uint(_358));
    float _364 = floor(_360);
    int _366 = _297 * int(_354);
    int _368 = _366 + _315;
    float _370 = float(uint(_368));
    float _372 = as_type<float>(_311) * _362;
    float _374 = _362;
    float _376 = _370;
    if (_285)
    {
        _374 = 1.0;
    }
    float _378 = _374;
    float _380 = _378;
    if (!_285)
    {
        _380 = 1.2345600128173828125;
    }
    float _382 = _380;
    float _384 = trunc(_372);
    float _386 = precise::max(_384, 0.0);
    uint _388 = uint(_386);
    float _390 = as_type<float>(_329) * _370;
    if (_285)
    {
        _376 = _223;
    }
    float _392 = _376;
    float _394 = _392;
    if (!_285)
    {
        _394 = _235;
    }
    float _396 = _394;
    float _398 = -_364;
    float _400 = _360 + _398;
    int _402 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _404 = _402 != 0;
    float _406 = trunc(_390);
    float _408 = precise::max(_406, 0.0);
    uint _410 = uint(_408);
    float _412 = _396 * _382;
    int _414 = ~_261;
    int _416 = _414 + 1;
    float _418 = float(_261);
    float _420 = float(_307);
    int _422 = int(_346) + int(_388);
    float _424 = floor(_412);
    bool _426 = _420 >= _418;
    bool _428 = isnan(_420);
    bool _430 = _426 || _428;
    bool _432 = isnan(_418);
    bool _434 = _430 || _432;
    float _436 = float(_434);
    float _438 = _400 * _418;
    int _440 = _416 * _422;
    int _442 = _440 + _307;
    int _444 = int(_354) + int(_410);
    float _446 = trunc(_436);
    int _448 = int(_446);
    bool _450 = uint(_442) >= uint(_261);
    int _452 = _301 * _444;
    int _454 = _452 + _315;
    bool _456 = !_404;
    int _458 = _456 ? 0 : 1;
    bool _460 = !_450;
    int _462 = _460 ? 0 : (-1);
    float _464 = trunc(_438);
    int _466 = int(_464);
    float _468 = -_424;
    float _470 = _412 + _468;
    int _472 = abs(_458);
    int _474 = ~_422;
    int _476 = _474 + _462;
    int _478 = _476 + 1;
    bool _480 = uint(_454) >= uint(_277);
    float _482 = _327 * _147;
    int _484 = _261 * _478;
    int _486 = _484 + _307;
    int _488 = ~_448;
    int _490 = _488 + 1;
    int _492 = _490 + 1;
    float _494 = _418 * _482;
    int _496 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _498 = _496 != 0;
    int _500 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _502 = _500 != 0;
    int _504 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _506 = _504 != 0;
    bool _508 = !_281;
    int _510 = _508 ? _486 : (-1);
    bool _512 = !_480;
    int _514 = _512 ? 0 : (-1);
    int _516 = _466 * _472;
    int _518 = _516 + _307;
    float _520 = float(_277);
    int _522 = _510 * _492;
    bool _524 = !_502;
    int _526 = _524 ? 0 : 1;
    float _528 = trunc(_494);
    int _530 = int(_528);
    float _532 = float(_315);
    int _534 = ~_444;
    int _536 = _534 + _514;
    int _538 = _536 + 1;
    int _540 = _261 + (-1);
    int _542 = abs(_526);
    int _544 = _277 * _538;
    int _546 = _544 + _315;
    bool _548 = _532 >= _520;
    bool _550 = isnan(_532);
    bool _552 = _548 || _550;
    bool _554 = isnan(_520);
    bool _556 = _552 || _554;
    float _558 = float(_556);
    int _560 = _448 * _540;
    int _562 = _560 + _522;
    bool _564 = !_506;
    int _566 = _564 ? 0 : 1;
    bool _568 = !_498;
    int _570 = _568 ? 0 : 1;
    int _572 = _562 * _542;
    int _574 = abs(_566);
    float _576 = trunc(_558);
    int _578 = int(_576);
    float _580 = _470 * _520;
    int _582 = abs(_570);
    float _584 = _520 * _482;
    int _586 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _588 = _586 != 0;
    int _590 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _592 = _590 != 0;
    int _594 = _530 * _582;
    int _596 = _594 + _572;
    float _598 = trunc(_580);
    int _600 = int(_598);
    bool _602 = !_588;
    int _604 = _602 ? 0 : 1;
    bool _606 = !_592;
    int _608 = _606 ? 0 : 1;
    int _610 = _518 * _574;
    int _612 = _610 + _596;
    bool _614 = _277 == 0;
    int _616 = abs(_604);
    float _618 = trunc(_584);
    int _620 = int(_618);
    int _622 = abs(_608);
    int _624 = ~_578;
    int _626 = _624 + 1;
    int _628 = _626 + 1;
    bool _630 = !_614;
    int _632 = _630 ? _546 : (-1);
    int _634 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _636 = _634 != 0;
    int _638 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _640 = _638 != 0;
    int _642 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _644 = _642 != 0;
    int _646 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _648 = _646 != 0;
    int _650 = _600 * _616;
    int _652 = _650 + _315;
    int _654 = _277 + (-1);
    int _656 = _632 * _628;
    bool _658 = _261 == 0;
    int _660 = _466 * _622;
    int _662 = _660 + _612;
    bool _664 = !_640;
    int _666 = _664 ? 0 : 1;
    int _668 = _578 * _654;
    int _670 = _668 + _656;
    bool _672 = !_636;
    int _674 = _672 ? 0 : 1;
    float _676 = float(uint(_662));
    int _678 = abs(_666);
    bool _680 = !_644;
    int _682 = _680 ? 0 : 1;
    float _684 = as_type<float>(_311) * _676;
    int _686 = abs(_674);
    bool _688 = !_648;
    int _690 = _688 ? 0 : 1;
    int _692 = abs(_682);
    int _694 = _670 * _678;
    int _696 = abs(_690);
    float _698 = trunc(_684);
    float _700 = precise::max(_698, 0.0);
    uint _702 = uint(_700);
    int _704 = _620 * _686;
    int _706 = _704 + _694;
    float _708 = float(uint(_518));
    int _710 = _652 * _692;
    int _712 = _710 + _706;
    int _714 = ~_261;
    int _716 = _714 + 1;
    int _718 = ~_277;
    int _720 = _718 + 1;
    int _722 = _600 * _696;
    int _724 = _722 + _712;
    float _726 = as_type<float>(_311) * _708;
    float _728 = float(uint(_652));
    float _730 = float(uint(_724));
    int _732 = _716 * int(_702);
    int _734 = _732 + _662;
    int _736 = ~_261;
    int _738 = _736 + 1;
    float _740 = as_type<float>(_329) * _728;
    int _742 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _744 = _742 != 0;
    float _746 = as_type<float>(_329) * _730;
    float _748 = float(uint(_734));
    float _750 = trunc(_726);
    float _752 = precise::max(_750, 0.0);
    uint _754 = uint(_752);
    int _756 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _758 = _756 != 0;
    float _760 = as_type<float>(_311) * _748;
    bool _762 = !_758;
    int _764 = _762 ? 0 : 1;
    float _766 = trunc(_746);
    float _768 = precise::max(_766, 0.0);
    uint _770 = uint(_768);
    float _772 = as_type<float>(_518);
    if (_744)
    {
        _323 = 0;
    }
    int _774 = _323;
    int _776 = _774;
    if (!_744)
    {
        _776 = 1;
    }
    int _778 = _776;
    float _780 = trunc(_760);
    float _782 = precise::max(_780, 0.0);
    uint _784 = uint(_782);
    int _786 = ~_261;
    int _788 = _786 + 1;
    int _790 = _788 * int(_754);
    int _792 = _790 + _518;
    int _794 = _720 * int(_770);
    int _796 = _794 + _724;
    float _798 = trunc(_740);
    float _800 = precise::max(_798, 0.0);
    uint _802 = uint(_800);
    float _804 = float(uint(_792));
    float _806 = float(uint(_796));
    int _808 = ~_277;
    int _810 = _808 + 1;
    float _812 = as_type<float>(_311) * _804;
    int _814 = int(_702) + int(_784);
    float _816 = as_type<float>(_329) * _806;
    float _818 = trunc(_816);
    float _820 = precise::max(_818, 0.0);
    uint _822 = uint(_820);
    int _824 = _738 * _814;
    int _826 = _824 + _662;
    int _828 = _810 * int(_802);
    int _830 = _828 + _652;
    bool _832 = uint(_826) >= uint(_261);
    float _834 = trunc(_812);
    float _836 = precise::max(_834, 0.0);
    uint _838 = uint(_836);
    float _840 = float(uint(_830));
    bool _842 = !_832;
    int _844 = _842 ? 0 : (-1);
    int _846 = ~_814;
    int _848 = _846 + _844;
    int _850 = _848 + 1;
    int _852 = ~_277;
    int _854 = _852 + 1;
    int _856 = int(_770) + int(_822);
    int _858 = _261 * _850;
    int _860 = _858 + _662;
    float _862 = as_type<float>(_329) * _840;
    int _864 = _854 * _856;
    int _866 = _864 + _724;
    bool _868 = !_658;
    int _870 = _868 ? _860 : (-1);
    int _872 = int(_754) + int(_838);
    int _874 = _870 & 3;
    bool _876 = _874 != 0;
    float _878 = trunc(_862);
    float _880 = precise::max(_878, 0.0);
    uint _882 = uint(_880);
    bool _884 = uint(_866) >= uint(_277);
    bool _886 = uint(_874) >= 2u;
    bool _888 = !_884;
    int _890 = _888 ? 0 : (-1);
    int _892 = _886 ? 0 : 1;
    bool _894 = _874 != 3;
    int _896 = _870 & 3;
    bool _898 = _896 != 0;
    int _900 = ~_856;
    int _902 = _900 + _890;
    int _904 = _902 + 1;
    int _906 = _898 ? 0 : 1;
    int _908 = ~_261;
    int _910 = _908 + 1;
    int _912 = _277 * _904;
    int _914 = _912 + _724;
    bool _916 = uint(_874) > 1u;
    int _918 = ~_892;
    int _920 = _918 + 1;
    int _922 = _920 + 1;
    int _924 = _910 * _872;
    int _926 = _924 + _518;
    int _928 = _922;
    if (_894)
    {
        int _930 = ~_892;
        int _932 = _930 + 1;
        _928 = _932;
    }
    int _934 = _928;
    float _936 = _223 * 2.0;
    bool _938 = _277 == 0;
    float _940 = _235 * 2.0;
    int _942 = int(_802) + int(_882);
    bool _944 = !_938;
    int _946 = _944 ? _914 : (-1);
    float _948 = floor(_940);
    bool _950 = uint(_926) >= uint(_261);
    int _952 = _946 & 3;
    bool _954 = _952 != 0;
    int _956 = ~_906;
    int _958 = _956 + 1;
    int _960 = _958 + 1;
    int _962 = _960;
    float _964 = _940;
    if (!_916)
    {
        int _966 = ~_906;
        int _968 = _966 + 1;
        _962 = _968;
    }
    int _970 = _962;
    float _972 = floor(_936);
    int _974 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _976 = _974 != 0;
    bool _978 = !_950;
    int _980 = _978 ? 0 : (-1);
    bool _982 = uint(_952) > 1u;
    bool _984 = !_976;
    int _986 = _984 ? 0 : 1;
    int _988 = ~_277;
    int _990 = _988 + 1;
    int _992 = _946 & 3;
    bool _994 = _992 != 0;
    bool _996 = _952 != 3;
    int _998 = _990 * _942;
    int _1000 = _998 + _652;
    int _1002 = _994 ? 0 : 1;
    bool _1004 = uint(_952) >= 2u;
    int _1006 = ~_1002;
    int _1008 = _1006 + 1;
    int _1010 = _1008 + 1;
    int _1012 = _1010;
    if (!_982)
    {
        int _1014 = ~_1002;
        int _1016 = _1014 + 1;
        _1012 = _1016;
    }
    int _1018 = _1012;
    bool _1020 = uint(_1000) >= uint(_277);
    float _1022 = _1004 ? 0.0 : 1.4012984643248170709237295832899e-45;
    bool _1024 = _778 != 1;
    bool _1026 = !_1020;
    int _1028 = _1026 ? 0 : (-1);
    bool _1030 = _972 > 0.0;
    int _1032 = ~as_type<int>(_1022);
    int _1034 = _1032 + 1;
    int _1036 = _1034 + 1;
    int _1038 = ~_872;
    int _1040 = _1038 + _980;
    int _1042 = _1040 + 1;
    int _1044 = _1036;
    float _1046 = _972;
    float _1048 = _1022;
    if (_996)
    {
        int _1050 = ~as_type<int>(_1022);
        int _1052 = _1050 + 1;
        _1044 = _1052;
    }
    int _1054 = _1044;
    bool _1056 = _972 >= 0.0;
    bool _1058 = isnan(_972);
    bool _1060 = _1056 || _1058;
    bool _1062 = isnan(0.0);
    bool _1064 = _1060 || _1062;
    int _1066 = _261 * _1042;
    int _1068 = _1066 + _518;
    if (!_1024)
    {
        _772 = _235;
    }
    float _1070 = _772;
    int _1072 = _1064 ? 0 : 1;
    float _1074 = _1070;
    if (!_1024)
    {
        _1046 = _235;
    }
    float _1076 = _1046;
    float _1078 = _1076;
    if (!_1024)
    {
        _1048 = _241;
    }
    float _1080 = _1048;
    float _1082 = _1080;
    if (!_1024)
    {
        _964 = _241;
    }
    float _1084 = _964;
    int _1086 = ~_1072;
    int _1088 = _1086 + 1;
    int _1090 = _1088 + 1;
    float _1092 = _1084;
    int _1094 = _1090;
    if (_1024)
    {
        _1074 = _223;
    }
    float _1096 = _1074;
    if (_1024)
    {
        _1078 = _223;
    }
    float _1098 = _1078;
    if (_1024)
    {
        _1082 = _235;
    }
    float _1100 = _1082;
    if (_1024)
    {
        _1092 = _235;
    }
    float _1102 = _1092;
    if (!_1030)
    {
        int _1104 = ~_1072;
        int _1106 = _1104 + 1;
        _1094 = _1106;
    }
    int _1108 = _1094;
    float _1110 = _1100 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _1112 = !_876;
    int _1114 = _1112 ? 0 : 1;
    bool _1116 = !_954;
    int _1118 = _1116 ? 0 : 1;
    int _1120 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1122 = _1120 != 0;
    int _1124 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1126 = _1124 != 0;
    int _1128 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1130 = _1128 != 0;
    bool _1132 = _874 != 3;
    float _1134 = in.m_58.x;
    float _1136 = in.m_58.y;
    float _1138 = in.m_58.z;
    float _1140 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1142 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _1140;
    float _1144 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1146 = _1144 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1148 = _948 > 0.0;
    bool _1150 = _948 >= 0.0;
    bool _1152 = isnan(_948);
    bool _1154 = _1150 || _1152;
    bool _1156 = isnan(0.0);
    bool _1158 = _1154 || _1156;
    float _1160 = 1.0 / _1146;
    bool _1162 = !_658;
    int _1164 = _1162 ? _1068 : (-1);
    int _1166 = _1158 ? 0 : 1;
    bool _1168 = _952 != 3;
    int _1170 = ~_1166;
    int _1172 = _1170 + 1;
    int _1174 = _1172 + 1;
    float _1176 = 1.0 / _1142;
    bool _1178 = !_1168;
    int _1180 = _1178 ? 0 : (-1);
    int _1182 = _1174;
    if (!_1148)
    {
        int _1184 = ~_1166;
        int _1186 = _1184 + 1;
        _1182 = _1186;
    }
    int _1188 = _1182;
    int _1190 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1192 = _1190 != 0;
    int _1194 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1196 = _1194 != 0;
    int _1198 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1200 = _1198 != 0;
    float _1202 = _229 * _1160;
    float _1204 = _241 * 2.0;
    bool _1206 = !_1196;
    int _1208 = _1206 ? 0 : 1;
    float _1210 = _1136 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _1212 = _255 > 0.5;
    float _1214 = _1136 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1216 = _1136 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1218 = floor(_1204);
    float _1220 = fma(_1134, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1210);
    float _1222 = fma(_1134, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1214);
    float _1224 = fma(_1134, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1216);
    float _1226 = _223 + _235;
    float _1228 = _223 + _241;
    float _1230 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1232 = _233 * _1176;
    float _1234 = _241 + _235;
    float _1236 = _1226 + (-1.0);
    float _1238 = _1228 + (-1.0);
    bool _1240 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1242 = isnan(_217);
    bool _1244 = _1240 || _1242;
    bool _1246 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _1248 = _1244 || _1246;
    float _1250 = float(_1248);
    float _1252 = -_1230;
    float _1254 = fma(_271, 2.0, _1252);
    float _1256 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1258 = _1234 + (-1.0);
    float _1260 = fma(_1236, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1262 = fma(_1238, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1264 = -_1250;
    float _1266 = _1264 + 1.0;
    float _1268 = fma(_273, -2.0, _1256);
    float _1270 = fma(_1258, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1272 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1274 = isnan(_217);
    bool _1276 = _1272 || _1274;
    bool _1278 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1280 = _1276 || _1278;
    float _1282 = float(_1280);
    float _1284 = _253 * _1266;
    bool _1286 = !_1192;
    int _1288 = _1286 ? 0 : 1;
    float _1290 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1292 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1290;
    float _1294 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1296 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1294;
    bool _1298 = _1218 >= 0.0;
    bool _1300 = isnan(_1218);
    bool _1302 = _1298 || _1300;
    bool _1304 = isnan(0.0);
    bool _1306 = _1302 || _1304;
    float _1308 = _1282 * _265;
    float _1310 = fma(_1292, _1232, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _1312 = fma(_1296, _1232, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    int _1314 = _1306 ? 0 : 1;
    float _1316 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1318 = _1316 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _1320 = _1218 > 0.0;
    float _1322 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1324 = log2(_1322);
    float _1326 = _1310 * _1308;
    float _1328 = _1312 * _1308;
    float _1330 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1332 = _1330 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1334 = -_1282;
    float _1336 = _1334 + 1.0;
    bool _1338 = !_1132;
    int _1340 = _1338 ? 0 : (-1);
    float _1342 = fma(_1318, _1202, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    int _1344 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1346 = _1344 != 0;
    float _1348 = fma(_1332, _1202, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _1350 = !_1200;
    int _1352 = _1350 ? 0 : 1;
    float _1354 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _1356 = ~_1314;
    int _1358 = _1356 + 1;
    int _1360 = _1358 + 1;
    float _1362 = fma(_1336, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1326);
    int _1364 = _1360;
    if (!_1320)
    {
        int _1366 = ~_1314;
        int _1368 = _1366 + 1;
        _1364 = _1368;
    }
    int _1370 = _1364;
    float _1372 = fma(_1098, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1354);
    float _1374 = fma(_1336, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1328);
    float _1376 = fma(_1342, _1284, _1362);
    int _1378 = abs(_1352);
    float _1380 = _1324 * _147;
    float _1382 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _1384 = abs(_1208);
    float _1386 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1388 = float(_1108);
    float _1390 = exp2(_1380);
    float _1392 = float(_1188);
    float _1394 = _1096 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1396 = float(_1378);
    float _1398 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1400 = float(_1384);
    float _1402 = fma(_1110, -2.0, _1382);
    bool _1404 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1406 = isnan(0.0);
    bool _1408 = _1404 || _1406;
    bool _1410 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1412 = _1408 || _1410;
    float _1414 = -_1398;
    float _1416 = fma(_1394, 2.0, _1414);
    float _1418 = _1396 * _1392;
    int _1420 = abs(_1288);
    float _1422 = _1400 * _1388;
    float _1424 = in.m_70.x;
    float _1426 = in.m_70.y;
    float _1428 = in.m_70.z;
    float _1430 = fma(_1102, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1386);
    float _1432 = float(_1420);
    float _1434 = -_1390;
    float _1436 = _1434 + 1.0;
    float _1438 = float(_1370);
    float _1440 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1442 = 1.0 + _1440;
    float _1444 = _1422 * (-2.0);
    float _1446 = _1432 * _1438;
    float _1448 = _1412 ? _1436 : 0.0;
    float _1450 = 1.0 / _1442;
    bool _1452 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1454 = isnan(1.0);
    bool _1456 = _1452 || _1454;
    bool _1458 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1460 = _1456 || _1458;
    float _1462 = -_147;
    float _1464 = fma(_1462, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1254);
    float _1466 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1468 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1470 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1430);
    float _1472 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1372);
    float _1474 = fma(_1270, _1444, _1270);
    float _1476 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1402);
    float _1478 = _1446 * (-2.0);
    int _1480 = ~_942;
    int _1482 = _1480 + _1028;
    int _1484 = _1482 + 1;
    float _1486 = _1418 * (-2.0);
    float _1488 = fma(_223, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1466);
    float _1490 = fma(_235, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1468);
    float _1492 = fma(_1444, _1426, _1426);
    float _1494 = fma(_1260, _1478, _1260);
    float _1496 = fma(_1478, _1424, _1424);
    float _1498 = fma(_1262, _1486, _1262);
    float _1500 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1488);
    int _1502 = _277 * _1484;
    int _1504 = _1502 + _652;
    float _1506 = in.m_72.x;
    float _1508 = in.m_72.y;
    float _1510 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1268);
    float _1512 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1490);
    float _1514 = -_147;
    float _1516 = fma(_1514, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1416);
    float _1518 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    if (_1460)
    {
        float _1520 = _1448 * _1450;
        _151 = _1520;
    }
    float _1522 = _151;
    bool _1524 = _277 == 0;
    float _1526 = _223 + (-0.5);
    bool _1528 = _235 > 0.5;
    float _1530 = _1518 * _223;
    bool _1532 = !_1524;
    int _1534 = _1532 ? _1504 : (-1);
    float _1536 = fma(_1486, _1428, _1428);
    bool _1538 = _223 > 0.5;
    float _1540 = _235 + (-0.5);
    float _1542 = -_187;
    int _1544 = _1528 ? as_type<int>(_1542) : as_type<int>(_187);
    float _1546 = fma(_1526, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1496);
    bool _1548 = _241 > 0.5;
    float _1550 = _241 + (-0.5);
    float _1552 = fma(_1540, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1492);
    float _1554 = fma(_1550, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1536);
    float _1556 = fma(_1494, _1522, _1546);
    float _1558 = fma(_1348, _1284, _1374);
    float _1560 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1562 = fma(_1498, _1522, _1554);
    float _1564 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1566 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1568 = fma(_1250, (*spvDescriptorSet0.vp_c9)._m0[145].x, _1376);
    float _1570 = fma(_1474, _1522, _1552);
    float _1572 = _1560 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1574 = _1556 * 0.15915493667125701904296875;
    float _1576 = _1564 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1578 = _1566 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1580 = _1562 * 0.15915493667125701904296875;
    float _1582 = _1568 * _1506;
    float _1584 = _1570 * 0.15915493667125701904296875;
    float _1586 = fma(_1250, (*spvDescriptorSet0.vp_c9)._m0[145].y, _1558);
    float _1588 = fma(_1138, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1220);
    float _1590 = fma(_1138, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1222);
    float _1592 = fma(_1138, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1224);
    float _1594 = _1580 * 6.283185482025146484375;
    float _1596 = cos(_1594);
    float _1598 = _1582 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    out.m_74.x = _1572;
    out.m_74.y = _1576;
    out.m_74.z = _1578;
    int _1600 = _870 >> 31;
    float _1602 = _1586 * _1508;
    float _1604 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _183);
    int _1606 = abs(_1018);
    float _1608 = _1590 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1610 = _1574 * 6.283185482025146484375;
    float _1612 = cos(_1610);
    float _1614 = _1598 * _1604;
    float _1616 = _1602 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _1618 = abs(_1118);
    int _1620 = ~_1606;
    int _1622 = _1620 + 1;
    int _1624 = _1622 + 1;
    int _1626 = _946 >> 31;
    float _1628 = _1584 * 6.283185482025146484375;
    float _1630 = sin(_1628);
    int _1632 = _1600 & 3;
    int _1634 = _1626 & 3;
    float _1636 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _187);
    int _1638 = _870 + _1632;
    int _1640 = _946 + _1634;
    float _1642 = _1584 * 6.283185482025146484375;
    float _1644 = cos(_1642);
    float _1646 = _1616 * _1636;
    int _1648 = _1638 >> 2;
    float _1650 = _1612 * _1596;
    int _1652 = _1640 >> 2;
    int _1654 = _1648 << 4;
    int _1656 = _1654 + 368;
    float _1658 = _1650 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1660 = _1574 * 6.283185482025146484375;
    float _1662 = sin(_1660);
    float _1664 = _1612 * _1630;
    float _1666 = _1650 * _1646;
    float _1668 = _1650 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _1670 = abs(_1180);
    bool _1672 = !_1122;
    float _1674 = _1672 ? _187 : as_type<float>(_1544);
    float _1676 = _1580 * 6.283185482025146484375;
    float _1678 = sin(_1676);
    float _1680 = _1644 * _1596;
    float _1682 = _1662 * _1630;
    float _1684 = _1662 * _1644;
    float _1686 = _1662 * _1596;
    int _1688 = _1652 << 4;
    int _1690 = _1688 + 512;
    float _1692 = _1612 * _1644;
    uint _1694 = uint(int(uint(_1656) >> uint(2)));
    uint _1696 = uint(int(uint(int(_1694)) >> uint(2)));
    int _1698 = int(_1694) & 3;
    float _1700 = (*spvDescriptorSet0.vp_c9)._m0[int(_1696)][_1698];
    int _1702 = int(_1694) + 1;
    uint _1704 = uint(int(uint(_1702) >> uint(2)));
    int _1706 = _1702 & 3;
    float _1708 = (*spvDescriptorSet0.vp_c9)._m0[int(_1704)][_1706];
    float _1710 = _1630 * _1596;
    float _1712 = _1650 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1714 = fma(_1678, _1692, _1682);
    float _1716 = fma(_1678, _1682, _1692);
    float _1718 = -_1678;
    float _1720 = fma(_1718, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1658);
    float _1722 = -_1646;
    float _1724 = _1678 * _1722;
    float _1726 = _1686 * _1646;
    uint _1728 = uint(int(uint(_1690) >> uint(2)));
    uint _1730 = uint(int(uint(int(_1728)) >> uint(2)));
    int _1732 = int(_1728) & 3;
    float _1734 = (*spvDescriptorSet0.vp_c9)._m0[int(_1730)][_1732];
    int _1736 = int(_1728) + 1;
    uint _1738 = uint(int(uint(_1736) >> uint(2)));
    int _1740 = _1736 & 3;
    float _1742 = (*spvDescriptorSet0.vp_c9)._m0[int(_1738)][_1740];
    float _1744 = -_1664;
    float _1746 = fma(_1678, _1684, _1744);
    float _1748 = fma(_1680, _1614, _1724);
    float _1750 = fma(_1714, _1614, _1666);
    float _1752 = -_1684;
    float _1754 = fma(_1678, _1664, _1752);
    float _1756 = fma(_1746, _1614, _1726);
    float _1758 = -_1678;
    float _1760 = fma(_1758, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1712);
    float _1762 = -_1678;
    float _1764 = fma(_1762, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1668);
    int _1766 = _1690 + 8;
    uint _1768 = uint(int(uint(_1766) >> uint(2)));
    uint _1770 = uint(int(uint(int(_1768)) >> uint(2)));
    int _1772 = int(_1768) & 3;
    float _1774 = (*spvDescriptorSet0.vp_c9)._m0[int(_1770)][_1772];
    int _1776 = int(_1768) + 1;
    uint _1778 = uint(int(uint(_1776) >> uint(2)));
    int _1780 = _1776 & 3;
    float _1782 = (*spvDescriptorSet0.vp_c9)._m0[int(_1778)][_1780];
    float _1784 = _1714 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1786 = _1714 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1788 = _1714 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1790 = fma(_1686, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1720);
    float _1792 = fma(_1686, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1760);
    float _1794 = fma(_1680, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1784);
    float _1796 = fma(_1680, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1786);
    int _1798 = _1656 + 8;
    uint _1800 = uint(int(uint(_1798) >> uint(2)));
    uint _1802 = uint(int(uint(int(_1800)) >> uint(2)));
    int _1804 = int(_1800) & 3;
    float _1806 = (*spvDescriptorSet0.vp_c9)._m0[int(_1802)][_1804];
    int _1808 = int(_1800) + 1;
    uint _1810 = uint(int(uint(_1808) >> uint(2)));
    int _1812 = _1808 & 3;
    float _1814 = (*spvDescriptorSet0.vp_c9)._m0[int(_1810)][_1812];
    float _1816 = fma(_1680, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1788);
    int _1818 = abs(_970);
    float _1820 = _1754 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1822 = _1754 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1824 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1826 = int(_1824);
    float _1828 = fma(_1710, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1820);
    int _1830 = abs(_1114);
    float _1832 = fma(_1710, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1822);
    int _1834 = ~_1818;
    int _1836 = _1834 + 1;
    int _1838 = _1836 + 1;
    float _1840 = fma(_1686, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1764);
    int _1842 = abs(_934);
    float _1844 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    int _1846 = ~_1830;
    int _1848 = _1846 + 1;
    int _1850 = _1848 + 1;
    float _1852 = fma(_1710, _1844, _1748);
    int _1854 = abs(_1054);
    float _1856 = fma(_1716, _1844, _1756);
    int _1858 = ~_1618;
    int _1860 = _1858 + 1;
    int _1862 = _1860 + 1;
    float _1864 = _1754 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _1866 = _1838 * as_type<int>(_1708);
    float _1868 = float(uint(_1826));
    float _1870 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _1872 = int(_1870);
    int _1874 = ~_1842;
    int _1876 = _1874 + 1;
    int _1878 = _1876 + 1;
    int _1880 = _1850 * as_type<int>(_1700);
    int _1882 = _1880 + _1866;
    int _1884 = ~_1854;
    int _1886 = _1884 + 1;
    int _1888 = _1886 + 1;
    float _1890 = fma(_1710, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1864);
    int _1892 = ~_1826;
    int _1894 = _1892 + 1;
    int _1896 = _1624 * as_type<int>(_1742);
    float _1898 = 1.0 / _1868;
    int _1900 = _1862 * as_type<int>(_1734);
    int _1902 = _1900 + _1896;
    int _1904 = abs(_1826);
    int _1906 = _1888 * as_type<int>(_1774);
    int _1908 = _1906 + _1902;
    int _1910 = abs(_986);
    int _1912 = abs(_1340);
    int _1914 = abs(_764);
    int _1916 = _1878 * as_type<int>(_1806);
    int _1918 = _1916 + _1882;
    float _1920 = float(uint(_1872));
    float _1922 = fma(_1716, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1828);
    float _1924 = float(uint(_1904));
    int _1926 = ~_1670;
    int _1928 = _1926 + 1;
    int _1930 = _1928 + 1;
    float _1932 = 1.0 / _1920;
    int _1934 = ~_1912;
    int _1936 = _1934 + 1;
    int _1938 = _1936 + 1;
    int _1940 = abs(_1872);
    int _1942 = _1930 * as_type<int>(_1782);
    int _1944 = _1942 + _1908;
    int _1946 = ~_1914;
    int _1948 = _1946 + 1;
    int _1950 = _1948 + 1;
    int _1952 = _1938 * as_type<int>(_1814);
    int _1954 = _1952 + _1918;
    float _1956 = float(uint(_1940));
    float _1958 = 1.0 / _1924;
    int _1960 = ~_1910;
    int _1962 = _1960 + 1;
    int _1964 = _1962 + 1;
    int _1966 = _1944 * _1950;
    float _1968 = fma(_1716, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1832);
    float _1970 = _1592 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1972 = ~_1940;
    int _1974 = _1972 + 1;
    int _1976 = _1954 * _1964;
    float _1978 = fma(_1754, _1844, _1750);
    float _1980 = 1.0 / _1956;
    int _1982 = _1534 * _1914;
    int _1984 = _1982 + _1966;
    int _1986 = as_type<int>(_1932) + (-2);
    float _1988 = _1978 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _1990 = _1164 * _1910;
    int _1992 = _1990 + _1976;
    int _1994 = as_type<int>(_1898) + (-2);
    float _1996 = _1978 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1998 = fma(_1852, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1988);
    int _2000 = abs(_1984);
    float _2002 = _1588 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2004 = float(uint(_1992));
    float _2006 = fma(_1852, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1996);
    int _2008 = as_type<int>(_1958) + (-2);
    float _2010 = fma(_1856, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1998);
    float _2012 = as_type<float>(_1994) * _2004;
    int _2014 = abs(_1992);
    float _2016 = fma(_1856, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2006);
    float _2018 = float(uint(_1984));
    float _2020 = trunc(_2012);
    float _2022 = precise::max(_2020, 0.0);
    uint _2024 = uint(_2022);
    int _2026 = as_type<int>(_1980) + (-2);
    float _2028 = _2010 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2030 = float(uint(_2000));
    float _2032 = as_type<float>(_1986) * _2018;
    float _2034 = float(uint(_2014));
    float _2036 = fma(_1716, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1890);
    int _2038 = ~_1872;
    int _2040 = _2038 + 1;
    float _2042 = as_type<float>(_2026) * _2030;
    float _2044 = _2016 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2046 = as_type<float>(_2008) * _2034;
    float _2048 = trunc(_2032);
    float _2050 = precise::max(_2048, 0.0);
    uint _2052 = uint(_2050);
    float _2054 = _1970 + _2028;
    float _2056 = _2002 + _2044;
    int _2058 = ~_1904;
    int _2060 = _2058 + 1;
    float _2062 = _1978 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2064 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2066 = _2054 + _2064;
    float _2068 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2070 = _2056 + _2068;
    int _2072 = _1894 * int(_2024);
    int _2074 = _2072 + _1992;
    float _2076 = trunc(_2046);
    float _2078 = precise::max(_2076, 0.0);
    uint _2080 = uint(_2078);
    float _2082 = _2066 * _2066;
    float _2084 = _2070 * _2070;
    float _2086 = fma(_1852, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2062);
    float _2088 = float(uint(_2074));
    float _2090 = _2084 + _2082;
    float _2092 = -_183;
    int _2094 = _1538 ? as_type<int>(_2092) : as_type<int>(_183);
    float _2096 = trunc(_2042);
    float _2098 = precise::max(_2096, 0.0);
    uint _2100 = uint(_2098);
    int _2102 = _2040 * int(_2052);
    int _2104 = _2102 + _1984;
    float _2106 = as_type<float>(_1994) * _2088;
    bool _2108 = !_1346;
    float _2110 = _2108 ? _183 : as_type<float>(_2094);
    float _2112 = float(uint(_2104));
    float _2114 = sqrt(_2090);
    int _2116 = _2060 * int(_2080);
    int _2118 = _2116 + _2014;
    float _2120 = as_type<float>(_1986) * _2112;
    float _2122 = -_187;
    int _2124 = _1212 ? as_type<int>(_2122) : as_type<int>(_187);
    float _2126 = float(uint(_2118));
    float _2128 = fma(_1856, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2086);
    int _2130 = _1974 * int(_2100);
    int _2132 = _2130 + _2000;
    float _2134 = _187 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2136 = trunc(_2106);
    float _2138 = precise::max(_2136, 0.0);
    uint _2140 = uint(_2138);
    float _2142 = as_type<float>(_2008) * _2126;
    float _2144 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1794);
    float _2146 = float(uint(_2132));
    float _2148 = _2128 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2150 = _2134 * _1792;
    bool _2152 = _2114 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2154 = _2134 * _1840;
    float _2156 = as_type<float>(_2026) * _2146;
    float _2158 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1796);
    float _2160 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1816);
    bool _2162 = !_1130;
    float _2164 = _2162 ? _187 : as_type<float>(_2124);
    float _2166 = trunc(_2142);
    float _2168 = precise::max(_2166, 0.0);
    uint _2170 = uint(_2168);
    float _2172 = -_183;
    int _2174 = _1548 ? as_type<int>(_2172) : as_type<int>(_183);
    float _2176 = _183 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _2178 = !_1126;
    float _2180 = _2178 ? _183 : as_type<float>(_2174);
    float _2182 = _2134 * _1790;
    float _2184 = fma(_2176, _2158, _2150);
    float _2186 = trunc(_2156);
    float _2188 = precise::max(_2186, 0.0);
    uint _2190 = uint(_2188);
    float _2192 = trunc(_2120);
    float _2194 = precise::max(_2192, 0.0);
    uint _2196 = uint(_2194);
    float _2198 = fma(_2176, _2144, _2182);
    float _2200 = _1608 + _2148;
    float _2202 = _2148;
    float _2204 = _2084;
    float _2206 = _2082;
    float _2208 = _2056;
    float _2210 = _2054;
    if (!_2152)
    {
        _2202 = _2084;
    }
    float _2212 = _2202;
    float _2214 = fma(_2176, _2160, _2154);
    float _2216 = _2212;
    if (!_2152)
    {
        _2204 = _2200;
    }
    float _2218 = _2204;
    bool _2220 = !_2152;
    float _2222 = _2218;
    if (!_2220)
    {
        float _2224 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2226 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2228 = _2114 + _2226;
        float _2230 = rsqrt(_2090);
        float _2232 = _2228 * _2224;
        float _2234 = _2200 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2236 = _2232 * 0.15915493667125701904296875;
        float _2238 = _2236 * 6.283185482025146484375;
        float _2240 = sin(_2238);
        float _2242 = _2236 * 6.283185482025146484375;
        float _2244 = cos(_2242);
        float _2246 = fma(_2240, _2234, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2248 = _2230 * _2246;
        float _2250 = _2244 + (-1.0);
        float _2252 = fma(_2070, _2248, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2254 = fma(_2066, _2248, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2256 = _2250 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2258 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2260 = _2252 + _2258;
        float _2262 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2264 = _2254 + _2262;
        float _2266 = fma(_2200, _2244, _2256);
        float _2268 = _2260 * _2260;
        float _2270 = _2264 * _2264;
        _2222 = _2266;
        _2216 = _2268;
        _2206 = _2270;
        _2208 = _2252;
        _2210 = _2254;
    }
    float _2272 = _2222;
    float _2274 = _2216;
    float _2276 = _2206;
    float _2278 = _2208;
    float _2280 = _2210;
    int _2282 = int(_2024) + int(_2140);
    float _2284 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2286 = _2272 + _2284;
    int _2288 = ~_1826;
    int _2290 = _2288 + 1;
    float _2292 = -_1472;
    float _2294 = _2292 + 1.0;
    int _2296 = int(_2052) + int(_2196);
    float _2298 = fma(_2286, _2286, _2274);
    int _2300 = int(_2080) + int(_2170);
    float _2302 = trunc(_1530);
    int _2304 = int(_2302);
    int _2306 = ~_1904;
    int _2308 = _2306 + 1;
    int _2310 = _2290 * _2282;
    int _2312 = _2310 + _1992;
    int _2314 = ~_1872;
    int _2316 = _2314 + 1;
    float _2318 = _2298 + _2276;
    int _2320 = int(_2100) + int(_2190);
    int _2322 = _2308 * _2300;
    int _2324 = _2322 + _2014;
    int _2326 = ~_1940;
    int _2328 = _2326 + 1;
    int _2330 = _2316 * _2296;
    int _2332 = _2330 + _1984;
    bool _2334 = uint(_2312) >= uint(_1826);
    float _2336 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2338 = uint(_2324) >= uint(_1904);
    int _2340 = _2328 * _2320;
    int _2342 = _2340 + _2000;
    bool _2344 = !_2334;
    int _2346 = _2344 ? 0 : (-1);
    float _2348 = -_1512;
    float _2350 = _2348 + 1.0;
    bool _2352 = uint(_2332) >= uint(_1872);
    float _2354 = -_1470;
    float _2356 = _2354 + 1.0;
    int _2358 = ~_2282;
    int _2360 = _2358 + _2346;
    int _2362 = _2360 + 1;
    float _2364 = sqrt(_2318);
    bool _2366 = uint(_2342) >= uint(_1940);
    out.m_76.x = _2144;
    out.m_76.y = _2158;
    out.m_76.z = _2160;
    int _2368 = _2304 << 4;
    int _2370 = _2368 + 1712;
    bool _2372 = !_2352;
    int _2374 = _2372 ? 0 : (-1);
    int _2376 = _1992 ^ _1826;
    int _2378 = _1826 * _2362;
    int _2380 = _2378 + _1992;
    bool _2382 = _1826 == 0;
    float _2384 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _2386 = _1826 == 0;
    uint _2388 = uint(int(uint(_2370) >> uint(2)));
    uint _2390 = uint(int(uint(int(_2388)) >> uint(2)));
    int _2392 = int(_2388) & 3;
    float _2394 = (*spvDescriptorSet0.vp_c9)._m0[int(_2390)][_2392];
    int _2396 = int(_2388) + 1;
    uint _2398 = uint(int(uint(_2396) >> uint(2)));
    int _2400 = _2396 & 3;
    float _2402 = (*spvDescriptorSet0.vp_c9)._m0[int(_2398)][_2400];
    int _2404 = ~_2296;
    int _2406 = _2404 + _2374;
    int _2408 = _2406 + 1;
    int _2410 = _1984 ^ _1872;
    bool _2412 = !_2366;
    int _2414 = _2412 ? 0 : (-1);
    int _2416 = _1872 * _2408;
    int _2418 = _2416 + _1984;
    bool _2420 = _1872 == 0;
    float _2422 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2424 = _1872 == 0;
    bool _2426 = !_2338;
    int _2428 = _2426 ? 0 : (-1);
    int _2430 = _2370 + 8;
    uint _2432 = uint(int(uint(_2430) >> uint(2)));
    uint _2434 = uint(int(uint(int(_2432)) >> uint(2)));
    int _2436 = int(_2432) & 3;
    float _2438 = (*spvDescriptorSet0.vp_c9)._m0[int(_2434)][_2436];
    uint _2440 = uint(int(uint(_2376) >> uint(31)));
    int _2442 = ~_2414;
    int _2444 = _2320 + _2442;
    int _2446 = _2444 + 1;
    uint _2448 = uint(int(uint(_2410) >> uint(31)));
    int _2450 = ~_2428;
    int _2452 = _2300 + _2450;
    int _2454 = _2452 + 1;
    int _2456 = ~int(_2440);
    int _2458 = _2456 + 1;
    bool _2460 = !_2382;
    int _2462 = _2460 ? _2380 : (-1);
    float _2464 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2466 = ~int(_2448);
    int _2468 = _2466 + 1;
    int _2470 = _2454 ^ _2458;
    float _2472 = float(_2462);
    float _2474 = _2336 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2476 = fma(_2134, _2134, 1.0);
    int _2478 = _2446 ^ _2468;
    int _2480 = ~_2458;
    int _2482 = _2480 + _2470;
    int _2484 = _2482 + 1;
    float _2486 = fma(_2474, _2472, _1464);
    float _2488 = _2384 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2490 = rsqrt(_2476);
    int _2492 = ~_2468;
    int _2494 = _2492 + _2478;
    int _2496 = _2494 + 1;
    float _2498 = _2422 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _2500 = !_2386;
    int _2502 = _2500 ? _2484 : (-1);
    float _2504 = _2464 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _2506 = !_2420;
    int _2508 = _2506 ? _2418 : (-1);
    float _2510 = _2180 + 0.5;
    bool _2512 = !_2424;
    int _2514 = _2512 ? _2496 : (-1);
    float _2516 = float(_2502);
    float _2518 = float(_2508);
    float _2520 = _2110 + 0.5;
    float _2522 = float(_2514);
    float _2524 = -_1510;
    float _2526 = fma(_2498, _2516, _2524);
    float _2528 = _1674 + (-0.5);
    float _2530 = _2134 * _2490;
    float _2532 = fma(_2488, _2518, _1516);
    float _2534 = -_1476;
    float _2536 = fma(_2504, _2522, _2534);
    float _2538 = _2164 + (-0.5);
    float _2540 = -_2498;
    float _2542 = fma(_2540, _2528, _2526);
    float _2544 = -_1922;
    float _2546 = _2530 * _2544;
    float _2548 = fma(_2488, _2510, _2532);
    float _2550 = -_2504;
    float _2552 = fma(_2550, _2538, _2536);
    float _2554 = _2394 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2556 = -_1968;
    float _2558 = _2530 * _2556;
    float _2560 = fma(_2490, _1790, _2546);
    float _2562 = -_2036;
    float _2564 = _2530 * _2562;
    float _2566 = _2402 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2568 = fma(_2490, _1792, _2558);
    float _2570 = fma(_2490, _1840, _2564);
    float _2572 = fma(_2474, _2520, _2486);
    float _2574 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2576 = -_1500;
    float _2578 = _2576 + 1.0;
    float _2580 = _2438 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2582 = _1968 + _2184;
    float _2584 = -_2294;
    float _2586 = fma(_2180, _2584, _2548);
    float _2588 = _1922 + _2198;
    float _2590 = -_2578;
    float _2592 = fma(_2110, _2590, _2572);
    float _2594 = _2554 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2596 = _2566 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2598 = _2580 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2600 = fma(_1674, _2350, _2542);
    float _2602 = fma(_2164, _2356, _2552);
    float _2604 = _2036 + _2214;
    out.m_78.x = _2560;
    out.m_78.y = _2568;
    out.m_78.z = _2570;
    bool _2606 = _2364 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2608 = isnan(_2364);
    bool _2610 = _2606 || _2608;
    bool _2612 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2614 = _2610 || _2612;
    out.m_80.x = _2594;
    out.m_80.y = _2596;
    out.m_80.z = _2598;
    out.m_80.w = _2574;
    out.m_82.x = _2592;
    out.m_82.y = _2600;
    out.m_82.z = _2586;
    out.m_82.w = _2602;
    out.m_84.x = _2588;
    out.m_84.y = _2582;
    out.m_84.z = _2604;
    float _2616 = _2356;
    float _2618 = as_type<float>(_2300);
    float _2620 = as_type<float>(_2332);
    float _2622 = as_type<float>(_2312);
    float _2624 = _2486;
    if (!_2614)
    {
        _2616 = 1.0;
    }
    float _2626 = _2616;
    bool _2628 = !_2614;
    float _2630 = _2626;
    if (!_2628)
    {
        bool _2632 = _2364 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2634 = isnan(_2364);
        bool _2636 = _2632 || _2634;
        bool _2638 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2640 = _2636 || _2638;
        if (!_2640)
        {
            float _2642 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2644 = _2364 + _2642;
            float _2646 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2648 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2646;
            float _2650 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2652 = _2650 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2654 = 1.0 / _2648;
            float _2656 = _2644 * _2654;
            float _2658 = fma(_2656, _2652, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2630 = _2658;
            _2660 = true;
        }
        else
        {
            bool _2662 = _2364 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2664 = isnan(_2364);
            bool _2666 = _2662 || _2664;
            bool _2668 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2670 = _2666 || _2668;
            if (!_2670)
            {
                float _2672 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2674 = _2364 + _2672;
                float _2676 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2678 = _2676 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2680 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2682 = _2680 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2684 = 1.0 / _2678;
                float _2686 = _2674 * _2684;
                float _2688 = fma(_2686, _2682, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2630 = _2688;
                _2660 = true;
            }
            else
            {
                _2630 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2660 = false;
    float _2690 = _2630;
    float _2692 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2694 = _2272 + _2692;
    float _2696 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2698 = _2278 + _2696;
    float _2700 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2702 = _2280 + _2700;
    float _2704 = _1608 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2706 = fma(_2694, _2690, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2708 = fma(_2698, _2690, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2710 = fma(_2702, _2690, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2712 = fma(_2002, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2704);
    float _2714 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2716 = _2706 + _2714;
    float _2718 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2720 = _2708 + _2718;
    float _2722 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2724 = _2710 + _2722;
    float _2726 = fma(_1970, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2712);
    float _2728 = _2716 * _2716;
    float _2730 = _1608 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2732 = _2726 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2734 = fma(_2720, _2720, _2728);
    float _2736 = fma(_2002, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2730);
    float _2738 = 1.0 / _2732;
    float _2740 = fma(_2724, _2724, _2734);
    float _2742 = fma(_1970, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2736);
    float _2744 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _2746 = _2742 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2748 = rsqrt(_2740);
    float _2750 = _1608 + _2744;
    float _2752 = _2746 + _2732;
    float _2754 = fma(_2002, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2756 = _2750 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _2758 = _2750 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _2760 = _2752 * _2738;
    float _2762 = _2760 * 0.5;
    float _2764 = fma(_2002, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2756);
    float _2766 = fma(_2002, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2758);
    float _2768 = floor(_2754);
    float _2770 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2772 = fma(_2762, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2770);
    float _2774 = fma(_1970, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2764);
    float _2776 = fma(_1970, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2766);
    float _2778 = _2748 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2780 = _2774 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _2782 = _2776 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _2784 = 1.0 / _2772;
    float _2786 = _2720 * _2778;
    float _2788 = _2724 * _2778;
    float _2790 = _2786 * _2786;
    float _2792 = _2788 * _2788;
    float _2794 = trunc(_2780);
    int _2796 = int(_2794);
    float _2798 = -_2768;
    float _2800 = _2754 + _2798;
    float _2802 = _2790 + _2792;
    float _2804 = sqrt(_2802);
    float _2806 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2808 = _2784 * _2806;
    bool _2810 = _2808 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _2812 = _2808 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _2814 = trunc(_2782);
    int _2816 = int(_2814);
    int _2818 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2820 = _2796 + _2818;
    int _2822 = _2820 + 1;
    bool _2824 = _2804 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2826 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2828 = _2804 + _2826;
    float _2830 = sqrt(_2740);
    int _2832 = 2;
    float _2834 = _2802;
    float _2836 = _2828;
    float _2838 = _2778;
    float _2840 = _2786;
    float _2842 = _2768;
    float _2844 = _2790;
    if (!_2810)
    {
        _2832 = 1;
    }
    int _2846 = _2832;
    int _2848 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _2850 = _2816 + _2848;
    int _2852 = _2850 + 1;
    float _2854 = _2732;
    int _2856 = _2846;
    if (_2824)
    {
        float _2858 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2854 = _2858;
    }
    float _2860 = _2854;
    if (_2824)
    {
        float _2862 = rsqrt(_2802);
        _2834 = _2862;
    }
    float _2864 = _2834;
    float _2866 = _2864;
    if (_2824)
    {
        float _2868 = _2828 * _2860;
        _2836 = _2868;
    }
    float _2870 = _2836;
    if (_2824)
    {
        float _2872 = _2870 * 0.15915493667125701904296875;
        _2618 = _2872;
    }
    float _2874 = _2618;
    bool _2876 = !_2810;
    int _2878 = _2876 ? 0 : 1;
    float _2880 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2882 = _2774;
    if (_2824)
    {
        float _2884 = _2874 * 6.283185482025146484375;
        float _2886 = sin(_2884);
        _2882 = _2886;
    }
    float _2888 = _2882;
    if (!_2812)
    {
        _2856 = _2878;
    }
    int _2890 = _2856;
    float _2892 = precise::max(0.0, _2880);
    int _2894 = _2890 << 6;
    bool _2896 = _2822 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _2898 = -_2778;
    float _2900 = -_2892;
    float _2902 = fma(_2716, _2898, _2900);
    int _2904 = _2894 + 96;
    uint _2906 = uint(int(uint(_2904) >> uint(2)));
    uint _2908 = uint(int(uint(int(_2906)) >> uint(2)));
    int _2910 = int(_2906) & 3;
    float _2912 = (*spvDescriptorSet0.vp_c15)._m0[int(_2908)][_2910];
    int _2914 = int(_2906) + 1;
    uint _2916 = uint(int(uint(_2914) >> uint(2)));
    int _2918 = _2914 & 3;
    float _2920 = (*spvDescriptorSet0.vp_c15)._m0[int(_2916)][_2918];
    int _2922 = _2822 | _2852;
    float _2924 = _2874;
    float _2926 = as_type<float>(_2922);
    if (_2824)
    {
        float _2928 = _2874 * 6.283185482025146484375;
        float _2930 = cos(_2928);
        _2924 = _2930;
    }
    float _2932 = _2924;
    if (_2824)
    {
        float _2934 = _2902 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2838 = _2934;
    }
    float _2936 = _2838;
    bool _2938 = _2922 < 0;
    bool _2940 = _2938 || _2896;
    if (_2824)
    {
        float _2942 = fma(_2888, _2936, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2926 = _2942;
    }
    float _2944 = _2926;
    int _2946 = _2894 + 48;
    uint _2948 = uint(int(uint(_2946) >> uint(2)));
    uint _2950 = uint(int(uint(int(_2948)) >> uint(2)));
    int _2952 = int(_2948) & 3;
    float _2954 = (*spvDescriptorSet0.vp_c15)._m0[int(_2950)][_2952];
    int _2956 = int(_2948) + 1;
    uint _2958 = uint(int(uint(_2956) >> uint(2)));
    int _2960 = _2956 & 3;
    float _2962 = (*spvDescriptorSet0.vp_c15)._m0[int(_2958)][_2960];
    float _2964 = fma(_1970, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2966 = _2706 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_2824)
    {
        float _2968 = _2864 * _2944;
        _2620 = _2968;
    }
    float _2970 = _2620;
    bool _2972 = _2852 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _2974 = _2972 || _2940;
    float _2976 = floor(_2964);
    float _2978 = fma(_2708, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2966);
    if (_2824)
    {
        float _2980 = _2786 * _2970;
        _2840 = _2980;
    }
    float _2982 = _2840;
    int _2984 = _2894 + 64;
    uint _2986 = uint(int(uint(_2984) >> uint(2)));
    uint _2988 = uint(int(uint(int(_2986)) >> uint(2)));
    int _2990 = int(_2986) & 3;
    float _2992 = (*spvDescriptorSet0.vp_c15)._m0[int(_2988)][_2990];
    int _2994 = int(_2986) + 1;
    uint _2996 = uint(int(uint(_2994) >> uint(2)));
    int _2998 = _2994 & 3;
    float _3000 = (*spvDescriptorSet0.vp_c15)._m0[int(_2996)][_2998];
    if (!_2824)
    {
        _2842 = _2902;
    }
    float _3002 = _2842;
    float _3004 = _3002;
    if (_2824)
    {
        float _3006 = _2932 + (-1.0);
        _2866 = _3006;
    }
    float _3008 = _2866;
    float _3010 = fma(_2710, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2978);
    float _3012 = _3008;
    float _3014 = _3010;
    if (_2824)
    {
        float _3016 = _2982 * _2982;
        _2844 = _3016;
    }
    float _3018 = _2844;
    if (_2824)
    {
        float _3020 = _3008 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2622 = _3020;
    }
    float _3022 = _2622;
    if (!_2824)
    {
        _3012 = _2788;
    }
    float _3024 = _3012;
    int _3026 = _2894 + 104;
    uint _3028 = uint(int(uint(_3026) >> uint(2)));
    uint _3030 = uint(int(uint(int(_3028)) >> uint(2)));
    int _3032 = int(_3028) & 3;
    float _3034 = (*spvDescriptorSet0.vp_c15)._m0[int(_3030)][_3032];
    int _3036 = int(_3028) + 1;
    uint _3038 = uint(int(uint(_3036) >> uint(2)));
    int _3040 = _3036 & 3;
    float _3042 = (*spvDescriptorSet0.vp_c15)._m0[int(_3038)][_3040];
    float _3044 = _3024;
    if (_2824)
    {
        float _3046 = _2788 * _2970;
        _3044 = _3046;
    }
    float _3048 = _3044;
    if (_2824)
    {
        float _3050 = fma(_2902, _2932, _3022);
        _3004 = _3050;
    }
    float _3052 = _3004;
    float _3054 = _3010 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    if (!_2824)
    {
        _3014 = _2792;
    }
    float _3056 = _3014;
    float _3058 = _3056;
    if (_2824)
    {
        float _3060 = _3048 * _3048;
        _3058 = _3060;
    }
    float _3062 = _3058;
    float _3064 = fma(_3052, _3052, _3018);
    if (!_2974)
    {
        float _3066 = floor(_2782);
        _2624 = _3066;
    }
    float _3068 = _2624;
    int _3070 = _2894 + 80;
    uint _3072 = uint(int(uint(_3070) >> uint(2)));
    uint _3074 = uint(int(uint(int(_3072)) >> uint(2)));
    int _3076 = int(_3072) & 3;
    float _3078 = (*spvDescriptorSet0.vp_c15)._m0[int(_3074)][_3076];
    int _3080 = int(_3072) + 1;
    uint _3082 = uint(int(uint(_3080) >> uint(2)));
    int _3084 = _3080 & 3;
    float _3086 = (*spvDescriptorSet0.vp_c15)._m0[int(_3082)][_3084];
    float _3088 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3090 = _3054 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3092 = -_2976;
    float _3094 = _2964 + _3092;
    float _3096 = _3064 + _3062;
    float _3098 = -_3090;
    float _3100 = fma(_3098, _3088, 1.0);
    int _3102 = as_type<int>(_3090);
    if (!_2974)
    {
        int _3104 = _2852 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _3106 = _3104 + _2822;
        _3102 = _3106;
    }
    int _3108 = _3102;
    int _3110 = _2894 + 56;
    uint _3112 = uint(int(uint(_3110) >> uint(2)));
    uint _3114 = uint(int(uint(int(_3112)) >> uint(2)));
    int _3116 = int(_3112) & 3;
    float _3118 = (*spvDescriptorSet0.vp_c15)._m0[int(_3114)][_3116];
    int _3120 = int(_3112) + 1;
    uint _3122 = uint(int(uint(_3120) >> uint(2)));
    int _3124 = _3120 & 3;
    float _3126 = (*spvDescriptorSet0.vp_c15)._m0[int(_3122)][_3124];
    float _3128 = log2(_3100);
    int _3130 = _2894 + 72;
    uint _3132 = uint(int(uint(_3130) >> uint(2)));
    uint _3134 = uint(int(uint(int(_3132)) >> uint(2)));
    int _3136 = int(_3132) & 3;
    float _3138 = (*spvDescriptorSet0.vp_c15)._m0[int(_3134)][_3136];
    int _3140 = int(_3132) + 1;
    uint _3142 = uint(int(uint(_3140) >> uint(2)));
    int _3144 = _3140 & 3;
    float _3146 = (*spvDescriptorSet0.vp_c15)._m0[int(_3142)][_3144];
    float _3148 = _2750 * _2920;
    float _3150 = fma(_2002, _2912, _3148);
    int _3152 = _2894 + 88;
    uint _3154 = uint(int(uint(_3152) >> uint(2)));
    uint _3156 = uint(int(uint(int(_3154)) >> uint(2)));
    int _3158 = int(_3154) & 3;
    float _3160 = (*spvDescriptorSet0.vp_c15)._m0[int(_3156)][_3158];
    int _3162 = int(_3154) + 1;
    uint _3164 = uint(int(uint(_3162) >> uint(2)));
    int _3166 = _3162 & 3;
    float _3168 = (*spvDescriptorSet0.vp_c15)._m0[int(_3164)][_3166];
    float _3170 = _2750 * _2962;
    float _3172 = rsqrt(_3096);
    float _3174 = _3128 * 0.693147182464599609375;
    float _3176 = fma(_2002, _2954, _3170);
    int _3178 = as_type<int>(_3170);
    int _3180 = as_type<int>(_2912);
    if (!_2974)
    {
        int _3182 = _3108 << 2;
        _3178 = _3182;
    }
    int _3184 = _3178;
    float _3186 = _2750 * _3000;
    float _3188 = _3000;
    int _3190 = _3184;
    int _3192 = as_type<int>(_3086);
    if (!_2974)
    {
        float _3194 = -_3068;
        float _3196 = _2782 + _3194;
        _3188 = _3196;
    }
    float _3198 = _3188;
    if (!_2974)
    {
        int _3200 = 12 & _3184;
        _3190 = _3200;
    }
    int _3202 = _3190;
    float _3204 = fma(_2002, _2992, _3186);
    float2 _8729 = float2(_2800, _3094);
    float _3206 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8729, float2(0.0), isnan(_8729)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8729, float2(0.0), isnan(_8729)), level(0.0)).x;
    float _3208 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3210 = fma(_2830, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3208);
    float _3212 = precise::clamp(_3210, 0.0, 1.0);
    float _3214 = _3174 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3216 = fma(_1970, _3034, _3150);
    float _3218 = _3172 * _2982;
    float _3220 = _3216 + _3042;
    float _3222 = _3172 * _3052;
    float _3224 = _3172 * _3048;
    float _3226 = _3218 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3228 = _2750 * _3086;
    if (!_2974)
    {
        uint _3230 = uint(int(uint(_3108) >> uint(2)));
        _3192 = int(_3230);
    }
    int _3232 = _3192;
    float _3234 = 1.0 / _3220;
    float _3236 = fma(_2002, _3078, _3228);
    float _3238 = -_3212;
    float _3240 = _3238 + 1.0;
    if (!_2974)
    {
        int _3242 = _3232 << 4;
        int _3244 = _3242 + _3202;
        _3180 = _3244;
    }
    int _3246 = _3180;
    float _3248 = fma(_1970, _3118, _3176);
    float _3250 = abs(_3240);
    float _3252 = log2(_3250);
    float _3254 = _3248 + _3126;
    float _3256 = _2706 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3258 = _3248;
    if (!_2974)
    {
        int _3260 = _3246 + 400;
        uint _3262 = uint(int(uint(_3260) >> uint(2)));
        uint _3264 = uint(int(uint(int(_3262)) >> uint(2)));
        int _3266 = int(_3262) & 3;
        float _3268 = (*spvDescriptorSet0.vp_c15)._m0[int(_3264)][_3266];
        _3258 = _3268;
    }
    float _3270 = _3258;
    float _3272 = fma(_1970, _3138, _3204);
    float _3274 = fma(_2708, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3256);
    float _3276 = _3272 + _3146;
    float _3278 = _2706 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3280 = fma(_2710, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3274);
    float _3282 = fma(_1970, _3160, _3236);
    float _3284 = -_3226;
    float _3286 = fma(_3222, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3284);
    float _3288 = _2706 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3290 = fma(_2708, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3278);
    float _3292 = _3280 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3294 = -_3224;
    float _3296 = fma(_3294, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3286);
    float _3298 = fma(_2708, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3288);
    float _3300 = fma(_2710, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3290);
    float _3302 = _3254 * _3234;
    float _3304 = _3292 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3306 = _3252 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3308 = _3300 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3310 = fma(_2710, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3298);
    bool _3312 = _3302 >= 0.0;
    float _3314 = fma(_3296, 0.5, 0.5);
    float _3316 = fma(_3308, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3304);
    float _3318 = _3276 * _3234;
    bool _3320 = _3302 <= 1.0;
    bool _3322 = _3320 && _3312;
    float _3324 = exp2(_3306);
    float _3326 = fma(_3296, -0.5, 0.5);
    float _3328 = _3310 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    bool _3330 = _3318 >= 0.0;
    bool _3332 = _3330 && _3322;
    float _3334 = fma(_3054, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3316);
    float _3336 = _3282 + _3168;
    float _3338 = fma(_3314, -0.0187292993068695068359375, 0.07426099479198455810546875);
    bool _3340 = _3318 <= 1.0;
    bool _3342 = _3340 && _3332;
    float _3344 = _3222 + 1.0;
    float _3346 = _3292 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3348 = fma(_3328, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3334);
    float _3350 = fma(_3314, _3338, -0.212114393711090087890625);
    float _3352 = _3298;
    float _3354 = _3346;
    float _3356 = _3348;
    if (!_2974)
    {
        float _3358 = floor(_2780);
        _3352 = _3358;
    }
    float _3360 = _3352;
    float _3362 = _3292 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3364 = _3336 * _3234;
    float _3366 = fma(_3314, _3350, 1.570728778839111328125);
    float _3368 = -_3222;
    float _3370 = fma(_3324, _3344, _3368);
    float _3372 = fma(_3308, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3346);
    float _3374 = fma(_3308, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3362);
    float _3376 = 1.0 / _3348;
    if (_3342)
    {
        float _3378 = float(_2890);
        _3354 = _3378;
    }
    float _3380 = _3354;
    float _3382 = fma(_3054, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3374);
    float _3384 = fma(_3054, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3372);
    float _3386 = fma(_3370, 0.5, 0.5);
    float _3388 = fma(_3328, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3382);
    float _3390 = fma(_3328, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3384);
    float _3392 = sqrt(_3326);
    float _3394 = _3384;
    float _3396 = _3388;
    if (!_2974)
    {
        float _3398 = -_3360;
        float _3400 = _2780 + _3398;
        _3394 = _3400;
    }
    float _3402 = _3394;
    float _3404 = _3380;
    if (_3342)
    {
        float _3406 = rint(_3380);
        float _3408 = precise::max(_3406, 0.0);
        uint _3410 = uint(_3408);
        uint _3412 = clamp(_3410, 0u, 65535u);
        _3404 = as_type<float>(_3412);
    }
    float _3414 = _3404;
    float _3416 = _3388 * _3376;
    float _3418 = _3390 * _3376;
    float _3420 = fma(_3416, 0.5, 0.5);
    float _3422 = fma(_3418, -0.5, 0.5);
    float _3424 = _3392 * 0.636619746685028076171875;
    float _3426 = _3270;
    if (!_2974)
    {
        float _3428 = rint(_3270);
        float _3430 = precise::max(_3428, 0.0);
        uint _3432 = uint(_3430);
        uint _3434 = clamp(_3432, 0u, 65535u);
        _3426 = as_type<float>(_3434);
    }
    float _3436 = _3426;
    float _3438 = -_3366;
    float _3440 = fma(_3424, _3438, 1.0);
    float _3442 = _3414;
    if (_3342)
    {
        float3 _9134 = float3(_3302, _3318, float(as_type<int>(_3414)));
        float3 _9138 = select(_9134, float3(0.0), isnan(_9134));
        float _3444 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _9138.xy, uint(rint(_9138.z)), _3364, level(0.0));
        _3442 = _3444;
    }
    float _3446 = _3442;
    float3 _9148 = float3(_3420, _3422, _3214);
    float _3448 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9148, float3(0.0), isnan(_9148)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9148, float3(0.0), isnan(_9148)), level(0.0)).x;
    float3 _9157 = float3(_3420, _3422, _3214);
    float4 _3451 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9157, float3(0.0), isnan(_9157)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9157, float3(0.0), isnan(_9157)), level(0.0)).xyzw;
    float _3453 = _3451.x;
    float _3455 = _3451.y;
    float _3457 = _3451.z;
    float _3459 = _3451.w;
    float2 _9173 = float2(_3440, _3386);
    float3 _3463 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9173, float2(0.0), isnan(_9173)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9173, float2(0.0), isnan(_9173)), level(0.0)).xyz;
    float _3465 = _3463.x;
    float _3467 = _3463.y;
    float _3469 = _3463.z;
    float _3471 = _3402;
    if (!_2974)
    {
        float3 _9194 = float3(_3402, _3198, float(as_type<int>(_3436)));
        float3 _9196 = select(_9194, float3(0.0), isnan(_9194));
        float _3473 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _9196.xy, uint(rint(_9196.z)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _9196.xy, uint(rint(_9196.z)), level(0.0)).x;
        _3471 = _3473;
    }
    float _3475 = _3471;
    float _3477 = abs(_2808);
    float _3479 = log2(_3477);
    float _3481 = _3252 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3483 = _3292 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3485 = exp2(_3481);
    float _3487 = fma(_3308, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3483);
    bool _3489 = _2808 <= 8000.0;
    bool _3491 = isnan(_2808);
    bool _3493 = _3489 || _3491;
    bool _3495 = isnan(8000.0);
    bool _3497 = _3493 || _3495;
    float _3499 = float(_3497);
    float _3501 = fma(_3054, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3487);
    float _3503 = _3479 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3505 = fma(_3328, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3501);
    float _3507 = exp2(_3503);
    out.gl_Position.x = _3388;
    out.gl_Position.y = _3390;
    out.gl_Position.z = _3505;
    out.gl_Position.w = _3348;
    float _3509 = -_3485;
    float _3511 = _3509 + 1.0;
    float _3513 = _3511 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (_2974)
    {
        _3396 = 1.0;
    }
    float _3515 = _3396;
    float _3517 = fma(_3507, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3519 = precise::clamp(_3517, 0.0, 1.0);
    float _3521 = fma(_3519, -2.0, 3.0);
    float _3523 = _3519 * _3519;
    float _3525 = _3523 * _3521;
    float _3527 = -_3525;
    float _3529 = _3527 + 1.0;
    float _3531 = fma(_3529, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3525);
    float _3533 = _3499 * _3531;
    float _3535 = _3533 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3537 = _3533;
    float _3539 = _3515;
    if (!_3342)
    {
        _3537 = 1.0;
    }
    float _3541 = _3537;
    float _3543 = -_3206;
    float _3545 = _3543 + 1.0;
    float _3547 = _3545 * _3535;
    float _3549 = precise::clamp(_3547, 0.0, 1.0);
    float _3551 = _3541;
    float _3553 = _3549;
    if (_3342)
    {
        bool _3555 = _3446 >= _3364;
        bool _3557 = isnan(_3446);
        bool _3559 = _3555 || _3557;
        bool _3561 = isnan(_3364);
        bool _3563 = _3559 || _3561;
        float _3565 = float(_3563);
        _3551 = _3565;
    }
    float _3567 = _3551;
    float _3569 = _3567;
    if (!_2974)
    {
        int _3571 = _3108 << 4;
        int _3573 = _3571 + 2048;
        uint _3575 = uint(int(uint(_3573) >> uint(2)));
        uint _3577 = uint(int(uint(int(_3575)) >> uint(2)));
        int _3579 = int(_3575) & 3;
        float _3581 = (*spvDescriptorSet0.vp_c15)._m0[int(_3577)][_3579];
        int _3583 = int(_3575) + 1;
        uint _3585 = uint(int(uint(_3583) >> uint(2)));
        int _3587 = _3583 & 3;
        float _3589 = (*spvDescriptorSet0.vp_c15)._m0[int(_3585)][_3587];
        int _3591 = _3573 + 8;
        uint _3593 = uint(int(uint(_3591) >> uint(2)));
        uint _3595 = uint(int(uint(int(_3593)) >> uint(2)));
        int _3597 = int(_3593) & 3;
        float _3599 = (*spvDescriptorSet0.vp_c15)._m0[int(_3595)][_3597];
        int _3601 = int(_3593) + 1;
        uint _3603 = uint(int(uint(_3601) >> uint(2)));
        int _3605 = _3601 & 3;
        float _3607 = (*spvDescriptorSet0.vp_c15)._m0[int(_3603)][_3605];
        float _3609 = _2750 * _3589;
        float _3611 = fma(_2002, _3581, _3609);
        float _3613 = fma(_1970, _3599, _3611);
        float _3615 = _3613 + _3607;
        float _3617 = precise::clamp(_3615, 0.0, 1.0);
        float _3619 = -_3617;
        float _3621 = _3619 + _3475;
        float _3623 = fma(_3621, 500.0, 1.5);
        float _3625 = exp2(_3623);
        float _3627 = 0.0 + _3625;
        float _3629 = precise::clamp(_3627, 0.0, 1.0);
        _3539 = _3629;
        _3356 = _3607;
    }
    float _3631 = _3539;
    float _3633 = _3356;
    float _3635 = _3567 * _3631;
    float _3637 = _3513 * _3448;
    float _3639 = -_3549;
    float _3641 = fma(_3639, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3643 = -_3513;
    float _3645 = _3643 + 1.0;
    out.m_86.x = _2708;
    out.m_86.y = _2706;
    out.m_86.z = _2710;
    float _3647 = _3459 * _3637;
    float _3649 = -_3635;
    float _3651 = fma(_3649, _3641, 1.0);
    float _3653 = precise::clamp(_3651, 0.0, 1.0);
    float _3655 = _3469 * _3637;
    float _3657 = _3459 * _3645;
    float _3659 = fma(_3465, _3647, _3453);
    float _3661 = fma(_3467, _3647, _3455);
    float _3663 = _3653 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3665 = fma(_3459, _3655, _3457);
    bool _3667 = _2830 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3669 = isnan(_2830);
    bool _3671 = _3667 || _3669;
    bool _3673 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3675 = _3671 || _3673;
    out.m_88.x = _3663;
    out.m_90.x = _3659;
    out.m_90.y = _3661;
    out.m_90.z = _3665;
    out.m_90.w = _3657;
    float _3677 = _3633;
    float _3679 = _3647;
    float _3681 = _3641;
    float _3683 = _3653;
    if (!_3675)
    {
        _3569 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3685 = _3569;
    float _3687 = _3685;
    float _3689 = _3685;
    if (!_3675)
    {
        _3553 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3691 = _3553;
    float _3693 = _3691;
    float _3695 = _3691;
    if (!_3675)
    {
        _3677 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3697 = _3677;
    float _3699 = _3697;
    float _3701 = _3697;
    if (!_3675)
    {
        _3679 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3703 = _3679;
    float _3705 = _3703;
    float _3707 = _3703;
    if (!_3675)
    {
        _3681 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3709 = _3681;
    float _3711 = _3709;
    float _3713 = _3709;
    if (!_3675)
    {
        _3683 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3715 = _3683;
    bool _3717 = !_3675;
    float _3719 = _3715;
    float _3721 = _3715;
    if (!_3717)
    {
        bool _3723 = _2830 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3725 = isnan(_2830);
        bool _3727 = _3723 || _3725;
        bool _3729 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3731 = _3727 || _3729;
        if (!_3731)
        {
            float _3733 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3735 = _2830 + _3733;
            float _3737 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3739 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3737;
            float _3741 = 1.0 / _3739;
            float _3743 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3745 = _3743 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3747 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3749 = _3747 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3751 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3753 = _3751 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3755 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3757 = _3755 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3759 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3761 = _3759 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3763 = _3735 * _3741;
            float _3765 = precise::clamp(_3763, 0.0, 1.0);
            float _3767 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3769 = _3767 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3771 = fma(_3765, _3745, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3773 = fma(_3765, _3769, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3775 = fma(_3765, _3749, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3777 = fma(_3765, _3753, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3779 = fma(_3765, _3757, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3781 = fma(_3765, _3761, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3695 = _3773;
            _3713 = _3779;
            _3689 = _3771;
            _3707 = _3777;
            _3701 = _3775;
            _3721 = _3781;
            _3783 = true;
        }
        else
        {
            bool _3785 = _2830 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3787 = isnan(_2830);
            bool _3789 = _3785 || _3787;
            bool _3791 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3793 = _3789 || _3791;
            if (!_3793)
            {
                _3687 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3795 = _3687;
            _3689 = _3795;
            if (!_3793)
            {
                _3693 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3797 = _3693;
            _3695 = _3797;
            if (!_3793)
            {
                _3699 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3799 = _3699;
            _3701 = _3799;
            if (!_3793)
            {
                _3705 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3801 = _3705;
            _3707 = _3801;
            if (!_3793)
            {
                _3711 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3803 = _3711;
            _3713 = _3803;
            if (!_3793)
            {
                _3719 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3805 = _3719;
            bool _3807 = !_3793;
            _3721 = _3805;
            if (!_3807)
            {
                bool _3809 = _2830 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3811 = isnan(_2830);
                bool _3813 = _3809 || _3811;
                bool _3815 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3817 = _3813 || _3815;
                if (!_3817)
                {
                    float _3819 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3821 = _2830 + _3819;
                    float _3823 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3825 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3823;
                    float _3827 = 1.0 / _3825;
                    float _3829 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3831 = _3829 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3833 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3835 = _3833 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3837 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3839 = _3837 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3841 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3843 = _3841 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3845 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3847 = _3845 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3849 = _3821 * _3827;
                    float _3851 = precise::clamp(_3849, 0.0, 1.0);
                    float _3853 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3855 = _3853 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3857 = fma(_3851, _3831, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3859 = fma(_3851, _3855, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3861 = fma(_3851, _3835, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3863 = fma(_3851, _3839, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3865 = fma(_3851, _3843, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3867 = fma(_3851, _3847, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3695 = _3859;
                    _3713 = _3865;
                    _3689 = _3857;
                    _3707 = _3863;
                    _3701 = _3861;
                    _3721 = _3867;
                    _3783 = true;
                }
                else
                {
                    _3695 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3713 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3689 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3707 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3701 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3721 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3783 = false;
    float _3869 = _3695;
    float _3871 = _3713;
    float _3873 = _3689;
    float _3875 = _3707;
    float _3877 = _3701;
    float _3879 = _3721;
    float _3881 = fma(_2582, -0.5, 0.5);
    float _3883 = precise::clamp(_3881, 0.0, 1.0);
    float _3885 = -_3869;
    float _3887 = _3885 + _3871;
    float _3889 = -_3873;
    float _3891 = _3889 + _3875;
    float _3893 = -_3877;
    float _3895 = _3893 + _3879;
    bool _3897 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3899 = fma(_3883, _3887, _3869);
    float _3901 = fma(_3883, _3891, _3873);
    float _3903 = fma(_3883, _3895, _3877);
    float _3905 = _3899 * 0.586610972881317138671875;
    out.m_61.x = 1.0;
    float _3907 = fma(_3901, 0.298911988735198974609375, _3905);
    float _3909 = fma(_3903, 0.114477999508380889892578125, _3907);
    out.m_92.x = 0.0;
    float _3911 = -_3909;
    float _3913 = _3901 + _3911;
    float _3915 = -_3909;
    float _3917 = _3899 + _3915;
    float _3919 = -_3909;
    float _3921 = _3903 + _3919;
    float _3923 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3925 = fma(_3913, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3909);
    float _3927 = fma(_3917, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3909);
    float _3929 = fma(_3921, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3909);
    out.m_88.w = _3923;
    out.m_94.x = _3925;
    out.m_94.y = _3927;
    out.m_94.z = _3929;
    if (!_3897)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3931 = -_2706;
    float _3933 = _3931 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3935 = -_2708;
    float _3937 = _3935 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3939 = -_2710;
    float _3941 = _3939 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3943 = _3933 * _3933;
    float _3945 = fma(_3937, _3937, _3943);
    float _3947 = fma(_3941, _3941, _3945);
    float _3949 = sqrt(_3947);
    float _3951 = rsqrt(_3947);
    float _3953 = -_3949;
    float _3955 = _3953 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3957 = _3955 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3959 = precise::clamp(_3957, 0.0, 1.0);
    float _3961 = _3937 * _3951;
    float _3963 = _3933 * _3951;
    float _3965 = abs(_3959);
    float _3967 = log2(_3965);
    float _3969 = _3941 * _3951;
    float _3971 = _3961 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3973 = _2582 * _3963;
    float _3975 = -_3963;
    float _3977 = -_3971;
    float _3979 = fma(_3975, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3977);
    float _3981 = fma(_2588, _3961, _3973);
    float _3983 = -_3969;
    float _3985 = fma(_3983, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3979);
    float _3987 = fma(_2604, _3969, _3981);
    float _3989 = precise::clamp(_3987, 0.0, 1.0);
    float _3991 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3993 = _3985 + _3991;
    float _3995 = _3967 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3997 = _3993 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3999 = precise::clamp(_3997, 0.0, 1.0);
    float _4001 = exp2(_3995);
    float _4003 = _4001 * _3999;
    float _4005 = _3989 * _4003;
    float _4007 = _4005 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4009 = _4005 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4011 = _4005 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_92.x = _4007;
    out.m_92.y = _4009;
    out.m_92.z = _4011;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

