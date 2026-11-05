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
    texture2d_array<float> vp_t_tcb_14 [[id(9)]];
    sampler vp_t_tcb_14Smplr [[id(10)]];
    texture2d_array<float> vp_t_tcb_16 [[id(11)]];
    sampler vp_t_tcb_16Smplr [[id(12)]];
    texture3d<float> vp_t_tcb_32 [[id(13)]];
    sampler vp_t_tcb_32Smplr [[id(14)]];
    texture3d<float> vp_t_tcb_30 [[id(15)]];
    sampler vp_t_tcb_30Smplr [[id(16)]];
    texture2d<float> vp_t_tcb_1C [[id(17)]];
    sampler vp_t_tcb_1CSmplr [[id(18)]];
    sampler vp_t_tcb_24Smplr_w [[id(19)]];
    sampler vp_t_tcb_14Smplr_w [[id(20)]];
    sampler vp_t_tcb_32Smplr_w [[id(21)]];
    sampler vp_t_tcb_30Smplr_w [[id(22)]];
    sampler vp_t_tcb_1CSmplr_w [[id(23)]];
    constant dm_border_t* dm_border [[id(24)]];
};

struct main0_out
{
    float4 m_70 [[user(locn0)]];
    float4 m_80 [[user(locn1)]];
    float4 m_82 [[user(locn2)]];
    float4 m_88 [[user(locn3)]];
    float4 m_96 [[user(locn4)]];
    float4 m_61 [[user(locn5)]];
    float4 m_78 [[user(locn6)]];
    float4 m_84 [[user(locn7)]];
    float4 m_86 [[user(locn8)]];
    float4 m_76 [[user(locn9)]];
    float4 m_94 [[user(locn10)]];
    float4 m_90 [[user(locn11)]];
    float4 m_92 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_72 [[attribute(1)]];
    float4 m_58 [[attribute(2)]];
    float4 m_63 [[attribute(3)]];
    float4 m_68 [[attribute(4)]];
    float4 m_74 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3929 = false;
    bool _2582 = false;
    bool _213 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _110 = in.m_58.w;
    float _112 = trunc(_110);
    int _115 = int(_112);
    bool _119 = _115 >= 1;
    float _121 = 0.0;
    if (!_119)
    {
        _121 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _123 = _121;
    float _125 = _123;
    if (!_119)
    {
        out.m_61.x = 0.0;
    }
    int _127 = 0;
    if (!_119)
    {
        float _129 = _123 * 5.0;
        _127 = as_type<int>(_129);
    }
    int _131 = _127;
    int _133 = _131;
    if (!_119)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4234 = as_type<float>(_131);
        out.gl_Position.z = _4234;
    }
    if (!_119)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _135 = in.m_63.w;
    bool _137 = _135 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _139 = isnan(_135);
    bool _141 = _137 || _139;
    bool _143 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _145 = _141 || _143;
    float _147 = -_135;
    float _149 = _147 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _151 = 0.0;
    float _153 = _149;
    if (_145)
    {
        float _155 = float(_115);
        _151 = _155;
    }
    float _157 = _151;
    bool _159 = _149 >= _157;
    bool _161 = !_145;
    bool _163 = _159 || _161;
    if (_163)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _165 = _125;
    if (_163)
    {
        out.m_61.x = 0.0;
    }
    if (_163)
    {
        float _167 = _165 * 5.0;
        _133 = as_type<int>(_167);
    }
    int _169 = _133;
    float _171 = as_type<float>(_169);
    if (_163)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4305 = as_type<float>(_169);
        out.gl_Position.z = _4305;
    }
    if (_163)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _173 = as_type<float>(int(gl_VertexIndex));
    bool _175 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _177 = as_type<int>(_173) & 1;
    bool _179 = _177 != 0;
    int _181 = as_type<int>(_173) & 2;
    bool _183 = _181 != 0;
    bool _185 = !_179;
    float _187 = _185 ? (-0.5) : 0.5;
    bool _189 = !_183;
    float _191 = _189 ? (-0.5) : 0.5;
    bool _193 = !_175;
    float _211;
    if (!_193)
    {
        float _195 = in.m_68.x;
        float _197 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _199 = _195 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _201 = fma(_199, (*spvDescriptorSet0.vp_c9)._m0[12].x, _149);
        float _203 = _201 * _197;
        float _205 = floor(_203);
        float _207 = -_205;
        float _209 = _203 + _207;
        _211 = _209;
        _213 = true;
    }
    else
    {
        float _215 = float(_115);
        float _217 = 1.0 / _215;
        float _219 = _149 * _217;
        _211 = _219;
    }
    _213 = false;
    float _221 = _211;
    float _223 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _225 = int(_223);
    float _227 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _229 = _221 + _227;
    float _231 = float(_115);
    int _233 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _235 = _233 != 0;
    float _237 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _239 = int(_237);
    float _241 = float(_225);
    float _243 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _245 = int(_243);
    int _247 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    if (_235)
    {
        float _249 = in.m_68.x;
        _171 = _249;
    }
    float _251 = _171;
    float _253 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _255 = _251;
    if (!_235)
    {
        float _257 = in.m_68.y;
        _255 = _257;
    }
    float _259 = _255;
    float _261 = float(_239);
    float _263 = 1.0 / _241;
    float _265 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _267 = int(_265);
    float _269 = float(uint(_245));
    int _271 = ~_245;
    int _273 = _271 + 1;
    bool _275 = _245 == 0;
    float _277 = 1.0 / _261;
    float _279 = _263 * _149;
    float _281 = 1.0 / _269;
    float _283 = float(uint(_267));
    int _285 = ~_267;
    int _287 = _285 + 1;
    float _289 = trunc(_279);
    int _291 = int(_289);
    float _293 = _277 * _149;
    float _295 = 1.0 / _283;
    int _297 = as_type<int>(_281) + (-2);
    float _299 = trunc(_293);
    int _301 = int(_299);
    float _303 = float(uint(_291));
    float _305 = as_type<float>(_297) * _303;
    int _307 = as_type<int>(_295) + (-2);
    float _309 = 1.0 / _231;
    float _311 = float(uint(_301));
    float _313 = trunc(_305);
    float _315 = precise::max(_313, 0.0);
    uint _318 = uint(_315);
    float _320 = as_type<float>(_307) * _311;
    float _322 = in.m_68.x;
    float _324 = in.m_68.y;
    float _326 = in.m_68.z;
    float _328 = in.m_68.w;
    float _330 = trunc(_320);
    float _332 = precise::max(_330, 0.0);
    uint _334 = uint(_332);
    float _336 = _309 * _149;
    int _338 = _273 * int(_318);
    int _340 = _338 + _291;
    float _342 = float(uint(_340));
    float _344 = as_type<float>(_340);
    if (_235)
    {
        _344 = 1.0;
    }
    float _346 = _344;
    int _348 = _287 * int(_334);
    int _350 = _348 + _301;
    float _352 = _346;
    float _354 = as_type<float>(_350);
    if (!_235)
    {
        _352 = 7.345489978790283203125;
    }
    float _356 = _352;
    float _358 = as_type<float>(_297) * _342;
    float _360 = float(uint(_350));
    float _362 = trunc(_358);
    float _364 = precise::max(_362, 0.0);
    uint _366 = uint(_364);
    if (_235)
    {
        _354 = 1.0;
    }
    float _368 = _354;
    float _370 = _356 * _322;
    float _372 = _368;
    if (!_235)
    {
        _372 = 1.2345600128173828125;
    }
    float _374 = _372;
    float _376 = as_type<float>(_307) * _360;
    float _378 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[78].z, _253);
    float _380 = floor(_370);
    float _382 = _259 * _374;
    int _384 = ~_245;
    int _386 = _384 + 1;
    float _388 = float(_291);
    float _390 = trunc(_376);
    float _392 = precise::max(_390, 0.0);
    uint _394 = uint(_392);
    int _396 = int(_318) + int(_366);
    int _398 = ~_267;
    int _400 = _398 + 1;
    int _402 = _386 * _396;
    int _404 = _402 + _291;
    float _406 = float(_245);
    float _408 = floor(_382);
    float _410 = -_380;
    float _412 = _370 + _410;
    bool _414 = uint(_404) >= uint(_245);
    bool _416 = _388 >= _406;
    bool _418 = isnan(_388);
    bool _420 = _416 || _418;
    bool _422 = isnan(_406);
    bool _424 = _420 || _422;
    float _426 = float(_424);
    float _428 = _412 * _406;
    bool _430 = !_414;
    int _432 = _430 ? 0 : (-1);
    int _434 = int(_334) + int(_394);
    float _436 = trunc(_426);
    int _438 = int(_436);
    int _440 = ~_396;
    int _442 = _440 + _432;
    int _444 = _442 + 1;
    float _446 = float(_301);
    int _448 = _400 * _434;
    int _450 = _448 + _301;
    float _452 = -_408;
    float _454 = _382 + _452;
    float _456 = trunc(_428);
    int _458 = int(_456);
    bool _460 = uint(_450) >= uint(_267);
    int _462 = _245 * _444;
    int _464 = _462 + _291;
    float _466 = float(_267);
    float _468 = _406 * _336;
    int _470 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _472 = _470 != 0;
    bool _474 = _446 >= _466;
    bool _476 = isnan(_446);
    bool _478 = _474 || _476;
    bool _480 = isnan(_466);
    bool _482 = _478 || _480;
    float _484 = float(_482);
    float _486 = _454 * _466;
    bool _488 = !_472;
    int _490 = _488 ? 0 : 1;
    float _492 = _466 * _336;
    bool _494 = !_460;
    int _496 = _494 ? 0 : (-1);
    float _498 = trunc(_468);
    int _500 = int(_498);
    int _502 = abs(_490);
    int _504 = ~_438;
    int _506 = _504 + 1;
    int _508 = _506 + 1;
    bool _510 = !_275;
    int _512 = _510 ? _464 : (-1);
    int _514 = _458 * _502;
    int _516 = _514 + _291;
    int _518 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _520 = _518 != 0;
    int _522 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _524 = _522 != 0;
    int _526 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _528 = _526 != 0;
    float _530 = trunc(_484);
    int _532 = int(_530);
    int _534 = ~_434;
    int _536 = _534 + _496;
    int _538 = _536 + 1;
    int _540 = _512 * _508;
    bool _542 = _267 == 0;
    bool _544 = !_524;
    int _546 = _544 ? 0 : 1;
    int _548 = _267 * _538;
    int _550 = _548 + _301;
    int _552 = _245 + (-1);
    float _554 = trunc(_486);
    int _556 = int(_554);
    int _558 = abs(_546);
    bool _560 = !_542;
    int _562 = _560 ? _550 : (-1);
    int _564 = _438 * _552;
    int _566 = _564 + _540;
    int _568 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _570 = _568 != 0;
    float _572 = trunc(_492);
    int _574 = int(_572);
    int _576 = ~_532;
    int _578 = _576 + 1;
    int _580 = _578 + 1;
    bool _582 = !_570;
    int _584 = _582 ? 0 : 1;
    int _586 = _566 * _558;
    int _588 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _590 = _588 != 0;
    int _592 = _562 * _580;
    bool _594 = !_520;
    int _596 = _594 ? 0 : 1;
    int _598 = abs(_584);
    int _600 = abs(_596);
    bool _602 = !_528;
    int _604 = _602 ? 0 : 1;
    int _606 = _556 * _598;
    int _608 = _606 + _301;
    int _610 = _267 + (-1);
    int _612 = _500 * _600;
    int _614 = _612 + _586;
    bool _616 = !_590;
    int _618 = _616 ? 0 : 1;
    int _620 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _622 = _620 != 0;
    int _624 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _626 = _624 != 0;
    int _628 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _630 = _628 != 0;
    int _632 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _634 = _632 != 0;
    int _636 = _532 * _610;
    int _638 = _636 + _592;
    int _640 = abs(_604);
    int _642 = abs(_618);
    bool _644 = !_626;
    int _646 = _644 ? 0 : 1;
    int _648 = abs(_646);
    bool _650 = !_622;
    int _652 = _650 ? 0 : 1;
    int _654 = _516 * _640;
    int _656 = _654 + _614;
    bool _658 = !_630;
    int _660 = _658 ? 0 : 1;
    int _662 = _458 * _642;
    int _664 = _662 + _656;
    bool _666 = !_634;
    int _668 = _666 ? 0 : 1;
    int _670 = abs(_660);
    int _672 = _638 * _648;
    int _674 = abs(_668);
    float _676 = float(uint(_664));
    int _678 = abs(_652);
    float _680 = as_type<float>(_297) * _676;
    int _682 = ~_245;
    int _684 = _682 + 1;
    int _686 = _574 * _678;
    int _688 = _686 + _672;
    int _690 = ~_267;
    int _692 = _690 + 1;
    float _694 = trunc(_680);
    float _696 = precise::max(_694, 0.0);
    uint _698 = uint(_696);
    int _700 = _608 * _670;
    int _702 = _700 + _688;
    float _704 = float(uint(_608));
    bool _706 = _245 == 0;
    int _708 = _556 * _674;
    int _710 = _708 + _702;
    int _712 = ~_245;
    int _714 = _712 + 1;
    float _716 = as_type<float>(_307) * _704;
    bool _718 = _267 == 0;
    float _720 = float(uint(_710));
    float _722 = trunc(_716);
    float _724 = precise::max(_722, 0.0);
    uint _726 = uint(_724);
    int _728 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _730 = _728 != 0;
    float _732 = as_type<float>(_307) * _720;
    int _734 = _714 * int(_698);
    int _736 = _734 + _664;
    float _738 = trunc(_732);
    float _740 = precise::max(_738, 0.0);
    uint _742 = uint(_740);
    float _744 = float(uint(_736));
    if (_730)
    {
        _247 = 0;
    }
    int _746 = _247;
    float _748 = as_type<float>(_297) * _744;
    int _750 = _746;
    if (!_730)
    {
        _750 = 1;
    }
    int _752 = _750;
    float _754 = float(uint(_516));
    float _756 = trunc(_748);
    float _758 = precise::max(_756, 0.0);
    uint _760 = uint(_758);
    float _762 = as_type<float>(_297) * _754;
    int _764 = _692 * int(_742);
    int _766 = _764 + _710;
    int _768 = ~_245;
    int _770 = _768 + 1;
    float _772 = trunc(_762);
    float _774 = precise::max(_772, 0.0);
    uint _776 = uint(_774);
    float _778 = float(uint(_766));
    int _780 = int(_698) + int(_760);
    float _782 = as_type<float>(_307) * _778;
    int _784 = ~_267;
    int _786 = _784 + 1;
    int _788 = _684 * _780;
    int _790 = _788 + _664;
    float _792 = trunc(_782);
    float _794 = precise::max(_792, 0.0);
    uint _796 = uint(_794);
    bool _798 = uint(_790) >= uint(_245);
    bool _800 = !_798;
    int _802 = _800 ? 0 : (-1);
    int _804 = ~_780;
    int _806 = _804 + _802;
    int _808 = _806 + 1;
    int _810 = _770 * int(_776);
    int _812 = _810 + _516;
    int _814 = ~_267;
    int _816 = _814 + 1;
    int _818 = int(_742) + int(_796);
    int _820 = _245 * _808;
    int _822 = _820 + _664;
    float _824 = float(uint(_812));
    bool _826 = !_706;
    int _828 = _826 ? _822 : (-1);
    int _830 = _786 * _818;
    int _832 = _830 + _710;
    float _834 = as_type<float>(_297) * _824;
    bool _836 = uint(_832) >= uint(_267);
    int _838 = _828 & 3;
    bool _840 = _838 != 0;
    int _842 = _816 * int(_726);
    int _844 = _842 + _608;
    int _846 = _828 & 3;
    bool _848 = _846 != 0;
    float _850 = trunc(_834);
    float _852 = precise::max(_850, 0.0);
    uint _854 = uint(_852);
    bool _856 = uint(_838) >= 2u;
    float _858 = float(uint(_844));
    bool _860 = !_836;
    int _862 = _860 ? 0 : (-1);
    int _864 = _848 ? 0 : 1;
    float _866 = as_type<float>(_307) * _858;
    int _868 = _856 ? 0 : 1;
    bool _870 = uint(_838) > 1u;
    bool _872 = _838 != 3;
    float _874 = trunc(_866);
    float _876 = precise::max(_874, 0.0);
    uint _878 = uint(_876);
    int _880 = ~_818;
    int _882 = _880 + _862;
    int _884 = _882 + 1;
    int _886 = ~_864;
    int _888 = _886 + 1;
    int _890 = _888 + 1;
    int _892 = ~_868;
    int _894 = _892 + 1;
    int _896 = _894 + 1;
    int _898 = _267 * _884;
    int _900 = _898 + _710;
    int _902 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _904 = _902 != 0;
    int _906 = int(_776) + int(_854);
    float _908 = _324 * 2.0;
    bool _910 = !_718;
    int _912 = _910 ? _900 : (-1);
    int _914 = _890;
    int _916 = _896;
    float _918 = as_type<float>(_786);
    float _920 = as_type<float>(_906);
    if (!_870)
    {
        int _922 = ~_864;
        int _924 = _922 + 1;
        _914 = _924;
    }
    int _926 = _914;
    float _928 = _322 * 2.0;
    if (_872)
    {
        int _930 = ~_868;
        int _932 = _930 + 1;
        _916 = _932;
    }
    int _934 = _916;
    float _936 = floor(_908);
    int _938 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _940 = _938 != 0;
    int _942 = _912 & 3;
    bool _944 = _942 != 0;
    bool _946 = !_940;
    int _948 = _946 ? 0 : 1;
    int _950 = _912 & 3;
    bool _952 = _950 != 0;
    float _954 = floor(_928);
    bool _956 = uint(_942) > 1u;
    bool _958 = !_904;
    int _960 = _958 ? 0 : 1;
    bool _962 = _942 != 3;
    int _964 = ~_245;
    int _966 = _964 + 1;
    int _968 = _952 ? 0 : 1;
    bool _970 = uint(_942) >= 2u;
    int _972 = _966 * _906;
    int _974 = _972 + _516;
    int _976 = ~_968;
    int _978 = _976 + 1;
    int _980 = _978 + 1;
    int _982 = _970 ? 0 : 1;
    int _984 = _980;
    float _986 = as_type<float>(_974);
    if (!_956)
    {
        int _988 = ~_968;
        int _990 = _988 + 1;
        _984 = _990;
    }
    int _992 = _984;
    int _994 = ~_982;
    int _996 = _994 + 1;
    int _998 = _996 + 1;
    bool _1000 = _752 != 1;
    bool _1002 = uint(_974) >= uint(_245);
    int _1004 = _998;
    if (_962)
    {
        int _1006 = ~_982;
        int _1008 = _1006 + 1;
        _1004 = _1008;
    }
    int _1010 = _1004;
    bool _1012 = _954 > 0.0;
    bool _1014 = !_1002;
    int _1016 = _1014 ? 0 : (-1);
    int _1018 = ~_267;
    int _1020 = _1018 + 1;
    bool _1022 = _954 >= 0.0;
    bool _1024 = isnan(_954);
    bool _1026 = _1022 || _1024;
    bool _1028 = isnan(0.0);
    bool _1030 = _1026 || _1028;
    int _1032 = int(_726) + int(_878);
    int _1034 = _1030 ? 0 : 1;
    int _1036 = ~_906;
    int _1038 = _1036 + _1016;
    int _1040 = _1038 + 1;
    int _1042 = _1020 * _1032;
    int _1044 = _1042 + _608;
    if (!_1000)
    {
        _918 = _324;
    }
    float _1046 = _918;
    float _1048 = _1046;
    if (!_1000)
    {
        _986 = _324;
    }
    float _1050 = _986;
    int _1052 = _245 * _1040;
    int _1054 = _1052 + _516;
    float _1056 = 0.0;
    float _1058 = _1050;
    if (!_1000)
    {
        _1056 = _326;
    }
    float _1060 = _1056;
    float _1062 = _1060;
    if (!_1000)
    {
        _920 = _326;
    }
    float _1064 = _920;
    int _1066 = ~_1034;
    int _1068 = _1066 + 1;
    int _1070 = _1068 + 1;
    float _1072 = _1064;
    int _1074 = _1070;
    if (_1000)
    {
        _1048 = _322;
    }
    float _1076 = _1048;
    if (_1000)
    {
        _1058 = _322;
    }
    float _1078 = _1058;
    if (_1000)
    {
        _1062 = _324;
    }
    float _1080 = _1062;
    if (_1000)
    {
        _1072 = _324;
    }
    float _1082 = _1072;
    if (!_1012)
    {
        int _1084 = ~_1034;
        int _1086 = _1084 + 1;
        _1074 = _1086;
    }
    int _1088 = _1074;
    float _1090 = _324 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1092 = _936 >= 0.0;
    bool _1094 = isnan(_936);
    bool _1096 = _1092 || _1094;
    bool _1098 = isnan(0.0);
    bool _1100 = _1096 || _1098;
    bool _1102 = uint(_1044) >= uint(_267);
    int _1104 = _1100 ? 0 : 1;
    bool _1106 = !_1102;
    int _1108 = _1106 ? 0 : (-1);
    bool _1110 = _936 > 0.0;
    bool _1112 = _328 > 0.5;
    bool _1114 = _838 != 3;
    bool _1116 = !_706;
    int _1118 = _1116 ? _1054 : (-1);
    bool _1120 = !_944;
    int _1122 = _1120 ? 0 : 1;
    bool _1124 = !_840;
    int _1126 = _1124 ? 0 : 1;
    int _1128 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1130 = _1128 != 0;
    int _1132 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1134 = _1132 != 0;
    int _1136 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1138 = _1136 != 0;
    int _1140 = ~_1104;
    int _1142 = _1140 + 1;
    int _1144 = _1142 + 1;
    float _1146 = _326 * 2.0;
    int _1148 = _1144;
    if (!_1110)
    {
        int _1150 = ~_1104;
        int _1152 = _1150 + 1;
        _1148 = _1152;
    }
    int _1154 = _1148;
    float _1156 = in.m_58.x;
    float _1158 = in.m_58.y;
    float _1160 = in.m_58.z;
    float _1162 = floor(_1146);
    bool _1164 = _942 != 3;
    float _1166 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1168 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _1166;
    float _1170 = 1.0 / _1168;
    int _1172 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1174 = _1172 != 0;
    float _1176 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1178 = _322 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1180 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1182 = -_1176;
    float _1184 = fma(_1178, 2.0, _1182);
    float _1186 = fma(_1090, -2.0, _1180);
    bool _1188 = !_1130;
    int _1190 = _1188 ? 0 : 1;
    float _1192 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _1194 = _1162 >= 0.0;
    bool _1196 = isnan(_1162);
    bool _1198 = _1194 || _1196;
    bool _1200 = isnan(0.0);
    bool _1202 = _1198 || _1200;
    float _1204 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1186);
    float _1206 = _1158 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1208 = _1158 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _1210 = _1202 ? 0 : 1;
    float _1212 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _1214 = _1162 > 0.0;
    float _1216 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1218 = _322 + _324;
    float _1220 = _1158 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1222 = _1212 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1224 = _1192 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1226 = _1216 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1228 = _229 * _1170;
    float _1230 = _1218 + (-1.0);
    float _1232 = fma(_1156, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1206);
    float _1234 = fma(_1156, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1208);
    float _1236 = fma(_1156, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1220);
    float _1238 = _326 + _322;
    float _1240 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1242 = log2(_1240);
    float _1244 = _326 + _324;
    out.m_70.x = _1222;
    out.m_70.y = _1224;
    out.m_70.z = _1226;
    float _1246 = fma(_1230, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1248 = ~_1210;
    int _1250 = _1248 + 1;
    int _1252 = _1250 + 1;
    int _1254 = _1252;
    if (!_1214)
    {
        int _1256 = ~_1210;
        int _1258 = _1256 + 1;
        _1254 = _1258;
    }
    int _1260 = _1254;
    float _1262 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _1264 = !_1134;
    int _1266 = _1264 ? 0 : 1;
    int _1268 = abs(_1190);
    float _1270 = _1238 + (-1.0);
    float _1272 = _1244 + (-1.0);
    float _1274 = _1242 * _149;
    float _1276 = fma(_1270, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1278 = fma(_1272, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1280 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1282 = _1080 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1284 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1286 = fma(_1078, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1280);
    float _1288 = _1076 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1290 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1292 = fma(_1082, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1284);
    float _1294 = exp2(_1274);
    float _1296 = -_1262;
    float _1298 = fma(_1288, 2.0, _1296);
    float _1300 = fma(_1282, -2.0, _1290);
    float _1302 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1304 = 1.0 + _1302;
    float _1306 = in.m_72.x;
    float _1308 = in.m_72.y;
    float _1310 = in.m_72.z;
    int _1312 = abs(_1266);
    float _1314 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1316 = float(_1088);
    float _1318 = 1.0 / _1304;
    float _1320 = float(_1268);
    float _1322 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[77].z, _378);
    float _1324 = float(_1260);
    bool _1326 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1328 = isnan(0.0);
    bool _1330 = _1326 || _1328;
    bool _1332 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1334 = _1330 || _1332;
    float _1336 = -_1294;
    float _1338 = _1336 + 1.0;
    float _1340 = _1320 * _1324;
    float _1342 = -_149;
    float _1344 = fma(_1342, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1184);
    float _1346 = float(_1312);
    float _1348 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1314);
    float _1350 = _1334 ? _1338 : 0.0;
    float _1352 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1286);
    bool _1354 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1356 = isnan(1.0);
    bool _1358 = _1354 || _1356;
    bool _1360 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1362 = _1358 || _1360;
    float _1364 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1300);
    float _1366 = _1340 * (-2.0);
    bool _1368 = !_1138;
    int _1370 = _1368 ? 0 : 1;
    float _1372 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1348);
    float _1374 = _1346 * _1316;
    float _1376 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1292);
    float _1378 = fma(_1366, _1306, _1306);
    int _1380 = abs(_1370);
    float _1382 = -_149;
    float _1384 = fma(_1382, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1298);
    int _1386 = ~_1032;
    int _1388 = _1386 + _1108;
    int _1390 = _1388 + 1;
    float _1392 = _1374 * (-2.0);
    float _1394 = fma(_1246, _1366, _1246);
    if (_1362)
    {
        float _1396 = _1350 * _1318;
        _153 = _1396;
    }
    float _1398 = _153;
    int _1400 = _267 * _1390;
    int _1402 = _1400 + _608;
    bool _1404 = _322 > 0.5;
    float _1406 = fma(_1278, _1392, _1278);
    bool _1408 = _267 == 0;
    float _1410 = _322 + (-0.5);
    float _1412 = fma(_1392, _1308, _1308);
    float _1414 = fma(_1410, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1378);
    float _1416 = float(_1154);
    float _1418 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1420 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1418;
    float _1422 = float(_1380);
    float _1424 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1426 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1424;
    bool _1428 = _221 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _1430 = isnan(_221);
    bool _1432 = _1428 || _1430;
    bool _1434 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _1436 = _1432 || _1434;
    float _1438 = float(_1436);
    float _1440 = fma(_1420, _1228, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _1442 = !_1408;
    int _1444 = _1442 ? _1402 : (-1);
    float _1446 = _1422 * _1416;
    bool _1448 = _324 > 0.5;
    float _1450 = _324 + (-0.5);
    bool _1452 = _221 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1454 = isnan(_221);
    bool _1456 = _1452 || _1454;
    bool _1458 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1460 = _1456 || _1458;
    float _1462 = float(_1460);
    float _1464 = -_1438;
    float _1466 = _1464 + 1.0;
    float _1468 = fma(_1394, _1398, _1414);
    float _1470 = fma(_1426, _1228, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _1472 = _1446 * (-2.0);
    float _1474 = fma(_1450, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1412);
    float _1476 = _1462 * _1466;
    float _1478 = in.m_74.x;
    float _1480 = in.m_74.y;
    float _1482 = fma(_1472, _1310, _1310);
    float _1484 = _326 + (-0.5);
    float _1486 = _1440 * _1476;
    float _1488 = -_1462;
    float _1490 = _1488 + 1.0;
    float _1492 = _1470 * _1476;
    float _1494 = fma(_1276, _1472, _1276);
    float _1496 = fma(_1484, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1482);
    float _1498 = fma(_1490, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1486);
    float _1500 = fma(_1490, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1492);
    float _1502 = fma(_1406, _1398, _1474);
    float _1504 = fma(_1160, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1234);
    float _1506 = fma(_1494, _1398, _1496);
    float _1508 = fma(_1438, (*spvDescriptorSet0.vp_c9)._m0[144].x, _1498);
    float _1510 = fma(_1438, (*spvDescriptorSet0.vp_c9)._m0[144].y, _1500);
    int _1512 = _912 >> 31;
    float _1514 = _1506 * 0.15915493667125701904296875;
    int _1516 = _828 >> 31;
    float _1518 = _1468 * 0.15915493667125701904296875;
    int _1520 = _1512 & 3;
    float _1522 = fma(_1160, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1232);
    float _1524 = fma(_1160, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1236);
    int _1526 = _1516 & 3;
    float _1528 = _1502 * 0.15915493667125701904296875;
    int _1530 = _912 + _1520;
    float _1532 = _1508 * _1478;
    int _1534 = _828 + _1526;
    float _1536 = _1518 * 6.283185482025146484375;
    float _1538 = sin(_1536);
    int _1540 = _1530 >> 2;
    float _1542 = _1510 * _1480;
    float _1544 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _187);
    int _1546 = _1534 >> 2;
    float _1548 = _1532 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1550 = _1540 << 4;
    int _1552 = _1550 + 512;
    float _1554 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _191);
    float _1556 = _1518 * 6.283185482025146484375;
    float _1558 = cos(_1556);
    int _1560 = _1546 << 4;
    int _1562 = _1560 + 368;
    float _1564 = _1548 * _1544;
    int _1566 = abs(_926);
    uint _1568 = uint(int(uint(_1562) >> uint(2)));
    uint _1570 = uint(int(uint(int(_1568)) >> uint(2)));
    int _1572 = int(_1568) & 3;
    float _1574 = (*spvDescriptorSet0.vp_c9)._m0[int(_1570)][_1572];
    int _1576 = int(_1568) + 1;
    uint _1578 = uint(int(uint(_1576) >> uint(2)));
    int _1580 = _1576 & 3;
    float _1582 = (*spvDescriptorSet0.vp_c9)._m0[int(_1578)][_1580];
    int _1584 = abs(_1122);
    float _1586 = _1528 * 6.283185482025146484375;
    float _1588 = sin(_1586);
    int _1590 = abs(_934);
    bool _1592 = !_1114;
    int _1594 = _1592 ? 0 : (-1);
    bool _1596 = !_1164;
    int _1598 = _1596 ? 0 : (-1);
    int _1600 = abs(_1594);
    float _1602 = _1528 * 6.283185482025146484375;
    float _1604 = cos(_1602);
    int _1606 = abs(_1598);
    int _1608 = abs(_948);
    int _1610 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1612 = _1610 != 0;
    int _1614 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1616 = _1614 != 0;
    float _1618 = _1514 * 6.283185482025146484375;
    float _1620 = sin(_1618);
    float _1622 = _1542 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1624 = _1558 * _1588;
    uint _1626 = uint(int(uint(_1552) >> uint(2)));
    uint _1628 = uint(int(uint(int(_1626)) >> uint(2)));
    int _1630 = int(_1626) & 3;
    float _1632 = (*spvDescriptorSet0.vp_c9)._m0[int(_1628)][_1630];
    int _1634 = int(_1626) + 1;
    uint _1636 = uint(int(uint(_1634) >> uint(2)));
    int _1638 = _1634 & 3;
    float _1640 = (*spvDescriptorSet0.vp_c9)._m0[int(_1636)][_1638];
    float _1642 = _1538 * _1588;
    float _1644 = _1622 * _1554;
    float _1646 = _1514 * 6.283185482025146484375;
    float _1648 = cos(_1646);
    float _1650 = _1538 * _1604;
    float _1652 = _1558 * _1604;
    float _1654 = fma(_1620, _1652, _1642);
    float _1656 = -_1624;
    float _1658 = fma(_1620, _1650, _1656);
    float _1660 = -_1650;
    float _1662 = fma(_1620, _1624, _1660);
    float _1664 = -_1644;
    float _1666 = _1620 * _1664;
    int _1668 = _1552 + 8;
    uint _1670 = uint(int(uint(_1668) >> uint(2)));
    uint _1672 = uint(int(uint(int(_1670)) >> uint(2)));
    int _1674 = int(_1670) & 3;
    float _1676 = (*spvDescriptorSet0.vp_c9)._m0[int(_1672)][_1674];
    int _1678 = int(_1670) + 1;
    uint _1680 = uint(int(uint(_1678) >> uint(2)));
    int _1682 = _1678 & 3;
    float _1684 = (*spvDescriptorSet0.vp_c9)._m0[int(_1680)][_1682];
    float _1686 = fma(_1620, _1642, _1652);
    float _1688 = _1538 * _1648;
    float _1690 = _1604 * _1648;
    float _1692 = _1558 * _1648;
    float _1694 = _1588 * _1648;
    float _1696 = _1688 * _1644;
    int _1698 = _1562 + 8;
    uint _1700 = uint(int(uint(_1698) >> uint(2)));
    uint _1702 = uint(int(uint(int(_1700)) >> uint(2)));
    int _1704 = int(_1700) & 3;
    float _1706 = (*spvDescriptorSet0.vp_c9)._m0[int(_1702)][_1704];
    int _1708 = int(_1700) + 1;
    uint _1710 = uint(int(uint(_1708) >> uint(2)));
    int _1712 = _1708 & 3;
    float _1714 = (*spvDescriptorSet0.vp_c9)._m0[int(_1710)][_1712];
    float _1716 = _1692 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1718 = _1692 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1720 = _1692 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1722 = _1692 * _1644;
    float _1724 = -_1620;
    float _1726 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1716);
    float _1728 = -_1620;
    float _1730 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1718);
    float _1732 = -_1620;
    float _1734 = fma(_1732, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1720);
    float _1736 = fma(_1690, _1564, _1666);
    float _1738 = fma(_1654, _1564, _1722);
    float _1740 = fma(_1658, _1564, _1696);
    float _1742 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1726);
    float _1744 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1730);
    float _1746 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1734);
    int _1748 = abs(_992);
    float _1750 = _1654 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1752 = _1654 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1754 = _1654 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1756 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1750);
    int _1758 = ~_1748;
    int _1760 = _1758 + 1;
    int _1762 = _1760 + 1;
    float _1764 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1752);
    int _1766 = ~_1566;
    int _1768 = _1766 + 1;
    int _1770 = _1768 + 1;
    int _1772 = abs(_1126);
    int _1774 = _1762 * as_type<int>(_1640);
    int _1776 = _1770 * as_type<int>(_1582);
    int _1778 = ~_1772;
    int _1780 = _1778 + 1;
    int _1782 = _1780 + 1;
    float _1784 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1754);
    int _1786 = abs(_1010);
    int _1788 = ~_1584;
    int _1790 = _1788 + 1;
    int _1792 = _1790 + 1;
    int _1794 = _1782 * as_type<int>(_1574);
    int _1796 = _1794 + _1776;
    float _1798 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1800 = int(_1798);
    int _1802 = ~_1786;
    int _1804 = _1802 + 1;
    int _1806 = _1804 + 1;
    int _1808 = _1792 * as_type<int>(_1632);
    int _1810 = _1808 + _1774;
    int _1812 = ~_1590;
    int _1814 = _1812 + 1;
    int _1816 = _1814 + 1;
    int _1818 = _1806 * as_type<int>(_1676);
    int _1820 = _1818 + _1810;
    int _1822 = ~_1600;
    int _1824 = _1822 + 1;
    int _1826 = _1824 + 1;
    int _1828 = ~_1606;
    int _1830 = _1828 + 1;
    int _1832 = _1830 + 1;
    int _1834 = _1816 * as_type<int>(_1706);
    int _1836 = _1834 + _1796;
    int _1838 = abs(_960);
    float _1840 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _1842 = int(_1840);
    int _1844 = _1832 * as_type<int>(_1684);
    int _1846 = _1844 + _1820;
    float _1848 = float(uint(_1800));
    int _1850 = _1826 * as_type<int>(_1714);
    int _1852 = _1850 + _1836;
    float _1854 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    int _1856 = ~_1838;
    int _1858 = _1856 + 1;
    int _1860 = _1858 + 1;
    int _1862 = ~_1608;
    int _1864 = _1862 + 1;
    int _1866 = _1864 + 1;
    float _1868 = fma(_1662, _1854, _1738);
    float _1870 = fma(_1694, _1854, _1736);
    int _1872 = _1846 * _1860;
    float _1874 = 1.0 / _1848;
    int _1876 = _1852 * _1866;
    float _1878 = _1868 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1880 = fma(_1686, _1854, _1740);
    float _1882 = _1868 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1884 = float(uint(_1842));
    float _1886 = fma(_1870, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1878);
    int _1888 = abs(_1842);
    float _1890 = fma(_1870, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1882);
    int _1892 = abs(_1800);
    float _1894 = fma(_1880, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1886);
    float _1896 = 1.0 / _1884;
    float _1898 = fma(_1880, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1890);
    float _1900 = _1522 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1902 = _1894 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    int _1904 = _1118 * _1608;
    int _1906 = _1904 + _1876;
    float _1908 = float(uint(_1892));
    float _1910 = _1524 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1912 = _1898 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1914 = _1662 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1916 = _1662 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1918 = float(uint(_1888));
    float _1920 = _1662 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1922 = _1900 + _1902;
    int _1924 = as_type<int>(_1874) + (-2);
    float _1926 = _1910 + _1912;
    float _1928 = float(uint(_1906));
    float _1930 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1914);
    float _1932 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1916);
    float _1934 = 1.0 / _1908;
    float _1936 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1920);
    int _1938 = _1444 * _1838;
    int _1940 = _1938 + _1872;
    float _1942 = as_type<float>(_1924) * _1928;
    float _1944 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1946 = _1922 + _1944;
    float _1948 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1950 = _1926 + _1948;
    float _1952 = fma(_1686, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1930);
    int _1954 = as_type<int>(_1896) + (-2);
    float _1956 = 1.0 / _1918;
    float _1958 = float(uint(_1940));
    float _1960 = _1946 * _1946;
    float _1962 = _1950 * _1950;
    float _1964 = fma(_1686, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1932);
    int _1966 = abs(_1906);
    float _1968 = fma(_1686, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1936);
    float _1970 = _1960 + _1962;
    float _1972 = trunc(_1942);
    float _1974 = precise::max(_1972, 0.0);
    uint _1976 = uint(_1974);
    float _1978 = as_type<float>(_1954) * _1958;
    float _1980 = _1868 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _1982 = abs(_1940);
    int _1984 = as_type<int>(_1934) + (-2);
    float _1986 = sqrt(_1970);
    float _1988 = float(uint(_1966));
    int _1990 = ~_1800;
    int _1992 = _1990 + 1;
    int _1994 = as_type<int>(_1956) + (-2);
    float _1996 = as_type<float>(_1984) * _1988;
    float _1998 = float(uint(_1982));
    float _2000 = trunc(_1978);
    float _2002 = precise::max(_2000, 0.0);
    uint _2004 = uint(_2002);
    int _2006 = _1992 * int(_1976);
    int _2008 = _2006 + _1906;
    float _2010 = fma(_1870, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1980);
    int _2012 = ~_1842;
    int _2014 = _2012 + 1;
    float _2016 = as_type<float>(_1994) * _1998;
    int _2018 = ~_1892;
    int _2020 = _2018 + 1;
    float _2022 = fma(_1880, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2010);
    float _2024 = float(uint(_2008));
    float _2026 = trunc(_1996);
    float _2028 = precise::max(_2026, 0.0);
    uint _2030 = uint(_2028);
    bool _2032 = _1986 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2034 = _2022 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _2036 = ~_1888;
    int _2038 = _2036 + 1;
    float _2040 = as_type<float>(_1924) * _2024;
    float _2042 = -_191;
    int _2044 = _1112 ? as_type<int>(_2042) : as_type<int>(_191);
    bool _2046 = _326 > 0.5;
    float _2048 = trunc(_2016);
    float _2050 = precise::max(_2048, 0.0);
    uint _2052 = uint(_2050);
    int _2054 = _2014 * int(_2004);
    int _2056 = _2054 + _1940;
    float _2058 = float(uint(_2056));
    float _2060 = _1504 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2062 = trunc(_2040);
    float _2064 = precise::max(_2062, 0.0);
    uint _2066 = uint(_2064);
    float _2068 = _1504;
    float _2070 = _2058;
    float _2072 = _1922;
    float _2074 = _1960;
    float _2076 = _1926;
    int _2078 = as_type<int>(_2060);
    float _2080 = _1900;
    if (!_2032)
    {
        _2068 = _1922;
    }
    float _2082 = _2068;
    float _2084 = as_type<float>(_1954) * _2058;
    float _2086 = _2060 + _2034;
    float _2088 = _2082;
    if (!_2032)
    {
        _2070 = _1962;
    }
    float _2090 = _2070;
    int _2092 = _2020 * int(_2030);
    int _2094 = _2092 + _1966;
    int _2096 = _2038 * int(_2052);
    int _2098 = _2096 + _1982;
    float _2100 = _2090;
    if (!_2032)
    {
        _2072 = _2086;
    }
    float _2102 = _2072;
    float _2104 = float(uint(_2094));
    float _2106 = float(uint(_2098));
    bool _2108 = !_2032;
    float _2110 = _2102;
    if (!_2108)
    {
        float _2112 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2114 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2116 = _1986 + _2114;
        float _2118 = rsqrt(_1970);
        float _2120 = _2116 * _2112;
        float _2122 = _2086 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2124 = _2120 * 0.15915493667125701904296875;
        float _2126 = _2124 * 6.283185482025146484375;
        float _2128 = sin(_2126);
        float _2130 = _2124 * 6.283185482025146484375;
        float _2132 = cos(_2130);
        float _2134 = fma(_2128, _2122, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2136 = _2118 * _2134;
        float _2138 = _2132 + (-1.0);
        float _2140 = fma(_1946, _2136, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2142 = fma(_1950, _2136, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2144 = _2138 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2146 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2148 = _2140 + _2146;
        float _2150 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2152 = _2142 + _2150;
        float _2154 = fma(_2086, _2132, _2144);
        float _2156 = _2148 * _2148;
        float _2158 = _2152 * _2152;
        _2110 = _2154;
        _2074 = _2156;
        _2100 = _2158;
        _2088 = _2140;
        _2076 = _2142;
    }
    float _2160 = _2110;
    float _2162 = _2074;
    float _2164 = _2100;
    float _2166 = _2088;
    float _2168 = _2076;
    float _2170 = as_type<float>(_1984) * _2104;
    float _2172 = trunc(_2084);
    float _2174 = precise::max(_2172, 0.0);
    uint _2176 = uint(_2174);
    float _2178 = fma(_1658, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1756);
    float _2180 = fma(_1658, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1764);
    float _2182 = fma(_1658, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1784);
    float _2184 = -_191;
    int _2186 = _1448 ? as_type<int>(_2184) : as_type<int>(_191);
    float _2188 = as_type<float>(_1994) * _2106;
    int _2190 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2192 = _2190 != 0;
    float _2194 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2196 = _2160 + _2194;
    float _2198 = trunc(_2170);
    float _2200 = precise::max(_2198, 0.0);
    uint _2202 = uint(_2200);
    float _2204 = -_187;
    int _2206 = _1404 ? as_type<int>(_2204) : as_type<int>(_187);
    float _2208 = -_1322;
    float _2210 = _2208 + 1.0;
    float _2212 = -_187;
    int _2214 = _2046 ? as_type<int>(_2212) : as_type<int>(_187);
    float _2216 = fma(_2196, _2196, _2162);
    bool _2218 = !_1612;
    float _2220 = _2218 ? _191 : as_type<float>(_2044);
    float _2222 = -_1352;
    float _2224 = _2222 + 1.0;
    bool _2226 = !_2192;
    float _2228 = _2226 ? _191 : as_type<float>(_2186);
    float _2230 = _191 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _2232 = !_1174;
    float _2234 = _2232 ? _187 : as_type<float>(_2206);
    float _2236 = trunc(_2188);
    float _2238 = precise::max(_2236, 0.0);
    uint _2240 = uint(_2238);
    bool _2242 = !_1616;
    float _2244 = _2242 ? _187 : as_type<float>(_2214);
    float _2246 = _187 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2248 = _2230 * _1742;
    float _2250 = _2230 * _1744;
    float _2252 = _2230 * _1746;
    int _2254 = int(_1976) + int(_2066);
    float _2256 = fma(_2246, _2178, _2248);
    float _2258 = fma(_2246, _2180, _2250);
    float _2260 = fma(_2246, _2182, _2252);
    int _2262 = int(_2004) + int(_2176);
    float _2264 = _2216 + _2164;
    int _2266 = ~_1800;
    int _2268 = _2266 + 1;
    float _2270 = -_1372;
    float _2272 = _2270 + 1.0;
    int _2274 = ~_1892;
    int _2276 = _2274 + 1;
    float _2278 = -_1376;
    float _2280 = _2278 + 1.0;
    int _2282 = ~_1842;
    int _2284 = _2282 + 1;
    int _2286 = _2268 * _2254;
    int _2288 = _2286 + _1906;
    int _2290 = int(_2030) + int(_2202);
    float _2292 = sqrt(_2264);
    out.m_76.x = _2178;
    out.m_76.y = _2180;
    out.m_76.z = _2182;
    int _2294 = ~_1888;
    int _2296 = _2294 + 1;
    int _2298 = int(_2052) + int(_2240);
    int _2300 = _2276 * _2290;
    int _2302 = _2300 + _1966;
    bool _2304 = uint(_2288) >= uint(_1800);
    int _2306 = _2284 * _2262;
    int _2308 = _2306 + _1940;
    float _2310 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2312 = !_2304;
    int _2314 = _2312 ? 0 : (-1);
    bool _2316 = uint(_2302) >= uint(_1892);
    int _2318 = _2296 * _2298;
    int _2320 = _2318 + _1982;
    int _2322 = ~_2254;
    int _2324 = _2322 + _2314;
    int _2326 = _2324 + 1;
    int _2328 = _1906 ^ _1800;
    float _2330 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2332 = uint(_2308) >= uint(_1842);
    bool _2334 = uint(_2320) >= uint(_1888);
    int _2336 = _1800 * _2326;
    int _2338 = _2336 + _1906;
    bool _2340 = !_2316;
    int _2342 = _2340 ? 0 : (-1);
    uint _2344 = uint(int(uint(_2328) >> uint(31)));
    float _2346 = _2310 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2348 = !_2332;
    int _2350 = _2348 ? 0 : (-1);
    bool _2352 = _1800 == 0;
    bool _2354 = _1800 == 0;
    int _2356 = _1940 ^ _1842;
    float _2358 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _2360 = ~_2342;
    int _2362 = _2290 + _2360;
    int _2364 = _2362 + 1;
    int _2366 = ~int(_2344);
    int _2368 = _2366 + 1;
    int _2370 = ~_2262;
    int _2372 = _2370 + _2350;
    int _2374 = _2372 + 1;
    bool _2376 = !_2352;
    int _2378 = _2376 ? _2338 : (-1);
    bool _2380 = !_2334;
    int _2382 = _2380 ? 0 : (-1);
    int _2384 = _1842 * _2374;
    int _2386 = _2384 + _1940;
    uint _2388 = uint(int(uint(_2356) >> uint(31)));
    float _2390 = fma(_2230, _2230, 1.0);
    int _2392 = _2364 ^ _2368;
    float _2394 = float(_2378);
    int _2396 = ~_2382;
    int _2398 = _2298 + _2396;
    int _2400 = _2398 + 1;
    int _2402 = ~int(_2388);
    int _2404 = _2402 + 1;
    int _2406 = ~_2368;
    int _2408 = _2406 + _2392;
    int _2410 = _2408 + 1;
    float _2412 = fma(_2346, _2394, _1344);
    bool _2414 = _1842 == 0;
    float _2416 = rsqrt(_2390);
    bool _2418 = _1842 == 0;
    int _2420 = _2400 ^ _2404;
    bool _2422 = !_2354;
    int _2424 = _2422 ? _2410 : (-1);
    float _2426 = _2358 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _2428 = !_2414;
    int _2430 = _2428 ? _2386 : (-1);
    float _2432 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2434 = ~_2404;
    int _2436 = _2434 + _2420;
    int _2438 = _2436 + 1;
    float _2440 = _2330 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2442 = float(_2424);
    float _2444 = float(_2430);
    float _2446 = _2234 + 0.5;
    bool _2448 = !_2418;
    int _2450 = _2448 ? _2438 : (-1);
    float _2452 = -_1204;
    float _2454 = fma(_2440, _2442, _2452);
    float _2456 = _2244 + 0.5;
    float _2458 = fma(_2426, _2444, _1384);
    float _2460 = fma(_2346, _2446, _2412);
    float _2462 = float(_2450);
    float _2464 = _2228 + (-0.5);
    float _2466 = fma(_2426, _2456, _2458);
    float _2468 = _2230 * _2416;
    float _2470 = _2432 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2472 = -_2440;
    float _2474 = fma(_2472, _2464, _2454);
    float _2476 = _2220 + (-0.5);
    float _2478 = -_1952;
    float _2480 = _2468 * _2478;
    float _2482 = -_1364;
    float _2484 = fma(_2470, _2462, _2482);
    float _2486 = -_1964;
    float _2488 = _2468 * _2486;
    float _2490 = -_1968;
    float _2492 = _2468 * _2490;
    float _2494 = _1952 + _2256;
    float _2496 = -_2470;
    float _2498 = fma(_2496, _2476, _2484);
    float _2500 = fma(_2416, _1742, _2480);
    float _2502 = fma(_2416, _1744, _2488);
    float _2504 = fma(_2416, _1746, _2492);
    float _2506 = -_2210;
    float _2508 = fma(_2234, _2506, _2460);
    float _2510 = _1964 + _2258;
    float _2512 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2514 = -_2224;
    float _2516 = fma(_2244, _2514, _2466);
    float _2518 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2520 = fma(_2228, _2272, _2474);
    float _2522 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2524 = _2512 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2526 = _2518 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2528 = fma(_2220, _2280, _2498);
    float _2530 = _2522 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2532 = _1968 + _2260;
    out.m_78.x = _2500;
    out.m_78.y = _2502;
    out.m_78.z = _2504;
    bool _2534 = _2292 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2536 = isnan(_2292);
    bool _2538 = _2534 || _2536;
    bool _2540 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2542 = _2538 || _2540;
    out.m_80.x = _2524;
    out.m_80.y = _2526;
    out.m_80.z = _2530;
    out.m_82.x = _2508;
    out.m_82.y = _2520;
    out.m_82.z = _2516;
    out.m_82.w = _2528;
    out.m_84.x = _2494;
    out.m_84.y = _2510;
    out.m_84.z = _2532;
    float _2544 = _2224;
    float _2546 = as_type<float>(_2262);
    if (!_2542)
    {
        _2544 = 1.0;
    }
    float _2548 = _2544;
    bool _2550 = !_2542;
    float _2552 = _2548;
    if (!_2550)
    {
        bool _2554 = _2292 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2556 = isnan(_2292);
        bool _2558 = _2554 || _2556;
        bool _2560 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2562 = _2558 || _2560;
        if (!_2562)
        {
            float _2564 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2566 = _2292 + _2564;
            float _2568 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2570 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2568;
            float _2572 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2574 = _2572 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2576 = 1.0 / _2570;
            float _2578 = _2566 * _2576;
            float _2580 = fma(_2578, _2574, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2552 = _2580;
            _2582 = true;
        }
        else
        {
            bool _2584 = _2292 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2586 = isnan(_2292);
            bool _2588 = _2584 || _2586;
            bool _2590 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2592 = _2588 || _2590;
            if (!_2592)
            {
                float _2594 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2596 = _2292 + _2594;
                float _2598 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2600 = _2598 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2602 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2604 = _2602 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2606 = 1.0 / _2600;
                float _2608 = _2596 * _2606;
                float _2610 = fma(_2608, _2604, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2552 = _2610;
                _2582 = true;
            }
            else
            {
                _2552 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2582 = false;
    float _2612 = _2552;
    float _2614 = fma(_1900, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2616 = fma(_1910, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2618 = floor(_2614);
    float _2620 = floor(_2616);
    float _2622 = -_2618;
    float _2624 = _2614 + _2622;
    float _2626 = -_2620;
    float _2628 = _2616 + _2626;
    float2 _7931 = float2(_2624, _2628);
    float _2630 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7931, float2(0.0), isnan(_7931)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7931, float2(0.0), isnan(_7931)), level(0.0)).x;
    float _2632 = _2060 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2634 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2636 = _2166 + _2634;
    float _2638 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2640 = _2168 + _2638;
    float _2642 = fma(_1900, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2632);
    float _2644 = fma(_2636, _2612, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2646 = fma(_2640, _2612, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2648 = fma(_1910, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2642);
    float _2650 = _2060 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2652 = _2648 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2654 = fma(_1900, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2650);
    float _2656 = 1.0 / _2652;
    float _2658 = fma(_1910, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2654);
    float _2660 = _2658 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2662 = _2660 + _2652;
    float _2664 = _2662 * _2656;
    float _2666 = _2664 * 0.5;
    float _2668 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2670 = fma(_2666, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2668);
    float _2672 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _2674 = _2060 + _2672;
    float _2676 = 1.0 / _2670;
    float _2678 = _2674 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _2680 = _2674 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _2682 = fma(_1900, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2678);
    float _2684 = fma(_1900, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2680);
    float _2686 = fma(_1910, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2682);
    float _2688 = fma(_1910, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2684);
    float _2690 = _2686 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _2692 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2694 = _2676 * _2692;
    float _2696 = _2688 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _2698 = trunc(_2690);
    int _2700 = int(_2698);
    bool _2702 = _2694 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _2704 = _2694 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _2706 = !_2702;
    int _2708 = _2706 ? 0 : 1;
    int _2710 = 2;
    float _2712 = _2686;
    if (!_2702)
    {
        _2710 = 1;
    }
    int _2714 = _2710;
    int _2716 = _2714;
    if (!_2704)
    {
        _2716 = _2708;
    }
    int _2718 = _2716;
    float _2720 = trunc(_2696);
    int _2722 = int(_2720);
    int _2724 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2726 = _2700 + _2724;
    int _2728 = _2726 + 1;
    int _2730 = _2718 << 6;
    bool _2732 = _2728 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _2734 = _2730 + 48;
    uint _2736 = uint(int(uint(_2734) >> uint(2)));
    uint _2738 = uint(int(uint(int(_2736)) >> uint(2)));
    int _2740 = int(_2736) & 3;
    float _2742 = (*spvDescriptorSet0.vp_c15)._m0[int(_2738)][_2740];
    int _2744 = int(_2736) + 1;
    uint _2746 = uint(int(uint(_2744) >> uint(2)));
    int _2748 = _2744 & 3;
    float _2750 = (*spvDescriptorSet0.vp_c15)._m0[int(_2746)][_2748];
    int _2752 = _2730 + 56;
    uint _2754 = uint(int(uint(_2752) >> uint(2)));
    uint _2756 = uint(int(uint(int(_2754)) >> uint(2)));
    int _2758 = int(_2754) & 3;
    float _2760 = (*spvDescriptorSet0.vp_c15)._m0[int(_2756)][_2758];
    int _2762 = int(_2754) + 1;
    uint _2764 = uint(int(uint(_2762) >> uint(2)));
    int _2766 = _2762 & 3;
    float _2768 = (*spvDescriptorSet0.vp_c15)._m0[int(_2764)][_2766];
    int _2770 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _2772 = _2722 + _2770;
    int _2774 = _2772 + 1;
    int _2776 = _2728 | _2774;
    int _2778 = _2730 + 64;
    uint _2780 = uint(int(uint(_2778) >> uint(2)));
    uint _2782 = uint(int(uint(int(_2780)) >> uint(2)));
    int _2784 = int(_2780) & 3;
    float _2786 = (*spvDescriptorSet0.vp_c15)._m0[int(_2782)][_2784];
    int _2788 = int(_2780) + 1;
    uint _2790 = uint(int(uint(_2788) >> uint(2)));
    int _2792 = _2788 & 3;
    float _2794 = (*spvDescriptorSet0.vp_c15)._m0[int(_2790)][_2792];
    bool _2796 = _2776 < 0;
    bool _2798 = _2796 || _2732;
    bool _2800 = _2774 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _2802 = _2800 || _2798;
    bool _2804 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2806 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2808 = _2804 || _2806;
    bool _2810 = isnan(0.5);
    bool _2812 = _2808 || _2810;
    int _2814 = _2730 + 72;
    uint _2816 = uint(int(uint(_2814) >> uint(2)));
    uint _2818 = uint(int(uint(int(_2816)) >> uint(2)));
    int _2820 = int(_2816) & 3;
    float _2822 = (*spvDescriptorSet0.vp_c15)._m0[int(_2818)][_2820];
    int _2824 = int(_2816) + 1;
    uint _2826 = uint(int(uint(_2824) >> uint(2)));
    int _2828 = _2824 & 3;
    float _2830 = (*spvDescriptorSet0.vp_c15)._m0[int(_2826)][_2828];
    float _2832 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2834 = _2160 + _2832;
    float _2836 = fma(_2834, _2612, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    int _2838 = _2730 + 96;
    uint _2840 = uint(int(uint(_2838) >> uint(2)));
    uint _2842 = uint(int(uint(int(_2840)) >> uint(2)));
    int _2844 = int(_2840) & 3;
    float _2846 = (*spvDescriptorSet0.vp_c15)._m0[int(_2842)][_2844];
    int _2848 = int(_2840) + 1;
    uint _2850 = uint(int(uint(_2848) >> uint(2)));
    int _2852 = _2848 & 3;
    float _2854 = (*spvDescriptorSet0.vp_c15)._m0[int(_2850)][_2852];
    int _2856 = _2728;
    float _2858 = _2834;
    float _2860 = as_type<float>(_2774);
    float _2862 = as_type<float>(_2718);
    if (!_2802)
    {
        int _2864 = _2774 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _2866 = _2864 + _2728;
        _2856 = _2866;
    }
    int _2868 = _2856;
    if (_2812)
    {
        _2858 = _2644;
    }
    float _2870 = _2858;
    float _2872 = _2870;
    if (_2812)
    {
        _2860 = _2836;
    }
    float _2874 = _2860;
    int _2876 = _2730 + 104;
    uint _2878 = uint(int(uint(_2876) >> uint(2)));
    uint _2880 = uint(int(uint(int(_2878)) >> uint(2)));
    int _2882 = int(_2878) & 3;
    float _2884 = (*spvDescriptorSet0.vp_c15)._m0[int(_2880)][_2882];
    int _2886 = int(_2878) + 1;
    uint _2888 = uint(int(uint(_2886) >> uint(2)));
    int _2890 = _2886 & 3;
    float _2892 = (*spvDescriptorSet0.vp_c15)._m0[int(_2888)][_2890];
    float _2894 = _2874;
    if (_2812)
    {
        _2712 = _2646;
    }
    float _2896 = _2712;
    float _2898 = _2896;
    int _2900 = as_type<int>(_2854);
    if (!_2812)
    {
        float _2902 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2904 = _2060 + _2902;
        float _2906 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2908 = _1900 + _2906;
        float _2910 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2912 = _2904 * _2904;
        float _2914 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2916 = _1910 + _2914;
        float _2918 = fma(_2908, _2908, _2912);
        float _2920 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2922 = fma(_2916, _2916, _2918);
        float _2924 = sqrt(_2922);
        float _2926 = _2910 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2928 = -_1910;
        float _2930 = _2928 + _2646;
        float _2932 = precise::min(_2924, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2934 = _2932 * _2920;
        float _2936 = -_2060;
        float _2938 = _2936 + _2836;
        float _2940 = _2926 * _2934;
        float _2942 = -_1900;
        float _2944 = _2942 + _2644;
        float _2946 = fma(_2938, _2940, _2060);
        float _2948 = fma(_2944, _2940, _1900);
        float _2950 = fma(_2930, _2940, _1910);
        _2894 = _2946;
        _2872 = _2948;
        _2898 = _2950;
    }
    float _2952 = _2894;
    float _2954 = _2872;
    float _2956 = _2898;
    float _2958 = _2674 * _2854;
    int _2960 = as_type<int>(_2958);
    if (!_2802)
    {
        int _2962 = _2868 << 2;
        _2078 = _2962;
    }
    int _2964 = _2078;
    float _2966 = _2952 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2968 = as_type<float>(_2964);
    if (!_2802)
    {
        uint _2970 = uint(int(uint(_2868) >> uint(2)));
        _2900 = int(_2970);
    }
    int _2972 = _2900;
    float _2974 = fma(_1900, _2846, _2958);
    if (!_2802)
    {
        int _2976 = 12 & _2964;
        _2960 = _2976;
    }
    int _2978 = _2960;
    float _2980 = fma(_2954, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2966);
    float _2982 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2984 = fma(_1910, _2884, _2974);
    if (!_2802)
    {
        int _2986 = _2972 << 4;
        int _2988 = _2986 + _2978;
        _2968 = as_type<float>(_2988);
    }
    float _2990 = _2968;
    float _2992 = fma(_2956, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2980);
    int _2994 = _2730 + 80;
    uint _2996 = uint(int(uint(_2994) >> uint(2)));
    uint _2998 = uint(int(uint(int(_2996)) >> uint(2)));
    int _3000 = int(_2996) & 3;
    float _3002 = (*spvDescriptorSet0.vp_c15)._m0[int(_2998)][_3000];
    int _3004 = int(_2996) + 1;
    uint _3006 = uint(int(uint(_3004) >> uint(2)));
    int _3008 = _3004 & 3;
    float _3010 = (*spvDescriptorSet0.vp_c15)._m0[int(_3006)][_3008];
    float _3012 = _2984 + _2892;
    float _3014 = _2674 * _2750;
    float _3016 = _2674 * _2794;
    float _3018 = _2992 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3020 = 1.0 / _3012;
    float _3022 = fma(_1900, _2742, _3014);
    float _3024 = fma(_1900, _2786, _3016);
    float _3026 = _2990;
    if (!_2802)
    {
        int _3028 = as_type<int>(_2990) + 400;
        uint _3030 = uint(int(uint(_3028) >> uint(2)));
        uint _3032 = uint(int(uint(int(_3030)) >> uint(2)));
        int _3034 = int(_3030) & 3;
        float _3036 = (*spvDescriptorSet0.vp_c15)._m0[int(_3032)][_3034];
        _3026 = _3036;
    }
    float _3038 = _3026;
    float _3040 = _3018 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3042 = fma(_1910, _2760, _3022);
    float _3044 = fma(_1910, _2822, _3024);
    float _3046 = _2952 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3048 = -_3040;
    float _3050 = fma(_3048, _2982, 1.0);
    float _3052 = _2952 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3054 = _3042 + _2768;
    int _3056 = _2730 + 88;
    uint _3058 = uint(int(uint(_3056) >> uint(2)));
    uint _3060 = uint(int(uint(int(_3058)) >> uint(2)));
    int _3062 = int(_3058) & 3;
    float _3064 = (*spvDescriptorSet0.vp_c15)._m0[int(_3060)][_3062];
    int _3066 = int(_3058) + 1;
    uint _3068 = uint(int(uint(_3066) >> uint(2)));
    int _3070 = _3066 & 3;
    float _3072 = (*spvDescriptorSet0.vp_c15)._m0[int(_3068)][_3070];
    float _3074 = fma(_2954, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3046);
    float _3076 = fma(_2954, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3052);
    float _3078 = _2952 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3080 = _2646;
    float _3082 = _3076;
    if (!_2802)
    {
        float _3084 = floor(_2696);
        _3080 = _3084;
    }
    float _3086 = _3080;
    float _3088 = _3054 * _3020;
    float _3090 = fma(_2956, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3076);
    float _3092 = _3044 + _2830;
    float _3094 = fma(_2956, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3074);
    float _3096 = fma(_2954, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3078);
    bool _3098 = _3088 >= 0.0;
    float _3100 = _3090 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3102 = _3092 * _3020;
    float _3104 = _3094 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    bool _3106 = _3088 <= 1.0;
    bool _3108 = _3106 && _3098;
    float _3110 = _3100 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3112 = fma(_2956, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3096);
    float _3114 = log2(_3050);
    bool _3116 = _3102 >= 0.0;
    bool _3118 = _3116 && _3108;
    float _3120 = fma(_3104, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3110);
    float _3122 = _3112 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3124 = _3100 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    bool _3126 = _3102 <= 1.0;
    bool _3128 = _3126 && _3118;
    float _3130 = fma(_3018, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3120);
    float _3132 = _3086;
    if (!_2802)
    {
        float _3134 = -_3086;
        float _3136 = _2696 + _3134;
        _3132 = _3136;
    }
    float _3138 = _3132;
    float _3140 = _2982;
    if (!_2802)
    {
        float _3142 = floor(_2690);
        _3140 = _3142;
    }
    float _3144 = _3140;
    float _3146 = fma(_3122, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3130);
    float _3148 = _2674 * _3010;
    float _3150 = 1.0 / _3146;
    float _3152 = _3100 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    if (_3128)
    {
        float _3154 = float(_2718);
        _3082 = _3154;
    }
    float _3156 = _3082;
    float _3158 = fma(_1900, _3002, _3148);
    float _3160 = fma(_3104, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3124);
    float _3162 = fma(_3104, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3152);
    float _3164 = _3114 * 0.693147182464599609375;
    float _3166 = _3038;
    float _3168 = _3156;
    float _3170 = _3162;
    if (!_2802)
    {
        float _3172 = rint(_3038);
        float _3174 = precise::max(_3172, 0.0);
        uint _3176 = uint(_3174);
        uint _3178 = clamp(_3176, 0u, 65535u);
        _3166 = as_type<float>(_3178);
    }
    float _3180 = _3166;
    float _3182 = fma(_3018, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3160);
    float _3184 = fma(_3018, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3162);
    if (!_2802)
    {
        float _3186 = -_3144;
        float _3188 = _2690 + _3186;
        _2862 = _3188;
    }
    float _3190 = _2862;
    float _3192 = fma(_3122, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3184);
    float _3194 = fma(_1910, _3064, _3158);
    float _3196 = _3158;
    if (_3128)
    {
        float _3198 = rint(_3156);
        float _3200 = precise::max(_3198, 0.0);
        uint _3202 = uint(_3200);
        uint _3204 = clamp(_3202, 0u, 65535u);
        _3196 = as_type<float>(_3204);
    }
    float _3206 = _3196;
    float _3208 = _3194 + _3072;
    float _3210 = fma(_3122, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3182);
    float _3212 = _3192 * _3150;
    float _3214 = _3208 * _3020;
    float _3216 = _3210 * _3150;
    float _3218 = _3164 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3220 = fma(_3212, -0.5, 0.5);
    float _3222 = fma(_3216, 0.5, 0.5);
    float _3224 = _3180;
    float _3226 = _3214;
    if (!_2802)
    {
        float3 _8956 = float3(_3190, _3138, float(as_type<int>(_3180)));
        float3 _8960 = select(_8956, float3(0.0), isnan(_8956));
        float _3228 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _8960.xy, uint(rint(_8960.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _8960.xy, uint(rint(_8960.z)), level(0.0)).x;
        _3224 = _3228;
    }
    float _3230 = _3224;
    float _3232 = _3102;
    if (_3128)
    {
        float3 _8975 = float3(_3088, _3102, float(as_type<int>(_3206)));
        float3 _8977 = select(_8975, float3(0.0), isnan(_8975));
        float _3234 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _8977.xy, uint(rint(_8977.z)), _3214, level(0.0));
        _3232 = _3234;
    }
    float _3236 = _3232;
    float3 _8987 = float3(_3222, _3220, _3218);
    float _3238 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8987, float3(0.0), isnan(_8987)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8987, float3(0.0), isnan(_8987)), level(0.0)).x;
    float3 _8996 = float3(_3222, _3220, _3218);
    float4 _3241 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8996, float3(0.0), isnan(_8996)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8996, float3(0.0), isnan(_8996)), level(0.0)).xyzw;
    float _3243 = _3241.x;
    float _3245 = _3241.y;
    float _3247 = _3241.z;
    float _3249 = _3241.w;
    float _3251 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    if (_2802)
    {
        _3168 = 1.0;
    }
    float _3253 = _3168;
    bool _3255 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _3257 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3259 = _3255 || _3257;
    bool _3261 = isnan(0.5);
    bool _3263 = _3259 || _3261;
    float _3265 = _3253;
    if (_3263)
    {
        _3251 = 1.0;
    }
    float _3267 = _3251;
    float _3269 = _3267;
    if (_3263)
    {
        _3170 = 1.0;
    }
    float _3271 = _3170;
    float _3273 = _3271;
    float _3275 = _3243;
    if (!_3263)
    {
        float _3277 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _3279 = _3277 * 0.15915493667125701904296875;
        float _3281 = _3279 * 6.283185482025146484375;
        float _3283 = cos(_3281);
        float _3285 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _3287 = _3285 * 0.15915493667125701904296875;
        float _3289 = _3279 * 6.283185482025146484375;
        float _3291 = sin(_3289);
        float _3293 = 1.0 / _3283;
        float _3295 = _3287 * 6.283185482025146484375;
        float _3297 = cos(_3295);
        float _3299 = _3291 * _3293;
        float _3301 = _3287 * 6.283185482025146484375;
        float _3303 = sin(_3301);
        float _3305 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3307 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3305;
        float _3309 = _3297 * _3299;
        float _3311 = 1.0 / _3307;
        float _3313 = 1.0 / _3309;
        float _3315 = _3303 * _3313;
        float _3317 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3319 = fma(_2694, _3315, _3317);
        float _3321 = _3319 * _3311;
        float _3323 = precise::clamp(_3321, 0.0, 1.0);
        _3273 = _3323;
    }
    float _3325 = _3273;
    if (!_3263)
    {
        float _3327 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _3329 = _3327 * 0.15915493667125701904296875;
        float _3331 = _3329 * 6.283185482025146484375;
        float _3333 = cos(_3331);
        float _3335 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _3337 = _3335 * 0.15915493667125701904296875;
        float _3339 = _3329 * 6.283185482025146484375;
        float _3341 = sin(_3339);
        float _3343 = 1.0 / _3333;
        float _3345 = _3337 * 6.283185482025146484375;
        float _3347 = cos(_3345);
        float _3349 = _3341 * _3343;
        float _3351 = _3337 * 6.283185482025146484375;
        float _3353 = sin(_3351);
        float _3355 = _3347 * _3349;
        float _3357 = 1.0 / _3355;
        float _3359 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3361 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _3359;
        float _3363 = 1.0 / _3361;
        float _3365 = _3353 * _3357;
        float _3367 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3369 = fma(_2694, _3365, _3367);
        float _3371 = _3369 * _3363;
        float _3373 = precise::clamp(_3371, 0.0, 1.0);
        float _3375 = -_3373;
        float _3377 = _3375 + 1.0;
        _3269 = _3377;
    }
    float _3379 = _3269;
    if (!_2802)
    {
        int _3381 = _2868 << 4;
        int _3383 = _3381 + 2048;
        uint _3385 = uint(int(uint(_3383) >> uint(2)));
        uint _3387 = uint(int(uint(int(_3385)) >> uint(2)));
        int _3389 = int(_3385) & 3;
        float _3391 = (*spvDescriptorSet0.vp_c15)._m0[int(_3387)][_3389];
        int _3393 = int(_3385) + 1;
        uint _3395 = uint(int(uint(_3393) >> uint(2)));
        int _3397 = _3393 & 3;
        float _3399 = (*spvDescriptorSet0.vp_c15)._m0[int(_3395)][_3397];
        int _3401 = _3383 + 8;
        uint _3403 = uint(int(uint(_3401) >> uint(2)));
        uint _3405 = uint(int(uint(int(_3403)) >> uint(2)));
        int _3407 = int(_3403) & 3;
        float _3409 = (*spvDescriptorSet0.vp_c15)._m0[int(_3405)][_3407];
        int _3411 = int(_3403) + 1;
        uint _3413 = uint(int(uint(_3411) >> uint(2)));
        int _3415 = _3411 & 3;
        float _3417 = (*spvDescriptorSet0.vp_c15)._m0[int(_3413)][_3415];
        float _3419 = _2674 * _3399;
        float _3421 = fma(_1900, _3391, _3419);
        float _3423 = fma(_1910, _3409, _3421);
        float _3425 = _3423 + _3417;
        float _3427 = precise::clamp(_3425, 0.0, 1.0);
        float _3429 = -_3427;
        float _3431 = _3429 + _3230;
        float _3433 = fma(_3431, 500.0, 1.5);
        float _3435 = exp2(_3433);
        float _3437 = 0.0 + _3435;
        float _3439 = precise::clamp(_3437, 0.0, 1.0);
        _3265 = _3439;
    }
    float _3441 = _3265;
    float _3443 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3445 = _2952 + _3443;
    float _3447 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3449 = _2954 + _3447;
    float _3451 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3453 = _2956 + _3451;
    float _3455 = _3445 * _3445;
    float _3457 = fma(_3449, _3449, _3455);
    float _3459 = fma(_3453, _3453, _3457);
    float _3461 = rsqrt(_3459);
    float _3463 = _3461 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3465 = _3449 * _3463;
    float _3467 = _3453 * _3463;
    float _3469 = _3465 * _3465;
    float _3471 = _3467 * _3467;
    float _3473 = _3469 + _3471;
    float _3475 = sqrt(_3473);
    bool _3477 = _3475 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3479 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3481 = _3475 + _3479;
    float _3483 = _3453;
    float _3485 = _3461;
    float _3487 = _3481;
    float _3489 = _3445;
    if (_3477)
    {
        float _3491 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3483 = _3491;
    }
    float _3493 = _3483;
    if (_3477)
    {
        float _3495 = rsqrt(_3473);
        _3485 = _3495;
    }
    float _3497 = _3485;
    float _3499 = _3497;
    if (_3477)
    {
        float _3501 = _3481 * _3493;
        _3487 = _3501;
    }
    float _3503 = _3487;
    if (_3477)
    {
        float _3505 = _3503 * 0.15915493667125701904296875;
        _2080 = _3505;
    }
    float _3507 = _2080;
    float _3509 = _3493;
    float _3511 = _3507;
    if (_3477)
    {
        float _3513 = _3507 * 6.283185482025146484375;
        float _3515 = sin(_3513);
        _3509 = _3515;
    }
    float _3517 = _3509;
    float _3519 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3521 = precise::max(0.0, _3519);
    float _3523 = _3455;
    float _3525 = _3521;
    if (_3477)
    {
        float _3527 = _3507 * 6.283185482025146484375;
        float _3529 = cos(_3527);
        _3523 = _3529;
    }
    float _3531 = _3523;
    float _3533 = -_3463;
    float _3535 = -_3521;
    float _3537 = fma(_3445, _3533, _3535);
    if (!_3477)
    {
        _3489 = _3467;
    }
    float _3539 = _3489;
    float _3541 = _3539;
    if (_3477)
    {
        float _3543 = _3537 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3525 = _3543;
    }
    float _3545 = _3525;
    float _3547 = _3545;
    if (!_3477)
    {
        _3511 = _3469;
    }
    float _3549 = _3511;
    float _3551 = _3517;
    float _3553 = _3549;
    if (_3477)
    {
        float _3555 = fma(_3517, _3545, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3551 = _3555;
    }
    float _3557 = _3551;
    float _3559 = _3557;
    float _3561 = _3531;
    if (_3477)
    {
        float _3563 = _3531 + (-1.0);
        _3547 = _3563;
    }
    float _3565 = _3547;
    float _3567 = _3565;
    if (_3477)
    {
        float _3569 = _3497 * _3557;
        _2546 = _3569;
    }
    float _3571 = _2546;
    if (!_3477)
    {
        _3499 = _3465;
    }
    float _3573 = _3499;
    float _3575 = _3573;
    if (_3477)
    {
        float _3577 = _3565 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3567 = _3577;
    }
    float _3579 = _3567;
    if (_3477)
    {
        float _3581 = _3465 * _3571;
        _3575 = _3581;
    }
    float _3583 = _3575;
    if (!_3477)
    {
        _3559 = _3537;
    }
    float _3585 = _3559;
    float _3587 = _3585;
    if (_3477)
    {
        float _3589 = _3467 * _3571;
        _3541 = _3589;
    }
    float _3591 = _3541;
    if (_3477)
    {
        float _3593 = fma(_3537, _3531, _3579);
        _3587 = _3593;
    }
    float _3595 = _3587;
    if (_3477)
    {
        float _3597 = _3583 * _3583;
        _3553 = _3597;
    }
    float _3599 = _3553;
    if (!_3477)
    {
        _3561 = _3471;
    }
    float _3601 = _3561;
    float _3603 = _3601;
    if (_3477)
    {
        float _3605 = _3591 * _3591;
        _3603 = _3605;
    }
    float _3607 = _3603;
    float _3609 = sqrt(_3459);
    float _3611 = fma(_3595, _3595, _3599);
    float _3613 = _3611 + _3607;
    float _3615 = rsqrt(_3613);
    float _3617 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3619 = fma(_3609, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3617);
    float _3621 = precise::clamp(_3619, 0.0, 1.0);
    float _3623 = -_3621;
    float _3625 = _3623 + 1.0;
    float _3627 = abs(_3625);
    float _3629 = log2(_3627);
    float _3631 = _3615 * _3583;
    float _3633 = _3615 * _3595;
    float _3635 = _3615 * _3591;
    float _3637 = _3631 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3639 = -_3637;
    float _3641 = fma(_3633, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3639);
    float _3643 = -_3635;
    float _3645 = fma(_3643, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3641);
    float _3647 = _3629 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3649 = fma(_3645, -0.5, 0.5);
    float _3651 = fma(_3645, 0.5, 0.5);
    float _3653 = exp2(_3647);
    float _3655 = fma(_3651, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3657 = fma(_3651, _3655, -0.212114393711090087890625);
    float _3659 = _3633 + 1.0;
    float _3661 = sqrt(_3649);
    float _3663 = fma(_3651, _3657, 1.570728778839111328125);
    float _3665 = -_3633;
    float _3667 = fma(_3653, _3659, _3665);
    float _3669 = fma(_3667, 0.5, 0.5);
    float _3671 = _3661 * 0.636619746685028076171875;
    float _3673 = -_3663;
    float _3675 = fma(_3671, _3673, 1.0);
    float2 _9637 = float2(_3675, _3669);
    float3 _3679 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9637, float2(0.0), isnan(_9637)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9637, float2(0.0), isnan(_9637)), level(0.0)).xyz;
    float _3681 = _3679.x;
    float _3683 = _3679.y;
    float _3685 = _3679.z;
    float _3687 = abs(_2694);
    float _3689 = log2(_3687);
    float _3691 = _3100 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3693 = _3629 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3695 = -_2630;
    float _3697 = _3695 + 1.0;
    out.m_86.x = _2954;
    out.m_86.y = _2952;
    out.m_86.z = _2956;
    float _3699 = fma(_3104, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3691);
    float _3701 = exp2(_3693);
    float _3703 = fma(_3018, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3699);
    bool _3705 = _2694 <= 8000.0;
    bool _3707 = isnan(_2694);
    bool _3709 = _3705 || _3707;
    bool _3711 = isnan(8000.0);
    bool _3713 = _3709 || _3711;
    float _3715 = float(_3713);
    float _3717 = fma(_3122, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3703);
    float _3719 = _3689 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3721 = _3717 + _3146;
    float _3723 = _3721 * 0.5;
    float _3725 = exp2(_3719);
    out.gl_Position.x = _3210;
    out.gl_Position.y = _3192;
    out.gl_Position.z = _3717;
    out.gl_Position.w = _3146;
    out.m_88.z = _3723;
    out.m_88.w = _3146;
    float _3727 = _3210;
    if (!_3128)
    {
        _3727 = 1.0;
    }
    float _3729 = _3727;
    float _3731 = fma(_3725, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3733 = precise::clamp(_3731, 0.0, 1.0);
    float _3735 = _3729;
    if (_3128)
    {
        bool _3737 = _3236 >= _3214;
        bool _3739 = isnan(_3236);
        bool _3741 = _3737 || _3739;
        bool _3743 = isnan(_3214);
        bool _3745 = _3741 || _3743;
        float _3747 = float(_3745);
        _3735 = _3747;
    }
    float _3749 = _3735;
    bool _3751 = _3609 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3753 = isnan(_3609);
    bool _3755 = _3751 || _3753;
    bool _3757 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3759 = _3755 || _3757;
    float _3761 = fma(_3733, -2.0, 3.0);
    float _3763 = _3733 * _3733;
    float _3765 = _3749 * _3441;
    float _3767 = _3763 * _3761;
    float _3769 = -_3767;
    float _3771 = _3769 + 1.0;
    if (!_3759)
    {
        _3226 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3773 = _3226;
    float _3775 = fma(_3771, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3767);
    float _3777 = -_3701;
    float _3779 = _3777 + 1.0;
    float _3781 = _3715 * _3775;
    float _3783 = _3779 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3785 = _3781 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3787 = _3783 * _3238;
    float _3789 = -_3783;
    float _3791 = _3789 + 1.0;
    float _3793 = _3697 * _3785;
    float _3795 = precise::clamp(_3793, 0.0, 1.0);
    float _3797 = _3249 * _3787;
    float _3799 = _3249 * _3791;
    float _3801 = _3785;
    float _3803 = _3795;
    float _3805 = _3791;
    float _3807 = _3773;
    float _3809 = _3773;
    if (!_3759)
    {
        _3801 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3811 = _3801;
    float _3813 = -_3795;
    float _3815 = fma(_3813, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3817 = _3811;
    float _3819 = _3811;
    if (!_3759)
    {
        _3803 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3821 = _3803;
    float _3823 = _3821;
    float _3825 = _3821;
    if (!_3759)
    {
        _3805 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3827 = _3805;
    float _3829 = -_3765;
    float _3831 = fma(_3829, _3815, 1.0);
    float _3833 = precise::clamp(_3831, 0.0, 1.0);
    float _3835 = _3833 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3837 = _3325 * _3379;
    out.m_90.x = _3835;
    float _3839 = _3685 * _3787;
    float _3841 = fma(_3681, _3797, _3243);
    float _3843 = fma(_3683, _3797, _3245);
    float _3845 = _3837 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3847 = fma(_3249, _3839, _3247);
    float _3849 = _3837;
    float _3851 = _3827;
    float _3853 = _3827;
    if (!_3759)
    {
        _3275 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3855 = _3275;
    float _3857 = _3855;
    float _3859 = _3855;
    if (!_3759)
    {
        _3849 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3861 = _3849;
    out.m_92.x = _3841;
    out.m_92.y = _3843;
    out.m_92.z = _3847;
    out.m_92.w = _3799;
    bool _3863 = !_3759;
    float _3865 = _3861;
    float _3867 = _3861;
    if (!_3863)
    {
        bool _3869 = _3609 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3871 = isnan(_3609);
        bool _3873 = _3869 || _3871;
        bool _3875 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3877 = _3873 || _3875;
        if (!_3877)
        {
            float _3879 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3881 = _3609 + _3879;
            float _3883 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3885 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3883;
            float _3887 = 1.0 / _3885;
            float _3889 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3891 = _3889 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3893 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3895 = _3893 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3897 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3899 = _3897 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3901 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3903 = _3901 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3905 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3907 = _3905 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3909 = _3881 * _3887;
            float _3911 = precise::clamp(_3909, 0.0, 1.0);
            float _3913 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3915 = _3913 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3917 = fma(_3911, _3891, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3919 = fma(_3911, _3915, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3921 = fma(_3911, _3895, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3923 = fma(_3911, _3899, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3925 = fma(_3911, _3903, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3927 = fma(_3911, _3907, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3819 = _3919;
            _3853 = _3925;
            _3859 = _3917;
            _3809 = _3923;
            _3825 = _3921;
            _3867 = _3927;
            _3929 = true;
        }
        else
        {
            bool _3931 = _3609 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3933 = isnan(_3609);
            bool _3935 = _3931 || _3933;
            bool _3937 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3939 = _3935 || _3937;
            if (!_3939)
            {
                _3857 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3941 = _3857;
            _3859 = _3941;
            if (!_3939)
            {
                _3817 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3943 = _3817;
            _3819 = _3943;
            if (!_3939)
            {
                _3823 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3945 = _3823;
            _3825 = _3945;
            if (!_3939)
            {
                _3807 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3947 = _3807;
            _3809 = _3947;
            if (!_3939)
            {
                _3851 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3949 = _3851;
            _3853 = _3949;
            if (!_3939)
            {
                _3865 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3951 = _3865;
            bool _3953 = !_3939;
            _3867 = _3951;
            if (!_3953)
            {
                bool _3955 = _3609 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3957 = isnan(_3609);
                bool _3959 = _3955 || _3957;
                bool _3961 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3963 = _3959 || _3961;
                if (!_3963)
                {
                    float _3965 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3967 = _3609 + _3965;
                    float _3969 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3971 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3969;
                    float _3973 = 1.0 / _3971;
                    float _3975 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3977 = _3975 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3979 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3981 = _3979 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3983 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3985 = _3983 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3987 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3989 = _3987 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3991 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3993 = _3991 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3995 = _3967 * _3973;
                    float _3997 = precise::clamp(_3995, 0.0, 1.0);
                    float _3999 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4001 = _3999 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4003 = fma(_3997, _3977, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4005 = fma(_3997, _4001, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4007 = fma(_3997, _3981, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4009 = fma(_3997, _3985, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4011 = fma(_3997, _3989, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4013 = fma(_3997, _3993, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3819 = _4005;
                    _3853 = _4011;
                    _3859 = _4003;
                    _3809 = _4009;
                    _3825 = _4007;
                    _3867 = _4013;
                    _3929 = true;
                }
                else
                {
                    _3819 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3853 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3859 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3809 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3825 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3867 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3929 = false;
    float _4015 = _3819;
    float _4017 = _3853;
    float _4019 = _3859;
    float _4021 = _3809;
    float _4023 = _3825;
    float _4025 = _3867;
    float _4027 = fma(_2510, -0.5, 0.5);
    float _4029 = precise::clamp(_4027, 0.0, 1.0);
    float _4031 = -_4015;
    float _4033 = _4031 + _4017;
    float _4035 = _3845 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4037 = -_4019;
    float _4039 = _4037 + _4021;
    out.m_94.x = 0.0;
    float _4041 = fma(_4029, _4033, _4015);
    float _4043 = fma(_4029, _4039, _4019);
    out.m_61.x = _4035;
    float _4045 = -_4023;
    float _4047 = _4045 + _4025;
    float _4049 = _4041 * 0.586610972881317138671875;
    bool _4051 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4053 = fma(_4029, _4047, _4023);
    float _4055 = fma(_4043, 0.298911988735198974609375, _4049);
    bool _4057 = _3325 > 0.0;
    bool _4059 = isnan(_3325);
    bool _4061 = _4057 || _4059;
    bool _4063 = isnan(0.0);
    bool _4065 = _4061 || _4063;
    float _4067 = fma(_4053, 0.114477999508380889892578125, _4055);
    bool _4069 = _3379 <= 0.0;
    bool _4071 = !_4065;
    bool _4073 = _4069 || _4071;
    float _4075 = -_4067;
    float _4077 = _4043 + _4075;
    float _4079 = -_4067;
    float _4081 = _4041 + _4079;
    float _4083 = -_4067;
    float _4085 = _4053 + _4083;
    float _4087 = fma(_4077, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4067);
    float _4089 = fma(_4081, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4067);
    float _4091 = fma(_4085, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4067);
    bool _4093 = !_4051;
    if (!_4093)
    {
        float _4095 = -_2952;
        float _4097 = _4095 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4099 = -_2954;
        float _4101 = _4099 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4103 = -_2956;
        float _4105 = _4103 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4107 = _4097 * _4097;
        float _4109 = fma(_4101, _4101, _4107);
        float _4111 = fma(_4105, _4105, _4109);
        float _4113 = sqrt(_4111);
        float _4115 = rsqrt(_4111);
        float _4117 = -_4113;
        float _4119 = _4117 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4121 = _4119 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4123 = precise::clamp(_4121, 0.0, 1.0);
        float _4125 = _4101 * _4115;
        float _4127 = _4097 * _4115;
        float _4129 = abs(_4123);
        float _4131 = log2(_4129);
        float _4133 = _4105 * _4115;
        float _4135 = _4125 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4137 = _2510 * _4127;
        float _4139 = -_4127;
        float _4141 = -_4135;
        float _4143 = fma(_4139, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4141);
        float _4145 = fma(_2494, _4125, _4137);
        float _4147 = -_4133;
        float _4149 = fma(_4147, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4143);
        float _4151 = fma(_2532, _4133, _4145);
        float _4153 = precise::clamp(_4151, 0.0, 1.0);
        float _4155 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4157 = _4149 + _4155;
        float _4159 = _4131 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4161 = _4157 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4163 = precise::clamp(_4161, 0.0, 1.0);
        float _4165 = exp2(_4159);
        float _4167 = _4165 * _4163;
        float _4169 = _4153 * _4167;
        float _4171 = _4169 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4173 = _4169 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4175 = _4169 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_94.x = _4171;
        out.m_94.y = _4173;
        out.m_94.z = _4175;
    }
    out.m_96.x = _4087;
    out.m_96.y = _4089;
    out.m_96.z = _4091;
    if (!_4073)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_61.x = 0.0;
    float _4177 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4177;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3929 = false;
    bool _2582 = false;
    bool _213 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _110 = in.m_58.w;
    float _112 = trunc(_110);
    int _115 = int(_112);
    bool _119 = _115 >= 1;
    float _121 = 0.0;
    if (!_119)
    {
        _121 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _123 = _121;
    float _125 = _123;
    if (!_119)
    {
        out.m_61.x = 0.0;
    }
    int _127 = 0;
    if (!_119)
    {
        float _129 = _123 * 5.0;
        _127 = as_type<int>(_129);
    }
    int _131 = _127;
    int _133 = _131;
    if (!_119)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4234 = as_type<float>(_131);
        out.gl_Position.z = _4234;
    }
    if (!_119)
    {
        return out;
    }
    float _135 = in.m_63.w;
    bool _137 = _135 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _139 = isnan(_135);
    bool _141 = _137 || _139;
    bool _143 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _145 = _141 || _143;
    float _147 = -_135;
    float _149 = _147 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _151 = 0.0;
    float _153 = _149;
    if (_145)
    {
        float _155 = float(_115);
        _151 = _155;
    }
    float _157 = _151;
    bool _159 = _149 >= _157;
    bool _161 = !_145;
    bool _163 = _159 || _161;
    if (_163)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _165 = _125;
    if (_163)
    {
        out.m_61.x = 0.0;
    }
    if (_163)
    {
        float _167 = _165 * 5.0;
        _133 = as_type<int>(_167);
    }
    int _169 = _133;
    float _171 = as_type<float>(_169);
    if (_163)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4305 = as_type<float>(_169);
        out.gl_Position.z = _4305;
    }
    if (_163)
    {
        return out;
    }
    float _173 = as_type<float>(int(gl_VertexIndex));
    bool _175 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _177 = as_type<int>(_173) & 1;
    bool _179 = _177 != 0;
    int _181 = as_type<int>(_173) & 2;
    bool _183 = _181 != 0;
    bool _185 = !_179;
    float _187 = _185 ? (-0.5) : 0.5;
    bool _189 = !_183;
    float _191 = _189 ? (-0.5) : 0.5;
    bool _193 = !_175;
    float _211;
    if (!_193)
    {
        float _195 = in.m_68.x;
        float _197 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _199 = _195 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _201 = fma(_199, (*spvDescriptorSet0.vp_c9)._m0[12].x, _149);
        float _203 = _201 * _197;
        float _205 = floor(_203);
        float _207 = -_205;
        float _209 = _203 + _207;
        _211 = _209;
        _213 = true;
    }
    else
    {
        float _215 = float(_115);
        float _217 = 1.0 / _215;
        float _219 = _149 * _217;
        _211 = _219;
    }
    _213 = false;
    float _221 = _211;
    float _223 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _225 = int(_223);
    float _227 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _229 = _221 + _227;
    float _231 = float(_115);
    int _233 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _235 = _233 != 0;
    float _237 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _239 = int(_237);
    float _241 = float(_225);
    float _243 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _245 = int(_243);
    int _247 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    if (_235)
    {
        float _249 = in.m_68.x;
        _171 = _249;
    }
    float _251 = _171;
    float _253 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _255 = _251;
    if (!_235)
    {
        float _257 = in.m_68.y;
        _255 = _257;
    }
    float _259 = _255;
    float _261 = float(_239);
    float _263 = 1.0 / _241;
    float _265 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _267 = int(_265);
    float _269 = float(uint(_245));
    int _271 = ~_245;
    int _273 = _271 + 1;
    bool _275 = _245 == 0;
    float _277 = 1.0 / _261;
    float _279 = _263 * _149;
    float _281 = 1.0 / _269;
    float _283 = float(uint(_267));
    int _285 = ~_267;
    int _287 = _285 + 1;
    float _289 = trunc(_279);
    int _291 = int(_289);
    float _293 = _277 * _149;
    float _295 = 1.0 / _283;
    int _297 = as_type<int>(_281) + (-2);
    float _299 = trunc(_293);
    int _301 = int(_299);
    float _303 = float(uint(_291));
    float _305 = as_type<float>(_297) * _303;
    int _307 = as_type<int>(_295) + (-2);
    float _309 = 1.0 / _231;
    float _311 = float(uint(_301));
    float _313 = trunc(_305);
    float _315 = precise::max(_313, 0.0);
    uint _318 = uint(_315);
    float _320 = as_type<float>(_307) * _311;
    float _322 = in.m_68.x;
    float _324 = in.m_68.y;
    float _326 = in.m_68.z;
    float _328 = in.m_68.w;
    float _330 = trunc(_320);
    float _332 = precise::max(_330, 0.0);
    uint _334 = uint(_332);
    float _336 = _309 * _149;
    int _338 = _273 * int(_318);
    int _340 = _338 + _291;
    float _342 = float(uint(_340));
    float _344 = as_type<float>(_340);
    if (_235)
    {
        _344 = 1.0;
    }
    float _346 = _344;
    int _348 = _287 * int(_334);
    int _350 = _348 + _301;
    float _352 = _346;
    float _354 = as_type<float>(_350);
    if (!_235)
    {
        _352 = 7.345489978790283203125;
    }
    float _356 = _352;
    float _358 = as_type<float>(_297) * _342;
    float _360 = float(uint(_350));
    float _362 = trunc(_358);
    float _364 = precise::max(_362, 0.0);
    uint _366 = uint(_364);
    if (_235)
    {
        _354 = 1.0;
    }
    float _368 = _354;
    float _370 = _356 * _322;
    float _372 = _368;
    if (!_235)
    {
        _372 = 1.2345600128173828125;
    }
    float _374 = _372;
    float _376 = as_type<float>(_307) * _360;
    float _378 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[78].z, _253);
    float _380 = floor(_370);
    float _382 = _259 * _374;
    int _384 = ~_245;
    int _386 = _384 + 1;
    float _388 = float(_291);
    float _390 = trunc(_376);
    float _392 = precise::max(_390, 0.0);
    uint _394 = uint(_392);
    int _396 = int(_318) + int(_366);
    int _398 = ~_267;
    int _400 = _398 + 1;
    int _402 = _386 * _396;
    int _404 = _402 + _291;
    float _406 = float(_245);
    float _408 = floor(_382);
    float _410 = -_380;
    float _412 = _370 + _410;
    bool _414 = uint(_404) >= uint(_245);
    bool _416 = _388 >= _406;
    bool _418 = isnan(_388);
    bool _420 = _416 || _418;
    bool _422 = isnan(_406);
    bool _424 = _420 || _422;
    float _426 = float(_424);
    float _428 = _412 * _406;
    bool _430 = !_414;
    int _432 = _430 ? 0 : (-1);
    int _434 = int(_334) + int(_394);
    float _436 = trunc(_426);
    int _438 = int(_436);
    int _440 = ~_396;
    int _442 = _440 + _432;
    int _444 = _442 + 1;
    float _446 = float(_301);
    int _448 = _400 * _434;
    int _450 = _448 + _301;
    float _452 = -_408;
    float _454 = _382 + _452;
    float _456 = trunc(_428);
    int _458 = int(_456);
    bool _460 = uint(_450) >= uint(_267);
    int _462 = _245 * _444;
    int _464 = _462 + _291;
    float _466 = float(_267);
    float _468 = _406 * _336;
    int _470 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _472 = _470 != 0;
    bool _474 = _446 >= _466;
    bool _476 = isnan(_446);
    bool _478 = _474 || _476;
    bool _480 = isnan(_466);
    bool _482 = _478 || _480;
    float _484 = float(_482);
    float _486 = _454 * _466;
    bool _488 = !_472;
    int _490 = _488 ? 0 : 1;
    float _492 = _466 * _336;
    bool _494 = !_460;
    int _496 = _494 ? 0 : (-1);
    float _498 = trunc(_468);
    int _500 = int(_498);
    int _502 = abs(_490);
    int _504 = ~_438;
    int _506 = _504 + 1;
    int _508 = _506 + 1;
    bool _510 = !_275;
    int _512 = _510 ? _464 : (-1);
    int _514 = _458 * _502;
    int _516 = _514 + _291;
    int _518 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _520 = _518 != 0;
    int _522 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _524 = _522 != 0;
    int _526 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _528 = _526 != 0;
    float _530 = trunc(_484);
    int _532 = int(_530);
    int _534 = ~_434;
    int _536 = _534 + _496;
    int _538 = _536 + 1;
    int _540 = _512 * _508;
    bool _542 = _267 == 0;
    bool _544 = !_524;
    int _546 = _544 ? 0 : 1;
    int _548 = _267 * _538;
    int _550 = _548 + _301;
    int _552 = _245 + (-1);
    float _554 = trunc(_486);
    int _556 = int(_554);
    int _558 = abs(_546);
    bool _560 = !_542;
    int _562 = _560 ? _550 : (-1);
    int _564 = _438 * _552;
    int _566 = _564 + _540;
    int _568 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _570 = _568 != 0;
    float _572 = trunc(_492);
    int _574 = int(_572);
    int _576 = ~_532;
    int _578 = _576 + 1;
    int _580 = _578 + 1;
    bool _582 = !_570;
    int _584 = _582 ? 0 : 1;
    int _586 = _566 * _558;
    int _588 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _590 = _588 != 0;
    int _592 = _562 * _580;
    bool _594 = !_520;
    int _596 = _594 ? 0 : 1;
    int _598 = abs(_584);
    int _600 = abs(_596);
    bool _602 = !_528;
    int _604 = _602 ? 0 : 1;
    int _606 = _556 * _598;
    int _608 = _606 + _301;
    int _610 = _267 + (-1);
    int _612 = _500 * _600;
    int _614 = _612 + _586;
    bool _616 = !_590;
    int _618 = _616 ? 0 : 1;
    int _620 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _622 = _620 != 0;
    int _624 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _626 = _624 != 0;
    int _628 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _630 = _628 != 0;
    int _632 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _634 = _632 != 0;
    int _636 = _532 * _610;
    int _638 = _636 + _592;
    int _640 = abs(_604);
    int _642 = abs(_618);
    bool _644 = !_626;
    int _646 = _644 ? 0 : 1;
    int _648 = abs(_646);
    bool _650 = !_622;
    int _652 = _650 ? 0 : 1;
    int _654 = _516 * _640;
    int _656 = _654 + _614;
    bool _658 = !_630;
    int _660 = _658 ? 0 : 1;
    int _662 = _458 * _642;
    int _664 = _662 + _656;
    bool _666 = !_634;
    int _668 = _666 ? 0 : 1;
    int _670 = abs(_660);
    int _672 = _638 * _648;
    int _674 = abs(_668);
    float _676 = float(uint(_664));
    int _678 = abs(_652);
    float _680 = as_type<float>(_297) * _676;
    int _682 = ~_245;
    int _684 = _682 + 1;
    int _686 = _574 * _678;
    int _688 = _686 + _672;
    int _690 = ~_267;
    int _692 = _690 + 1;
    float _694 = trunc(_680);
    float _696 = precise::max(_694, 0.0);
    uint _698 = uint(_696);
    int _700 = _608 * _670;
    int _702 = _700 + _688;
    float _704 = float(uint(_608));
    bool _706 = _245 == 0;
    int _708 = _556 * _674;
    int _710 = _708 + _702;
    int _712 = ~_245;
    int _714 = _712 + 1;
    float _716 = as_type<float>(_307) * _704;
    bool _718 = _267 == 0;
    float _720 = float(uint(_710));
    float _722 = trunc(_716);
    float _724 = precise::max(_722, 0.0);
    uint _726 = uint(_724);
    int _728 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _730 = _728 != 0;
    float _732 = as_type<float>(_307) * _720;
    int _734 = _714 * int(_698);
    int _736 = _734 + _664;
    float _738 = trunc(_732);
    float _740 = precise::max(_738, 0.0);
    uint _742 = uint(_740);
    float _744 = float(uint(_736));
    if (_730)
    {
        _247 = 0;
    }
    int _746 = _247;
    float _748 = as_type<float>(_297) * _744;
    int _750 = _746;
    if (!_730)
    {
        _750 = 1;
    }
    int _752 = _750;
    float _754 = float(uint(_516));
    float _756 = trunc(_748);
    float _758 = precise::max(_756, 0.0);
    uint _760 = uint(_758);
    float _762 = as_type<float>(_297) * _754;
    int _764 = _692 * int(_742);
    int _766 = _764 + _710;
    int _768 = ~_245;
    int _770 = _768 + 1;
    float _772 = trunc(_762);
    float _774 = precise::max(_772, 0.0);
    uint _776 = uint(_774);
    float _778 = float(uint(_766));
    int _780 = int(_698) + int(_760);
    float _782 = as_type<float>(_307) * _778;
    int _784 = ~_267;
    int _786 = _784 + 1;
    int _788 = _684 * _780;
    int _790 = _788 + _664;
    float _792 = trunc(_782);
    float _794 = precise::max(_792, 0.0);
    uint _796 = uint(_794);
    bool _798 = uint(_790) >= uint(_245);
    bool _800 = !_798;
    int _802 = _800 ? 0 : (-1);
    int _804 = ~_780;
    int _806 = _804 + _802;
    int _808 = _806 + 1;
    int _810 = _770 * int(_776);
    int _812 = _810 + _516;
    int _814 = ~_267;
    int _816 = _814 + 1;
    int _818 = int(_742) + int(_796);
    int _820 = _245 * _808;
    int _822 = _820 + _664;
    float _824 = float(uint(_812));
    bool _826 = !_706;
    int _828 = _826 ? _822 : (-1);
    int _830 = _786 * _818;
    int _832 = _830 + _710;
    float _834 = as_type<float>(_297) * _824;
    bool _836 = uint(_832) >= uint(_267);
    int _838 = _828 & 3;
    bool _840 = _838 != 0;
    int _842 = _816 * int(_726);
    int _844 = _842 + _608;
    int _846 = _828 & 3;
    bool _848 = _846 != 0;
    float _850 = trunc(_834);
    float _852 = precise::max(_850, 0.0);
    uint _854 = uint(_852);
    bool _856 = uint(_838) >= 2u;
    float _858 = float(uint(_844));
    bool _860 = !_836;
    int _862 = _860 ? 0 : (-1);
    int _864 = _848 ? 0 : 1;
    float _866 = as_type<float>(_307) * _858;
    int _868 = _856 ? 0 : 1;
    bool _870 = uint(_838) > 1u;
    bool _872 = _838 != 3;
    float _874 = trunc(_866);
    float _876 = precise::max(_874, 0.0);
    uint _878 = uint(_876);
    int _880 = ~_818;
    int _882 = _880 + _862;
    int _884 = _882 + 1;
    int _886 = ~_864;
    int _888 = _886 + 1;
    int _890 = _888 + 1;
    int _892 = ~_868;
    int _894 = _892 + 1;
    int _896 = _894 + 1;
    int _898 = _267 * _884;
    int _900 = _898 + _710;
    int _902 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _904 = _902 != 0;
    int _906 = int(_776) + int(_854);
    float _908 = _324 * 2.0;
    bool _910 = !_718;
    int _912 = _910 ? _900 : (-1);
    int _914 = _890;
    int _916 = _896;
    float _918 = as_type<float>(_786);
    float _920 = as_type<float>(_906);
    if (!_870)
    {
        int _922 = ~_864;
        int _924 = _922 + 1;
        _914 = _924;
    }
    int _926 = _914;
    float _928 = _322 * 2.0;
    if (_872)
    {
        int _930 = ~_868;
        int _932 = _930 + 1;
        _916 = _932;
    }
    int _934 = _916;
    float _936 = floor(_908);
    int _938 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _940 = _938 != 0;
    int _942 = _912 & 3;
    bool _944 = _942 != 0;
    bool _946 = !_940;
    int _948 = _946 ? 0 : 1;
    int _950 = _912 & 3;
    bool _952 = _950 != 0;
    float _954 = floor(_928);
    bool _956 = uint(_942) > 1u;
    bool _958 = !_904;
    int _960 = _958 ? 0 : 1;
    bool _962 = _942 != 3;
    int _964 = ~_245;
    int _966 = _964 + 1;
    int _968 = _952 ? 0 : 1;
    bool _970 = uint(_942) >= 2u;
    int _972 = _966 * _906;
    int _974 = _972 + _516;
    int _976 = ~_968;
    int _978 = _976 + 1;
    int _980 = _978 + 1;
    int _982 = _970 ? 0 : 1;
    int _984 = _980;
    float _986 = as_type<float>(_974);
    if (!_956)
    {
        int _988 = ~_968;
        int _990 = _988 + 1;
        _984 = _990;
    }
    int _992 = _984;
    int _994 = ~_982;
    int _996 = _994 + 1;
    int _998 = _996 + 1;
    bool _1000 = _752 != 1;
    bool _1002 = uint(_974) >= uint(_245);
    int _1004 = _998;
    if (_962)
    {
        int _1006 = ~_982;
        int _1008 = _1006 + 1;
        _1004 = _1008;
    }
    int _1010 = _1004;
    bool _1012 = _954 > 0.0;
    bool _1014 = !_1002;
    int _1016 = _1014 ? 0 : (-1);
    int _1018 = ~_267;
    int _1020 = _1018 + 1;
    bool _1022 = _954 >= 0.0;
    bool _1024 = isnan(_954);
    bool _1026 = _1022 || _1024;
    bool _1028 = isnan(0.0);
    bool _1030 = _1026 || _1028;
    int _1032 = int(_726) + int(_878);
    int _1034 = _1030 ? 0 : 1;
    int _1036 = ~_906;
    int _1038 = _1036 + _1016;
    int _1040 = _1038 + 1;
    int _1042 = _1020 * _1032;
    int _1044 = _1042 + _608;
    if (!_1000)
    {
        _918 = _324;
    }
    float _1046 = _918;
    float _1048 = _1046;
    if (!_1000)
    {
        _986 = _324;
    }
    float _1050 = _986;
    int _1052 = _245 * _1040;
    int _1054 = _1052 + _516;
    float _1056 = 0.0;
    float _1058 = _1050;
    if (!_1000)
    {
        _1056 = _326;
    }
    float _1060 = _1056;
    float _1062 = _1060;
    if (!_1000)
    {
        _920 = _326;
    }
    float _1064 = _920;
    int _1066 = ~_1034;
    int _1068 = _1066 + 1;
    int _1070 = _1068 + 1;
    float _1072 = _1064;
    int _1074 = _1070;
    if (_1000)
    {
        _1048 = _322;
    }
    float _1076 = _1048;
    if (_1000)
    {
        _1058 = _322;
    }
    float _1078 = _1058;
    if (_1000)
    {
        _1062 = _324;
    }
    float _1080 = _1062;
    if (_1000)
    {
        _1072 = _324;
    }
    float _1082 = _1072;
    if (!_1012)
    {
        int _1084 = ~_1034;
        int _1086 = _1084 + 1;
        _1074 = _1086;
    }
    int _1088 = _1074;
    float _1090 = _324 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1092 = _936 >= 0.0;
    bool _1094 = isnan(_936);
    bool _1096 = _1092 || _1094;
    bool _1098 = isnan(0.0);
    bool _1100 = _1096 || _1098;
    bool _1102 = uint(_1044) >= uint(_267);
    int _1104 = _1100 ? 0 : 1;
    bool _1106 = !_1102;
    int _1108 = _1106 ? 0 : (-1);
    bool _1110 = _936 > 0.0;
    bool _1112 = _328 > 0.5;
    bool _1114 = _838 != 3;
    bool _1116 = !_706;
    int _1118 = _1116 ? _1054 : (-1);
    bool _1120 = !_944;
    int _1122 = _1120 ? 0 : 1;
    bool _1124 = !_840;
    int _1126 = _1124 ? 0 : 1;
    int _1128 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1130 = _1128 != 0;
    int _1132 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1134 = _1132 != 0;
    int _1136 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1138 = _1136 != 0;
    int _1140 = ~_1104;
    int _1142 = _1140 + 1;
    int _1144 = _1142 + 1;
    float _1146 = _326 * 2.0;
    int _1148 = _1144;
    if (!_1110)
    {
        int _1150 = ~_1104;
        int _1152 = _1150 + 1;
        _1148 = _1152;
    }
    int _1154 = _1148;
    float _1156 = in.m_58.x;
    float _1158 = in.m_58.y;
    float _1160 = in.m_58.z;
    float _1162 = floor(_1146);
    bool _1164 = _942 != 3;
    float _1166 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1168 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _1166;
    float _1170 = 1.0 / _1168;
    int _1172 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1174 = _1172 != 0;
    float _1176 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1178 = _322 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1180 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1182 = -_1176;
    float _1184 = fma(_1178, 2.0, _1182);
    float _1186 = fma(_1090, -2.0, _1180);
    bool _1188 = !_1130;
    int _1190 = _1188 ? 0 : 1;
    float _1192 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _1194 = _1162 >= 0.0;
    bool _1196 = isnan(_1162);
    bool _1198 = _1194 || _1196;
    bool _1200 = isnan(0.0);
    bool _1202 = _1198 || _1200;
    float _1204 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1186);
    float _1206 = _1158 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1208 = _1158 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _1210 = _1202 ? 0 : 1;
    float _1212 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _1214 = _1162 > 0.0;
    float _1216 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1218 = _322 + _324;
    float _1220 = _1158 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1222 = _1212 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1224 = _1192 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1226 = _1216 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1228 = _229 * _1170;
    float _1230 = _1218 + (-1.0);
    float _1232 = fma(_1156, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1206);
    float _1234 = fma(_1156, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1208);
    float _1236 = fma(_1156, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1220);
    float _1238 = _326 + _322;
    float _1240 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1242 = log2(_1240);
    float _1244 = _326 + _324;
    out.m_70.x = _1222;
    out.m_70.y = _1224;
    out.m_70.z = _1226;
    float _1246 = fma(_1230, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1248 = ~_1210;
    int _1250 = _1248 + 1;
    int _1252 = _1250 + 1;
    int _1254 = _1252;
    if (!_1214)
    {
        int _1256 = ~_1210;
        int _1258 = _1256 + 1;
        _1254 = _1258;
    }
    int _1260 = _1254;
    float _1262 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _1264 = !_1134;
    int _1266 = _1264 ? 0 : 1;
    int _1268 = abs(_1190);
    float _1270 = _1238 + (-1.0);
    float _1272 = _1244 + (-1.0);
    float _1274 = _1242 * _149;
    float _1276 = fma(_1270, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1278 = fma(_1272, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1280 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1282 = _1080 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1284 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1286 = fma(_1078, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1280);
    float _1288 = _1076 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1290 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1292 = fma(_1082, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1284);
    float _1294 = exp2(_1274);
    float _1296 = -_1262;
    float _1298 = fma(_1288, 2.0, _1296);
    float _1300 = fma(_1282, -2.0, _1290);
    float _1302 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1304 = 1.0 + _1302;
    float _1306 = in.m_72.x;
    float _1308 = in.m_72.y;
    float _1310 = in.m_72.z;
    int _1312 = abs(_1266);
    float _1314 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1316 = float(_1088);
    float _1318 = 1.0 / _1304;
    float _1320 = float(_1268);
    float _1322 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[77].z, _378);
    float _1324 = float(_1260);
    bool _1326 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1328 = isnan(0.0);
    bool _1330 = _1326 || _1328;
    bool _1332 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1334 = _1330 || _1332;
    float _1336 = -_1294;
    float _1338 = _1336 + 1.0;
    float _1340 = _1320 * _1324;
    float _1342 = -_149;
    float _1344 = fma(_1342, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1184);
    float _1346 = float(_1312);
    float _1348 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1314);
    float _1350 = _1334 ? _1338 : 0.0;
    float _1352 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1286);
    bool _1354 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1356 = isnan(1.0);
    bool _1358 = _1354 || _1356;
    bool _1360 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1362 = _1358 || _1360;
    float _1364 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1300);
    float _1366 = _1340 * (-2.0);
    bool _1368 = !_1138;
    int _1370 = _1368 ? 0 : 1;
    float _1372 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1348);
    float _1374 = _1346 * _1316;
    float _1376 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1292);
    float _1378 = fma(_1366, _1306, _1306);
    int _1380 = abs(_1370);
    float _1382 = -_149;
    float _1384 = fma(_1382, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1298);
    int _1386 = ~_1032;
    int _1388 = _1386 + _1108;
    int _1390 = _1388 + 1;
    float _1392 = _1374 * (-2.0);
    float _1394 = fma(_1246, _1366, _1246);
    if (_1362)
    {
        float _1396 = _1350 * _1318;
        _153 = _1396;
    }
    float _1398 = _153;
    int _1400 = _267 * _1390;
    int _1402 = _1400 + _608;
    bool _1404 = _322 > 0.5;
    float _1406 = fma(_1278, _1392, _1278);
    bool _1408 = _267 == 0;
    float _1410 = _322 + (-0.5);
    float _1412 = fma(_1392, _1308, _1308);
    float _1414 = fma(_1410, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1378);
    float _1416 = float(_1154);
    float _1418 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1420 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1418;
    float _1422 = float(_1380);
    float _1424 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1426 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1424;
    bool _1428 = _221 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _1430 = isnan(_221);
    bool _1432 = _1428 || _1430;
    bool _1434 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _1436 = _1432 || _1434;
    float _1438 = float(_1436);
    float _1440 = fma(_1420, _1228, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _1442 = !_1408;
    int _1444 = _1442 ? _1402 : (-1);
    float _1446 = _1422 * _1416;
    bool _1448 = _324 > 0.5;
    float _1450 = _324 + (-0.5);
    bool _1452 = _221 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1454 = isnan(_221);
    bool _1456 = _1452 || _1454;
    bool _1458 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1460 = _1456 || _1458;
    float _1462 = float(_1460);
    float _1464 = -_1438;
    float _1466 = _1464 + 1.0;
    float _1468 = fma(_1394, _1398, _1414);
    float _1470 = fma(_1426, _1228, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _1472 = _1446 * (-2.0);
    float _1474 = fma(_1450, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1412);
    float _1476 = _1462 * _1466;
    float _1478 = in.m_74.x;
    float _1480 = in.m_74.y;
    float _1482 = fma(_1472, _1310, _1310);
    float _1484 = _326 + (-0.5);
    float _1486 = _1440 * _1476;
    float _1488 = -_1462;
    float _1490 = _1488 + 1.0;
    float _1492 = _1470 * _1476;
    float _1494 = fma(_1276, _1472, _1276);
    float _1496 = fma(_1484, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1482);
    float _1498 = fma(_1490, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1486);
    float _1500 = fma(_1490, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1492);
    float _1502 = fma(_1406, _1398, _1474);
    float _1504 = fma(_1160, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1234);
    float _1506 = fma(_1494, _1398, _1496);
    float _1508 = fma(_1438, (*spvDescriptorSet0.vp_c9)._m0[144].x, _1498);
    float _1510 = fma(_1438, (*spvDescriptorSet0.vp_c9)._m0[144].y, _1500);
    int _1512 = _912 >> 31;
    float _1514 = _1506 * 0.15915493667125701904296875;
    int _1516 = _828 >> 31;
    float _1518 = _1468 * 0.15915493667125701904296875;
    int _1520 = _1512 & 3;
    float _1522 = fma(_1160, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1232);
    float _1524 = fma(_1160, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1236);
    int _1526 = _1516 & 3;
    float _1528 = _1502 * 0.15915493667125701904296875;
    int _1530 = _912 + _1520;
    float _1532 = _1508 * _1478;
    int _1534 = _828 + _1526;
    float _1536 = _1518 * 6.283185482025146484375;
    float _1538 = sin(_1536);
    int _1540 = _1530 >> 2;
    float _1542 = _1510 * _1480;
    float _1544 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _187);
    int _1546 = _1534 >> 2;
    float _1548 = _1532 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1550 = _1540 << 4;
    int _1552 = _1550 + 512;
    float _1554 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _191);
    float _1556 = _1518 * 6.283185482025146484375;
    float _1558 = cos(_1556);
    int _1560 = _1546 << 4;
    int _1562 = _1560 + 368;
    float _1564 = _1548 * _1544;
    int _1566 = abs(_926);
    uint _1568 = uint(int(uint(_1562) >> uint(2)));
    uint _1570 = uint(int(uint(int(_1568)) >> uint(2)));
    int _1572 = int(_1568) & 3;
    float _1574 = (*spvDescriptorSet0.vp_c9)._m0[int(_1570)][_1572];
    int _1576 = int(_1568) + 1;
    uint _1578 = uint(int(uint(_1576) >> uint(2)));
    int _1580 = _1576 & 3;
    float _1582 = (*spvDescriptorSet0.vp_c9)._m0[int(_1578)][_1580];
    int _1584 = abs(_1122);
    float _1586 = _1528 * 6.283185482025146484375;
    float _1588 = sin(_1586);
    int _1590 = abs(_934);
    bool _1592 = !_1114;
    int _1594 = _1592 ? 0 : (-1);
    bool _1596 = !_1164;
    int _1598 = _1596 ? 0 : (-1);
    int _1600 = abs(_1594);
    float _1602 = _1528 * 6.283185482025146484375;
    float _1604 = cos(_1602);
    int _1606 = abs(_1598);
    int _1608 = abs(_948);
    int _1610 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1612 = _1610 != 0;
    int _1614 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1616 = _1614 != 0;
    float _1618 = _1514 * 6.283185482025146484375;
    float _1620 = sin(_1618);
    float _1622 = _1542 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1624 = _1558 * _1588;
    uint _1626 = uint(int(uint(_1552) >> uint(2)));
    uint _1628 = uint(int(uint(int(_1626)) >> uint(2)));
    int _1630 = int(_1626) & 3;
    float _1632 = (*spvDescriptorSet0.vp_c9)._m0[int(_1628)][_1630];
    int _1634 = int(_1626) + 1;
    uint _1636 = uint(int(uint(_1634) >> uint(2)));
    int _1638 = _1634 & 3;
    float _1640 = (*spvDescriptorSet0.vp_c9)._m0[int(_1636)][_1638];
    float _1642 = _1538 * _1588;
    float _1644 = _1622 * _1554;
    float _1646 = _1514 * 6.283185482025146484375;
    float _1648 = cos(_1646);
    float _1650 = _1538 * _1604;
    float _1652 = _1558 * _1604;
    float _1654 = fma(_1620, _1652, _1642);
    float _1656 = -_1624;
    float _1658 = fma(_1620, _1650, _1656);
    float _1660 = -_1650;
    float _1662 = fma(_1620, _1624, _1660);
    float _1664 = -_1644;
    float _1666 = _1620 * _1664;
    int _1668 = _1552 + 8;
    uint _1670 = uint(int(uint(_1668) >> uint(2)));
    uint _1672 = uint(int(uint(int(_1670)) >> uint(2)));
    int _1674 = int(_1670) & 3;
    float _1676 = (*spvDescriptorSet0.vp_c9)._m0[int(_1672)][_1674];
    int _1678 = int(_1670) + 1;
    uint _1680 = uint(int(uint(_1678) >> uint(2)));
    int _1682 = _1678 & 3;
    float _1684 = (*spvDescriptorSet0.vp_c9)._m0[int(_1680)][_1682];
    float _1686 = fma(_1620, _1642, _1652);
    float _1688 = _1538 * _1648;
    float _1690 = _1604 * _1648;
    float _1692 = _1558 * _1648;
    float _1694 = _1588 * _1648;
    float _1696 = _1688 * _1644;
    int _1698 = _1562 + 8;
    uint _1700 = uint(int(uint(_1698) >> uint(2)));
    uint _1702 = uint(int(uint(int(_1700)) >> uint(2)));
    int _1704 = int(_1700) & 3;
    float _1706 = (*spvDescriptorSet0.vp_c9)._m0[int(_1702)][_1704];
    int _1708 = int(_1700) + 1;
    uint _1710 = uint(int(uint(_1708) >> uint(2)));
    int _1712 = _1708 & 3;
    float _1714 = (*spvDescriptorSet0.vp_c9)._m0[int(_1710)][_1712];
    float _1716 = _1692 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1718 = _1692 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1720 = _1692 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1722 = _1692 * _1644;
    float _1724 = -_1620;
    float _1726 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1716);
    float _1728 = -_1620;
    float _1730 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1718);
    float _1732 = -_1620;
    float _1734 = fma(_1732, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1720);
    float _1736 = fma(_1690, _1564, _1666);
    float _1738 = fma(_1654, _1564, _1722);
    float _1740 = fma(_1658, _1564, _1696);
    float _1742 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1726);
    float _1744 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1730);
    float _1746 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1734);
    int _1748 = abs(_992);
    float _1750 = _1654 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1752 = _1654 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1754 = _1654 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1756 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1750);
    int _1758 = ~_1748;
    int _1760 = _1758 + 1;
    int _1762 = _1760 + 1;
    float _1764 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1752);
    int _1766 = ~_1566;
    int _1768 = _1766 + 1;
    int _1770 = _1768 + 1;
    int _1772 = abs(_1126);
    int _1774 = _1762 * as_type<int>(_1640);
    int _1776 = _1770 * as_type<int>(_1582);
    int _1778 = ~_1772;
    int _1780 = _1778 + 1;
    int _1782 = _1780 + 1;
    float _1784 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1754);
    int _1786 = abs(_1010);
    int _1788 = ~_1584;
    int _1790 = _1788 + 1;
    int _1792 = _1790 + 1;
    int _1794 = _1782 * as_type<int>(_1574);
    int _1796 = _1794 + _1776;
    float _1798 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1800 = int(_1798);
    int _1802 = ~_1786;
    int _1804 = _1802 + 1;
    int _1806 = _1804 + 1;
    int _1808 = _1792 * as_type<int>(_1632);
    int _1810 = _1808 + _1774;
    int _1812 = ~_1590;
    int _1814 = _1812 + 1;
    int _1816 = _1814 + 1;
    int _1818 = _1806 * as_type<int>(_1676);
    int _1820 = _1818 + _1810;
    int _1822 = ~_1600;
    int _1824 = _1822 + 1;
    int _1826 = _1824 + 1;
    int _1828 = ~_1606;
    int _1830 = _1828 + 1;
    int _1832 = _1830 + 1;
    int _1834 = _1816 * as_type<int>(_1706);
    int _1836 = _1834 + _1796;
    int _1838 = abs(_960);
    float _1840 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _1842 = int(_1840);
    int _1844 = _1832 * as_type<int>(_1684);
    int _1846 = _1844 + _1820;
    float _1848 = float(uint(_1800));
    int _1850 = _1826 * as_type<int>(_1714);
    int _1852 = _1850 + _1836;
    float _1854 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    int _1856 = ~_1838;
    int _1858 = _1856 + 1;
    int _1860 = _1858 + 1;
    int _1862 = ~_1608;
    int _1864 = _1862 + 1;
    int _1866 = _1864 + 1;
    float _1868 = fma(_1662, _1854, _1738);
    float _1870 = fma(_1694, _1854, _1736);
    int _1872 = _1846 * _1860;
    float _1874 = 1.0 / _1848;
    int _1876 = _1852 * _1866;
    float _1878 = _1868 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1880 = fma(_1686, _1854, _1740);
    float _1882 = _1868 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1884 = float(uint(_1842));
    float _1886 = fma(_1870, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1878);
    int _1888 = abs(_1842);
    float _1890 = fma(_1870, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1882);
    int _1892 = abs(_1800);
    float _1894 = fma(_1880, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1886);
    float _1896 = 1.0 / _1884;
    float _1898 = fma(_1880, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1890);
    float _1900 = _1522 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1902 = _1894 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    int _1904 = _1118 * _1608;
    int _1906 = _1904 + _1876;
    float _1908 = float(uint(_1892));
    float _1910 = _1524 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1912 = _1898 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1914 = _1662 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1916 = _1662 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1918 = float(uint(_1888));
    float _1920 = _1662 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1922 = _1900 + _1902;
    int _1924 = as_type<int>(_1874) + (-2);
    float _1926 = _1910 + _1912;
    float _1928 = float(uint(_1906));
    float _1930 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1914);
    float _1932 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1916);
    float _1934 = 1.0 / _1908;
    float _1936 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1920);
    int _1938 = _1444 * _1838;
    int _1940 = _1938 + _1872;
    float _1942 = as_type<float>(_1924) * _1928;
    float _1944 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1946 = _1922 + _1944;
    float _1948 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1950 = _1926 + _1948;
    float _1952 = fma(_1686, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1930);
    int _1954 = as_type<int>(_1896) + (-2);
    float _1956 = 1.0 / _1918;
    float _1958 = float(uint(_1940));
    float _1960 = _1946 * _1946;
    float _1962 = _1950 * _1950;
    float _1964 = fma(_1686, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1932);
    int _1966 = abs(_1906);
    float _1968 = fma(_1686, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1936);
    float _1970 = _1960 + _1962;
    float _1972 = trunc(_1942);
    float _1974 = precise::max(_1972, 0.0);
    uint _1976 = uint(_1974);
    float _1978 = as_type<float>(_1954) * _1958;
    float _1980 = _1868 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _1982 = abs(_1940);
    int _1984 = as_type<int>(_1934) + (-2);
    float _1986 = sqrt(_1970);
    float _1988 = float(uint(_1966));
    int _1990 = ~_1800;
    int _1992 = _1990 + 1;
    int _1994 = as_type<int>(_1956) + (-2);
    float _1996 = as_type<float>(_1984) * _1988;
    float _1998 = float(uint(_1982));
    float _2000 = trunc(_1978);
    float _2002 = precise::max(_2000, 0.0);
    uint _2004 = uint(_2002);
    int _2006 = _1992 * int(_1976);
    int _2008 = _2006 + _1906;
    float _2010 = fma(_1870, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1980);
    int _2012 = ~_1842;
    int _2014 = _2012 + 1;
    float _2016 = as_type<float>(_1994) * _1998;
    int _2018 = ~_1892;
    int _2020 = _2018 + 1;
    float _2022 = fma(_1880, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2010);
    float _2024 = float(uint(_2008));
    float _2026 = trunc(_1996);
    float _2028 = precise::max(_2026, 0.0);
    uint _2030 = uint(_2028);
    bool _2032 = _1986 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2034 = _2022 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _2036 = ~_1888;
    int _2038 = _2036 + 1;
    float _2040 = as_type<float>(_1924) * _2024;
    float _2042 = -_191;
    int _2044 = _1112 ? as_type<int>(_2042) : as_type<int>(_191);
    bool _2046 = _326 > 0.5;
    float _2048 = trunc(_2016);
    float _2050 = precise::max(_2048, 0.0);
    uint _2052 = uint(_2050);
    int _2054 = _2014 * int(_2004);
    int _2056 = _2054 + _1940;
    float _2058 = float(uint(_2056));
    float _2060 = _1504 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2062 = trunc(_2040);
    float _2064 = precise::max(_2062, 0.0);
    uint _2066 = uint(_2064);
    float _2068 = _1504;
    float _2070 = _2058;
    float _2072 = _1922;
    float _2074 = _1960;
    float _2076 = _1926;
    int _2078 = as_type<int>(_2060);
    float _2080 = _1900;
    if (!_2032)
    {
        _2068 = _1922;
    }
    float _2082 = _2068;
    float _2084 = as_type<float>(_1954) * _2058;
    float _2086 = _2060 + _2034;
    float _2088 = _2082;
    if (!_2032)
    {
        _2070 = _1962;
    }
    float _2090 = _2070;
    int _2092 = _2020 * int(_2030);
    int _2094 = _2092 + _1966;
    int _2096 = _2038 * int(_2052);
    int _2098 = _2096 + _1982;
    float _2100 = _2090;
    if (!_2032)
    {
        _2072 = _2086;
    }
    float _2102 = _2072;
    float _2104 = float(uint(_2094));
    float _2106 = float(uint(_2098));
    bool _2108 = !_2032;
    float _2110 = _2102;
    if (!_2108)
    {
        float _2112 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2114 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2116 = _1986 + _2114;
        float _2118 = rsqrt(_1970);
        float _2120 = _2116 * _2112;
        float _2122 = _2086 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2124 = _2120 * 0.15915493667125701904296875;
        float _2126 = _2124 * 6.283185482025146484375;
        float _2128 = sin(_2126);
        float _2130 = _2124 * 6.283185482025146484375;
        float _2132 = cos(_2130);
        float _2134 = fma(_2128, _2122, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2136 = _2118 * _2134;
        float _2138 = _2132 + (-1.0);
        float _2140 = fma(_1946, _2136, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2142 = fma(_1950, _2136, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2144 = _2138 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2146 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2148 = _2140 + _2146;
        float _2150 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2152 = _2142 + _2150;
        float _2154 = fma(_2086, _2132, _2144);
        float _2156 = _2148 * _2148;
        float _2158 = _2152 * _2152;
        _2110 = _2154;
        _2074 = _2156;
        _2100 = _2158;
        _2088 = _2140;
        _2076 = _2142;
    }
    float _2160 = _2110;
    float _2162 = _2074;
    float _2164 = _2100;
    float _2166 = _2088;
    float _2168 = _2076;
    float _2170 = as_type<float>(_1984) * _2104;
    float _2172 = trunc(_2084);
    float _2174 = precise::max(_2172, 0.0);
    uint _2176 = uint(_2174);
    float _2178 = fma(_1658, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1756);
    float _2180 = fma(_1658, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1764);
    float _2182 = fma(_1658, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1784);
    float _2184 = -_191;
    int _2186 = _1448 ? as_type<int>(_2184) : as_type<int>(_191);
    float _2188 = as_type<float>(_1994) * _2106;
    int _2190 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2192 = _2190 != 0;
    float _2194 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2196 = _2160 + _2194;
    float _2198 = trunc(_2170);
    float _2200 = precise::max(_2198, 0.0);
    uint _2202 = uint(_2200);
    float _2204 = -_187;
    int _2206 = _1404 ? as_type<int>(_2204) : as_type<int>(_187);
    float _2208 = -_1322;
    float _2210 = _2208 + 1.0;
    float _2212 = -_187;
    int _2214 = _2046 ? as_type<int>(_2212) : as_type<int>(_187);
    float _2216 = fma(_2196, _2196, _2162);
    bool _2218 = !_1612;
    float _2220 = _2218 ? _191 : as_type<float>(_2044);
    float _2222 = -_1352;
    float _2224 = _2222 + 1.0;
    bool _2226 = !_2192;
    float _2228 = _2226 ? _191 : as_type<float>(_2186);
    float _2230 = _191 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _2232 = !_1174;
    float _2234 = _2232 ? _187 : as_type<float>(_2206);
    float _2236 = trunc(_2188);
    float _2238 = precise::max(_2236, 0.0);
    uint _2240 = uint(_2238);
    bool _2242 = !_1616;
    float _2244 = _2242 ? _187 : as_type<float>(_2214);
    float _2246 = _187 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2248 = _2230 * _1742;
    float _2250 = _2230 * _1744;
    float _2252 = _2230 * _1746;
    int _2254 = int(_1976) + int(_2066);
    float _2256 = fma(_2246, _2178, _2248);
    float _2258 = fma(_2246, _2180, _2250);
    float _2260 = fma(_2246, _2182, _2252);
    int _2262 = int(_2004) + int(_2176);
    float _2264 = _2216 + _2164;
    int _2266 = ~_1800;
    int _2268 = _2266 + 1;
    float _2270 = -_1372;
    float _2272 = _2270 + 1.0;
    int _2274 = ~_1892;
    int _2276 = _2274 + 1;
    float _2278 = -_1376;
    float _2280 = _2278 + 1.0;
    int _2282 = ~_1842;
    int _2284 = _2282 + 1;
    int _2286 = _2268 * _2254;
    int _2288 = _2286 + _1906;
    int _2290 = int(_2030) + int(_2202);
    float _2292 = sqrt(_2264);
    out.m_76.x = _2178;
    out.m_76.y = _2180;
    out.m_76.z = _2182;
    int _2294 = ~_1888;
    int _2296 = _2294 + 1;
    int _2298 = int(_2052) + int(_2240);
    int _2300 = _2276 * _2290;
    int _2302 = _2300 + _1966;
    bool _2304 = uint(_2288) >= uint(_1800);
    int _2306 = _2284 * _2262;
    int _2308 = _2306 + _1940;
    float _2310 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2312 = !_2304;
    int _2314 = _2312 ? 0 : (-1);
    bool _2316 = uint(_2302) >= uint(_1892);
    int _2318 = _2296 * _2298;
    int _2320 = _2318 + _1982;
    int _2322 = ~_2254;
    int _2324 = _2322 + _2314;
    int _2326 = _2324 + 1;
    int _2328 = _1906 ^ _1800;
    float _2330 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2332 = uint(_2308) >= uint(_1842);
    bool _2334 = uint(_2320) >= uint(_1888);
    int _2336 = _1800 * _2326;
    int _2338 = _2336 + _1906;
    bool _2340 = !_2316;
    int _2342 = _2340 ? 0 : (-1);
    uint _2344 = uint(int(uint(_2328) >> uint(31)));
    float _2346 = _2310 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2348 = !_2332;
    int _2350 = _2348 ? 0 : (-1);
    bool _2352 = _1800 == 0;
    bool _2354 = _1800 == 0;
    int _2356 = _1940 ^ _1842;
    float _2358 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _2360 = ~_2342;
    int _2362 = _2290 + _2360;
    int _2364 = _2362 + 1;
    int _2366 = ~int(_2344);
    int _2368 = _2366 + 1;
    int _2370 = ~_2262;
    int _2372 = _2370 + _2350;
    int _2374 = _2372 + 1;
    bool _2376 = !_2352;
    int _2378 = _2376 ? _2338 : (-1);
    bool _2380 = !_2334;
    int _2382 = _2380 ? 0 : (-1);
    int _2384 = _1842 * _2374;
    int _2386 = _2384 + _1940;
    uint _2388 = uint(int(uint(_2356) >> uint(31)));
    float _2390 = fma(_2230, _2230, 1.0);
    int _2392 = _2364 ^ _2368;
    float _2394 = float(_2378);
    int _2396 = ~_2382;
    int _2398 = _2298 + _2396;
    int _2400 = _2398 + 1;
    int _2402 = ~int(_2388);
    int _2404 = _2402 + 1;
    int _2406 = ~_2368;
    int _2408 = _2406 + _2392;
    int _2410 = _2408 + 1;
    float _2412 = fma(_2346, _2394, _1344);
    bool _2414 = _1842 == 0;
    float _2416 = rsqrt(_2390);
    bool _2418 = _1842 == 0;
    int _2420 = _2400 ^ _2404;
    bool _2422 = !_2354;
    int _2424 = _2422 ? _2410 : (-1);
    float _2426 = _2358 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _2428 = !_2414;
    int _2430 = _2428 ? _2386 : (-1);
    float _2432 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2434 = ~_2404;
    int _2436 = _2434 + _2420;
    int _2438 = _2436 + 1;
    float _2440 = _2330 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2442 = float(_2424);
    float _2444 = float(_2430);
    float _2446 = _2234 + 0.5;
    bool _2448 = !_2418;
    int _2450 = _2448 ? _2438 : (-1);
    float _2452 = -_1204;
    float _2454 = fma(_2440, _2442, _2452);
    float _2456 = _2244 + 0.5;
    float _2458 = fma(_2426, _2444, _1384);
    float _2460 = fma(_2346, _2446, _2412);
    float _2462 = float(_2450);
    float _2464 = _2228 + (-0.5);
    float _2466 = fma(_2426, _2456, _2458);
    float _2468 = _2230 * _2416;
    float _2470 = _2432 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2472 = -_2440;
    float _2474 = fma(_2472, _2464, _2454);
    float _2476 = _2220 + (-0.5);
    float _2478 = -_1952;
    float _2480 = _2468 * _2478;
    float _2482 = -_1364;
    float _2484 = fma(_2470, _2462, _2482);
    float _2486 = -_1964;
    float _2488 = _2468 * _2486;
    float _2490 = -_1968;
    float _2492 = _2468 * _2490;
    float _2494 = _1952 + _2256;
    float _2496 = -_2470;
    float _2498 = fma(_2496, _2476, _2484);
    float _2500 = fma(_2416, _1742, _2480);
    float _2502 = fma(_2416, _1744, _2488);
    float _2504 = fma(_2416, _1746, _2492);
    float _2506 = -_2210;
    float _2508 = fma(_2234, _2506, _2460);
    float _2510 = _1964 + _2258;
    float _2512 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2514 = -_2224;
    float _2516 = fma(_2244, _2514, _2466);
    float _2518 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2520 = fma(_2228, _2272, _2474);
    float _2522 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2524 = _2512 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2526 = _2518 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2528 = fma(_2220, _2280, _2498);
    float _2530 = _2522 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2532 = _1968 + _2260;
    out.m_78.x = _2500;
    out.m_78.y = _2502;
    out.m_78.z = _2504;
    bool _2534 = _2292 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2536 = isnan(_2292);
    bool _2538 = _2534 || _2536;
    bool _2540 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2542 = _2538 || _2540;
    out.m_80.x = _2524;
    out.m_80.y = _2526;
    out.m_80.z = _2530;
    out.m_82.x = _2508;
    out.m_82.y = _2520;
    out.m_82.z = _2516;
    out.m_82.w = _2528;
    out.m_84.x = _2494;
    out.m_84.y = _2510;
    out.m_84.z = _2532;
    float _2544 = _2224;
    float _2546 = as_type<float>(_2262);
    if (!_2542)
    {
        _2544 = 1.0;
    }
    float _2548 = _2544;
    bool _2550 = !_2542;
    float _2552 = _2548;
    if (!_2550)
    {
        bool _2554 = _2292 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2556 = isnan(_2292);
        bool _2558 = _2554 || _2556;
        bool _2560 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2562 = _2558 || _2560;
        if (!_2562)
        {
            float _2564 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2566 = _2292 + _2564;
            float _2568 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2570 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2568;
            float _2572 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2574 = _2572 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2576 = 1.0 / _2570;
            float _2578 = _2566 * _2576;
            float _2580 = fma(_2578, _2574, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2552 = _2580;
            _2582 = true;
        }
        else
        {
            bool _2584 = _2292 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2586 = isnan(_2292);
            bool _2588 = _2584 || _2586;
            bool _2590 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2592 = _2588 || _2590;
            if (!_2592)
            {
                float _2594 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2596 = _2292 + _2594;
                float _2598 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2600 = _2598 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2602 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2604 = _2602 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2606 = 1.0 / _2600;
                float _2608 = _2596 * _2606;
                float _2610 = fma(_2608, _2604, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2552 = _2610;
                _2582 = true;
            }
            else
            {
                _2552 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2582 = false;
    float _2612 = _2552;
    float _2614 = fma(_1900, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2616 = fma(_1910, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2618 = floor(_2614);
    float _2620 = floor(_2616);
    float _2622 = -_2618;
    float _2624 = _2614 + _2622;
    float _2626 = -_2620;
    float _2628 = _2616 + _2626;
    float2 _7931 = float2(_2624, _2628);
    float _2630 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7931, float2(0.0), isnan(_7931)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7931, float2(0.0), isnan(_7931)), level(0.0)).x;
    float _2632 = _2060 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2634 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2636 = _2166 + _2634;
    float _2638 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2640 = _2168 + _2638;
    float _2642 = fma(_1900, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2632);
    float _2644 = fma(_2636, _2612, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2646 = fma(_2640, _2612, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2648 = fma(_1910, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2642);
    float _2650 = _2060 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2652 = _2648 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2654 = fma(_1900, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2650);
    float _2656 = 1.0 / _2652;
    float _2658 = fma(_1910, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2654);
    float _2660 = _2658 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2662 = _2660 + _2652;
    float _2664 = _2662 * _2656;
    float _2666 = _2664 * 0.5;
    float _2668 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2670 = fma(_2666, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2668);
    float _2672 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _2674 = _2060 + _2672;
    float _2676 = 1.0 / _2670;
    float _2678 = _2674 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _2680 = _2674 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _2682 = fma(_1900, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2678);
    float _2684 = fma(_1900, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2680);
    float _2686 = fma(_1910, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2682);
    float _2688 = fma(_1910, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2684);
    float _2690 = _2686 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _2692 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2694 = _2676 * _2692;
    float _2696 = _2688 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _2698 = trunc(_2690);
    int _2700 = int(_2698);
    bool _2702 = _2694 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _2704 = _2694 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _2706 = !_2702;
    int _2708 = _2706 ? 0 : 1;
    int _2710 = 2;
    float _2712 = _2686;
    if (!_2702)
    {
        _2710 = 1;
    }
    int _2714 = _2710;
    int _2716 = _2714;
    if (!_2704)
    {
        _2716 = _2708;
    }
    int _2718 = _2716;
    float _2720 = trunc(_2696);
    int _2722 = int(_2720);
    int _2724 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2726 = _2700 + _2724;
    int _2728 = _2726 + 1;
    int _2730 = _2718 << 6;
    bool _2732 = _2728 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _2734 = _2730 + 48;
    uint _2736 = uint(int(uint(_2734) >> uint(2)));
    uint _2738 = uint(int(uint(int(_2736)) >> uint(2)));
    int _2740 = int(_2736) & 3;
    float _2742 = (*spvDescriptorSet0.vp_c15)._m0[int(_2738)][_2740];
    int _2744 = int(_2736) + 1;
    uint _2746 = uint(int(uint(_2744) >> uint(2)));
    int _2748 = _2744 & 3;
    float _2750 = (*spvDescriptorSet0.vp_c15)._m0[int(_2746)][_2748];
    int _2752 = _2730 + 56;
    uint _2754 = uint(int(uint(_2752) >> uint(2)));
    uint _2756 = uint(int(uint(int(_2754)) >> uint(2)));
    int _2758 = int(_2754) & 3;
    float _2760 = (*spvDescriptorSet0.vp_c15)._m0[int(_2756)][_2758];
    int _2762 = int(_2754) + 1;
    uint _2764 = uint(int(uint(_2762) >> uint(2)));
    int _2766 = _2762 & 3;
    float _2768 = (*spvDescriptorSet0.vp_c15)._m0[int(_2764)][_2766];
    int _2770 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _2772 = _2722 + _2770;
    int _2774 = _2772 + 1;
    int _2776 = _2728 | _2774;
    int _2778 = _2730 + 64;
    uint _2780 = uint(int(uint(_2778) >> uint(2)));
    uint _2782 = uint(int(uint(int(_2780)) >> uint(2)));
    int _2784 = int(_2780) & 3;
    float _2786 = (*spvDescriptorSet0.vp_c15)._m0[int(_2782)][_2784];
    int _2788 = int(_2780) + 1;
    uint _2790 = uint(int(uint(_2788) >> uint(2)));
    int _2792 = _2788 & 3;
    float _2794 = (*spvDescriptorSet0.vp_c15)._m0[int(_2790)][_2792];
    bool _2796 = _2776 < 0;
    bool _2798 = _2796 || _2732;
    bool _2800 = _2774 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _2802 = _2800 || _2798;
    bool _2804 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2806 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2808 = _2804 || _2806;
    bool _2810 = isnan(0.5);
    bool _2812 = _2808 || _2810;
    int _2814 = _2730 + 72;
    uint _2816 = uint(int(uint(_2814) >> uint(2)));
    uint _2818 = uint(int(uint(int(_2816)) >> uint(2)));
    int _2820 = int(_2816) & 3;
    float _2822 = (*spvDescriptorSet0.vp_c15)._m0[int(_2818)][_2820];
    int _2824 = int(_2816) + 1;
    uint _2826 = uint(int(uint(_2824) >> uint(2)));
    int _2828 = _2824 & 3;
    float _2830 = (*spvDescriptorSet0.vp_c15)._m0[int(_2826)][_2828];
    float _2832 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2834 = _2160 + _2832;
    float _2836 = fma(_2834, _2612, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    int _2838 = _2730 + 96;
    uint _2840 = uint(int(uint(_2838) >> uint(2)));
    uint _2842 = uint(int(uint(int(_2840)) >> uint(2)));
    int _2844 = int(_2840) & 3;
    float _2846 = (*spvDescriptorSet0.vp_c15)._m0[int(_2842)][_2844];
    int _2848 = int(_2840) + 1;
    uint _2850 = uint(int(uint(_2848) >> uint(2)));
    int _2852 = _2848 & 3;
    float _2854 = (*spvDescriptorSet0.vp_c15)._m0[int(_2850)][_2852];
    int _2856 = _2728;
    float _2858 = _2834;
    float _2860 = as_type<float>(_2774);
    float _2862 = as_type<float>(_2718);
    if (!_2802)
    {
        int _2864 = _2774 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _2866 = _2864 + _2728;
        _2856 = _2866;
    }
    int _2868 = _2856;
    if (_2812)
    {
        _2858 = _2644;
    }
    float _2870 = _2858;
    float _2872 = _2870;
    if (_2812)
    {
        _2860 = _2836;
    }
    float _2874 = _2860;
    int _2876 = _2730 + 104;
    uint _2878 = uint(int(uint(_2876) >> uint(2)));
    uint _2880 = uint(int(uint(int(_2878)) >> uint(2)));
    int _2882 = int(_2878) & 3;
    float _2884 = (*spvDescriptorSet0.vp_c15)._m0[int(_2880)][_2882];
    int _2886 = int(_2878) + 1;
    uint _2888 = uint(int(uint(_2886) >> uint(2)));
    int _2890 = _2886 & 3;
    float _2892 = (*spvDescriptorSet0.vp_c15)._m0[int(_2888)][_2890];
    float _2894 = _2874;
    if (_2812)
    {
        _2712 = _2646;
    }
    float _2896 = _2712;
    float _2898 = _2896;
    int _2900 = as_type<int>(_2854);
    if (!_2812)
    {
        float _2902 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2904 = _2060 + _2902;
        float _2906 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2908 = _1900 + _2906;
        float _2910 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2912 = _2904 * _2904;
        float _2914 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2916 = _1910 + _2914;
        float _2918 = fma(_2908, _2908, _2912);
        float _2920 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2922 = fma(_2916, _2916, _2918);
        float _2924 = sqrt(_2922);
        float _2926 = _2910 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2928 = -_1910;
        float _2930 = _2928 + _2646;
        float _2932 = precise::min(_2924, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2934 = _2932 * _2920;
        float _2936 = -_2060;
        float _2938 = _2936 + _2836;
        float _2940 = _2926 * _2934;
        float _2942 = -_1900;
        float _2944 = _2942 + _2644;
        float _2946 = fma(_2938, _2940, _2060);
        float _2948 = fma(_2944, _2940, _1900);
        float _2950 = fma(_2930, _2940, _1910);
        _2894 = _2946;
        _2872 = _2948;
        _2898 = _2950;
    }
    float _2952 = _2894;
    float _2954 = _2872;
    float _2956 = _2898;
    float _2958 = _2674 * _2854;
    int _2960 = as_type<int>(_2958);
    if (!_2802)
    {
        int _2962 = _2868 << 2;
        _2078 = _2962;
    }
    int _2964 = _2078;
    float _2966 = _2952 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2968 = as_type<float>(_2964);
    if (!_2802)
    {
        uint _2970 = uint(int(uint(_2868) >> uint(2)));
        _2900 = int(_2970);
    }
    int _2972 = _2900;
    float _2974 = fma(_1900, _2846, _2958);
    if (!_2802)
    {
        int _2976 = 12 & _2964;
        _2960 = _2976;
    }
    int _2978 = _2960;
    float _2980 = fma(_2954, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2966);
    float _2982 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2984 = fma(_1910, _2884, _2974);
    if (!_2802)
    {
        int _2986 = _2972 << 4;
        int _2988 = _2986 + _2978;
        _2968 = as_type<float>(_2988);
    }
    float _2990 = _2968;
    float _2992 = fma(_2956, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2980);
    int _2994 = _2730 + 80;
    uint _2996 = uint(int(uint(_2994) >> uint(2)));
    uint _2998 = uint(int(uint(int(_2996)) >> uint(2)));
    int _3000 = int(_2996) & 3;
    float _3002 = (*spvDescriptorSet0.vp_c15)._m0[int(_2998)][_3000];
    int _3004 = int(_2996) + 1;
    uint _3006 = uint(int(uint(_3004) >> uint(2)));
    int _3008 = _3004 & 3;
    float _3010 = (*spvDescriptorSet0.vp_c15)._m0[int(_3006)][_3008];
    float _3012 = _2984 + _2892;
    float _3014 = _2674 * _2750;
    float _3016 = _2674 * _2794;
    float _3018 = _2992 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3020 = 1.0 / _3012;
    float _3022 = fma(_1900, _2742, _3014);
    float _3024 = fma(_1900, _2786, _3016);
    float _3026 = _2990;
    if (!_2802)
    {
        int _3028 = as_type<int>(_2990) + 400;
        uint _3030 = uint(int(uint(_3028) >> uint(2)));
        uint _3032 = uint(int(uint(int(_3030)) >> uint(2)));
        int _3034 = int(_3030) & 3;
        float _3036 = (*spvDescriptorSet0.vp_c15)._m0[int(_3032)][_3034];
        _3026 = _3036;
    }
    float _3038 = _3026;
    float _3040 = _3018 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3042 = fma(_1910, _2760, _3022);
    float _3044 = fma(_1910, _2822, _3024);
    float _3046 = _2952 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3048 = -_3040;
    float _3050 = fma(_3048, _2982, 1.0);
    float _3052 = _2952 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3054 = _3042 + _2768;
    int _3056 = _2730 + 88;
    uint _3058 = uint(int(uint(_3056) >> uint(2)));
    uint _3060 = uint(int(uint(int(_3058)) >> uint(2)));
    int _3062 = int(_3058) & 3;
    float _3064 = (*spvDescriptorSet0.vp_c15)._m0[int(_3060)][_3062];
    int _3066 = int(_3058) + 1;
    uint _3068 = uint(int(uint(_3066) >> uint(2)));
    int _3070 = _3066 & 3;
    float _3072 = (*spvDescriptorSet0.vp_c15)._m0[int(_3068)][_3070];
    float _3074 = fma(_2954, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3046);
    float _3076 = fma(_2954, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3052);
    float _3078 = _2952 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3080 = _2646;
    float _3082 = _3076;
    if (!_2802)
    {
        float _3084 = floor(_2696);
        _3080 = _3084;
    }
    float _3086 = _3080;
    float _3088 = _3054 * _3020;
    float _3090 = fma(_2956, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3076);
    float _3092 = _3044 + _2830;
    float _3094 = fma(_2956, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3074);
    float _3096 = fma(_2954, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3078);
    bool _3098 = _3088 >= 0.0;
    float _3100 = _3090 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3102 = _3092 * _3020;
    float _3104 = _3094 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    bool _3106 = _3088 <= 1.0;
    bool _3108 = _3106 && _3098;
    float _3110 = _3100 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3112 = fma(_2956, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3096);
    float _3114 = log2(_3050);
    bool _3116 = _3102 >= 0.0;
    bool _3118 = _3116 && _3108;
    float _3120 = fma(_3104, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3110);
    float _3122 = _3112 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3124 = _3100 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    bool _3126 = _3102 <= 1.0;
    bool _3128 = _3126 && _3118;
    float _3130 = fma(_3018, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3120);
    float _3132 = _3086;
    if (!_2802)
    {
        float _3134 = -_3086;
        float _3136 = _2696 + _3134;
        _3132 = _3136;
    }
    float _3138 = _3132;
    float _3140 = _2982;
    if (!_2802)
    {
        float _3142 = floor(_2690);
        _3140 = _3142;
    }
    float _3144 = _3140;
    float _3146 = fma(_3122, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3130);
    float _3148 = _2674 * _3010;
    float _3150 = 1.0 / _3146;
    float _3152 = _3100 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    if (_3128)
    {
        float _3154 = float(_2718);
        _3082 = _3154;
    }
    float _3156 = _3082;
    float _3158 = fma(_1900, _3002, _3148);
    float _3160 = fma(_3104, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3124);
    float _3162 = fma(_3104, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3152);
    float _3164 = _3114 * 0.693147182464599609375;
    float _3166 = _3038;
    float _3168 = _3156;
    float _3170 = _3162;
    if (!_2802)
    {
        float _3172 = rint(_3038);
        float _3174 = precise::max(_3172, 0.0);
        uint _3176 = uint(_3174);
        uint _3178 = clamp(_3176, 0u, 65535u);
        _3166 = as_type<float>(_3178);
    }
    float _3180 = _3166;
    float _3182 = fma(_3018, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3160);
    float _3184 = fma(_3018, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3162);
    if (!_2802)
    {
        float _3186 = -_3144;
        float _3188 = _2690 + _3186;
        _2862 = _3188;
    }
    float _3190 = _2862;
    float _3192 = fma(_3122, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3184);
    float _3194 = fma(_1910, _3064, _3158);
    float _3196 = _3158;
    if (_3128)
    {
        float _3198 = rint(_3156);
        float _3200 = precise::max(_3198, 0.0);
        uint _3202 = uint(_3200);
        uint _3204 = clamp(_3202, 0u, 65535u);
        _3196 = as_type<float>(_3204);
    }
    float _3206 = _3196;
    float _3208 = _3194 + _3072;
    float _3210 = fma(_3122, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3182);
    float _3212 = _3192 * _3150;
    float _3214 = _3208 * _3020;
    float _3216 = _3210 * _3150;
    float _3218 = _3164 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3220 = fma(_3212, -0.5, 0.5);
    float _3222 = fma(_3216, 0.5, 0.5);
    float _3224 = _3180;
    float _3226 = _3214;
    if (!_2802)
    {
        float3 _8956 = float3(_3190, _3138, float(as_type<int>(_3180)));
        float3 _8960 = select(_8956, float3(0.0), isnan(_8956));
        float _3228 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _8960.xy, uint(rint(_8960.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _8960.xy, uint(rint(_8960.z)), level(0.0)).x;
        _3224 = _3228;
    }
    float _3230 = _3224;
    float _3232 = _3102;
    if (_3128)
    {
        float3 _8975 = float3(_3088, _3102, float(as_type<int>(_3206)));
        float3 _8977 = select(_8975, float3(0.0), isnan(_8975));
        float _3234 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _8977.xy, uint(rint(_8977.z)), _3214, level(0.0));
        _3232 = _3234;
    }
    float _3236 = _3232;
    float3 _8987 = float3(_3222, _3220, _3218);
    float _3238 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8987, float3(0.0), isnan(_8987)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8987, float3(0.0), isnan(_8987)), level(0.0)).x;
    float3 _8996 = float3(_3222, _3220, _3218);
    float4 _3241 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8996, float3(0.0), isnan(_8996)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8996, float3(0.0), isnan(_8996)), level(0.0)).xyzw;
    float _3243 = _3241.x;
    float _3245 = _3241.y;
    float _3247 = _3241.z;
    float _3249 = _3241.w;
    float _3251 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    if (_2802)
    {
        _3168 = 1.0;
    }
    float _3253 = _3168;
    bool _3255 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _3257 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3259 = _3255 || _3257;
    bool _3261 = isnan(0.5);
    bool _3263 = _3259 || _3261;
    float _3265 = _3253;
    if (_3263)
    {
        _3251 = 1.0;
    }
    float _3267 = _3251;
    float _3269 = _3267;
    if (_3263)
    {
        _3170 = 1.0;
    }
    float _3271 = _3170;
    float _3273 = _3271;
    float _3275 = _3243;
    if (!_3263)
    {
        float _3277 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _3279 = _3277 * 0.15915493667125701904296875;
        float _3281 = _3279 * 6.283185482025146484375;
        float _3283 = cos(_3281);
        float _3285 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _3287 = _3285 * 0.15915493667125701904296875;
        float _3289 = _3279 * 6.283185482025146484375;
        float _3291 = sin(_3289);
        float _3293 = 1.0 / _3283;
        float _3295 = _3287 * 6.283185482025146484375;
        float _3297 = cos(_3295);
        float _3299 = _3291 * _3293;
        float _3301 = _3287 * 6.283185482025146484375;
        float _3303 = sin(_3301);
        float _3305 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3307 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3305;
        float _3309 = _3297 * _3299;
        float _3311 = 1.0 / _3307;
        float _3313 = 1.0 / _3309;
        float _3315 = _3303 * _3313;
        float _3317 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3319 = fma(_2694, _3315, _3317);
        float _3321 = _3319 * _3311;
        float _3323 = precise::clamp(_3321, 0.0, 1.0);
        _3273 = _3323;
    }
    float _3325 = _3273;
    if (!_3263)
    {
        float _3327 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _3329 = _3327 * 0.15915493667125701904296875;
        float _3331 = _3329 * 6.283185482025146484375;
        float _3333 = cos(_3331);
        float _3335 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _3337 = _3335 * 0.15915493667125701904296875;
        float _3339 = _3329 * 6.283185482025146484375;
        float _3341 = sin(_3339);
        float _3343 = 1.0 / _3333;
        float _3345 = _3337 * 6.283185482025146484375;
        float _3347 = cos(_3345);
        float _3349 = _3341 * _3343;
        float _3351 = _3337 * 6.283185482025146484375;
        float _3353 = sin(_3351);
        float _3355 = _3347 * _3349;
        float _3357 = 1.0 / _3355;
        float _3359 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3361 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _3359;
        float _3363 = 1.0 / _3361;
        float _3365 = _3353 * _3357;
        float _3367 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3369 = fma(_2694, _3365, _3367);
        float _3371 = _3369 * _3363;
        float _3373 = precise::clamp(_3371, 0.0, 1.0);
        float _3375 = -_3373;
        float _3377 = _3375 + 1.0;
        _3269 = _3377;
    }
    float _3379 = _3269;
    if (!_2802)
    {
        int _3381 = _2868 << 4;
        int _3383 = _3381 + 2048;
        uint _3385 = uint(int(uint(_3383) >> uint(2)));
        uint _3387 = uint(int(uint(int(_3385)) >> uint(2)));
        int _3389 = int(_3385) & 3;
        float _3391 = (*spvDescriptorSet0.vp_c15)._m0[int(_3387)][_3389];
        int _3393 = int(_3385) + 1;
        uint _3395 = uint(int(uint(_3393) >> uint(2)));
        int _3397 = _3393 & 3;
        float _3399 = (*spvDescriptorSet0.vp_c15)._m0[int(_3395)][_3397];
        int _3401 = _3383 + 8;
        uint _3403 = uint(int(uint(_3401) >> uint(2)));
        uint _3405 = uint(int(uint(int(_3403)) >> uint(2)));
        int _3407 = int(_3403) & 3;
        float _3409 = (*spvDescriptorSet0.vp_c15)._m0[int(_3405)][_3407];
        int _3411 = int(_3403) + 1;
        uint _3413 = uint(int(uint(_3411) >> uint(2)));
        int _3415 = _3411 & 3;
        float _3417 = (*spvDescriptorSet0.vp_c15)._m0[int(_3413)][_3415];
        float _3419 = _2674 * _3399;
        float _3421 = fma(_1900, _3391, _3419);
        float _3423 = fma(_1910, _3409, _3421);
        float _3425 = _3423 + _3417;
        float _3427 = precise::clamp(_3425, 0.0, 1.0);
        float _3429 = -_3427;
        float _3431 = _3429 + _3230;
        float _3433 = fma(_3431, 500.0, 1.5);
        float _3435 = exp2(_3433);
        float _3437 = 0.0 + _3435;
        float _3439 = precise::clamp(_3437, 0.0, 1.0);
        _3265 = _3439;
    }
    float _3441 = _3265;
    float _3443 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3445 = _2952 + _3443;
    float _3447 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3449 = _2954 + _3447;
    float _3451 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3453 = _2956 + _3451;
    float _3455 = _3445 * _3445;
    float _3457 = fma(_3449, _3449, _3455);
    float _3459 = fma(_3453, _3453, _3457);
    float _3461 = rsqrt(_3459);
    float _3463 = _3461 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3465 = _3449 * _3463;
    float _3467 = _3453 * _3463;
    float _3469 = _3465 * _3465;
    float _3471 = _3467 * _3467;
    float _3473 = _3469 + _3471;
    float _3475 = sqrt(_3473);
    bool _3477 = _3475 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3479 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3481 = _3475 + _3479;
    float _3483 = _3453;
    float _3485 = _3461;
    float _3487 = _3481;
    float _3489 = _3445;
    if (_3477)
    {
        float _3491 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3483 = _3491;
    }
    float _3493 = _3483;
    if (_3477)
    {
        float _3495 = rsqrt(_3473);
        _3485 = _3495;
    }
    float _3497 = _3485;
    float _3499 = _3497;
    if (_3477)
    {
        float _3501 = _3481 * _3493;
        _3487 = _3501;
    }
    float _3503 = _3487;
    if (_3477)
    {
        float _3505 = _3503 * 0.15915493667125701904296875;
        _2080 = _3505;
    }
    float _3507 = _2080;
    float _3509 = _3493;
    float _3511 = _3507;
    if (_3477)
    {
        float _3513 = _3507 * 6.283185482025146484375;
        float _3515 = sin(_3513);
        _3509 = _3515;
    }
    float _3517 = _3509;
    float _3519 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3521 = precise::max(0.0, _3519);
    float _3523 = _3455;
    float _3525 = _3521;
    if (_3477)
    {
        float _3527 = _3507 * 6.283185482025146484375;
        float _3529 = cos(_3527);
        _3523 = _3529;
    }
    float _3531 = _3523;
    float _3533 = -_3463;
    float _3535 = -_3521;
    float _3537 = fma(_3445, _3533, _3535);
    if (!_3477)
    {
        _3489 = _3467;
    }
    float _3539 = _3489;
    float _3541 = _3539;
    if (_3477)
    {
        float _3543 = _3537 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3525 = _3543;
    }
    float _3545 = _3525;
    float _3547 = _3545;
    if (!_3477)
    {
        _3511 = _3469;
    }
    float _3549 = _3511;
    float _3551 = _3517;
    float _3553 = _3549;
    if (_3477)
    {
        float _3555 = fma(_3517, _3545, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3551 = _3555;
    }
    float _3557 = _3551;
    float _3559 = _3557;
    float _3561 = _3531;
    if (_3477)
    {
        float _3563 = _3531 + (-1.0);
        _3547 = _3563;
    }
    float _3565 = _3547;
    float _3567 = _3565;
    if (_3477)
    {
        float _3569 = _3497 * _3557;
        _2546 = _3569;
    }
    float _3571 = _2546;
    if (!_3477)
    {
        _3499 = _3465;
    }
    float _3573 = _3499;
    float _3575 = _3573;
    if (_3477)
    {
        float _3577 = _3565 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3567 = _3577;
    }
    float _3579 = _3567;
    if (_3477)
    {
        float _3581 = _3465 * _3571;
        _3575 = _3581;
    }
    float _3583 = _3575;
    if (!_3477)
    {
        _3559 = _3537;
    }
    float _3585 = _3559;
    float _3587 = _3585;
    if (_3477)
    {
        float _3589 = _3467 * _3571;
        _3541 = _3589;
    }
    float _3591 = _3541;
    if (_3477)
    {
        float _3593 = fma(_3537, _3531, _3579);
        _3587 = _3593;
    }
    float _3595 = _3587;
    if (_3477)
    {
        float _3597 = _3583 * _3583;
        _3553 = _3597;
    }
    float _3599 = _3553;
    if (!_3477)
    {
        _3561 = _3471;
    }
    float _3601 = _3561;
    float _3603 = _3601;
    if (_3477)
    {
        float _3605 = _3591 * _3591;
        _3603 = _3605;
    }
    float _3607 = _3603;
    float _3609 = sqrt(_3459);
    float _3611 = fma(_3595, _3595, _3599);
    float _3613 = _3611 + _3607;
    float _3615 = rsqrt(_3613);
    float _3617 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3619 = fma(_3609, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3617);
    float _3621 = precise::clamp(_3619, 0.0, 1.0);
    float _3623 = -_3621;
    float _3625 = _3623 + 1.0;
    float _3627 = abs(_3625);
    float _3629 = log2(_3627);
    float _3631 = _3615 * _3583;
    float _3633 = _3615 * _3595;
    float _3635 = _3615 * _3591;
    float _3637 = _3631 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3639 = -_3637;
    float _3641 = fma(_3633, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3639);
    float _3643 = -_3635;
    float _3645 = fma(_3643, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3641);
    float _3647 = _3629 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3649 = fma(_3645, -0.5, 0.5);
    float _3651 = fma(_3645, 0.5, 0.5);
    float _3653 = exp2(_3647);
    float _3655 = fma(_3651, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3657 = fma(_3651, _3655, -0.212114393711090087890625);
    float _3659 = _3633 + 1.0;
    float _3661 = sqrt(_3649);
    float _3663 = fma(_3651, _3657, 1.570728778839111328125);
    float _3665 = -_3633;
    float _3667 = fma(_3653, _3659, _3665);
    float _3669 = fma(_3667, 0.5, 0.5);
    float _3671 = _3661 * 0.636619746685028076171875;
    float _3673 = -_3663;
    float _3675 = fma(_3671, _3673, 1.0);
    float2 _9637 = float2(_3675, _3669);
    float3 _3679 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9637, float2(0.0), isnan(_9637)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9637, float2(0.0), isnan(_9637)), level(0.0)).xyz;
    float _3681 = _3679.x;
    float _3683 = _3679.y;
    float _3685 = _3679.z;
    float _3687 = abs(_2694);
    float _3689 = log2(_3687);
    float _3691 = _3100 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3693 = _3629 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3695 = -_2630;
    float _3697 = _3695 + 1.0;
    out.m_86.x = _2954;
    out.m_86.y = _2952;
    out.m_86.z = _2956;
    float _3699 = fma(_3104, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3691);
    float _3701 = exp2(_3693);
    float _3703 = fma(_3018, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3699);
    bool _3705 = _2694 <= 8000.0;
    bool _3707 = isnan(_2694);
    bool _3709 = _3705 || _3707;
    bool _3711 = isnan(8000.0);
    bool _3713 = _3709 || _3711;
    float _3715 = float(_3713);
    float _3717 = fma(_3122, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3703);
    float _3719 = _3689 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3721 = _3717 + _3146;
    float _3723 = _3721 * 0.5;
    float _3725 = exp2(_3719);
    out.gl_Position.x = _3210;
    out.gl_Position.y = _3192;
    out.gl_Position.z = _3717;
    out.gl_Position.w = _3146;
    out.m_88.z = _3723;
    out.m_88.w = _3146;
    float _3727 = _3210;
    if (!_3128)
    {
        _3727 = 1.0;
    }
    float _3729 = _3727;
    float _3731 = fma(_3725, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3733 = precise::clamp(_3731, 0.0, 1.0);
    float _3735 = _3729;
    if (_3128)
    {
        bool _3737 = _3236 >= _3214;
        bool _3739 = isnan(_3236);
        bool _3741 = _3737 || _3739;
        bool _3743 = isnan(_3214);
        bool _3745 = _3741 || _3743;
        float _3747 = float(_3745);
        _3735 = _3747;
    }
    float _3749 = _3735;
    bool _3751 = _3609 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3753 = isnan(_3609);
    bool _3755 = _3751 || _3753;
    bool _3757 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3759 = _3755 || _3757;
    float _3761 = fma(_3733, -2.0, 3.0);
    float _3763 = _3733 * _3733;
    float _3765 = _3749 * _3441;
    float _3767 = _3763 * _3761;
    float _3769 = -_3767;
    float _3771 = _3769 + 1.0;
    if (!_3759)
    {
        _3226 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3773 = _3226;
    float _3775 = fma(_3771, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3767);
    float _3777 = -_3701;
    float _3779 = _3777 + 1.0;
    float _3781 = _3715 * _3775;
    float _3783 = _3779 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3785 = _3781 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3787 = _3783 * _3238;
    float _3789 = -_3783;
    float _3791 = _3789 + 1.0;
    float _3793 = _3697 * _3785;
    float _3795 = precise::clamp(_3793, 0.0, 1.0);
    float _3797 = _3249 * _3787;
    float _3799 = _3249 * _3791;
    float _3801 = _3785;
    float _3803 = _3795;
    float _3805 = _3791;
    float _3807 = _3773;
    float _3809 = _3773;
    if (!_3759)
    {
        _3801 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3811 = _3801;
    float _3813 = -_3795;
    float _3815 = fma(_3813, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3817 = _3811;
    float _3819 = _3811;
    if (!_3759)
    {
        _3803 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3821 = _3803;
    float _3823 = _3821;
    float _3825 = _3821;
    if (!_3759)
    {
        _3805 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3827 = _3805;
    float _3829 = -_3765;
    float _3831 = fma(_3829, _3815, 1.0);
    float _3833 = precise::clamp(_3831, 0.0, 1.0);
    float _3835 = _3833 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3837 = _3325 * _3379;
    out.m_90.x = _3835;
    float _3839 = _3685 * _3787;
    float _3841 = fma(_3681, _3797, _3243);
    float _3843 = fma(_3683, _3797, _3245);
    float _3845 = _3837 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3847 = fma(_3249, _3839, _3247);
    float _3849 = _3837;
    float _3851 = _3827;
    float _3853 = _3827;
    if (!_3759)
    {
        _3275 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3855 = _3275;
    float _3857 = _3855;
    float _3859 = _3855;
    if (!_3759)
    {
        _3849 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3861 = _3849;
    out.m_92.x = _3841;
    out.m_92.y = _3843;
    out.m_92.z = _3847;
    out.m_92.w = _3799;
    bool _3863 = !_3759;
    float _3865 = _3861;
    float _3867 = _3861;
    if (!_3863)
    {
        bool _3869 = _3609 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3871 = isnan(_3609);
        bool _3873 = _3869 || _3871;
        bool _3875 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3877 = _3873 || _3875;
        if (!_3877)
        {
            float _3879 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3881 = _3609 + _3879;
            float _3883 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3885 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3883;
            float _3887 = 1.0 / _3885;
            float _3889 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3891 = _3889 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3893 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3895 = _3893 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3897 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3899 = _3897 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3901 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3903 = _3901 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3905 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3907 = _3905 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3909 = _3881 * _3887;
            float _3911 = precise::clamp(_3909, 0.0, 1.0);
            float _3913 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3915 = _3913 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3917 = fma(_3911, _3891, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3919 = fma(_3911, _3915, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3921 = fma(_3911, _3895, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3923 = fma(_3911, _3899, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3925 = fma(_3911, _3903, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3927 = fma(_3911, _3907, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3819 = _3919;
            _3853 = _3925;
            _3859 = _3917;
            _3809 = _3923;
            _3825 = _3921;
            _3867 = _3927;
            _3929 = true;
        }
        else
        {
            bool _3931 = _3609 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3933 = isnan(_3609);
            bool _3935 = _3931 || _3933;
            bool _3937 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3939 = _3935 || _3937;
            if (!_3939)
            {
                _3857 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3941 = _3857;
            _3859 = _3941;
            if (!_3939)
            {
                _3817 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3943 = _3817;
            _3819 = _3943;
            if (!_3939)
            {
                _3823 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3945 = _3823;
            _3825 = _3945;
            if (!_3939)
            {
                _3807 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3947 = _3807;
            _3809 = _3947;
            if (!_3939)
            {
                _3851 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3949 = _3851;
            _3853 = _3949;
            if (!_3939)
            {
                _3865 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3951 = _3865;
            bool _3953 = !_3939;
            _3867 = _3951;
            if (!_3953)
            {
                bool _3955 = _3609 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3957 = isnan(_3609);
                bool _3959 = _3955 || _3957;
                bool _3961 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3963 = _3959 || _3961;
                if (!_3963)
                {
                    float _3965 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3967 = _3609 + _3965;
                    float _3969 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3971 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3969;
                    float _3973 = 1.0 / _3971;
                    float _3975 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3977 = _3975 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3979 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3981 = _3979 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3983 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3985 = _3983 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3987 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3989 = _3987 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3991 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3993 = _3991 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3995 = _3967 * _3973;
                    float _3997 = precise::clamp(_3995, 0.0, 1.0);
                    float _3999 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4001 = _3999 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4003 = fma(_3997, _3977, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4005 = fma(_3997, _4001, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4007 = fma(_3997, _3981, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4009 = fma(_3997, _3985, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4011 = fma(_3997, _3989, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4013 = fma(_3997, _3993, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3819 = _4005;
                    _3853 = _4011;
                    _3859 = _4003;
                    _3809 = _4009;
                    _3825 = _4007;
                    _3867 = _4013;
                    _3929 = true;
                }
                else
                {
                    _3819 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3853 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3859 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3809 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3825 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3867 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3929 = false;
    float _4015 = _3819;
    float _4017 = _3853;
    float _4019 = _3859;
    float _4021 = _3809;
    float _4023 = _3825;
    float _4025 = _3867;
    float _4027 = fma(_2510, -0.5, 0.5);
    float _4029 = precise::clamp(_4027, 0.0, 1.0);
    float _4031 = -_4015;
    float _4033 = _4031 + _4017;
    float _4035 = _3845 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4037 = -_4019;
    float _4039 = _4037 + _4021;
    out.m_94.x = 0.0;
    float _4041 = fma(_4029, _4033, _4015);
    float _4043 = fma(_4029, _4039, _4019);
    out.m_61.x = _4035;
    float _4045 = -_4023;
    float _4047 = _4045 + _4025;
    float _4049 = _4041 * 0.586610972881317138671875;
    bool _4051 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4053 = fma(_4029, _4047, _4023);
    float _4055 = fma(_4043, 0.298911988735198974609375, _4049);
    bool _4057 = _3325 > 0.0;
    bool _4059 = isnan(_3325);
    bool _4061 = _4057 || _4059;
    bool _4063 = isnan(0.0);
    bool _4065 = _4061 || _4063;
    float _4067 = fma(_4053, 0.114477999508380889892578125, _4055);
    bool _4069 = _3379 <= 0.0;
    bool _4071 = !_4065;
    bool _4073 = _4069 || _4071;
    float _4075 = -_4067;
    float _4077 = _4043 + _4075;
    float _4079 = -_4067;
    float _4081 = _4041 + _4079;
    float _4083 = -_4067;
    float _4085 = _4053 + _4083;
    float _4087 = fma(_4077, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4067);
    float _4089 = fma(_4081, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4067);
    float _4091 = fma(_4085, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4067);
    bool _4093 = !_4051;
    if (!_4093)
    {
        float _4095 = -_2952;
        float _4097 = _4095 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4099 = -_2954;
        float _4101 = _4099 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4103 = -_2956;
        float _4105 = _4103 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4107 = _4097 * _4097;
        float _4109 = fma(_4101, _4101, _4107);
        float _4111 = fma(_4105, _4105, _4109);
        float _4113 = sqrt(_4111);
        float _4115 = rsqrt(_4111);
        float _4117 = -_4113;
        float _4119 = _4117 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4121 = _4119 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4123 = precise::clamp(_4121, 0.0, 1.0);
        float _4125 = _4101 * _4115;
        float _4127 = _4097 * _4115;
        float _4129 = abs(_4123);
        float _4131 = log2(_4129);
        float _4133 = _4105 * _4115;
        float _4135 = _4125 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4137 = _2510 * _4127;
        float _4139 = -_4127;
        float _4141 = -_4135;
        float _4143 = fma(_4139, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4141);
        float _4145 = fma(_2494, _4125, _4137);
        float _4147 = -_4133;
        float _4149 = fma(_4147, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4143);
        float _4151 = fma(_2532, _4133, _4145);
        float _4153 = precise::clamp(_4151, 0.0, 1.0);
        float _4155 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4157 = _4149 + _4155;
        float _4159 = _4131 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4161 = _4157 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4163 = precise::clamp(_4161, 0.0, 1.0);
        float _4165 = exp2(_4159);
        float _4167 = _4165 * _4163;
        float _4169 = _4153 * _4167;
        float _4171 = _4169 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4173 = _4169 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4175 = _4169 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_94.x = _4171;
        out.m_94.y = _4173;
        out.m_94.z = _4175;
    }
    out.m_96.x = _4087;
    out.m_96.y = _4089;
    out.m_96.z = _4091;
    if (!_4073)
    {
        return out;
    }
    out.m_61.x = 0.0;
    float _4177 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4177;
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
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3929 = false;
    bool _2582 = false;
    bool _213 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _110 = in.m_58.w;
    float _112 = trunc(_110);
    int _115 = int(_112);
    bool _119 = _115 >= 1;
    float _121 = 0.0;
    if (!_119)
    {
        _121 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _123 = _121;
    float _125 = _123;
    if (!_119)
    {
        out.m_61.x = 0.0;
    }
    int _127 = 0;
    if (!_119)
    {
        float _129 = _123 * 5.0;
        _127 = as_type<int>(_129);
    }
    int _131 = _127;
    int _133 = _131;
    if (!_119)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4234 = as_type<float>(_131);
        out.gl_Position.z = _4234;
    }
    if (!_119)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _135 = in.m_63.w;
    bool _137 = _135 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _139 = isnan(_135);
    bool _141 = _137 || _139;
    bool _143 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _145 = _141 || _143;
    float _147 = -_135;
    float _149 = _147 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _151 = 0.0;
    float _153 = _149;
    if (_145)
    {
        float _155 = float(_115);
        _151 = _155;
    }
    float _157 = _151;
    bool _159 = _149 >= _157;
    bool _161 = !_145;
    bool _163 = _159 || _161;
    if (_163)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _165 = _125;
    if (_163)
    {
        out.m_61.x = 0.0;
    }
    if (_163)
    {
        float _167 = _165 * 5.0;
        _133 = as_type<int>(_167);
    }
    int _169 = _133;
    float _171 = as_type<float>(_169);
    if (_163)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4305 = as_type<float>(_169);
        out.gl_Position.z = _4305;
    }
    if (_163)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _173 = as_type<float>(int(gl_VertexIndex));
    bool _175 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _177 = as_type<int>(_173) & 1;
    bool _179 = _177 != 0;
    int _181 = as_type<int>(_173) & 2;
    bool _183 = _181 != 0;
    bool _185 = !_179;
    float _187 = _185 ? (-0.5) : 0.5;
    bool _189 = !_183;
    float _191 = _189 ? (-0.5) : 0.5;
    bool _193 = !_175;
    float _211;
    if (!_193)
    {
        float _195 = in.m_68.x;
        float _197 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _199 = _195 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _201 = fma(_199, (*spvDescriptorSet0.vp_c9)._m0[12].x, _149);
        float _203 = _201 * _197;
        float _205 = floor(_203);
        float _207 = -_205;
        float _209 = _203 + _207;
        _211 = _209;
        _213 = true;
    }
    else
    {
        float _215 = float(_115);
        float _217 = 1.0 / _215;
        float _219 = _149 * _217;
        _211 = _219;
    }
    _213 = false;
    float _221 = _211;
    float _223 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _225 = int(_223);
    float _227 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _229 = _221 + _227;
    float _231 = float(_115);
    int _233 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _235 = _233 != 0;
    float _237 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _239 = int(_237);
    float _241 = float(_225);
    float _243 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _245 = int(_243);
    int _247 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    if (_235)
    {
        float _249 = in.m_68.x;
        _171 = _249;
    }
    float _251 = _171;
    float _253 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _255 = _251;
    if (!_235)
    {
        float _257 = in.m_68.y;
        _255 = _257;
    }
    float _259 = _255;
    float _261 = float(_239);
    float _263 = 1.0 / _241;
    float _265 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _267 = int(_265);
    float _269 = float(uint(_245));
    int _271 = ~_245;
    int _273 = _271 + 1;
    bool _275 = _245 == 0;
    float _277 = 1.0 / _261;
    float _279 = _263 * _149;
    float _281 = 1.0 / _269;
    float _283 = float(uint(_267));
    int _285 = ~_267;
    int _287 = _285 + 1;
    float _289 = trunc(_279);
    int _291 = int(_289);
    float _293 = _277 * _149;
    float _295 = 1.0 / _283;
    int _297 = as_type<int>(_281) + (-2);
    float _299 = trunc(_293);
    int _301 = int(_299);
    float _303 = float(uint(_291));
    float _305 = as_type<float>(_297) * _303;
    int _307 = as_type<int>(_295) + (-2);
    float _309 = 1.0 / _231;
    float _311 = float(uint(_301));
    float _313 = trunc(_305);
    float _315 = precise::max(_313, 0.0);
    uint _318 = uint(_315);
    float _320 = as_type<float>(_307) * _311;
    float _322 = in.m_68.x;
    float _324 = in.m_68.y;
    float _326 = in.m_68.z;
    float _328 = in.m_68.w;
    float _330 = trunc(_320);
    float _332 = precise::max(_330, 0.0);
    uint _334 = uint(_332);
    float _336 = _309 * _149;
    int _338 = _273 * int(_318);
    int _340 = _338 + _291;
    float _342 = float(uint(_340));
    float _344 = as_type<float>(_340);
    if (_235)
    {
        _344 = 1.0;
    }
    float _346 = _344;
    int _348 = _287 * int(_334);
    int _350 = _348 + _301;
    float _352 = _346;
    float _354 = as_type<float>(_350);
    if (!_235)
    {
        _352 = 7.345489978790283203125;
    }
    float _356 = _352;
    float _358 = as_type<float>(_297) * _342;
    float _360 = float(uint(_350));
    float _362 = trunc(_358);
    float _364 = precise::max(_362, 0.0);
    uint _366 = uint(_364);
    if (_235)
    {
        _354 = 1.0;
    }
    float _368 = _354;
    float _370 = _356 * _322;
    float _372 = _368;
    if (!_235)
    {
        _372 = 1.2345600128173828125;
    }
    float _374 = _372;
    float _376 = as_type<float>(_307) * _360;
    float _378 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[78].z, _253);
    float _380 = floor(_370);
    float _382 = _259 * _374;
    int _384 = ~_245;
    int _386 = _384 + 1;
    float _388 = float(_291);
    float _390 = trunc(_376);
    float _392 = precise::max(_390, 0.0);
    uint _394 = uint(_392);
    int _396 = int(_318) + int(_366);
    int _398 = ~_267;
    int _400 = _398 + 1;
    int _402 = _386 * _396;
    int _404 = _402 + _291;
    float _406 = float(_245);
    float _408 = floor(_382);
    float _410 = -_380;
    float _412 = _370 + _410;
    bool _414 = uint(_404) >= uint(_245);
    bool _416 = _388 >= _406;
    bool _418 = isnan(_388);
    bool _420 = _416 || _418;
    bool _422 = isnan(_406);
    bool _424 = _420 || _422;
    float _426 = float(_424);
    float _428 = _412 * _406;
    bool _430 = !_414;
    int _432 = _430 ? 0 : (-1);
    int _434 = int(_334) + int(_394);
    float _436 = trunc(_426);
    int _438 = int(_436);
    int _440 = ~_396;
    int _442 = _440 + _432;
    int _444 = _442 + 1;
    float _446 = float(_301);
    int _448 = _400 * _434;
    int _450 = _448 + _301;
    float _452 = -_408;
    float _454 = _382 + _452;
    float _456 = trunc(_428);
    int _458 = int(_456);
    bool _460 = uint(_450) >= uint(_267);
    int _462 = _245 * _444;
    int _464 = _462 + _291;
    float _466 = float(_267);
    float _468 = _406 * _336;
    int _470 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _472 = _470 != 0;
    bool _474 = _446 >= _466;
    bool _476 = isnan(_446);
    bool _478 = _474 || _476;
    bool _480 = isnan(_466);
    bool _482 = _478 || _480;
    float _484 = float(_482);
    float _486 = _454 * _466;
    bool _488 = !_472;
    int _490 = _488 ? 0 : 1;
    float _492 = _466 * _336;
    bool _494 = !_460;
    int _496 = _494 ? 0 : (-1);
    float _498 = trunc(_468);
    int _500 = int(_498);
    int _502 = abs(_490);
    int _504 = ~_438;
    int _506 = _504 + 1;
    int _508 = _506 + 1;
    bool _510 = !_275;
    int _512 = _510 ? _464 : (-1);
    int _514 = _458 * _502;
    int _516 = _514 + _291;
    int _518 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _520 = _518 != 0;
    int _522 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _524 = _522 != 0;
    int _526 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _528 = _526 != 0;
    float _530 = trunc(_484);
    int _532 = int(_530);
    int _534 = ~_434;
    int _536 = _534 + _496;
    int _538 = _536 + 1;
    int _540 = _512 * _508;
    bool _542 = _267 == 0;
    bool _544 = !_524;
    int _546 = _544 ? 0 : 1;
    int _548 = _267 * _538;
    int _550 = _548 + _301;
    int _552 = _245 + (-1);
    float _554 = trunc(_486);
    int _556 = int(_554);
    int _558 = abs(_546);
    bool _560 = !_542;
    int _562 = _560 ? _550 : (-1);
    int _564 = _438 * _552;
    int _566 = _564 + _540;
    int _568 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _570 = _568 != 0;
    float _572 = trunc(_492);
    int _574 = int(_572);
    int _576 = ~_532;
    int _578 = _576 + 1;
    int _580 = _578 + 1;
    bool _582 = !_570;
    int _584 = _582 ? 0 : 1;
    int _586 = _566 * _558;
    int _588 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _590 = _588 != 0;
    int _592 = _562 * _580;
    bool _594 = !_520;
    int _596 = _594 ? 0 : 1;
    int _598 = abs(_584);
    int _600 = abs(_596);
    bool _602 = !_528;
    int _604 = _602 ? 0 : 1;
    int _606 = _556 * _598;
    int _608 = _606 + _301;
    int _610 = _267 + (-1);
    int _612 = _500 * _600;
    int _614 = _612 + _586;
    bool _616 = !_590;
    int _618 = _616 ? 0 : 1;
    int _620 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _622 = _620 != 0;
    int _624 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _626 = _624 != 0;
    int _628 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _630 = _628 != 0;
    int _632 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _634 = _632 != 0;
    int _636 = _532 * _610;
    int _638 = _636 + _592;
    int _640 = abs(_604);
    int _642 = abs(_618);
    bool _644 = !_626;
    int _646 = _644 ? 0 : 1;
    int _648 = abs(_646);
    bool _650 = !_622;
    int _652 = _650 ? 0 : 1;
    int _654 = _516 * _640;
    int _656 = _654 + _614;
    bool _658 = !_630;
    int _660 = _658 ? 0 : 1;
    int _662 = _458 * _642;
    int _664 = _662 + _656;
    bool _666 = !_634;
    int _668 = _666 ? 0 : 1;
    int _670 = abs(_660);
    int _672 = _638 * _648;
    int _674 = abs(_668);
    float _676 = float(uint(_664));
    int _678 = abs(_652);
    float _680 = as_type<float>(_297) * _676;
    int _682 = ~_245;
    int _684 = _682 + 1;
    int _686 = _574 * _678;
    int _688 = _686 + _672;
    int _690 = ~_267;
    int _692 = _690 + 1;
    float _694 = trunc(_680);
    float _696 = precise::max(_694, 0.0);
    uint _698 = uint(_696);
    int _700 = _608 * _670;
    int _702 = _700 + _688;
    float _704 = float(uint(_608));
    bool _706 = _245 == 0;
    int _708 = _556 * _674;
    int _710 = _708 + _702;
    int _712 = ~_245;
    int _714 = _712 + 1;
    float _716 = as_type<float>(_307) * _704;
    bool _718 = _267 == 0;
    float _720 = float(uint(_710));
    float _722 = trunc(_716);
    float _724 = precise::max(_722, 0.0);
    uint _726 = uint(_724);
    int _728 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _730 = _728 != 0;
    float _732 = as_type<float>(_307) * _720;
    int _734 = _714 * int(_698);
    int _736 = _734 + _664;
    float _738 = trunc(_732);
    float _740 = precise::max(_738, 0.0);
    uint _742 = uint(_740);
    float _744 = float(uint(_736));
    if (_730)
    {
        _247 = 0;
    }
    int _746 = _247;
    float _748 = as_type<float>(_297) * _744;
    int _750 = _746;
    if (!_730)
    {
        _750 = 1;
    }
    int _752 = _750;
    float _754 = float(uint(_516));
    float _756 = trunc(_748);
    float _758 = precise::max(_756, 0.0);
    uint _760 = uint(_758);
    float _762 = as_type<float>(_297) * _754;
    int _764 = _692 * int(_742);
    int _766 = _764 + _710;
    int _768 = ~_245;
    int _770 = _768 + 1;
    float _772 = trunc(_762);
    float _774 = precise::max(_772, 0.0);
    uint _776 = uint(_774);
    float _778 = float(uint(_766));
    int _780 = int(_698) + int(_760);
    float _782 = as_type<float>(_307) * _778;
    int _784 = ~_267;
    int _786 = _784 + 1;
    int _788 = _684 * _780;
    int _790 = _788 + _664;
    float _792 = trunc(_782);
    float _794 = precise::max(_792, 0.0);
    uint _796 = uint(_794);
    bool _798 = uint(_790) >= uint(_245);
    bool _800 = !_798;
    int _802 = _800 ? 0 : (-1);
    int _804 = ~_780;
    int _806 = _804 + _802;
    int _808 = _806 + 1;
    int _810 = _770 * int(_776);
    int _812 = _810 + _516;
    int _814 = ~_267;
    int _816 = _814 + 1;
    int _818 = int(_742) + int(_796);
    int _820 = _245 * _808;
    int _822 = _820 + _664;
    float _824 = float(uint(_812));
    bool _826 = !_706;
    int _828 = _826 ? _822 : (-1);
    int _830 = _786 * _818;
    int _832 = _830 + _710;
    float _834 = as_type<float>(_297) * _824;
    bool _836 = uint(_832) >= uint(_267);
    int _838 = _828 & 3;
    bool _840 = _838 != 0;
    int _842 = _816 * int(_726);
    int _844 = _842 + _608;
    int _846 = _828 & 3;
    bool _848 = _846 != 0;
    float _850 = trunc(_834);
    float _852 = precise::max(_850, 0.0);
    uint _854 = uint(_852);
    bool _856 = uint(_838) >= 2u;
    float _858 = float(uint(_844));
    bool _860 = !_836;
    int _862 = _860 ? 0 : (-1);
    int _864 = _848 ? 0 : 1;
    float _866 = as_type<float>(_307) * _858;
    int _868 = _856 ? 0 : 1;
    bool _870 = uint(_838) > 1u;
    bool _872 = _838 != 3;
    float _874 = trunc(_866);
    float _876 = precise::max(_874, 0.0);
    uint _878 = uint(_876);
    int _880 = ~_818;
    int _882 = _880 + _862;
    int _884 = _882 + 1;
    int _886 = ~_864;
    int _888 = _886 + 1;
    int _890 = _888 + 1;
    int _892 = ~_868;
    int _894 = _892 + 1;
    int _896 = _894 + 1;
    int _898 = _267 * _884;
    int _900 = _898 + _710;
    int _902 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _904 = _902 != 0;
    int _906 = int(_776) + int(_854);
    float _908 = _324 * 2.0;
    bool _910 = !_718;
    int _912 = _910 ? _900 : (-1);
    int _914 = _890;
    int _916 = _896;
    float _918 = as_type<float>(_786);
    float _920 = as_type<float>(_906);
    if (!_870)
    {
        int _922 = ~_864;
        int _924 = _922 + 1;
        _914 = _924;
    }
    int _926 = _914;
    float _928 = _322 * 2.0;
    if (_872)
    {
        int _930 = ~_868;
        int _932 = _930 + 1;
        _916 = _932;
    }
    int _934 = _916;
    float _936 = floor(_908);
    int _938 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _940 = _938 != 0;
    int _942 = _912 & 3;
    bool _944 = _942 != 0;
    bool _946 = !_940;
    int _948 = _946 ? 0 : 1;
    int _950 = _912 & 3;
    bool _952 = _950 != 0;
    float _954 = floor(_928);
    bool _956 = uint(_942) > 1u;
    bool _958 = !_904;
    int _960 = _958 ? 0 : 1;
    bool _962 = _942 != 3;
    int _964 = ~_245;
    int _966 = _964 + 1;
    int _968 = _952 ? 0 : 1;
    bool _970 = uint(_942) >= 2u;
    int _972 = _966 * _906;
    int _974 = _972 + _516;
    int _976 = ~_968;
    int _978 = _976 + 1;
    int _980 = _978 + 1;
    int _982 = _970 ? 0 : 1;
    int _984 = _980;
    float _986 = as_type<float>(_974);
    if (!_956)
    {
        int _988 = ~_968;
        int _990 = _988 + 1;
        _984 = _990;
    }
    int _992 = _984;
    int _994 = ~_982;
    int _996 = _994 + 1;
    int _998 = _996 + 1;
    bool _1000 = _752 != 1;
    bool _1002 = uint(_974) >= uint(_245);
    int _1004 = _998;
    if (_962)
    {
        int _1006 = ~_982;
        int _1008 = _1006 + 1;
        _1004 = _1008;
    }
    int _1010 = _1004;
    bool _1012 = _954 > 0.0;
    bool _1014 = !_1002;
    int _1016 = _1014 ? 0 : (-1);
    int _1018 = ~_267;
    int _1020 = _1018 + 1;
    bool _1022 = _954 >= 0.0;
    bool _1024 = isnan(_954);
    bool _1026 = _1022 || _1024;
    bool _1028 = isnan(0.0);
    bool _1030 = _1026 || _1028;
    int _1032 = int(_726) + int(_878);
    int _1034 = _1030 ? 0 : 1;
    int _1036 = ~_906;
    int _1038 = _1036 + _1016;
    int _1040 = _1038 + 1;
    int _1042 = _1020 * _1032;
    int _1044 = _1042 + _608;
    if (!_1000)
    {
        _918 = _324;
    }
    float _1046 = _918;
    float _1048 = _1046;
    if (!_1000)
    {
        _986 = _324;
    }
    float _1050 = _986;
    int _1052 = _245 * _1040;
    int _1054 = _1052 + _516;
    float _1056 = 0.0;
    float _1058 = _1050;
    if (!_1000)
    {
        _1056 = _326;
    }
    float _1060 = _1056;
    float _1062 = _1060;
    if (!_1000)
    {
        _920 = _326;
    }
    float _1064 = _920;
    int _1066 = ~_1034;
    int _1068 = _1066 + 1;
    int _1070 = _1068 + 1;
    float _1072 = _1064;
    int _1074 = _1070;
    if (_1000)
    {
        _1048 = _322;
    }
    float _1076 = _1048;
    if (_1000)
    {
        _1058 = _322;
    }
    float _1078 = _1058;
    if (_1000)
    {
        _1062 = _324;
    }
    float _1080 = _1062;
    if (_1000)
    {
        _1072 = _324;
    }
    float _1082 = _1072;
    if (!_1012)
    {
        int _1084 = ~_1034;
        int _1086 = _1084 + 1;
        _1074 = _1086;
    }
    int _1088 = _1074;
    float _1090 = _324 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1092 = _936 >= 0.0;
    bool _1094 = isnan(_936);
    bool _1096 = _1092 || _1094;
    bool _1098 = isnan(0.0);
    bool _1100 = _1096 || _1098;
    bool _1102 = uint(_1044) >= uint(_267);
    int _1104 = _1100 ? 0 : 1;
    bool _1106 = !_1102;
    int _1108 = _1106 ? 0 : (-1);
    bool _1110 = _936 > 0.0;
    bool _1112 = _328 > 0.5;
    bool _1114 = _838 != 3;
    bool _1116 = !_706;
    int _1118 = _1116 ? _1054 : (-1);
    bool _1120 = !_944;
    int _1122 = _1120 ? 0 : 1;
    bool _1124 = !_840;
    int _1126 = _1124 ? 0 : 1;
    int _1128 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1130 = _1128 != 0;
    int _1132 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1134 = _1132 != 0;
    int _1136 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1138 = _1136 != 0;
    int _1140 = ~_1104;
    int _1142 = _1140 + 1;
    int _1144 = _1142 + 1;
    float _1146 = _326 * 2.0;
    int _1148 = _1144;
    if (!_1110)
    {
        int _1150 = ~_1104;
        int _1152 = _1150 + 1;
        _1148 = _1152;
    }
    int _1154 = _1148;
    float _1156 = in.m_58.x;
    float _1158 = in.m_58.y;
    float _1160 = in.m_58.z;
    float _1162 = floor(_1146);
    bool _1164 = _942 != 3;
    float _1166 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1168 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _1166;
    float _1170 = 1.0 / _1168;
    int _1172 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1174 = _1172 != 0;
    float _1176 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1178 = _322 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1180 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1182 = -_1176;
    float _1184 = fma(_1178, 2.0, _1182);
    float _1186 = fma(_1090, -2.0, _1180);
    bool _1188 = !_1130;
    int _1190 = _1188 ? 0 : 1;
    float _1192 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _1194 = _1162 >= 0.0;
    bool _1196 = isnan(_1162);
    bool _1198 = _1194 || _1196;
    bool _1200 = isnan(0.0);
    bool _1202 = _1198 || _1200;
    float _1204 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1186);
    float _1206 = _1158 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1208 = _1158 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _1210 = _1202 ? 0 : 1;
    float _1212 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _1214 = _1162 > 0.0;
    float _1216 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1218 = _322 + _324;
    float _1220 = _1158 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1222 = _1212 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1224 = _1192 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1226 = _1216 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1228 = _229 * _1170;
    float _1230 = _1218 + (-1.0);
    float _1232 = fma(_1156, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1206);
    float _1234 = fma(_1156, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1208);
    float _1236 = fma(_1156, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1220);
    float _1238 = _326 + _322;
    float _1240 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1242 = log2(_1240);
    float _1244 = _326 + _324;
    out.m_70.x = _1222;
    out.m_70.y = _1224;
    out.m_70.z = _1226;
    float _1246 = fma(_1230, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1248 = ~_1210;
    int _1250 = _1248 + 1;
    int _1252 = _1250 + 1;
    int _1254 = _1252;
    if (!_1214)
    {
        int _1256 = ~_1210;
        int _1258 = _1256 + 1;
        _1254 = _1258;
    }
    int _1260 = _1254;
    float _1262 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _1264 = !_1134;
    int _1266 = _1264 ? 0 : 1;
    int _1268 = abs(_1190);
    float _1270 = _1238 + (-1.0);
    float _1272 = _1244 + (-1.0);
    float _1274 = _1242 * _149;
    float _1276 = fma(_1270, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1278 = fma(_1272, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1280 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1282 = _1080 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1284 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1286 = fma(_1078, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1280);
    float _1288 = _1076 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1290 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1292 = fma(_1082, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1284);
    float _1294 = exp2(_1274);
    float _1296 = -_1262;
    float _1298 = fma(_1288, 2.0, _1296);
    float _1300 = fma(_1282, -2.0, _1290);
    float _1302 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1304 = 1.0 + _1302;
    float _1306 = in.m_72.x;
    float _1308 = in.m_72.y;
    float _1310 = in.m_72.z;
    int _1312 = abs(_1266);
    float _1314 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1316 = float(_1088);
    float _1318 = 1.0 / _1304;
    float _1320 = float(_1268);
    float _1322 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[77].z, _378);
    float _1324 = float(_1260);
    bool _1326 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1328 = isnan(0.0);
    bool _1330 = _1326 || _1328;
    bool _1332 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1334 = _1330 || _1332;
    float _1336 = -_1294;
    float _1338 = _1336 + 1.0;
    float _1340 = _1320 * _1324;
    float _1342 = -_149;
    float _1344 = fma(_1342, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1184);
    float _1346 = float(_1312);
    float _1348 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1314);
    float _1350 = _1334 ? _1338 : 0.0;
    float _1352 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1286);
    bool _1354 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1356 = isnan(1.0);
    bool _1358 = _1354 || _1356;
    bool _1360 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1362 = _1358 || _1360;
    float _1364 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1300);
    float _1366 = _1340 * (-2.0);
    bool _1368 = !_1138;
    int _1370 = _1368 ? 0 : 1;
    float _1372 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1348);
    float _1374 = _1346 * _1316;
    float _1376 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1292);
    float _1378 = fma(_1366, _1306, _1306);
    int _1380 = abs(_1370);
    float _1382 = -_149;
    float _1384 = fma(_1382, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1298);
    int _1386 = ~_1032;
    int _1388 = _1386 + _1108;
    int _1390 = _1388 + 1;
    float _1392 = _1374 * (-2.0);
    float _1394 = fma(_1246, _1366, _1246);
    if (_1362)
    {
        float _1396 = _1350 * _1318;
        _153 = _1396;
    }
    float _1398 = _153;
    int _1400 = _267 * _1390;
    int _1402 = _1400 + _608;
    bool _1404 = _322 > 0.5;
    float _1406 = fma(_1278, _1392, _1278);
    bool _1408 = _267 == 0;
    float _1410 = _322 + (-0.5);
    float _1412 = fma(_1392, _1308, _1308);
    float _1414 = fma(_1410, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1378);
    float _1416 = float(_1154);
    float _1418 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1420 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1418;
    float _1422 = float(_1380);
    float _1424 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1426 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1424;
    bool _1428 = _221 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _1430 = isnan(_221);
    bool _1432 = _1428 || _1430;
    bool _1434 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _1436 = _1432 || _1434;
    float _1438 = float(_1436);
    float _1440 = fma(_1420, _1228, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _1442 = !_1408;
    int _1444 = _1442 ? _1402 : (-1);
    float _1446 = _1422 * _1416;
    bool _1448 = _324 > 0.5;
    float _1450 = _324 + (-0.5);
    bool _1452 = _221 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1454 = isnan(_221);
    bool _1456 = _1452 || _1454;
    bool _1458 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1460 = _1456 || _1458;
    float _1462 = float(_1460);
    float _1464 = -_1438;
    float _1466 = _1464 + 1.0;
    float _1468 = fma(_1394, _1398, _1414);
    float _1470 = fma(_1426, _1228, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _1472 = _1446 * (-2.0);
    float _1474 = fma(_1450, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1412);
    float _1476 = _1462 * _1466;
    float _1478 = in.m_74.x;
    float _1480 = in.m_74.y;
    float _1482 = fma(_1472, _1310, _1310);
    float _1484 = _326 + (-0.5);
    float _1486 = _1440 * _1476;
    float _1488 = -_1462;
    float _1490 = _1488 + 1.0;
    float _1492 = _1470 * _1476;
    float _1494 = fma(_1276, _1472, _1276);
    float _1496 = fma(_1484, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1482);
    float _1498 = fma(_1490, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1486);
    float _1500 = fma(_1490, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1492);
    float _1502 = fma(_1406, _1398, _1474);
    float _1504 = fma(_1160, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1234);
    float _1506 = fma(_1494, _1398, _1496);
    float _1508 = fma(_1438, (*spvDescriptorSet0.vp_c9)._m0[144].x, _1498);
    float _1510 = fma(_1438, (*spvDescriptorSet0.vp_c9)._m0[144].y, _1500);
    int _1512 = _912 >> 31;
    float _1514 = _1506 * 0.15915493667125701904296875;
    int _1516 = _828 >> 31;
    float _1518 = _1468 * 0.15915493667125701904296875;
    int _1520 = _1512 & 3;
    float _1522 = fma(_1160, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1232);
    float _1524 = fma(_1160, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1236);
    int _1526 = _1516 & 3;
    float _1528 = _1502 * 0.15915493667125701904296875;
    int _1530 = _912 + _1520;
    float _1532 = _1508 * _1478;
    int _1534 = _828 + _1526;
    float _1536 = _1518 * 6.283185482025146484375;
    float _1538 = sin(_1536);
    int _1540 = _1530 >> 2;
    float _1542 = _1510 * _1480;
    float _1544 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _187);
    int _1546 = _1534 >> 2;
    float _1548 = _1532 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1550 = _1540 << 4;
    int _1552 = _1550 + 512;
    float _1554 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _191);
    float _1556 = _1518 * 6.283185482025146484375;
    float _1558 = cos(_1556);
    int _1560 = _1546 << 4;
    int _1562 = _1560 + 368;
    float _1564 = _1548 * _1544;
    int _1566 = abs(_926);
    uint _1568 = uint(int(uint(_1562) >> uint(2)));
    uint _1570 = uint(int(uint(int(_1568)) >> uint(2)));
    int _1572 = int(_1568) & 3;
    float _1574 = (*spvDescriptorSet0.vp_c9)._m0[int(_1570)][_1572];
    int _1576 = int(_1568) + 1;
    uint _1578 = uint(int(uint(_1576) >> uint(2)));
    int _1580 = _1576 & 3;
    float _1582 = (*spvDescriptorSet0.vp_c9)._m0[int(_1578)][_1580];
    int _1584 = abs(_1122);
    float _1586 = _1528 * 6.283185482025146484375;
    float _1588 = sin(_1586);
    int _1590 = abs(_934);
    bool _1592 = !_1114;
    int _1594 = _1592 ? 0 : (-1);
    bool _1596 = !_1164;
    int _1598 = _1596 ? 0 : (-1);
    int _1600 = abs(_1594);
    float _1602 = _1528 * 6.283185482025146484375;
    float _1604 = cos(_1602);
    int _1606 = abs(_1598);
    int _1608 = abs(_948);
    int _1610 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1612 = _1610 != 0;
    int _1614 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1616 = _1614 != 0;
    float _1618 = _1514 * 6.283185482025146484375;
    float _1620 = sin(_1618);
    float _1622 = _1542 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1624 = _1558 * _1588;
    uint _1626 = uint(int(uint(_1552) >> uint(2)));
    uint _1628 = uint(int(uint(int(_1626)) >> uint(2)));
    int _1630 = int(_1626) & 3;
    float _1632 = (*spvDescriptorSet0.vp_c9)._m0[int(_1628)][_1630];
    int _1634 = int(_1626) + 1;
    uint _1636 = uint(int(uint(_1634) >> uint(2)));
    int _1638 = _1634 & 3;
    float _1640 = (*spvDescriptorSet0.vp_c9)._m0[int(_1636)][_1638];
    float _1642 = _1538 * _1588;
    float _1644 = _1622 * _1554;
    float _1646 = _1514 * 6.283185482025146484375;
    float _1648 = cos(_1646);
    float _1650 = _1538 * _1604;
    float _1652 = _1558 * _1604;
    float _1654 = fma(_1620, _1652, _1642);
    float _1656 = -_1624;
    float _1658 = fma(_1620, _1650, _1656);
    float _1660 = -_1650;
    float _1662 = fma(_1620, _1624, _1660);
    float _1664 = -_1644;
    float _1666 = _1620 * _1664;
    int _1668 = _1552 + 8;
    uint _1670 = uint(int(uint(_1668) >> uint(2)));
    uint _1672 = uint(int(uint(int(_1670)) >> uint(2)));
    int _1674 = int(_1670) & 3;
    float _1676 = (*spvDescriptorSet0.vp_c9)._m0[int(_1672)][_1674];
    int _1678 = int(_1670) + 1;
    uint _1680 = uint(int(uint(_1678) >> uint(2)));
    int _1682 = _1678 & 3;
    float _1684 = (*spvDescriptorSet0.vp_c9)._m0[int(_1680)][_1682];
    float _1686 = fma(_1620, _1642, _1652);
    float _1688 = _1538 * _1648;
    float _1690 = _1604 * _1648;
    float _1692 = _1558 * _1648;
    float _1694 = _1588 * _1648;
    float _1696 = _1688 * _1644;
    int _1698 = _1562 + 8;
    uint _1700 = uint(int(uint(_1698) >> uint(2)));
    uint _1702 = uint(int(uint(int(_1700)) >> uint(2)));
    int _1704 = int(_1700) & 3;
    float _1706 = (*spvDescriptorSet0.vp_c9)._m0[int(_1702)][_1704];
    int _1708 = int(_1700) + 1;
    uint _1710 = uint(int(uint(_1708) >> uint(2)));
    int _1712 = _1708 & 3;
    float _1714 = (*spvDescriptorSet0.vp_c9)._m0[int(_1710)][_1712];
    float _1716 = _1692 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1718 = _1692 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1720 = _1692 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1722 = _1692 * _1644;
    float _1724 = -_1620;
    float _1726 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1716);
    float _1728 = -_1620;
    float _1730 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1718);
    float _1732 = -_1620;
    float _1734 = fma(_1732, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1720);
    float _1736 = fma(_1690, _1564, _1666);
    float _1738 = fma(_1654, _1564, _1722);
    float _1740 = fma(_1658, _1564, _1696);
    float _1742 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1726);
    float _1744 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1730);
    float _1746 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1734);
    int _1748 = abs(_992);
    float _1750 = _1654 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1752 = _1654 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1754 = _1654 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1756 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1750);
    int _1758 = ~_1748;
    int _1760 = _1758 + 1;
    int _1762 = _1760 + 1;
    float _1764 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1752);
    int _1766 = ~_1566;
    int _1768 = _1766 + 1;
    int _1770 = _1768 + 1;
    int _1772 = abs(_1126);
    int _1774 = _1762 * as_type<int>(_1640);
    int _1776 = _1770 * as_type<int>(_1582);
    int _1778 = ~_1772;
    int _1780 = _1778 + 1;
    int _1782 = _1780 + 1;
    float _1784 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1754);
    int _1786 = abs(_1010);
    int _1788 = ~_1584;
    int _1790 = _1788 + 1;
    int _1792 = _1790 + 1;
    int _1794 = _1782 * as_type<int>(_1574);
    int _1796 = _1794 + _1776;
    float _1798 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1800 = int(_1798);
    int _1802 = ~_1786;
    int _1804 = _1802 + 1;
    int _1806 = _1804 + 1;
    int _1808 = _1792 * as_type<int>(_1632);
    int _1810 = _1808 + _1774;
    int _1812 = ~_1590;
    int _1814 = _1812 + 1;
    int _1816 = _1814 + 1;
    int _1818 = _1806 * as_type<int>(_1676);
    int _1820 = _1818 + _1810;
    int _1822 = ~_1600;
    int _1824 = _1822 + 1;
    int _1826 = _1824 + 1;
    int _1828 = ~_1606;
    int _1830 = _1828 + 1;
    int _1832 = _1830 + 1;
    int _1834 = _1816 * as_type<int>(_1706);
    int _1836 = _1834 + _1796;
    int _1838 = abs(_960);
    float _1840 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _1842 = int(_1840);
    int _1844 = _1832 * as_type<int>(_1684);
    int _1846 = _1844 + _1820;
    float _1848 = float(uint(_1800));
    int _1850 = _1826 * as_type<int>(_1714);
    int _1852 = _1850 + _1836;
    float _1854 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    int _1856 = ~_1838;
    int _1858 = _1856 + 1;
    int _1860 = _1858 + 1;
    int _1862 = ~_1608;
    int _1864 = _1862 + 1;
    int _1866 = _1864 + 1;
    float _1868 = fma(_1662, _1854, _1738);
    float _1870 = fma(_1694, _1854, _1736);
    int _1872 = _1846 * _1860;
    float _1874 = 1.0 / _1848;
    int _1876 = _1852 * _1866;
    float _1878 = _1868 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1880 = fma(_1686, _1854, _1740);
    float _1882 = _1868 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1884 = float(uint(_1842));
    float _1886 = fma(_1870, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1878);
    int _1888 = abs(_1842);
    float _1890 = fma(_1870, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1882);
    int _1892 = abs(_1800);
    float _1894 = fma(_1880, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1886);
    float _1896 = 1.0 / _1884;
    float _1898 = fma(_1880, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1890);
    float _1900 = _1522 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1902 = _1894 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    int _1904 = _1118 * _1608;
    int _1906 = _1904 + _1876;
    float _1908 = float(uint(_1892));
    float _1910 = _1524 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1912 = _1898 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1914 = _1662 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1916 = _1662 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1918 = float(uint(_1888));
    float _1920 = _1662 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1922 = _1900 + _1902;
    int _1924 = as_type<int>(_1874) + (-2);
    float _1926 = _1910 + _1912;
    float _1928 = float(uint(_1906));
    float _1930 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1914);
    float _1932 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1916);
    float _1934 = 1.0 / _1908;
    float _1936 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1920);
    int _1938 = _1444 * _1838;
    int _1940 = _1938 + _1872;
    float _1942 = as_type<float>(_1924) * _1928;
    float _1944 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1946 = _1922 + _1944;
    float _1948 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1950 = _1926 + _1948;
    float _1952 = fma(_1686, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1930);
    int _1954 = as_type<int>(_1896) + (-2);
    float _1956 = 1.0 / _1918;
    float _1958 = float(uint(_1940));
    float _1960 = _1946 * _1946;
    float _1962 = _1950 * _1950;
    float _1964 = fma(_1686, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1932);
    int _1966 = abs(_1906);
    float _1968 = fma(_1686, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1936);
    float _1970 = _1960 + _1962;
    float _1972 = trunc(_1942);
    float _1974 = precise::max(_1972, 0.0);
    uint _1976 = uint(_1974);
    float _1978 = as_type<float>(_1954) * _1958;
    float _1980 = _1868 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _1982 = abs(_1940);
    int _1984 = as_type<int>(_1934) + (-2);
    float _1986 = sqrt(_1970);
    float _1988 = float(uint(_1966));
    int _1990 = ~_1800;
    int _1992 = _1990 + 1;
    int _1994 = as_type<int>(_1956) + (-2);
    float _1996 = as_type<float>(_1984) * _1988;
    float _1998 = float(uint(_1982));
    float _2000 = trunc(_1978);
    float _2002 = precise::max(_2000, 0.0);
    uint _2004 = uint(_2002);
    int _2006 = _1992 * int(_1976);
    int _2008 = _2006 + _1906;
    float _2010 = fma(_1870, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1980);
    int _2012 = ~_1842;
    int _2014 = _2012 + 1;
    float _2016 = as_type<float>(_1994) * _1998;
    int _2018 = ~_1892;
    int _2020 = _2018 + 1;
    float _2022 = fma(_1880, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2010);
    float _2024 = float(uint(_2008));
    float _2026 = trunc(_1996);
    float _2028 = precise::max(_2026, 0.0);
    uint _2030 = uint(_2028);
    bool _2032 = _1986 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2034 = _2022 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _2036 = ~_1888;
    int _2038 = _2036 + 1;
    float _2040 = as_type<float>(_1924) * _2024;
    float _2042 = -_191;
    int _2044 = _1112 ? as_type<int>(_2042) : as_type<int>(_191);
    bool _2046 = _326 > 0.5;
    float _2048 = trunc(_2016);
    float _2050 = precise::max(_2048, 0.0);
    uint _2052 = uint(_2050);
    int _2054 = _2014 * int(_2004);
    int _2056 = _2054 + _1940;
    float _2058 = float(uint(_2056));
    float _2060 = _1504 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2062 = trunc(_2040);
    float _2064 = precise::max(_2062, 0.0);
    uint _2066 = uint(_2064);
    float _2068 = _1504;
    float _2070 = _2058;
    float _2072 = _1922;
    float _2074 = _1960;
    float _2076 = _1926;
    int _2078 = as_type<int>(_2060);
    float _2080 = _1900;
    if (!_2032)
    {
        _2068 = _1922;
    }
    float _2082 = _2068;
    float _2084 = as_type<float>(_1954) * _2058;
    float _2086 = _2060 + _2034;
    float _2088 = _2082;
    if (!_2032)
    {
        _2070 = _1962;
    }
    float _2090 = _2070;
    int _2092 = _2020 * int(_2030);
    int _2094 = _2092 + _1966;
    int _2096 = _2038 * int(_2052);
    int _2098 = _2096 + _1982;
    float _2100 = _2090;
    if (!_2032)
    {
        _2072 = _2086;
    }
    float _2102 = _2072;
    float _2104 = float(uint(_2094));
    float _2106 = float(uint(_2098));
    bool _2108 = !_2032;
    float _2110 = _2102;
    if (!_2108)
    {
        float _2112 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2114 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2116 = _1986 + _2114;
        float _2118 = rsqrt(_1970);
        float _2120 = _2116 * _2112;
        float _2122 = _2086 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2124 = _2120 * 0.15915493667125701904296875;
        float _2126 = _2124 * 6.283185482025146484375;
        float _2128 = sin(_2126);
        float _2130 = _2124 * 6.283185482025146484375;
        float _2132 = cos(_2130);
        float _2134 = fma(_2128, _2122, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2136 = _2118 * _2134;
        float _2138 = _2132 + (-1.0);
        float _2140 = fma(_1946, _2136, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2142 = fma(_1950, _2136, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2144 = _2138 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2146 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2148 = _2140 + _2146;
        float _2150 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2152 = _2142 + _2150;
        float _2154 = fma(_2086, _2132, _2144);
        float _2156 = _2148 * _2148;
        float _2158 = _2152 * _2152;
        _2110 = _2154;
        _2074 = _2156;
        _2100 = _2158;
        _2088 = _2140;
        _2076 = _2142;
    }
    float _2160 = _2110;
    float _2162 = _2074;
    float _2164 = _2100;
    float _2166 = _2088;
    float _2168 = _2076;
    float _2170 = as_type<float>(_1984) * _2104;
    float _2172 = trunc(_2084);
    float _2174 = precise::max(_2172, 0.0);
    uint _2176 = uint(_2174);
    float _2178 = fma(_1658, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1756);
    float _2180 = fma(_1658, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1764);
    float _2182 = fma(_1658, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1784);
    float _2184 = -_191;
    int _2186 = _1448 ? as_type<int>(_2184) : as_type<int>(_191);
    float _2188 = as_type<float>(_1994) * _2106;
    int _2190 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2192 = _2190 != 0;
    float _2194 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2196 = _2160 + _2194;
    float _2198 = trunc(_2170);
    float _2200 = precise::max(_2198, 0.0);
    uint _2202 = uint(_2200);
    float _2204 = -_187;
    int _2206 = _1404 ? as_type<int>(_2204) : as_type<int>(_187);
    float _2208 = -_1322;
    float _2210 = _2208 + 1.0;
    float _2212 = -_187;
    int _2214 = _2046 ? as_type<int>(_2212) : as_type<int>(_187);
    float _2216 = fma(_2196, _2196, _2162);
    bool _2218 = !_1612;
    float _2220 = _2218 ? _191 : as_type<float>(_2044);
    float _2222 = -_1352;
    float _2224 = _2222 + 1.0;
    bool _2226 = !_2192;
    float _2228 = _2226 ? _191 : as_type<float>(_2186);
    float _2230 = _191 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _2232 = !_1174;
    float _2234 = _2232 ? _187 : as_type<float>(_2206);
    float _2236 = trunc(_2188);
    float _2238 = precise::max(_2236, 0.0);
    uint _2240 = uint(_2238);
    bool _2242 = !_1616;
    float _2244 = _2242 ? _187 : as_type<float>(_2214);
    float _2246 = _187 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2248 = _2230 * _1742;
    float _2250 = _2230 * _1744;
    float _2252 = _2230 * _1746;
    int _2254 = int(_1976) + int(_2066);
    float _2256 = fma(_2246, _2178, _2248);
    float _2258 = fma(_2246, _2180, _2250);
    float _2260 = fma(_2246, _2182, _2252);
    int _2262 = int(_2004) + int(_2176);
    float _2264 = _2216 + _2164;
    int _2266 = ~_1800;
    int _2268 = _2266 + 1;
    float _2270 = -_1372;
    float _2272 = _2270 + 1.0;
    int _2274 = ~_1892;
    int _2276 = _2274 + 1;
    float _2278 = -_1376;
    float _2280 = _2278 + 1.0;
    int _2282 = ~_1842;
    int _2284 = _2282 + 1;
    int _2286 = _2268 * _2254;
    int _2288 = _2286 + _1906;
    int _2290 = int(_2030) + int(_2202);
    float _2292 = sqrt(_2264);
    out.m_76.x = _2178;
    out.m_76.y = _2180;
    out.m_76.z = _2182;
    int _2294 = ~_1888;
    int _2296 = _2294 + 1;
    int _2298 = int(_2052) + int(_2240);
    int _2300 = _2276 * _2290;
    int _2302 = _2300 + _1966;
    bool _2304 = uint(_2288) >= uint(_1800);
    int _2306 = _2284 * _2262;
    int _2308 = _2306 + _1940;
    float _2310 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2312 = !_2304;
    int _2314 = _2312 ? 0 : (-1);
    bool _2316 = uint(_2302) >= uint(_1892);
    int _2318 = _2296 * _2298;
    int _2320 = _2318 + _1982;
    int _2322 = ~_2254;
    int _2324 = _2322 + _2314;
    int _2326 = _2324 + 1;
    int _2328 = _1906 ^ _1800;
    float _2330 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2332 = uint(_2308) >= uint(_1842);
    bool _2334 = uint(_2320) >= uint(_1888);
    int _2336 = _1800 * _2326;
    int _2338 = _2336 + _1906;
    bool _2340 = !_2316;
    int _2342 = _2340 ? 0 : (-1);
    uint _2344 = uint(int(uint(_2328) >> uint(31)));
    float _2346 = _2310 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2348 = !_2332;
    int _2350 = _2348 ? 0 : (-1);
    bool _2352 = _1800 == 0;
    bool _2354 = _1800 == 0;
    int _2356 = _1940 ^ _1842;
    float _2358 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _2360 = ~_2342;
    int _2362 = _2290 + _2360;
    int _2364 = _2362 + 1;
    int _2366 = ~int(_2344);
    int _2368 = _2366 + 1;
    int _2370 = ~_2262;
    int _2372 = _2370 + _2350;
    int _2374 = _2372 + 1;
    bool _2376 = !_2352;
    int _2378 = _2376 ? _2338 : (-1);
    bool _2380 = !_2334;
    int _2382 = _2380 ? 0 : (-1);
    int _2384 = _1842 * _2374;
    int _2386 = _2384 + _1940;
    uint _2388 = uint(int(uint(_2356) >> uint(31)));
    float _2390 = fma(_2230, _2230, 1.0);
    int _2392 = _2364 ^ _2368;
    float _2394 = float(_2378);
    int _2396 = ~_2382;
    int _2398 = _2298 + _2396;
    int _2400 = _2398 + 1;
    int _2402 = ~int(_2388);
    int _2404 = _2402 + 1;
    int _2406 = ~_2368;
    int _2408 = _2406 + _2392;
    int _2410 = _2408 + 1;
    float _2412 = fma(_2346, _2394, _1344);
    bool _2414 = _1842 == 0;
    float _2416 = rsqrt(_2390);
    bool _2418 = _1842 == 0;
    int _2420 = _2400 ^ _2404;
    bool _2422 = !_2354;
    int _2424 = _2422 ? _2410 : (-1);
    float _2426 = _2358 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _2428 = !_2414;
    int _2430 = _2428 ? _2386 : (-1);
    float _2432 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2434 = ~_2404;
    int _2436 = _2434 + _2420;
    int _2438 = _2436 + 1;
    float _2440 = _2330 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2442 = float(_2424);
    float _2444 = float(_2430);
    float _2446 = _2234 + 0.5;
    bool _2448 = !_2418;
    int _2450 = _2448 ? _2438 : (-1);
    float _2452 = -_1204;
    float _2454 = fma(_2440, _2442, _2452);
    float _2456 = _2244 + 0.5;
    float _2458 = fma(_2426, _2444, _1384);
    float _2460 = fma(_2346, _2446, _2412);
    float _2462 = float(_2450);
    float _2464 = _2228 + (-0.5);
    float _2466 = fma(_2426, _2456, _2458);
    float _2468 = _2230 * _2416;
    float _2470 = _2432 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2472 = -_2440;
    float _2474 = fma(_2472, _2464, _2454);
    float _2476 = _2220 + (-0.5);
    float _2478 = -_1952;
    float _2480 = _2468 * _2478;
    float _2482 = -_1364;
    float _2484 = fma(_2470, _2462, _2482);
    float _2486 = -_1964;
    float _2488 = _2468 * _2486;
    float _2490 = -_1968;
    float _2492 = _2468 * _2490;
    float _2494 = _1952 + _2256;
    float _2496 = -_2470;
    float _2498 = fma(_2496, _2476, _2484);
    float _2500 = fma(_2416, _1742, _2480);
    float _2502 = fma(_2416, _1744, _2488);
    float _2504 = fma(_2416, _1746, _2492);
    float _2506 = -_2210;
    float _2508 = fma(_2234, _2506, _2460);
    float _2510 = _1964 + _2258;
    float _2512 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2514 = -_2224;
    float _2516 = fma(_2244, _2514, _2466);
    float _2518 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2520 = fma(_2228, _2272, _2474);
    float _2522 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2524 = _2512 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2526 = _2518 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2528 = fma(_2220, _2280, _2498);
    float _2530 = _2522 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2532 = _1968 + _2260;
    out.m_78.x = _2500;
    out.m_78.y = _2502;
    out.m_78.z = _2504;
    bool _2534 = _2292 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2536 = isnan(_2292);
    bool _2538 = _2534 || _2536;
    bool _2540 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2542 = _2538 || _2540;
    out.m_80.x = _2524;
    out.m_80.y = _2526;
    out.m_80.z = _2530;
    out.m_82.x = _2508;
    out.m_82.y = _2520;
    out.m_82.z = _2516;
    out.m_82.w = _2528;
    out.m_84.x = _2494;
    out.m_84.y = _2510;
    out.m_84.z = _2532;
    float _2544 = _2224;
    float _2546 = as_type<float>(_2262);
    if (!_2542)
    {
        _2544 = 1.0;
    }
    float _2548 = _2544;
    bool _2550 = !_2542;
    float _2552 = _2548;
    if (!_2550)
    {
        bool _2554 = _2292 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2556 = isnan(_2292);
        bool _2558 = _2554 || _2556;
        bool _2560 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2562 = _2558 || _2560;
        if (!_2562)
        {
            float _2564 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2566 = _2292 + _2564;
            float _2568 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2570 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2568;
            float _2572 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2574 = _2572 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2576 = 1.0 / _2570;
            float _2578 = _2566 * _2576;
            float _2580 = fma(_2578, _2574, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2552 = _2580;
            _2582 = true;
        }
        else
        {
            bool _2584 = _2292 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2586 = isnan(_2292);
            bool _2588 = _2584 || _2586;
            bool _2590 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2592 = _2588 || _2590;
            if (!_2592)
            {
                float _2594 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2596 = _2292 + _2594;
                float _2598 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2600 = _2598 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2602 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2604 = _2602 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2606 = 1.0 / _2600;
                float _2608 = _2596 * _2606;
                float _2610 = fma(_2608, _2604, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2552 = _2610;
                _2582 = true;
            }
            else
            {
                _2552 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2582 = false;
    float _2612 = _2552;
    float _2614 = fma(_1900, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2616 = fma(_1910, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2618 = floor(_2614);
    float _2620 = floor(_2616);
    float _2622 = -_2618;
    float _2624 = _2614 + _2622;
    float _2626 = -_2620;
    float _2628 = _2616 + _2626;
    float2 _7931 = float2(_2624, _2628);
    float _2630 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7931, float2(0.0), isnan(_7931)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7931, float2(0.0), isnan(_7931)), level(0.0)).x;
    float _2632 = _2060 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2634 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2636 = _2166 + _2634;
    float _2638 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2640 = _2168 + _2638;
    float _2642 = fma(_1900, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2632);
    float _2644 = fma(_2636, _2612, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2646 = fma(_2640, _2612, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2648 = fma(_1910, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2642);
    float _2650 = _2060 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2652 = _2648 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2654 = fma(_1900, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2650);
    float _2656 = 1.0 / _2652;
    float _2658 = fma(_1910, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2654);
    float _2660 = _2658 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2662 = _2660 + _2652;
    float _2664 = _2662 * _2656;
    float _2666 = _2664 * 0.5;
    float _2668 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2670 = fma(_2666, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2668);
    float _2672 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _2674 = _2060 + _2672;
    float _2676 = 1.0 / _2670;
    float _2678 = _2674 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _2680 = _2674 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _2682 = fma(_1900, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2678);
    float _2684 = fma(_1900, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2680);
    float _2686 = fma(_1910, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2682);
    float _2688 = fma(_1910, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2684);
    float _2690 = _2686 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _2692 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2694 = _2676 * _2692;
    float _2696 = _2688 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _2698 = trunc(_2690);
    int _2700 = int(_2698);
    bool _2702 = _2694 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _2704 = _2694 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _2706 = !_2702;
    int _2708 = _2706 ? 0 : 1;
    int _2710 = 2;
    float _2712 = _2686;
    if (!_2702)
    {
        _2710 = 1;
    }
    int _2714 = _2710;
    int _2716 = _2714;
    if (!_2704)
    {
        _2716 = _2708;
    }
    int _2718 = _2716;
    float _2720 = trunc(_2696);
    int _2722 = int(_2720);
    int _2724 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2726 = _2700 + _2724;
    int _2728 = _2726 + 1;
    int _2730 = _2718 << 6;
    bool _2732 = _2728 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _2734 = _2730 + 48;
    uint _2736 = uint(int(uint(_2734) >> uint(2)));
    uint _2738 = uint(int(uint(int(_2736)) >> uint(2)));
    int _2740 = int(_2736) & 3;
    float _2742 = (*spvDescriptorSet0.vp_c15)._m0[int(_2738)][_2740];
    int _2744 = int(_2736) + 1;
    uint _2746 = uint(int(uint(_2744) >> uint(2)));
    int _2748 = _2744 & 3;
    float _2750 = (*spvDescriptorSet0.vp_c15)._m0[int(_2746)][_2748];
    int _2752 = _2730 + 56;
    uint _2754 = uint(int(uint(_2752) >> uint(2)));
    uint _2756 = uint(int(uint(int(_2754)) >> uint(2)));
    int _2758 = int(_2754) & 3;
    float _2760 = (*spvDescriptorSet0.vp_c15)._m0[int(_2756)][_2758];
    int _2762 = int(_2754) + 1;
    uint _2764 = uint(int(uint(_2762) >> uint(2)));
    int _2766 = _2762 & 3;
    float _2768 = (*spvDescriptorSet0.vp_c15)._m0[int(_2764)][_2766];
    int _2770 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _2772 = _2722 + _2770;
    int _2774 = _2772 + 1;
    int _2776 = _2728 | _2774;
    int _2778 = _2730 + 64;
    uint _2780 = uint(int(uint(_2778) >> uint(2)));
    uint _2782 = uint(int(uint(int(_2780)) >> uint(2)));
    int _2784 = int(_2780) & 3;
    float _2786 = (*spvDescriptorSet0.vp_c15)._m0[int(_2782)][_2784];
    int _2788 = int(_2780) + 1;
    uint _2790 = uint(int(uint(_2788) >> uint(2)));
    int _2792 = _2788 & 3;
    float _2794 = (*spvDescriptorSet0.vp_c15)._m0[int(_2790)][_2792];
    bool _2796 = _2776 < 0;
    bool _2798 = _2796 || _2732;
    bool _2800 = _2774 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _2802 = _2800 || _2798;
    bool _2804 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2806 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2808 = _2804 || _2806;
    bool _2810 = isnan(0.5);
    bool _2812 = _2808 || _2810;
    int _2814 = _2730 + 72;
    uint _2816 = uint(int(uint(_2814) >> uint(2)));
    uint _2818 = uint(int(uint(int(_2816)) >> uint(2)));
    int _2820 = int(_2816) & 3;
    float _2822 = (*spvDescriptorSet0.vp_c15)._m0[int(_2818)][_2820];
    int _2824 = int(_2816) + 1;
    uint _2826 = uint(int(uint(_2824) >> uint(2)));
    int _2828 = _2824 & 3;
    float _2830 = (*spvDescriptorSet0.vp_c15)._m0[int(_2826)][_2828];
    float _2832 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2834 = _2160 + _2832;
    float _2836 = fma(_2834, _2612, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    int _2838 = _2730 + 96;
    uint _2840 = uint(int(uint(_2838) >> uint(2)));
    uint _2842 = uint(int(uint(int(_2840)) >> uint(2)));
    int _2844 = int(_2840) & 3;
    float _2846 = (*spvDescriptorSet0.vp_c15)._m0[int(_2842)][_2844];
    int _2848 = int(_2840) + 1;
    uint _2850 = uint(int(uint(_2848) >> uint(2)));
    int _2852 = _2848 & 3;
    float _2854 = (*spvDescriptorSet0.vp_c15)._m0[int(_2850)][_2852];
    int _2856 = _2728;
    float _2858 = _2834;
    float _2860 = as_type<float>(_2774);
    float _2862 = as_type<float>(_2718);
    if (!_2802)
    {
        int _2864 = _2774 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _2866 = _2864 + _2728;
        _2856 = _2866;
    }
    int _2868 = _2856;
    if (_2812)
    {
        _2858 = _2644;
    }
    float _2870 = _2858;
    float _2872 = _2870;
    if (_2812)
    {
        _2860 = _2836;
    }
    float _2874 = _2860;
    int _2876 = _2730 + 104;
    uint _2878 = uint(int(uint(_2876) >> uint(2)));
    uint _2880 = uint(int(uint(int(_2878)) >> uint(2)));
    int _2882 = int(_2878) & 3;
    float _2884 = (*spvDescriptorSet0.vp_c15)._m0[int(_2880)][_2882];
    int _2886 = int(_2878) + 1;
    uint _2888 = uint(int(uint(_2886) >> uint(2)));
    int _2890 = _2886 & 3;
    float _2892 = (*spvDescriptorSet0.vp_c15)._m0[int(_2888)][_2890];
    float _2894 = _2874;
    if (_2812)
    {
        _2712 = _2646;
    }
    float _2896 = _2712;
    float _2898 = _2896;
    int _2900 = as_type<int>(_2854);
    if (!_2812)
    {
        float _2902 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2904 = _2060 + _2902;
        float _2906 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2908 = _1900 + _2906;
        float _2910 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2912 = _2904 * _2904;
        float _2914 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2916 = _1910 + _2914;
        float _2918 = fma(_2908, _2908, _2912);
        float _2920 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2922 = fma(_2916, _2916, _2918);
        float _2924 = sqrt(_2922);
        float _2926 = _2910 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2928 = -_1910;
        float _2930 = _2928 + _2646;
        float _2932 = precise::min(_2924, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2934 = _2932 * _2920;
        float _2936 = -_2060;
        float _2938 = _2936 + _2836;
        float _2940 = _2926 * _2934;
        float _2942 = -_1900;
        float _2944 = _2942 + _2644;
        float _2946 = fma(_2938, _2940, _2060);
        float _2948 = fma(_2944, _2940, _1900);
        float _2950 = fma(_2930, _2940, _1910);
        _2894 = _2946;
        _2872 = _2948;
        _2898 = _2950;
    }
    float _2952 = _2894;
    float _2954 = _2872;
    float _2956 = _2898;
    float _2958 = _2674 * _2854;
    int _2960 = as_type<int>(_2958);
    if (!_2802)
    {
        int _2962 = _2868 << 2;
        _2078 = _2962;
    }
    int _2964 = _2078;
    float _2966 = _2952 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2968 = as_type<float>(_2964);
    if (!_2802)
    {
        uint _2970 = uint(int(uint(_2868) >> uint(2)));
        _2900 = int(_2970);
    }
    int _2972 = _2900;
    float _2974 = fma(_1900, _2846, _2958);
    if (!_2802)
    {
        int _2976 = 12 & _2964;
        _2960 = _2976;
    }
    int _2978 = _2960;
    float _2980 = fma(_2954, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2966);
    float _2982 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2984 = fma(_1910, _2884, _2974);
    if (!_2802)
    {
        int _2986 = _2972 << 4;
        int _2988 = _2986 + _2978;
        _2968 = as_type<float>(_2988);
    }
    float _2990 = _2968;
    float _2992 = fma(_2956, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2980);
    int _2994 = _2730 + 80;
    uint _2996 = uint(int(uint(_2994) >> uint(2)));
    uint _2998 = uint(int(uint(int(_2996)) >> uint(2)));
    int _3000 = int(_2996) & 3;
    float _3002 = (*spvDescriptorSet0.vp_c15)._m0[int(_2998)][_3000];
    int _3004 = int(_2996) + 1;
    uint _3006 = uint(int(uint(_3004) >> uint(2)));
    int _3008 = _3004 & 3;
    float _3010 = (*spvDescriptorSet0.vp_c15)._m0[int(_3006)][_3008];
    float _3012 = _2984 + _2892;
    float _3014 = _2674 * _2750;
    float _3016 = _2674 * _2794;
    float _3018 = _2992 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3020 = 1.0 / _3012;
    float _3022 = fma(_1900, _2742, _3014);
    float _3024 = fma(_1900, _2786, _3016);
    float _3026 = _2990;
    if (!_2802)
    {
        int _3028 = as_type<int>(_2990) + 400;
        uint _3030 = uint(int(uint(_3028) >> uint(2)));
        uint _3032 = uint(int(uint(int(_3030)) >> uint(2)));
        int _3034 = int(_3030) & 3;
        float _3036 = (*spvDescriptorSet0.vp_c15)._m0[int(_3032)][_3034];
        _3026 = _3036;
    }
    float _3038 = _3026;
    float _3040 = _3018 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3042 = fma(_1910, _2760, _3022);
    float _3044 = fma(_1910, _2822, _3024);
    float _3046 = _2952 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3048 = -_3040;
    float _3050 = fma(_3048, _2982, 1.0);
    float _3052 = _2952 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3054 = _3042 + _2768;
    int _3056 = _2730 + 88;
    uint _3058 = uint(int(uint(_3056) >> uint(2)));
    uint _3060 = uint(int(uint(int(_3058)) >> uint(2)));
    int _3062 = int(_3058) & 3;
    float _3064 = (*spvDescriptorSet0.vp_c15)._m0[int(_3060)][_3062];
    int _3066 = int(_3058) + 1;
    uint _3068 = uint(int(uint(_3066) >> uint(2)));
    int _3070 = _3066 & 3;
    float _3072 = (*spvDescriptorSet0.vp_c15)._m0[int(_3068)][_3070];
    float _3074 = fma(_2954, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3046);
    float _3076 = fma(_2954, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3052);
    float _3078 = _2952 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3080 = _2646;
    float _3082 = _3076;
    if (!_2802)
    {
        float _3084 = floor(_2696);
        _3080 = _3084;
    }
    float _3086 = _3080;
    float _3088 = _3054 * _3020;
    float _3090 = fma(_2956, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3076);
    float _3092 = _3044 + _2830;
    float _3094 = fma(_2956, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3074);
    float _3096 = fma(_2954, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3078);
    bool _3098 = _3088 >= 0.0;
    float _3100 = _3090 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3102 = _3092 * _3020;
    float _3104 = _3094 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    bool _3106 = _3088 <= 1.0;
    bool _3108 = _3106 && _3098;
    float _3110 = _3100 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3112 = fma(_2956, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3096);
    float _3114 = log2(_3050);
    bool _3116 = _3102 >= 0.0;
    bool _3118 = _3116 && _3108;
    float _3120 = fma(_3104, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3110);
    float _3122 = _3112 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3124 = _3100 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    bool _3126 = _3102 <= 1.0;
    bool _3128 = _3126 && _3118;
    float _3130 = fma(_3018, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3120);
    float _3132 = _3086;
    if (!_2802)
    {
        float _3134 = -_3086;
        float _3136 = _2696 + _3134;
        _3132 = _3136;
    }
    float _3138 = _3132;
    float _3140 = _2982;
    if (!_2802)
    {
        float _3142 = floor(_2690);
        _3140 = _3142;
    }
    float _3144 = _3140;
    float _3146 = fma(_3122, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3130);
    float _3148 = _2674 * _3010;
    float _3150 = 1.0 / _3146;
    float _3152 = _3100 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    if (_3128)
    {
        float _3154 = float(_2718);
        _3082 = _3154;
    }
    float _3156 = _3082;
    float _3158 = fma(_1900, _3002, _3148);
    float _3160 = fma(_3104, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3124);
    float _3162 = fma(_3104, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3152);
    float _3164 = _3114 * 0.693147182464599609375;
    float _3166 = _3038;
    float _3168 = _3156;
    float _3170 = _3162;
    if (!_2802)
    {
        float _3172 = rint(_3038);
        float _3174 = precise::max(_3172, 0.0);
        uint _3176 = uint(_3174);
        uint _3178 = clamp(_3176, 0u, 65535u);
        _3166 = as_type<float>(_3178);
    }
    float _3180 = _3166;
    float _3182 = fma(_3018, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3160);
    float _3184 = fma(_3018, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3162);
    if (!_2802)
    {
        float _3186 = -_3144;
        float _3188 = _2690 + _3186;
        _2862 = _3188;
    }
    float _3190 = _2862;
    float _3192 = fma(_3122, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3184);
    float _3194 = fma(_1910, _3064, _3158);
    float _3196 = _3158;
    if (_3128)
    {
        float _3198 = rint(_3156);
        float _3200 = precise::max(_3198, 0.0);
        uint _3202 = uint(_3200);
        uint _3204 = clamp(_3202, 0u, 65535u);
        _3196 = as_type<float>(_3204);
    }
    float _3206 = _3196;
    float _3208 = _3194 + _3072;
    float _3210 = fma(_3122, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3182);
    float _3212 = _3192 * _3150;
    float _3214 = _3208 * _3020;
    float _3216 = _3210 * _3150;
    float _3218 = _3164 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3220 = fma(_3212, -0.5, 0.5);
    float _3222 = fma(_3216, 0.5, 0.5);
    float _3224 = _3180;
    float _3226 = _3214;
    if (!_2802)
    {
        float3 _8956 = float3(_3190, _3138, float(as_type<int>(_3180)));
        float3 _8960 = select(_8956, float3(0.0), isnan(_8956));
        float _3228 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _8960.xy, uint(rint(_8960.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _8960.xy, uint(rint(_8960.z)), level(0.0)).x;
        _3224 = _3228;
    }
    float _3230 = _3224;
    float _3232 = _3102;
    if (_3128)
    {
        float3 _8975 = float3(_3088, _3102, float(as_type<int>(_3206)));
        float3 _8977 = select(_8975, float3(0.0), isnan(_8975));
        float _3234 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _8977.xy, uint(rint(_8977.z)), _3214, level(0.0));
        _3232 = _3234;
    }
    float _3236 = _3232;
    float3 _8987 = float3(_3222, _3220, _3218);
    float _3238 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8987, float3(0.0), isnan(_8987)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8987, float3(0.0), isnan(_8987)), level(0.0)).x;
    float3 _8996 = float3(_3222, _3220, _3218);
    float4 _3241 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8996, float3(0.0), isnan(_8996)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8996, float3(0.0), isnan(_8996)), level(0.0)).xyzw;
    float _3243 = _3241.x;
    float _3245 = _3241.y;
    float _3247 = _3241.z;
    float _3249 = _3241.w;
    float _3251 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    if (_2802)
    {
        _3168 = 1.0;
    }
    float _3253 = _3168;
    bool _3255 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _3257 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3259 = _3255 || _3257;
    bool _3261 = isnan(0.5);
    bool _3263 = _3259 || _3261;
    float _3265 = _3253;
    if (_3263)
    {
        _3251 = 1.0;
    }
    float _3267 = _3251;
    float _3269 = _3267;
    if (_3263)
    {
        _3170 = 1.0;
    }
    float _3271 = _3170;
    float _3273 = _3271;
    float _3275 = _3243;
    if (!_3263)
    {
        float _3277 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _3279 = _3277 * 0.15915493667125701904296875;
        float _3281 = _3279 * 6.283185482025146484375;
        float _3283 = cos(_3281);
        float _3285 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _3287 = _3285 * 0.15915493667125701904296875;
        float _3289 = _3279 * 6.283185482025146484375;
        float _3291 = sin(_3289);
        float _3293 = 1.0 / _3283;
        float _3295 = _3287 * 6.283185482025146484375;
        float _3297 = cos(_3295);
        float _3299 = _3291 * _3293;
        float _3301 = _3287 * 6.283185482025146484375;
        float _3303 = sin(_3301);
        float _3305 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3307 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3305;
        float _3309 = _3297 * _3299;
        float _3311 = 1.0 / _3307;
        float _3313 = 1.0 / _3309;
        float _3315 = _3303 * _3313;
        float _3317 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3319 = fma(_2694, _3315, _3317);
        float _3321 = _3319 * _3311;
        float _3323 = precise::clamp(_3321, 0.0, 1.0);
        _3273 = _3323;
    }
    float _3325 = _3273;
    if (!_3263)
    {
        float _3327 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _3329 = _3327 * 0.15915493667125701904296875;
        float _3331 = _3329 * 6.283185482025146484375;
        float _3333 = cos(_3331);
        float _3335 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _3337 = _3335 * 0.15915493667125701904296875;
        float _3339 = _3329 * 6.283185482025146484375;
        float _3341 = sin(_3339);
        float _3343 = 1.0 / _3333;
        float _3345 = _3337 * 6.283185482025146484375;
        float _3347 = cos(_3345);
        float _3349 = _3341 * _3343;
        float _3351 = _3337 * 6.283185482025146484375;
        float _3353 = sin(_3351);
        float _3355 = _3347 * _3349;
        float _3357 = 1.0 / _3355;
        float _3359 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3361 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _3359;
        float _3363 = 1.0 / _3361;
        float _3365 = _3353 * _3357;
        float _3367 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3369 = fma(_2694, _3365, _3367);
        float _3371 = _3369 * _3363;
        float _3373 = precise::clamp(_3371, 0.0, 1.0);
        float _3375 = -_3373;
        float _3377 = _3375 + 1.0;
        _3269 = _3377;
    }
    float _3379 = _3269;
    if (!_2802)
    {
        int _3381 = _2868 << 4;
        int _3383 = _3381 + 2048;
        uint _3385 = uint(int(uint(_3383) >> uint(2)));
        uint _3387 = uint(int(uint(int(_3385)) >> uint(2)));
        int _3389 = int(_3385) & 3;
        float _3391 = (*spvDescriptorSet0.vp_c15)._m0[int(_3387)][_3389];
        int _3393 = int(_3385) + 1;
        uint _3395 = uint(int(uint(_3393) >> uint(2)));
        int _3397 = _3393 & 3;
        float _3399 = (*spvDescriptorSet0.vp_c15)._m0[int(_3395)][_3397];
        int _3401 = _3383 + 8;
        uint _3403 = uint(int(uint(_3401) >> uint(2)));
        uint _3405 = uint(int(uint(int(_3403)) >> uint(2)));
        int _3407 = int(_3403) & 3;
        float _3409 = (*spvDescriptorSet0.vp_c15)._m0[int(_3405)][_3407];
        int _3411 = int(_3403) + 1;
        uint _3413 = uint(int(uint(_3411) >> uint(2)));
        int _3415 = _3411 & 3;
        float _3417 = (*spvDescriptorSet0.vp_c15)._m0[int(_3413)][_3415];
        float _3419 = _2674 * _3399;
        float _3421 = fma(_1900, _3391, _3419);
        float _3423 = fma(_1910, _3409, _3421);
        float _3425 = _3423 + _3417;
        float _3427 = precise::clamp(_3425, 0.0, 1.0);
        float _3429 = -_3427;
        float _3431 = _3429 + _3230;
        float _3433 = fma(_3431, 500.0, 1.5);
        float _3435 = exp2(_3433);
        float _3437 = 0.0 + _3435;
        float _3439 = precise::clamp(_3437, 0.0, 1.0);
        _3265 = _3439;
    }
    float _3441 = _3265;
    float _3443 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3445 = _2952 + _3443;
    float _3447 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3449 = _2954 + _3447;
    float _3451 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3453 = _2956 + _3451;
    float _3455 = _3445 * _3445;
    float _3457 = fma(_3449, _3449, _3455);
    float _3459 = fma(_3453, _3453, _3457);
    float _3461 = rsqrt(_3459);
    float _3463 = _3461 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3465 = _3449 * _3463;
    float _3467 = _3453 * _3463;
    float _3469 = _3465 * _3465;
    float _3471 = _3467 * _3467;
    float _3473 = _3469 + _3471;
    float _3475 = sqrt(_3473);
    bool _3477 = _3475 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3479 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3481 = _3475 + _3479;
    float _3483 = _3453;
    float _3485 = _3461;
    float _3487 = _3481;
    float _3489 = _3445;
    if (_3477)
    {
        float _3491 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3483 = _3491;
    }
    float _3493 = _3483;
    if (_3477)
    {
        float _3495 = rsqrt(_3473);
        _3485 = _3495;
    }
    float _3497 = _3485;
    float _3499 = _3497;
    if (_3477)
    {
        float _3501 = _3481 * _3493;
        _3487 = _3501;
    }
    float _3503 = _3487;
    if (_3477)
    {
        float _3505 = _3503 * 0.15915493667125701904296875;
        _2080 = _3505;
    }
    float _3507 = _2080;
    float _3509 = _3493;
    float _3511 = _3507;
    if (_3477)
    {
        float _3513 = _3507 * 6.283185482025146484375;
        float _3515 = sin(_3513);
        _3509 = _3515;
    }
    float _3517 = _3509;
    float _3519 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3521 = precise::max(0.0, _3519);
    float _3523 = _3455;
    float _3525 = _3521;
    if (_3477)
    {
        float _3527 = _3507 * 6.283185482025146484375;
        float _3529 = cos(_3527);
        _3523 = _3529;
    }
    float _3531 = _3523;
    float _3533 = -_3463;
    float _3535 = -_3521;
    float _3537 = fma(_3445, _3533, _3535);
    if (!_3477)
    {
        _3489 = _3467;
    }
    float _3539 = _3489;
    float _3541 = _3539;
    if (_3477)
    {
        float _3543 = _3537 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3525 = _3543;
    }
    float _3545 = _3525;
    float _3547 = _3545;
    if (!_3477)
    {
        _3511 = _3469;
    }
    float _3549 = _3511;
    float _3551 = _3517;
    float _3553 = _3549;
    if (_3477)
    {
        float _3555 = fma(_3517, _3545, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3551 = _3555;
    }
    float _3557 = _3551;
    float _3559 = _3557;
    float _3561 = _3531;
    if (_3477)
    {
        float _3563 = _3531 + (-1.0);
        _3547 = _3563;
    }
    float _3565 = _3547;
    float _3567 = _3565;
    if (_3477)
    {
        float _3569 = _3497 * _3557;
        _2546 = _3569;
    }
    float _3571 = _2546;
    if (!_3477)
    {
        _3499 = _3465;
    }
    float _3573 = _3499;
    float _3575 = _3573;
    if (_3477)
    {
        float _3577 = _3565 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3567 = _3577;
    }
    float _3579 = _3567;
    if (_3477)
    {
        float _3581 = _3465 * _3571;
        _3575 = _3581;
    }
    float _3583 = _3575;
    if (!_3477)
    {
        _3559 = _3537;
    }
    float _3585 = _3559;
    float _3587 = _3585;
    if (_3477)
    {
        float _3589 = _3467 * _3571;
        _3541 = _3589;
    }
    float _3591 = _3541;
    if (_3477)
    {
        float _3593 = fma(_3537, _3531, _3579);
        _3587 = _3593;
    }
    float _3595 = _3587;
    if (_3477)
    {
        float _3597 = _3583 * _3583;
        _3553 = _3597;
    }
    float _3599 = _3553;
    if (!_3477)
    {
        _3561 = _3471;
    }
    float _3601 = _3561;
    float _3603 = _3601;
    if (_3477)
    {
        float _3605 = _3591 * _3591;
        _3603 = _3605;
    }
    float _3607 = _3603;
    float _3609 = sqrt(_3459);
    float _3611 = fma(_3595, _3595, _3599);
    float _3613 = _3611 + _3607;
    float _3615 = rsqrt(_3613);
    float _3617 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3619 = fma(_3609, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3617);
    float _3621 = precise::clamp(_3619, 0.0, 1.0);
    float _3623 = -_3621;
    float _3625 = _3623 + 1.0;
    float _3627 = abs(_3625);
    float _3629 = log2(_3627);
    float _3631 = _3615 * _3583;
    float _3633 = _3615 * _3595;
    float _3635 = _3615 * _3591;
    float _3637 = _3631 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3639 = -_3637;
    float _3641 = fma(_3633, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3639);
    float _3643 = -_3635;
    float _3645 = fma(_3643, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3641);
    float _3647 = _3629 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3649 = fma(_3645, -0.5, 0.5);
    float _3651 = fma(_3645, 0.5, 0.5);
    float _3653 = exp2(_3647);
    float _3655 = fma(_3651, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3657 = fma(_3651, _3655, -0.212114393711090087890625);
    float _3659 = _3633 + 1.0;
    float _3661 = sqrt(_3649);
    float _3663 = fma(_3651, _3657, 1.570728778839111328125);
    float _3665 = -_3633;
    float _3667 = fma(_3653, _3659, _3665);
    float _3669 = fma(_3667, 0.5, 0.5);
    float _3671 = _3661 * 0.636619746685028076171875;
    float _3673 = -_3663;
    float _3675 = fma(_3671, _3673, 1.0);
    float2 _9637 = float2(_3675, _3669);
    float3 _3679 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9637, float2(0.0), isnan(_9637)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9637, float2(0.0), isnan(_9637)), level(0.0)).xyz;
    float _3681 = _3679.x;
    float _3683 = _3679.y;
    float _3685 = _3679.z;
    float _3687 = abs(_2694);
    float _3689 = log2(_3687);
    float _3691 = _3100 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3693 = _3629 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3695 = -_2630;
    float _3697 = _3695 + 1.0;
    out.m_86.x = _2954;
    out.m_86.y = _2952;
    out.m_86.z = _2956;
    float _3699 = fma(_3104, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3691);
    float _3701 = exp2(_3693);
    float _3703 = fma(_3018, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3699);
    bool _3705 = _2694 <= 8000.0;
    bool _3707 = isnan(_2694);
    bool _3709 = _3705 || _3707;
    bool _3711 = isnan(8000.0);
    bool _3713 = _3709 || _3711;
    float _3715 = float(_3713);
    float _3717 = fma(_3122, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3703);
    float _3719 = _3689 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3721 = _3717 + _3146;
    float _3723 = _3721 * 0.5;
    float _3725 = exp2(_3719);
    out.gl_Position.x = _3210;
    out.gl_Position.y = _3192;
    out.gl_Position.z = _3717;
    out.gl_Position.w = _3146;
    out.m_88.z = _3723;
    out.m_88.w = _3146;
    float _3727 = _3210;
    if (!_3128)
    {
        _3727 = 1.0;
    }
    float _3729 = _3727;
    float _3731 = fma(_3725, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3733 = precise::clamp(_3731, 0.0, 1.0);
    float _3735 = _3729;
    if (_3128)
    {
        bool _3737 = _3236 >= _3214;
        bool _3739 = isnan(_3236);
        bool _3741 = _3737 || _3739;
        bool _3743 = isnan(_3214);
        bool _3745 = _3741 || _3743;
        float _3747 = float(_3745);
        _3735 = _3747;
    }
    float _3749 = _3735;
    bool _3751 = _3609 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3753 = isnan(_3609);
    bool _3755 = _3751 || _3753;
    bool _3757 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3759 = _3755 || _3757;
    float _3761 = fma(_3733, -2.0, 3.0);
    float _3763 = _3733 * _3733;
    float _3765 = _3749 * _3441;
    float _3767 = _3763 * _3761;
    float _3769 = -_3767;
    float _3771 = _3769 + 1.0;
    if (!_3759)
    {
        _3226 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3773 = _3226;
    float _3775 = fma(_3771, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3767);
    float _3777 = -_3701;
    float _3779 = _3777 + 1.0;
    float _3781 = _3715 * _3775;
    float _3783 = _3779 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3785 = _3781 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3787 = _3783 * _3238;
    float _3789 = -_3783;
    float _3791 = _3789 + 1.0;
    float _3793 = _3697 * _3785;
    float _3795 = precise::clamp(_3793, 0.0, 1.0);
    float _3797 = _3249 * _3787;
    float _3799 = _3249 * _3791;
    float _3801 = _3785;
    float _3803 = _3795;
    float _3805 = _3791;
    float _3807 = _3773;
    float _3809 = _3773;
    if (!_3759)
    {
        _3801 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3811 = _3801;
    float _3813 = -_3795;
    float _3815 = fma(_3813, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3817 = _3811;
    float _3819 = _3811;
    if (!_3759)
    {
        _3803 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3821 = _3803;
    float _3823 = _3821;
    float _3825 = _3821;
    if (!_3759)
    {
        _3805 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3827 = _3805;
    float _3829 = -_3765;
    float _3831 = fma(_3829, _3815, 1.0);
    float _3833 = precise::clamp(_3831, 0.0, 1.0);
    float _3835 = _3833 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3837 = _3325 * _3379;
    out.m_90.x = _3835;
    float _3839 = _3685 * _3787;
    float _3841 = fma(_3681, _3797, _3243);
    float _3843 = fma(_3683, _3797, _3245);
    float _3845 = _3837 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3847 = fma(_3249, _3839, _3247);
    float _3849 = _3837;
    float _3851 = _3827;
    float _3853 = _3827;
    if (!_3759)
    {
        _3275 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3855 = _3275;
    float _3857 = _3855;
    float _3859 = _3855;
    if (!_3759)
    {
        _3849 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3861 = _3849;
    out.m_92.x = _3841;
    out.m_92.y = _3843;
    out.m_92.z = _3847;
    out.m_92.w = _3799;
    bool _3863 = !_3759;
    float _3865 = _3861;
    float _3867 = _3861;
    if (!_3863)
    {
        bool _3869 = _3609 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3871 = isnan(_3609);
        bool _3873 = _3869 || _3871;
        bool _3875 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3877 = _3873 || _3875;
        if (!_3877)
        {
            float _3879 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3881 = _3609 + _3879;
            float _3883 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3885 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3883;
            float _3887 = 1.0 / _3885;
            float _3889 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3891 = _3889 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3893 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3895 = _3893 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3897 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3899 = _3897 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3901 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3903 = _3901 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3905 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3907 = _3905 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3909 = _3881 * _3887;
            float _3911 = precise::clamp(_3909, 0.0, 1.0);
            float _3913 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3915 = _3913 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3917 = fma(_3911, _3891, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3919 = fma(_3911, _3915, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3921 = fma(_3911, _3895, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3923 = fma(_3911, _3899, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3925 = fma(_3911, _3903, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3927 = fma(_3911, _3907, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3819 = _3919;
            _3853 = _3925;
            _3859 = _3917;
            _3809 = _3923;
            _3825 = _3921;
            _3867 = _3927;
            _3929 = true;
        }
        else
        {
            bool _3931 = _3609 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3933 = isnan(_3609);
            bool _3935 = _3931 || _3933;
            bool _3937 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3939 = _3935 || _3937;
            if (!_3939)
            {
                _3857 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3941 = _3857;
            _3859 = _3941;
            if (!_3939)
            {
                _3817 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3943 = _3817;
            _3819 = _3943;
            if (!_3939)
            {
                _3823 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3945 = _3823;
            _3825 = _3945;
            if (!_3939)
            {
                _3807 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3947 = _3807;
            _3809 = _3947;
            if (!_3939)
            {
                _3851 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3949 = _3851;
            _3853 = _3949;
            if (!_3939)
            {
                _3865 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3951 = _3865;
            bool _3953 = !_3939;
            _3867 = _3951;
            if (!_3953)
            {
                bool _3955 = _3609 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3957 = isnan(_3609);
                bool _3959 = _3955 || _3957;
                bool _3961 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3963 = _3959 || _3961;
                if (!_3963)
                {
                    float _3965 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3967 = _3609 + _3965;
                    float _3969 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3971 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3969;
                    float _3973 = 1.0 / _3971;
                    float _3975 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3977 = _3975 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3979 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3981 = _3979 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3983 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3985 = _3983 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3987 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3989 = _3987 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3991 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3993 = _3991 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3995 = _3967 * _3973;
                    float _3997 = precise::clamp(_3995, 0.0, 1.0);
                    float _3999 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4001 = _3999 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4003 = fma(_3997, _3977, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4005 = fma(_3997, _4001, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4007 = fma(_3997, _3981, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4009 = fma(_3997, _3985, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4011 = fma(_3997, _3989, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4013 = fma(_3997, _3993, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3819 = _4005;
                    _3853 = _4011;
                    _3859 = _4003;
                    _3809 = _4009;
                    _3825 = _4007;
                    _3867 = _4013;
                    _3929 = true;
                }
                else
                {
                    _3819 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3853 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3859 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3809 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3825 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3867 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3929 = false;
    float _4015 = _3819;
    float _4017 = _3853;
    float _4019 = _3859;
    float _4021 = _3809;
    float _4023 = _3825;
    float _4025 = _3867;
    float _4027 = fma(_2510, -0.5, 0.5);
    float _4029 = precise::clamp(_4027, 0.0, 1.0);
    float _4031 = -_4015;
    float _4033 = _4031 + _4017;
    float _4035 = _3845 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4037 = -_4019;
    float _4039 = _4037 + _4021;
    out.m_94.x = 0.0;
    float _4041 = fma(_4029, _4033, _4015);
    float _4043 = fma(_4029, _4039, _4019);
    out.m_61.x = _4035;
    float _4045 = -_4023;
    float _4047 = _4045 + _4025;
    float _4049 = _4041 * 0.586610972881317138671875;
    bool _4051 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4053 = fma(_4029, _4047, _4023);
    float _4055 = fma(_4043, 0.298911988735198974609375, _4049);
    bool _4057 = _3325 > 0.0;
    bool _4059 = isnan(_3325);
    bool _4061 = _4057 || _4059;
    bool _4063 = isnan(0.0);
    bool _4065 = _4061 || _4063;
    float _4067 = fma(_4053, 0.114477999508380889892578125, _4055);
    bool _4069 = _3379 <= 0.0;
    bool _4071 = !_4065;
    bool _4073 = _4069 || _4071;
    float _4075 = -_4067;
    float _4077 = _4043 + _4075;
    float _4079 = -_4067;
    float _4081 = _4041 + _4079;
    float _4083 = -_4067;
    float _4085 = _4053 + _4083;
    float _4087 = fma(_4077, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4067);
    float _4089 = fma(_4081, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4067);
    float _4091 = fma(_4085, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4067);
    bool _4093 = !_4051;
    if (!_4093)
    {
        float _4095 = -_2952;
        float _4097 = _4095 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4099 = -_2954;
        float _4101 = _4099 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4103 = -_2956;
        float _4105 = _4103 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4107 = _4097 * _4097;
        float _4109 = fma(_4101, _4101, _4107);
        float _4111 = fma(_4105, _4105, _4109);
        float _4113 = sqrt(_4111);
        float _4115 = rsqrt(_4111);
        float _4117 = -_4113;
        float _4119 = _4117 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4121 = _4119 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4123 = precise::clamp(_4121, 0.0, 1.0);
        float _4125 = _4101 * _4115;
        float _4127 = _4097 * _4115;
        float _4129 = abs(_4123);
        float _4131 = log2(_4129);
        float _4133 = _4105 * _4115;
        float _4135 = _4125 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4137 = _2510 * _4127;
        float _4139 = -_4127;
        float _4141 = -_4135;
        float _4143 = fma(_4139, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4141);
        float _4145 = fma(_2494, _4125, _4137);
        float _4147 = -_4133;
        float _4149 = fma(_4147, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4143);
        float _4151 = fma(_2532, _4133, _4145);
        float _4153 = precise::clamp(_4151, 0.0, 1.0);
        float _4155 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4157 = _4149 + _4155;
        float _4159 = _4131 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4161 = _4157 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4163 = precise::clamp(_4161, 0.0, 1.0);
        float _4165 = exp2(_4159);
        float _4167 = _4165 * _4163;
        float _4169 = _4153 * _4167;
        float _4171 = _4169 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4173 = _4169 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4175 = _4169 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_94.x = _4171;
        out.m_94.y = _4173;
        out.m_94.z = _4175;
    }
    out.m_96.x = _4087;
    out.m_96.y = _4089;
    out.m_96.z = _4091;
    if (!_4073)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_61.x = 0.0;
    float _4177 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4177;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

