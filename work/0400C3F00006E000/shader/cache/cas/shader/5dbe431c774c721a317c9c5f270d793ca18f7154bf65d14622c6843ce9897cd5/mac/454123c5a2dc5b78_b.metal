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
    float4 m_72 [[user(locn0)]];
    float4 m_74 [[user(locn1)]];
    float4 m_78 [[user(locn2)]];
    float4 m_86 [[user(locn3)]];
    float4 m_94 [[user(locn4)]];
    float4 m_61 [[user(locn5)]];
    float4 m_82 [[user(locn6)]];
    float4 m_84 [[user(locn7)]];
    float4 m_80 [[user(locn8)]];
    float4 m_92 [[user(locn9)]];
    float4 m_88 [[user(locn10)]];
    float4 m_90 [[user(locn11)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_76 [[attribute(1)]];
    float4 m_58 [[attribute(2)]];
    float4 m_63 [[attribute(3)]];
    float4 m_70 [[attribute(4)]];
    float4 m_68 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4097 = false;
    bool _2958 = false;
    bool _329 = false;
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
        float _4382 = as_type<float>(_129);
        out.gl_Position.z = _4382;
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
    float _149 = _147;
    if (_143)
    {
        float _151 = float(_113);
        _123 = _151;
    }
    float _153 = _123;
    bool _155 = _147 >= _153;
    bool _157 = !_143;
    bool _159 = _155 || _157;
    float _161 = _153;
    if (_159)
    {
        _161 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _163 = _161;
    if (_159)
    {
        out.m_61.x = 0.0;
    }
    if (_159)
    {
        float _165 = _163 * 5.0;
        _131 = as_type<int>(_165);
    }
    int _167 = _131;
    if (_159)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4452 = as_type<float>(_167);
        out.gl_Position.z = _4452;
    }
    if (_159)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _169 = as_type<float>(int(gl_VertexIndex));
    float _171 = in.m_68.w;
    bool _173 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _175 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _177 = _173 || _175;
    bool _179 = isnan(1.0);
    bool _181 = _177 || _179;
    float _183 = in.m_63.x;
    float _185 = in.m_63.y;
    float _187 = in.m_63.z;
    float _189 = in.m_58.x;
    float _191 = in.m_58.y;
    float _193 = in.m_58.z;
    int _195 = as_type<int>(_169) & 1;
    bool _197 = _195 != 0;
    int _199 = as_type<int>(_169) & 2;
    bool _201 = _199 != 0;
    float _203 = _147 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _205 = 0.0;
    float _207 = _203;
    if (!_181)
    {
        float _209 = _203 * _203;
        float _211 = _209 * 0.5;
        _205 = _211;
    }
    float _213 = _205;
    bool _215 = !_197;
    float _217 = _215 ? (-0.5) : 0.5;
    bool _219 = !_201;
    float _221 = _219 ? (-0.5) : 0.5;
    float _223 = _213;
    if (!_181)
    {
        float _225 = _213 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _223 = _225;
    }
    float _227 = _223;
    bool _229 = !_181;
    float _231 = _227;
    if (!_229)
    {
        float _233 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _235 = log2(_233);
        float _237 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _239 = _237 + 1.0;
        float _241 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _243 = _203 * _235;
        float _245 = 1.0 / _239;
        float _247 = _241 * 0.693147182464599609375;
        float _249 = exp2(_243);
        float _251 = 1.0 / _247;
        float _253 = _249 + (-1.0);
        float _255 = -_253;
        float _257 = fma(_255, _251, _203);
        float _259 = _257 * _245;
        float _261 = _259 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _231 = _261;
    }
    float _263 = _231;
    bool _265 = !_181;
    if (!_265)
    {
        float _267 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _269 = log2(_267);
        float _271 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _273 = _271 + 1.0;
        float _275 = 1.0 / _273;
        float _277 = _203 * _269;
        float _279 = exp2(_277);
        float _281 = -_279;
        float _283 = _281 + 1.0;
        float _285 = _283 * _275;
        _207 = _285;
    }
    float _287 = _207;
    bool _289 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _291 = _263 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _293 = _263 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _295 = _263 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _297 = fma(_287, _183, _291);
    float _299 = fma(_287, _185, _293);
    float _301 = fma(_287, _187, _295);
    float _303 = fma(_297, _171, _189);
    float _305 = fma(_299, _171, _191);
    float _307 = fma(_301, _171, _193);
    bool _309 = !_289;
    float _327;
    if (!_309)
    {
        float _311 = in.m_70.x;
        float _313 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _315 = _311 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _317 = fma(_315, (*spvDescriptorSet0.vp_c9)._m0[12].x, _147);
        float _319 = _317 * _313;
        float _321 = floor(_319);
        float _323 = -_321;
        float _325 = _319 + _323;
        _327 = _325;
        _329 = true;
    }
    else
    {
        float _331 = float(_113);
        float _333 = 1.0 / _331;
        float _335 = _147 * _333;
        _327 = _335;
    }
    _329 = false;
    float _337 = _327;
    float _339 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _341 = int(_339);
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _345 = _337 + _343;
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _349 = _337 + _347;
    int _351 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _353 = _351 != 0;
    float _355 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _357 = int(_355);
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _361 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _359;
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _365 = _363 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _367 = float(_341);
    float _369 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _371 = int(_369);
    float _373 = 0.0;
    if (_353)
    {
        float _375 = in.m_70.x;
        _373 = _375;
    }
    float _377 = _373;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _381 = _377;
    if (!_353)
    {
        float _383 = in.m_70.y;
        _381 = _383;
    }
    float _385 = _381;
    float _387 = float(_357);
    float _389 = 1.0 / _367;
    float _391 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _393 = int(_391);
    float _395 = float(uint(_371));
    int _397 = ~_371;
    int _399 = _397 + 1;
    bool _401 = _371 == 0;
    float _403 = 1.0 / _387;
    float _405 = _389 * _147;
    float _407 = 1.0 / _395;
    float _409 = float(uint(_393));
    int _411 = ~_393;
    int _413 = _411 + 1;
    float _415 = trunc(_405);
    int _417 = int(_415);
    float _419 = _403 * _147;
    float _421 = 1.0 / _409;
    int _423 = as_type<int>(_407) + (-2);
    float _425 = trunc(_419);
    int _427 = int(_425);
    float _429 = float(uint(_417));
    float _431 = as_type<float>(_423) * _429;
    int _433 = as_type<int>(_421) + (-2);
    float _435 = 1.0 / _361;
    float _437 = float(uint(_427));
    float _439 = trunc(_431);
    float _441 = precise::max(_439, 0.0);
    uint _444 = uint(_441);
    float _446 = as_type<float>(_433) * _437;
    float _448 = in.m_70.x;
    float _450 = in.m_70.y;
    float _452 = in.m_70.z;
    float _454 = in.m_70.w;
    float _456 = trunc(_446);
    float _458 = precise::max(_456, 0.0);
    uint _460 = uint(_458);
    int _462 = _399 * int(_444);
    int _464 = _462 + _417;
    float _466 = 1.0 / _365;
    float _468 = float(uint(_464));
    int _470 = _413 * int(_460);
    int _472 = _470 + _427;
    float _474 = as_type<float>(_423) * _468;
    float _476 = _468;
    float _478 = as_type<float>(_472);
    if (_353)
    {
        _476 = 1.0;
    }
    float _480 = _476;
    float _482 = float(uint(_472));
    float _484 = trunc(_474);
    float _486 = precise::max(_484, 0.0);
    uint _488 = uint(_486);
    float _490 = _480;
    if (!_353)
    {
        _490 = 7.345489978790283203125;
    }
    float _492 = _490;
    float _494 = _450 * 2.0;
    if (_353)
    {
        _478 = 1.0;
    }
    float _496 = _478;
    float _498 = as_type<float>(_433) * _482;
    float _500 = _496;
    if (!_353)
    {
        _500 = 1.2345600128173828125;
    }
    float _502 = _500;
    float _504 = _492 * _448;
    float _506 = _349 * _466;
    float _508 = trunc(_498);
    float _510 = precise::max(_508, 0.0);
    uint _512 = uint(_510);
    float _514 = _385 * _502;
    int _516 = ~_371;
    int _518 = _516 + 1;
    float _520 = _452 + _450;
    float _522 = float(_371);
    float _524 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _526 = floor(_504);
    int _528 = int(_444) + int(_488);
    float _530 = fma(_450, (*spvDescriptorSet0.vp_c9)._m0[78].w, _524);
    float _532 = float(_113);
    int _534 = ~_393;
    int _536 = _534 + 1;
    int _538 = _518 * _528;
    int _540 = _538 + _417;
    float _542 = float(_417);
    float _544 = floor(_514);
    int _546 = int(_460) + int(_512);
    float _548 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].w, _530);
    bool _550 = uint(_540) >= uint(_371);
    int _552 = _536 * _546;
    int _554 = _552 + _427;
    bool _556 = _542 >= _522;
    bool _558 = isnan(_542);
    bool _560 = _556 || _558;
    bool _562 = isnan(_522);
    bool _564 = _560 || _562;
    float _566 = float(_564);
    float _568 = -_526;
    float _570 = _504 + _568;
    bool _572 = !_550;
    int _574 = _572 ? 0 : (-1);
    float _576 = 1.0 / _532;
    bool _578 = uint(_554) >= uint(_393);
    float _580 = _570 * _522;
    float _582 = -_548;
    float _584 = _582 + 1.0;
    int _586 = ~_528;
    int _588 = _586 + _574;
    int _590 = _588 + 1;
    float _592 = -_544;
    float _594 = _514 + _592;
    int _596 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _598 = _596 != 0;
    float _600 = trunc(_566);
    int _602 = int(_600);
    float _604 = float(_393);
    float _606 = float(_427);
    bool _608 = !_598;
    int _610 = _608 ? 0 : 1;
    bool _612 = _606 >= _604;
    bool _614 = isnan(_606);
    bool _616 = _612 || _614;
    bool _618 = isnan(_604);
    bool _620 = _616 || _618;
    float _622 = float(_620);
    float _624 = trunc(_580);
    int _626 = int(_624);
    int _628 = abs(_610);
    int _630 = _371 * _590;
    int _632 = _630 + _417;
    float _634 = _576 * _147;
    int _636 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _638 = _636 != 0;
    int _640 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _642 = _640 != 0;
    int _644 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _646 = _644 != 0;
    float _648 = _522 * _634;
    float _650 = trunc(_622);
    int _652 = int(_650);
    bool _654 = !_578;
    int _656 = _654 ? 0 : (-1);
    float _658 = _604 * _634;
    int _660 = ~_602;
    int _662 = _660 + 1;
    int _664 = _662 + 1;
    float _666 = _594 * _604;
    bool _668 = !_401;
    int _670 = _668 ? _632 : (-1);
    int _672 = ~_546;
    int _674 = _672 + _656;
    int _676 = _674 + 1;
    int _678 = _626 * _628;
    int _680 = _678 + _417;
    bool _682 = _393 == 0;
    int _684 = _670 * _664;
    bool _686 = !_642;
    int _688 = _686 ? 0 : 1;
    int _690 = _393 * _676;
    int _692 = _690 + _427;
    int _694 = _371 + (-1);
    float _696 = trunc(_648);
    int _698 = int(_696);
    int _700 = abs(_688);
    int _702 = ~_652;
    int _704 = _702 + 1;
    int _706 = _704 + 1;
    int _708 = _602 * _694;
    int _710 = _708 + _684;
    bool _712 = !_682;
    int _714 = _712 ? _692 : (-1);
    int _716 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _718 = _716 != 0;
    int _720 = _710 * _700;
    float _722 = trunc(_666);
    int _724 = int(_722);
    int _726 = _714 * _706;
    bool _728 = !_638;
    int _730 = _728 ? 0 : 1;
    bool _732 = !_718;
    int _734 = _732 ? 0 : 1;
    int _736 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _738 = _736 != 0;
    int _740 = _393 + (-1);
    float _742 = trunc(_658);
    int _744 = int(_742);
    int _746 = abs(_730);
    bool _748 = !_646;
    int _750 = _748 ? 0 : 1;
    int _752 = _652 * _740;
    int _754 = _752 + _726;
    int _756 = abs(_734);
    int _758 = _698 * _746;
    int _760 = _758 + _720;
    bool _762 = !_738;
    int _764 = _762 ? 0 : 1;
    float _766 = floor(_494);
    int _768 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _770 = _768 != 0;
    int _772 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _774 = _772 != 0;
    int _776 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _778 = _776 != 0;
    int _780 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _782 = _780 != 0;
    int _784 = _724 * _756;
    int _786 = _784 + _427;
    int _788 = abs(_750);
    int _790 = abs(_764);
    bool _792 = !_774;
    int _794 = _792 ? 0 : 1;
    int _796 = abs(_794);
    bool _798 = !_770;
    int _800 = _798 ? 0 : 1;
    int _802 = _680 * _788;
    int _804 = _802 + _760;
    bool _806 = !_778;
    int _808 = _806 ? 0 : 1;
    int _810 = abs(_800);
    int _812 = _626 * _790;
    int _814 = _812 + _804;
    bool _816 = !_782;
    int _818 = _816 ? 0 : 1;
    int _820 = abs(_808);
    int _822 = _754 * _796;
    int _824 = abs(_818);
    float _826 = float(uint(_814));
    int _828 = _744 * _810;
    int _830 = _828 + _822;
    float _832 = as_type<float>(_423) * _826;
    int _834 = ~_371;
    int _836 = _834 + 1;
    int _838 = _786 * _820;
    int _840 = _838 + _830;
    float _842 = float(uint(_786));
    float _844 = trunc(_832);
    float _846 = precise::max(_844, 0.0);
    uint _848 = uint(_846);
    bool _850 = _371 == 0;
    int _852 = _724 * _824;
    int _854 = _852 + _840;
    int _856 = ~_371;
    int _858 = _856 + 1;
    float _860 = as_type<float>(_433) * _842;
    bool _862 = _393 == 0;
    float _864 = float(uint(_854));
    float _866 = float(uint(_680));
    float _868 = trunc(_860);
    float _870 = precise::max(_868, 0.0);
    uint _872 = uint(_870);
    float _874 = as_type<float>(_433) * _864;
    int _876 = _858 * int(_848);
    int _878 = _876 + _814;
    int _880 = ~_393;
    int _882 = _880 + 1;
    float _884 = trunc(_874);
    float _886 = precise::max(_884, 0.0);
    uint _888 = uint(_886);
    float _890 = float(uint(_878));
    float _892 = as_type<float>(_423) * _890;
    float _894 = trunc(_892);
    float _896 = precise::max(_894, 0.0);
    uint _898 = uint(_896);
    int _900 = _882 * int(_888);
    int _902 = _900 + _854;
    float _904 = float(uint(_902));
    float _906 = as_type<float>(_433) * _904;
    float _908 = as_type<float>(_423) * _866;
    float _910 = trunc(_906);
    float _912 = precise::max(_910, 0.0);
    uint _914 = uint(_912);
    int _916 = int(_848) + int(_898);
    int _918 = ~_393;
    int _920 = _918 + 1;
    int _922 = _836 * _916;
    int _924 = _922 + _814;
    float _926 = trunc(_908);
    float _928 = precise::max(_926, 0.0);
    uint _930 = uint(_928);
    bool _932 = uint(_924) >= uint(_371);
    int _934 = ~_371;
    int _936 = _934 + 1;
    int _938 = int(_888) + int(_914);
    bool _940 = !_932;
    int _942 = _940 ? 0 : (-1);
    int _944 = ~_916;
    int _946 = _944 + _942;
    int _948 = _946 + 1;
    int _950 = _936 * int(_930);
    int _952 = _950 + _680;
    int _954 = ~_393;
    int _956 = _954 + 1;
    int _958 = _920 * _938;
    int _960 = _958 + _854;
    int _962 = _371 * _948;
    int _964 = _962 + _814;
    float _966 = float(uint(_952));
    int _968 = _956 * int(_872);
    int _970 = _968 + _786;
    bool _972 = uint(_960) >= uint(_393);
    bool _974 = !_850;
    float _976 = _974 ? as_type<float>(_964) : as_type<float>(0xffffffffu /* nan */);
    float _978 = as_type<float>(_423) * _966;
    bool _980 = !_972;
    int _982 = _980 ? 0 : (-1);
    int _984 = as_type<int>(_976) & 3;
    bool _986 = _984 != 0;
    int _988 = as_type<int>(_976) & 3;
    bool _990 = _988 != 0;
    float _992 = trunc(_978);
    float _994 = precise::max(_992, 0.0);
    uint _996 = uint(_994);
    bool _998 = _984 != 3;
    int _1000 = ~_938;
    int _1002 = _1000 + _982;
    int _1004 = _1002 + 1;
    int _1006 = _990 ? 0 : 1;
    bool _1008 = uint(_984) >= 2u;
    int _1010 = _393 * _1004;
    int _1012 = _1010 + _854;
    bool _1014 = uint(_984) > 1u;
    float _1016 = float(uint(_970));
    int _1018 = _1008 ? 0 : 1;
    bool _1020 = !_862;
    int _1022 = _1020 ? _1012 : (-1);
    float _1024 = as_type<float>(_433) * _1016;
    int _1026 = ~_1018;
    int _1028 = _1026 + 1;
    int _1030 = _1028 + 1;
    int _1032 = _1030;
    float _1034 = _976;
    float _1036 = as_type<float>(_786);
    if (_998)
    {
        int _1038 = ~_1018;
        int _1040 = _1038 + 1;
        _1032 = _1040;
    }
    int _1042 = _1032;
    float _1044 = trunc(_1024);
    float _1046 = precise::max(_1044, 0.0);
    uint _1048 = uint(_1046);
    int _1050 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1052 = _1050 != 0;
    int _1054 = _1022 & 3;
    bool _1056 = _1054 != 0;
    bool _1058 = !_1052;
    int _1060 = _1058 ? 0 : 1;
    int _1062 = ~_1006;
    int _1064 = _1062 + 1;
    int _1066 = _1064 + 1;
    bool _1068 = uint(_1054) > 1u;
    float _1070 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1072 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _1070;
    int _1074 = _1066;
    if (!_1014)
    {
        int _1076 = ~_1006;
        int _1078 = _1076 + 1;
        _1074 = _1078;
    }
    int _1080 = _1074;
    float _1082 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _1084 = _1082 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    int _1086 = int(_930) + int(_996);
    float _1088 = 1.0 / _1072;
    int _1090 = ~_371;
    int _1092 = _1090 + 1;
    int _1094 = _1022 & 3;
    bool _1096 = _1094 != 0;
    int _1098 = ~_393;
    int _1100 = _1098 + 1;
    int _1102 = _1092 * _1086;
    int _1104 = _1102 + _680;
    int _1106 = _1096 ? 0 : 1;
    float _1108 = 1.0 / _1084;
    int _1110 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1112 = _1110 != 0;
    float _1114 = _379 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1116 = ~_1106;
    int _1118 = _1116 + 1;
    int _1120 = _1118 + 1;
    float _1122 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1124 = _337 + _1122;
    bool _1126 = !_1112;
    int _1128 = _1126 ? 0 : 1;
    bool _1130 = uint(_1104) >= uint(_371);
    float _1132 = _1124 * _435;
    int _1134 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1136 = _1134 != 0;
    float _1138 = _345 * _1088;
    int _1140 = _1120;
    float _1142 = _1084;
    if (!_1068)
    {
        int _1144 = ~_1106;
        int _1146 = _1144 + 1;
        _1140 = _1146;
    }
    int _1148 = _1140;
    float _1150 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _1152 = _337 + _1150;
    bool _1154 = _1054 != 3;
    int _1156 = int(_872) + int(_1048);
    bool _1158 = !_1130;
    int _1160 = _1158 ? 0 : (-1);
    bool _1162 = uint(_1054) >= 2u;
    int _1164 = _1100 * _1156;
    int _1166 = _1164 + _786;
    int _1168 = ~_1086;
    int _1170 = _1168 + _1160;
    int _1172 = _1170 + 1;
    int _1174 = _1162 ? 0 : 1;
    bool _1176 = uint(_1166) >= uint(_393);
    int _1178 = _371 * _1172;
    int _1180 = _1178 + _680;
    int _1182 = 0;
    float _1184 = _1152;
    if (_1136)
    {
        _1182 = 0;
    }
    int _1186 = _1182;
    float _1188 = _305 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _1190 = ~_1174;
    int _1192 = _1190 + 1;
    int _1194 = _1192 + 1;
    float _1196 = _305 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1198 = fma(_303, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1188);
    int _1200 = _1186;
    int _1202 = _1194;
    if (!_1136)
    {
        _1200 = 1;
    }
    int _1204 = _1200;
    if (_1154)
    {
        int _1206 = ~_1174;
        int _1208 = _1206 + 1;
        _1202 = _1208;
    }
    int _1210 = _1202;
    float _1212 = fma(_307, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1198);
    bool _1214 = _448 > 0.5;
    bool _1216 = _454 > 0.5;
    float _1218 = _1212 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1220 = !_1176;
    int _1222 = _1220 ? 0 : (-1);
    int _1224 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1226 = _1224 != 0;
    float _1228 = -_217;
    int _1230 = _1214 ? as_type<int>(_1228) : as_type<int>(_217);
    bool _1232 = !_850;
    int _1234 = _1232 ? _1180 : (-1);
    bool _1236 = _450 > 0.5;
    bool _1238 = _452 > 0.5;
    bool _1240 = !_1226;
    float _1242 = _1240 ? _217 : as_type<float>(_1230);
    float _1244 = -_221;
    int _1246 = _1236 ? as_type<int>(_1244) : as_type<int>(_221);
    float _1248 = -_217;
    int _1250 = _1238 ? as_type<int>(_1248) : as_type<int>(_217);
    int _1252 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1254 = _1252 != 0;
    int _1256 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1258 = _1256 != 0;
    int _1260 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1262 = _1260 != 0;
    float _1264 = _305 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1266 = _448 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1268 = fma(_303, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1264);
    float _1270 = fma(_303, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1196);
    float _1272 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1274 = _450 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1276 = fma(_307, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1268);
    float _1278 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1280 = -_1272;
    float _1282 = fma(_1266, 2.0, _1280);
    float _1284 = fma(_307, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1270);
    float _1286 = fma(_1274, -2.0, _1278);
    float _1288 = _1276 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1290 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1292 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1294 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1296 = _1290 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1298 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1300 = _1292 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1302 = _1294 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1304 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _1306 = !_1262;
    float _1308 = _1306 ? _217 : as_type<float>(_1250);
    float _1310 = _1284 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    out.m_72.x = _1296;
    out.m_72.y = _1300;
    out.m_72.z = _1302;
    out.m_72.w = _1298;
    bool _1312 = _1204 != 1;
    float _1314 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1316 = _1304 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1318 = ~_1156;
    int _1320 = _1318 + _1222;
    int _1322 = _1320 + 1;
    float _1324 = _1314 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1326 = _1152 * _1108;
    float _1328 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1330 = _452 * 2.0;
    int _1332 = _393 * _1322;
    int _1334 = _1332 + _786;
    float _1336 = _448 * 2.0;
    bool _1338 = !_986;
    int _1340 = _1338 ? 0 : 1;
    out.m_74.x = _1316;
    out.m_74.y = _1324;
    out.m_74.z = _1114;
    out.m_74.w = _1328;
    int _1342 = _1022 >> 31;
    float _1344 = floor(_1330);
    int _1346 = as_type<int>(_976) >> 31;
    float _1348 = -_147;
    float _1350 = fma(_1348, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1282);
    int _1352 = _1342 & 3;
    float _1354 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1286);
    int _1356 = _1346 & 3;
    float _1358 = floor(_1336);
    int _1360 = _1022 + _1352;
    float _1362 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1364 = as_type<int>(_976) + _1356;
    float _1366 = _448 + _450;
    if (!_1312)
    {
        _1034 = _450;
    }
    float _1368 = _1034;
    float _1370 = _452 + _448;
    float _1372 = _1368;
    if (!_1312)
    {
        _1036 = _450;
    }
    float _1374 = _1036;
    float _1376 = _448 + (-0.5);
    float _1378 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1362);
    float _1380 = _1374;
    if (_1312)
    {
        _1372 = _448;
    }
    float _1382 = _1372;
    float _1384 = _450 + (-0.5);
    if (_1312)
    {
        _1380 = _448;
    }
    float _1386 = _1380;
    float _1388 = _452 + (-0.5);
    int _1390 = _1364 >> 2;
    float _1392 = _1366 + (-1.0);
    int _1394 = _1360 >> 2;
    float _1396 = _1370 + (-1.0);
    int _1398 = _1390 << 4;
    int _1400 = _1398 + 368;
    float _1402 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1378);
    int _1404 = _1394 << 4;
    int _1406 = _1404 + 512;
    uint _1408 = uint(int(uint(_1400) >> uint(2)));
    uint _1410 = uint(int(uint(int(_1408)) >> uint(2)));
    int _1412 = int(_1408) & 3;
    float _1414 = (*spvDescriptorSet0.vp_c9)._m0[int(_1410)][_1412];
    int _1416 = int(_1408) + 1;
    uint _1418 = uint(int(uint(_1416) >> uint(2)));
    int _1420 = _1416 & 3;
    float _1422 = (*spvDescriptorSet0.vp_c9)._m0[int(_1418)][_1420];
    if (!_1312)
    {
        _1142 = _452;
    }
    float _1424 = _1142;
    float _1426 = _1424;
    if (!_1312)
    {
        _1184 = _452;
    }
    float _1428 = _1184;
    float _1430 = _1428;
    if (_1312)
    {
        _1426 = _450;
    }
    float _1432 = _1426;
    if (_1312)
    {
        _1430 = _450;
    }
    float _1434 = _1430;
    uint _1436 = uint(int(uint(_1406) >> uint(2)));
    uint _1438 = uint(int(uint(int(_1436)) >> uint(2)));
    int _1440 = int(_1436) & 3;
    float _1442 = (*spvDescriptorSet0.vp_c9)._m0[int(_1438)][_1440];
    int _1444 = int(_1436) + 1;
    uint _1446 = uint(int(uint(_1444) >> uint(2)));
    int _1448 = _1444 & 3;
    float _1450 = (*spvDescriptorSet0.vp_c9)._m0[int(_1446)][_1448];
    bool _1452 = !_862;
    int _1454 = _1452 ? _1334 : (-1);
    float _1456 = _1432 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _1458 = _1358 > 0.0;
    bool _1460 = _1358 >= 0.0;
    bool _1462 = isnan(_1358);
    bool _1464 = _1460 || _1462;
    bool _1466 = isnan(0.0);
    bool _1468 = _1464 || _1466;
    int _1470 = _1400 + 8;
    uint _1472 = uint(int(uint(_1470) >> uint(2)));
    uint _1474 = uint(int(uint(int(_1472)) >> uint(2)));
    int _1476 = int(_1472) & 3;
    float _1478 = (*spvDescriptorSet0.vp_c9)._m0[int(_1474)][_1476];
    int _1480 = int(_1472) + 1;
    uint _1482 = uint(int(uint(_1480) >> uint(2)));
    int _1484 = _1480 & 3;
    float _1486 = (*spvDescriptorSet0.vp_c9)._m0[int(_1482)][_1484];
    int _1488 = _1468 ? 0 : 1;
    float _1490 = fma(_1392, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1492 = _766 >= 0.0;
    bool _1494 = isnan(_766);
    bool _1496 = _1492 || _1494;
    bool _1498 = isnan(0.0);
    bool _1500 = _1496 || _1498;
    float _1502 = fma(_1396, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _1504 = ~_1488;
    int _1506 = _1504 + 1;
    int _1508 = _1506 + 1;
    int _1510 = _1406 + 8;
    uint _1512 = uint(int(uint(_1510) >> uint(2)));
    uint _1514 = uint(int(uint(int(_1512)) >> uint(2)));
    int _1516 = int(_1512) & 3;
    float _1518 = (*spvDescriptorSet0.vp_c9)._m0[int(_1514)][_1516];
    int _1520 = int(_1512) + 1;
    uint _1522 = uint(int(uint(_1520) >> uint(2)));
    int _1524 = _1520 & 3;
    float _1526 = (*spvDescriptorSet0.vp_c9)._m0[int(_1522)][_1524];
    int _1528 = _1508;
    if (!_1458)
    {
        int _1530 = ~_1488;
        int _1532 = _1530 + 1;
        _1528 = _1532;
    }
    int _1534 = _1528;
    bool _1536 = !_1056;
    int _1538 = _1536 ? 0 : 1;
    bool _1540 = _984 != 3;
    float _1542 = _520 + (-1.0);
    bool _1544 = _1054 != 3;
    bool _1546 = _766 > 0.0;
    float _1548 = fma(_1542, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1550 = abs(_1080);
    int _1552 = _1500 ? 0 : 1;
    bool _1554 = !_1540;
    int _1556 = _1554 ? 0 : (-1);
    bool _1558 = !_1544;
    int _1560 = _1558 ? 0 : (-1);
    int _1562 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1564 = _1562 != 0;
    int _1566 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1568 = _1566 != 0;
    int _1570 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1572 = _1570 != 0;
    int _1574 = abs(_1148);
    int _1576 = abs(_1340);
    int _1578 = abs(_1538);
    int _1580 = ~_1550;
    int _1582 = _1580 + 1;
    int _1584 = _1582 + 1;
    int _1586 = ~_1574;
    int _1588 = _1586 + 1;
    int _1590 = _1588 + 1;
    int _1592 = _1584 * as_type<int>(_1422);
    int _1594 = ~_1576;
    int _1596 = _1594 + 1;
    int _1598 = _1596 + 1;
    int _1600 = _1590 * as_type<int>(_1450);
    int _1602 = abs(_1042);
    int _1604 = ~_1578;
    int _1606 = _1604 + 1;
    int _1608 = _1606 + 1;
    int _1610 = _1598 * as_type<int>(_1414);
    int _1612 = _1610 + _1592;
    int _1614 = abs(_1556);
    int _1616 = _1608 * as_type<int>(_1442);
    int _1618 = _1616 + _1600;
    int _1620 = ~_1602;
    int _1622 = _1620 + 1;
    int _1624 = _1622 + 1;
    float _1626 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1628 = int(_1626);
    int _1630 = abs(_1210);
    int _1632 = ~_1614;
    int _1634 = _1632 + 1;
    int _1636 = _1634 + 1;
    int _1638 = _1624 * as_type<int>(_1478);
    int _1640 = _1638 + _1612;
    int _1642 = ~_1630;
    int _1644 = _1642 + 1;
    int _1646 = _1644 + 1;
    int _1648 = abs(_1560);
    int _1650 = _1636 * as_type<int>(_1486);
    int _1652 = _1650 + _1640;
    int _1654 = abs(_1128);
    float _1656 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _1658 = int(_1656);
    int _1660 = ~_1648;
    int _1662 = _1660 + 1;
    int _1664 = _1662 + 1;
    int _1666 = _1646 * as_type<int>(_1518);
    int _1668 = _1666 + _1618;
    int _1670 = _1664 * as_type<int>(_1526);
    int _1672 = _1670 + _1668;
    int _1674 = abs(_1060);
    float _1676 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1678 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1676;
    float _1680 = float(uint(_1628));
    float _1682 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1684 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1682;
    int _1686 = ~_1654;
    int _1688 = _1686 + 1;
    int _1690 = _1688 + 1;
    float _1692 = fma(_1678, _1132, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    int _1694 = ~_1674;
    int _1696 = _1694 + 1;
    int _1698 = _1696 + 1;
    float _1700 = fma(_1684, _1132, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _1702 = 1.0 / _1680;
    int _1704 = _1672 * _1690;
    float _1706 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1708 = _1706 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1710 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1712 = _1710 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    int _1714 = _1652 * _1698;
    float _1716 = float(uint(_1658));
    int _1718 = _1454 * _1654;
    int _1720 = _1718 + _1704;
    bool _1722 = _337 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _1724 = isnan(_337);
    bool _1726 = _1722 || _1724;
    bool _1728 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _1730 = _1726 || _1728;
    float _1732 = float(_1730);
    float _1734 = fma(_1708, _506, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    int _1736 = abs(_1628);
    int _1738 = _1234 * _1674;
    int _1740 = _1738 + _1714;
    bool _1742 = _337 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _1744 = isnan(_337);
    bool _1746 = _1742 || _1744;
    bool _1748 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _1750 = _1746 || _1748;
    float _1752 = float(_1750);
    float _1754 = -_1732;
    float _1756 = _1754 + 1.0;
    float _1758 = 1.0 / _1716;
    int _1760 = abs(_1658);
    float _1762 = fma(_1712, _506, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _1764 = float(uint(_1736));
    float _1766 = _1752 * _1756;
    int _1768 = ~_1552;
    int _1770 = _1768 + 1;
    int _1772 = _1770 + 1;
    float _1774 = -_1752;
    float _1776 = _1774 + 1.0;
    int _1778 = _1772;
    if (!_1546)
    {
        int _1780 = ~_1552;
        int _1782 = _1780 + 1;
        _1778 = _1782;
    }
    int _1784 = _1778;
    bool _1786 = _1344 >= 0.0;
    bool _1788 = isnan(_1344);
    bool _1790 = _1786 || _1788;
    bool _1792 = isnan(0.0);
    bool _1794 = _1790 || _1792;
    float _1796 = 1.0 / _1764;
    int _1798 = as_type<int>(_1702) + (-2);
    float _1800 = float(uint(_1740));
    int _1802 = _1794 ? 0 : 1;
    bool _1804 = _337 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1806 = isnan(_337);
    bool _1808 = _1804 || _1806;
    bool _1810 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _1812 = _1808 || _1810;
    float _1814 = float(_1812);
    float _1816 = float(uint(_1760));
    bool _1818 = _1344 > 0.0;
    float _1820 = as_type<float>(_1798) * _1800;
    bool _1822 = _337 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1824 = isnan(_337);
    bool _1826 = _1822 || _1824;
    bool _1828 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1830 = _1826 || _1828;
    float _1832 = float(_1830);
    float _1834 = -_1814;
    float _1836 = _1834 + 1.0;
    bool _1838 = _337 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _1840 = isnan(_337);
    bool _1842 = _1838 || _1840;
    bool _1844 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _1846 = _1842 || _1844;
    float _1848 = float(_1846);
    float _1850 = 1.0 / _1816;
    float _1852 = _1814 * _1776;
    int _1854 = as_type<int>(_1758) + (-2);
    float _1856 = float(uint(_1720));
    float _1858 = _1848 * _1836;
    int _1860 = abs(_1740);
    float _1862 = -_1848;
    float _1864 = _1862 + 1.0;
    float _1866 = trunc(_1820);
    float _1868 = precise::max(_1866, 0.0);
    uint _1870 = uint(_1868);
    float _1872 = as_type<float>(_1854) * _1856;
    int _1874 = as_type<int>(_1796) + (-2);
    float _1876 = _1832 * _1864;
    float _1878 = float(uint(_1860));
    float _1880 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1882 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _1880;
    int _1884 = abs(_1720);
    float _1886 = trunc(_1872);
    float _1888 = precise::max(_1886, 0.0);
    uint _1890 = uint(_1888);
    int _1892 = ~_1628;
    int _1894 = _1892 + 1;
    float _1896 = as_type<float>(_1874) * _1878;
    float _1898 = fma(_1882, _1138, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    int _1900 = as_type<int>(_1850) + (-2);
    float _1902 = _1700 * _1876;
    float _1904 = float(uint(_1884));
    int _1906 = _1894 * int(_1870);
    int _1908 = _1906 + _1740;
    float _1910 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1912 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _1910;
    float _1914 = trunc(_1896);
    float _1916 = precise::max(_1914, 0.0);
    uint _1918 = uint(_1916);
    int _1920 = ~_1736;
    int _1922 = _1920 + 1;
    float _1924 = as_type<float>(_1900) * _1904;
    float _1926 = fma(_1912, _1138, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _1928 = float(uint(_1908));
    float _1930 = _1692 * _1876;
    int _1932 = ~_1658;
    int _1934 = _1932 + 1;
    float _1936 = -_1832;
    float _1938 = _1936 + 1.0;
    float _1940 = trunc(_1924);
    float _1942 = precise::max(_1940, 0.0);
    uint _1944 = uint(_1942);
    float _1946 = as_type<float>(_1798) * _1928;
    int _1948 = ~_1760;
    int _1950 = _1948 + 1;
    int _1952 = ~_1802;
    int _1954 = _1952 + 1;
    int _1956 = _1954 + 1;
    int _1958 = _1956;
    if (!_1818)
    {
        int _1960 = ~_1802;
        int _1962 = _1960 + 1;
        _1958 = _1962;
    }
    int _1964 = _1958;
    int _1966 = _1922 * int(_1918);
    int _1968 = _1966 + _1860;
    float _1970 = trunc(_1946);
    float _1972 = precise::max(_1970, 0.0);
    uint _1974 = uint(_1972);
    int _1976 = _1934 * int(_1890);
    int _1978 = _1976 + _1720;
    int _1980 = ~_1628;
    int _1982 = _1980 + 1;
    float _1984 = float(uint(_1978));
    float _1986 = fma(_1938, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1930);
    int _1988 = _1950 * int(_1944);
    int _1990 = _1988 + _1884;
    float _1992 = fma(_1938, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1902);
    float _1994 = float(_1964);
    float _1996 = as_type<float>(_1854) * _1984;
    float _1998 = float(uint(_1968));
    float _2000 = fma(_1734, _1858, _1986);
    float _2002 = fma(_1762, _1858, _1992);
    float _2004 = as_type<float>(_1874) * _1998;
    float _2006 = float(uint(_1990));
    float _2008 = trunc(_1996);
    float _2010 = precise::max(_2008, 0.0);
    uint _2012 = uint(_2010);
    int _2014 = int(_1870) + int(_1974);
    float _2016 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2018 = as_type<float>(_1900) * _2006;
    float _2020 = fma(_1456, -2.0, _2016);
    int _2022 = ~_1658;
    int _2024 = _2022 + 1;
    float _2026 = trunc(_2004);
    float _2028 = precise::max(_2026, 0.0);
    uint _2030 = uint(_2028);
    float _2032 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2034 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2036 = _1382 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2038 = fma(_1386, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2032);
    bool _2040 = !_1568;
    int _2042 = _2040 ? 0 : 1;
    float _2044 = fma(_1434, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2034);
    float _2046 = trunc(_2018);
    float _2048 = precise::max(_2046, 0.0);
    uint _2050 = uint(_2048);
    int _2052 = _1982 * _2014;
    int _2054 = _2052 + _1740;
    int _2056 = int(_1890) + int(_2012);
    float _2058 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2038);
    int _2060 = abs(_2042);
    float _2062 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2044);
    bool _2064 = uint(_2054) >= uint(_1628);
    int _2066 = _2024 * _2056;
    int _2068 = _2066 + _1720;
    int _2070 = int(_1918) + int(_2030);
    float _2072 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2074 = float(_1534);
    float _2076 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2020);
    int _2078 = ~_1736;
    int _2080 = _2078 + 1;
    float _2082 = -_2058;
    float _2084 = _2082 + 1.0;
    float _2086 = float(_2060);
    int _2088 = int(_1944) + int(_2050);
    float _2090 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2092 = log2(_2090);
    int _2094 = ~_1760;
    int _2096 = _2094 + 1;
    int _2098 = _2080 * _2070;
    int _2100 = _2098 + _1860;
    bool _2102 = !_2064;
    int _2104 = _2102 ? 0 : (-1);
    float _2106 = _2086 * _2074;
    bool _2108 = uint(_2068) >= uint(_1658);
    int _2110 = _2096 * _2088;
    int _2112 = _2110 + _1884;
    bool _2114 = !_1564;
    int _2116 = _2114 ? 0 : 1;
    float _2118 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2120 = _1218 + _2118;
    bool _2122 = !_2108;
    int _2124 = _2122 ? 0 : (-1);
    float _2126 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2128 = uint(_2100) >= uint(_1736);
    float _2130 = _2072 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2132 = uint(_2112) >= uint(_1760);
    int _2134 = ~_2014;
    int _2136 = _2134 + _2104;
    int _2138 = _2136 + 1;
    int _2140 = ~_2056;
    int _2142 = _2140 + _2124;
    int _2144 = _2142 + 1;
    float _2146 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _2148 = !_2128;
    int _2150 = _2148 ? 0 : (-1);
    int _2152 = _1628 * _2138;
    int _2154 = _2152 + _1740;
    bool _2156 = !_2132;
    int _2158 = _2156 ? 0 : (-1);
    bool _2160 = _1628 == 0;
    bool _2162 = _1628 == 0;
    int _2164 = _1740 ^ _1628;
    float _2166 = _2092 * _147;
    float _2168 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2170 = _1288 + _2168;
    uint _2172 = uint(int(uint(_2164) >> uint(31)));
    float _2174 = _2120 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _2176 = ~_2150;
    int _2178 = _2070 + _2176;
    int _2180 = _2178 + 1;
    float _2182 = exp2(_2166);
    float _2184 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _2186 = ~int(_2172);
    int _2188 = _2186 + 1;
    float _2190 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2192 = _1310 + _2190;
    float _2194 = -_2184;
    float _2196 = fma(_2036, 2.0, _2194);
    int _2198 = abs(_2116);
    float _2200 = fma(_2170, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2174);
    int _2202 = _2180 ^ _2188;
    float _2204 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2206 = 1.0 + _2204;
    float _2208 = float(_2198);
    int _2210 = _1658 * _2144;
    int _2212 = _2210 + _1720;
    bool _2214 = !_2160;
    int _2216 = _2214 ? _2154 : (-1);
    float _2218 = fma(_2192, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2200);
    bool _2220 = _1658 == 0;
    float _2222 = 1.0 / _2206;
    int _2224 = ~_2188;
    int _2226 = _2224 + _2202;
    int _2228 = _2226 + 1;
    float _2230 = -_2182;
    float _2232 = _2230 + 1.0;
    bool _2234 = !_2220;
    int _2236 = _2234 ? _2212 : (-1);
    float _2238 = -_147;
    float _2240 = fma(_2238, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2196);
    bool _2242 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2244 = isnan(0.0);
    bool _2246 = _2242 || _2244;
    bool _2248 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2250 = _2246 || _2248;
    float _2252 = _2208 * _1994;
    bool _2254 = _2218 >= 0.0;
    float _2256 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _2258 = !_2162;
    int _2260 = _2258 ? _2228 : (-1);
    bool _2262 = _1658 == 0;
    int _2264 = _1720 ^ _1658;
    float _2266 = _2250 ? _2232 : 0.0;
    bool _2268 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2270 = isnan(1.0);
    bool _2272 = _2268 || _2270;
    bool _2274 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2276 = _2272 || _2274;
    uint _2278 = uint(int(uint(_2264) >> uint(31)));
    float _2280 = _2062;
    if (_2254)
    {
        out.m_61.x = 0.0;
    }
    int _2282 = ~_2158;
    int _2284 = _2088 + _2282;
    int _2286 = _2284 + 1;
    float _2288 = float(_2216);
    int _2290 = ~int(_2278);
    int _2292 = _2290 + 1;
    float _2294 = _2146 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2296 = fma(_2130, _2288, _1350);
    int _2298 = _2286 ^ _2292;
    if (_2276)
    {
        float _2300 = _2266 * _2222;
        _149 = _2300;
    }
    float _2302 = _149;
    float _2304 = float(_2236);
    float _2306 = _1242 + 0.5;
    float _2308 = float(_2260);
    float _2310 = _2126 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _2312 = ~_2292;
    int _2314 = _2312 + _2298;
    int _2316 = _2314 + 1;
    float _2318 = _2120 * _2120;
    float _2320 = fma(_2130, _2306, _2296);
    float _2322 = fma(_2294, _2304, _2240);
    bool _2324 = !_2262;
    int _2326 = _2324 ? _2316 : (-1);
    float _2328 = -_1354;
    float _2330 = fma(_2310, _2308, _2328);
    float _2332 = _1308 + 0.5;
    float _2334 = in.m_76.x;
    float _2336 = in.m_76.y;
    float _2338 = in.m_76.z;
    float _2340 = fma(_2170, _2170, _2318);
    float _2342 = _2256 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2344 = fma(_2294, _2332, _2322);
    float _2346 = -_221;
    int _2348 = _1216 ? as_type<int>(_2346) : as_type<int>(_221);
    float _2350 = fma(_2192, _2192, _2340);
    bool _2352 = !_1258;
    float _2354 = _2352 ? _221 : as_type<float>(_1246);
    float _2356 = float(_2326);
    bool _2358 = !_1254;
    float _2360 = _2358 ? _221 : as_type<float>(_2348);
    float _2362 = rsqrt(_2350);
    float _2364 = _2354 + (-0.5);
    float _2366 = -_2076;
    float _2368 = fma(_2342, _2356, _2366);
    float _2370 = _2360 + (-0.5);
    float _2372 = -_2310;
    float _2374 = fma(_2372, _2364, _2330);
    float _2376 = -_1402;
    float _2378 = _2376 + 1.0;
    float _2380 = -_2342;
    float _2382 = fma(_2380, _2370, _2368);
    float _2384 = _2252 * (-2.0);
    float _2386 = -_2378;
    float _2388 = fma(_1242, _2386, _2320);
    float _2390 = -_2084;
    float _2392 = fma(_1308, _2390, _2344);
    float _2394 = _2370;
    float _2396 = _2360;
    if (_2254)
    {
        _2394 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2398 = _2394;
    float _2400 = -_2062;
    float _2402 = _2400 + 1.0;
    float _2404 = fma(_2354, _584, _2374);
    float _2406 = fma(_2384, _2334, _2334);
    float _2408 = fma(_1490, _2384, _1490);
    int _2410 = as_type<int>(_2398);
    if (_2254)
    {
        float _2412 = _2398 * 5.0;
        _2410 = as_type<int>(_2412);
    }
    int _2414 = _2410;
    float _2416 = fma(_2360, _2402, _2382);
    float _2418 = _2120 * _2362;
    float _2420 = fma(_1376, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2406);
    float _2422 = _2170 * _2362;
    if (_2254)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7691 = as_type<float>(_2414);
        out.gl_Position.z = _7691;
    }
    float _2424 = -_2418;
    float _2426 = fma(_2424, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2120);
    bool _2428 = !_1572;
    int _2430 = _2428 ? 0 : 1;
    float _2432 = -_2422;
    float _2434 = fma(_2432, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2170);
    out.m_78.x = _2388;
    out.m_78.y = _2404;
    out.m_78.z = _2392;
    out.m_78.w = _2416;
    float _2436 = _2426 * _2426;
    if (_2254)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2438 = -_2418;
    float _2440 = fma(_2438, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1218);
    float _2442 = _2192 * _2362;
    float _2444 = -_2422;
    float _2446 = fma(_2444, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1288);
    float _2448 = fma(_2434, _2434, _2436);
    float _2450 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2452 = _2440 + _2450;
    float _2454 = -_2442;
    float _2456 = fma(_2454, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2192);
    float _2458 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2460 = _2446 + _2458;
    int _2462 = abs(_2430);
    float _2464 = _2452 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2466 = -_2442;
    float _2468 = fma(_2466, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1310);
    float _2470 = fma(_2456, _2456, _2448);
    float _2472 = _2106 * (-2.0);
    float _2474 = fma(_2460, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2464);
    float _2476 = float(_2462);
    float _2478 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2480 = _2468 + _2478;
    float _2482 = float(_1784);
    float _2484 = fma(_2408, _2302, _2420);
    float _2486 = fma(_1548, _2472, _1548);
    float _2488 = fma(_2480, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2474);
    float _2490 = fma(_2472, _2336, _2336);
    float _2492 = _2476 * _2482;
    float _2494 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _2496 = _2494 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _2498 = in.m_68.x;
    float _2500 = in.m_68.y;
    bool _2502 = _2488 >= 0.0;
    float _2504 = _2492 * (-2.0);
    float _2506 = fma(_1384, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2490);
    float _2508 = fma(_2496, _1326, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _2510 = fma(_1926, _1852, _2002);
    float _2512 = fma(_2504, _2338, _2338);
    float _2514 = fma(_2486, _2302, _2506);
    float _2516 = fma(_1502, _2504, _1502);
    float _2518 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _2520 = _2518 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _2522 = _2484 * 0.15915493667125701904296875;
    float _2524 = _2514 * 0.15915493667125701904296875;
    float _2526 = fma(_2508, _1766, _2510);
    float _2528 = fma(_2520, _1326, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _2530 = _2514;
    float _2532 = _2468;
    if (_2502)
    {
        _2530 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2534 = _2530;
    float _2536 = sqrt(_2470);
    float _2538 = fma(_1388, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2512);
    float _2540 = fma(_1732, (*spvDescriptorSet0.vp_c9)._m0[147].y, _2526);
    int _2542 = as_type<int>(_2534);
    if (_2502)
    {
        out.m_61.x = 0.0;
    }
    if (_2502)
    {
        float _2544 = _2534 * 5.0;
        _2542 = as_type<int>(_2544);
    }
    int _2546 = _2542;
    float _2548 = fma(_2516, _2302, _2538);
    float _2550 = fma(_1898, _1852, _2000);
    float _2552 = _2522 * 6.283185482025146484375;
    float _2554 = sin(_2552);
    float _2556 = _2540 * _2500;
    float _2558 = _2550;
    if (_2502)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7939 = as_type<float>(_2546);
        out.gl_Position.z = _7939;
    }
    float _2560 = _2548 * 0.15915493667125701904296875;
    float _2562 = _2522 * 6.283185482025146484375;
    float _2564 = cos(_2562);
    float _2566 = _2524 * 6.283185482025146484375;
    float _2568 = sin(_2566);
    float _2570 = _2524 * 6.283185482025146484375;
    float _2572 = cos(_2570);
    if (_2502)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2574 = _2560 * 6.283185482025146484375;
    float _2576 = cos(_2574);
    float _2578 = fma(_2528, _1766, _2550);
    float _2580 = _2362 * _2536;
    float _2582 = _2556 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2584 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _221);
    float _2586 = fma(_1732, (*spvDescriptorSet0.vp_c9)._m0[147].x, _2578);
    float _2588 = _2564 * _2572;
    float _2590 = _2580 * _2582;
    float _2592 = _2560 * 6.283185482025146484375;
    float _2594 = sin(_2592);
    float _2596 = _2586 * _2498;
    float _2598 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _217);
    float _2600 = _2584 * _2590;
    float _2602 = _2554 * _2568;
    float _2604 = _2596 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2606 = _2554 * _2572;
    float _2608 = _2564 * _2568;
    float _2610 = _2564 * _2576;
    float _2612 = _2580 * _2604;
    float _2614 = _2554 * _2576;
    float _2616 = _2572 * _2576;
    float _2618 = _2610 * _2600;
    float _2620 = _2598 * _2612;
    float _2622 = _2568 * _2576;
    float _2624 = _2580 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2626 = _2624 * 0.5;
    float _2628 = fma(_2594, _2588, _2602);
    float _2630 = -_2606;
    float _2632 = fma(_2594, _2608, _2630);
    float _2634 = -_2600;
    float _2636 = _2594 * _2634;
    float _2638 = _2614 * _2600;
    float _2640 = fma(_2628, _2620, _2618);
    float _2642 = -_2608;
    float _2644 = fma(_2594, _2606, _2642);
    float _2646 = fma(_2616, _2620, _2636);
    float _2648 = fma(_2594, _2602, _2588);
    float _2650 = fma(_2632, _2626, _2640);
    float _2652 = fma(_2644, _2620, _2638);
    float _2654 = fma(_2622, _2626, _2646);
    float _2656 = _2628 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2658 = _2650 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2660 = _2650 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2662 = fma(_2648, _2626, _2652);
    float _2664 = _221 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2666 = fma(_2654, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2658);
    float _2668 = fma(_2654, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2660);
    float _2670 = _2610 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2672 = fma(_2662, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2666);
    float _2674 = fma(_2662, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2668);
    float _2676 = _2672 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2678 = _2674 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2680 = _1288 + _2676;
    float _2682 = _1310 + _2678;
    float _2684 = _2628 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2686 = _2628 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2688 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2690 = _2680 + _2688;
    float _2692 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2694 = _2682 + _2692;
    float _2696 = _2650 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2698 = fma(_2616, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2684);
    float _2700 = _2690 * _2690;
    float _2702 = _2694 * _2694;
    float _2704 = fma(_2616, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2686);
    float _2706 = fma(_2616, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2656);
    float _2708 = fma(_2664, _2664, 1.0);
    float _2710 = _2700 + _2702;
    float _2712 = fma(_2654, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2696);
    float _2714 = _2610 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2716 = _2610 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2718 = sqrt(_2710);
    float _2720 = fma(_2662, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2712);
    float _2722 = -_2594;
    float _2724 = fma(_2722, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2714);
    float _2726 = -_2594;
    float _2728 = fma(_2726, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2716);
    float _2730 = -_2594;
    float _2732 = fma(_2730, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2670);
    float _2734 = _2720 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2736 = _2632 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2738 = _2632 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2740 = rsqrt(_2708);
    float _2742 = _2632 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2744 = _1218 + _2734;
    float _2746 = fma(_2622, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2736);
    float _2748 = fma(_2622, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2738);
    float _2750 = fma(_2622, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2742);
    bool _2752 = _2718 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2754 = _2742;
    float _2756 = _2736;
    float _2758 = _2622;
    float _2760 = _2738;
    float _2762 = _2734;
    float _2764 = _2698;
    if (!_2752)
    {
        _2754 = _2702;
    }
    float _2766 = _2754;
    float _2768 = _2766;
    if (!_2752)
    {
        _2756 = _2700;
    }
    float _2770 = _2756;
    float _2772 = _2770;
    if (!_2752)
    {
        _2758 = _2680;
    }
    float _2774 = _2758;
    float _2776 = _2774;
    if (!_2752)
    {
        _2760 = _2682;
    }
    float _2778 = _2760;
    float _2780 = _2778;
    if (!_2752)
    {
        _2762 = _2744;
    }
    float _2782 = _2762;
    bool _2784 = !_2752;
    float _2786 = _2782;
    if (!_2784)
    {
        float _2788 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2790 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2792 = _2718 + _2790;
        float _2794 = rsqrt(_2710);
        float _2796 = _2792 * _2788;
        float _2798 = _2744 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2800 = _2796 * 0.15915493667125701904296875;
        float _2802 = _2800 * 6.283185482025146484375;
        float _2804 = sin(_2802);
        float _2806 = _2800 * 6.283185482025146484375;
        float _2808 = cos(_2806);
        float _2810 = fma(_2804, _2798, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2812 = _2794 * _2810;
        float _2814 = _2808 + (-1.0);
        float _2816 = fma(_2690, _2812, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2818 = fma(_2694, _2812, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2820 = _2814 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2822 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2824 = _2816 + _2822;
        float _2826 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2828 = _2818 + _2826;
        float _2830 = fma(_2744, _2808, _2820);
        float _2832 = _2824 * _2824;
        float _2834 = _2828 * _2828;
        _2786 = _2830;
        _2772 = _2832;
        _2768 = _2834;
        _2776 = _2816;
        _2780 = _2818;
    }
    float _2836 = _2786;
    float _2838 = _2772;
    float _2840 = _2768;
    float _2842 = _2776;
    float _2844 = _2780;
    float _2846 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2848 = _2836 + _2846;
    float _2850 = fma(_2614, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2724);
    float _2852 = fma(_2614, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2728);
    float _2854 = fma(_2648, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2748);
    float _2856 = fma(_2848, _2848, _2838);
    float _2858 = fma(_2614, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2732);
    float _2860 = fma(_2648, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2746);
    float _2862 = fma(_2648, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2750);
    float _2864 = _2856 + _2840;
    float _2866 = _2664 * _2740;
    float _2868 = fma(_2644, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2698);
    float _2870 = fma(_2644, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2704);
    float _2872 = _217 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2874 = _2664 * _2852;
    float _2876 = _2664 * _2850;
    float _2878 = fma(_2644, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2706);
    float _2880 = _2664 * _2858;
    float _2882 = -_2860;
    float _2884 = _2866 * _2882;
    float _2886 = -_2854;
    float _2888 = _2866 * _2886;
    float _2890 = -_2862;
    float _2892 = _2866 * _2890;
    float _2894 = sqrt(_2864);
    float _2896 = fma(_2872, _2868, _2874);
    float _2898 = fma(_2872, _2870, _2876);
    float _2900 = fma(_2872, _2878, _2880);
    float _2902 = fma(_2740, _2852, _2884);
    float _2904 = fma(_2740, _2850, _2888);
    float _2906 = fma(_2740, _2858, _2892);
    float _2908 = _2860 + _2896;
    float _2910 = _2854 + _2898;
    float _2912 = _2862 + _2900;
    out.m_80.x = _2868;
    out.m_80.y = _2870;
    out.m_80.z = _2878;
    out.m_82.x = _2902;
    out.m_82.y = _2904;
    out.m_82.z = _2906;
    bool _2914 = _2894 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2916 = isnan(_2894);
    bool _2918 = _2914 || _2916;
    bool _2920 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2922 = _2918 || _2920;
    out.m_84.x = _2908;
    out.m_84.y = _2910;
    out.m_84.z = _2912;
    if (!_2922)
    {
        _2764 = 1.0;
    }
    float _2924 = _2764;
    bool _2926 = !_2922;
    float _2928 = _2924;
    if (!_2926)
    {
        bool _2930 = _2894 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2932 = isnan(_2894);
        bool _2934 = _2930 || _2932;
        bool _2936 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2938 = _2934 || _2936;
        if (!_2938)
        {
            float _2940 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2942 = _2894 + _2940;
            float _2944 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2946 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2944;
            float _2948 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2950 = _2948 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2952 = 1.0 / _2946;
            float _2954 = _2942 * _2952;
            float _2956 = fma(_2954, _2950, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2928 = _2956;
            _2958 = true;
        }
        else
        {
            bool _2960 = _2894 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2962 = isnan(_2894);
            bool _2964 = _2960 || _2962;
            bool _2966 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2968 = _2964 || _2966;
            if (!_2968)
            {
                float _2970 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2972 = _2894 + _2970;
                float _2974 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2976 = _2974 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2978 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2980 = _2978 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2982 = 1.0 / _2976;
                float _2984 = _2972 * _2982;
                float _2986 = fma(_2984, _2980, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2928 = _2986;
                _2958 = true;
            }
            else
            {
                _2928 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2958 = false;
    float _2988 = _2928;
    float _2990 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2992 = _2836 + _2990;
    float _2994 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2996 = _2842 + _2994;
    float _2998 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _3000 = _2844 + _2998;
    float _3002 = _2440 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3004 = fma(_2992, _2988, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _3006 = fma(_2996, _2988, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _3008 = fma(_3000, _2988, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _3010 = fma(_2446, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3002);
    float _3012 = -_2418;
    float _3014 = fma(_3012, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3004);
    float _3016 = -_2422;
    float _3018 = fma(_3016, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3006);
    float _3020 = -_2442;
    float _3022 = fma(_3020, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3008);
    float _3024 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3026 = _3014 + _3024;
    float _3028 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3030 = _3018 + _3028;
    float _3032 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3034 = _3022 + _3032;
    float _3036 = _3026 * _3026;
    float _3038 = fma(_3030, _3030, _3036);
    float _3040 = fma(_2446, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _3042 = fma(_3034, _3034, _3038);
    float _3044 = fma(_2468, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3010);
    float _3046 = _2440 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3048 = rsqrt(_3042);
    float _3050 = _3044 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3052 = fma(_2446, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3046);
    float _3054 = fma(_2468, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3052);
    float _3056 = 1.0 / _3050;
    float _3058 = _3054 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3060 = _3058 + _3050;
    float _3062 = _3048 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3064 = sqrt(_3042);
    float _3066 = _3030 * _3062;
    float _3068 = _3034 * _3062;
    float _3070 = _3066 * _3066;
    float _3072 = _3068 * _3068;
    float _3074 = _3060 * _3056;
    float _3076 = _3074 * 0.5;
    float _3078 = _3070 + _3072;
    float _3080 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3082 = fma(_3076, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3080);
    float _3084 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _3086 = sqrt(_3078);
    float _3088 = _2440 + _3084;
    float _3090 = _3088 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _3092 = 1.0 / _3082;
    float _3094 = _3088 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _3096 = fma(_2446, (*spvDescriptorSet0.vp_c15)._m0[126].x, _3090);
    float _3098 = fma(_2446, (*spvDescriptorSet0.vp_c15)._m0[127].x, _3094);
    float _3100 = fma(_2468, (*spvDescriptorSet0.vp_c15)._m0[126].z, _3096);
    bool _3102 = _3086 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3104 = fma(_2468, (*spvDescriptorSet0.vp_c15)._m0[127].z, _3098);
    float _3106 = floor(_3040);
    float _3108 = _3100 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _3110 = _3104 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _3112 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3114 = _3092 * _3112;
    float _3116 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3118 = _3086 + _3116;
    float _3120 = trunc(_3108);
    int _3122 = int(_3120);
    float _3124 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    bool _3126 = _3114 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _3128 = _3114 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _3130 = precise::max(0.0, _3124);
    float _3132 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    int _3134 = 2;
    float _3136 = _3062;
    float _3138 = _3118;
    float _3140 = _3078;
    float _3142 = _3066;
    float _3144 = _3070;
    int _3146 = as_type<int>(_3072);
    if (_3102)
    {
        float _3148 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3132 = _3148;
    }
    float _3150 = _3132;
    float _3152 = -_3106;
    float _3154 = _3040 + _3152;
    float _3156 = -_3062;
    float _3158 = -_3130;
    float _3160 = fma(_3026, _3156, _3158);
    float _3162 = _3160;
    if (!_3126)
    {
        _3134 = 1;
    }
    int _3164 = _3134;
    float _3166 = trunc(_3110);
    int _3168 = int(_3166);
    int _3170 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _3172 = _3122 + _3170;
    int _3174 = _3172 + 1;
    int _3176 = _3164;
    if (_3102)
    {
        float _3178 = _3160 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3136 = _3178;
    }
    float _3180 = _3136;
    if (_3102)
    {
        float _3182 = _3118 * _3150;
        _3138 = _3182;
    }
    float _3184 = _3138;
    if (_3102)
    {
        float _3186 = rsqrt(_3078);
        _3140 = _3186;
    }
    float _3188 = _3140;
    float _3190 = _3188;
    if (_3102)
    {
        float _3192 = _3184 * 0.15915493667125701904296875;
        _2396 = _3192;
    }
    float _3194 = _2396;
    bool _3196 = !_3126;
    int _3198 = _3196 ? 0 : 1;
    if (!_3128)
    {
        _3176 = _3198;
    }
    int _3200 = _3176;
    float _3202 = _3104;
    float _3204 = as_type<float>(_3200);
    if (_3102)
    {
        float _3206 = _3194 * 6.283185482025146484375;
        float _3208 = sin(_3206);
        _3202 = _3208;
    }
    float _3210 = _3202;
    int _3212 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _3214 = _3168 + _3212;
    int _3216 = _3214 + 1;
    int _3218 = _3200 << 6;
    bool _3220 = _3174 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _3222 = _3218 + 96;
    uint _3224 = uint(int(uint(_3222) >> uint(2)));
    uint _3226 = uint(int(uint(int(_3224)) >> uint(2)));
    int _3228 = int(_3224) & 3;
    float _3230 = (*spvDescriptorSet0.vp_c15)._m0[int(_3226)][_3228];
    int _3232 = int(_3224) + 1;
    uint _3234 = uint(int(uint(_3232) >> uint(2)));
    int _3236 = _3232 & 3;
    float _3238 = (*spvDescriptorSet0.vp_c15)._m0[int(_3234)][_3236];
    int _3240 = _3174 | _3216;
    float _3242 = _3194;
    float _3244 = as_type<float>(_3240);
    if (_3102)
    {
        float _3246 = _3194 * 6.283185482025146484375;
        float _3248 = cos(_3246);
        _3242 = _3248;
    }
    float _3250 = _3242;
    bool _3252 = _3240 < 0;
    bool _3254 = _3252 || _3220;
    int _3256 = _3218 + 48;
    uint _3258 = uint(int(uint(_3256) >> uint(2)));
    uint _3260 = uint(int(uint(int(_3258)) >> uint(2)));
    int _3262 = int(_3258) & 3;
    float _3264 = (*spvDescriptorSet0.vp_c15)._m0[int(_3260)][_3262];
    int _3266 = int(_3258) + 1;
    uint _3268 = uint(int(uint(_3266) >> uint(2)));
    int _3270 = _3266 & 3;
    float _3272 = (*spvDescriptorSet0.vp_c15)._m0[int(_3268)][_3270];
    if (_3102)
    {
        float _3274 = fma(_3210, _3180, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3244 = _3274;
    }
    float _3276 = _3244;
    float _3278 = _3014 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3280 = fma(_2468, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    bool _3282 = _3216 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _3284 = _3282 || _3254;
    if (_3102)
    {
        float _3286 = _3188 * _3276;
        _2558 = _3286;
    }
    float _3288 = _2558;
    float _3290 = fma(_3018, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3278);
    float _3292 = floor(_3280);
    int _3294 = _3218 + 104;
    uint _3296 = uint(int(uint(_3294) >> uint(2)));
    uint _3298 = uint(int(uint(int(_3296)) >> uint(2)));
    int _3300 = int(_3296) & 3;
    float _3302 = (*spvDescriptorSet0.vp_c15)._m0[int(_3298)][_3300];
    int _3304 = int(_3296) + 1;
    uint _3306 = uint(int(uint(_3304) >> uint(2)));
    int _3308 = _3304 & 3;
    float _3310 = (*spvDescriptorSet0.vp_c15)._m0[int(_3306)][_3308];
    if (_3102)
    {
        float _3312 = _3066 * _3288;
        _3142 = _3312;
    }
    float _3314 = _3142;
    float _3316 = _3250;
    if (_3102)
    {
        float _3318 = _3250 + (-1.0);
        _3190 = _3318;
    }
    float _3320 = _3190;
    float _3322 = fma(_3022, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3290);
    float _3324 = _3320;
    if (_3102)
    {
        float _3326 = _3314 * _3314;
        _3144 = _3326;
    }
    float _3328 = _3144;
    if (_3102)
    {
        float _3330 = _3320 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2280 = _3330;
    }
    float _3332 = _2280;
    if (!_3102)
    {
        _3324 = _3068;
    }
    float _3334 = _3324;
    int _3336 = _3218 + 64;
    uint _3338 = uint(int(uint(_3336) >> uint(2)));
    uint _3340 = uint(int(uint(int(_3338)) >> uint(2)));
    int _3342 = int(_3338) & 3;
    float _3344 = (*spvDescriptorSet0.vp_c15)._m0[int(_3340)][_3342];
    int _3346 = int(_3338) + 1;
    uint _3348 = uint(int(uint(_3346) >> uint(2)));
    int _3350 = _3346 & 3;
    float _3352 = (*spvDescriptorSet0.vp_c15)._m0[int(_3348)][_3350];
    float _3354 = _3334;
    if (_3102)
    {
        float _3356 = _3068 * _3288;
        _3354 = _3356;
    }
    float _3358 = _3354;
    if (_3102)
    {
        float _3360 = fma(_3160, _3250, _3332);
        _3162 = _3360;
    }
    float _3362 = _3162;
    if (!_3102)
    {
        _3316 = _3072;
    }
    float _3364 = _3316;
    float _3366 = _2330;
    float _3368 = _3364;
    if (!_3284)
    {
        float _3370 = floor(_3110);
        _3366 = _3370;
    }
    float _3372 = _3366;
    if (_3102)
    {
        float _3374 = _3358 * _3358;
        _3368 = _3374;
    }
    float _3376 = _3368;
    float _3378 = fma(_3362, _3362, _3328);
    if (!_3284)
    {
        int _3380 = _3216 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _3382 = _3380 + _3174;
        _3146 = _3382;
    }
    int _3384 = _3146;
    int _3386 = _3218 + 80;
    uint _3388 = uint(int(uint(_3386) >> uint(2)));
    uint _3390 = uint(int(uint(int(_3388)) >> uint(2)));
    int _3392 = int(_3388) & 3;
    float _3394 = (*spvDescriptorSet0.vp_c15)._m0[int(_3390)][_3392];
    int _3396 = int(_3388) + 1;
    uint _3398 = uint(int(uint(_3396) >> uint(2)));
    int _3400 = _3396 & 3;
    float _3402 = (*spvDescriptorSet0.vp_c15)._m0[int(_3398)][_3400];
    float _3404 = _3378 + _3376;
    float _3406 = _3322 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3408 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3410 = -_3292;
    float _3412 = _3280 + _3410;
    float _3414 = _3406 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    int _3416 = _3218 + 56;
    uint _3418 = uint(int(uint(_3416) >> uint(2)));
    uint _3420 = uint(int(uint(int(_3418)) >> uint(2)));
    int _3422 = int(_3418) & 3;
    float _3424 = (*spvDescriptorSet0.vp_c15)._m0[int(_3420)][_3422];
    int _3426 = int(_3418) + 1;
    uint _3428 = uint(int(uint(_3426) >> uint(2)));
    int _3430 = _3426 & 3;
    float _3432 = (*spvDescriptorSet0.vp_c15)._m0[int(_3428)][_3430];
    float _3434 = -_3414;
    float _3436 = fma(_3434, _3408, 1.0);
    int _3438 = _3218 + 88;
    uint _3440 = uint(int(uint(_3438) >> uint(2)));
    uint _3442 = uint(int(uint(int(_3440)) >> uint(2)));
    int _3444 = int(_3440) & 3;
    float _3446 = (*spvDescriptorSet0.vp_c15)._m0[int(_3442)][_3444];
    int _3448 = int(_3440) + 1;
    uint _3450 = uint(int(uint(_3448) >> uint(2)));
    int _3452 = _3448 & 3;
    float _3454 = (*spvDescriptorSet0.vp_c15)._m0[int(_3450)][_3452];
    float _3456 = _3088 * _3238;
    float _3458 = log2(_3436);
    float _3460 = fma(_2446, _3230, _3456);
    int _3462 = _3218 + 72;
    uint _3464 = uint(int(uint(_3462) >> uint(2)));
    uint _3466 = uint(int(uint(int(_3464)) >> uint(2)));
    int _3468 = int(_3464) & 3;
    float _3470 = (*spvDescriptorSet0.vp_c15)._m0[int(_3466)][_3468];
    int _3472 = int(_3464) + 1;
    uint _3474 = uint(int(uint(_3472) >> uint(2)));
    int _3476 = _3472 & 3;
    float _3478 = (*spvDescriptorSet0.vp_c15)._m0[int(_3474)][_3476];
    float _3480 = _3088 * _3272;
    float _3482 = rsqrt(_3404);
    float _3484 = fma(_2446, _3264, _3480);
    int _3486 = as_type<int>(_3480);
    int _3488 = as_type<int>(_3230);
    if (!_3284)
    {
        int _3490 = _3384 << 2;
        _3486 = _3490;
    }
    int _3492 = _3486;
    float _3494 = fma(_2468, _3302, _3460);
    int _3496 = _3492;
    if (!_3284)
    {
        int _3498 = 12 & _3492;
        _3496 = _3498;
    }
    int _3500 = _3496;
    float _3502 = _3494 + _3310;
    float _3504 = _3088 * _3352;
    float _3506 = _3352;
    int _3508 = as_type<int>(_3402);
    if (!_3284)
    {
        float _3510 = -_3372;
        float _3512 = _3110 + _3510;
        _3506 = _3512;
    }
    float _3514 = _3506;
    float _3516 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3518 = fma(_3064, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3516);
    float _3520 = precise::clamp(_3518, 0.0, 1.0);
    float _3522 = 1.0 / _3502;
    float _3524 = fma(_2446, _3344, _3504);
    float _3526 = _3482 * _3314;
    float _3528 = _3482 * _3362;
    float _3530 = _3482 * _3358;
    float _3532 = _3088 * _3402;
    float _3534 = _3526 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    if (!_3284)
    {
        uint _3536 = uint(int(uint(_3384) >> uint(2)));
        _3508 = int(_3536);
    }
    int _3538 = _3508;
    float _3540 = fma(_2446, _3394, _3532);
    float _3542 = -_3520;
    float _3544 = _3542 + 1.0;
    if (!_3284)
    {
        int _3546 = _3538 << 4;
        int _3548 = _3546 + _3500;
        _3488 = _3548;
    }
    int _3550 = _3488;
    float _3552 = fma(_2468, _3424, _3484);
    float _3554 = abs(_3544);
    float _3556 = log2(_3554);
    float _3558 = _3552 + _3432;
    float _3560 = _3014 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3562 = fma(_2468, _3446, _3540);
    float _3564 = -_3534;
    float _3566 = fma(_3528, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3564);
    float _3568 = _3014 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3570 = fma(_3018, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3560);
    float _3572 = -_3530;
    float _3574 = fma(_3572, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3566);
    float _3576 = fma(_3018, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3568);
    float _3578 = _3558 * _3522;
    float _3580 = fma(_2468, _3470, _3524);
    float _3582 = fma(_3574, -0.5, 0.5);
    float _3584 = fma(_3574, 0.5, 0.5);
    float _3586 = fma(_3022, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3576);
    float _3588 = _3580 + _3478;
    float _3590 = _3014 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3592 = fma(_3022, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3570);
    bool _3594 = _3578 >= 0.0;
    float _3596 = _3588 * _3522;
    float _3598 = fma(_3018, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3590);
    float _3600 = _3592 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _3602 = _3578 <= 1.0;
    bool _3604 = _3602 && _3594;
    float _3606 = _3556 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3608 = fma(_3022, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3598);
    float _3610 = _3600 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _3612 = _3596 >= 0.0;
    bool _3614 = _3612 && _3604;
    float _3616 = exp2(_3606);
    float _3618 = _3608 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3620 = _3524;
    if (!_3284)
    {
        int _3622 = _3550 + 400;
        uint _3624 = uint(int(uint(_3622) >> uint(2)));
        uint _3626 = uint(int(uint(int(_3624)) >> uint(2)));
        int _3628 = int(_3624) & 3;
        float _3630 = (*spvDescriptorSet0.vp_c15)._m0[int(_3626)][_3628];
        _3620 = _3630;
    }
    float _3632 = _3620;
    bool _3634 = _3596 <= 1.0;
    bool _3636 = _3634 && _3614;
    float _3638 = _3586 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3640 = fma(_3618, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3610);
    float _3642 = _3586;
    if (!_3284)
    {
        float _3644 = floor(_3108);
        _3642 = _3644;
    }
    float _3646 = _3642;
    float _3648 = fma(_3406, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3640);
    float _3650 = fma(_3584, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3652 = _3600 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3654 = _3562 + _3454;
    float _3656 = fma(_3638, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3648);
    float _3658 = fma(_3584, _3650, -0.212114393711090087890625);
    float _3660 = _3528 + 1.0;
    float _3662 = _3600 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3664 = sqrt(_3582);
    float _3666 = fma(_3584, _3658, 1.570728778839111328125);
    float _3668 = fma(_3618, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3652);
    float _3670 = -_3528;
    float _3672 = fma(_3616, _3660, _3670);
    if (_3636)
    {
        float _3674 = float(_3200);
        _3204 = _3674;
    }
    float _3676 = _3204;
    float _3678 = fma(_3618, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3662);
    float _3680 = fma(_3406, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3668);
    float2 _9864 = float2(_3154, _3412);
    float _3682 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_9864, float2(0.0), isnan(_9864)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_9864, float2(0.0), isnan(_9864)), level(0.0)).x;
    float _3684 = 1.0 / _3656;
    float _3686 = fma(_3406, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3678);
    float _3688 = _3458 * 0.693147182464599609375;
    float _3690 = _3654 * _3522;
    float _3692 = fma(_3672, 0.5, 0.5);
    float _3694 = fma(_3638, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3686);
    float _3696 = fma(_3638, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3680);
    float _3698 = _3680;
    if (!_3284)
    {
        float _3700 = -_3646;
        float _3702 = _3108 + _3700;
        _3698 = _3702;
    }
    float _3704 = _3698;
    float _3706 = _3668;
    if (_3636)
    {
        float _3708 = rint(_3676);
        float _3710 = precise::max(_3708, 0.0);
        uint _3712 = uint(_3710);
        uint _3714 = clamp(_3712, 0u, 65535u);
        _3706 = as_type<float>(_3714);
    }
    float _3716 = _3706;
    float _3718 = _3664 * 0.636619746685028076171875;
    float _3720 = _3688 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3722 = -_3666;
    float _3724 = fma(_3718, _3722, 1.0);
    float _3726 = _3694 * _3684;
    float _3728 = _3696 * _3684;
    float _3730 = fma(_3726, 0.5, 0.5);
    float _3732 = fma(_3728, -0.5, 0.5);
    float _3734 = _3716;
    if (_3636)
    {
        float3 _9955 = float3(_3578, _3596, float(as_type<int>(_3716)));
        float3 _9959 = select(_9955, float3(0.0), isnan(_9955));
        float _3736 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _9959.xy, uint(rint(_9959.z)), _3690, level(0.0));
        _3734 = _3736;
    }
    float _3738 = _3734;
    float3 _9969 = float3(_3730, _3732, _3720);
    float _3740 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9969, float3(0.0), isnan(_9969)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9969, float3(0.0), isnan(_9969)), level(0.0)).x;
    float3 _9978 = float3(_3730, _3732, _3720);
    float4 _3743 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9978, float3(0.0), isnan(_9978)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9978, float3(0.0), isnan(_9978)), level(0.0)).xyzw;
    float _3745 = _3743.x;
    float _3747 = _3743.y;
    float _3749 = _3743.z;
    float _3751 = _3743.w;
    float2 _9994 = float2(_3724, _3692);
    float3 _3755 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9994, float2(0.0), isnan(_9994)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9994, float2(0.0), isnan(_9994)), level(0.0)).xyz;
    float _3757 = _3755.x;
    float _3759 = _3755.y;
    float _3761 = _3755.z;
    float _3763 = _3688;
    if (!_3284)
    {
        float _3765 = rint(_3632);
        float _3767 = precise::max(_3765, 0.0);
        uint _3769 = uint(_3767);
        uint _3771 = clamp(_3769, 0u, 65535u);
        _3763 = as_type<float>(_3771);
    }
    float _3773 = _3763;
    float _3775 = _3773;
    if (!_3284)
    {
        float3 _10031 = float3(_3704, _3514, float(as_type<int>(_3773)));
        float3 _10033 = select(_10031, float3(0.0), isnan(_10031));
        float _3777 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _10033.xy, uint(rint(_10033.z)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _10033.xy, uint(rint(_10033.z)), level(0.0)).x;
        _3775 = _3777;
    }
    float _3779 = _3775;
    float _3781 = abs(_3114);
    float _3783 = log2(_3781);
    float _3785 = _3600 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3787 = fma(_3618, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3785);
    float _3789 = fma(_3406, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3787);
    bool _3791 = _3114 <= 8000.0;
    bool _3793 = isnan(_3114);
    bool _3795 = _3791 || _3793;
    bool _3797 = isnan(8000.0);
    bool _3799 = _3795 || _3797;
    float _3801 = float(_3799);
    float _3803 = _3783 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3805 = exp2(_3803);
    float _3807 = _3556 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3809 = exp2(_3807);
    float _3811 = fma(_3805, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3813 = precise::clamp(_3811, 0.0, 1.0);
    float _3815 = fma(_3813, -2.0, 3.0);
    float _3817 = _3813 * _3813;
    float _3819 = fma(_3638, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3789);
    float _3821 = _3817 * _3815;
    float _3823 = _3819 + _3656;
    float _3825 = _3823 * 0.5;
    float _3827 = -_3821;
    float _3829 = _3827 + 1.0;
    out.gl_Position.x = _3694;
    out.gl_Position.y = _3696;
    out.gl_Position.z = _3819;
    out.gl_Position.w = _3656;
    float _3831 = fma(_3829, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3821);
    out.m_86.z = _3825;
    out.m_86.w = _3656;
    float _3833 = -_3809;
    float _3835 = _3833 + 1.0;
    float _3837 = _3801 * _3831;
    float _3839 = _3831;
    float _3841 = _3819;
    float _3843 = _3694;
    if (!_3636)
    {
        _3839 = 1.0;
    }
    float _3845 = _3839;
    float _3847 = _3835 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3849 = _3837 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3851 = -_3682;
    float _3853 = _3851 + 1.0;
    float _3855 = _3853 * _3849;
    float _3857 = precise::clamp(_3855, 0.0, 1.0);
    float _3859 = _3849;
    float _3861 = _3845;
    if (_3284)
    {
        _3859 = 1.0;
    }
    float _3863 = _3859;
    float _3865 = _3863;
    if (_3636)
    {
        bool _3867 = _3738 >= _3690;
        bool _3869 = isnan(_3738);
        bool _3871 = _3867 || _3869;
        bool _3873 = isnan(_3690);
        bool _3875 = _3871 || _3873;
        float _3877 = float(_3875);
        _3861 = _3877;
    }
    float _3879 = _3861;
    if (!_3284)
    {
        int _3881 = _3384 << 4;
        int _3883 = _3881 + 2048;
        uint _3885 = uint(int(uint(_3883) >> uint(2)));
        uint _3887 = uint(int(uint(int(_3885)) >> uint(2)));
        int _3889 = int(_3885) & 3;
        float _3891 = (*spvDescriptorSet0.vp_c15)._m0[int(_3887)][_3889];
        int _3893 = int(_3885) + 1;
        uint _3895 = uint(int(uint(_3893) >> uint(2)));
        int _3897 = _3893 & 3;
        float _3899 = (*spvDescriptorSet0.vp_c15)._m0[int(_3895)][_3897];
        int _3901 = _3883 + 8;
        uint _3903 = uint(int(uint(_3901) >> uint(2)));
        uint _3905 = uint(int(uint(int(_3903)) >> uint(2)));
        int _3907 = int(_3903) & 3;
        float _3909 = (*spvDescriptorSet0.vp_c15)._m0[int(_3905)][_3907];
        int _3911 = int(_3903) + 1;
        uint _3913 = uint(int(uint(_3911) >> uint(2)));
        int _3915 = _3911 & 3;
        float _3917 = (*spvDescriptorSet0.vp_c15)._m0[int(_3913)][_3915];
        float _3919 = _3088 * _3899;
        float _3921 = fma(_2446, _3891, _3919);
        float _3923 = fma(_2468, _3909, _3921);
        float _3925 = _3923 + _3917;
        float _3927 = precise::clamp(_3925, 0.0, 1.0);
        float _3929 = -_3927;
        float _3931 = _3929 + _3779;
        float _3933 = fma(_3931, 500.0, 1.5);
        float _3935 = exp2(_3933);
        float _3937 = 0.0 + _3935;
        float _3939 = precise::clamp(_3937, 0.0, 1.0);
        _3865 = _3939;
        _3841 = _3909;
        _3843 = _3891;
    }
    float _3941 = _3865;
    float _3943 = _3841;
    float _3945 = _3843;
    float _3947 = _3879 * _3941;
    float _3949 = _3847 * _3740;
    float _3951 = -_3857;
    float _3953 = fma(_3951, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3955 = -_3847;
    float _3957 = _3955 + 1.0;
    bool _3959 = _3064 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3961 = isnan(_3064);
    bool _3963 = _3959 || _3961;
    bool _3965 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3967 = _3963 || _3965;
    float _3969 = _3751 * _3949;
    float _3971 = -_3947;
    float _3973 = fma(_3971, _3953, 1.0);
    float _3975 = precise::clamp(_3973, 0.0, 1.0);
    float _3977 = _3761 * _3949;
    float _3979 = _3751 * _3957;
    float _3981 = fma(_3757, _3969, _3745);
    float _3983 = fma(_3759, _3969, _3747);
    float _3985 = _3975 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3987 = fma(_3751, _3977, _3749);
    out.m_88.x = _3985;
    float _3989 = _3943;
    float _3991 = _3945;
    float _3993 = _3969;
    float _3995 = _3957;
    float _3997 = _3975;
    if (!_3967)
    {
        _3989 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3999 = _3989;
    float _4001 = _3999;
    float _4003 = _3999;
    if (!_3967)
    {
        _2532 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4005 = _2532;
    out.m_90.x = _3981;
    out.m_90.y = _3983;
    out.m_90.z = _3987;
    out.m_90.w = _3979;
    float _4007 = _4005;
    float _4009 = _4005;
    if (!_3967)
    {
        _3991 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4011 = _3991;
    float _4013 = _4011;
    float _4015 = _4011;
    if (!_3967)
    {
        _3993 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4017 = _3993;
    float _4019 = _4017;
    float _4021 = _4017;
    if (!_3967)
    {
        _3995 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4023 = _3995;
    float _4025 = _4023;
    float _4027 = _4023;
    if (!_3967)
    {
        _3997 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4029 = _3997;
    bool _4031 = !_3967;
    float _4033 = _4029;
    float _4035 = _4029;
    if (!_4031)
    {
        bool _4037 = _3064 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4039 = isnan(_3064);
        bool _4041 = _4037 || _4039;
        bool _4043 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4045 = _4041 || _4043;
        if (!_4045)
        {
            float _4047 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4049 = _3064 + _4047;
            float _4051 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4053 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4051;
            float _4055 = 1.0 / _4053;
            float _4057 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4059 = _4057 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4061 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4063 = _4061 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4065 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4067 = _4065 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4069 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4071 = _4069 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4073 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4075 = _4073 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4077 = _4049 * _4055;
            float _4079 = precise::clamp(_4077, 0.0, 1.0);
            float _4081 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4083 = _4081 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4085 = fma(_4079, _4059, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4087 = fma(_4079, _4083, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4089 = fma(_4079, _4063, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4091 = fma(_4079, _4067, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4093 = fma(_4079, _4071, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4095 = fma(_4079, _4075, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4009 = _4087;
            _4027 = _4093;
            _4003 = _4085;
            _4021 = _4091;
            _4015 = _4089;
            _4035 = _4095;
            _4097 = true;
        }
        else
        {
            bool _4099 = _3064 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4101 = isnan(_3064);
            bool _4103 = _4099 || _4101;
            bool _4105 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4107 = _4103 || _4105;
            if (!_4107)
            {
                _4001 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4109 = _4001;
            _4003 = _4109;
            if (!_4107)
            {
                _4007 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4111 = _4007;
            _4009 = _4111;
            if (!_4107)
            {
                _4013 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4113 = _4013;
            _4015 = _4113;
            if (!_4107)
            {
                _4019 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4115 = _4019;
            _4021 = _4115;
            if (!_4107)
            {
                _4025 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4117 = _4025;
            _4027 = _4117;
            if (!_4107)
            {
                _4033 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4119 = _4033;
            bool _4121 = !_4107;
            _4035 = _4119;
            if (!_4121)
            {
                bool _4123 = _3064 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4125 = isnan(_3064);
                bool _4127 = _4123 || _4125;
                bool _4129 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4131 = _4127 || _4129;
                if (!_4131)
                {
                    float _4133 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4135 = _3064 + _4133;
                    float _4137 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4139 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4137;
                    float _4141 = 1.0 / _4139;
                    float _4143 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4145 = _4143 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4147 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4149 = _4147 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4151 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4153 = _4151 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4155 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4157 = _4155 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4159 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4161 = _4159 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4163 = _4135 * _4141;
                    float _4165 = precise::clamp(_4163, 0.0, 1.0);
                    float _4167 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4169 = _4167 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4171 = fma(_4165, _4145, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4173 = fma(_4165, _4169, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4175 = fma(_4165, _4149, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4177 = fma(_4165, _4153, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4179 = fma(_4165, _4157, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4181 = fma(_4165, _4161, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4009 = _4173;
                    _4027 = _4179;
                    _4003 = _4171;
                    _4021 = _4177;
                    _4015 = _4175;
                    _4035 = _4181;
                    _4097 = true;
                }
                else
                {
                    _4009 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4027 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4003 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4021 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4015 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4035 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4097 = false;
    float _4183 = _4009;
    float _4185 = _4027;
    float _4187 = _4003;
    float _4189 = _4021;
    float _4191 = _4015;
    float _4193 = _4035;
    float _4195 = fma(_2910, -0.5, 0.5);
    float _4197 = precise::clamp(_4195, 0.0, 1.0);
    float _4199 = -_4183;
    float _4201 = _4199 + _4185;
    float _4203 = -_4187;
    float _4205 = _4203 + _4189;
    float _4207 = -_4191;
    float _4209 = _4207 + _4193;
    bool _4211 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4213 = fma(_4197, _4201, _4183);
    float _4215 = fma(_4197, _4205, _4187);
    float _4217 = fma(_4197, _4209, _4191);
    float _4219 = _4213 * 0.586610972881317138671875;
    out.m_61.x = 1.0;
    float _4221 = fma(_4215, 0.298911988735198974609375, _4219);
    float _4223 = fma(_4217, 0.114477999508380889892578125, _4221);
    out.m_92.x = 0.0;
    float _4225 = -_4223;
    float _4227 = _4215 + _4225;
    float _4229 = -_4223;
    float _4231 = _4213 + _4229;
    float _4233 = -_4223;
    float _4235 = _4217 + _4233;
    float _4237 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4239 = fma(_4227, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4223);
    float _4241 = fma(_4231, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4223);
    float _4243 = fma(_4235, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4223);
    out.m_88.w = _4237;
    out.m_94.x = _4239;
    out.m_94.y = _4241;
    out.m_94.z = _4243;
    if (!_4211)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _4245 = -_3014;
    float _4247 = _4245 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _4249 = -_3018;
    float _4251 = _4249 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _4253 = -_3022;
    float _4255 = _4253 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _4257 = _4247 * _4247;
    float _4259 = fma(_4251, _4251, _4257);
    float _4261 = fma(_4255, _4255, _4259);
    float _4263 = sqrt(_4261);
    float _4265 = rsqrt(_4261);
    float _4267 = -_4263;
    float _4269 = _4267 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4271 = _4269 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _4273 = precise::clamp(_4271, 0.0, 1.0);
    float _4275 = _4251 * _4265;
    float _4277 = _4247 * _4265;
    float _4279 = abs(_4273);
    float _4281 = log2(_4279);
    float _4283 = _4255 * _4265;
    float _4285 = _4275 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4287 = _2910 * _4277;
    float _4289 = -_4277;
    float _4291 = -_4285;
    float _4293 = fma(_4289, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4291);
    float _4295 = fma(_2908, _4275, _4287);
    float _4297 = -_4283;
    float _4299 = fma(_4297, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4293);
    float _4301 = fma(_2912, _4283, _4295);
    float _4303 = precise::clamp(_4301, 0.0, 1.0);
    float _4305 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _4307 = _4299 + _4305;
    float _4309 = _4281 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _4311 = _4307 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _4313 = precise::clamp(_4311, 0.0, 1.0);
    float _4315 = exp2(_4309);
    float _4317 = _4315 * _4313;
    float _4319 = _4303 * _4317;
    float _4321 = _4319 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4323 = _4319 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4325 = _4319 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_92.x = _4321;
    out.m_92.y = _4323;
    out.m_92.z = _4325;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4097 = false;
    bool _2958 = false;
    bool _329 = false;
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
        float _4382 = as_type<float>(_129);
        out.gl_Position.z = _4382;
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
    float _149 = _147;
    if (_143)
    {
        float _151 = float(_113);
        _123 = _151;
    }
    float _153 = _123;
    bool _155 = _147 >= _153;
    bool _157 = !_143;
    bool _159 = _155 || _157;
    float _161 = _153;
    if (_159)
    {
        _161 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _163 = _161;
    if (_159)
    {
        out.m_61.x = 0.0;
    }
    if (_159)
    {
        float _165 = _163 * 5.0;
        _131 = as_type<int>(_165);
    }
    int _167 = _131;
    if (_159)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4452 = as_type<float>(_167);
        out.gl_Position.z = _4452;
    }
    if (_159)
    {
        return out;
    }
    float _169 = as_type<float>(int(gl_VertexIndex));
    float _171 = in.m_68.w;
    bool _173 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _175 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _177 = _173 || _175;
    bool _179 = isnan(1.0);
    bool _181 = _177 || _179;
    float _183 = in.m_63.x;
    float _185 = in.m_63.y;
    float _187 = in.m_63.z;
    float _189 = in.m_58.x;
    float _191 = in.m_58.y;
    float _193 = in.m_58.z;
    int _195 = as_type<int>(_169) & 1;
    bool _197 = _195 != 0;
    int _199 = as_type<int>(_169) & 2;
    bool _201 = _199 != 0;
    float _203 = _147 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _205 = 0.0;
    float _207 = _203;
    if (!_181)
    {
        float _209 = _203 * _203;
        float _211 = _209 * 0.5;
        _205 = _211;
    }
    float _213 = _205;
    bool _215 = !_197;
    float _217 = _215 ? (-0.5) : 0.5;
    bool _219 = !_201;
    float _221 = _219 ? (-0.5) : 0.5;
    float _223 = _213;
    if (!_181)
    {
        float _225 = _213 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _223 = _225;
    }
    float _227 = _223;
    bool _229 = !_181;
    float _231 = _227;
    if (!_229)
    {
        float _233 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _235 = log2(_233);
        float _237 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _239 = _237 + 1.0;
        float _241 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _243 = _203 * _235;
        float _245 = 1.0 / _239;
        float _247 = _241 * 0.693147182464599609375;
        float _249 = exp2(_243);
        float _251 = 1.0 / _247;
        float _253 = _249 + (-1.0);
        float _255 = -_253;
        float _257 = fma(_255, _251, _203);
        float _259 = _257 * _245;
        float _261 = _259 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _231 = _261;
    }
    float _263 = _231;
    bool _265 = !_181;
    if (!_265)
    {
        float _267 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _269 = log2(_267);
        float _271 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _273 = _271 + 1.0;
        float _275 = 1.0 / _273;
        float _277 = _203 * _269;
        float _279 = exp2(_277);
        float _281 = -_279;
        float _283 = _281 + 1.0;
        float _285 = _283 * _275;
        _207 = _285;
    }
    float _287 = _207;
    bool _289 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _291 = _263 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _293 = _263 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _295 = _263 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _297 = fma(_287, _183, _291);
    float _299 = fma(_287, _185, _293);
    float _301 = fma(_287, _187, _295);
    float _303 = fma(_297, _171, _189);
    float _305 = fma(_299, _171, _191);
    float _307 = fma(_301, _171, _193);
    bool _309 = !_289;
    float _327;
    if (!_309)
    {
        float _311 = in.m_70.x;
        float _313 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _315 = _311 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _317 = fma(_315, (*spvDescriptorSet0.vp_c9)._m0[12].x, _147);
        float _319 = _317 * _313;
        float _321 = floor(_319);
        float _323 = -_321;
        float _325 = _319 + _323;
        _327 = _325;
        _329 = true;
    }
    else
    {
        float _331 = float(_113);
        float _333 = 1.0 / _331;
        float _335 = _147 * _333;
        _327 = _335;
    }
    _329 = false;
    float _337 = _327;
    float _339 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _341 = int(_339);
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _345 = _337 + _343;
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _349 = _337 + _347;
    int _351 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _353 = _351 != 0;
    float _355 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _357 = int(_355);
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _361 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _359;
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _365 = _363 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _367 = float(_341);
    float _369 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _371 = int(_369);
    float _373 = 0.0;
    if (_353)
    {
        float _375 = in.m_70.x;
        _373 = _375;
    }
    float _377 = _373;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _381 = _377;
    if (!_353)
    {
        float _383 = in.m_70.y;
        _381 = _383;
    }
    float _385 = _381;
    float _387 = float(_357);
    float _389 = 1.0 / _367;
    float _391 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _393 = int(_391);
    float _395 = float(uint(_371));
    int _397 = ~_371;
    int _399 = _397 + 1;
    bool _401 = _371 == 0;
    float _403 = 1.0 / _387;
    float _405 = _389 * _147;
    float _407 = 1.0 / _395;
    float _409 = float(uint(_393));
    int _411 = ~_393;
    int _413 = _411 + 1;
    float _415 = trunc(_405);
    int _417 = int(_415);
    float _419 = _403 * _147;
    float _421 = 1.0 / _409;
    int _423 = as_type<int>(_407) + (-2);
    float _425 = trunc(_419);
    int _427 = int(_425);
    float _429 = float(uint(_417));
    float _431 = as_type<float>(_423) * _429;
    int _433 = as_type<int>(_421) + (-2);
    float _435 = 1.0 / _361;
    float _437 = float(uint(_427));
    float _439 = trunc(_431);
    float _441 = precise::max(_439, 0.0);
    uint _444 = uint(_441);
    float _446 = as_type<float>(_433) * _437;
    float _448 = in.m_70.x;
    float _450 = in.m_70.y;
    float _452 = in.m_70.z;
    float _454 = in.m_70.w;
    float _456 = trunc(_446);
    float _458 = precise::max(_456, 0.0);
    uint _460 = uint(_458);
    int _462 = _399 * int(_444);
    int _464 = _462 + _417;
    float _466 = 1.0 / _365;
    float _468 = float(uint(_464));
    int _470 = _413 * int(_460);
    int _472 = _470 + _427;
    float _474 = as_type<float>(_423) * _468;
    float _476 = _468;
    float _478 = as_type<float>(_472);
    if (_353)
    {
        _476 = 1.0;
    }
    float _480 = _476;
    float _482 = float(uint(_472));
    float _484 = trunc(_474);
    float _486 = precise::max(_484, 0.0);
    uint _488 = uint(_486);
    float _490 = _480;
    if (!_353)
    {
        _490 = 7.345489978790283203125;
    }
    float _492 = _490;
    float _494 = _450 * 2.0;
    if (_353)
    {
        _478 = 1.0;
    }
    float _496 = _478;
    float _498 = as_type<float>(_433) * _482;
    float _500 = _496;
    if (!_353)
    {
        _500 = 1.2345600128173828125;
    }
    float _502 = _500;
    float _504 = _492 * _448;
    float _506 = _349 * _466;
    float _508 = trunc(_498);
    float _510 = precise::max(_508, 0.0);
    uint _512 = uint(_510);
    float _514 = _385 * _502;
    int _516 = ~_371;
    int _518 = _516 + 1;
    float _520 = _452 + _450;
    float _522 = float(_371);
    float _524 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _526 = floor(_504);
    int _528 = int(_444) + int(_488);
    float _530 = fma(_450, (*spvDescriptorSet0.vp_c9)._m0[78].w, _524);
    float _532 = float(_113);
    int _534 = ~_393;
    int _536 = _534 + 1;
    int _538 = _518 * _528;
    int _540 = _538 + _417;
    float _542 = float(_417);
    float _544 = floor(_514);
    int _546 = int(_460) + int(_512);
    float _548 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].w, _530);
    bool _550 = uint(_540) >= uint(_371);
    int _552 = _536 * _546;
    int _554 = _552 + _427;
    bool _556 = _542 >= _522;
    bool _558 = isnan(_542);
    bool _560 = _556 || _558;
    bool _562 = isnan(_522);
    bool _564 = _560 || _562;
    float _566 = float(_564);
    float _568 = -_526;
    float _570 = _504 + _568;
    bool _572 = !_550;
    int _574 = _572 ? 0 : (-1);
    float _576 = 1.0 / _532;
    bool _578 = uint(_554) >= uint(_393);
    float _580 = _570 * _522;
    float _582 = -_548;
    float _584 = _582 + 1.0;
    int _586 = ~_528;
    int _588 = _586 + _574;
    int _590 = _588 + 1;
    float _592 = -_544;
    float _594 = _514 + _592;
    int _596 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _598 = _596 != 0;
    float _600 = trunc(_566);
    int _602 = int(_600);
    float _604 = float(_393);
    float _606 = float(_427);
    bool _608 = !_598;
    int _610 = _608 ? 0 : 1;
    bool _612 = _606 >= _604;
    bool _614 = isnan(_606);
    bool _616 = _612 || _614;
    bool _618 = isnan(_604);
    bool _620 = _616 || _618;
    float _622 = float(_620);
    float _624 = trunc(_580);
    int _626 = int(_624);
    int _628 = abs(_610);
    int _630 = _371 * _590;
    int _632 = _630 + _417;
    float _634 = _576 * _147;
    int _636 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _638 = _636 != 0;
    int _640 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _642 = _640 != 0;
    int _644 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _646 = _644 != 0;
    float _648 = _522 * _634;
    float _650 = trunc(_622);
    int _652 = int(_650);
    bool _654 = !_578;
    int _656 = _654 ? 0 : (-1);
    float _658 = _604 * _634;
    int _660 = ~_602;
    int _662 = _660 + 1;
    int _664 = _662 + 1;
    float _666 = _594 * _604;
    bool _668 = !_401;
    int _670 = _668 ? _632 : (-1);
    int _672 = ~_546;
    int _674 = _672 + _656;
    int _676 = _674 + 1;
    int _678 = _626 * _628;
    int _680 = _678 + _417;
    bool _682 = _393 == 0;
    int _684 = _670 * _664;
    bool _686 = !_642;
    int _688 = _686 ? 0 : 1;
    int _690 = _393 * _676;
    int _692 = _690 + _427;
    int _694 = _371 + (-1);
    float _696 = trunc(_648);
    int _698 = int(_696);
    int _700 = abs(_688);
    int _702 = ~_652;
    int _704 = _702 + 1;
    int _706 = _704 + 1;
    int _708 = _602 * _694;
    int _710 = _708 + _684;
    bool _712 = !_682;
    int _714 = _712 ? _692 : (-1);
    int _716 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _718 = _716 != 0;
    int _720 = _710 * _700;
    float _722 = trunc(_666);
    int _724 = int(_722);
    int _726 = _714 * _706;
    bool _728 = !_638;
    int _730 = _728 ? 0 : 1;
    bool _732 = !_718;
    int _734 = _732 ? 0 : 1;
    int _736 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _738 = _736 != 0;
    int _740 = _393 + (-1);
    float _742 = trunc(_658);
    int _744 = int(_742);
    int _746 = abs(_730);
    bool _748 = !_646;
    int _750 = _748 ? 0 : 1;
    int _752 = _652 * _740;
    int _754 = _752 + _726;
    int _756 = abs(_734);
    int _758 = _698 * _746;
    int _760 = _758 + _720;
    bool _762 = !_738;
    int _764 = _762 ? 0 : 1;
    float _766 = floor(_494);
    int _768 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _770 = _768 != 0;
    int _772 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _774 = _772 != 0;
    int _776 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _778 = _776 != 0;
    int _780 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _782 = _780 != 0;
    int _784 = _724 * _756;
    int _786 = _784 + _427;
    int _788 = abs(_750);
    int _790 = abs(_764);
    bool _792 = !_774;
    int _794 = _792 ? 0 : 1;
    int _796 = abs(_794);
    bool _798 = !_770;
    int _800 = _798 ? 0 : 1;
    int _802 = _680 * _788;
    int _804 = _802 + _760;
    bool _806 = !_778;
    int _808 = _806 ? 0 : 1;
    int _810 = abs(_800);
    int _812 = _626 * _790;
    int _814 = _812 + _804;
    bool _816 = !_782;
    int _818 = _816 ? 0 : 1;
    int _820 = abs(_808);
    int _822 = _754 * _796;
    int _824 = abs(_818);
    float _826 = float(uint(_814));
    int _828 = _744 * _810;
    int _830 = _828 + _822;
    float _832 = as_type<float>(_423) * _826;
    int _834 = ~_371;
    int _836 = _834 + 1;
    int _838 = _786 * _820;
    int _840 = _838 + _830;
    float _842 = float(uint(_786));
    float _844 = trunc(_832);
    float _846 = precise::max(_844, 0.0);
    uint _848 = uint(_846);
    bool _850 = _371 == 0;
    int _852 = _724 * _824;
    int _854 = _852 + _840;
    int _856 = ~_371;
    int _858 = _856 + 1;
    float _860 = as_type<float>(_433) * _842;
    bool _862 = _393 == 0;
    float _864 = float(uint(_854));
    float _866 = float(uint(_680));
    float _868 = trunc(_860);
    float _870 = precise::max(_868, 0.0);
    uint _872 = uint(_870);
    float _874 = as_type<float>(_433) * _864;
    int _876 = _858 * int(_848);
    int _878 = _876 + _814;
    int _880 = ~_393;
    int _882 = _880 + 1;
    float _884 = trunc(_874);
    float _886 = precise::max(_884, 0.0);
    uint _888 = uint(_886);
    float _890 = float(uint(_878));
    float _892 = as_type<float>(_423) * _890;
    float _894 = trunc(_892);
    float _896 = precise::max(_894, 0.0);
    uint _898 = uint(_896);
    int _900 = _882 * int(_888);
    int _902 = _900 + _854;
    float _904 = float(uint(_902));
    float _906 = as_type<float>(_433) * _904;
    float _908 = as_type<float>(_423) * _866;
    float _910 = trunc(_906);
    float _912 = precise::max(_910, 0.0);
    uint _914 = uint(_912);
    int _916 = int(_848) + int(_898);
    int _918 = ~_393;
    int _920 = _918 + 1;
    int _922 = _836 * _916;
    int _924 = _922 + _814;
    float _926 = trunc(_908);
    float _928 = precise::max(_926, 0.0);
    uint _930 = uint(_928);
    bool _932 = uint(_924) >= uint(_371);
    int _934 = ~_371;
    int _936 = _934 + 1;
    int _938 = int(_888) + int(_914);
    bool _940 = !_932;
    int _942 = _940 ? 0 : (-1);
    int _944 = ~_916;
    int _946 = _944 + _942;
    int _948 = _946 + 1;
    int _950 = _936 * int(_930);
    int _952 = _950 + _680;
    int _954 = ~_393;
    int _956 = _954 + 1;
    int _958 = _920 * _938;
    int _960 = _958 + _854;
    int _962 = _371 * _948;
    int _964 = _962 + _814;
    float _966 = float(uint(_952));
    int _968 = _956 * int(_872);
    int _970 = _968 + _786;
    bool _972 = uint(_960) >= uint(_393);
    bool _974 = !_850;
    float _976 = _974 ? as_type<float>(_964) : as_type<float>(0xffffffffu /* nan */);
    float _978 = as_type<float>(_423) * _966;
    bool _980 = !_972;
    int _982 = _980 ? 0 : (-1);
    int _984 = as_type<int>(_976) & 3;
    bool _986 = _984 != 0;
    int _988 = as_type<int>(_976) & 3;
    bool _990 = _988 != 0;
    float _992 = trunc(_978);
    float _994 = precise::max(_992, 0.0);
    uint _996 = uint(_994);
    bool _998 = _984 != 3;
    int _1000 = ~_938;
    int _1002 = _1000 + _982;
    int _1004 = _1002 + 1;
    int _1006 = _990 ? 0 : 1;
    bool _1008 = uint(_984) >= 2u;
    int _1010 = _393 * _1004;
    int _1012 = _1010 + _854;
    bool _1014 = uint(_984) > 1u;
    float _1016 = float(uint(_970));
    int _1018 = _1008 ? 0 : 1;
    bool _1020 = !_862;
    int _1022 = _1020 ? _1012 : (-1);
    float _1024 = as_type<float>(_433) * _1016;
    int _1026 = ~_1018;
    int _1028 = _1026 + 1;
    int _1030 = _1028 + 1;
    int _1032 = _1030;
    float _1034 = _976;
    float _1036 = as_type<float>(_786);
    if (_998)
    {
        int _1038 = ~_1018;
        int _1040 = _1038 + 1;
        _1032 = _1040;
    }
    int _1042 = _1032;
    float _1044 = trunc(_1024);
    float _1046 = precise::max(_1044, 0.0);
    uint _1048 = uint(_1046);
    int _1050 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1052 = _1050 != 0;
    int _1054 = _1022 & 3;
    bool _1056 = _1054 != 0;
    bool _1058 = !_1052;
    int _1060 = _1058 ? 0 : 1;
    int _1062 = ~_1006;
    int _1064 = _1062 + 1;
    int _1066 = _1064 + 1;
    bool _1068 = uint(_1054) > 1u;
    float _1070 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1072 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _1070;
    int _1074 = _1066;
    if (!_1014)
    {
        int _1076 = ~_1006;
        int _1078 = _1076 + 1;
        _1074 = _1078;
    }
    int _1080 = _1074;
    float _1082 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _1084 = _1082 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    int _1086 = int(_930) + int(_996);
    float _1088 = 1.0 / _1072;
    int _1090 = ~_371;
    int _1092 = _1090 + 1;
    int _1094 = _1022 & 3;
    bool _1096 = _1094 != 0;
    int _1098 = ~_393;
    int _1100 = _1098 + 1;
    int _1102 = _1092 * _1086;
    int _1104 = _1102 + _680;
    int _1106 = _1096 ? 0 : 1;
    float _1108 = 1.0 / _1084;
    int _1110 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1112 = _1110 != 0;
    float _1114 = _379 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1116 = ~_1106;
    int _1118 = _1116 + 1;
    int _1120 = _1118 + 1;
    float _1122 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1124 = _337 + _1122;
    bool _1126 = !_1112;
    int _1128 = _1126 ? 0 : 1;
    bool _1130 = uint(_1104) >= uint(_371);
    float _1132 = _1124 * _435;
    int _1134 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1136 = _1134 != 0;
    float _1138 = _345 * _1088;
    int _1140 = _1120;
    float _1142 = _1084;
    if (!_1068)
    {
        int _1144 = ~_1106;
        int _1146 = _1144 + 1;
        _1140 = _1146;
    }
    int _1148 = _1140;
    float _1150 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _1152 = _337 + _1150;
    bool _1154 = _1054 != 3;
    int _1156 = int(_872) + int(_1048);
    bool _1158 = !_1130;
    int _1160 = _1158 ? 0 : (-1);
    bool _1162 = uint(_1054) >= 2u;
    int _1164 = _1100 * _1156;
    int _1166 = _1164 + _786;
    int _1168 = ~_1086;
    int _1170 = _1168 + _1160;
    int _1172 = _1170 + 1;
    int _1174 = _1162 ? 0 : 1;
    bool _1176 = uint(_1166) >= uint(_393);
    int _1178 = _371 * _1172;
    int _1180 = _1178 + _680;
    int _1182 = 0;
    float _1184 = _1152;
    if (_1136)
    {
        _1182 = 0;
    }
    int _1186 = _1182;
    float _1188 = _305 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _1190 = ~_1174;
    int _1192 = _1190 + 1;
    int _1194 = _1192 + 1;
    float _1196 = _305 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1198 = fma(_303, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1188);
    int _1200 = _1186;
    int _1202 = _1194;
    if (!_1136)
    {
        _1200 = 1;
    }
    int _1204 = _1200;
    if (_1154)
    {
        int _1206 = ~_1174;
        int _1208 = _1206 + 1;
        _1202 = _1208;
    }
    int _1210 = _1202;
    float _1212 = fma(_307, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1198);
    bool _1214 = _448 > 0.5;
    bool _1216 = _454 > 0.5;
    float _1218 = _1212 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1220 = !_1176;
    int _1222 = _1220 ? 0 : (-1);
    int _1224 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1226 = _1224 != 0;
    float _1228 = -_217;
    int _1230 = _1214 ? as_type<int>(_1228) : as_type<int>(_217);
    bool _1232 = !_850;
    int _1234 = _1232 ? _1180 : (-1);
    bool _1236 = _450 > 0.5;
    bool _1238 = _452 > 0.5;
    bool _1240 = !_1226;
    float _1242 = _1240 ? _217 : as_type<float>(_1230);
    float _1244 = -_221;
    int _1246 = _1236 ? as_type<int>(_1244) : as_type<int>(_221);
    float _1248 = -_217;
    int _1250 = _1238 ? as_type<int>(_1248) : as_type<int>(_217);
    int _1252 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1254 = _1252 != 0;
    int _1256 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1258 = _1256 != 0;
    int _1260 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1262 = _1260 != 0;
    float _1264 = _305 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1266 = _448 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1268 = fma(_303, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1264);
    float _1270 = fma(_303, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1196);
    float _1272 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1274 = _450 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1276 = fma(_307, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1268);
    float _1278 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1280 = -_1272;
    float _1282 = fma(_1266, 2.0, _1280);
    float _1284 = fma(_307, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1270);
    float _1286 = fma(_1274, -2.0, _1278);
    float _1288 = _1276 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1290 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1292 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1294 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1296 = _1290 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1298 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1300 = _1292 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1302 = _1294 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1304 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _1306 = !_1262;
    float _1308 = _1306 ? _217 : as_type<float>(_1250);
    float _1310 = _1284 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    out.m_72.x = _1296;
    out.m_72.y = _1300;
    out.m_72.z = _1302;
    out.m_72.w = _1298;
    bool _1312 = _1204 != 1;
    float _1314 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1316 = _1304 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1318 = ~_1156;
    int _1320 = _1318 + _1222;
    int _1322 = _1320 + 1;
    float _1324 = _1314 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1326 = _1152 * _1108;
    float _1328 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1330 = _452 * 2.0;
    int _1332 = _393 * _1322;
    int _1334 = _1332 + _786;
    float _1336 = _448 * 2.0;
    bool _1338 = !_986;
    int _1340 = _1338 ? 0 : 1;
    out.m_74.x = _1316;
    out.m_74.y = _1324;
    out.m_74.z = _1114;
    out.m_74.w = _1328;
    int _1342 = _1022 >> 31;
    float _1344 = floor(_1330);
    int _1346 = as_type<int>(_976) >> 31;
    float _1348 = -_147;
    float _1350 = fma(_1348, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1282);
    int _1352 = _1342 & 3;
    float _1354 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1286);
    int _1356 = _1346 & 3;
    float _1358 = floor(_1336);
    int _1360 = _1022 + _1352;
    float _1362 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1364 = as_type<int>(_976) + _1356;
    float _1366 = _448 + _450;
    if (!_1312)
    {
        _1034 = _450;
    }
    float _1368 = _1034;
    float _1370 = _452 + _448;
    float _1372 = _1368;
    if (!_1312)
    {
        _1036 = _450;
    }
    float _1374 = _1036;
    float _1376 = _448 + (-0.5);
    float _1378 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1362);
    float _1380 = _1374;
    if (_1312)
    {
        _1372 = _448;
    }
    float _1382 = _1372;
    float _1384 = _450 + (-0.5);
    if (_1312)
    {
        _1380 = _448;
    }
    float _1386 = _1380;
    float _1388 = _452 + (-0.5);
    int _1390 = _1364 >> 2;
    float _1392 = _1366 + (-1.0);
    int _1394 = _1360 >> 2;
    float _1396 = _1370 + (-1.0);
    int _1398 = _1390 << 4;
    int _1400 = _1398 + 368;
    float _1402 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1378);
    int _1404 = _1394 << 4;
    int _1406 = _1404 + 512;
    uint _1408 = uint(int(uint(_1400) >> uint(2)));
    uint _1410 = uint(int(uint(int(_1408)) >> uint(2)));
    int _1412 = int(_1408) & 3;
    float _1414 = (*spvDescriptorSet0.vp_c9)._m0[int(_1410)][_1412];
    int _1416 = int(_1408) + 1;
    uint _1418 = uint(int(uint(_1416) >> uint(2)));
    int _1420 = _1416 & 3;
    float _1422 = (*spvDescriptorSet0.vp_c9)._m0[int(_1418)][_1420];
    if (!_1312)
    {
        _1142 = _452;
    }
    float _1424 = _1142;
    float _1426 = _1424;
    if (!_1312)
    {
        _1184 = _452;
    }
    float _1428 = _1184;
    float _1430 = _1428;
    if (_1312)
    {
        _1426 = _450;
    }
    float _1432 = _1426;
    if (_1312)
    {
        _1430 = _450;
    }
    float _1434 = _1430;
    uint _1436 = uint(int(uint(_1406) >> uint(2)));
    uint _1438 = uint(int(uint(int(_1436)) >> uint(2)));
    int _1440 = int(_1436) & 3;
    float _1442 = (*spvDescriptorSet0.vp_c9)._m0[int(_1438)][_1440];
    int _1444 = int(_1436) + 1;
    uint _1446 = uint(int(uint(_1444) >> uint(2)));
    int _1448 = _1444 & 3;
    float _1450 = (*spvDescriptorSet0.vp_c9)._m0[int(_1446)][_1448];
    bool _1452 = !_862;
    int _1454 = _1452 ? _1334 : (-1);
    float _1456 = _1432 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _1458 = _1358 > 0.0;
    bool _1460 = _1358 >= 0.0;
    bool _1462 = isnan(_1358);
    bool _1464 = _1460 || _1462;
    bool _1466 = isnan(0.0);
    bool _1468 = _1464 || _1466;
    int _1470 = _1400 + 8;
    uint _1472 = uint(int(uint(_1470) >> uint(2)));
    uint _1474 = uint(int(uint(int(_1472)) >> uint(2)));
    int _1476 = int(_1472) & 3;
    float _1478 = (*spvDescriptorSet0.vp_c9)._m0[int(_1474)][_1476];
    int _1480 = int(_1472) + 1;
    uint _1482 = uint(int(uint(_1480) >> uint(2)));
    int _1484 = _1480 & 3;
    float _1486 = (*spvDescriptorSet0.vp_c9)._m0[int(_1482)][_1484];
    int _1488 = _1468 ? 0 : 1;
    float _1490 = fma(_1392, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1492 = _766 >= 0.0;
    bool _1494 = isnan(_766);
    bool _1496 = _1492 || _1494;
    bool _1498 = isnan(0.0);
    bool _1500 = _1496 || _1498;
    float _1502 = fma(_1396, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _1504 = ~_1488;
    int _1506 = _1504 + 1;
    int _1508 = _1506 + 1;
    int _1510 = _1406 + 8;
    uint _1512 = uint(int(uint(_1510) >> uint(2)));
    uint _1514 = uint(int(uint(int(_1512)) >> uint(2)));
    int _1516 = int(_1512) & 3;
    float _1518 = (*spvDescriptorSet0.vp_c9)._m0[int(_1514)][_1516];
    int _1520 = int(_1512) + 1;
    uint _1522 = uint(int(uint(_1520) >> uint(2)));
    int _1524 = _1520 & 3;
    float _1526 = (*spvDescriptorSet0.vp_c9)._m0[int(_1522)][_1524];
    int _1528 = _1508;
    if (!_1458)
    {
        int _1530 = ~_1488;
        int _1532 = _1530 + 1;
        _1528 = _1532;
    }
    int _1534 = _1528;
    bool _1536 = !_1056;
    int _1538 = _1536 ? 0 : 1;
    bool _1540 = _984 != 3;
    float _1542 = _520 + (-1.0);
    bool _1544 = _1054 != 3;
    bool _1546 = _766 > 0.0;
    float _1548 = fma(_1542, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1550 = abs(_1080);
    int _1552 = _1500 ? 0 : 1;
    bool _1554 = !_1540;
    int _1556 = _1554 ? 0 : (-1);
    bool _1558 = !_1544;
    int _1560 = _1558 ? 0 : (-1);
    int _1562 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1564 = _1562 != 0;
    int _1566 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1568 = _1566 != 0;
    int _1570 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1572 = _1570 != 0;
    int _1574 = abs(_1148);
    int _1576 = abs(_1340);
    int _1578 = abs(_1538);
    int _1580 = ~_1550;
    int _1582 = _1580 + 1;
    int _1584 = _1582 + 1;
    int _1586 = ~_1574;
    int _1588 = _1586 + 1;
    int _1590 = _1588 + 1;
    int _1592 = _1584 * as_type<int>(_1422);
    int _1594 = ~_1576;
    int _1596 = _1594 + 1;
    int _1598 = _1596 + 1;
    int _1600 = _1590 * as_type<int>(_1450);
    int _1602 = abs(_1042);
    int _1604 = ~_1578;
    int _1606 = _1604 + 1;
    int _1608 = _1606 + 1;
    int _1610 = _1598 * as_type<int>(_1414);
    int _1612 = _1610 + _1592;
    int _1614 = abs(_1556);
    int _1616 = _1608 * as_type<int>(_1442);
    int _1618 = _1616 + _1600;
    int _1620 = ~_1602;
    int _1622 = _1620 + 1;
    int _1624 = _1622 + 1;
    float _1626 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1628 = int(_1626);
    int _1630 = abs(_1210);
    int _1632 = ~_1614;
    int _1634 = _1632 + 1;
    int _1636 = _1634 + 1;
    int _1638 = _1624 * as_type<int>(_1478);
    int _1640 = _1638 + _1612;
    int _1642 = ~_1630;
    int _1644 = _1642 + 1;
    int _1646 = _1644 + 1;
    int _1648 = abs(_1560);
    int _1650 = _1636 * as_type<int>(_1486);
    int _1652 = _1650 + _1640;
    int _1654 = abs(_1128);
    float _1656 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _1658 = int(_1656);
    int _1660 = ~_1648;
    int _1662 = _1660 + 1;
    int _1664 = _1662 + 1;
    int _1666 = _1646 * as_type<int>(_1518);
    int _1668 = _1666 + _1618;
    int _1670 = _1664 * as_type<int>(_1526);
    int _1672 = _1670 + _1668;
    int _1674 = abs(_1060);
    float _1676 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1678 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1676;
    float _1680 = float(uint(_1628));
    float _1682 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1684 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1682;
    int _1686 = ~_1654;
    int _1688 = _1686 + 1;
    int _1690 = _1688 + 1;
    float _1692 = fma(_1678, _1132, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    int _1694 = ~_1674;
    int _1696 = _1694 + 1;
    int _1698 = _1696 + 1;
    float _1700 = fma(_1684, _1132, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _1702 = 1.0 / _1680;
    int _1704 = _1672 * _1690;
    float _1706 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1708 = _1706 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1710 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1712 = _1710 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    int _1714 = _1652 * _1698;
    float _1716 = float(uint(_1658));
    int _1718 = _1454 * _1654;
    int _1720 = _1718 + _1704;
    bool _1722 = _337 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _1724 = isnan(_337);
    bool _1726 = _1722 || _1724;
    bool _1728 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _1730 = _1726 || _1728;
    float _1732 = float(_1730);
    float _1734 = fma(_1708, _506, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    int _1736 = abs(_1628);
    int _1738 = _1234 * _1674;
    int _1740 = _1738 + _1714;
    bool _1742 = _337 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _1744 = isnan(_337);
    bool _1746 = _1742 || _1744;
    bool _1748 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _1750 = _1746 || _1748;
    float _1752 = float(_1750);
    float _1754 = -_1732;
    float _1756 = _1754 + 1.0;
    float _1758 = 1.0 / _1716;
    int _1760 = abs(_1658);
    float _1762 = fma(_1712, _506, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _1764 = float(uint(_1736));
    float _1766 = _1752 * _1756;
    int _1768 = ~_1552;
    int _1770 = _1768 + 1;
    int _1772 = _1770 + 1;
    float _1774 = -_1752;
    float _1776 = _1774 + 1.0;
    int _1778 = _1772;
    if (!_1546)
    {
        int _1780 = ~_1552;
        int _1782 = _1780 + 1;
        _1778 = _1782;
    }
    int _1784 = _1778;
    bool _1786 = _1344 >= 0.0;
    bool _1788 = isnan(_1344);
    bool _1790 = _1786 || _1788;
    bool _1792 = isnan(0.0);
    bool _1794 = _1790 || _1792;
    float _1796 = 1.0 / _1764;
    int _1798 = as_type<int>(_1702) + (-2);
    float _1800 = float(uint(_1740));
    int _1802 = _1794 ? 0 : 1;
    bool _1804 = _337 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1806 = isnan(_337);
    bool _1808 = _1804 || _1806;
    bool _1810 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _1812 = _1808 || _1810;
    float _1814 = float(_1812);
    float _1816 = float(uint(_1760));
    bool _1818 = _1344 > 0.0;
    float _1820 = as_type<float>(_1798) * _1800;
    bool _1822 = _337 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1824 = isnan(_337);
    bool _1826 = _1822 || _1824;
    bool _1828 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1830 = _1826 || _1828;
    float _1832 = float(_1830);
    float _1834 = -_1814;
    float _1836 = _1834 + 1.0;
    bool _1838 = _337 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _1840 = isnan(_337);
    bool _1842 = _1838 || _1840;
    bool _1844 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _1846 = _1842 || _1844;
    float _1848 = float(_1846);
    float _1850 = 1.0 / _1816;
    float _1852 = _1814 * _1776;
    int _1854 = as_type<int>(_1758) + (-2);
    float _1856 = float(uint(_1720));
    float _1858 = _1848 * _1836;
    int _1860 = abs(_1740);
    float _1862 = -_1848;
    float _1864 = _1862 + 1.0;
    float _1866 = trunc(_1820);
    float _1868 = precise::max(_1866, 0.0);
    uint _1870 = uint(_1868);
    float _1872 = as_type<float>(_1854) * _1856;
    int _1874 = as_type<int>(_1796) + (-2);
    float _1876 = _1832 * _1864;
    float _1878 = float(uint(_1860));
    float _1880 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1882 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _1880;
    int _1884 = abs(_1720);
    float _1886 = trunc(_1872);
    float _1888 = precise::max(_1886, 0.0);
    uint _1890 = uint(_1888);
    int _1892 = ~_1628;
    int _1894 = _1892 + 1;
    float _1896 = as_type<float>(_1874) * _1878;
    float _1898 = fma(_1882, _1138, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    int _1900 = as_type<int>(_1850) + (-2);
    float _1902 = _1700 * _1876;
    float _1904 = float(uint(_1884));
    int _1906 = _1894 * int(_1870);
    int _1908 = _1906 + _1740;
    float _1910 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1912 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _1910;
    float _1914 = trunc(_1896);
    float _1916 = precise::max(_1914, 0.0);
    uint _1918 = uint(_1916);
    int _1920 = ~_1736;
    int _1922 = _1920 + 1;
    float _1924 = as_type<float>(_1900) * _1904;
    float _1926 = fma(_1912, _1138, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _1928 = float(uint(_1908));
    float _1930 = _1692 * _1876;
    int _1932 = ~_1658;
    int _1934 = _1932 + 1;
    float _1936 = -_1832;
    float _1938 = _1936 + 1.0;
    float _1940 = trunc(_1924);
    float _1942 = precise::max(_1940, 0.0);
    uint _1944 = uint(_1942);
    float _1946 = as_type<float>(_1798) * _1928;
    int _1948 = ~_1760;
    int _1950 = _1948 + 1;
    int _1952 = ~_1802;
    int _1954 = _1952 + 1;
    int _1956 = _1954 + 1;
    int _1958 = _1956;
    if (!_1818)
    {
        int _1960 = ~_1802;
        int _1962 = _1960 + 1;
        _1958 = _1962;
    }
    int _1964 = _1958;
    int _1966 = _1922 * int(_1918);
    int _1968 = _1966 + _1860;
    float _1970 = trunc(_1946);
    float _1972 = precise::max(_1970, 0.0);
    uint _1974 = uint(_1972);
    int _1976 = _1934 * int(_1890);
    int _1978 = _1976 + _1720;
    int _1980 = ~_1628;
    int _1982 = _1980 + 1;
    float _1984 = float(uint(_1978));
    float _1986 = fma(_1938, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1930);
    int _1988 = _1950 * int(_1944);
    int _1990 = _1988 + _1884;
    float _1992 = fma(_1938, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1902);
    float _1994 = float(_1964);
    float _1996 = as_type<float>(_1854) * _1984;
    float _1998 = float(uint(_1968));
    float _2000 = fma(_1734, _1858, _1986);
    float _2002 = fma(_1762, _1858, _1992);
    float _2004 = as_type<float>(_1874) * _1998;
    float _2006 = float(uint(_1990));
    float _2008 = trunc(_1996);
    float _2010 = precise::max(_2008, 0.0);
    uint _2012 = uint(_2010);
    int _2014 = int(_1870) + int(_1974);
    float _2016 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2018 = as_type<float>(_1900) * _2006;
    float _2020 = fma(_1456, -2.0, _2016);
    int _2022 = ~_1658;
    int _2024 = _2022 + 1;
    float _2026 = trunc(_2004);
    float _2028 = precise::max(_2026, 0.0);
    uint _2030 = uint(_2028);
    float _2032 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2034 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2036 = _1382 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2038 = fma(_1386, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2032);
    bool _2040 = !_1568;
    int _2042 = _2040 ? 0 : 1;
    float _2044 = fma(_1434, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2034);
    float _2046 = trunc(_2018);
    float _2048 = precise::max(_2046, 0.0);
    uint _2050 = uint(_2048);
    int _2052 = _1982 * _2014;
    int _2054 = _2052 + _1740;
    int _2056 = int(_1890) + int(_2012);
    float _2058 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2038);
    int _2060 = abs(_2042);
    float _2062 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2044);
    bool _2064 = uint(_2054) >= uint(_1628);
    int _2066 = _2024 * _2056;
    int _2068 = _2066 + _1720;
    int _2070 = int(_1918) + int(_2030);
    float _2072 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2074 = float(_1534);
    float _2076 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2020);
    int _2078 = ~_1736;
    int _2080 = _2078 + 1;
    float _2082 = -_2058;
    float _2084 = _2082 + 1.0;
    float _2086 = float(_2060);
    int _2088 = int(_1944) + int(_2050);
    float _2090 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2092 = log2(_2090);
    int _2094 = ~_1760;
    int _2096 = _2094 + 1;
    int _2098 = _2080 * _2070;
    int _2100 = _2098 + _1860;
    bool _2102 = !_2064;
    int _2104 = _2102 ? 0 : (-1);
    float _2106 = _2086 * _2074;
    bool _2108 = uint(_2068) >= uint(_1658);
    int _2110 = _2096 * _2088;
    int _2112 = _2110 + _1884;
    bool _2114 = !_1564;
    int _2116 = _2114 ? 0 : 1;
    float _2118 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2120 = _1218 + _2118;
    bool _2122 = !_2108;
    int _2124 = _2122 ? 0 : (-1);
    float _2126 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2128 = uint(_2100) >= uint(_1736);
    float _2130 = _2072 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2132 = uint(_2112) >= uint(_1760);
    int _2134 = ~_2014;
    int _2136 = _2134 + _2104;
    int _2138 = _2136 + 1;
    int _2140 = ~_2056;
    int _2142 = _2140 + _2124;
    int _2144 = _2142 + 1;
    float _2146 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _2148 = !_2128;
    int _2150 = _2148 ? 0 : (-1);
    int _2152 = _1628 * _2138;
    int _2154 = _2152 + _1740;
    bool _2156 = !_2132;
    int _2158 = _2156 ? 0 : (-1);
    bool _2160 = _1628 == 0;
    bool _2162 = _1628 == 0;
    int _2164 = _1740 ^ _1628;
    float _2166 = _2092 * _147;
    float _2168 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2170 = _1288 + _2168;
    uint _2172 = uint(int(uint(_2164) >> uint(31)));
    float _2174 = _2120 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _2176 = ~_2150;
    int _2178 = _2070 + _2176;
    int _2180 = _2178 + 1;
    float _2182 = exp2(_2166);
    float _2184 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _2186 = ~int(_2172);
    int _2188 = _2186 + 1;
    float _2190 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2192 = _1310 + _2190;
    float _2194 = -_2184;
    float _2196 = fma(_2036, 2.0, _2194);
    int _2198 = abs(_2116);
    float _2200 = fma(_2170, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2174);
    int _2202 = _2180 ^ _2188;
    float _2204 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2206 = 1.0 + _2204;
    float _2208 = float(_2198);
    int _2210 = _1658 * _2144;
    int _2212 = _2210 + _1720;
    bool _2214 = !_2160;
    int _2216 = _2214 ? _2154 : (-1);
    float _2218 = fma(_2192, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2200);
    bool _2220 = _1658 == 0;
    float _2222 = 1.0 / _2206;
    int _2224 = ~_2188;
    int _2226 = _2224 + _2202;
    int _2228 = _2226 + 1;
    float _2230 = -_2182;
    float _2232 = _2230 + 1.0;
    bool _2234 = !_2220;
    int _2236 = _2234 ? _2212 : (-1);
    float _2238 = -_147;
    float _2240 = fma(_2238, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2196);
    bool _2242 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2244 = isnan(0.0);
    bool _2246 = _2242 || _2244;
    bool _2248 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2250 = _2246 || _2248;
    float _2252 = _2208 * _1994;
    bool _2254 = _2218 >= 0.0;
    float _2256 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _2258 = !_2162;
    int _2260 = _2258 ? _2228 : (-1);
    bool _2262 = _1658 == 0;
    int _2264 = _1720 ^ _1658;
    float _2266 = _2250 ? _2232 : 0.0;
    bool _2268 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2270 = isnan(1.0);
    bool _2272 = _2268 || _2270;
    bool _2274 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2276 = _2272 || _2274;
    uint _2278 = uint(int(uint(_2264) >> uint(31)));
    float _2280 = _2062;
    if (_2254)
    {
        out.m_61.x = 0.0;
    }
    int _2282 = ~_2158;
    int _2284 = _2088 + _2282;
    int _2286 = _2284 + 1;
    float _2288 = float(_2216);
    int _2290 = ~int(_2278);
    int _2292 = _2290 + 1;
    float _2294 = _2146 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2296 = fma(_2130, _2288, _1350);
    int _2298 = _2286 ^ _2292;
    if (_2276)
    {
        float _2300 = _2266 * _2222;
        _149 = _2300;
    }
    float _2302 = _149;
    float _2304 = float(_2236);
    float _2306 = _1242 + 0.5;
    float _2308 = float(_2260);
    float _2310 = _2126 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _2312 = ~_2292;
    int _2314 = _2312 + _2298;
    int _2316 = _2314 + 1;
    float _2318 = _2120 * _2120;
    float _2320 = fma(_2130, _2306, _2296);
    float _2322 = fma(_2294, _2304, _2240);
    bool _2324 = !_2262;
    int _2326 = _2324 ? _2316 : (-1);
    float _2328 = -_1354;
    float _2330 = fma(_2310, _2308, _2328);
    float _2332 = _1308 + 0.5;
    float _2334 = in.m_76.x;
    float _2336 = in.m_76.y;
    float _2338 = in.m_76.z;
    float _2340 = fma(_2170, _2170, _2318);
    float _2342 = _2256 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2344 = fma(_2294, _2332, _2322);
    float _2346 = -_221;
    int _2348 = _1216 ? as_type<int>(_2346) : as_type<int>(_221);
    float _2350 = fma(_2192, _2192, _2340);
    bool _2352 = !_1258;
    float _2354 = _2352 ? _221 : as_type<float>(_1246);
    float _2356 = float(_2326);
    bool _2358 = !_1254;
    float _2360 = _2358 ? _221 : as_type<float>(_2348);
    float _2362 = rsqrt(_2350);
    float _2364 = _2354 + (-0.5);
    float _2366 = -_2076;
    float _2368 = fma(_2342, _2356, _2366);
    float _2370 = _2360 + (-0.5);
    float _2372 = -_2310;
    float _2374 = fma(_2372, _2364, _2330);
    float _2376 = -_1402;
    float _2378 = _2376 + 1.0;
    float _2380 = -_2342;
    float _2382 = fma(_2380, _2370, _2368);
    float _2384 = _2252 * (-2.0);
    float _2386 = -_2378;
    float _2388 = fma(_1242, _2386, _2320);
    float _2390 = -_2084;
    float _2392 = fma(_1308, _2390, _2344);
    float _2394 = _2370;
    float _2396 = _2360;
    if (_2254)
    {
        _2394 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2398 = _2394;
    float _2400 = -_2062;
    float _2402 = _2400 + 1.0;
    float _2404 = fma(_2354, _584, _2374);
    float _2406 = fma(_2384, _2334, _2334);
    float _2408 = fma(_1490, _2384, _1490);
    int _2410 = as_type<int>(_2398);
    if (_2254)
    {
        float _2412 = _2398 * 5.0;
        _2410 = as_type<int>(_2412);
    }
    int _2414 = _2410;
    float _2416 = fma(_2360, _2402, _2382);
    float _2418 = _2120 * _2362;
    float _2420 = fma(_1376, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2406);
    float _2422 = _2170 * _2362;
    if (_2254)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7691 = as_type<float>(_2414);
        out.gl_Position.z = _7691;
    }
    float _2424 = -_2418;
    float _2426 = fma(_2424, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2120);
    bool _2428 = !_1572;
    int _2430 = _2428 ? 0 : 1;
    float _2432 = -_2422;
    float _2434 = fma(_2432, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2170);
    out.m_78.x = _2388;
    out.m_78.y = _2404;
    out.m_78.z = _2392;
    out.m_78.w = _2416;
    float _2436 = _2426 * _2426;
    if (_2254)
    {
        return out;
    }
    float _2438 = -_2418;
    float _2440 = fma(_2438, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1218);
    float _2442 = _2192 * _2362;
    float _2444 = -_2422;
    float _2446 = fma(_2444, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1288);
    float _2448 = fma(_2434, _2434, _2436);
    float _2450 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2452 = _2440 + _2450;
    float _2454 = -_2442;
    float _2456 = fma(_2454, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2192);
    float _2458 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2460 = _2446 + _2458;
    int _2462 = abs(_2430);
    float _2464 = _2452 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2466 = -_2442;
    float _2468 = fma(_2466, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1310);
    float _2470 = fma(_2456, _2456, _2448);
    float _2472 = _2106 * (-2.0);
    float _2474 = fma(_2460, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2464);
    float _2476 = float(_2462);
    float _2478 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2480 = _2468 + _2478;
    float _2482 = float(_1784);
    float _2484 = fma(_2408, _2302, _2420);
    float _2486 = fma(_1548, _2472, _1548);
    float _2488 = fma(_2480, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2474);
    float _2490 = fma(_2472, _2336, _2336);
    float _2492 = _2476 * _2482;
    float _2494 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _2496 = _2494 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _2498 = in.m_68.x;
    float _2500 = in.m_68.y;
    bool _2502 = _2488 >= 0.0;
    float _2504 = _2492 * (-2.0);
    float _2506 = fma(_1384, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2490);
    float _2508 = fma(_2496, _1326, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _2510 = fma(_1926, _1852, _2002);
    float _2512 = fma(_2504, _2338, _2338);
    float _2514 = fma(_2486, _2302, _2506);
    float _2516 = fma(_1502, _2504, _1502);
    float _2518 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _2520 = _2518 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _2522 = _2484 * 0.15915493667125701904296875;
    float _2524 = _2514 * 0.15915493667125701904296875;
    float _2526 = fma(_2508, _1766, _2510);
    float _2528 = fma(_2520, _1326, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _2530 = _2514;
    float _2532 = _2468;
    if (_2502)
    {
        _2530 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2534 = _2530;
    float _2536 = sqrt(_2470);
    float _2538 = fma(_1388, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2512);
    float _2540 = fma(_1732, (*spvDescriptorSet0.vp_c9)._m0[147].y, _2526);
    int _2542 = as_type<int>(_2534);
    if (_2502)
    {
        out.m_61.x = 0.0;
    }
    if (_2502)
    {
        float _2544 = _2534 * 5.0;
        _2542 = as_type<int>(_2544);
    }
    int _2546 = _2542;
    float _2548 = fma(_2516, _2302, _2538);
    float _2550 = fma(_1898, _1852, _2000);
    float _2552 = _2522 * 6.283185482025146484375;
    float _2554 = sin(_2552);
    float _2556 = _2540 * _2500;
    float _2558 = _2550;
    if (_2502)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7939 = as_type<float>(_2546);
        out.gl_Position.z = _7939;
    }
    float _2560 = _2548 * 0.15915493667125701904296875;
    float _2562 = _2522 * 6.283185482025146484375;
    float _2564 = cos(_2562);
    float _2566 = _2524 * 6.283185482025146484375;
    float _2568 = sin(_2566);
    float _2570 = _2524 * 6.283185482025146484375;
    float _2572 = cos(_2570);
    if (_2502)
    {
        return out;
    }
    float _2574 = _2560 * 6.283185482025146484375;
    float _2576 = cos(_2574);
    float _2578 = fma(_2528, _1766, _2550);
    float _2580 = _2362 * _2536;
    float _2582 = _2556 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2584 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _221);
    float _2586 = fma(_1732, (*spvDescriptorSet0.vp_c9)._m0[147].x, _2578);
    float _2588 = _2564 * _2572;
    float _2590 = _2580 * _2582;
    float _2592 = _2560 * 6.283185482025146484375;
    float _2594 = sin(_2592);
    float _2596 = _2586 * _2498;
    float _2598 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _217);
    float _2600 = _2584 * _2590;
    float _2602 = _2554 * _2568;
    float _2604 = _2596 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2606 = _2554 * _2572;
    float _2608 = _2564 * _2568;
    float _2610 = _2564 * _2576;
    float _2612 = _2580 * _2604;
    float _2614 = _2554 * _2576;
    float _2616 = _2572 * _2576;
    float _2618 = _2610 * _2600;
    float _2620 = _2598 * _2612;
    float _2622 = _2568 * _2576;
    float _2624 = _2580 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2626 = _2624 * 0.5;
    float _2628 = fma(_2594, _2588, _2602);
    float _2630 = -_2606;
    float _2632 = fma(_2594, _2608, _2630);
    float _2634 = -_2600;
    float _2636 = _2594 * _2634;
    float _2638 = _2614 * _2600;
    float _2640 = fma(_2628, _2620, _2618);
    float _2642 = -_2608;
    float _2644 = fma(_2594, _2606, _2642);
    float _2646 = fma(_2616, _2620, _2636);
    float _2648 = fma(_2594, _2602, _2588);
    float _2650 = fma(_2632, _2626, _2640);
    float _2652 = fma(_2644, _2620, _2638);
    float _2654 = fma(_2622, _2626, _2646);
    float _2656 = _2628 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2658 = _2650 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2660 = _2650 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2662 = fma(_2648, _2626, _2652);
    float _2664 = _221 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2666 = fma(_2654, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2658);
    float _2668 = fma(_2654, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2660);
    float _2670 = _2610 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2672 = fma(_2662, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2666);
    float _2674 = fma(_2662, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2668);
    float _2676 = _2672 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2678 = _2674 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2680 = _1288 + _2676;
    float _2682 = _1310 + _2678;
    float _2684 = _2628 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2686 = _2628 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2688 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2690 = _2680 + _2688;
    float _2692 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2694 = _2682 + _2692;
    float _2696 = _2650 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2698 = fma(_2616, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2684);
    float _2700 = _2690 * _2690;
    float _2702 = _2694 * _2694;
    float _2704 = fma(_2616, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2686);
    float _2706 = fma(_2616, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2656);
    float _2708 = fma(_2664, _2664, 1.0);
    float _2710 = _2700 + _2702;
    float _2712 = fma(_2654, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2696);
    float _2714 = _2610 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2716 = _2610 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2718 = sqrt(_2710);
    float _2720 = fma(_2662, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2712);
    float _2722 = -_2594;
    float _2724 = fma(_2722, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2714);
    float _2726 = -_2594;
    float _2728 = fma(_2726, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2716);
    float _2730 = -_2594;
    float _2732 = fma(_2730, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2670);
    float _2734 = _2720 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2736 = _2632 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2738 = _2632 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2740 = rsqrt(_2708);
    float _2742 = _2632 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2744 = _1218 + _2734;
    float _2746 = fma(_2622, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2736);
    float _2748 = fma(_2622, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2738);
    float _2750 = fma(_2622, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2742);
    bool _2752 = _2718 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2754 = _2742;
    float _2756 = _2736;
    float _2758 = _2622;
    float _2760 = _2738;
    float _2762 = _2734;
    float _2764 = _2698;
    if (!_2752)
    {
        _2754 = _2702;
    }
    float _2766 = _2754;
    float _2768 = _2766;
    if (!_2752)
    {
        _2756 = _2700;
    }
    float _2770 = _2756;
    float _2772 = _2770;
    if (!_2752)
    {
        _2758 = _2680;
    }
    float _2774 = _2758;
    float _2776 = _2774;
    if (!_2752)
    {
        _2760 = _2682;
    }
    float _2778 = _2760;
    float _2780 = _2778;
    if (!_2752)
    {
        _2762 = _2744;
    }
    float _2782 = _2762;
    bool _2784 = !_2752;
    float _2786 = _2782;
    if (!_2784)
    {
        float _2788 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2790 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2792 = _2718 + _2790;
        float _2794 = rsqrt(_2710);
        float _2796 = _2792 * _2788;
        float _2798 = _2744 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2800 = _2796 * 0.15915493667125701904296875;
        float _2802 = _2800 * 6.283185482025146484375;
        float _2804 = sin(_2802);
        float _2806 = _2800 * 6.283185482025146484375;
        float _2808 = cos(_2806);
        float _2810 = fma(_2804, _2798, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2812 = _2794 * _2810;
        float _2814 = _2808 + (-1.0);
        float _2816 = fma(_2690, _2812, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2818 = fma(_2694, _2812, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2820 = _2814 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2822 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2824 = _2816 + _2822;
        float _2826 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2828 = _2818 + _2826;
        float _2830 = fma(_2744, _2808, _2820);
        float _2832 = _2824 * _2824;
        float _2834 = _2828 * _2828;
        _2786 = _2830;
        _2772 = _2832;
        _2768 = _2834;
        _2776 = _2816;
        _2780 = _2818;
    }
    float _2836 = _2786;
    float _2838 = _2772;
    float _2840 = _2768;
    float _2842 = _2776;
    float _2844 = _2780;
    float _2846 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2848 = _2836 + _2846;
    float _2850 = fma(_2614, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2724);
    float _2852 = fma(_2614, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2728);
    float _2854 = fma(_2648, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2748);
    float _2856 = fma(_2848, _2848, _2838);
    float _2858 = fma(_2614, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2732);
    float _2860 = fma(_2648, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2746);
    float _2862 = fma(_2648, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2750);
    float _2864 = _2856 + _2840;
    float _2866 = _2664 * _2740;
    float _2868 = fma(_2644, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2698);
    float _2870 = fma(_2644, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2704);
    float _2872 = _217 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2874 = _2664 * _2852;
    float _2876 = _2664 * _2850;
    float _2878 = fma(_2644, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2706);
    float _2880 = _2664 * _2858;
    float _2882 = -_2860;
    float _2884 = _2866 * _2882;
    float _2886 = -_2854;
    float _2888 = _2866 * _2886;
    float _2890 = -_2862;
    float _2892 = _2866 * _2890;
    float _2894 = sqrt(_2864);
    float _2896 = fma(_2872, _2868, _2874);
    float _2898 = fma(_2872, _2870, _2876);
    float _2900 = fma(_2872, _2878, _2880);
    float _2902 = fma(_2740, _2852, _2884);
    float _2904 = fma(_2740, _2850, _2888);
    float _2906 = fma(_2740, _2858, _2892);
    float _2908 = _2860 + _2896;
    float _2910 = _2854 + _2898;
    float _2912 = _2862 + _2900;
    out.m_80.x = _2868;
    out.m_80.y = _2870;
    out.m_80.z = _2878;
    out.m_82.x = _2902;
    out.m_82.y = _2904;
    out.m_82.z = _2906;
    bool _2914 = _2894 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2916 = isnan(_2894);
    bool _2918 = _2914 || _2916;
    bool _2920 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2922 = _2918 || _2920;
    out.m_84.x = _2908;
    out.m_84.y = _2910;
    out.m_84.z = _2912;
    if (!_2922)
    {
        _2764 = 1.0;
    }
    float _2924 = _2764;
    bool _2926 = !_2922;
    float _2928 = _2924;
    if (!_2926)
    {
        bool _2930 = _2894 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2932 = isnan(_2894);
        bool _2934 = _2930 || _2932;
        bool _2936 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2938 = _2934 || _2936;
        if (!_2938)
        {
            float _2940 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2942 = _2894 + _2940;
            float _2944 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2946 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2944;
            float _2948 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2950 = _2948 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2952 = 1.0 / _2946;
            float _2954 = _2942 * _2952;
            float _2956 = fma(_2954, _2950, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2928 = _2956;
            _2958 = true;
        }
        else
        {
            bool _2960 = _2894 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2962 = isnan(_2894);
            bool _2964 = _2960 || _2962;
            bool _2966 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2968 = _2964 || _2966;
            if (!_2968)
            {
                float _2970 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2972 = _2894 + _2970;
                float _2974 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2976 = _2974 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2978 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2980 = _2978 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2982 = 1.0 / _2976;
                float _2984 = _2972 * _2982;
                float _2986 = fma(_2984, _2980, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2928 = _2986;
                _2958 = true;
            }
            else
            {
                _2928 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2958 = false;
    float _2988 = _2928;
    float _2990 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2992 = _2836 + _2990;
    float _2994 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2996 = _2842 + _2994;
    float _2998 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _3000 = _2844 + _2998;
    float _3002 = _2440 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3004 = fma(_2992, _2988, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _3006 = fma(_2996, _2988, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _3008 = fma(_3000, _2988, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _3010 = fma(_2446, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3002);
    float _3012 = -_2418;
    float _3014 = fma(_3012, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3004);
    float _3016 = -_2422;
    float _3018 = fma(_3016, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3006);
    float _3020 = -_2442;
    float _3022 = fma(_3020, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3008);
    float _3024 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3026 = _3014 + _3024;
    float _3028 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3030 = _3018 + _3028;
    float _3032 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3034 = _3022 + _3032;
    float _3036 = _3026 * _3026;
    float _3038 = fma(_3030, _3030, _3036);
    float _3040 = fma(_2446, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _3042 = fma(_3034, _3034, _3038);
    float _3044 = fma(_2468, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3010);
    float _3046 = _2440 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3048 = rsqrt(_3042);
    float _3050 = _3044 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3052 = fma(_2446, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3046);
    float _3054 = fma(_2468, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3052);
    float _3056 = 1.0 / _3050;
    float _3058 = _3054 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3060 = _3058 + _3050;
    float _3062 = _3048 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3064 = sqrt(_3042);
    float _3066 = _3030 * _3062;
    float _3068 = _3034 * _3062;
    float _3070 = _3066 * _3066;
    float _3072 = _3068 * _3068;
    float _3074 = _3060 * _3056;
    float _3076 = _3074 * 0.5;
    float _3078 = _3070 + _3072;
    float _3080 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3082 = fma(_3076, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3080);
    float _3084 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _3086 = sqrt(_3078);
    float _3088 = _2440 + _3084;
    float _3090 = _3088 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _3092 = 1.0 / _3082;
    float _3094 = _3088 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _3096 = fma(_2446, (*spvDescriptorSet0.vp_c15)._m0[126].x, _3090);
    float _3098 = fma(_2446, (*spvDescriptorSet0.vp_c15)._m0[127].x, _3094);
    float _3100 = fma(_2468, (*spvDescriptorSet0.vp_c15)._m0[126].z, _3096);
    bool _3102 = _3086 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3104 = fma(_2468, (*spvDescriptorSet0.vp_c15)._m0[127].z, _3098);
    float _3106 = floor(_3040);
    float _3108 = _3100 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _3110 = _3104 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _3112 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3114 = _3092 * _3112;
    float _3116 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3118 = _3086 + _3116;
    float _3120 = trunc(_3108);
    int _3122 = int(_3120);
    float _3124 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    bool _3126 = _3114 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _3128 = _3114 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _3130 = precise::max(0.0, _3124);
    float _3132 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    int _3134 = 2;
    float _3136 = _3062;
    float _3138 = _3118;
    float _3140 = _3078;
    float _3142 = _3066;
    float _3144 = _3070;
    int _3146 = as_type<int>(_3072);
    if (_3102)
    {
        float _3148 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3132 = _3148;
    }
    float _3150 = _3132;
    float _3152 = -_3106;
    float _3154 = _3040 + _3152;
    float _3156 = -_3062;
    float _3158 = -_3130;
    float _3160 = fma(_3026, _3156, _3158);
    float _3162 = _3160;
    if (!_3126)
    {
        _3134 = 1;
    }
    int _3164 = _3134;
    float _3166 = trunc(_3110);
    int _3168 = int(_3166);
    int _3170 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _3172 = _3122 + _3170;
    int _3174 = _3172 + 1;
    int _3176 = _3164;
    if (_3102)
    {
        float _3178 = _3160 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3136 = _3178;
    }
    float _3180 = _3136;
    if (_3102)
    {
        float _3182 = _3118 * _3150;
        _3138 = _3182;
    }
    float _3184 = _3138;
    if (_3102)
    {
        float _3186 = rsqrt(_3078);
        _3140 = _3186;
    }
    float _3188 = _3140;
    float _3190 = _3188;
    if (_3102)
    {
        float _3192 = _3184 * 0.15915493667125701904296875;
        _2396 = _3192;
    }
    float _3194 = _2396;
    bool _3196 = !_3126;
    int _3198 = _3196 ? 0 : 1;
    if (!_3128)
    {
        _3176 = _3198;
    }
    int _3200 = _3176;
    float _3202 = _3104;
    float _3204 = as_type<float>(_3200);
    if (_3102)
    {
        float _3206 = _3194 * 6.283185482025146484375;
        float _3208 = sin(_3206);
        _3202 = _3208;
    }
    float _3210 = _3202;
    int _3212 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _3214 = _3168 + _3212;
    int _3216 = _3214 + 1;
    int _3218 = _3200 << 6;
    bool _3220 = _3174 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _3222 = _3218 + 96;
    uint _3224 = uint(int(uint(_3222) >> uint(2)));
    uint _3226 = uint(int(uint(int(_3224)) >> uint(2)));
    int _3228 = int(_3224) & 3;
    float _3230 = (*spvDescriptorSet0.vp_c15)._m0[int(_3226)][_3228];
    int _3232 = int(_3224) + 1;
    uint _3234 = uint(int(uint(_3232) >> uint(2)));
    int _3236 = _3232 & 3;
    float _3238 = (*spvDescriptorSet0.vp_c15)._m0[int(_3234)][_3236];
    int _3240 = _3174 | _3216;
    float _3242 = _3194;
    float _3244 = as_type<float>(_3240);
    if (_3102)
    {
        float _3246 = _3194 * 6.283185482025146484375;
        float _3248 = cos(_3246);
        _3242 = _3248;
    }
    float _3250 = _3242;
    bool _3252 = _3240 < 0;
    bool _3254 = _3252 || _3220;
    int _3256 = _3218 + 48;
    uint _3258 = uint(int(uint(_3256) >> uint(2)));
    uint _3260 = uint(int(uint(int(_3258)) >> uint(2)));
    int _3262 = int(_3258) & 3;
    float _3264 = (*spvDescriptorSet0.vp_c15)._m0[int(_3260)][_3262];
    int _3266 = int(_3258) + 1;
    uint _3268 = uint(int(uint(_3266) >> uint(2)));
    int _3270 = _3266 & 3;
    float _3272 = (*spvDescriptorSet0.vp_c15)._m0[int(_3268)][_3270];
    if (_3102)
    {
        float _3274 = fma(_3210, _3180, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3244 = _3274;
    }
    float _3276 = _3244;
    float _3278 = _3014 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3280 = fma(_2468, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    bool _3282 = _3216 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _3284 = _3282 || _3254;
    if (_3102)
    {
        float _3286 = _3188 * _3276;
        _2558 = _3286;
    }
    float _3288 = _2558;
    float _3290 = fma(_3018, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3278);
    float _3292 = floor(_3280);
    int _3294 = _3218 + 104;
    uint _3296 = uint(int(uint(_3294) >> uint(2)));
    uint _3298 = uint(int(uint(int(_3296)) >> uint(2)));
    int _3300 = int(_3296) & 3;
    float _3302 = (*spvDescriptorSet0.vp_c15)._m0[int(_3298)][_3300];
    int _3304 = int(_3296) + 1;
    uint _3306 = uint(int(uint(_3304) >> uint(2)));
    int _3308 = _3304 & 3;
    float _3310 = (*spvDescriptorSet0.vp_c15)._m0[int(_3306)][_3308];
    if (_3102)
    {
        float _3312 = _3066 * _3288;
        _3142 = _3312;
    }
    float _3314 = _3142;
    float _3316 = _3250;
    if (_3102)
    {
        float _3318 = _3250 + (-1.0);
        _3190 = _3318;
    }
    float _3320 = _3190;
    float _3322 = fma(_3022, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3290);
    float _3324 = _3320;
    if (_3102)
    {
        float _3326 = _3314 * _3314;
        _3144 = _3326;
    }
    float _3328 = _3144;
    if (_3102)
    {
        float _3330 = _3320 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2280 = _3330;
    }
    float _3332 = _2280;
    if (!_3102)
    {
        _3324 = _3068;
    }
    float _3334 = _3324;
    int _3336 = _3218 + 64;
    uint _3338 = uint(int(uint(_3336) >> uint(2)));
    uint _3340 = uint(int(uint(int(_3338)) >> uint(2)));
    int _3342 = int(_3338) & 3;
    float _3344 = (*spvDescriptorSet0.vp_c15)._m0[int(_3340)][_3342];
    int _3346 = int(_3338) + 1;
    uint _3348 = uint(int(uint(_3346) >> uint(2)));
    int _3350 = _3346 & 3;
    float _3352 = (*spvDescriptorSet0.vp_c15)._m0[int(_3348)][_3350];
    float _3354 = _3334;
    if (_3102)
    {
        float _3356 = _3068 * _3288;
        _3354 = _3356;
    }
    float _3358 = _3354;
    if (_3102)
    {
        float _3360 = fma(_3160, _3250, _3332);
        _3162 = _3360;
    }
    float _3362 = _3162;
    if (!_3102)
    {
        _3316 = _3072;
    }
    float _3364 = _3316;
    float _3366 = _2330;
    float _3368 = _3364;
    if (!_3284)
    {
        float _3370 = floor(_3110);
        _3366 = _3370;
    }
    float _3372 = _3366;
    if (_3102)
    {
        float _3374 = _3358 * _3358;
        _3368 = _3374;
    }
    float _3376 = _3368;
    float _3378 = fma(_3362, _3362, _3328);
    if (!_3284)
    {
        int _3380 = _3216 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _3382 = _3380 + _3174;
        _3146 = _3382;
    }
    int _3384 = _3146;
    int _3386 = _3218 + 80;
    uint _3388 = uint(int(uint(_3386) >> uint(2)));
    uint _3390 = uint(int(uint(int(_3388)) >> uint(2)));
    int _3392 = int(_3388) & 3;
    float _3394 = (*spvDescriptorSet0.vp_c15)._m0[int(_3390)][_3392];
    int _3396 = int(_3388) + 1;
    uint _3398 = uint(int(uint(_3396) >> uint(2)));
    int _3400 = _3396 & 3;
    float _3402 = (*spvDescriptorSet0.vp_c15)._m0[int(_3398)][_3400];
    float _3404 = _3378 + _3376;
    float _3406 = _3322 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3408 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3410 = -_3292;
    float _3412 = _3280 + _3410;
    float _3414 = _3406 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    int _3416 = _3218 + 56;
    uint _3418 = uint(int(uint(_3416) >> uint(2)));
    uint _3420 = uint(int(uint(int(_3418)) >> uint(2)));
    int _3422 = int(_3418) & 3;
    float _3424 = (*spvDescriptorSet0.vp_c15)._m0[int(_3420)][_3422];
    int _3426 = int(_3418) + 1;
    uint _3428 = uint(int(uint(_3426) >> uint(2)));
    int _3430 = _3426 & 3;
    float _3432 = (*spvDescriptorSet0.vp_c15)._m0[int(_3428)][_3430];
    float _3434 = -_3414;
    float _3436 = fma(_3434, _3408, 1.0);
    int _3438 = _3218 + 88;
    uint _3440 = uint(int(uint(_3438) >> uint(2)));
    uint _3442 = uint(int(uint(int(_3440)) >> uint(2)));
    int _3444 = int(_3440) & 3;
    float _3446 = (*spvDescriptorSet0.vp_c15)._m0[int(_3442)][_3444];
    int _3448 = int(_3440) + 1;
    uint _3450 = uint(int(uint(_3448) >> uint(2)));
    int _3452 = _3448 & 3;
    float _3454 = (*spvDescriptorSet0.vp_c15)._m0[int(_3450)][_3452];
    float _3456 = _3088 * _3238;
    float _3458 = log2(_3436);
    float _3460 = fma(_2446, _3230, _3456);
    int _3462 = _3218 + 72;
    uint _3464 = uint(int(uint(_3462) >> uint(2)));
    uint _3466 = uint(int(uint(int(_3464)) >> uint(2)));
    int _3468 = int(_3464) & 3;
    float _3470 = (*spvDescriptorSet0.vp_c15)._m0[int(_3466)][_3468];
    int _3472 = int(_3464) + 1;
    uint _3474 = uint(int(uint(_3472) >> uint(2)));
    int _3476 = _3472 & 3;
    float _3478 = (*spvDescriptorSet0.vp_c15)._m0[int(_3474)][_3476];
    float _3480 = _3088 * _3272;
    float _3482 = rsqrt(_3404);
    float _3484 = fma(_2446, _3264, _3480);
    int _3486 = as_type<int>(_3480);
    int _3488 = as_type<int>(_3230);
    if (!_3284)
    {
        int _3490 = _3384 << 2;
        _3486 = _3490;
    }
    int _3492 = _3486;
    float _3494 = fma(_2468, _3302, _3460);
    int _3496 = _3492;
    if (!_3284)
    {
        int _3498 = 12 & _3492;
        _3496 = _3498;
    }
    int _3500 = _3496;
    float _3502 = _3494 + _3310;
    float _3504 = _3088 * _3352;
    float _3506 = _3352;
    int _3508 = as_type<int>(_3402);
    if (!_3284)
    {
        float _3510 = -_3372;
        float _3512 = _3110 + _3510;
        _3506 = _3512;
    }
    float _3514 = _3506;
    float _3516 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3518 = fma(_3064, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3516);
    float _3520 = precise::clamp(_3518, 0.0, 1.0);
    float _3522 = 1.0 / _3502;
    float _3524 = fma(_2446, _3344, _3504);
    float _3526 = _3482 * _3314;
    float _3528 = _3482 * _3362;
    float _3530 = _3482 * _3358;
    float _3532 = _3088 * _3402;
    float _3534 = _3526 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    if (!_3284)
    {
        uint _3536 = uint(int(uint(_3384) >> uint(2)));
        _3508 = int(_3536);
    }
    int _3538 = _3508;
    float _3540 = fma(_2446, _3394, _3532);
    float _3542 = -_3520;
    float _3544 = _3542 + 1.0;
    if (!_3284)
    {
        int _3546 = _3538 << 4;
        int _3548 = _3546 + _3500;
        _3488 = _3548;
    }
    int _3550 = _3488;
    float _3552 = fma(_2468, _3424, _3484);
    float _3554 = abs(_3544);
    float _3556 = log2(_3554);
    float _3558 = _3552 + _3432;
    float _3560 = _3014 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3562 = fma(_2468, _3446, _3540);
    float _3564 = -_3534;
    float _3566 = fma(_3528, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3564);
    float _3568 = _3014 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3570 = fma(_3018, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3560);
    float _3572 = -_3530;
    float _3574 = fma(_3572, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3566);
    float _3576 = fma(_3018, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3568);
    float _3578 = _3558 * _3522;
    float _3580 = fma(_2468, _3470, _3524);
    float _3582 = fma(_3574, -0.5, 0.5);
    float _3584 = fma(_3574, 0.5, 0.5);
    float _3586 = fma(_3022, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3576);
    float _3588 = _3580 + _3478;
    float _3590 = _3014 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3592 = fma(_3022, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3570);
    bool _3594 = _3578 >= 0.0;
    float _3596 = _3588 * _3522;
    float _3598 = fma(_3018, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3590);
    float _3600 = _3592 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _3602 = _3578 <= 1.0;
    bool _3604 = _3602 && _3594;
    float _3606 = _3556 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3608 = fma(_3022, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3598);
    float _3610 = _3600 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _3612 = _3596 >= 0.0;
    bool _3614 = _3612 && _3604;
    float _3616 = exp2(_3606);
    float _3618 = _3608 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3620 = _3524;
    if (!_3284)
    {
        int _3622 = _3550 + 400;
        uint _3624 = uint(int(uint(_3622) >> uint(2)));
        uint _3626 = uint(int(uint(int(_3624)) >> uint(2)));
        int _3628 = int(_3624) & 3;
        float _3630 = (*spvDescriptorSet0.vp_c15)._m0[int(_3626)][_3628];
        _3620 = _3630;
    }
    float _3632 = _3620;
    bool _3634 = _3596 <= 1.0;
    bool _3636 = _3634 && _3614;
    float _3638 = _3586 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3640 = fma(_3618, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3610);
    float _3642 = _3586;
    if (!_3284)
    {
        float _3644 = floor(_3108);
        _3642 = _3644;
    }
    float _3646 = _3642;
    float _3648 = fma(_3406, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3640);
    float _3650 = fma(_3584, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3652 = _3600 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3654 = _3562 + _3454;
    float _3656 = fma(_3638, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3648);
    float _3658 = fma(_3584, _3650, -0.212114393711090087890625);
    float _3660 = _3528 + 1.0;
    float _3662 = _3600 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3664 = sqrt(_3582);
    float _3666 = fma(_3584, _3658, 1.570728778839111328125);
    float _3668 = fma(_3618, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3652);
    float _3670 = -_3528;
    float _3672 = fma(_3616, _3660, _3670);
    if (_3636)
    {
        float _3674 = float(_3200);
        _3204 = _3674;
    }
    float _3676 = _3204;
    float _3678 = fma(_3618, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3662);
    float _3680 = fma(_3406, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3668);
    float2 _9864 = float2(_3154, _3412);
    float _3682 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_9864, float2(0.0), isnan(_9864)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_9864, float2(0.0), isnan(_9864)), level(0.0)).x;
    float _3684 = 1.0 / _3656;
    float _3686 = fma(_3406, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3678);
    float _3688 = _3458 * 0.693147182464599609375;
    float _3690 = _3654 * _3522;
    float _3692 = fma(_3672, 0.5, 0.5);
    float _3694 = fma(_3638, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3686);
    float _3696 = fma(_3638, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3680);
    float _3698 = _3680;
    if (!_3284)
    {
        float _3700 = -_3646;
        float _3702 = _3108 + _3700;
        _3698 = _3702;
    }
    float _3704 = _3698;
    float _3706 = _3668;
    if (_3636)
    {
        float _3708 = rint(_3676);
        float _3710 = precise::max(_3708, 0.0);
        uint _3712 = uint(_3710);
        uint _3714 = clamp(_3712, 0u, 65535u);
        _3706 = as_type<float>(_3714);
    }
    float _3716 = _3706;
    float _3718 = _3664 * 0.636619746685028076171875;
    float _3720 = _3688 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3722 = -_3666;
    float _3724 = fma(_3718, _3722, 1.0);
    float _3726 = _3694 * _3684;
    float _3728 = _3696 * _3684;
    float _3730 = fma(_3726, 0.5, 0.5);
    float _3732 = fma(_3728, -0.5, 0.5);
    float _3734 = _3716;
    if (_3636)
    {
        float3 _9955 = float3(_3578, _3596, float(as_type<int>(_3716)));
        float3 _9959 = select(_9955, float3(0.0), isnan(_9955));
        float _3736 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _9959.xy, uint(rint(_9959.z)), _3690, level(0.0));
        _3734 = _3736;
    }
    float _3738 = _3734;
    float3 _9969 = float3(_3730, _3732, _3720);
    float _3740 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9969, float3(0.0), isnan(_9969)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9969, float3(0.0), isnan(_9969)), level(0.0)).x;
    float3 _9978 = float3(_3730, _3732, _3720);
    float4 _3743 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9978, float3(0.0), isnan(_9978)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9978, float3(0.0), isnan(_9978)), level(0.0)).xyzw;
    float _3745 = _3743.x;
    float _3747 = _3743.y;
    float _3749 = _3743.z;
    float _3751 = _3743.w;
    float2 _9994 = float2(_3724, _3692);
    float3 _3755 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9994, float2(0.0), isnan(_9994)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9994, float2(0.0), isnan(_9994)), level(0.0)).xyz;
    float _3757 = _3755.x;
    float _3759 = _3755.y;
    float _3761 = _3755.z;
    float _3763 = _3688;
    if (!_3284)
    {
        float _3765 = rint(_3632);
        float _3767 = precise::max(_3765, 0.0);
        uint _3769 = uint(_3767);
        uint _3771 = clamp(_3769, 0u, 65535u);
        _3763 = as_type<float>(_3771);
    }
    float _3773 = _3763;
    float _3775 = _3773;
    if (!_3284)
    {
        float3 _10031 = float3(_3704, _3514, float(as_type<int>(_3773)));
        float3 _10033 = select(_10031, float3(0.0), isnan(_10031));
        float _3777 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _10033.xy, uint(rint(_10033.z)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _10033.xy, uint(rint(_10033.z)), level(0.0)).x;
        _3775 = _3777;
    }
    float _3779 = _3775;
    float _3781 = abs(_3114);
    float _3783 = log2(_3781);
    float _3785 = _3600 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3787 = fma(_3618, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3785);
    float _3789 = fma(_3406, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3787);
    bool _3791 = _3114 <= 8000.0;
    bool _3793 = isnan(_3114);
    bool _3795 = _3791 || _3793;
    bool _3797 = isnan(8000.0);
    bool _3799 = _3795 || _3797;
    float _3801 = float(_3799);
    float _3803 = _3783 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3805 = exp2(_3803);
    float _3807 = _3556 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3809 = exp2(_3807);
    float _3811 = fma(_3805, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3813 = precise::clamp(_3811, 0.0, 1.0);
    float _3815 = fma(_3813, -2.0, 3.0);
    float _3817 = _3813 * _3813;
    float _3819 = fma(_3638, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3789);
    float _3821 = _3817 * _3815;
    float _3823 = _3819 + _3656;
    float _3825 = _3823 * 0.5;
    float _3827 = -_3821;
    float _3829 = _3827 + 1.0;
    out.gl_Position.x = _3694;
    out.gl_Position.y = _3696;
    out.gl_Position.z = _3819;
    out.gl_Position.w = _3656;
    float _3831 = fma(_3829, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3821);
    out.m_86.z = _3825;
    out.m_86.w = _3656;
    float _3833 = -_3809;
    float _3835 = _3833 + 1.0;
    float _3837 = _3801 * _3831;
    float _3839 = _3831;
    float _3841 = _3819;
    float _3843 = _3694;
    if (!_3636)
    {
        _3839 = 1.0;
    }
    float _3845 = _3839;
    float _3847 = _3835 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3849 = _3837 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3851 = -_3682;
    float _3853 = _3851 + 1.0;
    float _3855 = _3853 * _3849;
    float _3857 = precise::clamp(_3855, 0.0, 1.0);
    float _3859 = _3849;
    float _3861 = _3845;
    if (_3284)
    {
        _3859 = 1.0;
    }
    float _3863 = _3859;
    float _3865 = _3863;
    if (_3636)
    {
        bool _3867 = _3738 >= _3690;
        bool _3869 = isnan(_3738);
        bool _3871 = _3867 || _3869;
        bool _3873 = isnan(_3690);
        bool _3875 = _3871 || _3873;
        float _3877 = float(_3875);
        _3861 = _3877;
    }
    float _3879 = _3861;
    if (!_3284)
    {
        int _3881 = _3384 << 4;
        int _3883 = _3881 + 2048;
        uint _3885 = uint(int(uint(_3883) >> uint(2)));
        uint _3887 = uint(int(uint(int(_3885)) >> uint(2)));
        int _3889 = int(_3885) & 3;
        float _3891 = (*spvDescriptorSet0.vp_c15)._m0[int(_3887)][_3889];
        int _3893 = int(_3885) + 1;
        uint _3895 = uint(int(uint(_3893) >> uint(2)));
        int _3897 = _3893 & 3;
        float _3899 = (*spvDescriptorSet0.vp_c15)._m0[int(_3895)][_3897];
        int _3901 = _3883 + 8;
        uint _3903 = uint(int(uint(_3901) >> uint(2)));
        uint _3905 = uint(int(uint(int(_3903)) >> uint(2)));
        int _3907 = int(_3903) & 3;
        float _3909 = (*spvDescriptorSet0.vp_c15)._m0[int(_3905)][_3907];
        int _3911 = int(_3903) + 1;
        uint _3913 = uint(int(uint(_3911) >> uint(2)));
        int _3915 = _3911 & 3;
        float _3917 = (*spvDescriptorSet0.vp_c15)._m0[int(_3913)][_3915];
        float _3919 = _3088 * _3899;
        float _3921 = fma(_2446, _3891, _3919);
        float _3923 = fma(_2468, _3909, _3921);
        float _3925 = _3923 + _3917;
        float _3927 = precise::clamp(_3925, 0.0, 1.0);
        float _3929 = -_3927;
        float _3931 = _3929 + _3779;
        float _3933 = fma(_3931, 500.0, 1.5);
        float _3935 = exp2(_3933);
        float _3937 = 0.0 + _3935;
        float _3939 = precise::clamp(_3937, 0.0, 1.0);
        _3865 = _3939;
        _3841 = _3909;
        _3843 = _3891;
    }
    float _3941 = _3865;
    float _3943 = _3841;
    float _3945 = _3843;
    float _3947 = _3879 * _3941;
    float _3949 = _3847 * _3740;
    float _3951 = -_3857;
    float _3953 = fma(_3951, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3955 = -_3847;
    float _3957 = _3955 + 1.0;
    bool _3959 = _3064 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3961 = isnan(_3064);
    bool _3963 = _3959 || _3961;
    bool _3965 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3967 = _3963 || _3965;
    float _3969 = _3751 * _3949;
    float _3971 = -_3947;
    float _3973 = fma(_3971, _3953, 1.0);
    float _3975 = precise::clamp(_3973, 0.0, 1.0);
    float _3977 = _3761 * _3949;
    float _3979 = _3751 * _3957;
    float _3981 = fma(_3757, _3969, _3745);
    float _3983 = fma(_3759, _3969, _3747);
    float _3985 = _3975 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3987 = fma(_3751, _3977, _3749);
    out.m_88.x = _3985;
    float _3989 = _3943;
    float _3991 = _3945;
    float _3993 = _3969;
    float _3995 = _3957;
    float _3997 = _3975;
    if (!_3967)
    {
        _3989 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3999 = _3989;
    float _4001 = _3999;
    float _4003 = _3999;
    if (!_3967)
    {
        _2532 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4005 = _2532;
    out.m_90.x = _3981;
    out.m_90.y = _3983;
    out.m_90.z = _3987;
    out.m_90.w = _3979;
    float _4007 = _4005;
    float _4009 = _4005;
    if (!_3967)
    {
        _3991 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4011 = _3991;
    float _4013 = _4011;
    float _4015 = _4011;
    if (!_3967)
    {
        _3993 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4017 = _3993;
    float _4019 = _4017;
    float _4021 = _4017;
    if (!_3967)
    {
        _3995 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4023 = _3995;
    float _4025 = _4023;
    float _4027 = _4023;
    if (!_3967)
    {
        _3997 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4029 = _3997;
    bool _4031 = !_3967;
    float _4033 = _4029;
    float _4035 = _4029;
    if (!_4031)
    {
        bool _4037 = _3064 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4039 = isnan(_3064);
        bool _4041 = _4037 || _4039;
        bool _4043 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4045 = _4041 || _4043;
        if (!_4045)
        {
            float _4047 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4049 = _3064 + _4047;
            float _4051 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4053 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4051;
            float _4055 = 1.0 / _4053;
            float _4057 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4059 = _4057 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4061 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4063 = _4061 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4065 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4067 = _4065 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4069 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4071 = _4069 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4073 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4075 = _4073 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4077 = _4049 * _4055;
            float _4079 = precise::clamp(_4077, 0.0, 1.0);
            float _4081 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4083 = _4081 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4085 = fma(_4079, _4059, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4087 = fma(_4079, _4083, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4089 = fma(_4079, _4063, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4091 = fma(_4079, _4067, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4093 = fma(_4079, _4071, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4095 = fma(_4079, _4075, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4009 = _4087;
            _4027 = _4093;
            _4003 = _4085;
            _4021 = _4091;
            _4015 = _4089;
            _4035 = _4095;
            _4097 = true;
        }
        else
        {
            bool _4099 = _3064 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4101 = isnan(_3064);
            bool _4103 = _4099 || _4101;
            bool _4105 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4107 = _4103 || _4105;
            if (!_4107)
            {
                _4001 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4109 = _4001;
            _4003 = _4109;
            if (!_4107)
            {
                _4007 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4111 = _4007;
            _4009 = _4111;
            if (!_4107)
            {
                _4013 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4113 = _4013;
            _4015 = _4113;
            if (!_4107)
            {
                _4019 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4115 = _4019;
            _4021 = _4115;
            if (!_4107)
            {
                _4025 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4117 = _4025;
            _4027 = _4117;
            if (!_4107)
            {
                _4033 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4119 = _4033;
            bool _4121 = !_4107;
            _4035 = _4119;
            if (!_4121)
            {
                bool _4123 = _3064 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4125 = isnan(_3064);
                bool _4127 = _4123 || _4125;
                bool _4129 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4131 = _4127 || _4129;
                if (!_4131)
                {
                    float _4133 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4135 = _3064 + _4133;
                    float _4137 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4139 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4137;
                    float _4141 = 1.0 / _4139;
                    float _4143 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4145 = _4143 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4147 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4149 = _4147 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4151 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4153 = _4151 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4155 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4157 = _4155 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4159 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4161 = _4159 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4163 = _4135 * _4141;
                    float _4165 = precise::clamp(_4163, 0.0, 1.0);
                    float _4167 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4169 = _4167 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4171 = fma(_4165, _4145, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4173 = fma(_4165, _4169, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4175 = fma(_4165, _4149, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4177 = fma(_4165, _4153, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4179 = fma(_4165, _4157, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4181 = fma(_4165, _4161, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4009 = _4173;
                    _4027 = _4179;
                    _4003 = _4171;
                    _4021 = _4177;
                    _4015 = _4175;
                    _4035 = _4181;
                    _4097 = true;
                }
                else
                {
                    _4009 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4027 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4003 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4021 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4015 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4035 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4097 = false;
    float _4183 = _4009;
    float _4185 = _4027;
    float _4187 = _4003;
    float _4189 = _4021;
    float _4191 = _4015;
    float _4193 = _4035;
    float _4195 = fma(_2910, -0.5, 0.5);
    float _4197 = precise::clamp(_4195, 0.0, 1.0);
    float _4199 = -_4183;
    float _4201 = _4199 + _4185;
    float _4203 = -_4187;
    float _4205 = _4203 + _4189;
    float _4207 = -_4191;
    float _4209 = _4207 + _4193;
    bool _4211 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4213 = fma(_4197, _4201, _4183);
    float _4215 = fma(_4197, _4205, _4187);
    float _4217 = fma(_4197, _4209, _4191);
    float _4219 = _4213 * 0.586610972881317138671875;
    out.m_61.x = 1.0;
    float _4221 = fma(_4215, 0.298911988735198974609375, _4219);
    float _4223 = fma(_4217, 0.114477999508380889892578125, _4221);
    out.m_92.x = 0.0;
    float _4225 = -_4223;
    float _4227 = _4215 + _4225;
    float _4229 = -_4223;
    float _4231 = _4213 + _4229;
    float _4233 = -_4223;
    float _4235 = _4217 + _4233;
    float _4237 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4239 = fma(_4227, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4223);
    float _4241 = fma(_4231, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4223);
    float _4243 = fma(_4235, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4223);
    out.m_88.w = _4237;
    out.m_94.x = _4239;
    out.m_94.y = _4241;
    out.m_94.z = _4243;
    if (!_4211)
    {
        return out;
    }
    float _4245 = -_3014;
    float _4247 = _4245 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _4249 = -_3018;
    float _4251 = _4249 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _4253 = -_3022;
    float _4255 = _4253 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _4257 = _4247 * _4247;
    float _4259 = fma(_4251, _4251, _4257);
    float _4261 = fma(_4255, _4255, _4259);
    float _4263 = sqrt(_4261);
    float _4265 = rsqrt(_4261);
    float _4267 = -_4263;
    float _4269 = _4267 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4271 = _4269 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _4273 = precise::clamp(_4271, 0.0, 1.0);
    float _4275 = _4251 * _4265;
    float _4277 = _4247 * _4265;
    float _4279 = abs(_4273);
    float _4281 = log2(_4279);
    float _4283 = _4255 * _4265;
    float _4285 = _4275 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4287 = _2910 * _4277;
    float _4289 = -_4277;
    float _4291 = -_4285;
    float _4293 = fma(_4289, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4291);
    float _4295 = fma(_2908, _4275, _4287);
    float _4297 = -_4283;
    float _4299 = fma(_4297, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4293);
    float _4301 = fma(_2912, _4283, _4295);
    float _4303 = precise::clamp(_4301, 0.0, 1.0);
    float _4305 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _4307 = _4299 + _4305;
    float _4309 = _4281 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _4311 = _4307 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _4313 = precise::clamp(_4311, 0.0, 1.0);
    float _4315 = exp2(_4309);
    float _4317 = _4315 * _4313;
    float _4319 = _4303 * _4317;
    float _4321 = _4319 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4323 = _4319 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4325 = _4319 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_92.x = _4321;
    out.m_92.y = _4323;
    out.m_92.z = _4325;
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
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4097 = false;
    bool _2958 = false;
    bool _329 = false;
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
        float _4382 = as_type<float>(_129);
        out.gl_Position.z = _4382;
    }
    if (!_117)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _133 = in.m_63.w;
    bool _135 = _133 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _137 = isnan(_133);
    bool _139 = _135 || _137;
    bool _141 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _143 = _139 || _141;
    float _145 = -_133;
    float _147 = _145 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _149 = _147;
    if (_143)
    {
        float _151 = float(_113);
        _123 = _151;
    }
    float _153 = _123;
    bool _155 = _147 >= _153;
    bool _157 = !_143;
    bool _159 = _155 || _157;
    float _161 = _153;
    if (_159)
    {
        _161 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _163 = _161;
    if (_159)
    {
        out.m_61.x = 0.0;
    }
    if (_159)
    {
        float _165 = _163 * 5.0;
        _131 = as_type<int>(_165);
    }
    int _167 = _131;
    if (_159)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4452 = as_type<float>(_167);
        out.gl_Position.z = _4452;
    }
    if (_159)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _169 = as_type<float>(int(gl_VertexIndex));
    float _171 = in.m_68.w;
    bool _173 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _175 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _177 = _173 || _175;
    bool _179 = isnan(1.0);
    bool _181 = _177 || _179;
    float _183 = in.m_63.x;
    float _185 = in.m_63.y;
    float _187 = in.m_63.z;
    float _189 = in.m_58.x;
    float _191 = in.m_58.y;
    float _193 = in.m_58.z;
    int _195 = as_type<int>(_169) & 1;
    bool _197 = _195 != 0;
    int _199 = as_type<int>(_169) & 2;
    bool _201 = _199 != 0;
    float _203 = _147 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _205 = 0.0;
    float _207 = _203;
    if (!_181)
    {
        float _209 = _203 * _203;
        float _211 = _209 * 0.5;
        _205 = _211;
    }
    float _213 = _205;
    bool _215 = !_197;
    float _217 = _215 ? (-0.5) : 0.5;
    bool _219 = !_201;
    float _221 = _219 ? (-0.5) : 0.5;
    float _223 = _213;
    if (!_181)
    {
        float _225 = _213 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _223 = _225;
    }
    float _227 = _223;
    bool _229 = !_181;
    float _231 = _227;
    if (!_229)
    {
        float _233 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _235 = log2(_233);
        float _237 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _239 = _237 + 1.0;
        float _241 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _243 = _203 * _235;
        float _245 = 1.0 / _239;
        float _247 = _241 * 0.693147182464599609375;
        float _249 = exp2(_243);
        float _251 = 1.0 / _247;
        float _253 = _249 + (-1.0);
        float _255 = -_253;
        float _257 = fma(_255, _251, _203);
        float _259 = _257 * _245;
        float _261 = _259 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _231 = _261;
    }
    float _263 = _231;
    bool _265 = !_181;
    if (!_265)
    {
        float _267 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _269 = log2(_267);
        float _271 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _273 = _271 + 1.0;
        float _275 = 1.0 / _273;
        float _277 = _203 * _269;
        float _279 = exp2(_277);
        float _281 = -_279;
        float _283 = _281 + 1.0;
        float _285 = _283 * _275;
        _207 = _285;
    }
    float _287 = _207;
    bool _289 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _291 = _263 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _293 = _263 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _295 = _263 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _297 = fma(_287, _183, _291);
    float _299 = fma(_287, _185, _293);
    float _301 = fma(_287, _187, _295);
    float _303 = fma(_297, _171, _189);
    float _305 = fma(_299, _171, _191);
    float _307 = fma(_301, _171, _193);
    bool _309 = !_289;
    float _327;
    if (!_309)
    {
        float _311 = in.m_70.x;
        float _313 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _315 = _311 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _317 = fma(_315, (*spvDescriptorSet0.vp_c9)._m0[12].x, _147);
        float _319 = _317 * _313;
        float _321 = floor(_319);
        float _323 = -_321;
        float _325 = _319 + _323;
        _327 = _325;
        _329 = true;
    }
    else
    {
        float _331 = float(_113);
        float _333 = 1.0 / _331;
        float _335 = _147 * _333;
        _327 = _335;
    }
    _329 = false;
    float _337 = _327;
    float _339 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _341 = int(_339);
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _345 = _337 + _343;
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _349 = _337 + _347;
    int _351 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _353 = _351 != 0;
    float _355 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _357 = int(_355);
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _361 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _359;
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _365 = _363 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _367 = float(_341);
    float _369 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _371 = int(_369);
    float _373 = 0.0;
    if (_353)
    {
        float _375 = in.m_70.x;
        _373 = _375;
    }
    float _377 = _373;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _381 = _377;
    if (!_353)
    {
        float _383 = in.m_70.y;
        _381 = _383;
    }
    float _385 = _381;
    float _387 = float(_357);
    float _389 = 1.0 / _367;
    float _391 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _393 = int(_391);
    float _395 = float(uint(_371));
    int _397 = ~_371;
    int _399 = _397 + 1;
    bool _401 = _371 == 0;
    float _403 = 1.0 / _387;
    float _405 = _389 * _147;
    float _407 = 1.0 / _395;
    float _409 = float(uint(_393));
    int _411 = ~_393;
    int _413 = _411 + 1;
    float _415 = trunc(_405);
    int _417 = int(_415);
    float _419 = _403 * _147;
    float _421 = 1.0 / _409;
    int _423 = as_type<int>(_407) + (-2);
    float _425 = trunc(_419);
    int _427 = int(_425);
    float _429 = float(uint(_417));
    float _431 = as_type<float>(_423) * _429;
    int _433 = as_type<int>(_421) + (-2);
    float _435 = 1.0 / _361;
    float _437 = float(uint(_427));
    float _439 = trunc(_431);
    float _441 = precise::max(_439, 0.0);
    uint _444 = uint(_441);
    float _446 = as_type<float>(_433) * _437;
    float _448 = in.m_70.x;
    float _450 = in.m_70.y;
    float _452 = in.m_70.z;
    float _454 = in.m_70.w;
    float _456 = trunc(_446);
    float _458 = precise::max(_456, 0.0);
    uint _460 = uint(_458);
    int _462 = _399 * int(_444);
    int _464 = _462 + _417;
    float _466 = 1.0 / _365;
    float _468 = float(uint(_464));
    int _470 = _413 * int(_460);
    int _472 = _470 + _427;
    float _474 = as_type<float>(_423) * _468;
    float _476 = _468;
    float _478 = as_type<float>(_472);
    if (_353)
    {
        _476 = 1.0;
    }
    float _480 = _476;
    float _482 = float(uint(_472));
    float _484 = trunc(_474);
    float _486 = precise::max(_484, 0.0);
    uint _488 = uint(_486);
    float _490 = _480;
    if (!_353)
    {
        _490 = 7.345489978790283203125;
    }
    float _492 = _490;
    float _494 = _450 * 2.0;
    if (_353)
    {
        _478 = 1.0;
    }
    float _496 = _478;
    float _498 = as_type<float>(_433) * _482;
    float _500 = _496;
    if (!_353)
    {
        _500 = 1.2345600128173828125;
    }
    float _502 = _500;
    float _504 = _492 * _448;
    float _506 = _349 * _466;
    float _508 = trunc(_498);
    float _510 = precise::max(_508, 0.0);
    uint _512 = uint(_510);
    float _514 = _385 * _502;
    int _516 = ~_371;
    int _518 = _516 + 1;
    float _520 = _452 + _450;
    float _522 = float(_371);
    float _524 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _526 = floor(_504);
    int _528 = int(_444) + int(_488);
    float _530 = fma(_450, (*spvDescriptorSet0.vp_c9)._m0[78].w, _524);
    float _532 = float(_113);
    int _534 = ~_393;
    int _536 = _534 + 1;
    int _538 = _518 * _528;
    int _540 = _538 + _417;
    float _542 = float(_417);
    float _544 = floor(_514);
    int _546 = int(_460) + int(_512);
    float _548 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].w, _530);
    bool _550 = uint(_540) >= uint(_371);
    int _552 = _536 * _546;
    int _554 = _552 + _427;
    bool _556 = _542 >= _522;
    bool _558 = isnan(_542);
    bool _560 = _556 || _558;
    bool _562 = isnan(_522);
    bool _564 = _560 || _562;
    float _566 = float(_564);
    float _568 = -_526;
    float _570 = _504 + _568;
    bool _572 = !_550;
    int _574 = _572 ? 0 : (-1);
    float _576 = 1.0 / _532;
    bool _578 = uint(_554) >= uint(_393);
    float _580 = _570 * _522;
    float _582 = -_548;
    float _584 = _582 + 1.0;
    int _586 = ~_528;
    int _588 = _586 + _574;
    int _590 = _588 + 1;
    float _592 = -_544;
    float _594 = _514 + _592;
    int _596 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _598 = _596 != 0;
    float _600 = trunc(_566);
    int _602 = int(_600);
    float _604 = float(_393);
    float _606 = float(_427);
    bool _608 = !_598;
    int _610 = _608 ? 0 : 1;
    bool _612 = _606 >= _604;
    bool _614 = isnan(_606);
    bool _616 = _612 || _614;
    bool _618 = isnan(_604);
    bool _620 = _616 || _618;
    float _622 = float(_620);
    float _624 = trunc(_580);
    int _626 = int(_624);
    int _628 = abs(_610);
    int _630 = _371 * _590;
    int _632 = _630 + _417;
    float _634 = _576 * _147;
    int _636 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _638 = _636 != 0;
    int _640 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _642 = _640 != 0;
    int _644 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _646 = _644 != 0;
    float _648 = _522 * _634;
    float _650 = trunc(_622);
    int _652 = int(_650);
    bool _654 = !_578;
    int _656 = _654 ? 0 : (-1);
    float _658 = _604 * _634;
    int _660 = ~_602;
    int _662 = _660 + 1;
    int _664 = _662 + 1;
    float _666 = _594 * _604;
    bool _668 = !_401;
    int _670 = _668 ? _632 : (-1);
    int _672 = ~_546;
    int _674 = _672 + _656;
    int _676 = _674 + 1;
    int _678 = _626 * _628;
    int _680 = _678 + _417;
    bool _682 = _393 == 0;
    int _684 = _670 * _664;
    bool _686 = !_642;
    int _688 = _686 ? 0 : 1;
    int _690 = _393 * _676;
    int _692 = _690 + _427;
    int _694 = _371 + (-1);
    float _696 = trunc(_648);
    int _698 = int(_696);
    int _700 = abs(_688);
    int _702 = ~_652;
    int _704 = _702 + 1;
    int _706 = _704 + 1;
    int _708 = _602 * _694;
    int _710 = _708 + _684;
    bool _712 = !_682;
    int _714 = _712 ? _692 : (-1);
    int _716 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _718 = _716 != 0;
    int _720 = _710 * _700;
    float _722 = trunc(_666);
    int _724 = int(_722);
    int _726 = _714 * _706;
    bool _728 = !_638;
    int _730 = _728 ? 0 : 1;
    bool _732 = !_718;
    int _734 = _732 ? 0 : 1;
    int _736 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _738 = _736 != 0;
    int _740 = _393 + (-1);
    float _742 = trunc(_658);
    int _744 = int(_742);
    int _746 = abs(_730);
    bool _748 = !_646;
    int _750 = _748 ? 0 : 1;
    int _752 = _652 * _740;
    int _754 = _752 + _726;
    int _756 = abs(_734);
    int _758 = _698 * _746;
    int _760 = _758 + _720;
    bool _762 = !_738;
    int _764 = _762 ? 0 : 1;
    float _766 = floor(_494);
    int _768 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _770 = _768 != 0;
    int _772 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _774 = _772 != 0;
    int _776 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _778 = _776 != 0;
    int _780 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _782 = _780 != 0;
    int _784 = _724 * _756;
    int _786 = _784 + _427;
    int _788 = abs(_750);
    int _790 = abs(_764);
    bool _792 = !_774;
    int _794 = _792 ? 0 : 1;
    int _796 = abs(_794);
    bool _798 = !_770;
    int _800 = _798 ? 0 : 1;
    int _802 = _680 * _788;
    int _804 = _802 + _760;
    bool _806 = !_778;
    int _808 = _806 ? 0 : 1;
    int _810 = abs(_800);
    int _812 = _626 * _790;
    int _814 = _812 + _804;
    bool _816 = !_782;
    int _818 = _816 ? 0 : 1;
    int _820 = abs(_808);
    int _822 = _754 * _796;
    int _824 = abs(_818);
    float _826 = float(uint(_814));
    int _828 = _744 * _810;
    int _830 = _828 + _822;
    float _832 = as_type<float>(_423) * _826;
    int _834 = ~_371;
    int _836 = _834 + 1;
    int _838 = _786 * _820;
    int _840 = _838 + _830;
    float _842 = float(uint(_786));
    float _844 = trunc(_832);
    float _846 = precise::max(_844, 0.0);
    uint _848 = uint(_846);
    bool _850 = _371 == 0;
    int _852 = _724 * _824;
    int _854 = _852 + _840;
    int _856 = ~_371;
    int _858 = _856 + 1;
    float _860 = as_type<float>(_433) * _842;
    bool _862 = _393 == 0;
    float _864 = float(uint(_854));
    float _866 = float(uint(_680));
    float _868 = trunc(_860);
    float _870 = precise::max(_868, 0.0);
    uint _872 = uint(_870);
    float _874 = as_type<float>(_433) * _864;
    int _876 = _858 * int(_848);
    int _878 = _876 + _814;
    int _880 = ~_393;
    int _882 = _880 + 1;
    float _884 = trunc(_874);
    float _886 = precise::max(_884, 0.0);
    uint _888 = uint(_886);
    float _890 = float(uint(_878));
    float _892 = as_type<float>(_423) * _890;
    float _894 = trunc(_892);
    float _896 = precise::max(_894, 0.0);
    uint _898 = uint(_896);
    int _900 = _882 * int(_888);
    int _902 = _900 + _854;
    float _904 = float(uint(_902));
    float _906 = as_type<float>(_433) * _904;
    float _908 = as_type<float>(_423) * _866;
    float _910 = trunc(_906);
    float _912 = precise::max(_910, 0.0);
    uint _914 = uint(_912);
    int _916 = int(_848) + int(_898);
    int _918 = ~_393;
    int _920 = _918 + 1;
    int _922 = _836 * _916;
    int _924 = _922 + _814;
    float _926 = trunc(_908);
    float _928 = precise::max(_926, 0.0);
    uint _930 = uint(_928);
    bool _932 = uint(_924) >= uint(_371);
    int _934 = ~_371;
    int _936 = _934 + 1;
    int _938 = int(_888) + int(_914);
    bool _940 = !_932;
    int _942 = _940 ? 0 : (-1);
    int _944 = ~_916;
    int _946 = _944 + _942;
    int _948 = _946 + 1;
    int _950 = _936 * int(_930);
    int _952 = _950 + _680;
    int _954 = ~_393;
    int _956 = _954 + 1;
    int _958 = _920 * _938;
    int _960 = _958 + _854;
    int _962 = _371 * _948;
    int _964 = _962 + _814;
    float _966 = float(uint(_952));
    int _968 = _956 * int(_872);
    int _970 = _968 + _786;
    bool _972 = uint(_960) >= uint(_393);
    bool _974 = !_850;
    float _976 = _974 ? as_type<float>(_964) : as_type<float>(0xffffffffu /* nan */);
    float _978 = as_type<float>(_423) * _966;
    bool _980 = !_972;
    int _982 = _980 ? 0 : (-1);
    int _984 = as_type<int>(_976) & 3;
    bool _986 = _984 != 0;
    int _988 = as_type<int>(_976) & 3;
    bool _990 = _988 != 0;
    float _992 = trunc(_978);
    float _994 = precise::max(_992, 0.0);
    uint _996 = uint(_994);
    bool _998 = _984 != 3;
    int _1000 = ~_938;
    int _1002 = _1000 + _982;
    int _1004 = _1002 + 1;
    int _1006 = _990 ? 0 : 1;
    bool _1008 = uint(_984) >= 2u;
    int _1010 = _393 * _1004;
    int _1012 = _1010 + _854;
    bool _1014 = uint(_984) > 1u;
    float _1016 = float(uint(_970));
    int _1018 = _1008 ? 0 : 1;
    bool _1020 = !_862;
    int _1022 = _1020 ? _1012 : (-1);
    float _1024 = as_type<float>(_433) * _1016;
    int _1026 = ~_1018;
    int _1028 = _1026 + 1;
    int _1030 = _1028 + 1;
    int _1032 = _1030;
    float _1034 = _976;
    float _1036 = as_type<float>(_786);
    if (_998)
    {
        int _1038 = ~_1018;
        int _1040 = _1038 + 1;
        _1032 = _1040;
    }
    int _1042 = _1032;
    float _1044 = trunc(_1024);
    float _1046 = precise::max(_1044, 0.0);
    uint _1048 = uint(_1046);
    int _1050 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1052 = _1050 != 0;
    int _1054 = _1022 & 3;
    bool _1056 = _1054 != 0;
    bool _1058 = !_1052;
    int _1060 = _1058 ? 0 : 1;
    int _1062 = ~_1006;
    int _1064 = _1062 + 1;
    int _1066 = _1064 + 1;
    bool _1068 = uint(_1054) > 1u;
    float _1070 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1072 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _1070;
    int _1074 = _1066;
    if (!_1014)
    {
        int _1076 = ~_1006;
        int _1078 = _1076 + 1;
        _1074 = _1078;
    }
    int _1080 = _1074;
    float _1082 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _1084 = _1082 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    int _1086 = int(_930) + int(_996);
    float _1088 = 1.0 / _1072;
    int _1090 = ~_371;
    int _1092 = _1090 + 1;
    int _1094 = _1022 & 3;
    bool _1096 = _1094 != 0;
    int _1098 = ~_393;
    int _1100 = _1098 + 1;
    int _1102 = _1092 * _1086;
    int _1104 = _1102 + _680;
    int _1106 = _1096 ? 0 : 1;
    float _1108 = 1.0 / _1084;
    int _1110 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1112 = _1110 != 0;
    float _1114 = _379 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1116 = ~_1106;
    int _1118 = _1116 + 1;
    int _1120 = _1118 + 1;
    float _1122 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1124 = _337 + _1122;
    bool _1126 = !_1112;
    int _1128 = _1126 ? 0 : 1;
    bool _1130 = uint(_1104) >= uint(_371);
    float _1132 = _1124 * _435;
    int _1134 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1136 = _1134 != 0;
    float _1138 = _345 * _1088;
    int _1140 = _1120;
    float _1142 = _1084;
    if (!_1068)
    {
        int _1144 = ~_1106;
        int _1146 = _1144 + 1;
        _1140 = _1146;
    }
    int _1148 = _1140;
    float _1150 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _1152 = _337 + _1150;
    bool _1154 = _1054 != 3;
    int _1156 = int(_872) + int(_1048);
    bool _1158 = !_1130;
    int _1160 = _1158 ? 0 : (-1);
    bool _1162 = uint(_1054) >= 2u;
    int _1164 = _1100 * _1156;
    int _1166 = _1164 + _786;
    int _1168 = ~_1086;
    int _1170 = _1168 + _1160;
    int _1172 = _1170 + 1;
    int _1174 = _1162 ? 0 : 1;
    bool _1176 = uint(_1166) >= uint(_393);
    int _1178 = _371 * _1172;
    int _1180 = _1178 + _680;
    int _1182 = 0;
    float _1184 = _1152;
    if (_1136)
    {
        _1182 = 0;
    }
    int _1186 = _1182;
    float _1188 = _305 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _1190 = ~_1174;
    int _1192 = _1190 + 1;
    int _1194 = _1192 + 1;
    float _1196 = _305 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1198 = fma(_303, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1188);
    int _1200 = _1186;
    int _1202 = _1194;
    if (!_1136)
    {
        _1200 = 1;
    }
    int _1204 = _1200;
    if (_1154)
    {
        int _1206 = ~_1174;
        int _1208 = _1206 + 1;
        _1202 = _1208;
    }
    int _1210 = _1202;
    float _1212 = fma(_307, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1198);
    bool _1214 = _448 > 0.5;
    bool _1216 = _454 > 0.5;
    float _1218 = _1212 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1220 = !_1176;
    int _1222 = _1220 ? 0 : (-1);
    int _1224 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1226 = _1224 != 0;
    float _1228 = -_217;
    int _1230 = _1214 ? as_type<int>(_1228) : as_type<int>(_217);
    bool _1232 = !_850;
    int _1234 = _1232 ? _1180 : (-1);
    bool _1236 = _450 > 0.5;
    bool _1238 = _452 > 0.5;
    bool _1240 = !_1226;
    float _1242 = _1240 ? _217 : as_type<float>(_1230);
    float _1244 = -_221;
    int _1246 = _1236 ? as_type<int>(_1244) : as_type<int>(_221);
    float _1248 = -_217;
    int _1250 = _1238 ? as_type<int>(_1248) : as_type<int>(_217);
    int _1252 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1254 = _1252 != 0;
    int _1256 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1258 = _1256 != 0;
    int _1260 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1262 = _1260 != 0;
    float _1264 = _305 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1266 = _448 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1268 = fma(_303, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1264);
    float _1270 = fma(_303, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1196);
    float _1272 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1274 = _450 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1276 = fma(_307, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1268);
    float _1278 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1280 = -_1272;
    float _1282 = fma(_1266, 2.0, _1280);
    float _1284 = fma(_307, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1270);
    float _1286 = fma(_1274, -2.0, _1278);
    float _1288 = _1276 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1290 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1292 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1294 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1296 = _1290 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1298 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1300 = _1292 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1302 = _1294 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1304 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _1306 = !_1262;
    float _1308 = _1306 ? _217 : as_type<float>(_1250);
    float _1310 = _1284 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    out.m_72.x = _1296;
    out.m_72.y = _1300;
    out.m_72.z = _1302;
    out.m_72.w = _1298;
    bool _1312 = _1204 != 1;
    float _1314 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1316 = _1304 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1318 = ~_1156;
    int _1320 = _1318 + _1222;
    int _1322 = _1320 + 1;
    float _1324 = _1314 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1326 = _1152 * _1108;
    float _1328 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1330 = _452 * 2.0;
    int _1332 = _393 * _1322;
    int _1334 = _1332 + _786;
    float _1336 = _448 * 2.0;
    bool _1338 = !_986;
    int _1340 = _1338 ? 0 : 1;
    out.m_74.x = _1316;
    out.m_74.y = _1324;
    out.m_74.z = _1114;
    out.m_74.w = _1328;
    int _1342 = _1022 >> 31;
    float _1344 = floor(_1330);
    int _1346 = as_type<int>(_976) >> 31;
    float _1348 = -_147;
    float _1350 = fma(_1348, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1282);
    int _1352 = _1342 & 3;
    float _1354 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1286);
    int _1356 = _1346 & 3;
    float _1358 = floor(_1336);
    int _1360 = _1022 + _1352;
    float _1362 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1364 = as_type<int>(_976) + _1356;
    float _1366 = _448 + _450;
    if (!_1312)
    {
        _1034 = _450;
    }
    float _1368 = _1034;
    float _1370 = _452 + _448;
    float _1372 = _1368;
    if (!_1312)
    {
        _1036 = _450;
    }
    float _1374 = _1036;
    float _1376 = _448 + (-0.5);
    float _1378 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1362);
    float _1380 = _1374;
    if (_1312)
    {
        _1372 = _448;
    }
    float _1382 = _1372;
    float _1384 = _450 + (-0.5);
    if (_1312)
    {
        _1380 = _448;
    }
    float _1386 = _1380;
    float _1388 = _452 + (-0.5);
    int _1390 = _1364 >> 2;
    float _1392 = _1366 + (-1.0);
    int _1394 = _1360 >> 2;
    float _1396 = _1370 + (-1.0);
    int _1398 = _1390 << 4;
    int _1400 = _1398 + 368;
    float _1402 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1378);
    int _1404 = _1394 << 4;
    int _1406 = _1404 + 512;
    uint _1408 = uint(int(uint(_1400) >> uint(2)));
    uint _1410 = uint(int(uint(int(_1408)) >> uint(2)));
    int _1412 = int(_1408) & 3;
    float _1414 = (*spvDescriptorSet0.vp_c9)._m0[int(_1410)][_1412];
    int _1416 = int(_1408) + 1;
    uint _1418 = uint(int(uint(_1416) >> uint(2)));
    int _1420 = _1416 & 3;
    float _1422 = (*spvDescriptorSet0.vp_c9)._m0[int(_1418)][_1420];
    if (!_1312)
    {
        _1142 = _452;
    }
    float _1424 = _1142;
    float _1426 = _1424;
    if (!_1312)
    {
        _1184 = _452;
    }
    float _1428 = _1184;
    float _1430 = _1428;
    if (_1312)
    {
        _1426 = _450;
    }
    float _1432 = _1426;
    if (_1312)
    {
        _1430 = _450;
    }
    float _1434 = _1430;
    uint _1436 = uint(int(uint(_1406) >> uint(2)));
    uint _1438 = uint(int(uint(int(_1436)) >> uint(2)));
    int _1440 = int(_1436) & 3;
    float _1442 = (*spvDescriptorSet0.vp_c9)._m0[int(_1438)][_1440];
    int _1444 = int(_1436) + 1;
    uint _1446 = uint(int(uint(_1444) >> uint(2)));
    int _1448 = _1444 & 3;
    float _1450 = (*spvDescriptorSet0.vp_c9)._m0[int(_1446)][_1448];
    bool _1452 = !_862;
    int _1454 = _1452 ? _1334 : (-1);
    float _1456 = _1432 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _1458 = _1358 > 0.0;
    bool _1460 = _1358 >= 0.0;
    bool _1462 = isnan(_1358);
    bool _1464 = _1460 || _1462;
    bool _1466 = isnan(0.0);
    bool _1468 = _1464 || _1466;
    int _1470 = _1400 + 8;
    uint _1472 = uint(int(uint(_1470) >> uint(2)));
    uint _1474 = uint(int(uint(int(_1472)) >> uint(2)));
    int _1476 = int(_1472) & 3;
    float _1478 = (*spvDescriptorSet0.vp_c9)._m0[int(_1474)][_1476];
    int _1480 = int(_1472) + 1;
    uint _1482 = uint(int(uint(_1480) >> uint(2)));
    int _1484 = _1480 & 3;
    float _1486 = (*spvDescriptorSet0.vp_c9)._m0[int(_1482)][_1484];
    int _1488 = _1468 ? 0 : 1;
    float _1490 = fma(_1392, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1492 = _766 >= 0.0;
    bool _1494 = isnan(_766);
    bool _1496 = _1492 || _1494;
    bool _1498 = isnan(0.0);
    bool _1500 = _1496 || _1498;
    float _1502 = fma(_1396, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _1504 = ~_1488;
    int _1506 = _1504 + 1;
    int _1508 = _1506 + 1;
    int _1510 = _1406 + 8;
    uint _1512 = uint(int(uint(_1510) >> uint(2)));
    uint _1514 = uint(int(uint(int(_1512)) >> uint(2)));
    int _1516 = int(_1512) & 3;
    float _1518 = (*spvDescriptorSet0.vp_c9)._m0[int(_1514)][_1516];
    int _1520 = int(_1512) + 1;
    uint _1522 = uint(int(uint(_1520) >> uint(2)));
    int _1524 = _1520 & 3;
    float _1526 = (*spvDescriptorSet0.vp_c9)._m0[int(_1522)][_1524];
    int _1528 = _1508;
    if (!_1458)
    {
        int _1530 = ~_1488;
        int _1532 = _1530 + 1;
        _1528 = _1532;
    }
    int _1534 = _1528;
    bool _1536 = !_1056;
    int _1538 = _1536 ? 0 : 1;
    bool _1540 = _984 != 3;
    float _1542 = _520 + (-1.0);
    bool _1544 = _1054 != 3;
    bool _1546 = _766 > 0.0;
    float _1548 = fma(_1542, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1550 = abs(_1080);
    int _1552 = _1500 ? 0 : 1;
    bool _1554 = !_1540;
    int _1556 = _1554 ? 0 : (-1);
    bool _1558 = !_1544;
    int _1560 = _1558 ? 0 : (-1);
    int _1562 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1564 = _1562 != 0;
    int _1566 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1568 = _1566 != 0;
    int _1570 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1572 = _1570 != 0;
    int _1574 = abs(_1148);
    int _1576 = abs(_1340);
    int _1578 = abs(_1538);
    int _1580 = ~_1550;
    int _1582 = _1580 + 1;
    int _1584 = _1582 + 1;
    int _1586 = ~_1574;
    int _1588 = _1586 + 1;
    int _1590 = _1588 + 1;
    int _1592 = _1584 * as_type<int>(_1422);
    int _1594 = ~_1576;
    int _1596 = _1594 + 1;
    int _1598 = _1596 + 1;
    int _1600 = _1590 * as_type<int>(_1450);
    int _1602 = abs(_1042);
    int _1604 = ~_1578;
    int _1606 = _1604 + 1;
    int _1608 = _1606 + 1;
    int _1610 = _1598 * as_type<int>(_1414);
    int _1612 = _1610 + _1592;
    int _1614 = abs(_1556);
    int _1616 = _1608 * as_type<int>(_1442);
    int _1618 = _1616 + _1600;
    int _1620 = ~_1602;
    int _1622 = _1620 + 1;
    int _1624 = _1622 + 1;
    float _1626 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1628 = int(_1626);
    int _1630 = abs(_1210);
    int _1632 = ~_1614;
    int _1634 = _1632 + 1;
    int _1636 = _1634 + 1;
    int _1638 = _1624 * as_type<int>(_1478);
    int _1640 = _1638 + _1612;
    int _1642 = ~_1630;
    int _1644 = _1642 + 1;
    int _1646 = _1644 + 1;
    int _1648 = abs(_1560);
    int _1650 = _1636 * as_type<int>(_1486);
    int _1652 = _1650 + _1640;
    int _1654 = abs(_1128);
    float _1656 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _1658 = int(_1656);
    int _1660 = ~_1648;
    int _1662 = _1660 + 1;
    int _1664 = _1662 + 1;
    int _1666 = _1646 * as_type<int>(_1518);
    int _1668 = _1666 + _1618;
    int _1670 = _1664 * as_type<int>(_1526);
    int _1672 = _1670 + _1668;
    int _1674 = abs(_1060);
    float _1676 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1678 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1676;
    float _1680 = float(uint(_1628));
    float _1682 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1684 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1682;
    int _1686 = ~_1654;
    int _1688 = _1686 + 1;
    int _1690 = _1688 + 1;
    float _1692 = fma(_1678, _1132, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    int _1694 = ~_1674;
    int _1696 = _1694 + 1;
    int _1698 = _1696 + 1;
    float _1700 = fma(_1684, _1132, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _1702 = 1.0 / _1680;
    int _1704 = _1672 * _1690;
    float _1706 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1708 = _1706 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1710 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1712 = _1710 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    int _1714 = _1652 * _1698;
    float _1716 = float(uint(_1658));
    int _1718 = _1454 * _1654;
    int _1720 = _1718 + _1704;
    bool _1722 = _337 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _1724 = isnan(_337);
    bool _1726 = _1722 || _1724;
    bool _1728 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _1730 = _1726 || _1728;
    float _1732 = float(_1730);
    float _1734 = fma(_1708, _506, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    int _1736 = abs(_1628);
    int _1738 = _1234 * _1674;
    int _1740 = _1738 + _1714;
    bool _1742 = _337 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _1744 = isnan(_337);
    bool _1746 = _1742 || _1744;
    bool _1748 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _1750 = _1746 || _1748;
    float _1752 = float(_1750);
    float _1754 = -_1732;
    float _1756 = _1754 + 1.0;
    float _1758 = 1.0 / _1716;
    int _1760 = abs(_1658);
    float _1762 = fma(_1712, _506, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _1764 = float(uint(_1736));
    float _1766 = _1752 * _1756;
    int _1768 = ~_1552;
    int _1770 = _1768 + 1;
    int _1772 = _1770 + 1;
    float _1774 = -_1752;
    float _1776 = _1774 + 1.0;
    int _1778 = _1772;
    if (!_1546)
    {
        int _1780 = ~_1552;
        int _1782 = _1780 + 1;
        _1778 = _1782;
    }
    int _1784 = _1778;
    bool _1786 = _1344 >= 0.0;
    bool _1788 = isnan(_1344);
    bool _1790 = _1786 || _1788;
    bool _1792 = isnan(0.0);
    bool _1794 = _1790 || _1792;
    float _1796 = 1.0 / _1764;
    int _1798 = as_type<int>(_1702) + (-2);
    float _1800 = float(uint(_1740));
    int _1802 = _1794 ? 0 : 1;
    bool _1804 = _337 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1806 = isnan(_337);
    bool _1808 = _1804 || _1806;
    bool _1810 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _1812 = _1808 || _1810;
    float _1814 = float(_1812);
    float _1816 = float(uint(_1760));
    bool _1818 = _1344 > 0.0;
    float _1820 = as_type<float>(_1798) * _1800;
    bool _1822 = _337 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1824 = isnan(_337);
    bool _1826 = _1822 || _1824;
    bool _1828 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1830 = _1826 || _1828;
    float _1832 = float(_1830);
    float _1834 = -_1814;
    float _1836 = _1834 + 1.0;
    bool _1838 = _337 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _1840 = isnan(_337);
    bool _1842 = _1838 || _1840;
    bool _1844 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _1846 = _1842 || _1844;
    float _1848 = float(_1846);
    float _1850 = 1.0 / _1816;
    float _1852 = _1814 * _1776;
    int _1854 = as_type<int>(_1758) + (-2);
    float _1856 = float(uint(_1720));
    float _1858 = _1848 * _1836;
    int _1860 = abs(_1740);
    float _1862 = -_1848;
    float _1864 = _1862 + 1.0;
    float _1866 = trunc(_1820);
    float _1868 = precise::max(_1866, 0.0);
    uint _1870 = uint(_1868);
    float _1872 = as_type<float>(_1854) * _1856;
    int _1874 = as_type<int>(_1796) + (-2);
    float _1876 = _1832 * _1864;
    float _1878 = float(uint(_1860));
    float _1880 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1882 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _1880;
    int _1884 = abs(_1720);
    float _1886 = trunc(_1872);
    float _1888 = precise::max(_1886, 0.0);
    uint _1890 = uint(_1888);
    int _1892 = ~_1628;
    int _1894 = _1892 + 1;
    float _1896 = as_type<float>(_1874) * _1878;
    float _1898 = fma(_1882, _1138, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    int _1900 = as_type<int>(_1850) + (-2);
    float _1902 = _1700 * _1876;
    float _1904 = float(uint(_1884));
    int _1906 = _1894 * int(_1870);
    int _1908 = _1906 + _1740;
    float _1910 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1912 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _1910;
    float _1914 = trunc(_1896);
    float _1916 = precise::max(_1914, 0.0);
    uint _1918 = uint(_1916);
    int _1920 = ~_1736;
    int _1922 = _1920 + 1;
    float _1924 = as_type<float>(_1900) * _1904;
    float _1926 = fma(_1912, _1138, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _1928 = float(uint(_1908));
    float _1930 = _1692 * _1876;
    int _1932 = ~_1658;
    int _1934 = _1932 + 1;
    float _1936 = -_1832;
    float _1938 = _1936 + 1.0;
    float _1940 = trunc(_1924);
    float _1942 = precise::max(_1940, 0.0);
    uint _1944 = uint(_1942);
    float _1946 = as_type<float>(_1798) * _1928;
    int _1948 = ~_1760;
    int _1950 = _1948 + 1;
    int _1952 = ~_1802;
    int _1954 = _1952 + 1;
    int _1956 = _1954 + 1;
    int _1958 = _1956;
    if (!_1818)
    {
        int _1960 = ~_1802;
        int _1962 = _1960 + 1;
        _1958 = _1962;
    }
    int _1964 = _1958;
    int _1966 = _1922 * int(_1918);
    int _1968 = _1966 + _1860;
    float _1970 = trunc(_1946);
    float _1972 = precise::max(_1970, 0.0);
    uint _1974 = uint(_1972);
    int _1976 = _1934 * int(_1890);
    int _1978 = _1976 + _1720;
    int _1980 = ~_1628;
    int _1982 = _1980 + 1;
    float _1984 = float(uint(_1978));
    float _1986 = fma(_1938, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1930);
    int _1988 = _1950 * int(_1944);
    int _1990 = _1988 + _1884;
    float _1992 = fma(_1938, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1902);
    float _1994 = float(_1964);
    float _1996 = as_type<float>(_1854) * _1984;
    float _1998 = float(uint(_1968));
    float _2000 = fma(_1734, _1858, _1986);
    float _2002 = fma(_1762, _1858, _1992);
    float _2004 = as_type<float>(_1874) * _1998;
    float _2006 = float(uint(_1990));
    float _2008 = trunc(_1996);
    float _2010 = precise::max(_2008, 0.0);
    uint _2012 = uint(_2010);
    int _2014 = int(_1870) + int(_1974);
    float _2016 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2018 = as_type<float>(_1900) * _2006;
    float _2020 = fma(_1456, -2.0, _2016);
    int _2022 = ~_1658;
    int _2024 = _2022 + 1;
    float _2026 = trunc(_2004);
    float _2028 = precise::max(_2026, 0.0);
    uint _2030 = uint(_2028);
    float _2032 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2034 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2036 = _1382 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2038 = fma(_1386, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2032);
    bool _2040 = !_1568;
    int _2042 = _2040 ? 0 : 1;
    float _2044 = fma(_1434, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2034);
    float _2046 = trunc(_2018);
    float _2048 = precise::max(_2046, 0.0);
    uint _2050 = uint(_2048);
    int _2052 = _1982 * _2014;
    int _2054 = _2052 + _1740;
    int _2056 = int(_1890) + int(_2012);
    float _2058 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2038);
    int _2060 = abs(_2042);
    float _2062 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2044);
    bool _2064 = uint(_2054) >= uint(_1628);
    int _2066 = _2024 * _2056;
    int _2068 = _2066 + _1720;
    int _2070 = int(_1918) + int(_2030);
    float _2072 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2074 = float(_1534);
    float _2076 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2020);
    int _2078 = ~_1736;
    int _2080 = _2078 + 1;
    float _2082 = -_2058;
    float _2084 = _2082 + 1.0;
    float _2086 = float(_2060);
    int _2088 = int(_1944) + int(_2050);
    float _2090 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2092 = log2(_2090);
    int _2094 = ~_1760;
    int _2096 = _2094 + 1;
    int _2098 = _2080 * _2070;
    int _2100 = _2098 + _1860;
    bool _2102 = !_2064;
    int _2104 = _2102 ? 0 : (-1);
    float _2106 = _2086 * _2074;
    bool _2108 = uint(_2068) >= uint(_1658);
    int _2110 = _2096 * _2088;
    int _2112 = _2110 + _1884;
    bool _2114 = !_1564;
    int _2116 = _2114 ? 0 : 1;
    float _2118 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2120 = _1218 + _2118;
    bool _2122 = !_2108;
    int _2124 = _2122 ? 0 : (-1);
    float _2126 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2128 = uint(_2100) >= uint(_1736);
    float _2130 = _2072 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2132 = uint(_2112) >= uint(_1760);
    int _2134 = ~_2014;
    int _2136 = _2134 + _2104;
    int _2138 = _2136 + 1;
    int _2140 = ~_2056;
    int _2142 = _2140 + _2124;
    int _2144 = _2142 + 1;
    float _2146 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _2148 = !_2128;
    int _2150 = _2148 ? 0 : (-1);
    int _2152 = _1628 * _2138;
    int _2154 = _2152 + _1740;
    bool _2156 = !_2132;
    int _2158 = _2156 ? 0 : (-1);
    bool _2160 = _1628 == 0;
    bool _2162 = _1628 == 0;
    int _2164 = _1740 ^ _1628;
    float _2166 = _2092 * _147;
    float _2168 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2170 = _1288 + _2168;
    uint _2172 = uint(int(uint(_2164) >> uint(31)));
    float _2174 = _2120 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _2176 = ~_2150;
    int _2178 = _2070 + _2176;
    int _2180 = _2178 + 1;
    float _2182 = exp2(_2166);
    float _2184 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _2186 = ~int(_2172);
    int _2188 = _2186 + 1;
    float _2190 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2192 = _1310 + _2190;
    float _2194 = -_2184;
    float _2196 = fma(_2036, 2.0, _2194);
    int _2198 = abs(_2116);
    float _2200 = fma(_2170, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2174);
    int _2202 = _2180 ^ _2188;
    float _2204 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2206 = 1.0 + _2204;
    float _2208 = float(_2198);
    int _2210 = _1658 * _2144;
    int _2212 = _2210 + _1720;
    bool _2214 = !_2160;
    int _2216 = _2214 ? _2154 : (-1);
    float _2218 = fma(_2192, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2200);
    bool _2220 = _1658 == 0;
    float _2222 = 1.0 / _2206;
    int _2224 = ~_2188;
    int _2226 = _2224 + _2202;
    int _2228 = _2226 + 1;
    float _2230 = -_2182;
    float _2232 = _2230 + 1.0;
    bool _2234 = !_2220;
    int _2236 = _2234 ? _2212 : (-1);
    float _2238 = -_147;
    float _2240 = fma(_2238, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2196);
    bool _2242 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2244 = isnan(0.0);
    bool _2246 = _2242 || _2244;
    bool _2248 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2250 = _2246 || _2248;
    float _2252 = _2208 * _1994;
    bool _2254 = _2218 >= 0.0;
    float _2256 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _2258 = !_2162;
    int _2260 = _2258 ? _2228 : (-1);
    bool _2262 = _1658 == 0;
    int _2264 = _1720 ^ _1658;
    float _2266 = _2250 ? _2232 : 0.0;
    bool _2268 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2270 = isnan(1.0);
    bool _2272 = _2268 || _2270;
    bool _2274 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2276 = _2272 || _2274;
    uint _2278 = uint(int(uint(_2264) >> uint(31)));
    float _2280 = _2062;
    if (_2254)
    {
        out.m_61.x = 0.0;
    }
    int _2282 = ~_2158;
    int _2284 = _2088 + _2282;
    int _2286 = _2284 + 1;
    float _2288 = float(_2216);
    int _2290 = ~int(_2278);
    int _2292 = _2290 + 1;
    float _2294 = _2146 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2296 = fma(_2130, _2288, _1350);
    int _2298 = _2286 ^ _2292;
    if (_2276)
    {
        float _2300 = _2266 * _2222;
        _149 = _2300;
    }
    float _2302 = _149;
    float _2304 = float(_2236);
    float _2306 = _1242 + 0.5;
    float _2308 = float(_2260);
    float _2310 = _2126 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _2312 = ~_2292;
    int _2314 = _2312 + _2298;
    int _2316 = _2314 + 1;
    float _2318 = _2120 * _2120;
    float _2320 = fma(_2130, _2306, _2296);
    float _2322 = fma(_2294, _2304, _2240);
    bool _2324 = !_2262;
    int _2326 = _2324 ? _2316 : (-1);
    float _2328 = -_1354;
    float _2330 = fma(_2310, _2308, _2328);
    float _2332 = _1308 + 0.5;
    float _2334 = in.m_76.x;
    float _2336 = in.m_76.y;
    float _2338 = in.m_76.z;
    float _2340 = fma(_2170, _2170, _2318);
    float _2342 = _2256 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2344 = fma(_2294, _2332, _2322);
    float _2346 = -_221;
    int _2348 = _1216 ? as_type<int>(_2346) : as_type<int>(_221);
    float _2350 = fma(_2192, _2192, _2340);
    bool _2352 = !_1258;
    float _2354 = _2352 ? _221 : as_type<float>(_1246);
    float _2356 = float(_2326);
    bool _2358 = !_1254;
    float _2360 = _2358 ? _221 : as_type<float>(_2348);
    float _2362 = rsqrt(_2350);
    float _2364 = _2354 + (-0.5);
    float _2366 = -_2076;
    float _2368 = fma(_2342, _2356, _2366);
    float _2370 = _2360 + (-0.5);
    float _2372 = -_2310;
    float _2374 = fma(_2372, _2364, _2330);
    float _2376 = -_1402;
    float _2378 = _2376 + 1.0;
    float _2380 = -_2342;
    float _2382 = fma(_2380, _2370, _2368);
    float _2384 = _2252 * (-2.0);
    float _2386 = -_2378;
    float _2388 = fma(_1242, _2386, _2320);
    float _2390 = -_2084;
    float _2392 = fma(_1308, _2390, _2344);
    float _2394 = _2370;
    float _2396 = _2360;
    if (_2254)
    {
        _2394 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2398 = _2394;
    float _2400 = -_2062;
    float _2402 = _2400 + 1.0;
    float _2404 = fma(_2354, _584, _2374);
    float _2406 = fma(_2384, _2334, _2334);
    float _2408 = fma(_1490, _2384, _1490);
    int _2410 = as_type<int>(_2398);
    if (_2254)
    {
        float _2412 = _2398 * 5.0;
        _2410 = as_type<int>(_2412);
    }
    int _2414 = _2410;
    float _2416 = fma(_2360, _2402, _2382);
    float _2418 = _2120 * _2362;
    float _2420 = fma(_1376, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2406);
    float _2422 = _2170 * _2362;
    if (_2254)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7691 = as_type<float>(_2414);
        out.gl_Position.z = _7691;
    }
    float _2424 = -_2418;
    float _2426 = fma(_2424, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2120);
    bool _2428 = !_1572;
    int _2430 = _2428 ? 0 : 1;
    float _2432 = -_2422;
    float _2434 = fma(_2432, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2170);
    out.m_78.x = _2388;
    out.m_78.y = _2404;
    out.m_78.z = _2392;
    out.m_78.w = _2416;
    float _2436 = _2426 * _2426;
    if (_2254)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2438 = -_2418;
    float _2440 = fma(_2438, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1218);
    float _2442 = _2192 * _2362;
    float _2444 = -_2422;
    float _2446 = fma(_2444, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1288);
    float _2448 = fma(_2434, _2434, _2436);
    float _2450 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2452 = _2440 + _2450;
    float _2454 = -_2442;
    float _2456 = fma(_2454, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2192);
    float _2458 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2460 = _2446 + _2458;
    int _2462 = abs(_2430);
    float _2464 = _2452 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2466 = -_2442;
    float _2468 = fma(_2466, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1310);
    float _2470 = fma(_2456, _2456, _2448);
    float _2472 = _2106 * (-2.0);
    float _2474 = fma(_2460, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2464);
    float _2476 = float(_2462);
    float _2478 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2480 = _2468 + _2478;
    float _2482 = float(_1784);
    float _2484 = fma(_2408, _2302, _2420);
    float _2486 = fma(_1548, _2472, _1548);
    float _2488 = fma(_2480, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2474);
    float _2490 = fma(_2472, _2336, _2336);
    float _2492 = _2476 * _2482;
    float _2494 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _2496 = _2494 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _2498 = in.m_68.x;
    float _2500 = in.m_68.y;
    bool _2502 = _2488 >= 0.0;
    float _2504 = _2492 * (-2.0);
    float _2506 = fma(_1384, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2490);
    float _2508 = fma(_2496, _1326, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _2510 = fma(_1926, _1852, _2002);
    float _2512 = fma(_2504, _2338, _2338);
    float _2514 = fma(_2486, _2302, _2506);
    float _2516 = fma(_1502, _2504, _1502);
    float _2518 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _2520 = _2518 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _2522 = _2484 * 0.15915493667125701904296875;
    float _2524 = _2514 * 0.15915493667125701904296875;
    float _2526 = fma(_2508, _1766, _2510);
    float _2528 = fma(_2520, _1326, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _2530 = _2514;
    float _2532 = _2468;
    if (_2502)
    {
        _2530 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2534 = _2530;
    float _2536 = sqrt(_2470);
    float _2538 = fma(_1388, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2512);
    float _2540 = fma(_1732, (*spvDescriptorSet0.vp_c9)._m0[147].y, _2526);
    int _2542 = as_type<int>(_2534);
    if (_2502)
    {
        out.m_61.x = 0.0;
    }
    if (_2502)
    {
        float _2544 = _2534 * 5.0;
        _2542 = as_type<int>(_2544);
    }
    int _2546 = _2542;
    float _2548 = fma(_2516, _2302, _2538);
    float _2550 = fma(_1898, _1852, _2000);
    float _2552 = _2522 * 6.283185482025146484375;
    float _2554 = sin(_2552);
    float _2556 = _2540 * _2500;
    float _2558 = _2550;
    if (_2502)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7939 = as_type<float>(_2546);
        out.gl_Position.z = _7939;
    }
    float _2560 = _2548 * 0.15915493667125701904296875;
    float _2562 = _2522 * 6.283185482025146484375;
    float _2564 = cos(_2562);
    float _2566 = _2524 * 6.283185482025146484375;
    float _2568 = sin(_2566);
    float _2570 = _2524 * 6.283185482025146484375;
    float _2572 = cos(_2570);
    if (_2502)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2574 = _2560 * 6.283185482025146484375;
    float _2576 = cos(_2574);
    float _2578 = fma(_2528, _1766, _2550);
    float _2580 = _2362 * _2536;
    float _2582 = _2556 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2584 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _221);
    float _2586 = fma(_1732, (*spvDescriptorSet0.vp_c9)._m0[147].x, _2578);
    float _2588 = _2564 * _2572;
    float _2590 = _2580 * _2582;
    float _2592 = _2560 * 6.283185482025146484375;
    float _2594 = sin(_2592);
    float _2596 = _2586 * _2498;
    float _2598 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _217);
    float _2600 = _2584 * _2590;
    float _2602 = _2554 * _2568;
    float _2604 = _2596 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2606 = _2554 * _2572;
    float _2608 = _2564 * _2568;
    float _2610 = _2564 * _2576;
    float _2612 = _2580 * _2604;
    float _2614 = _2554 * _2576;
    float _2616 = _2572 * _2576;
    float _2618 = _2610 * _2600;
    float _2620 = _2598 * _2612;
    float _2622 = _2568 * _2576;
    float _2624 = _2580 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2626 = _2624 * 0.5;
    float _2628 = fma(_2594, _2588, _2602);
    float _2630 = -_2606;
    float _2632 = fma(_2594, _2608, _2630);
    float _2634 = -_2600;
    float _2636 = _2594 * _2634;
    float _2638 = _2614 * _2600;
    float _2640 = fma(_2628, _2620, _2618);
    float _2642 = -_2608;
    float _2644 = fma(_2594, _2606, _2642);
    float _2646 = fma(_2616, _2620, _2636);
    float _2648 = fma(_2594, _2602, _2588);
    float _2650 = fma(_2632, _2626, _2640);
    float _2652 = fma(_2644, _2620, _2638);
    float _2654 = fma(_2622, _2626, _2646);
    float _2656 = _2628 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2658 = _2650 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2660 = _2650 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2662 = fma(_2648, _2626, _2652);
    float _2664 = _221 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2666 = fma(_2654, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2658);
    float _2668 = fma(_2654, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2660);
    float _2670 = _2610 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2672 = fma(_2662, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2666);
    float _2674 = fma(_2662, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2668);
    float _2676 = _2672 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2678 = _2674 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2680 = _1288 + _2676;
    float _2682 = _1310 + _2678;
    float _2684 = _2628 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2686 = _2628 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2688 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2690 = _2680 + _2688;
    float _2692 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2694 = _2682 + _2692;
    float _2696 = _2650 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2698 = fma(_2616, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2684);
    float _2700 = _2690 * _2690;
    float _2702 = _2694 * _2694;
    float _2704 = fma(_2616, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2686);
    float _2706 = fma(_2616, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2656);
    float _2708 = fma(_2664, _2664, 1.0);
    float _2710 = _2700 + _2702;
    float _2712 = fma(_2654, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2696);
    float _2714 = _2610 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2716 = _2610 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2718 = sqrt(_2710);
    float _2720 = fma(_2662, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2712);
    float _2722 = -_2594;
    float _2724 = fma(_2722, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2714);
    float _2726 = -_2594;
    float _2728 = fma(_2726, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2716);
    float _2730 = -_2594;
    float _2732 = fma(_2730, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2670);
    float _2734 = _2720 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2736 = _2632 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2738 = _2632 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2740 = rsqrt(_2708);
    float _2742 = _2632 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2744 = _1218 + _2734;
    float _2746 = fma(_2622, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2736);
    float _2748 = fma(_2622, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2738);
    float _2750 = fma(_2622, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2742);
    bool _2752 = _2718 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2754 = _2742;
    float _2756 = _2736;
    float _2758 = _2622;
    float _2760 = _2738;
    float _2762 = _2734;
    float _2764 = _2698;
    if (!_2752)
    {
        _2754 = _2702;
    }
    float _2766 = _2754;
    float _2768 = _2766;
    if (!_2752)
    {
        _2756 = _2700;
    }
    float _2770 = _2756;
    float _2772 = _2770;
    if (!_2752)
    {
        _2758 = _2680;
    }
    float _2774 = _2758;
    float _2776 = _2774;
    if (!_2752)
    {
        _2760 = _2682;
    }
    float _2778 = _2760;
    float _2780 = _2778;
    if (!_2752)
    {
        _2762 = _2744;
    }
    float _2782 = _2762;
    bool _2784 = !_2752;
    float _2786 = _2782;
    if (!_2784)
    {
        float _2788 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2790 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2792 = _2718 + _2790;
        float _2794 = rsqrt(_2710);
        float _2796 = _2792 * _2788;
        float _2798 = _2744 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2800 = _2796 * 0.15915493667125701904296875;
        float _2802 = _2800 * 6.283185482025146484375;
        float _2804 = sin(_2802);
        float _2806 = _2800 * 6.283185482025146484375;
        float _2808 = cos(_2806);
        float _2810 = fma(_2804, _2798, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2812 = _2794 * _2810;
        float _2814 = _2808 + (-1.0);
        float _2816 = fma(_2690, _2812, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2818 = fma(_2694, _2812, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2820 = _2814 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2822 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2824 = _2816 + _2822;
        float _2826 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2828 = _2818 + _2826;
        float _2830 = fma(_2744, _2808, _2820);
        float _2832 = _2824 * _2824;
        float _2834 = _2828 * _2828;
        _2786 = _2830;
        _2772 = _2832;
        _2768 = _2834;
        _2776 = _2816;
        _2780 = _2818;
    }
    float _2836 = _2786;
    float _2838 = _2772;
    float _2840 = _2768;
    float _2842 = _2776;
    float _2844 = _2780;
    float _2846 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2848 = _2836 + _2846;
    float _2850 = fma(_2614, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2724);
    float _2852 = fma(_2614, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2728);
    float _2854 = fma(_2648, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2748);
    float _2856 = fma(_2848, _2848, _2838);
    float _2858 = fma(_2614, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2732);
    float _2860 = fma(_2648, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2746);
    float _2862 = fma(_2648, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2750);
    float _2864 = _2856 + _2840;
    float _2866 = _2664 * _2740;
    float _2868 = fma(_2644, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2698);
    float _2870 = fma(_2644, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2704);
    float _2872 = _217 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2874 = _2664 * _2852;
    float _2876 = _2664 * _2850;
    float _2878 = fma(_2644, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2706);
    float _2880 = _2664 * _2858;
    float _2882 = -_2860;
    float _2884 = _2866 * _2882;
    float _2886 = -_2854;
    float _2888 = _2866 * _2886;
    float _2890 = -_2862;
    float _2892 = _2866 * _2890;
    float _2894 = sqrt(_2864);
    float _2896 = fma(_2872, _2868, _2874);
    float _2898 = fma(_2872, _2870, _2876);
    float _2900 = fma(_2872, _2878, _2880);
    float _2902 = fma(_2740, _2852, _2884);
    float _2904 = fma(_2740, _2850, _2888);
    float _2906 = fma(_2740, _2858, _2892);
    float _2908 = _2860 + _2896;
    float _2910 = _2854 + _2898;
    float _2912 = _2862 + _2900;
    out.m_80.x = _2868;
    out.m_80.y = _2870;
    out.m_80.z = _2878;
    out.m_82.x = _2902;
    out.m_82.y = _2904;
    out.m_82.z = _2906;
    bool _2914 = _2894 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2916 = isnan(_2894);
    bool _2918 = _2914 || _2916;
    bool _2920 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2922 = _2918 || _2920;
    out.m_84.x = _2908;
    out.m_84.y = _2910;
    out.m_84.z = _2912;
    if (!_2922)
    {
        _2764 = 1.0;
    }
    float _2924 = _2764;
    bool _2926 = !_2922;
    float _2928 = _2924;
    if (!_2926)
    {
        bool _2930 = _2894 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2932 = isnan(_2894);
        bool _2934 = _2930 || _2932;
        bool _2936 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2938 = _2934 || _2936;
        if (!_2938)
        {
            float _2940 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2942 = _2894 + _2940;
            float _2944 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2946 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2944;
            float _2948 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2950 = _2948 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2952 = 1.0 / _2946;
            float _2954 = _2942 * _2952;
            float _2956 = fma(_2954, _2950, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2928 = _2956;
            _2958 = true;
        }
        else
        {
            bool _2960 = _2894 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2962 = isnan(_2894);
            bool _2964 = _2960 || _2962;
            bool _2966 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2968 = _2964 || _2966;
            if (!_2968)
            {
                float _2970 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2972 = _2894 + _2970;
                float _2974 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2976 = _2974 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2978 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2980 = _2978 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2982 = 1.0 / _2976;
                float _2984 = _2972 * _2982;
                float _2986 = fma(_2984, _2980, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2928 = _2986;
                _2958 = true;
            }
            else
            {
                _2928 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2958 = false;
    float _2988 = _2928;
    float _2990 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2992 = _2836 + _2990;
    float _2994 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2996 = _2842 + _2994;
    float _2998 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _3000 = _2844 + _2998;
    float _3002 = _2440 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3004 = fma(_2992, _2988, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _3006 = fma(_2996, _2988, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _3008 = fma(_3000, _2988, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _3010 = fma(_2446, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3002);
    float _3012 = -_2418;
    float _3014 = fma(_3012, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3004);
    float _3016 = -_2422;
    float _3018 = fma(_3016, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3006);
    float _3020 = -_2442;
    float _3022 = fma(_3020, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3008);
    float _3024 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3026 = _3014 + _3024;
    float _3028 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3030 = _3018 + _3028;
    float _3032 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3034 = _3022 + _3032;
    float _3036 = _3026 * _3026;
    float _3038 = fma(_3030, _3030, _3036);
    float _3040 = fma(_2446, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _3042 = fma(_3034, _3034, _3038);
    float _3044 = fma(_2468, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3010);
    float _3046 = _2440 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3048 = rsqrt(_3042);
    float _3050 = _3044 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3052 = fma(_2446, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3046);
    float _3054 = fma(_2468, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3052);
    float _3056 = 1.0 / _3050;
    float _3058 = _3054 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3060 = _3058 + _3050;
    float _3062 = _3048 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3064 = sqrt(_3042);
    float _3066 = _3030 * _3062;
    float _3068 = _3034 * _3062;
    float _3070 = _3066 * _3066;
    float _3072 = _3068 * _3068;
    float _3074 = _3060 * _3056;
    float _3076 = _3074 * 0.5;
    float _3078 = _3070 + _3072;
    float _3080 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3082 = fma(_3076, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3080);
    float _3084 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _3086 = sqrt(_3078);
    float _3088 = _2440 + _3084;
    float _3090 = _3088 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _3092 = 1.0 / _3082;
    float _3094 = _3088 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _3096 = fma(_2446, (*spvDescriptorSet0.vp_c15)._m0[126].x, _3090);
    float _3098 = fma(_2446, (*spvDescriptorSet0.vp_c15)._m0[127].x, _3094);
    float _3100 = fma(_2468, (*spvDescriptorSet0.vp_c15)._m0[126].z, _3096);
    bool _3102 = _3086 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3104 = fma(_2468, (*spvDescriptorSet0.vp_c15)._m0[127].z, _3098);
    float _3106 = floor(_3040);
    float _3108 = _3100 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _3110 = _3104 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _3112 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3114 = _3092 * _3112;
    float _3116 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3118 = _3086 + _3116;
    float _3120 = trunc(_3108);
    int _3122 = int(_3120);
    float _3124 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    bool _3126 = _3114 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _3128 = _3114 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _3130 = precise::max(0.0, _3124);
    float _3132 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    int _3134 = 2;
    float _3136 = _3062;
    float _3138 = _3118;
    float _3140 = _3078;
    float _3142 = _3066;
    float _3144 = _3070;
    int _3146 = as_type<int>(_3072);
    if (_3102)
    {
        float _3148 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3132 = _3148;
    }
    float _3150 = _3132;
    float _3152 = -_3106;
    float _3154 = _3040 + _3152;
    float _3156 = -_3062;
    float _3158 = -_3130;
    float _3160 = fma(_3026, _3156, _3158);
    float _3162 = _3160;
    if (!_3126)
    {
        _3134 = 1;
    }
    int _3164 = _3134;
    float _3166 = trunc(_3110);
    int _3168 = int(_3166);
    int _3170 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _3172 = _3122 + _3170;
    int _3174 = _3172 + 1;
    int _3176 = _3164;
    if (_3102)
    {
        float _3178 = _3160 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3136 = _3178;
    }
    float _3180 = _3136;
    if (_3102)
    {
        float _3182 = _3118 * _3150;
        _3138 = _3182;
    }
    float _3184 = _3138;
    if (_3102)
    {
        float _3186 = rsqrt(_3078);
        _3140 = _3186;
    }
    float _3188 = _3140;
    float _3190 = _3188;
    if (_3102)
    {
        float _3192 = _3184 * 0.15915493667125701904296875;
        _2396 = _3192;
    }
    float _3194 = _2396;
    bool _3196 = !_3126;
    int _3198 = _3196 ? 0 : 1;
    if (!_3128)
    {
        _3176 = _3198;
    }
    int _3200 = _3176;
    float _3202 = _3104;
    float _3204 = as_type<float>(_3200);
    if (_3102)
    {
        float _3206 = _3194 * 6.283185482025146484375;
        float _3208 = sin(_3206);
        _3202 = _3208;
    }
    float _3210 = _3202;
    int _3212 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _3214 = _3168 + _3212;
    int _3216 = _3214 + 1;
    int _3218 = _3200 << 6;
    bool _3220 = _3174 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _3222 = _3218 + 96;
    uint _3224 = uint(int(uint(_3222) >> uint(2)));
    uint _3226 = uint(int(uint(int(_3224)) >> uint(2)));
    int _3228 = int(_3224) & 3;
    float _3230 = (*spvDescriptorSet0.vp_c15)._m0[int(_3226)][_3228];
    int _3232 = int(_3224) + 1;
    uint _3234 = uint(int(uint(_3232) >> uint(2)));
    int _3236 = _3232 & 3;
    float _3238 = (*spvDescriptorSet0.vp_c15)._m0[int(_3234)][_3236];
    int _3240 = _3174 | _3216;
    float _3242 = _3194;
    float _3244 = as_type<float>(_3240);
    if (_3102)
    {
        float _3246 = _3194 * 6.283185482025146484375;
        float _3248 = cos(_3246);
        _3242 = _3248;
    }
    float _3250 = _3242;
    bool _3252 = _3240 < 0;
    bool _3254 = _3252 || _3220;
    int _3256 = _3218 + 48;
    uint _3258 = uint(int(uint(_3256) >> uint(2)));
    uint _3260 = uint(int(uint(int(_3258)) >> uint(2)));
    int _3262 = int(_3258) & 3;
    float _3264 = (*spvDescriptorSet0.vp_c15)._m0[int(_3260)][_3262];
    int _3266 = int(_3258) + 1;
    uint _3268 = uint(int(uint(_3266) >> uint(2)));
    int _3270 = _3266 & 3;
    float _3272 = (*spvDescriptorSet0.vp_c15)._m0[int(_3268)][_3270];
    if (_3102)
    {
        float _3274 = fma(_3210, _3180, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3244 = _3274;
    }
    float _3276 = _3244;
    float _3278 = _3014 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3280 = fma(_2468, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    bool _3282 = _3216 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _3284 = _3282 || _3254;
    if (_3102)
    {
        float _3286 = _3188 * _3276;
        _2558 = _3286;
    }
    float _3288 = _2558;
    float _3290 = fma(_3018, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3278);
    float _3292 = floor(_3280);
    int _3294 = _3218 + 104;
    uint _3296 = uint(int(uint(_3294) >> uint(2)));
    uint _3298 = uint(int(uint(int(_3296)) >> uint(2)));
    int _3300 = int(_3296) & 3;
    float _3302 = (*spvDescriptorSet0.vp_c15)._m0[int(_3298)][_3300];
    int _3304 = int(_3296) + 1;
    uint _3306 = uint(int(uint(_3304) >> uint(2)));
    int _3308 = _3304 & 3;
    float _3310 = (*spvDescriptorSet0.vp_c15)._m0[int(_3306)][_3308];
    if (_3102)
    {
        float _3312 = _3066 * _3288;
        _3142 = _3312;
    }
    float _3314 = _3142;
    float _3316 = _3250;
    if (_3102)
    {
        float _3318 = _3250 + (-1.0);
        _3190 = _3318;
    }
    float _3320 = _3190;
    float _3322 = fma(_3022, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3290);
    float _3324 = _3320;
    if (_3102)
    {
        float _3326 = _3314 * _3314;
        _3144 = _3326;
    }
    float _3328 = _3144;
    if (_3102)
    {
        float _3330 = _3320 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2280 = _3330;
    }
    float _3332 = _2280;
    if (!_3102)
    {
        _3324 = _3068;
    }
    float _3334 = _3324;
    int _3336 = _3218 + 64;
    uint _3338 = uint(int(uint(_3336) >> uint(2)));
    uint _3340 = uint(int(uint(int(_3338)) >> uint(2)));
    int _3342 = int(_3338) & 3;
    float _3344 = (*spvDescriptorSet0.vp_c15)._m0[int(_3340)][_3342];
    int _3346 = int(_3338) + 1;
    uint _3348 = uint(int(uint(_3346) >> uint(2)));
    int _3350 = _3346 & 3;
    float _3352 = (*spvDescriptorSet0.vp_c15)._m0[int(_3348)][_3350];
    float _3354 = _3334;
    if (_3102)
    {
        float _3356 = _3068 * _3288;
        _3354 = _3356;
    }
    float _3358 = _3354;
    if (_3102)
    {
        float _3360 = fma(_3160, _3250, _3332);
        _3162 = _3360;
    }
    float _3362 = _3162;
    if (!_3102)
    {
        _3316 = _3072;
    }
    float _3364 = _3316;
    float _3366 = _2330;
    float _3368 = _3364;
    if (!_3284)
    {
        float _3370 = floor(_3110);
        _3366 = _3370;
    }
    float _3372 = _3366;
    if (_3102)
    {
        float _3374 = _3358 * _3358;
        _3368 = _3374;
    }
    float _3376 = _3368;
    float _3378 = fma(_3362, _3362, _3328);
    if (!_3284)
    {
        int _3380 = _3216 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _3382 = _3380 + _3174;
        _3146 = _3382;
    }
    int _3384 = _3146;
    int _3386 = _3218 + 80;
    uint _3388 = uint(int(uint(_3386) >> uint(2)));
    uint _3390 = uint(int(uint(int(_3388)) >> uint(2)));
    int _3392 = int(_3388) & 3;
    float _3394 = (*spvDescriptorSet0.vp_c15)._m0[int(_3390)][_3392];
    int _3396 = int(_3388) + 1;
    uint _3398 = uint(int(uint(_3396) >> uint(2)));
    int _3400 = _3396 & 3;
    float _3402 = (*spvDescriptorSet0.vp_c15)._m0[int(_3398)][_3400];
    float _3404 = _3378 + _3376;
    float _3406 = _3322 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3408 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3410 = -_3292;
    float _3412 = _3280 + _3410;
    float _3414 = _3406 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    int _3416 = _3218 + 56;
    uint _3418 = uint(int(uint(_3416) >> uint(2)));
    uint _3420 = uint(int(uint(int(_3418)) >> uint(2)));
    int _3422 = int(_3418) & 3;
    float _3424 = (*spvDescriptorSet0.vp_c15)._m0[int(_3420)][_3422];
    int _3426 = int(_3418) + 1;
    uint _3428 = uint(int(uint(_3426) >> uint(2)));
    int _3430 = _3426 & 3;
    float _3432 = (*spvDescriptorSet0.vp_c15)._m0[int(_3428)][_3430];
    float _3434 = -_3414;
    float _3436 = fma(_3434, _3408, 1.0);
    int _3438 = _3218 + 88;
    uint _3440 = uint(int(uint(_3438) >> uint(2)));
    uint _3442 = uint(int(uint(int(_3440)) >> uint(2)));
    int _3444 = int(_3440) & 3;
    float _3446 = (*spvDescriptorSet0.vp_c15)._m0[int(_3442)][_3444];
    int _3448 = int(_3440) + 1;
    uint _3450 = uint(int(uint(_3448) >> uint(2)));
    int _3452 = _3448 & 3;
    float _3454 = (*spvDescriptorSet0.vp_c15)._m0[int(_3450)][_3452];
    float _3456 = _3088 * _3238;
    float _3458 = log2(_3436);
    float _3460 = fma(_2446, _3230, _3456);
    int _3462 = _3218 + 72;
    uint _3464 = uint(int(uint(_3462) >> uint(2)));
    uint _3466 = uint(int(uint(int(_3464)) >> uint(2)));
    int _3468 = int(_3464) & 3;
    float _3470 = (*spvDescriptorSet0.vp_c15)._m0[int(_3466)][_3468];
    int _3472 = int(_3464) + 1;
    uint _3474 = uint(int(uint(_3472) >> uint(2)));
    int _3476 = _3472 & 3;
    float _3478 = (*spvDescriptorSet0.vp_c15)._m0[int(_3474)][_3476];
    float _3480 = _3088 * _3272;
    float _3482 = rsqrt(_3404);
    float _3484 = fma(_2446, _3264, _3480);
    int _3486 = as_type<int>(_3480);
    int _3488 = as_type<int>(_3230);
    if (!_3284)
    {
        int _3490 = _3384 << 2;
        _3486 = _3490;
    }
    int _3492 = _3486;
    float _3494 = fma(_2468, _3302, _3460);
    int _3496 = _3492;
    if (!_3284)
    {
        int _3498 = 12 & _3492;
        _3496 = _3498;
    }
    int _3500 = _3496;
    float _3502 = _3494 + _3310;
    float _3504 = _3088 * _3352;
    float _3506 = _3352;
    int _3508 = as_type<int>(_3402);
    if (!_3284)
    {
        float _3510 = -_3372;
        float _3512 = _3110 + _3510;
        _3506 = _3512;
    }
    float _3514 = _3506;
    float _3516 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3518 = fma(_3064, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3516);
    float _3520 = precise::clamp(_3518, 0.0, 1.0);
    float _3522 = 1.0 / _3502;
    float _3524 = fma(_2446, _3344, _3504);
    float _3526 = _3482 * _3314;
    float _3528 = _3482 * _3362;
    float _3530 = _3482 * _3358;
    float _3532 = _3088 * _3402;
    float _3534 = _3526 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    if (!_3284)
    {
        uint _3536 = uint(int(uint(_3384) >> uint(2)));
        _3508 = int(_3536);
    }
    int _3538 = _3508;
    float _3540 = fma(_2446, _3394, _3532);
    float _3542 = -_3520;
    float _3544 = _3542 + 1.0;
    if (!_3284)
    {
        int _3546 = _3538 << 4;
        int _3548 = _3546 + _3500;
        _3488 = _3548;
    }
    int _3550 = _3488;
    float _3552 = fma(_2468, _3424, _3484);
    float _3554 = abs(_3544);
    float _3556 = log2(_3554);
    float _3558 = _3552 + _3432;
    float _3560 = _3014 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3562 = fma(_2468, _3446, _3540);
    float _3564 = -_3534;
    float _3566 = fma(_3528, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3564);
    float _3568 = _3014 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3570 = fma(_3018, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3560);
    float _3572 = -_3530;
    float _3574 = fma(_3572, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3566);
    float _3576 = fma(_3018, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3568);
    float _3578 = _3558 * _3522;
    float _3580 = fma(_2468, _3470, _3524);
    float _3582 = fma(_3574, -0.5, 0.5);
    float _3584 = fma(_3574, 0.5, 0.5);
    float _3586 = fma(_3022, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3576);
    float _3588 = _3580 + _3478;
    float _3590 = _3014 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3592 = fma(_3022, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3570);
    bool _3594 = _3578 >= 0.0;
    float _3596 = _3588 * _3522;
    float _3598 = fma(_3018, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3590);
    float _3600 = _3592 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _3602 = _3578 <= 1.0;
    bool _3604 = _3602 && _3594;
    float _3606 = _3556 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3608 = fma(_3022, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3598);
    float _3610 = _3600 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _3612 = _3596 >= 0.0;
    bool _3614 = _3612 && _3604;
    float _3616 = exp2(_3606);
    float _3618 = _3608 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3620 = _3524;
    if (!_3284)
    {
        int _3622 = _3550 + 400;
        uint _3624 = uint(int(uint(_3622) >> uint(2)));
        uint _3626 = uint(int(uint(int(_3624)) >> uint(2)));
        int _3628 = int(_3624) & 3;
        float _3630 = (*spvDescriptorSet0.vp_c15)._m0[int(_3626)][_3628];
        _3620 = _3630;
    }
    float _3632 = _3620;
    bool _3634 = _3596 <= 1.0;
    bool _3636 = _3634 && _3614;
    float _3638 = _3586 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3640 = fma(_3618, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3610);
    float _3642 = _3586;
    if (!_3284)
    {
        float _3644 = floor(_3108);
        _3642 = _3644;
    }
    float _3646 = _3642;
    float _3648 = fma(_3406, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3640);
    float _3650 = fma(_3584, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3652 = _3600 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3654 = _3562 + _3454;
    float _3656 = fma(_3638, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3648);
    float _3658 = fma(_3584, _3650, -0.212114393711090087890625);
    float _3660 = _3528 + 1.0;
    float _3662 = _3600 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3664 = sqrt(_3582);
    float _3666 = fma(_3584, _3658, 1.570728778839111328125);
    float _3668 = fma(_3618, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3652);
    float _3670 = -_3528;
    float _3672 = fma(_3616, _3660, _3670);
    if (_3636)
    {
        float _3674 = float(_3200);
        _3204 = _3674;
    }
    float _3676 = _3204;
    float _3678 = fma(_3618, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3662);
    float _3680 = fma(_3406, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3668);
    float2 _9864 = float2(_3154, _3412);
    float _3682 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_9864, float2(0.0), isnan(_9864)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_9864, float2(0.0), isnan(_9864)), level(0.0)).x;
    float _3684 = 1.0 / _3656;
    float _3686 = fma(_3406, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3678);
    float _3688 = _3458 * 0.693147182464599609375;
    float _3690 = _3654 * _3522;
    float _3692 = fma(_3672, 0.5, 0.5);
    float _3694 = fma(_3638, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3686);
    float _3696 = fma(_3638, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3680);
    float _3698 = _3680;
    if (!_3284)
    {
        float _3700 = -_3646;
        float _3702 = _3108 + _3700;
        _3698 = _3702;
    }
    float _3704 = _3698;
    float _3706 = _3668;
    if (_3636)
    {
        float _3708 = rint(_3676);
        float _3710 = precise::max(_3708, 0.0);
        uint _3712 = uint(_3710);
        uint _3714 = clamp(_3712, 0u, 65535u);
        _3706 = as_type<float>(_3714);
    }
    float _3716 = _3706;
    float _3718 = _3664 * 0.636619746685028076171875;
    float _3720 = _3688 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3722 = -_3666;
    float _3724 = fma(_3718, _3722, 1.0);
    float _3726 = _3694 * _3684;
    float _3728 = _3696 * _3684;
    float _3730 = fma(_3726, 0.5, 0.5);
    float _3732 = fma(_3728, -0.5, 0.5);
    float _3734 = _3716;
    if (_3636)
    {
        float3 _9955 = float3(_3578, _3596, float(as_type<int>(_3716)));
        float3 _9959 = select(_9955, float3(0.0), isnan(_9955));
        float _3736 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _9959.xy, uint(rint(_9959.z)), _3690, level(0.0));
        _3734 = _3736;
    }
    float _3738 = _3734;
    float3 _9969 = float3(_3730, _3732, _3720);
    float _3740 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9969, float3(0.0), isnan(_9969)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9969, float3(0.0), isnan(_9969)), level(0.0)).x;
    float3 _9978 = float3(_3730, _3732, _3720);
    float4 _3743 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9978, float3(0.0), isnan(_9978)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9978, float3(0.0), isnan(_9978)), level(0.0)).xyzw;
    float _3745 = _3743.x;
    float _3747 = _3743.y;
    float _3749 = _3743.z;
    float _3751 = _3743.w;
    float2 _9994 = float2(_3724, _3692);
    float3 _3755 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9994, float2(0.0), isnan(_9994)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9994, float2(0.0), isnan(_9994)), level(0.0)).xyz;
    float _3757 = _3755.x;
    float _3759 = _3755.y;
    float _3761 = _3755.z;
    float _3763 = _3688;
    if (!_3284)
    {
        float _3765 = rint(_3632);
        float _3767 = precise::max(_3765, 0.0);
        uint _3769 = uint(_3767);
        uint _3771 = clamp(_3769, 0u, 65535u);
        _3763 = as_type<float>(_3771);
    }
    float _3773 = _3763;
    float _3775 = _3773;
    if (!_3284)
    {
        float3 _10031 = float3(_3704, _3514, float(as_type<int>(_3773)));
        float3 _10033 = select(_10031, float3(0.0), isnan(_10031));
        float _3777 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _10033.xy, uint(rint(_10033.z)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _10033.xy, uint(rint(_10033.z)), level(0.0)).x;
        _3775 = _3777;
    }
    float _3779 = _3775;
    float _3781 = abs(_3114);
    float _3783 = log2(_3781);
    float _3785 = _3600 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3787 = fma(_3618, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3785);
    float _3789 = fma(_3406, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3787);
    bool _3791 = _3114 <= 8000.0;
    bool _3793 = isnan(_3114);
    bool _3795 = _3791 || _3793;
    bool _3797 = isnan(8000.0);
    bool _3799 = _3795 || _3797;
    float _3801 = float(_3799);
    float _3803 = _3783 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3805 = exp2(_3803);
    float _3807 = _3556 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3809 = exp2(_3807);
    float _3811 = fma(_3805, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3813 = precise::clamp(_3811, 0.0, 1.0);
    float _3815 = fma(_3813, -2.0, 3.0);
    float _3817 = _3813 * _3813;
    float _3819 = fma(_3638, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3789);
    float _3821 = _3817 * _3815;
    float _3823 = _3819 + _3656;
    float _3825 = _3823 * 0.5;
    float _3827 = -_3821;
    float _3829 = _3827 + 1.0;
    out.gl_Position.x = _3694;
    out.gl_Position.y = _3696;
    out.gl_Position.z = _3819;
    out.gl_Position.w = _3656;
    float _3831 = fma(_3829, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3821);
    out.m_86.z = _3825;
    out.m_86.w = _3656;
    float _3833 = -_3809;
    float _3835 = _3833 + 1.0;
    float _3837 = _3801 * _3831;
    float _3839 = _3831;
    float _3841 = _3819;
    float _3843 = _3694;
    if (!_3636)
    {
        _3839 = 1.0;
    }
    float _3845 = _3839;
    float _3847 = _3835 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3849 = _3837 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3851 = -_3682;
    float _3853 = _3851 + 1.0;
    float _3855 = _3853 * _3849;
    float _3857 = precise::clamp(_3855, 0.0, 1.0);
    float _3859 = _3849;
    float _3861 = _3845;
    if (_3284)
    {
        _3859 = 1.0;
    }
    float _3863 = _3859;
    float _3865 = _3863;
    if (_3636)
    {
        bool _3867 = _3738 >= _3690;
        bool _3869 = isnan(_3738);
        bool _3871 = _3867 || _3869;
        bool _3873 = isnan(_3690);
        bool _3875 = _3871 || _3873;
        float _3877 = float(_3875);
        _3861 = _3877;
    }
    float _3879 = _3861;
    if (!_3284)
    {
        int _3881 = _3384 << 4;
        int _3883 = _3881 + 2048;
        uint _3885 = uint(int(uint(_3883) >> uint(2)));
        uint _3887 = uint(int(uint(int(_3885)) >> uint(2)));
        int _3889 = int(_3885) & 3;
        float _3891 = (*spvDescriptorSet0.vp_c15)._m0[int(_3887)][_3889];
        int _3893 = int(_3885) + 1;
        uint _3895 = uint(int(uint(_3893) >> uint(2)));
        int _3897 = _3893 & 3;
        float _3899 = (*spvDescriptorSet0.vp_c15)._m0[int(_3895)][_3897];
        int _3901 = _3883 + 8;
        uint _3903 = uint(int(uint(_3901) >> uint(2)));
        uint _3905 = uint(int(uint(int(_3903)) >> uint(2)));
        int _3907 = int(_3903) & 3;
        float _3909 = (*spvDescriptorSet0.vp_c15)._m0[int(_3905)][_3907];
        int _3911 = int(_3903) + 1;
        uint _3913 = uint(int(uint(_3911) >> uint(2)));
        int _3915 = _3911 & 3;
        float _3917 = (*spvDescriptorSet0.vp_c15)._m0[int(_3913)][_3915];
        float _3919 = _3088 * _3899;
        float _3921 = fma(_2446, _3891, _3919);
        float _3923 = fma(_2468, _3909, _3921);
        float _3925 = _3923 + _3917;
        float _3927 = precise::clamp(_3925, 0.0, 1.0);
        float _3929 = -_3927;
        float _3931 = _3929 + _3779;
        float _3933 = fma(_3931, 500.0, 1.5);
        float _3935 = exp2(_3933);
        float _3937 = 0.0 + _3935;
        float _3939 = precise::clamp(_3937, 0.0, 1.0);
        _3865 = _3939;
        _3841 = _3909;
        _3843 = _3891;
    }
    float _3941 = _3865;
    float _3943 = _3841;
    float _3945 = _3843;
    float _3947 = _3879 * _3941;
    float _3949 = _3847 * _3740;
    float _3951 = -_3857;
    float _3953 = fma(_3951, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3955 = -_3847;
    float _3957 = _3955 + 1.0;
    bool _3959 = _3064 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3961 = isnan(_3064);
    bool _3963 = _3959 || _3961;
    bool _3965 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3967 = _3963 || _3965;
    float _3969 = _3751 * _3949;
    float _3971 = -_3947;
    float _3973 = fma(_3971, _3953, 1.0);
    float _3975 = precise::clamp(_3973, 0.0, 1.0);
    float _3977 = _3761 * _3949;
    float _3979 = _3751 * _3957;
    float _3981 = fma(_3757, _3969, _3745);
    float _3983 = fma(_3759, _3969, _3747);
    float _3985 = _3975 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3987 = fma(_3751, _3977, _3749);
    out.m_88.x = _3985;
    float _3989 = _3943;
    float _3991 = _3945;
    float _3993 = _3969;
    float _3995 = _3957;
    float _3997 = _3975;
    if (!_3967)
    {
        _3989 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3999 = _3989;
    float _4001 = _3999;
    float _4003 = _3999;
    if (!_3967)
    {
        _2532 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4005 = _2532;
    out.m_90.x = _3981;
    out.m_90.y = _3983;
    out.m_90.z = _3987;
    out.m_90.w = _3979;
    float _4007 = _4005;
    float _4009 = _4005;
    if (!_3967)
    {
        _3991 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4011 = _3991;
    float _4013 = _4011;
    float _4015 = _4011;
    if (!_3967)
    {
        _3993 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4017 = _3993;
    float _4019 = _4017;
    float _4021 = _4017;
    if (!_3967)
    {
        _3995 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4023 = _3995;
    float _4025 = _4023;
    float _4027 = _4023;
    if (!_3967)
    {
        _3997 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4029 = _3997;
    bool _4031 = !_3967;
    float _4033 = _4029;
    float _4035 = _4029;
    if (!_4031)
    {
        bool _4037 = _3064 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4039 = isnan(_3064);
        bool _4041 = _4037 || _4039;
        bool _4043 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4045 = _4041 || _4043;
        if (!_4045)
        {
            float _4047 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4049 = _3064 + _4047;
            float _4051 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4053 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4051;
            float _4055 = 1.0 / _4053;
            float _4057 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4059 = _4057 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4061 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4063 = _4061 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4065 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4067 = _4065 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4069 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4071 = _4069 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4073 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4075 = _4073 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4077 = _4049 * _4055;
            float _4079 = precise::clamp(_4077, 0.0, 1.0);
            float _4081 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4083 = _4081 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4085 = fma(_4079, _4059, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4087 = fma(_4079, _4083, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4089 = fma(_4079, _4063, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4091 = fma(_4079, _4067, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4093 = fma(_4079, _4071, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4095 = fma(_4079, _4075, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4009 = _4087;
            _4027 = _4093;
            _4003 = _4085;
            _4021 = _4091;
            _4015 = _4089;
            _4035 = _4095;
            _4097 = true;
        }
        else
        {
            bool _4099 = _3064 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4101 = isnan(_3064);
            bool _4103 = _4099 || _4101;
            bool _4105 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4107 = _4103 || _4105;
            if (!_4107)
            {
                _4001 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4109 = _4001;
            _4003 = _4109;
            if (!_4107)
            {
                _4007 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4111 = _4007;
            _4009 = _4111;
            if (!_4107)
            {
                _4013 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4113 = _4013;
            _4015 = _4113;
            if (!_4107)
            {
                _4019 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4115 = _4019;
            _4021 = _4115;
            if (!_4107)
            {
                _4025 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4117 = _4025;
            _4027 = _4117;
            if (!_4107)
            {
                _4033 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4119 = _4033;
            bool _4121 = !_4107;
            _4035 = _4119;
            if (!_4121)
            {
                bool _4123 = _3064 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4125 = isnan(_3064);
                bool _4127 = _4123 || _4125;
                bool _4129 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4131 = _4127 || _4129;
                if (!_4131)
                {
                    float _4133 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4135 = _3064 + _4133;
                    float _4137 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4139 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4137;
                    float _4141 = 1.0 / _4139;
                    float _4143 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4145 = _4143 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4147 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4149 = _4147 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4151 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4153 = _4151 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4155 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4157 = _4155 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4159 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4161 = _4159 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4163 = _4135 * _4141;
                    float _4165 = precise::clamp(_4163, 0.0, 1.0);
                    float _4167 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4169 = _4167 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4171 = fma(_4165, _4145, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4173 = fma(_4165, _4169, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4175 = fma(_4165, _4149, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4177 = fma(_4165, _4153, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4179 = fma(_4165, _4157, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4181 = fma(_4165, _4161, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4009 = _4173;
                    _4027 = _4179;
                    _4003 = _4171;
                    _4021 = _4177;
                    _4015 = _4175;
                    _4035 = _4181;
                    _4097 = true;
                }
                else
                {
                    _4009 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4027 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4003 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4021 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4015 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4035 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4097 = false;
    float _4183 = _4009;
    float _4185 = _4027;
    float _4187 = _4003;
    float _4189 = _4021;
    float _4191 = _4015;
    float _4193 = _4035;
    float _4195 = fma(_2910, -0.5, 0.5);
    float _4197 = precise::clamp(_4195, 0.0, 1.0);
    float _4199 = -_4183;
    float _4201 = _4199 + _4185;
    float _4203 = -_4187;
    float _4205 = _4203 + _4189;
    float _4207 = -_4191;
    float _4209 = _4207 + _4193;
    bool _4211 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4213 = fma(_4197, _4201, _4183);
    float _4215 = fma(_4197, _4205, _4187);
    float _4217 = fma(_4197, _4209, _4191);
    float _4219 = _4213 * 0.586610972881317138671875;
    out.m_61.x = 1.0;
    float _4221 = fma(_4215, 0.298911988735198974609375, _4219);
    float _4223 = fma(_4217, 0.114477999508380889892578125, _4221);
    out.m_92.x = 0.0;
    float _4225 = -_4223;
    float _4227 = _4215 + _4225;
    float _4229 = -_4223;
    float _4231 = _4213 + _4229;
    float _4233 = -_4223;
    float _4235 = _4217 + _4233;
    float _4237 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4239 = fma(_4227, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4223);
    float _4241 = fma(_4231, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4223);
    float _4243 = fma(_4235, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4223);
    out.m_88.w = _4237;
    out.m_94.x = _4239;
    out.m_94.y = _4241;
    out.m_94.z = _4243;
    if (!_4211)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _4245 = -_3014;
    float _4247 = _4245 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _4249 = -_3018;
    float _4251 = _4249 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _4253 = -_3022;
    float _4255 = _4253 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _4257 = _4247 * _4247;
    float _4259 = fma(_4251, _4251, _4257);
    float _4261 = fma(_4255, _4255, _4259);
    float _4263 = sqrt(_4261);
    float _4265 = rsqrt(_4261);
    float _4267 = -_4263;
    float _4269 = _4267 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4271 = _4269 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _4273 = precise::clamp(_4271, 0.0, 1.0);
    float _4275 = _4251 * _4265;
    float _4277 = _4247 * _4265;
    float _4279 = abs(_4273);
    float _4281 = log2(_4279);
    float _4283 = _4255 * _4265;
    float _4285 = _4275 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4287 = _2910 * _4277;
    float _4289 = -_4277;
    float _4291 = -_4285;
    float _4293 = fma(_4289, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4291);
    float _4295 = fma(_2908, _4275, _4287);
    float _4297 = -_4283;
    float _4299 = fma(_4297, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4293);
    float _4301 = fma(_2912, _4283, _4295);
    float _4303 = precise::clamp(_4301, 0.0, 1.0);
    float _4305 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _4307 = _4299 + _4305;
    float _4309 = _4281 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _4311 = _4307 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _4313 = precise::clamp(_4311, 0.0, 1.0);
    float _4315 = exp2(_4309);
    float _4317 = _4315 * _4313;
    float _4319 = _4303 * _4317;
    float _4321 = _4319 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4323 = _4319 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4325 = _4319 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_92.x = _4321;
    out.m_92.y = _4323;
    out.m_92.z = _4325;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

