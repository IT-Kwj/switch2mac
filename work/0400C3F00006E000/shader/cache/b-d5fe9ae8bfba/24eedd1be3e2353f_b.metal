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
    texture2d_array<float> vp_t_tcb_14 [[id(15)]];
    sampler vp_t_tcb_14Smplr [[id(16)]];
    texture2d<float> vp_t_tcb_1C [[id(17)]];
    sampler vp_t_tcb_1CSmplr [[id(18)]];
    sampler vp_t_tcb_24Smplr_w [[id(19)]];
    sampler vp_t_tcb_32Smplr_w [[id(20)]];
    sampler vp_t_tcb_30Smplr_w [[id(21)]];
    sampler vp_t_tcb_14Smplr_w [[id(22)]];
    sampler vp_t_tcb_1CSmplr_w [[id(23)]];
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
    float4 m_82 [[user(locn7)]];
    float4 m_84 [[user(locn8)]];
    float4 m_80 [[user(locn9)]];
    float4 m_92 [[user(locn10)]];
    float4 m_88 [[user(locn11)]];
    float4 m_90 [[user(locn12)]];
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
    bool _4317 = false;
    bool _3138 = false;
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
        float _4550 = as_type<float>(_129);
        out.gl_Position.z = _4550;
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
        float _4620 = as_type<float>(_167);
        out.gl_Position.z = _4620;
    }
    if (_159)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _169 = as_type<float>(int(gl_VertexIndex));
    float _171 = _147 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _173 = in.m_68.w;
    bool _175 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _177 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _179 = _175 || _177;
    bool _181 = isnan(1.0);
    bool _183 = _179 || _181;
    float _185 = in.m_63.x;
    float _187 = in.m_63.y;
    float _189 = in.m_63.z;
    float _191 = in.m_58.x;
    float _193 = in.m_58.y;
    float _195 = in.m_58.z;
    float _197 = 0.0;
    float _199 = _171;
    if (!_183)
    {
        float _201 = _171 * _171;
        float _203 = _201 * 0.5;
        _197 = _203;
    }
    float _205 = _197;
    float _207 = _205;
    if (!_183)
    {
        float _209 = _205 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _207 = _209;
    }
    float _211 = _207;
    int _213 = as_type<int>(_169) & 1;
    bool _215 = _213 != 0;
    int _217 = as_type<int>(_169) & 2;
    bool _219 = _217 != 0;
    bool _221 = !_215;
    float _223 = _221 ? (-0.5) : 0.5;
    bool _225 = !_219;
    float _227 = _225 ? (-0.5) : 0.5;
    bool _229 = !_183;
    float _231 = _211;
    if (!_229)
    {
        float _233 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _235 = log2(_233);
        float _237 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _239 = _237 + 1.0;
        float _241 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _243 = _171 * _235;
        float _245 = 1.0 / _239;
        float _247 = _241 * 0.693147182464599609375;
        float _249 = exp2(_243);
        float _251 = 1.0 / _247;
        float _253 = _249 + (-1.0);
        float _255 = -_253;
        float _257 = fma(_255, _251, _171);
        float _259 = _257 * _245;
        float _261 = _259 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _231 = _261;
    }
    float _263 = _231;
    bool _265 = !_183;
    if (!_265)
    {
        float _267 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _269 = log2(_267);
        float _271 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _273 = _271 + 1.0;
        float _275 = 1.0 / _273;
        float _277 = _171 * _269;
        float _279 = exp2(_277);
        float _281 = -_279;
        float _283 = _281 + 1.0;
        float _285 = _283 * _275;
        _199 = _285;
    }
    float _287 = _199;
    bool _289 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _291 = _263 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _293 = _263 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _295 = _263 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _297 = fma(_287, _185, _291);
    float _299 = fma(_287, _187, _293);
    float _301 = fma(_287, _189, _295);
    float _303 = fma(_297, _173, _191);
    float _305 = fma(_299, _173, _193);
    float _307 = fma(_301, _173, _195);
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
    float _343 = _305 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _345 = _305 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _347 = _305 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _349 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _351 = _349 != 0;
    float _353 = fma(_303, (*spvDescriptorSet0.vp_c10)._m0[4].x, _343);
    float _355 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _357 = int(_355);
    float _359 = float(_341);
    float _361 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _363 = int(_361);
    float _365 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _367 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _369 = float(_357);
    float _371 = 1.0 / _359;
    float _373 = as_type<float>(_357);
    if (_351)
    {
        float _375 = in.m_70.x;
        _373 = _375;
    }
    float _377 = _373;
    float _379 = _377;
    if (!_351)
    {
        float _381 = in.m_70.y;
        _379 = _381;
    }
    float _383 = _379;
    float _385 = float(uint(_363));
    float _387 = 1.0 / _369;
    int _389 = ~_363;
    int _391 = _389 + 1;
    bool _393 = _363 == 0;
    float _395 = _371 * _147;
    float _397 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _399 = int(_397);
    float _401 = 1.0 / _385;
    float _403 = _387 * _147;
    float _405 = trunc(_395);
    int _407 = int(_405);
    float _409 = float(uint(_399));
    int _411 = ~_399;
    int _413 = _411 + 1;
    int _415 = as_type<int>(_401) + (-2);
    float _417 = 1.0 / _409;
    float _419 = in.m_70.x;
    float _421 = in.m_70.y;
    float _423 = in.m_70.z;
    float _425 = in.m_70.w;
    float _427 = float(uint(_407));
    float _429 = trunc(_403);
    int _431 = int(_429);
    float _433 = as_type<float>(_415) * _427;
    float _435 = trunc(_433);
    float _437 = precise::max(_435, 0.0);
    uint _440 = uint(_437);
    int _442 = as_type<int>(_417) + (-2);
    float _444 = float(uint(_431));
    float _446 = _419 * 2.0;
    float _448 = _433;
    float _450 = as_type<float>(_391);
    if (_351)
    {
        _448 = 1.0;
    }
    float _452 = _448;
    float _454 = _452;
    if (!_351)
    {
        _454 = 1.2345600128173828125;
    }
    float _456 = _454;
    float _458 = as_type<float>(_442) * _444;
    int _460 = _391 * int(_440);
    int _462 = _460 + _407;
    float _464 = trunc(_458);
    float _466 = precise::max(_464, 0.0);
    uint _468 = uint(_466);
    if (_351)
    {
        _450 = 1.0;
    }
    float _470 = _450;
    float _472 = _470;
    if (!_351)
    {
        _472 = 7.345489978790283203125;
    }
    float _474 = _472;
    float _476 = float(uint(_462));
    int _478 = ~_399;
    int _480 = _478 + 1;
    float _482 = _474 * _419;
    float _484 = _383 * _456;
    float _486 = as_type<float>(_415) * _476;
    int _488 = ~_363;
    int _490 = _488 + 1;
    float _492 = trunc(_486);
    float _494 = precise::max(_492, 0.0);
    uint _496 = uint(_494);
    int _498 = _480 * int(_468);
    int _500 = _498 + _431;
    float _502 = float(uint(_500));
    float _504 = floor(_482);
    float _506 = float(_113);
    float _508 = as_type<float>(_442) * _502;
    float _510 = float(_407);
    int _512 = int(_440) + int(_496);
    float _514 = floor(_484);
    int _516 = _490 * _512;
    int _518 = _516 + _407;
    float _520 = -_504;
    float _522 = _482 + _520;
    float _524 = trunc(_508);
    float _526 = precise::max(_524, 0.0);
    uint _528 = uint(_526);
    bool _530 = uint(_518) >= uint(_363);
    float _532 = float(_363);
    bool _534 = !_530;
    int _536 = _534 ? 0 : (-1);
    bool _538 = _510 >= _532;
    bool _540 = isnan(_510);
    bool _542 = _538 || _540;
    bool _544 = isnan(_532);
    bool _546 = _542 || _544;
    float _548 = float(_546);
    float _550 = 1.0 / _506;
    float _552 = _522 * _532;
    int _554 = ~_512;
    int _556 = _554 + _536;
    int _558 = _556 + 1;
    float _560 = -_514;
    float _562 = _484 + _560;
    int _564 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _566 = _564 != 0;
    float _568 = trunc(_548);
    int _570 = int(_568);
    int _572 = int(_468) + int(_528);
    bool _574 = !_566;
    int _576 = _574 ? 0 : 1;
    float _578 = float(_399);
    int _580 = _413 * _572;
    int _582 = _580 + _431;
    float _584 = float(_431);
    float _586 = _550 * _147;
    int _588 = abs(_576);
    float _590 = trunc(_552);
    int _592 = int(_590);
    int _594 = _363 * _558;
    int _596 = _594 + _407;
    float _598 = _532 * _586;
    bool _600 = uint(_582) >= uint(_399);
    float _602 = _562 * _578;
    float _604 = _578 * _586;
    int _606 = ~_570;
    int _608 = _606 + 1;
    int _610 = _608 + 1;
    float _612 = trunc(_598);
    int _614 = int(_612);
    bool _616 = !_393;
    int _618 = _616 ? _596 : (-1);
    int _620 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _622 = _620 != 0;
    int _624 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _626 = _624 != 0;
    int _628 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _630 = _628 != 0;
    bool _632 = _584 >= _578;
    bool _634 = isnan(_584);
    bool _636 = _632 || _634;
    bool _638 = isnan(_578);
    bool _640 = _636 || _638;
    float _642 = float(_640);
    int _644 = _618 * _610;
    bool _646 = !_600;
    int _648 = _646 ? 0 : (-1);
    int _650 = _592 * _588;
    int _652 = _650 + _407;
    bool _654 = !_626;
    int _656 = _654 ? 0 : 1;
    int _658 = _363 + (-1);
    float _660 = trunc(_642);
    int _662 = int(_660);
    int _664 = ~_572;
    int _666 = _664 + _648;
    int _668 = _666 + 1;
    int _670 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _672 = _670 != 0;
    int _674 = _570 * _658;
    int _676 = _674 + _644;
    int _678 = abs(_656);
    bool _680 = !_622;
    int _682 = _680 ? 0 : 1;
    float _684 = trunc(_602);
    int _686 = int(_684);
    bool _688 = !_672;
    int _690 = _688 ? 0 : 1;
    int _692 = abs(_682);
    bool _694 = !_630;
    int _696 = _694 ? 0 : 1;
    int _698 = abs(_690);
    int _700 = _676 * _678;
    int _702 = _399 * _668;
    int _704 = _702 + _431;
    int _706 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _708 = _706 != 0;
    int _710 = abs(_696);
    int _712 = _614 * _692;
    int _714 = _712 + _700;
    float _716 = fma(_303, (*spvDescriptorSet0.vp_c10)._m0[5].x, _345);
    bool _718 = !_708;
    int _720 = _718 ? 0 : 1;
    float _722 = fma(_303, (*spvDescriptorSet0.vp_c10)._m0[6].x, _347);
    int _724 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _726 = _724 != 0;
    int _728 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _730 = _728 != 0;
    int _732 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _734 = _732 != 0;
    int _736 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _738 = _736 != 0;
    int _740 = _686 * _698;
    int _742 = _740 + _431;
    bool _744 = _399 == 0;
    int _746 = _652 * _710;
    int _748 = _746 + _714;
    int _750 = abs(_720);
    float _752 = trunc(_604);
    int _754 = int(_752);
    bool _756 = !_730;
    int _758 = _756 ? 0 : 1;
    float _760 = _419 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _762 = ~_662;
    int _764 = _762 + 1;
    int _766 = _764 + 1;
    int _768 = _592 * _750;
    int _770 = _768 + _748;
    bool _772 = !_744;
    int _774 = _772 ? _704 : (-1);
    int _776 = _399 + (-1);
    bool _778 = !_726;
    int _780 = _778 ? 0 : 1;
    int _782 = _774 * _766;
    int _784 = abs(_758);
    int _786 = abs(_780);
    int _788 = _662 * _776;
    int _790 = _788 + _782;
    bool _792 = !_734;
    int _794 = _792 ? 0 : 1;
    float _796 = float(uint(_770));
    int _798 = _790 * _784;
    int _800 = abs(_794);
    float _802 = as_type<float>(_415) * _796;
    bool _804 = !_738;
    int _806 = _804 ? 0 : 1;
    int _808 = _754 * _786;
    int _810 = _808 + _798;
    int _812 = abs(_806);
    float _814 = trunc(_802);
    float _816 = precise::max(_814, 0.0);
    uint _818 = uint(_816);
    float _820 = float(uint(_652));
    int _822 = _742 * _800;
    int _824 = _822 + _810;
    int _826 = ~_363;
    int _828 = _826 + 1;
    int _830 = ~_399;
    int _832 = _830 + 1;
    int _834 = _686 * _812;
    int _836 = _834 + _824;
    float _838 = as_type<float>(_415) * _820;
    bool _840 = _363 == 0;
    float _842 = float(uint(_836));
    float _844 = trunc(_838);
    float _846 = precise::max(_844, 0.0);
    uint _848 = uint(_846);
    float _850 = as_type<float>(_442) * _842;
    int _852 = _828 * int(_818);
    int _854 = _852 + _770;
    int _856 = ~_363;
    int _858 = _856 + 1;
    float _860 = trunc(_850);
    float _862 = precise::max(_860, 0.0);
    uint _864 = uint(_862);
    float _866 = float(uint(_854));
    float _868 = float(uint(_742));
    float _870 = as_type<float>(_415) * _866;
    int _872 = _858 * int(_848);
    int _874 = _872 + _652;
    float _876 = as_type<float>(_442) * _868;
    float _878 = trunc(_870);
    float _880 = precise::max(_878, 0.0);
    uint _882 = uint(_880);
    float _884 = float(uint(_874));
    int _886 = _832 * int(_864);
    int _888 = _886 + _836;
    float _890 = as_type<float>(_415) * _884;
    int _892 = ~_363;
    int _894 = _892 + 1;
    float _896 = trunc(_876);
    float _898 = precise::max(_896, 0.0);
    uint _900 = uint(_898);
    float _902 = float(uint(_888));
    float _904 = as_type<float>(_442) * _902;
    float _906 = trunc(_890);
    float _908 = precise::max(_906, 0.0);
    uint _910 = uint(_908);
    int _912 = int(_818) + int(_882);
    float _914 = trunc(_904);
    float _916 = precise::max(_914, 0.0);
    uint _918 = uint(_916);
    int _920 = _894 * _912;
    int _922 = _920 + _770;
    int _924 = _832 * int(_900);
    int _926 = _924 + _742;
    bool _928 = uint(_922) >= uint(_363);
    int _930 = int(_848) + int(_910);
    float _932 = float(uint(_926));
    bool _934 = !_928;
    int _936 = _934 ? 0 : (-1);
    int _938 = ~_363;
    int _940 = _938 + 1;
    int _942 = ~_399;
    int _944 = _942 + 1;
    int _946 = int(_864) + int(_918);
    int _948 = ~_912;
    int _950 = _948 + _936;
    int _952 = _950 + 1;
    float _954 = as_type<float>(_442) * _932;
    int _956 = _940 * _930;
    int _958 = _956 + _652;
    int _960 = _944 * _946;
    int _962 = _960 + _836;
    float _964 = trunc(_954);
    float _966 = precise::max(_964, 0.0);
    uint _968 = uint(_966);
    int _970 = _363 * _952;
    int _972 = _970 + _770;
    bool _974 = uint(_958) >= uint(_363);
    bool _976 = uint(_962) >= uint(_399);
    bool _978 = !_974;
    int _980 = _978 ? 0 : (-1);
    bool _982 = !_976;
    int _984 = _982 ? 0 : (-1);
    bool _986 = !_840;
    int _988 = _986 ? _972 : (-1);
    int _990 = ~_946;
    int _992 = _990 + _984;
    int _994 = _992 + 1;
    int _996 = ~_930;
    int _998 = _996 + _980;
    int _1000 = _998 + 1;
    int _1002 = _988 >> 31;
    int _1004 = _399 * _994;
    int _1006 = _1004 + _836;
    int _1008 = _988 & 3;
    bool _1010 = _1008 != 0;
    int _1012 = _363 * _1000;
    int _1014 = _1012 + _652;
    int _1016 = _1002 & 3;
    bool _1018 = !_744;
    int _1020 = _1018 ? _1006 : (-1);
    bool _1022 = uint(_1008) > 1u;
    int _1024 = _988 & 3;
    bool _1026 = _1024 != 0;
    int _1028 = _988 + _1016;
    bool _1030 = _1008 != 3;
    int _1032 = _1020 >> 31;
    int _1034 = _1026 ? 0 : 1;
    int _1036 = _1028 >> 2;
    bool _1038 = uint(_1008) >= 2u;
    int _1040 = _1032 & 3;
    int _1042 = _1036 << 4;
    int _1044 = _1042 + 368;
    int _1046 = _1038 ? 0 : 1;
    int _1048 = _1020 + _1040;
    int _1050 = ~_1034;
    int _1052 = _1050 + 1;
    int _1054 = _1052 + 1;
    int _1056 = _1054;
    if (!_1022)
    {
        int _1058 = ~_1034;
        int _1060 = _1058 + 1;
        _1056 = _1060;
    }
    int _1062 = _1056;
    uint _1064 = uint(int(uint(_1044) >> uint(2)));
    uint _1066 = uint(int(uint(int(_1064)) >> uint(2)));
    int _1068 = int(_1064) & 3;
    float _1070 = (*spvDescriptorSet0.vp_c9)._m0[int(_1066)][_1068];
    int _1072 = int(_1064) + 1;
    uint _1074 = uint(int(uint(_1072) >> uint(2)));
    int _1076 = _1072 & 3;
    float _1078 = (*spvDescriptorSet0.vp_c9)._m0[int(_1074)][_1076];
    int _1080 = ~_1046;
    int _1082 = _1080 + 1;
    int _1084 = _1082 + 1;
    int _1086 = _1048 >> 2;
    int _1088 = _1084;
    if (_1030)
    {
        int _1090 = ~_1046;
        int _1092 = _1090 + 1;
        _1088 = _1092;
    }
    int _1094 = _1088;
    int _1096 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1098 = _1096 != 0;
    int _1100 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1102 = _1100 != 0;
    int _1104 = _1086 << 4;
    int _1106 = _1104 + 512;
    bool _1108 = !_1098;
    int _1110 = _1108 ? 0 : 1;
    bool _1112 = !_1102;
    int _1114 = _1112 ? 0 : 1;
    int _1116 = _1020 & 3;
    bool _1118 = _1116 != 0;
    int _1120 = _1020 & 3;
    bool _1122 = _1120 != 0;
    uint _1124 = uint(int(uint(_1106) >> uint(2)));
    uint _1126 = uint(int(uint(int(_1124)) >> uint(2)));
    int _1128 = int(_1124) & 3;
    float _1130 = (*spvDescriptorSet0.vp_c9)._m0[int(_1126)][_1128];
    int _1132 = int(_1124) + 1;
    uint _1134 = uint(int(uint(_1132) >> uint(2)));
    int _1136 = _1132 & 3;
    float _1138 = (*spvDescriptorSet0.vp_c9)._m0[int(_1134)][_1136];
    bool _1140 = !_840;
    int _1142 = _1140 ? _1014 : (-1);
    bool _1144 = _1008 != 3;
    bool _1146 = uint(_1120) >= 2u;
    int _1148 = _1118 ? 0 : 1;
    bool _1150 = _425 > 0.5;
    bool _1152 = !_1010;
    int _1154 = _1152 ? 0 : 1;
    int _1156 = _1146 ? 0 : 1;
    bool _1158 = !_1144;
    int _1160 = _1158 ? 0 : (-1);
    bool _1162 = uint(_1120) > 1u;
    bool _1164 = _1120 != 3;
    bool _1166 = _1120 != 3;
    int _1168 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1170 = _1168 != 0;
    int _1172 = _1044 + 8;
    uint _1174 = uint(int(uint(_1172) >> uint(2)));
    uint _1176 = uint(int(uint(int(_1174)) >> uint(2)));
    int _1178 = int(_1174) & 3;
    float _1180 = (*spvDescriptorSet0.vp_c9)._m0[int(_1176)][_1178];
    int _1182 = int(_1174) + 1;
    uint _1184 = uint(int(uint(_1182) >> uint(2)));
    int _1186 = _1182 & 3;
    float _1188 = (*spvDescriptorSet0.vp_c9)._m0[int(_1184)][_1186];
    int _1190 = ~_1148;
    int _1192 = _1190 + 1;
    int _1194 = _1192 + 1;
    int _1196 = abs(_1062);
    int _1198 = int(_900) + int(_968);
    int _1200 = _1194;
    if (!_1162)
    {
        int _1202 = ~_1148;
        int _1204 = _1202 + 1;
        _1200 = _1204;
    }
    int _1206 = _1200;
    int _1208 = _1106 + 8;
    uint _1210 = uint(int(uint(_1208) >> uint(2)));
    uint _1212 = uint(int(uint(int(_1210)) >> uint(2)));
    int _1214 = int(_1210) & 3;
    float _1216 = (*spvDescriptorSet0.vp_c9)._m0[int(_1212)][_1214];
    int _1218 = int(_1210) + 1;
    uint _1220 = uint(int(uint(_1218) >> uint(2)));
    int _1222 = _1218 & 3;
    float _1224 = (*spvDescriptorSet0.vp_c9)._m0[int(_1220)][_1222];
    int _1226 = ~_399;
    int _1228 = _1226 + 1;
    float _1230 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1232 = int(_1230);
    int _1234 = abs(_1206);
    int _1236 = _1228 * _1198;
    int _1238 = _1236 + _742;
    int _1240 = abs(_1154);
    int _1242 = ~_1196;
    int _1244 = _1242 + 1;
    int _1246 = _1244 + 1;
    int _1248 = ~_1240;
    int _1250 = _1248 + 1;
    int _1252 = _1250 + 1;
    bool _1254 = !_1122;
    int _1256 = _1254 ? 0 : 1;
    int _1258 = _1246 * as_type<int>(_1078);
    int _1260 = ~_1234;
    int _1262 = _1260 + 1;
    int _1264 = _1262 + 1;
    bool _1266 = uint(_1238) >= uint(_399);
    int _1268 = _1252 * as_type<int>(_1070);
    int _1270 = _1268 + _1258;
    int _1272 = abs(_1256);
    int _1274 = _1264 * as_type<int>(_1138);
    int _1276 = ~_1156;
    int _1278 = _1276 + 1;
    int _1280 = _1278 + 1;
    int _1282 = _1280;
    if (_1164)
    {
        int _1284 = ~_1156;
        int _1286 = _1284 + 1;
        _1282 = _1286;
    }
    int _1288 = _1282;
    bool _1290 = !_1266;
    int _1292 = _1290 ? 0 : (-1);
    int _1294 = ~_1272;
    int _1296 = _1294 + 1;
    int _1298 = _1296 + 1;
    int _1300 = abs(_1094);
    int _1302 = abs(_1160);
    int _1304 = _1298 * as_type<int>(_1130);
    int _1306 = _1304 + _1274;
    int _1308 = abs(_1288);
    int _1310 = ~_1198;
    int _1312 = _1310 + _1292;
    int _1314 = _1312 + 1;
    int _1316 = ~_1300;
    int _1318 = _1316 + 1;
    int _1320 = _1318 + 1;
    int _1322 = _399 * _1314;
    int _1324 = _1322 + _742;
    int _1326 = ~_1308;
    int _1328 = _1326 + 1;
    int _1330 = _1328 + 1;
    bool _1332 = !_1166;
    int _1334 = _1332 ? 0 : (-1);
    int _1336 = _1320 * as_type<int>(_1180);
    int _1338 = _1336 + _1270;
    int _1340 = ~_1302;
    int _1342 = _1340 + 1;
    int _1344 = _1342 + 1;
    int _1346 = abs(_1110);
    int _1348 = _1330 * as_type<int>(_1216);
    int _1350 = _1348 + _1306;
    int _1352 = abs(_1334);
    int _1354 = _1344 * as_type<int>(_1188);
    int _1356 = _1354 + _1338;
    int _1358 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1360 = _1358 != 0;
    int _1362 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1364 = _1362 != 0;
    int _1366 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1368 = _1366 != 0;
    int _1370 = ~_1346;
    int _1372 = _1370 + 1;
    int _1374 = _1372 + 1;
    int _1376 = abs(_1114);
    float _1378 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1380 = ~_1352;
    int _1382 = _1380 + 1;
    int _1384 = _1382 + 1;
    int _1386 = _1356 * _1374;
    int _1388 = ~_1376;
    int _1390 = _1388 + 1;
    int _1392 = _1390 + 1;
    float _1394 = -_1378;
    float _1396 = fma(_760, 2.0, _1394);
    bool _1398 = !_744;
    int _1400 = _1398 ? _1324 : (-1);
    int _1402 = _1384 * as_type<int>(_1224);
    int _1404 = _1402 + _1350;
    float _1406 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _1408 = int(_1406);
    int _1410 = _1142 * _1346;
    int _1412 = _1410 + _1386;
    int _1414 = abs(_1232);
    int _1416 = _1404 * _1392;
    float _1418 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1420 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _1418;
    float _1422 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1424 = _1422 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    int _1426 = _1400 * _1376;
    int _1428 = _1426 + _1416;
    float _1430 = float(uint(_1232));
    float _1432 = fma(_307, (*spvDescriptorSet0.vp_c10)._m0[5].z, _716);
    float _1434 = float(uint(_1414));
    float _1436 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1438 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _1436;
    float _1440 = float(uint(_1412));
    float _1442 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _1444 = _1442 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _1446 = 1.0 / _1430;
    float _1448 = float(uint(_1408));
    float _1450 = _421 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1452 = abs(_1408);
    float _1454 = _1432 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1456 = -_147;
    float _1458 = fma(_1456, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1396);
    float _1460 = float(uint(_1452));
    float _1462 = 1.0 / _1448;
    float _1464 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1466 = fma(_1450, -2.0, _1464);
    float _1468 = 1.0 / _1434;
    int _1470 = as_type<int>(_1446) + (-2);
    float _1472 = fma(_307, (*spvDescriptorSet0.vp_c10)._m0[4].z, _353);
    float _1474 = float(uint(_1428));
    float _1476 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1478 = as_type<float>(_1470) * _1440;
    int _1480 = abs(_1412);
    float _1482 = 1.0 / _1420;
    int _1484 = as_type<int>(_1462) + (-2);
    float _1486 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1488 = float(uint(_1480));
    float _1490 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1492 = as_type<float>(_1484) * _1474;
    float _1494 = fma(_307, (*spvDescriptorSet0.vp_c10)._m0[6].z, _722);
    int _1496 = as_type<int>(_1468) + (-2);
    float _1498 = 1.0 / _1460;
    float _1500 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1502 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1504 = as_type<float>(_1496) * _1488;
    float _1506 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1508 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1510 = _337 + _1508;
    int _1512 = abs(_1428);
    float _1514 = trunc(_1478);
    float _1516 = precise::max(_1514, 0.0);
    uint _1518 = uint(_1516);
    float _1520 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1522 = _1476 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1524 = _1486 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1526 = _1490 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1528 = _1500 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1530 = _1502 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1532 = _1506 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1534 = trunc(_1504);
    float _1536 = precise::max(_1534, 0.0);
    uint _1538 = uint(_1536);
    float _1540 = _1510 * _1482;
    int _1542 = ~_1232;
    int _1544 = _1542 + 1;
    out.m_72.x = _1522;
    out.m_72.y = _1524;
    out.m_72.z = _1526;
    float _1546 = _1472 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    out.m_74.x = _1528;
    out.m_74.y = _1530;
    out.m_74.z = _1532;
    out.m_74.w = _1520;
    float _1548 = trunc(_1492);
    float _1550 = precise::max(_1548, 0.0);
    uint _1552 = uint(_1550);
    int _1554 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1556 = _1554 != 0;
    float _1558 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1466);
    float _1560 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _1562 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _1560;
    float _1564 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _1566 = _1564 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _1568 = _1494 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1570 = as_type<int>(_1498) + (-2);
    float _1572 = 1.0 / _1424;
    int _1574 = _1544 * int(_1518);
    int _1576 = _1574 + _1412;
    float _1578 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1580 = _337 + _1578;
    float _1582 = float(uint(_1512));
    float _1584 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _1586 = _337 + _1584;
    int _1588 = ~_1414;
    int _1590 = _1588 + 1;
    float _1592 = 1.0 / _1444;
    int _1594 = ~_1408;
    int _1596 = _1594 + 1;
    float _1598 = as_type<float>(_1570) * _1582;
    float _1600 = float(uint(_1576));
    int _1602 = _1590 * int(_1538);
    int _1604 = _1602 + _1480;
    int _1606 = _1596 * int(_1552);
    int _1608 = _1606 + _1428;
    float _1610 = 1.0 / _1438;
    float _1612 = as_type<float>(_1470) * _1600;
    float _1614 = float(uint(_1604));
    float _1616 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _1618 = _337 + _1616;
    float _1620 = _1580 * _1572;
    float _1622 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1624 = _337 + _1622;
    float _1626 = float(uint(_1608));
    float _1628 = as_type<float>(_1496) * _1614;
    float _1630 = 1.0 / _1566;
    float _1632 = _1618 * _1592;
    float _1634 = _419 + _421;
    float _1636 = _423 + _419;
    float _1638 = as_type<float>(_1484) * _1626;
    int _1640 = ~_1452;
    int _1642 = _1640 + 1;
    float _1644 = _1634 + (-1.0);
    float _1646 = _1636 + (-1.0);
    float _1648 = trunc(_1598);
    float _1650 = precise::max(_1648, 0.0);
    uint _1652 = uint(_1650);
    float _1654 = _1624 * _1610;
    float _1656 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _1658 = _337 + _1656;
    float _1660 = trunc(_1612);
    float _1662 = precise::max(_1660, 0.0);
    uint _1664 = uint(_1662);
    float _1666 = _1658 * _1630;
    float _1668 = fma(_1646, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _1670 = ~_1232;
    int _1672 = _1670 + 1;
    float _1674 = fma(_1644, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1676 = 1.0 / _1562;
    int _1678 = _1642 * int(_1652);
    int _1680 = _1678 + _1512;
    float _1682 = float(uint(_1680));
    float _1684 = floor(_446);
    int _1686 = int(_1518) + int(_1664);
    float _1688 = as_type<float>(_1570) * _1682;
    int _1690 = _1672 * _1686;
    int _1692 = _1690 + _1412;
    int _1694 = ~_1408;
    int _1696 = _1694 + 1;
    float _1698 = trunc(_1628);
    float _1700 = precise::max(_1698, 0.0);
    uint _1702 = uint(_1700);
    float _1704 = _1586 * _1676;
    float _1706 = trunc(_1638);
    float _1708 = precise::max(_1706, 0.0);
    uint _1710 = uint(_1708);
    bool _1712 = _1684 >= 0.0;
    bool _1714 = isnan(_1684);
    bool _1716 = _1712 || _1714;
    bool _1718 = isnan(0.0);
    bool _1720 = _1716 || _1718;
    int _1722 = int(_1538) + int(_1702);
    float _1724 = trunc(_1688);
    float _1726 = precise::max(_1724, 0.0);
    uint _1728 = uint(_1726);
    float _1730 = -_227;
    int _1732 = _1150 ? as_type<int>(_1730) : as_type<int>(_227);
    bool _1734 = _1684 > 0.0;
    int _1736 = ~_1414;
    int _1738 = _1736 + 1;
    int _1740 = as_type<int>(_1684);
    float _1742 = as_type<float>(_1642);
    float _1744 = as_type<float>(_1702);
    if (_1556)
    {
        _1740 = 0;
    }
    int _1746 = _1740;
    float _1748 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1750 = _1746;
    if (!_1556)
    {
        _1750 = 1;
    }
    int _1752 = _1750;
    int _1754 = _1738 * _1722;
    int _1756 = _1754 + _1480;
    bool _1758 = uint(_1692) >= uint(_1232);
    float _1760 = _423 + _421;
    int _1762 = int(_1552) + int(_1710);
    bool _1764 = !_1758;
    int _1766 = _1764 ? 0 : (-1);
    float _1768 = _1760 + (-1.0);
    bool _1770 = _419 > 0.5;
    int _1772 = _1696 * _1762;
    int _1774 = _1772 + _1428;
    bool _1776 = !_1360;
    float _1778 = _1776 ? _227 : as_type<float>(_1732);
    bool _1780 = uint(_1756) >= uint(_1414);
    int _1782 = int(_1734);
    int _1784 = _1720 ? 2 : 0;
    int _1786 = _1782 | _1784;
    int _1788 = _1780 ? 4 : 0;
    int _1790 = _1786 | _1788;
    int _1792 = _1364 ? 8 : 0;
    int _1794 = _1790 | _1792;
    int _1796 = _1770 ? 16 : 0;
    int _1798 = _1794 | _1796;
    int _1800 = _1368 ? 32 : 0;
    int _1802 = _1798 | _1800;
    int _1804 = _1170 ? 64 : 0;
    int _1806 = _1802 | _1804;
    int _1808 = _1806 & 16;
    bool _1810 = !_1780;
    int _1812 = _1810 ? 0 : (-1);
    bool _1814 = _1808 != 0;
    int _1816 = ~_1686;
    int _1818 = _1816 + _1766;
    int _1820 = _1818 + 1;
    float _1822 = -_223;
    int _1824 = _1814 ? as_type<int>(_1822) : as_type<int>(_223);
    bool _1826 = uint(_1774) >= uint(_1408);
    bool _1828 = _421 > 0.5;
    int _1830 = int(_1652) + int(_1728);
    float _1832 = _419 + (-0.5);
    int _1834 = ~_1452;
    int _1836 = _1834 + 1;
    bool _1838 = !_1170;
    float _1840 = _1838 ? _223 : as_type<float>(_1824);
    int _1842 = _1232 * _1820;
    int _1844 = _1842 + _1412;
    float _1846 = -_227;
    float _1848 = _1828 ? _1846 : _227;
    int _1850 = _1836 * _1830;
    int _1852 = _1850 + _1512;
    bool _1854 = _1752 != 1;
    bool _1856 = _1232 == 0;
    bool _1858 = !_1826;
    int _1860 = _1858 ? 0 : (-1);
    bool _1862 = !_1856;
    int _1864 = _1862 ? _1844 : (-1);
    int _1866 = ~_1762;
    int _1868 = _1866 + _1860;
    int _1870 = _1868 + 1;
    bool _1872 = uint(_1852) >= uint(_1452);
    int _1874 = ~_1812;
    int _1876 = _1722 + _1874;
    int _1878 = _1876 + 1;
    int _1880 = _1428 ^ _1408;
    int _1882 = _1408 * _1870;
    int _1884 = _1882 + _1428;
    bool _1886 = !_1872;
    int _1888 = _1886 ? 0 : (-1);
    bool _1890 = _1232 == 0;
    uint _1892 = uint(int(uint(_1880) >> uint(31)));
    int _1894 = _1412 ^ _1232;
    int _1896 = ~_1888;
    int _1898 = _1830 + _1896;
    int _1900 = _1898 + 1;
    int _1902 = ~int(_1892);
    int _1904 = _1902 + 1;
    float _1906 = _423 * 2.0;
    uint _1908 = uint(int(uint(_1894) >> uint(31)));
    bool _1910 = !_1364;
    float _1912 = _1910 ? _227 : _1848;
    int _1914 = _1900 ^ _1904;
    bool _1916 = _423 > 0.5;
    int _1918 = ~int(_1908);
    int _1920 = _1918 + 1;
    int _1922 = ~_1904;
    int _1924 = _1922 + _1914;
    int _1926 = _1924 + 1;
    float _1928 = -_223;
    int _1930 = _1916 ? as_type<int>(_1928) : as_type<int>(_223);
    float _1932 = floor(_1906);
    int _1934 = _1878 ^ _1920;
    bool _1936 = _1408 == 0;
    bool _1938 = _1408 == 0;
    float _1940 = _421 * 2.0;
    int _1942 = ~_1920;
    int _1944 = _1942 + _1934;
    int _1946 = _1944 + 1;
    float _1948 = floor(_1940);
    float _1950 = _421 + (-0.5);
    bool _1952 = !_1368;
    float _1954 = _1952 ? _223 : as_type<float>(_1930);
    bool _1956 = !_1936;
    int _1958 = _1956 ? _1884 : (-1);
    float _1960 = fma(_1768, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1962 = !_1890;
    int _1964 = _1962 ? _1946 : (-1);
    int _1966 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1968 = _1966 != 0;
    int _1970 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1972 = _1970 != 0;
    int _1974 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1976 = _1974 != 0;
    float _1978 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1980 = (*spvDescriptorSet0.vp_c9)._m0[198].y;
    float _1982 = _1848;
    if (!_1854)
    {
        _1980 = _421;
    }
    float _1984 = _1980;
    float _1986 = fma(_419, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1978);
    float _1988 = _1984;
    if (!_1854)
    {
        _1742 = _421;
    }
    float _1990 = _1742;
    float _1992 = _1990;
    if (_1854)
    {
        _1988 = _419;
    }
    float _1994 = _1988;
    float _1996 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1986);
    if (_1854)
    {
        _1992 = _419;
    }
    float _1998 = _1992;
    float _2000 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _2002 = !_1938;
    int _2004 = _2002 ? _1926 : (-1);
    float _2006 = _423 + (-0.5);
    if (!_1854)
    {
        _1982 = _423;
    }
    float _2008 = _1982;
    float _2010 = fma(_421, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2000);
    float _2012 = _2008;
    if (!_1854)
    {
        _1744 = _423;
    }
    float _2014 = _1744;
    bool _2016 = _1932 >= 0.0;
    bool _2018 = isnan(_1932);
    bool _2020 = _2016 || _2018;
    bool _2022 = isnan(0.0);
    bool _2024 = _2020 || _2022;
    float _2026 = _2014;
    if (_1854)
    {
        _2012 = _421;
    }
    float _2028 = _2012;
    float _2030 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _2032 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _2030;
    if (_1854)
    {
        _2026 = _421;
    }
    float _2034 = _2026;
    float _2036 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _2038 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _2036;
    int _2040 = _2024 ? 0 : 1;
    float _2042 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _2044 = _2042 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _2046 = !_1968;
    int _2048 = _2046 ? 0 : 1;
    float _2050 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _2052 = _2050 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _2054 = _1932 > 0.0;
    float _2056 = fma(_2044, _1620, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _2058 = _1948 > 0.0;
    float _2060 = fma(_2032, _1540, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _2062 = _1948 >= 0.0;
    bool _2064 = isnan(_1948);
    bool _2066 = _2062 || _2064;
    bool _2068 = isnan(0.0);
    bool _2070 = _2066 || _2068;
    float _2072 = fma(_2052, _1620, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _2074 = fma(_2038, _1540, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _2076 = _2028 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2078 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _2080 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _2078;
    float _2082 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _2084 = _2082 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _2086 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _2088 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _2086;
    float _2090 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _2092 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _2090;
    float _2094 = fma(_2080, _1654, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _2096 = fma(_2084, _1632, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _2098 = fma(_2088, _1654, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _2100 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _2102 = _2100 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _2104 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _2106 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _2104;
    float _2108 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _2110 = _2108 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _2112 = _1748 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2114 = fma(_2102, _1632, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _2116 = fma(_2106, _1704, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _2118 = fma(_2092, _1704, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _2120 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _2122 = _2120 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _2124 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _2126 = ~_2040;
    int _2128 = _2126 + 1;
    int _2130 = _2128 + 1;
    float _2132 = _1994 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _2134 = _2130;
    if (!_2054)
    {
        int _2136 = ~_2040;
        int _2138 = _2136 + 1;
        _2134 = _2138;
    }
    int _2140 = _2134;
    float _2142 = fma(_2122, _1666, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _2144 = fma(_2110, _1666, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _2146 = fma(_1998, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2124);
    float _2148 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2150 = fma(_2034, (*spvDescriptorSet0.vp_c9)._m0[83].w, _365);
    float _2152 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2154 = fma(_2076, -2.0, _367);
    float _2156 = float(_1864);
    float _2158 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2160 = _1546 + _2158;
    float _2162 = -_2152;
    float _2164 = fma(_2132, 2.0, _2162);
    float _2166 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2168 = _1454 + _2166;
    float _2170 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2172 = fma(_2112, _2156, _1458);
    float _2174 = float(_1964);
    float _2176 = _2168 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2178 = float(_2004);
    float _2180 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2182 = _1568 + _2180;
    float _2184 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2150);
    float _2186 = fma(_2160, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2176);
    float _2188 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2190 = _2148 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2192 = float(_1958);
    float _2194 = _1840 + 0.5;
    float _2196 = -_147;
    float _2198 = fma(_2196, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2164);
    float _2200 = fma(_2182, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2186);
    float _2202 = -_2184;
    float _2204 = _2202 + 1.0;
    float _2206 = fma(_2112, _2194, _2172);
    float _2208 = _2170 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2210 = fma(_2190, _2192, _2198);
    float _2212 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2154);
    float _2214 = _1912 + (-0.5);
    float _2216 = -_1558;
    float _2218 = fma(_2208, _2174, _2216);
    float _2220 = _1954 + 0.5;
    bool _2222 = _337 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _2224 = isnan(_337);
    bool _2226 = _2222 || _2224;
    bool _2228 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _2230 = _2226 || _2228;
    float _2232 = float(_2230);
    float _2234 = _2188 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2236 = fma(_2190, _2220, _2210);
    bool _2238 = _337 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _2240 = isnan(_337);
    bool _2242 = _2238 || _2240;
    bool _2244 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _2246 = _2242 || _2244;
    float _2248 = float(_2246);
    float _2250 = -_2208;
    float _2252 = fma(_2250, _2214, _2218);
    float _2254 = -_2212;
    float _2256 = fma(_2234, _2178, _2254);
    float _2258 = -_1996;
    float _2260 = _2258 + 1.0;
    bool _2262 = _337 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _2264 = isnan(_337);
    bool _2266 = _2262 || _2264;
    bool _2268 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _2270 = _2266 || _2268;
    float _2272 = float(_2270);
    float _2274 = -_2248;
    float _2276 = _2274 + 1.0;
    float _2278 = -_2232;
    float _2280 = _2278 + 1.0;
    float _2282 = -_2260;
    float _2284 = fma(_1840, _2282, _2206);
    float _2286 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2146);
    float _2288 = _1778 + (-0.5);
    float _2290 = _2272 * _2276;
    float _2292 = -_2272;
    float _2294 = _2292 + 1.0;
    float _2296 = _2248 * _2280;
    float _2298 = -_2286;
    float _2300 = _2298 + 1.0;
    float _2302 = -_2234;
    float _2304 = fma(_2302, _2288, _2256);
    bool _2306 = _337 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _2308 = isnan(_337);
    bool _2310 = _2306 || _2308;
    bool _2312 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _2314 = _2310 || _2312;
    float _2316 = float(_2314);
    float _2318 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2010);
    bool _2320 = _337 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _2322 = isnan(_337);
    bool _2324 = _2320 || _2322;
    bool _2326 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _2328 = _2324 || _2326;
    float _2330 = float(_2328);
    float _2332 = -_2300;
    float _2334 = fma(_1954, _2332, _2236);
    bool _2336 = _2200 >= 0.0;
    float _2338 = -_2318;
    float _2340 = _2338 + 1.0;
    bool _2342 = _337 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _2344 = isnan(_337);
    bool _2346 = _2342 || _2344;
    bool _2348 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _2350 = _2346 || _2348;
    float _2352 = float(_2350);
    float _2354 = _2316 * _2294;
    bool _2356 = _337 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _2358 = isnan(_337);
    bool _2360 = _2356 || _2358;
    bool _2362 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _2364 = _2360 || _2362;
    float _2366 = float(_2364);
    float _2368 = -_2316;
    float _2370 = _2368 + 1.0;
    float _2372 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2374 = log2(_2372);
    float _2376 = -_2330;
    float _2378 = _2376 + 1.0;
    float _2380 = fma(_1778, _2204, _2304);
    float _2382 = _2330 * _2370;
    float _2384 = _2168 * _2168;
    float _2386 = _2352 * _2378;
    float _2388 = -_2352;
    float _2390 = _2388 + 1.0;
    int _2392 = abs(_2048);
    float _2394 = fma(_2160, _2160, _2384);
    float _2396 = _2384;
    int _2398 = _2140;
    if (_2336)
    {
        _2396 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2400 = _2396;
    float _2402 = _2366 * _2390;
    float _2404 = fma(_1912, _2340, _2252);
    float _2406 = fma(_2182, _2182, _2394);
    float _2408 = float(_2140);
    float _2410 = _2060 * _2402;
    float _2412 = _2074 * _2402;
    float _2414 = _2374 * _147;
    float _2416 = in.m_76.x;
    float _2418 = in.m_76.y;
    float _2420 = in.m_76.z;
    float _2422 = rsqrt(_2406);
    if (_2336)
    {
        float _2424 = _2400 * 5.0;
        _2398 = as_type<int>(_2424);
    }
    int _2426 = _2398;
    float _2428 = float(_2392);
    out.m_78.x = _2284;
    out.m_78.y = _2404;
    out.m_78.z = _2334;
    out.m_78.w = _2380;
    bool _2430 = !_1972;
    int _2432 = _2430 ? 0 : 1;
    if (_2336)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7893 = as_type<float>(_2426);
        out.gl_Position.z = _7893;
    }
    float _2434 = exp2(_2414);
    float _2436 = _2428 * _2408;
    bool _2438 = !_1976;
    int _2440 = _2438 ? 0 : 1;
    if (_2336)
    {
        out.m_61.x = 0.0;
    }
    float _2442 = _2168 * _2422;
    float _2444 = _2160 * _2422;
    if (_2336)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2446 = -_2442;
    float _2448 = fma(_2446, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1454);
    float _2450 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2452 = 1.0 + _2450;
    float _2454 = _2182 * _2422;
    float _2456 = -_2444;
    float _2458 = fma(_2456, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1546);
    float _2460 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2462 = _2448 + _2460;
    bool _2464 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2466 = isnan(1.0);
    bool _2468 = _2464 || _2466;
    bool _2470 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2472 = _2468 || _2470;
    float _2474 = -_2454;
    float _2476 = fma(_2474, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1568);
    float _2478 = 1.0 / _2452;
    float _2480 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2482 = _2458 + _2480;
    float _2484 = _2462 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2486 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2488 = _2476 + _2486;
    int _2490 = _1720 ? 0 : 1;
    float _2492 = -_2434;
    float _2494 = _2492 + 1.0;
    float _2496 = fma(_2482, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2484);
    bool _2498 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2500 = isnan(0.0);
    bool _2502 = _2498 || _2500;
    bool _2504 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2506 = _2502 || _2504;
    float _2508 = _2436 * (-2.0);
    int _2510 = ~_2490;
    int _2512 = _2510 + 1;
    int _2514 = _2512 + 1;
    float _2516 = fma(_2488, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2496);
    float _2518 = -_2442;
    float _2520 = fma(_2518, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2168);
    int _2522 = _2514;
    int _2524 = as_type<int>(_2488);
    float _2526 = _2482;
    if (!_1734)
    {
        int _2528 = ~_2490;
        int _2530 = _2528 + 1;
        _2522 = _2530;
    }
    int _2532 = _2522;
    float _2534 = fma(_2508, _2416, _2416);
    float _2536 = _2506 ? _2494 : 0.0;
    float _2538 = -_2444;
    float _2540 = fma(_2538, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2160);
    bool _2542 = _2516 >= 0.0;
    float _2544 = _2520 * _2520;
    float _2546 = fma(_1674, _2508, _1674);
    float _2548 = _2534;
    if (_2472)
    {
        float _2550 = _2536 * _2478;
        _149 = _2550;
    }
    float _2552 = _149;
    float _2554 = fma(_1832, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2534);
    int _2556 = _2070 ? 0 : 1;
    float _2558 = fma(_2540, _2540, _2544);
    float _2560 = -_2454;
    float _2562 = fma(_2560, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2182);
    float _2564 = fma(_2546, _2552, _2554);
    int _2566 = ~_2556;
    int _2568 = _2566 + 1;
    int _2570 = _2568 + 1;
    float _2572 = fma(_2562, _2562, _2558);
    int _2574 = _2570;
    if (!_2058)
    {
        int _2576 = ~_2556;
        int _2578 = _2576 + 1;
        _2574 = _2578;
    }
    int _2580 = _2574;
    float _2582 = _2564 * 0.15915493667125701904296875;
    int _2584 = abs(_2432);
    if (_2542)
    {
        out.m_61.x = 0.0;
    }
    if (_2542)
    {
        _2548 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2586 = _2548;
    float _2588 = sqrt(_2572);
    float _2590 = float(_2580);
    int _2592 = as_type<int>(_2586);
    if (_2542)
    {
        float _2594 = _2586 * 5.0;
        _2592 = as_type<int>(_2594);
    }
    int _2596 = _2592;
    float _2598 = float(_2532);
    float _2600 = _2582 * 6.283185482025146484375;
    float _2602 = sin(_2600);
    float _2604 = float(_2584);
    int _2606 = abs(_2440);
    if (_2542)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _8164 = as_type<float>(_2596);
        out.gl_Position.z = _8164;
    }
    float _2608 = _2604 * _2598;
    if (_2542)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2610 = -_1454;
    float _2612 = _2610 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2614 = _2608 * (-2.0);
    float _2616 = -_1546;
    float _2618 = _2616 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2620 = float(_2606);
    float _2622 = _2612 * _2612;
    float _2624 = fma(_2614, _2418, _2418);
    float _2626 = -_1568;
    float _2628 = _2626 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2630 = -_2366;
    float _2632 = _2630 + 1.0;
    float _2634 = fma(_2618, _2618, _2622);
    float _2636 = fma(_1950, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2624);
    float _2638 = fma(_1960, _2614, _1960);
    float _2640 = fma(_2632, (*spvDescriptorSet0.vp_c9)._m0[143].x, _2410);
    float _2642 = fma(_2628, _2628, _2634);
    float _2644 = fma(_2632, (*spvDescriptorSet0.vp_c9)._m0[143].y, _2412);
    float _2646 = _2620 * _2590;
    float _2648 = fma(_2056, _2386, _2640);
    float _2650 = fma(_2638, _2552, _2636);
    float _2652 = fma(_2072, _2386, _2644);
    float _2654 = rsqrt(_2642);
    float _2656 = fma(_2094, _2382, _2648);
    float _2658 = _2646 * (-2.0);
    float _2660 = fma(_2098, _2382, _2652);
    float _2662 = _2650 * 0.15915493667125701904296875;
    float _2664 = fma(_2096, _2354, _2656);
    float _2666 = fma(_2658, _2420, _2420);
    float _2668 = fma(_2114, _2354, _2660);
    float _2670 = fma(_1668, _2658, _1668);
    float _2672 = fma(_2116, _2290, _2664);
    float _2674 = in.m_68.x;
    float _2676 = in.m_68.y;
    float _2678 = fma(_2006, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2666);
    float _2680 = fma(_2118, _2290, _2668);
    float _2682 = fma(_2142, _2296, _2672);
    float _2684 = _2582 * 6.283185482025146484375;
    float _2686 = cos(_2684);
    float _2688 = fma(_2670, _2552, _2678);
    float _2690 = _2618 * _2654;
    float _2692 = _2628 * _2654;
    float _2694 = fma(_2144, _2296, _2680);
    float _2696 = _2612 * _2654;
    float _2698 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2700 = _2690 * _2698;
    float _2702 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2704 = _2692 * _2702;
    float _2706 = fma(_2232, (*spvDescriptorSet0.vp_c9)._m0[149].x, _2682);
    float _2708 = fma(_2232, (*spvDescriptorSet0.vp_c9)._m0[149].y, _2694);
    float _2710 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2712 = -_2700;
    float _2714 = fma(_2692, _2710, _2712);
    float _2716 = _2662 * 6.283185482025146484375;
    float _2718 = sin(_2716);
    float _2720 = _2688 * 0.15915493667125701904296875;
    float _2722 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2724 = _2696 * _2722;
    float _2726 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2728 = -_2704;
    float _2730 = fma(_2696, _2726, _2728);
    float _2732 = _2714 * _2714;
    float _2734 = _2422 * _2588;
    float _2736 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2738 = -_2724;
    float _2740 = fma(_2690, _2736, _2738);
    float _2742 = _2662 * 6.283185482025146484375;
    float _2744 = cos(_2742);
    float _2746 = fma(_2730, _2730, _2732);
    float _2748 = _2708 * _2676;
    float _2750 = _2706 * _2674;
    float _2752 = _2734 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2754 = _2752 * 0.5;
    float _2756 = _2748 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2758 = _2750 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2760 = _2720 * 6.283185482025146484375;
    float _2762 = sin(_2760);
    float _2764 = _2602 * _2718;
    float _2766 = _2734 * _2756;
    float _2768 = _2686 * _2718;
    float _2770 = _2720 * 6.283185482025146484375;
    float _2772 = cos(_2770);
    float _2774 = _2686 * _2744;
    float _2776 = _2602 * _2744;
    float _2778 = fma(_2762, _2764, _2774);
    float _2780 = fma(_2740, _2740, _2746);
    float _2782 = fma(_2762, _2774, _2764);
    float _2784 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _223);
    float _2786 = rsqrt(_2780);
    float _2788 = _2602 * _2772;
    float _2790 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _227);
    float _2792 = _2686 * _2772;
    float _2794 = _2744 * _2772;
    float _2796 = _2718 * _2772;
    float _2798 = _2734 * _2758;
    float _2800 = _2790 * _2766;
    float _2802 = -_2768;
    float _2804 = fma(_2762, _2776, _2802);
    float _2806 = -_2776;
    float _2808 = fma(_2762, _2768, _2806);
    float _2810 = _2784 * _2798;
    float _2812 = _2792 * _2800;
    float _2814 = -_2800;
    float _2816 = _2762 * _2814;
    float _2818 = _227 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2820 = fma(_2782, _2810, _2812);
    float _2822 = _2730 * _2786;
    float _2824 = _2714 * _2786;
    float _2826 = _2788 * _2800;
    float _2828 = _2740 * _2786;
    float _2830 = _2696 * _2822;
    float _2832 = _2692 * _2824;
    float _2834 = fma(_2794, _2810, _2816);
    float _2836 = fma(_2808, _2754, _2820);
    float _2838 = -_2830;
    float _2840 = fma(_2690, _2824, _2838);
    float _2842 = -_2832;
    float _2844 = fma(_2696, _2828, _2842);
    float _2846 = fma(_2804, _2810, _2826);
    float _2848 = fma(_2796, _2754, _2834);
    float _2850 = _2840 * _2836;
    float _2852 = _2844 * _2836;
    float _2854 = fma(_2778, _2754, _2846);
    float _2856 = _2690 * _2828;
    float _2858 = fma(_2828, _2848, _2850);
    float _2860 = fma(_2822, _2848, _2852);
    float _2862 = _2782 * _2844;
    float _2864 = -_2856;
    float _2866 = fma(_2692, _2822, _2864);
    float _2868 = fma(_2692, _2854, _2858);
    float _2870 = fma(_2690, _2854, _2860);
    float _2872 = _2782 * _2840;
    float _2874 = _2782 * _2866;
    float _2876 = _1568 + _2868;
    float _2878 = _1546 + _2870;
    float _2880 = _2792 * _2844;
    float _2882 = _2792 * _2866;
    float _2884 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2886 = _2876 + _2884;
    float _2888 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2890 = _2878 + _2888;
    float _2892 = _2792 * _2840;
    float _2894 = _2808 * _2844;
    float _2896 = _2886 * _2886;
    float _2898 = _2890 * _2890;
    float _2900 = _2808 * _2840;
    float _2902 = _2808 * _2866;
    float _2904 = fma(_2794, _2822, _2862);
    float _2906 = _2898 + _2896;
    float _2908 = fma(_2794, _2824, _2874);
    float _2910 = fma(_2794, _2828, _2872);
    float _2912 = fma(_2818, _2818, 1.0);
    float _2914 = sqrt(_2906);
    float _2916 = _2866 * _2836;
    float _2918 = -_2762;
    float _2920 = fma(_2918, _2828, _2892);
    float _2922 = fma(_2796, _2824, _2902);
    float _2924 = fma(_2796, _2828, _2900);
    float _2926 = fma(_2824, _2848, _2916);
    float _2928 = -_2762;
    float _2930 = fma(_2928, _2822, _2880);
    float _2932 = -_2762;
    float _2934 = fma(_2932, _2824, _2882);
    float _2936 = rsqrt(_2912);
    float _2938 = fma(_2696, _2854, _2926);
    float _2940 = fma(_2796, _2822, _2894);
    float _2942 = _1454 + _2938;
    bool _2944 = _2914 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2946 = _2796;
    float _2948 = _2898;
    float _2950 = _2896;
    float _2952 = _2876;
    float _2954 = _2878;
    float _2956 = _2900;
    if (!_2944)
    {
        _2946 = _2898;
    }
    float _2958 = _2946;
    float _2960 = _2958;
    if (!_2944)
    {
        _2948 = _2942;
    }
    float _2962 = _2948;
    bool _2964 = !_2944;
    float _2966 = _2962;
    if (!_2964)
    {
        float _2968 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2970 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2972 = _2914 + _2970;
        float _2974 = rsqrt(_2906);
        float _2976 = _2972 * _2968;
        float _2978 = _2942 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2980 = _2976 * 0.15915493667125701904296875;
        float _2982 = _2980 * 6.283185482025146484375;
        float _2984 = sin(_2982);
        float _2986 = _2980 * 6.283185482025146484375;
        float _2988 = cos(_2986);
        float _2990 = fma(_2984, _2978, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2992 = _2974 * _2990;
        float _2994 = fma(_2890, _2992, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2996 = _2988 + (-1.0);
        float _2998 = fma(_2886, _2992, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _3000 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _3002 = _2994 + _3000;
        float _3004 = _2996 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3006 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _3008 = _2998 + _3006;
        float _3010 = _3002 * _3002;
        float _3012 = fma(_2942, _2988, _3004);
        float _3014 = _3008 * _3008;
        _2966 = _3012;
        _2960 = _3010;
        _2950 = _3014;
        _2952 = _2998;
        _2954 = _2994;
    }
    float _3016 = _2966;
    float _3018 = _2960;
    float _3020 = _2950;
    float _3022 = _2952;
    float _3024 = _2954;
    float _3026 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3028 = _3016 + _3026;
    float _3030 = fma(_2788, _2690, _2930);
    float _3032 = fma(_2788, _2696, _2934);
    float _3034 = fma(_2788, _2692, _2920);
    float _3036 = fma(_3028, _3028, _3018);
    float _3038 = fma(_2778, _2690, _2940);
    float _3040 = fma(_2778, _2696, _2922);
    float _3042 = fma(_2778, _2692, _2924);
    float _3044 = _3036 + _3020;
    float _3046 = fma(_2804, _2690, _2904);
    float _3048 = fma(_2804, _2696, _2908);
    float _3050 = _2818 * _2936;
    float _3052 = _223 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3054 = _2818 * _3030;
    float _3056 = fma(_2804, _2692, _2910);
    float _3058 = _2818 * _3032;
    float _3060 = _2818 * _3034;
    float _3062 = -_3038;
    float _3064 = _3050 * _3062;
    float _3066 = -_3040;
    float _3068 = _3050 * _3066;
    float _3070 = -_3042;
    float _3072 = _3050 * _3070;
    float _3074 = fma(_3052, _3046, _3054);
    float _3076 = sqrt(_3044);
    float _3078 = fma(_3052, _3048, _3058);
    float _3080 = fma(_3052, _3056, _3060);
    float _3082 = fma(_2936, _3030, _3064);
    float _3084 = fma(_2936, _3032, _3068);
    float _3086 = _3040 + _3078;
    float _3088 = fma(_2936, _3034, _3072);
    float _3090 = _3038 + _3074;
    float _3092 = _3042 + _3080;
    out.m_80.x = _3046;
    out.m_80.y = _3048;
    out.m_80.z = _3056;
    out.m_82.x = _3082;
    out.m_82.y = _3084;
    out.m_82.z = _3088;
    bool _3094 = _3076 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _3096 = isnan(_3076);
    bool _3098 = _3094 || _3096;
    bool _3100 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _3102 = _3098 || _3100;
    out.m_84.x = _3090;
    out.m_84.y = _3086;
    out.m_84.z = _3092;
    if (!_3102)
    {
        _2956 = 1.0;
    }
    float _3104 = _2956;
    bool _3106 = !_3102;
    float _3108 = _3104;
    if (!_3106)
    {
        bool _3110 = _3076 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _3112 = isnan(_3076);
        bool _3114 = _3110 || _3112;
        bool _3116 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _3118 = _3114 || _3116;
        if (!_3118)
        {
            float _3120 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3122 = _3076 + _3120;
            float _3124 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3126 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _3124;
            float _3128 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _3130 = _3128 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _3132 = 1.0 / _3126;
            float _3134 = _3122 * _3132;
            float _3136 = fma(_3134, _3130, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _3108 = _3136;
            _3138 = true;
        }
        else
        {
            bool _3140 = _3076 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _3142 = isnan(_3076);
            bool _3144 = _3140 || _3142;
            bool _3146 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _3148 = _3144 || _3146;
            if (!_3148)
            {
                float _3150 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3152 = _3076 + _3150;
                float _3154 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3156 = _3154 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _3158 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _3160 = _3158 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _3162 = 1.0 / _3156;
                float _3164 = _3152 * _3162;
                float _3166 = fma(_3164, _3160, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _3108 = _3166;
                _3138 = true;
            }
            else
            {
                _3108 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _3138 = false;
    float _3168 = _3108;
    float _3170 = fma(_2458, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _3172 = fma(_2476, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _3174 = floor(_3170);
    float _3176 = floor(_3172);
    float _3178 = -_3174;
    float _3180 = _3170 + _3178;
    float _3182 = -_3176;
    float _3184 = _3172 + _3182;
    float2 _9116 = float2(_3180, _3184);
    float _3186 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_9116, float2(0.0), isnan(_9116)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_9116, float2(0.0), isnan(_9116)), level(0.0)).x;
    float _3188 = _2448 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3190 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _3192 = _3016 + _3190;
    float _3194 = fma(_2458, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3188);
    float _3196 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _3198 = _3022 + _3196;
    float _3200 = fma(_2476, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3194);
    float _3202 = _2448 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3204 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    bool _3206 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _3208 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _3210 = _3206 || _3208;
    bool _3212 = isnan(0.5);
    bool _3214 = _3210 || _3212;
    float _3216 = _3200 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3218 = fma(_2458, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3202);
    float _3220 = _2448 + _3204;
    float _3222 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _3224 = _3024 + _3222;
    float _3226 = 1.0 / _3216;
    float _3228 = fma(_2476, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3218);
    float _3230 = _3220 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _3232 = fma(_3224, _3168, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _3234 = fma(_3192, _3168, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _3236 = _3228 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3238 = fma(_2458, (*spvDescriptorSet0.vp_c15)._m0[126].x, _3230);
    float _3240 = fma(_3198, _3168, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _3242 = -_2442;
    float _3244 = fma(_3242, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3234);
    float _3246 = _3236 + _3216;
    float _3248 = fma(_2476, (*spvDescriptorSet0.vp_c15)._m0[126].z, _3238);
    float _3250 = -_2454;
    float _3252 = fma(_3250, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3240);
    float _3254 = _3248 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _3256 = _3246 * _3226;
    float _3258 = _3256 * 0.5;
    float _3260 = trunc(_3254);
    int _3262 = int(_3260);
    float _3264 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3266 = fma(_3258, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3264);
    float _3268 = 1.0 / _3266;
    int _3270 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _3272 = _3262 + _3270;
    int _3274 = _3272 + 1;
    float _3276 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3278 = _3268 * _3276;
    float _3280 = _3220 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    bool _3282 = _3278 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _3284 = fma(_2458, (*spvDescriptorSet0.vp_c15)._m0[127].x, _3280);
    bool _3286 = _3278 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _3288 = !_3282;
    int _3290 = _3288 ? 0 : 1;
    float _3292 = fma(_2476, (*spvDescriptorSet0.vp_c15)._m0[127].z, _3284);
    float _3294 = _3292 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    int _3296 = 2;
    float _3298 = _3244;
    float _3300 = _3252;
    int _3302 = _3274;
    float _3304 = _3254;
    if (!_3282)
    {
        _3296 = 1;
    }
    int _3306 = _3296;
    float _3308 = trunc(_3294);
    int _3310 = int(_3308);
    int _3312 = _3306;
    if (!_3286)
    {
        _3312 = _3290;
    }
    int _3314 = _3312;
    bool _3316 = _3274 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _3318 = _3314 << 6;
    int _3320 = _3318 + 48;
    uint _3322 = uint(int(uint(_3320) >> uint(2)));
    uint _3324 = uint(int(uint(int(_3322)) >> uint(2)));
    int _3326 = int(_3322) & 3;
    float _3328 = (*spvDescriptorSet0.vp_c15)._m0[int(_3324)][_3326];
    int _3330 = int(_3322) + 1;
    uint _3332 = uint(int(uint(_3330) >> uint(2)));
    int _3334 = _3330 & 3;
    float _3336 = (*spvDescriptorSet0.vp_c15)._m0[int(_3332)][_3334];
    int _3338 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _3340 = _3310 + _3338;
    int _3342 = _3340 + 1;
    int _3344 = _3318 + 56;
    uint _3346 = uint(int(uint(_3344) >> uint(2)));
    uint _3348 = uint(int(uint(int(_3346)) >> uint(2)));
    int _3350 = int(_3346) & 3;
    float _3352 = (*spvDescriptorSet0.vp_c15)._m0[int(_3348)][_3350];
    int _3354 = int(_3346) + 1;
    uint _3356 = uint(int(uint(_3354) >> uint(2)));
    int _3358 = _3354 & 3;
    float _3360 = (*spvDescriptorSet0.vp_c15)._m0[int(_3356)][_3358];
    int _3362 = _3274 | _3342;
    bool _3364 = _3362 < 0;
    bool _3366 = _3364 || _3316;
    int _3368 = _3318 + 64;
    uint _3370 = uint(int(uint(_3368) >> uint(2)));
    uint _3372 = uint(int(uint(int(_3370)) >> uint(2)));
    int _3374 = int(_3370) & 3;
    float _3376 = (*spvDescriptorSet0.vp_c15)._m0[int(_3372)][_3374];
    int _3378 = int(_3370) + 1;
    uint _3380 = uint(int(uint(_3378) >> uint(2)));
    int _3382 = _3378 & 3;
    float _3384 = (*spvDescriptorSet0.vp_c15)._m0[int(_3380)][_3382];
    float _3386 = -_2444;
    float _3388 = fma(_3386, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3232);
    bool _3390 = _3342 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _3392 = _3390 || _3366;
    int _3394 = _3318 + 72;
    uint _3396 = uint(int(uint(_3394) >> uint(2)));
    uint _3398 = uint(int(uint(int(_3396)) >> uint(2)));
    int _3400 = int(_3396) & 3;
    float _3402 = (*spvDescriptorSet0.vp_c15)._m0[int(_3398)][_3400];
    int _3404 = int(_3396) + 1;
    uint _3406 = uint(int(uint(_3404) >> uint(2)));
    int _3408 = _3404 & 3;
    float _3410 = (*spvDescriptorSet0.vp_c15)._m0[int(_3406)][_3408];
    int _3412 = _3318 + 96;
    uint _3414 = uint(int(uint(_3412) >> uint(2)));
    uint _3416 = uint(int(uint(int(_3414)) >> uint(2)));
    int _3418 = int(_3414) & 3;
    float _3420 = (*spvDescriptorSet0.vp_c15)._m0[int(_3416)][_3418];
    int _3422 = int(_3414) + 1;
    uint _3424 = uint(int(uint(_3422) >> uint(2)));
    int _3426 = _3422 & 3;
    float _3428 = (*spvDescriptorSet0.vp_c15)._m0[int(_3424)][_3426];
    int _3430 = _3318 + 104;
    uint _3432 = uint(int(uint(_3430) >> uint(2)));
    uint _3434 = uint(int(uint(int(_3432)) >> uint(2)));
    int _3436 = int(_3432) & 3;
    float _3438 = (*spvDescriptorSet0.vp_c15)._m0[int(_3434)][_3436];
    int _3440 = int(_3432) + 1;
    uint _3442 = uint(int(uint(_3440) >> uint(2)));
    int _3444 = _3440 & 3;
    float _3446 = (*spvDescriptorSet0.vp_c15)._m0[int(_3442)][_3444];
    float _3448 = _3388;
    float _3450 = as_type<float>(_3342);
    if (!_3214)
    {
        float _3452 = _2462 * _2462;
        float _3454 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3456 = -_1568;
        float _3458 = _3456 + _3240;
        float _3460 = -_1546;
        float _3462 = _3460 + _3232;
        float _3464 = fma(_2482, _2482, _3452);
        float _3466 = fma(_2488, _2488, _3464);
        float _3468 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3470 = sqrt(_3466);
        float _3472 = 1.0 / _2734;
        float _3474 = _3468 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3476 = precise::min(_3470, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3478 = _3476 * _3454;
        float _3480 = -_1454;
        float _3482 = _3480 + _3234;
        float _3484 = _3478 * _3472;
        float _3486 = _3474 * _3484;
        float _3488 = _3458 * _3484;
        float _3490 = fma(_3482, _3486, _2448);
        float _3492 = fma(_3462, _3486, _2458);
        float _3494 = fma(_3474, _3488, _2476);
        _3298 = _3490;
        _3448 = _3492;
        _2524 = as_type<int>(_3484);
        _3300 = _3494;
        _2526 = _3470;
    }
    float _3496 = _3298;
    float _3498 = _3448;
    int _3500 = _2524;
    float _3502 = _3300;
    float _3504 = _2526;
    float _3506 = _3220 * _3428;
    int _3508 = _3500;
    float _3510 = _3504;
    if (!_3392)
    {
        int _3512 = _3342 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _3514 = _3512 + _3274;
        _3302 = _3514;
    }
    int _3516 = _3302;
    float _3518 = _3496 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3520 = _3220 * _3384;
    float _3522 = fma(_2458, _3420, _3506);
    float _3524 = _3220 * _3336;
    if (!_3392)
    {
        int _3526 = _3516 << 2;
        _3508 = _3526;
    }
    int _3528 = _3508;
    float _3530 = fma(_3498, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3518);
    float _3532 = fma(_2476, _3438, _3522);
    float _3534 = fma(_2458, _3328, _3524);
    int _3536 = _3528;
    int _3538 = as_type<int>(_3532);
    if (!_3392)
    {
        int _3540 = 12 & _3528;
        _3536 = _3540;
    }
    int _3542 = _3536;
    int _3544 = _3318 + 80;
    uint _3546 = uint(int(uint(_3544) >> uint(2)));
    uint _3548 = uint(int(uint(int(_3546)) >> uint(2)));
    int _3550 = int(_3546) & 3;
    float _3552 = (*spvDescriptorSet0.vp_c15)._m0[int(_3548)][_3550];
    int _3554 = int(_3546) + 1;
    uint _3556 = uint(int(uint(_3554) >> uint(2)));
    int _3558 = _3554 & 3;
    float _3560 = (*spvDescriptorSet0.vp_c15)._m0[int(_3556)][_3558];
    float _3562 = _3532 + _3446;
    if (!_3392)
    {
        uint _3564 = uint(int(uint(_3516) >> uint(2)));
        _3538 = int(_3564);
    }
    int _3566 = _3538;
    float _3568 = fma(_3502, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3530);
    float _3570 = fma(_2458, _3376, _3520);
    float _3572 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    if (!_3392)
    {
        int _3574 = _3566 << 4;
        int _3576 = _3574 + _3542;
        _3450 = as_type<float>(_3576);
    }
    float _3578 = _3450;
    float _3580 = 1.0 / _3562;
    float _3582 = _3568 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    int _3584 = _3318 + 88;
    uint _3586 = uint(int(uint(_3584) >> uint(2)));
    uint _3588 = uint(int(uint(int(_3586)) >> uint(2)));
    int _3590 = int(_3586) & 3;
    float _3592 = (*spvDescriptorSet0.vp_c15)._m0[int(_3588)][_3590];
    int _3594 = int(_3586) + 1;
    uint _3596 = uint(int(uint(_3594) >> uint(2)));
    int _3598 = _3594 & 3;
    float _3600 = (*spvDescriptorSet0.vp_c15)._m0[int(_3596)][_3598];
    float _3602 = fma(_2476, _3352, _3534);
    float _3604 = fma(_2476, _3402, _3570);
    float _3606 = _3582 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3608 = _3496 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3610 = _3602 + _3360;
    float _3612 = _3604 + _3410;
    float _3614 = -_3606;
    float _3616 = fma(_3614, _3572, 1.0);
    float _3618 = _3578;
    if (!_3392)
    {
        int _3620 = as_type<int>(_3578) + 400;
        uint _3622 = uint(int(uint(_3620) >> uint(2)));
        uint _3624 = uint(int(uint(int(_3622)) >> uint(2)));
        int _3626 = int(_3622) & 3;
        float _3628 = (*spvDescriptorSet0.vp_c15)._m0[int(_3624)][_3626];
        _3618 = _3628;
    }
    float _3630 = _3618;
    float _3632 = _3496 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3634 = fma(_3498, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3608);
    float _3636 = _3496 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3638 = log2(_3616);
    float _3640 = fma(_3498, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3632);
    float _3642 = _3610 * _3580;
    float _3644 = fma(_3502, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3634);
    float _3646 = _3612 * _3580;
    float _3648 = fma(_3502, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3640);
    float _3650 = fma(_3498, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3636);
    bool _3652 = _3642 >= 0.0;
    float _3654 = _3644 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3656 = _3648 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3658 = fma(_3502, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3650);
    bool _3660 = _3642 <= 1.0;
    bool _3662 = _3660 && _3652;
    float _3664 = _3240;
    float _3666 = _3650;
    if (!_3392)
    {
        float _3668 = floor(_3254);
        _3664 = _3668;
    }
    float _3670 = _3664;
    float _3672 = _3656 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3674 = _3658 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    bool _3676 = _3646 >= 0.0;
    bool _3678 = _3676 && _3662;
    float _3680 = _3656 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3682 = fma(_3654, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3672);
    float _3684 = _3638 * 0.693147182464599609375;
    bool _3686 = _3646 <= 1.0;
    bool _3688 = _3686 && _3678;
    float _3690 = _3232;
    if (!_3392)
    {
        float _3692 = floor(_3294);
        _3690 = _3692;
    }
    float _3694 = _3690;
    float _3696 = fma(_3582, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3682);
    float _3698 = _3656 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3700 = _3684 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3702 = fma(_3674, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3696);
    float _3704 = fma(_3654, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3698);
    float _3706 = _3220 * _3560;
    float _3708 = _3670;
    if (!_3392)
    {
        float _3710 = -_3670;
        float _3712 = _3254 + _3710;
        _3708 = _3712;
    }
    float _3714 = _3708;
    float _3716 = 1.0 / _3702;
    float _3718 = fma(_3582, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3704);
    float _3720 = fma(_2458, _3552, _3706);
    if (_3688)
    {
        float _3722 = float(_3314);
        _3666 = _3722;
    }
    float _3724 = _3666;
    float _3726 = fma(_3654, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3680);
    float _3728 = fma(_2476, _3592, _3720);
    float _3730 = _3680;
    if (_3688)
    {
        float _3732 = rint(_3724);
        float _3734 = precise::max(_3732, 0.0);
        uint _3736 = uint(_3734);
        uint _3738 = clamp(_3736, 0u, 65535u);
        _3730 = as_type<float>(_3738);
    }
    float _3740 = _3730;
    float _3742 = fma(_3582, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3726);
    float _3744 = fma(_3674, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3718);
    float _3746 = _3728 + _3600;
    float _3748 = _3694;
    if (!_3392)
    {
        float _3750 = -_3694;
        float _3752 = _3294 + _3750;
        _3748 = _3752;
    }
    float _3754 = _3748;
    float _3756 = fma(_3674, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3742);
    float _3758 = _3746 * _3580;
    float _3760 = _3706;
    float _3762 = _3630;
    if (!_3392)
    {
        float _3764 = rint(_3630);
        float _3766 = precise::max(_3764, 0.0);
        uint _3768 = uint(_3766);
        uint _3770 = clamp(_3768, 0u, 65535u);
        _3760 = as_type<float>(_3770);
    }
    float _3772 = _3760;
    float _3774 = _3744 * _3716;
    float _3776 = _3756 * _3716;
    float _3778 = fma(_3774, 0.5, 0.5);
    float _3780 = fma(_3776, -0.5, 0.5);
    float _3782 = _3646;
    if (_3688)
    {
        float3 _10134 = float3(_3642, _3646, float(as_type<int>(_3740)));
        float3 _10138 = select(_10134, float3(0.0), isnan(_10134));
        float _3784 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _10138.xy, uint(rint(_10138.z)), _3758, level(0.0));
        _3782 = _3784;
    }
    float _3786 = _3782;
    float3 _10148 = float3(_3778, _3780, _3700);
    float _3788 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_10148, float3(0.0), isnan(_10148)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_10148, float3(0.0), isnan(_10148)), level(0.0)).x;
    float3 _10157 = float3(_3778, _3780, _3700);
    float4 _3791 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_10157, float3(0.0), isnan(_10157)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_10157, float3(0.0), isnan(_10157)), level(0.0)).xyzw;
    float _3793 = _3791.x;
    float _3795 = _3791.y;
    float _3797 = _3791.z;
    float _3799 = _3791.w;
    float _3801 = _3714;
    if (!_3392)
    {
        float3 _10180 = float3(_3714, _3754, float(as_type<int>(_3772)));
        float3 _10182 = select(_10180, float3(0.0), isnan(_10180));
        float _3803 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _10182.xy, uint(rint(_10182.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _10182.xy, uint(rint(_10182.z)), level(0.0)).x;
        _3801 = _3803;
    }
    float _3805 = _3801;
    if (_3392)
    {
        _3304 = 1.0;
    }
    float _3807 = _3304;
    float _3809 = _3807;
    if (!_3392)
    {
        int _3811 = _3516 << 4;
        int _3813 = _3811 + 2048;
        uint _3815 = uint(int(uint(_3813) >> uint(2)));
        uint _3817 = uint(int(uint(int(_3815)) >> uint(2)));
        int _3819 = int(_3815) & 3;
        float _3821 = (*spvDescriptorSet0.vp_c15)._m0[int(_3817)][_3819];
        int _3823 = int(_3815) + 1;
        uint _3825 = uint(int(uint(_3823) >> uint(2)));
        int _3827 = _3823 & 3;
        float _3829 = (*spvDescriptorSet0.vp_c15)._m0[int(_3825)][_3827];
        int _3831 = _3813 + 8;
        uint _3833 = uint(int(uint(_3831) >> uint(2)));
        uint _3835 = uint(int(uint(int(_3833)) >> uint(2)));
        int _3837 = int(_3833) & 3;
        float _3839 = (*spvDescriptorSet0.vp_c15)._m0[int(_3835)][_3837];
        int _3841 = int(_3833) + 1;
        uint _3843 = uint(int(uint(_3841) >> uint(2)));
        int _3845 = _3841 & 3;
        float _3847 = (*spvDescriptorSet0.vp_c15)._m0[int(_3843)][_3845];
        float _3849 = _3220 * _3829;
        float _3851 = fma(_2458, _3821, _3849);
        float _3853 = fma(_2476, _3839, _3851);
        float _3855 = _3853 + _3847;
        float _3857 = precise::clamp(_3855, 0.0, 1.0);
        float _3859 = -_3857;
        float _3861 = _3859 + _3805;
        float _3863 = fma(_3861, 500.0, 1.5);
        float _3865 = exp2(_3863);
        float _3867 = 0.0 + _3865;
        float _3869 = precise::clamp(_3867, 0.0, 1.0);
        _3809 = _3869;
    }
    float _3871 = _3809;
    float _3873 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3875 = _3496 + _3873;
    float _3877 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3879 = _3498 + _3877;
    float _3881 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3883 = _3502 + _3881;
    float _3885 = _3875 * _3875;
    float _3887 = fma(_3879, _3879, _3885);
    float _3889 = fma(_3883, _3883, _3887);
    float _3891 = rsqrt(_3889);
    float _3893 = sqrt(_3889);
    float _3895 = _3891 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3897 = _3879 * _3895;
    float _3899 = _3883 * _3895;
    float _3901 = _3897 * _3897;
    float _3903 = _3899 * _3899;
    float _3905 = _3901 + _3903;
    float _3907 = sqrt(_3905);
    bool _3909 = _3907 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3911 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3913 = _3907 + _3911;
    float _3915 = _3883;
    float _3917 = _3905;
    float _3919 = _3913;
    float _3921 = _3875;
    if (_3909)
    {
        float _3923 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3915 = _3923;
    }
    float _3925 = _3915;
    if (_3909)
    {
        float _3927 = rsqrt(_3905);
        _3917 = _3927;
    }
    float _3929 = _3917;
    if (_3909)
    {
        float _3931 = _3913 * _3925;
        _3919 = _3931;
    }
    float _3933 = _3919;
    if (_3909)
    {
        float _3935 = _3933 * 0.15915493667125701904296875;
        _3762 = _3935;
    }
    float _3937 = _3762;
    float _3939 = _3891;
    if (_3909)
    {
        float _3941 = _3937 * 6.283185482025146484375;
        float _3943 = sin(_3941);
        _3939 = _3943;
    }
    float _3945 = _3939;
    float _3947 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3949 = precise::max(0.0, _3947);
    float _3951 = _3780;
    float _3953 = _3949;
    float _3955 = _3947;
    if (_3909)
    {
        float _3957 = _3937 * 6.283185482025146484375;
        float _3959 = cos(_3957);
        _3951 = _3959;
    }
    float _3961 = _3951;
    float _3963 = -_3895;
    float _3965 = -_3949;
    float _3967 = fma(_3875, _3963, _3965);
    if (!_3909)
    {
        _3921 = _3899;
    }
    float _3969 = _3921;
    float _3971 = _3969;
    if (_3909)
    {
        float _3973 = _3967 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3953 = _3973;
    }
    float _3975 = _3953;
    float _3977 = _3975;
    float _3979 = _3945;
    if (_3909)
    {
        float _3981 = fma(_3945, _3975, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3977 = _3981;
    }
    float _3983 = _3977;
    float _3985 = _3983;
    if (!_3909)
    {
        _3979 = _3897;
    }
    float _3987 = _3979;
    float _3989 = _3987;
    float _3991 = _3961;
    if (_3909)
    {
        float _3993 = _3961 + (-1.0);
        _3955 = _3993;
    }
    float _3995 = _3955;
    float _3997 = _3995;
    if (_3909)
    {
        float _3999 = _3929 * _3983;
        _3510 = _3999;
    }
    float _4001 = _3510;
    if (!_3909)
    {
        _3985 = _3967;
    }
    float _4003 = _3985;
    float _4005 = _4003;
    if (_3909)
    {
        float _4007 = _3995 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3997 = _4007;
    }
    float _4009 = _3997;
    float _4011 = _4009;
    if (_3909)
    {
        float _4013 = _3897 * _4001;
        _3989 = _4013;
    }
    float _4015 = _3989;
    if (_3909)
    {
        float _4017 = _3899 * _4001;
        _3971 = _4017;
    }
    float _4019 = _3971;
    if (_3909)
    {
        float _4021 = fma(_3967, _3961, _4009);
        _4005 = _4021;
    }
    float _4023 = _4005;
    if (!_3909)
    {
        _4011 = _3901;
    }
    float _4025 = _4011;
    float _4027 = _4025;
    if (_3909)
    {
        float _4029 = _4015 * _4015;
        _4027 = _4029;
    }
    float _4031 = _4027;
    if (!_3909)
    {
        _3991 = _3903;
    }
    float _4033 = _3991;
    float _4035 = _4033;
    if (_3909)
    {
        float _4037 = _4019 * _4019;
        _4035 = _4037;
    }
    float _4039 = _4035;
    float _4041 = fma(_4023, _4023, _4031);
    float _4043 = _4041 + _4039;
    float _4045 = rsqrt(_4043);
    float _4047 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4049 = fma(_3893, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4047);
    float _4051 = precise::clamp(_4049, 0.0, 1.0);
    float _4053 = -_4051;
    float _4055 = _4053 + 1.0;
    float _4057 = abs(_4055);
    float _4059 = log2(_4057);
    float _4061 = _4045 * _4015;
    float _4063 = _4045 * _4023;
    float _4065 = _4045 * _4019;
    float _4067 = _4061 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4069 = -_4067;
    float _4071 = fma(_4063, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4069);
    float _4073 = _4059 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4075 = -_4065;
    float _4077 = fma(_4075, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4071);
    float _4079 = fma(_4077, -0.5, 0.5);
    float _4081 = exp2(_4073);
    float _4083 = fma(_4077, 0.5, 0.5);
    float _4085 = _4063 + 1.0;
    float _4087 = fma(_4083, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4089 = sqrt(_4079);
    float _4091 = fma(_4083, _4087, -0.212114393711090087890625);
    float _4093 = fma(_4083, _4091, 1.570728778839111328125);
    float _4095 = -_4063;
    float _4097 = fma(_4081, _4085, _4095);
    float _4099 = fma(_4097, 0.5, 0.5);
    float _4101 = _4089 * 0.636619746685028076171875;
    float _4103 = -_4093;
    float _4105 = fma(_4101, _4103, 1.0);
    float2 _10653 = float2(_4105, _4099);
    float3 _4109 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_10653, float2(0.0), isnan(_10653)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_10653, float2(0.0), isnan(_10653)), level(0.0)).xyz;
    float _4111 = _4109.x;
    float _4113 = _4109.y;
    float _4115 = _4109.z;
    float _4117 = abs(_3278);
    float _4119 = log2(_4117);
    float _4121 = _3656 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4123 = -_3186;
    float _4125 = _4123 + 1.0;
    float _4127 = fma(_3654, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4121);
    bool _4129 = _3278 <= 8000.0;
    bool _4131 = isnan(_3278);
    bool _4133 = _4129 || _4131;
    bool _4135 = isnan(8000.0);
    bool _4137 = _4133 || _4135;
    float _4139 = float(_4137);
    float _4141 = fma(_3582, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4127);
    float _4143 = _4119 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _4145 = exp2(_4143);
    float _4147 = fma(_4145, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4149 = precise::clamp(_4147, 0.0, 1.0);
    float _4151 = fma(_4149, -2.0, 3.0);
    float _4153 = _4149 * _4149;
    float _4155 = _4153 * _4151;
    float _4157 = _4059 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4159 = fma(_3674, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4141);
    float _4161 = -_4155;
    float _4163 = _4161 + 1.0;
    float _4165 = _4159 + _3702;
    float _4167 = exp2(_4157);
    float _4169 = fma(_4163, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4155);
    out.gl_Position.x = _3744;
    out.gl_Position.y = _3756;
    out.gl_Position.z = _4159;
    out.gl_Position.w = _3702;
    float _4171 = _4165 * 0.5;
    float _4173 = _4165;
    float _4175 = _4125;
    if (!_3688)
    {
        _4173 = 1.0;
    }
    float _4177 = _4173;
    float _4179 = _4139 * _4169;
    float _4181 = _4177;
    if (_3688)
    {
        bool _4183 = _3786 >= _3758;
        bool _4185 = isnan(_3786);
        bool _4187 = _4183 || _4185;
        bool _4189 = isnan(_3758);
        bool _4191 = _4187 || _4189;
        float _4193 = float(_4191);
        _4181 = _4193;
    }
    float _4195 = _4181;
    out.m_86.z = _4171;
    out.m_86.w = _3702;
    float _4197 = _4179 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    bool _4199 = _3893 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4201 = isnan(_3893);
    bool _4203 = _4199 || _4201;
    bool _4205 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4207 = _4203 || _4205;
    float _4209 = _4195 * _3871;
    float _4211 = _4125 * _4197;
    float _4213 = precise::clamp(_4211, 0.0, 1.0);
    float _4215 = -_4167;
    float _4217 = _4215 + 1.0;
    float _4219 = -_4213;
    float _4221 = fma(_4219, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4223 = _4217 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4225 = -_4209;
    float _4227 = fma(_4225, _4221, 1.0);
    float _4229 = precise::clamp(_4227, 0.0, 1.0);
    if (!_4207)
    {
        _4175 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4231 = _4175;
    float _4233 = _4223 * _3788;
    float _4235 = -_4223;
    float _4237 = _4235 + 1.0;
    float _4239 = _4229 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _4241 = _3799 * _4233;
    float _4243 = _3799 * _4237;
    out.m_88.x = _4239;
    float _4245 = _4115 * _4233;
    float _4247 = fma(_4111, _4241, _3793);
    float _4249 = fma(_4113, _4241, _3795);
    float _4251 = _4241;
    float _4253 = _4233;
    float _4255 = _4231;
    float _4257 = _4231;
    if (!_4207)
    {
        _4251 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4259 = _4251;
    float _4261 = fma(_3799, _4245, _3797);
    float _4263 = _4259;
    float _4265 = _4259;
    if (!_4207)
    {
        _4253 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4267 = _4253;
    out.m_90.x = _4247;
    out.m_90.y = _4249;
    out.m_90.z = _4261;
    out.m_90.w = _4243;
    bool _4269 = !_4207;
    float _4271 = _4267;
    float _4273 = _4267;
    if (!_4269)
    {
        bool _4275 = _3893 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4277 = isnan(_3893);
        bool _4279 = _4275 || _4277;
        bool _4281 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4283 = _4279 || _4281;
        if (!_4283)
        {
            float _4285 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4287 = _3893 + _4285;
            float _4289 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4291 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4289;
            float _4293 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4295 = _4293 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4297 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4299 = _4297 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4301 = 1.0 / _4291;
            float _4303 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4305 = _4303 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4307 = _4287 * _4301;
            float _4309 = precise::clamp(_4307, 0.0, 1.0);
            float _4311 = fma(_4309, _4295, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4313 = fma(_4309, _4299, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4315 = fma(_4309, _4305, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _4265 = _4313;
            _4257 = _4311;
            _4273 = _4315;
            _4317 = true;
        }
        else
        {
            bool _4319 = _3893 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4321 = isnan(_3893);
            bool _4323 = _4319 || _4321;
            bool _4325 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4327 = _4323 || _4325;
            if (!_4327)
            {
                _4255 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4329 = _4255;
            _4257 = _4329;
            if (!_4327)
            {
                _4263 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4331 = _4263;
            _4265 = _4331;
            if (!_4327)
            {
                _4271 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4333 = _4271;
            bool _4335 = !_4327;
            _4273 = _4333;
            if (!_4335)
            {
                bool _4337 = _3893 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4339 = isnan(_3893);
                bool _4341 = _4337 || _4339;
                bool _4343 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4345 = _4341 || _4343;
                if (!_4345)
                {
                    float _4347 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4349 = _3893 + _4347;
                    float _4351 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4353 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4351;
                    float _4355 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4357 = _4355 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4359 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4361 = _4359 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4363 = 1.0 / _4353;
                    float _4365 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4367 = _4365 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4369 = _4349 * _4363;
                    float _4371 = precise::clamp(_4369, 0.0, 1.0);
                    float _4373 = fma(_4371, _4357, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4375 = fma(_4371, _4361, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4377 = fma(_4371, _4367, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _4265 = _4375;
                    _4257 = _4373;
                    _4273 = _4377;
                    _4317 = true;
                }
                else
                {
                    _4265 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4257 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4273 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _4317 = false;
    float _4379 = _4265;
    float _4381 = _4257;
    float _4383 = _4273;
    float _4385 = _4379 * 0.586610972881317138671875;
    bool _4387 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_92.x = 0.0;
    float _4389 = fma(_4381, 0.298911988735198974609375, _4385);
    float _4391 = fma(_4383, 0.114477999508380889892578125, _4389);
    float _4393 = -_4391;
    float _4395 = _4393 + _4381;
    float _4397 = -_4391;
    float _4399 = _4397 + _4379;
    float _4401 = -_4391;
    float _4403 = _4401 + _4383;
    float _4405 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4407 = fma(_4395, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4391);
    float _4409 = fma(_4399, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4391);
    float _4411 = fma(_4403, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4391);
    out.m_61.x = _4405;
    out.m_94.x = _4407;
    out.m_94.y = _4409;
    out.m_94.z = _4411;
    if (!_4387)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _4413 = -_3496;
    float _4415 = _4413 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _4417 = -_3498;
    float _4419 = _4417 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _4421 = -_3502;
    float _4423 = _4421 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _4425 = _4415 * _4415;
    float _4427 = fma(_4419, _4419, _4425);
    float _4429 = fma(_4423, _4423, _4427);
    float _4431 = sqrt(_4429);
    float _4433 = rsqrt(_4429);
    float _4435 = -_4431;
    float _4437 = _4435 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4439 = _4437 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _4441 = precise::clamp(_4439, 0.0, 1.0);
    float _4443 = _4419 * _4433;
    float _4445 = _4415 * _4433;
    float _4447 = abs(_4441);
    float _4449 = log2(_4447);
    float _4451 = _4423 * _4433;
    float _4453 = _4443 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4455 = _3086 * _4445;
    float _4457 = -_4445;
    float _4459 = -_4453;
    float _4461 = fma(_4457, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4459);
    float _4463 = fma(_3090, _4443, _4455);
    float _4465 = -_4451;
    float _4467 = fma(_4465, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4461);
    float _4469 = fma(_3092, _4451, _4463);
    float _4471 = precise::clamp(_4469, 0.0, 1.0);
    float _4473 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _4475 = _4467 + _4473;
    float _4477 = _4449 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _4479 = _4475 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _4481 = precise::clamp(_4479, 0.0, 1.0);
    float _4483 = exp2(_4477);
    float _4485 = _4483 * _4481;
    float _4487 = _4471 * _4485;
    float _4489 = _4487 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4491 = _4487 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4493 = _4487 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_92.x = _4489;
    out.m_92.y = _4491;
    out.m_92.z = _4493;
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
    bool _4317 = false;
    bool _3138 = false;
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
        float _4550 = as_type<float>(_129);
        out.gl_Position.z = _4550;
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
        float _4620 = as_type<float>(_167);
        out.gl_Position.z = _4620;
    }
    if (_159)
    {
        return out;
    }
    float _169 = as_type<float>(int(gl_VertexIndex));
    float _171 = _147 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _173 = in.m_68.w;
    bool _175 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _177 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _179 = _175 || _177;
    bool _181 = isnan(1.0);
    bool _183 = _179 || _181;
    float _185 = in.m_63.x;
    float _187 = in.m_63.y;
    float _189 = in.m_63.z;
    float _191 = in.m_58.x;
    float _193 = in.m_58.y;
    float _195 = in.m_58.z;
    float _197 = 0.0;
    float _199 = _171;
    if (!_183)
    {
        float _201 = _171 * _171;
        float _203 = _201 * 0.5;
        _197 = _203;
    }
    float _205 = _197;
    float _207 = _205;
    if (!_183)
    {
        float _209 = _205 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _207 = _209;
    }
    float _211 = _207;
    int _213 = as_type<int>(_169) & 1;
    bool _215 = _213 != 0;
    int _217 = as_type<int>(_169) & 2;
    bool _219 = _217 != 0;
    bool _221 = !_215;
    float _223 = _221 ? (-0.5) : 0.5;
    bool _225 = !_219;
    float _227 = _225 ? (-0.5) : 0.5;
    bool _229 = !_183;
    float _231 = _211;
    if (!_229)
    {
        float _233 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _235 = log2(_233);
        float _237 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _239 = _237 + 1.0;
        float _241 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _243 = _171 * _235;
        float _245 = 1.0 / _239;
        float _247 = _241 * 0.693147182464599609375;
        float _249 = exp2(_243);
        float _251 = 1.0 / _247;
        float _253 = _249 + (-1.0);
        float _255 = -_253;
        float _257 = fma(_255, _251, _171);
        float _259 = _257 * _245;
        float _261 = _259 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _231 = _261;
    }
    float _263 = _231;
    bool _265 = !_183;
    if (!_265)
    {
        float _267 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _269 = log2(_267);
        float _271 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _273 = _271 + 1.0;
        float _275 = 1.0 / _273;
        float _277 = _171 * _269;
        float _279 = exp2(_277);
        float _281 = -_279;
        float _283 = _281 + 1.0;
        float _285 = _283 * _275;
        _199 = _285;
    }
    float _287 = _199;
    bool _289 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _291 = _263 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _293 = _263 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _295 = _263 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _297 = fma(_287, _185, _291);
    float _299 = fma(_287, _187, _293);
    float _301 = fma(_287, _189, _295);
    float _303 = fma(_297, _173, _191);
    float _305 = fma(_299, _173, _193);
    float _307 = fma(_301, _173, _195);
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
    float _343 = _305 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _345 = _305 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _347 = _305 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _349 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _351 = _349 != 0;
    float _353 = fma(_303, (*spvDescriptorSet0.vp_c10)._m0[4].x, _343);
    float _355 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _357 = int(_355);
    float _359 = float(_341);
    float _361 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _363 = int(_361);
    float _365 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _367 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _369 = float(_357);
    float _371 = 1.0 / _359;
    float _373 = as_type<float>(_357);
    if (_351)
    {
        float _375 = in.m_70.x;
        _373 = _375;
    }
    float _377 = _373;
    float _379 = _377;
    if (!_351)
    {
        float _381 = in.m_70.y;
        _379 = _381;
    }
    float _383 = _379;
    float _385 = float(uint(_363));
    float _387 = 1.0 / _369;
    int _389 = ~_363;
    int _391 = _389 + 1;
    bool _393 = _363 == 0;
    float _395 = _371 * _147;
    float _397 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _399 = int(_397);
    float _401 = 1.0 / _385;
    float _403 = _387 * _147;
    float _405 = trunc(_395);
    int _407 = int(_405);
    float _409 = float(uint(_399));
    int _411 = ~_399;
    int _413 = _411 + 1;
    int _415 = as_type<int>(_401) + (-2);
    float _417 = 1.0 / _409;
    float _419 = in.m_70.x;
    float _421 = in.m_70.y;
    float _423 = in.m_70.z;
    float _425 = in.m_70.w;
    float _427 = float(uint(_407));
    float _429 = trunc(_403);
    int _431 = int(_429);
    float _433 = as_type<float>(_415) * _427;
    float _435 = trunc(_433);
    float _437 = precise::max(_435, 0.0);
    uint _440 = uint(_437);
    int _442 = as_type<int>(_417) + (-2);
    float _444 = float(uint(_431));
    float _446 = _419 * 2.0;
    float _448 = _433;
    float _450 = as_type<float>(_391);
    if (_351)
    {
        _448 = 1.0;
    }
    float _452 = _448;
    float _454 = _452;
    if (!_351)
    {
        _454 = 1.2345600128173828125;
    }
    float _456 = _454;
    float _458 = as_type<float>(_442) * _444;
    int _460 = _391 * int(_440);
    int _462 = _460 + _407;
    float _464 = trunc(_458);
    float _466 = precise::max(_464, 0.0);
    uint _468 = uint(_466);
    if (_351)
    {
        _450 = 1.0;
    }
    float _470 = _450;
    float _472 = _470;
    if (!_351)
    {
        _472 = 7.345489978790283203125;
    }
    float _474 = _472;
    float _476 = float(uint(_462));
    int _478 = ~_399;
    int _480 = _478 + 1;
    float _482 = _474 * _419;
    float _484 = _383 * _456;
    float _486 = as_type<float>(_415) * _476;
    int _488 = ~_363;
    int _490 = _488 + 1;
    float _492 = trunc(_486);
    float _494 = precise::max(_492, 0.0);
    uint _496 = uint(_494);
    int _498 = _480 * int(_468);
    int _500 = _498 + _431;
    float _502 = float(uint(_500));
    float _504 = floor(_482);
    float _506 = float(_113);
    float _508 = as_type<float>(_442) * _502;
    float _510 = float(_407);
    int _512 = int(_440) + int(_496);
    float _514 = floor(_484);
    int _516 = _490 * _512;
    int _518 = _516 + _407;
    float _520 = -_504;
    float _522 = _482 + _520;
    float _524 = trunc(_508);
    float _526 = precise::max(_524, 0.0);
    uint _528 = uint(_526);
    bool _530 = uint(_518) >= uint(_363);
    float _532 = float(_363);
    bool _534 = !_530;
    int _536 = _534 ? 0 : (-1);
    bool _538 = _510 >= _532;
    bool _540 = isnan(_510);
    bool _542 = _538 || _540;
    bool _544 = isnan(_532);
    bool _546 = _542 || _544;
    float _548 = float(_546);
    float _550 = 1.0 / _506;
    float _552 = _522 * _532;
    int _554 = ~_512;
    int _556 = _554 + _536;
    int _558 = _556 + 1;
    float _560 = -_514;
    float _562 = _484 + _560;
    int _564 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _566 = _564 != 0;
    float _568 = trunc(_548);
    int _570 = int(_568);
    int _572 = int(_468) + int(_528);
    bool _574 = !_566;
    int _576 = _574 ? 0 : 1;
    float _578 = float(_399);
    int _580 = _413 * _572;
    int _582 = _580 + _431;
    float _584 = float(_431);
    float _586 = _550 * _147;
    int _588 = abs(_576);
    float _590 = trunc(_552);
    int _592 = int(_590);
    int _594 = _363 * _558;
    int _596 = _594 + _407;
    float _598 = _532 * _586;
    bool _600 = uint(_582) >= uint(_399);
    float _602 = _562 * _578;
    float _604 = _578 * _586;
    int _606 = ~_570;
    int _608 = _606 + 1;
    int _610 = _608 + 1;
    float _612 = trunc(_598);
    int _614 = int(_612);
    bool _616 = !_393;
    int _618 = _616 ? _596 : (-1);
    int _620 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _622 = _620 != 0;
    int _624 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _626 = _624 != 0;
    int _628 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _630 = _628 != 0;
    bool _632 = _584 >= _578;
    bool _634 = isnan(_584);
    bool _636 = _632 || _634;
    bool _638 = isnan(_578);
    bool _640 = _636 || _638;
    float _642 = float(_640);
    int _644 = _618 * _610;
    bool _646 = !_600;
    int _648 = _646 ? 0 : (-1);
    int _650 = _592 * _588;
    int _652 = _650 + _407;
    bool _654 = !_626;
    int _656 = _654 ? 0 : 1;
    int _658 = _363 + (-1);
    float _660 = trunc(_642);
    int _662 = int(_660);
    int _664 = ~_572;
    int _666 = _664 + _648;
    int _668 = _666 + 1;
    int _670 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _672 = _670 != 0;
    int _674 = _570 * _658;
    int _676 = _674 + _644;
    int _678 = abs(_656);
    bool _680 = !_622;
    int _682 = _680 ? 0 : 1;
    float _684 = trunc(_602);
    int _686 = int(_684);
    bool _688 = !_672;
    int _690 = _688 ? 0 : 1;
    int _692 = abs(_682);
    bool _694 = !_630;
    int _696 = _694 ? 0 : 1;
    int _698 = abs(_690);
    int _700 = _676 * _678;
    int _702 = _399 * _668;
    int _704 = _702 + _431;
    int _706 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _708 = _706 != 0;
    int _710 = abs(_696);
    int _712 = _614 * _692;
    int _714 = _712 + _700;
    float _716 = fma(_303, (*spvDescriptorSet0.vp_c10)._m0[5].x, _345);
    bool _718 = !_708;
    int _720 = _718 ? 0 : 1;
    float _722 = fma(_303, (*spvDescriptorSet0.vp_c10)._m0[6].x, _347);
    int _724 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _726 = _724 != 0;
    int _728 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _730 = _728 != 0;
    int _732 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _734 = _732 != 0;
    int _736 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _738 = _736 != 0;
    int _740 = _686 * _698;
    int _742 = _740 + _431;
    bool _744 = _399 == 0;
    int _746 = _652 * _710;
    int _748 = _746 + _714;
    int _750 = abs(_720);
    float _752 = trunc(_604);
    int _754 = int(_752);
    bool _756 = !_730;
    int _758 = _756 ? 0 : 1;
    float _760 = _419 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _762 = ~_662;
    int _764 = _762 + 1;
    int _766 = _764 + 1;
    int _768 = _592 * _750;
    int _770 = _768 + _748;
    bool _772 = !_744;
    int _774 = _772 ? _704 : (-1);
    int _776 = _399 + (-1);
    bool _778 = !_726;
    int _780 = _778 ? 0 : 1;
    int _782 = _774 * _766;
    int _784 = abs(_758);
    int _786 = abs(_780);
    int _788 = _662 * _776;
    int _790 = _788 + _782;
    bool _792 = !_734;
    int _794 = _792 ? 0 : 1;
    float _796 = float(uint(_770));
    int _798 = _790 * _784;
    int _800 = abs(_794);
    float _802 = as_type<float>(_415) * _796;
    bool _804 = !_738;
    int _806 = _804 ? 0 : 1;
    int _808 = _754 * _786;
    int _810 = _808 + _798;
    int _812 = abs(_806);
    float _814 = trunc(_802);
    float _816 = precise::max(_814, 0.0);
    uint _818 = uint(_816);
    float _820 = float(uint(_652));
    int _822 = _742 * _800;
    int _824 = _822 + _810;
    int _826 = ~_363;
    int _828 = _826 + 1;
    int _830 = ~_399;
    int _832 = _830 + 1;
    int _834 = _686 * _812;
    int _836 = _834 + _824;
    float _838 = as_type<float>(_415) * _820;
    bool _840 = _363 == 0;
    float _842 = float(uint(_836));
    float _844 = trunc(_838);
    float _846 = precise::max(_844, 0.0);
    uint _848 = uint(_846);
    float _850 = as_type<float>(_442) * _842;
    int _852 = _828 * int(_818);
    int _854 = _852 + _770;
    int _856 = ~_363;
    int _858 = _856 + 1;
    float _860 = trunc(_850);
    float _862 = precise::max(_860, 0.0);
    uint _864 = uint(_862);
    float _866 = float(uint(_854));
    float _868 = float(uint(_742));
    float _870 = as_type<float>(_415) * _866;
    int _872 = _858 * int(_848);
    int _874 = _872 + _652;
    float _876 = as_type<float>(_442) * _868;
    float _878 = trunc(_870);
    float _880 = precise::max(_878, 0.0);
    uint _882 = uint(_880);
    float _884 = float(uint(_874));
    int _886 = _832 * int(_864);
    int _888 = _886 + _836;
    float _890 = as_type<float>(_415) * _884;
    int _892 = ~_363;
    int _894 = _892 + 1;
    float _896 = trunc(_876);
    float _898 = precise::max(_896, 0.0);
    uint _900 = uint(_898);
    float _902 = float(uint(_888));
    float _904 = as_type<float>(_442) * _902;
    float _906 = trunc(_890);
    float _908 = precise::max(_906, 0.0);
    uint _910 = uint(_908);
    int _912 = int(_818) + int(_882);
    float _914 = trunc(_904);
    float _916 = precise::max(_914, 0.0);
    uint _918 = uint(_916);
    int _920 = _894 * _912;
    int _922 = _920 + _770;
    int _924 = _832 * int(_900);
    int _926 = _924 + _742;
    bool _928 = uint(_922) >= uint(_363);
    int _930 = int(_848) + int(_910);
    float _932 = float(uint(_926));
    bool _934 = !_928;
    int _936 = _934 ? 0 : (-1);
    int _938 = ~_363;
    int _940 = _938 + 1;
    int _942 = ~_399;
    int _944 = _942 + 1;
    int _946 = int(_864) + int(_918);
    int _948 = ~_912;
    int _950 = _948 + _936;
    int _952 = _950 + 1;
    float _954 = as_type<float>(_442) * _932;
    int _956 = _940 * _930;
    int _958 = _956 + _652;
    int _960 = _944 * _946;
    int _962 = _960 + _836;
    float _964 = trunc(_954);
    float _966 = precise::max(_964, 0.0);
    uint _968 = uint(_966);
    int _970 = _363 * _952;
    int _972 = _970 + _770;
    bool _974 = uint(_958) >= uint(_363);
    bool _976 = uint(_962) >= uint(_399);
    bool _978 = !_974;
    int _980 = _978 ? 0 : (-1);
    bool _982 = !_976;
    int _984 = _982 ? 0 : (-1);
    bool _986 = !_840;
    int _988 = _986 ? _972 : (-1);
    int _990 = ~_946;
    int _992 = _990 + _984;
    int _994 = _992 + 1;
    int _996 = ~_930;
    int _998 = _996 + _980;
    int _1000 = _998 + 1;
    int _1002 = _988 >> 31;
    int _1004 = _399 * _994;
    int _1006 = _1004 + _836;
    int _1008 = _988 & 3;
    bool _1010 = _1008 != 0;
    int _1012 = _363 * _1000;
    int _1014 = _1012 + _652;
    int _1016 = _1002 & 3;
    bool _1018 = !_744;
    int _1020 = _1018 ? _1006 : (-1);
    bool _1022 = uint(_1008) > 1u;
    int _1024 = _988 & 3;
    bool _1026 = _1024 != 0;
    int _1028 = _988 + _1016;
    bool _1030 = _1008 != 3;
    int _1032 = _1020 >> 31;
    int _1034 = _1026 ? 0 : 1;
    int _1036 = _1028 >> 2;
    bool _1038 = uint(_1008) >= 2u;
    int _1040 = _1032 & 3;
    int _1042 = _1036 << 4;
    int _1044 = _1042 + 368;
    int _1046 = _1038 ? 0 : 1;
    int _1048 = _1020 + _1040;
    int _1050 = ~_1034;
    int _1052 = _1050 + 1;
    int _1054 = _1052 + 1;
    int _1056 = _1054;
    if (!_1022)
    {
        int _1058 = ~_1034;
        int _1060 = _1058 + 1;
        _1056 = _1060;
    }
    int _1062 = _1056;
    uint _1064 = uint(int(uint(_1044) >> uint(2)));
    uint _1066 = uint(int(uint(int(_1064)) >> uint(2)));
    int _1068 = int(_1064) & 3;
    float _1070 = (*spvDescriptorSet0.vp_c9)._m0[int(_1066)][_1068];
    int _1072 = int(_1064) + 1;
    uint _1074 = uint(int(uint(_1072) >> uint(2)));
    int _1076 = _1072 & 3;
    float _1078 = (*spvDescriptorSet0.vp_c9)._m0[int(_1074)][_1076];
    int _1080 = ~_1046;
    int _1082 = _1080 + 1;
    int _1084 = _1082 + 1;
    int _1086 = _1048 >> 2;
    int _1088 = _1084;
    if (_1030)
    {
        int _1090 = ~_1046;
        int _1092 = _1090 + 1;
        _1088 = _1092;
    }
    int _1094 = _1088;
    int _1096 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1098 = _1096 != 0;
    int _1100 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1102 = _1100 != 0;
    int _1104 = _1086 << 4;
    int _1106 = _1104 + 512;
    bool _1108 = !_1098;
    int _1110 = _1108 ? 0 : 1;
    bool _1112 = !_1102;
    int _1114 = _1112 ? 0 : 1;
    int _1116 = _1020 & 3;
    bool _1118 = _1116 != 0;
    int _1120 = _1020 & 3;
    bool _1122 = _1120 != 0;
    uint _1124 = uint(int(uint(_1106) >> uint(2)));
    uint _1126 = uint(int(uint(int(_1124)) >> uint(2)));
    int _1128 = int(_1124) & 3;
    float _1130 = (*spvDescriptorSet0.vp_c9)._m0[int(_1126)][_1128];
    int _1132 = int(_1124) + 1;
    uint _1134 = uint(int(uint(_1132) >> uint(2)));
    int _1136 = _1132 & 3;
    float _1138 = (*spvDescriptorSet0.vp_c9)._m0[int(_1134)][_1136];
    bool _1140 = !_840;
    int _1142 = _1140 ? _1014 : (-1);
    bool _1144 = _1008 != 3;
    bool _1146 = uint(_1120) >= 2u;
    int _1148 = _1118 ? 0 : 1;
    bool _1150 = _425 > 0.5;
    bool _1152 = !_1010;
    int _1154 = _1152 ? 0 : 1;
    int _1156 = _1146 ? 0 : 1;
    bool _1158 = !_1144;
    int _1160 = _1158 ? 0 : (-1);
    bool _1162 = uint(_1120) > 1u;
    bool _1164 = _1120 != 3;
    bool _1166 = _1120 != 3;
    int _1168 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1170 = _1168 != 0;
    int _1172 = _1044 + 8;
    uint _1174 = uint(int(uint(_1172) >> uint(2)));
    uint _1176 = uint(int(uint(int(_1174)) >> uint(2)));
    int _1178 = int(_1174) & 3;
    float _1180 = (*spvDescriptorSet0.vp_c9)._m0[int(_1176)][_1178];
    int _1182 = int(_1174) + 1;
    uint _1184 = uint(int(uint(_1182) >> uint(2)));
    int _1186 = _1182 & 3;
    float _1188 = (*spvDescriptorSet0.vp_c9)._m0[int(_1184)][_1186];
    int _1190 = ~_1148;
    int _1192 = _1190 + 1;
    int _1194 = _1192 + 1;
    int _1196 = abs(_1062);
    int _1198 = int(_900) + int(_968);
    int _1200 = _1194;
    if (!_1162)
    {
        int _1202 = ~_1148;
        int _1204 = _1202 + 1;
        _1200 = _1204;
    }
    int _1206 = _1200;
    int _1208 = _1106 + 8;
    uint _1210 = uint(int(uint(_1208) >> uint(2)));
    uint _1212 = uint(int(uint(int(_1210)) >> uint(2)));
    int _1214 = int(_1210) & 3;
    float _1216 = (*spvDescriptorSet0.vp_c9)._m0[int(_1212)][_1214];
    int _1218 = int(_1210) + 1;
    uint _1220 = uint(int(uint(_1218) >> uint(2)));
    int _1222 = _1218 & 3;
    float _1224 = (*spvDescriptorSet0.vp_c9)._m0[int(_1220)][_1222];
    int _1226 = ~_399;
    int _1228 = _1226 + 1;
    float _1230 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1232 = int(_1230);
    int _1234 = abs(_1206);
    int _1236 = _1228 * _1198;
    int _1238 = _1236 + _742;
    int _1240 = abs(_1154);
    int _1242 = ~_1196;
    int _1244 = _1242 + 1;
    int _1246 = _1244 + 1;
    int _1248 = ~_1240;
    int _1250 = _1248 + 1;
    int _1252 = _1250 + 1;
    bool _1254 = !_1122;
    int _1256 = _1254 ? 0 : 1;
    int _1258 = _1246 * as_type<int>(_1078);
    int _1260 = ~_1234;
    int _1262 = _1260 + 1;
    int _1264 = _1262 + 1;
    bool _1266 = uint(_1238) >= uint(_399);
    int _1268 = _1252 * as_type<int>(_1070);
    int _1270 = _1268 + _1258;
    int _1272 = abs(_1256);
    int _1274 = _1264 * as_type<int>(_1138);
    int _1276 = ~_1156;
    int _1278 = _1276 + 1;
    int _1280 = _1278 + 1;
    int _1282 = _1280;
    if (_1164)
    {
        int _1284 = ~_1156;
        int _1286 = _1284 + 1;
        _1282 = _1286;
    }
    int _1288 = _1282;
    bool _1290 = !_1266;
    int _1292 = _1290 ? 0 : (-1);
    int _1294 = ~_1272;
    int _1296 = _1294 + 1;
    int _1298 = _1296 + 1;
    int _1300 = abs(_1094);
    int _1302 = abs(_1160);
    int _1304 = _1298 * as_type<int>(_1130);
    int _1306 = _1304 + _1274;
    int _1308 = abs(_1288);
    int _1310 = ~_1198;
    int _1312 = _1310 + _1292;
    int _1314 = _1312 + 1;
    int _1316 = ~_1300;
    int _1318 = _1316 + 1;
    int _1320 = _1318 + 1;
    int _1322 = _399 * _1314;
    int _1324 = _1322 + _742;
    int _1326 = ~_1308;
    int _1328 = _1326 + 1;
    int _1330 = _1328 + 1;
    bool _1332 = !_1166;
    int _1334 = _1332 ? 0 : (-1);
    int _1336 = _1320 * as_type<int>(_1180);
    int _1338 = _1336 + _1270;
    int _1340 = ~_1302;
    int _1342 = _1340 + 1;
    int _1344 = _1342 + 1;
    int _1346 = abs(_1110);
    int _1348 = _1330 * as_type<int>(_1216);
    int _1350 = _1348 + _1306;
    int _1352 = abs(_1334);
    int _1354 = _1344 * as_type<int>(_1188);
    int _1356 = _1354 + _1338;
    int _1358 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1360 = _1358 != 0;
    int _1362 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1364 = _1362 != 0;
    int _1366 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1368 = _1366 != 0;
    int _1370 = ~_1346;
    int _1372 = _1370 + 1;
    int _1374 = _1372 + 1;
    int _1376 = abs(_1114);
    float _1378 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1380 = ~_1352;
    int _1382 = _1380 + 1;
    int _1384 = _1382 + 1;
    int _1386 = _1356 * _1374;
    int _1388 = ~_1376;
    int _1390 = _1388 + 1;
    int _1392 = _1390 + 1;
    float _1394 = -_1378;
    float _1396 = fma(_760, 2.0, _1394);
    bool _1398 = !_744;
    int _1400 = _1398 ? _1324 : (-1);
    int _1402 = _1384 * as_type<int>(_1224);
    int _1404 = _1402 + _1350;
    float _1406 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _1408 = int(_1406);
    int _1410 = _1142 * _1346;
    int _1412 = _1410 + _1386;
    int _1414 = abs(_1232);
    int _1416 = _1404 * _1392;
    float _1418 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1420 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _1418;
    float _1422 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1424 = _1422 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    int _1426 = _1400 * _1376;
    int _1428 = _1426 + _1416;
    float _1430 = float(uint(_1232));
    float _1432 = fma(_307, (*spvDescriptorSet0.vp_c10)._m0[5].z, _716);
    float _1434 = float(uint(_1414));
    float _1436 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1438 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _1436;
    float _1440 = float(uint(_1412));
    float _1442 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _1444 = _1442 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _1446 = 1.0 / _1430;
    float _1448 = float(uint(_1408));
    float _1450 = _421 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1452 = abs(_1408);
    float _1454 = _1432 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1456 = -_147;
    float _1458 = fma(_1456, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1396);
    float _1460 = float(uint(_1452));
    float _1462 = 1.0 / _1448;
    float _1464 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1466 = fma(_1450, -2.0, _1464);
    float _1468 = 1.0 / _1434;
    int _1470 = as_type<int>(_1446) + (-2);
    float _1472 = fma(_307, (*spvDescriptorSet0.vp_c10)._m0[4].z, _353);
    float _1474 = float(uint(_1428));
    float _1476 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1478 = as_type<float>(_1470) * _1440;
    int _1480 = abs(_1412);
    float _1482 = 1.0 / _1420;
    int _1484 = as_type<int>(_1462) + (-2);
    float _1486 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1488 = float(uint(_1480));
    float _1490 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1492 = as_type<float>(_1484) * _1474;
    float _1494 = fma(_307, (*spvDescriptorSet0.vp_c10)._m0[6].z, _722);
    int _1496 = as_type<int>(_1468) + (-2);
    float _1498 = 1.0 / _1460;
    float _1500 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1502 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1504 = as_type<float>(_1496) * _1488;
    float _1506 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1508 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1510 = _337 + _1508;
    int _1512 = abs(_1428);
    float _1514 = trunc(_1478);
    float _1516 = precise::max(_1514, 0.0);
    uint _1518 = uint(_1516);
    float _1520 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1522 = _1476 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1524 = _1486 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1526 = _1490 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1528 = _1500 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1530 = _1502 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1532 = _1506 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1534 = trunc(_1504);
    float _1536 = precise::max(_1534, 0.0);
    uint _1538 = uint(_1536);
    float _1540 = _1510 * _1482;
    int _1542 = ~_1232;
    int _1544 = _1542 + 1;
    out.m_72.x = _1522;
    out.m_72.y = _1524;
    out.m_72.z = _1526;
    float _1546 = _1472 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    out.m_74.x = _1528;
    out.m_74.y = _1530;
    out.m_74.z = _1532;
    out.m_74.w = _1520;
    float _1548 = trunc(_1492);
    float _1550 = precise::max(_1548, 0.0);
    uint _1552 = uint(_1550);
    int _1554 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1556 = _1554 != 0;
    float _1558 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1466);
    float _1560 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _1562 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _1560;
    float _1564 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _1566 = _1564 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _1568 = _1494 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1570 = as_type<int>(_1498) + (-2);
    float _1572 = 1.0 / _1424;
    int _1574 = _1544 * int(_1518);
    int _1576 = _1574 + _1412;
    float _1578 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1580 = _337 + _1578;
    float _1582 = float(uint(_1512));
    float _1584 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _1586 = _337 + _1584;
    int _1588 = ~_1414;
    int _1590 = _1588 + 1;
    float _1592 = 1.0 / _1444;
    int _1594 = ~_1408;
    int _1596 = _1594 + 1;
    float _1598 = as_type<float>(_1570) * _1582;
    float _1600 = float(uint(_1576));
    int _1602 = _1590 * int(_1538);
    int _1604 = _1602 + _1480;
    int _1606 = _1596 * int(_1552);
    int _1608 = _1606 + _1428;
    float _1610 = 1.0 / _1438;
    float _1612 = as_type<float>(_1470) * _1600;
    float _1614 = float(uint(_1604));
    float _1616 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _1618 = _337 + _1616;
    float _1620 = _1580 * _1572;
    float _1622 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1624 = _337 + _1622;
    float _1626 = float(uint(_1608));
    float _1628 = as_type<float>(_1496) * _1614;
    float _1630 = 1.0 / _1566;
    float _1632 = _1618 * _1592;
    float _1634 = _419 + _421;
    float _1636 = _423 + _419;
    float _1638 = as_type<float>(_1484) * _1626;
    int _1640 = ~_1452;
    int _1642 = _1640 + 1;
    float _1644 = _1634 + (-1.0);
    float _1646 = _1636 + (-1.0);
    float _1648 = trunc(_1598);
    float _1650 = precise::max(_1648, 0.0);
    uint _1652 = uint(_1650);
    float _1654 = _1624 * _1610;
    float _1656 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _1658 = _337 + _1656;
    float _1660 = trunc(_1612);
    float _1662 = precise::max(_1660, 0.0);
    uint _1664 = uint(_1662);
    float _1666 = _1658 * _1630;
    float _1668 = fma(_1646, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _1670 = ~_1232;
    int _1672 = _1670 + 1;
    float _1674 = fma(_1644, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1676 = 1.0 / _1562;
    int _1678 = _1642 * int(_1652);
    int _1680 = _1678 + _1512;
    float _1682 = float(uint(_1680));
    float _1684 = floor(_446);
    int _1686 = int(_1518) + int(_1664);
    float _1688 = as_type<float>(_1570) * _1682;
    int _1690 = _1672 * _1686;
    int _1692 = _1690 + _1412;
    int _1694 = ~_1408;
    int _1696 = _1694 + 1;
    float _1698 = trunc(_1628);
    float _1700 = precise::max(_1698, 0.0);
    uint _1702 = uint(_1700);
    float _1704 = _1586 * _1676;
    float _1706 = trunc(_1638);
    float _1708 = precise::max(_1706, 0.0);
    uint _1710 = uint(_1708);
    bool _1712 = _1684 >= 0.0;
    bool _1714 = isnan(_1684);
    bool _1716 = _1712 || _1714;
    bool _1718 = isnan(0.0);
    bool _1720 = _1716 || _1718;
    int _1722 = int(_1538) + int(_1702);
    float _1724 = trunc(_1688);
    float _1726 = precise::max(_1724, 0.0);
    uint _1728 = uint(_1726);
    float _1730 = -_227;
    int _1732 = _1150 ? as_type<int>(_1730) : as_type<int>(_227);
    bool _1734 = _1684 > 0.0;
    int _1736 = ~_1414;
    int _1738 = _1736 + 1;
    int _1740 = as_type<int>(_1684);
    float _1742 = as_type<float>(_1642);
    float _1744 = as_type<float>(_1702);
    if (_1556)
    {
        _1740 = 0;
    }
    int _1746 = _1740;
    float _1748 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1750 = _1746;
    if (!_1556)
    {
        _1750 = 1;
    }
    int _1752 = _1750;
    int _1754 = _1738 * _1722;
    int _1756 = _1754 + _1480;
    bool _1758 = uint(_1692) >= uint(_1232);
    float _1760 = _423 + _421;
    int _1762 = int(_1552) + int(_1710);
    bool _1764 = !_1758;
    int _1766 = _1764 ? 0 : (-1);
    float _1768 = _1760 + (-1.0);
    bool _1770 = _419 > 0.5;
    int _1772 = _1696 * _1762;
    int _1774 = _1772 + _1428;
    bool _1776 = !_1360;
    float _1778 = _1776 ? _227 : as_type<float>(_1732);
    bool _1780 = uint(_1756) >= uint(_1414);
    int _1782 = int(_1734);
    int _1784 = _1720 ? 2 : 0;
    int _1786 = _1782 | _1784;
    int _1788 = _1780 ? 4 : 0;
    int _1790 = _1786 | _1788;
    int _1792 = _1364 ? 8 : 0;
    int _1794 = _1790 | _1792;
    int _1796 = _1770 ? 16 : 0;
    int _1798 = _1794 | _1796;
    int _1800 = _1368 ? 32 : 0;
    int _1802 = _1798 | _1800;
    int _1804 = _1170 ? 64 : 0;
    int _1806 = _1802 | _1804;
    int _1808 = _1806 & 16;
    bool _1810 = !_1780;
    int _1812 = _1810 ? 0 : (-1);
    bool _1814 = _1808 != 0;
    int _1816 = ~_1686;
    int _1818 = _1816 + _1766;
    int _1820 = _1818 + 1;
    float _1822 = -_223;
    int _1824 = _1814 ? as_type<int>(_1822) : as_type<int>(_223);
    bool _1826 = uint(_1774) >= uint(_1408);
    bool _1828 = _421 > 0.5;
    int _1830 = int(_1652) + int(_1728);
    float _1832 = _419 + (-0.5);
    int _1834 = ~_1452;
    int _1836 = _1834 + 1;
    bool _1838 = !_1170;
    float _1840 = _1838 ? _223 : as_type<float>(_1824);
    int _1842 = _1232 * _1820;
    int _1844 = _1842 + _1412;
    float _1846 = -_227;
    float _1848 = _1828 ? _1846 : _227;
    int _1850 = _1836 * _1830;
    int _1852 = _1850 + _1512;
    bool _1854 = _1752 != 1;
    bool _1856 = _1232 == 0;
    bool _1858 = !_1826;
    int _1860 = _1858 ? 0 : (-1);
    bool _1862 = !_1856;
    int _1864 = _1862 ? _1844 : (-1);
    int _1866 = ~_1762;
    int _1868 = _1866 + _1860;
    int _1870 = _1868 + 1;
    bool _1872 = uint(_1852) >= uint(_1452);
    int _1874 = ~_1812;
    int _1876 = _1722 + _1874;
    int _1878 = _1876 + 1;
    int _1880 = _1428 ^ _1408;
    int _1882 = _1408 * _1870;
    int _1884 = _1882 + _1428;
    bool _1886 = !_1872;
    int _1888 = _1886 ? 0 : (-1);
    bool _1890 = _1232 == 0;
    uint _1892 = uint(int(uint(_1880) >> uint(31)));
    int _1894 = _1412 ^ _1232;
    int _1896 = ~_1888;
    int _1898 = _1830 + _1896;
    int _1900 = _1898 + 1;
    int _1902 = ~int(_1892);
    int _1904 = _1902 + 1;
    float _1906 = _423 * 2.0;
    uint _1908 = uint(int(uint(_1894) >> uint(31)));
    bool _1910 = !_1364;
    float _1912 = _1910 ? _227 : _1848;
    int _1914 = _1900 ^ _1904;
    bool _1916 = _423 > 0.5;
    int _1918 = ~int(_1908);
    int _1920 = _1918 + 1;
    int _1922 = ~_1904;
    int _1924 = _1922 + _1914;
    int _1926 = _1924 + 1;
    float _1928 = -_223;
    int _1930 = _1916 ? as_type<int>(_1928) : as_type<int>(_223);
    float _1932 = floor(_1906);
    int _1934 = _1878 ^ _1920;
    bool _1936 = _1408 == 0;
    bool _1938 = _1408 == 0;
    float _1940 = _421 * 2.0;
    int _1942 = ~_1920;
    int _1944 = _1942 + _1934;
    int _1946 = _1944 + 1;
    float _1948 = floor(_1940);
    float _1950 = _421 + (-0.5);
    bool _1952 = !_1368;
    float _1954 = _1952 ? _223 : as_type<float>(_1930);
    bool _1956 = !_1936;
    int _1958 = _1956 ? _1884 : (-1);
    float _1960 = fma(_1768, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1962 = !_1890;
    int _1964 = _1962 ? _1946 : (-1);
    int _1966 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1968 = _1966 != 0;
    int _1970 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1972 = _1970 != 0;
    int _1974 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1976 = _1974 != 0;
    float _1978 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1980 = (*spvDescriptorSet0.vp_c9)._m0[198].y;
    float _1982 = _1848;
    if (!_1854)
    {
        _1980 = _421;
    }
    float _1984 = _1980;
    float _1986 = fma(_419, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1978);
    float _1988 = _1984;
    if (!_1854)
    {
        _1742 = _421;
    }
    float _1990 = _1742;
    float _1992 = _1990;
    if (_1854)
    {
        _1988 = _419;
    }
    float _1994 = _1988;
    float _1996 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1986);
    if (_1854)
    {
        _1992 = _419;
    }
    float _1998 = _1992;
    float _2000 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _2002 = !_1938;
    int _2004 = _2002 ? _1926 : (-1);
    float _2006 = _423 + (-0.5);
    if (!_1854)
    {
        _1982 = _423;
    }
    float _2008 = _1982;
    float _2010 = fma(_421, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2000);
    float _2012 = _2008;
    if (!_1854)
    {
        _1744 = _423;
    }
    float _2014 = _1744;
    bool _2016 = _1932 >= 0.0;
    bool _2018 = isnan(_1932);
    bool _2020 = _2016 || _2018;
    bool _2022 = isnan(0.0);
    bool _2024 = _2020 || _2022;
    float _2026 = _2014;
    if (_1854)
    {
        _2012 = _421;
    }
    float _2028 = _2012;
    float _2030 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _2032 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _2030;
    if (_1854)
    {
        _2026 = _421;
    }
    float _2034 = _2026;
    float _2036 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _2038 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _2036;
    int _2040 = _2024 ? 0 : 1;
    float _2042 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _2044 = _2042 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _2046 = !_1968;
    int _2048 = _2046 ? 0 : 1;
    float _2050 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _2052 = _2050 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _2054 = _1932 > 0.0;
    float _2056 = fma(_2044, _1620, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _2058 = _1948 > 0.0;
    float _2060 = fma(_2032, _1540, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _2062 = _1948 >= 0.0;
    bool _2064 = isnan(_1948);
    bool _2066 = _2062 || _2064;
    bool _2068 = isnan(0.0);
    bool _2070 = _2066 || _2068;
    float _2072 = fma(_2052, _1620, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _2074 = fma(_2038, _1540, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _2076 = _2028 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2078 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _2080 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _2078;
    float _2082 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _2084 = _2082 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _2086 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _2088 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _2086;
    float _2090 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _2092 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _2090;
    float _2094 = fma(_2080, _1654, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _2096 = fma(_2084, _1632, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _2098 = fma(_2088, _1654, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _2100 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _2102 = _2100 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _2104 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _2106 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _2104;
    float _2108 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _2110 = _2108 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _2112 = _1748 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2114 = fma(_2102, _1632, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _2116 = fma(_2106, _1704, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _2118 = fma(_2092, _1704, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _2120 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _2122 = _2120 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _2124 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _2126 = ~_2040;
    int _2128 = _2126 + 1;
    int _2130 = _2128 + 1;
    float _2132 = _1994 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _2134 = _2130;
    if (!_2054)
    {
        int _2136 = ~_2040;
        int _2138 = _2136 + 1;
        _2134 = _2138;
    }
    int _2140 = _2134;
    float _2142 = fma(_2122, _1666, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _2144 = fma(_2110, _1666, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _2146 = fma(_1998, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2124);
    float _2148 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2150 = fma(_2034, (*spvDescriptorSet0.vp_c9)._m0[83].w, _365);
    float _2152 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2154 = fma(_2076, -2.0, _367);
    float _2156 = float(_1864);
    float _2158 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2160 = _1546 + _2158;
    float _2162 = -_2152;
    float _2164 = fma(_2132, 2.0, _2162);
    float _2166 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2168 = _1454 + _2166;
    float _2170 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2172 = fma(_2112, _2156, _1458);
    float _2174 = float(_1964);
    float _2176 = _2168 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2178 = float(_2004);
    float _2180 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2182 = _1568 + _2180;
    float _2184 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2150);
    float _2186 = fma(_2160, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2176);
    float _2188 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2190 = _2148 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2192 = float(_1958);
    float _2194 = _1840 + 0.5;
    float _2196 = -_147;
    float _2198 = fma(_2196, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2164);
    float _2200 = fma(_2182, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2186);
    float _2202 = -_2184;
    float _2204 = _2202 + 1.0;
    float _2206 = fma(_2112, _2194, _2172);
    float _2208 = _2170 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2210 = fma(_2190, _2192, _2198);
    float _2212 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2154);
    float _2214 = _1912 + (-0.5);
    float _2216 = -_1558;
    float _2218 = fma(_2208, _2174, _2216);
    float _2220 = _1954 + 0.5;
    bool _2222 = _337 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _2224 = isnan(_337);
    bool _2226 = _2222 || _2224;
    bool _2228 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _2230 = _2226 || _2228;
    float _2232 = float(_2230);
    float _2234 = _2188 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2236 = fma(_2190, _2220, _2210);
    bool _2238 = _337 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _2240 = isnan(_337);
    bool _2242 = _2238 || _2240;
    bool _2244 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _2246 = _2242 || _2244;
    float _2248 = float(_2246);
    float _2250 = -_2208;
    float _2252 = fma(_2250, _2214, _2218);
    float _2254 = -_2212;
    float _2256 = fma(_2234, _2178, _2254);
    float _2258 = -_1996;
    float _2260 = _2258 + 1.0;
    bool _2262 = _337 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _2264 = isnan(_337);
    bool _2266 = _2262 || _2264;
    bool _2268 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _2270 = _2266 || _2268;
    float _2272 = float(_2270);
    float _2274 = -_2248;
    float _2276 = _2274 + 1.0;
    float _2278 = -_2232;
    float _2280 = _2278 + 1.0;
    float _2282 = -_2260;
    float _2284 = fma(_1840, _2282, _2206);
    float _2286 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2146);
    float _2288 = _1778 + (-0.5);
    float _2290 = _2272 * _2276;
    float _2292 = -_2272;
    float _2294 = _2292 + 1.0;
    float _2296 = _2248 * _2280;
    float _2298 = -_2286;
    float _2300 = _2298 + 1.0;
    float _2302 = -_2234;
    float _2304 = fma(_2302, _2288, _2256);
    bool _2306 = _337 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _2308 = isnan(_337);
    bool _2310 = _2306 || _2308;
    bool _2312 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _2314 = _2310 || _2312;
    float _2316 = float(_2314);
    float _2318 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2010);
    bool _2320 = _337 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _2322 = isnan(_337);
    bool _2324 = _2320 || _2322;
    bool _2326 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _2328 = _2324 || _2326;
    float _2330 = float(_2328);
    float _2332 = -_2300;
    float _2334 = fma(_1954, _2332, _2236);
    bool _2336 = _2200 >= 0.0;
    float _2338 = -_2318;
    float _2340 = _2338 + 1.0;
    bool _2342 = _337 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _2344 = isnan(_337);
    bool _2346 = _2342 || _2344;
    bool _2348 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _2350 = _2346 || _2348;
    float _2352 = float(_2350);
    float _2354 = _2316 * _2294;
    bool _2356 = _337 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _2358 = isnan(_337);
    bool _2360 = _2356 || _2358;
    bool _2362 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _2364 = _2360 || _2362;
    float _2366 = float(_2364);
    float _2368 = -_2316;
    float _2370 = _2368 + 1.0;
    float _2372 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2374 = log2(_2372);
    float _2376 = -_2330;
    float _2378 = _2376 + 1.0;
    float _2380 = fma(_1778, _2204, _2304);
    float _2382 = _2330 * _2370;
    float _2384 = _2168 * _2168;
    float _2386 = _2352 * _2378;
    float _2388 = -_2352;
    float _2390 = _2388 + 1.0;
    int _2392 = abs(_2048);
    float _2394 = fma(_2160, _2160, _2384);
    float _2396 = _2384;
    int _2398 = _2140;
    if (_2336)
    {
        _2396 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2400 = _2396;
    float _2402 = _2366 * _2390;
    float _2404 = fma(_1912, _2340, _2252);
    float _2406 = fma(_2182, _2182, _2394);
    float _2408 = float(_2140);
    float _2410 = _2060 * _2402;
    float _2412 = _2074 * _2402;
    float _2414 = _2374 * _147;
    float _2416 = in.m_76.x;
    float _2418 = in.m_76.y;
    float _2420 = in.m_76.z;
    float _2422 = rsqrt(_2406);
    if (_2336)
    {
        float _2424 = _2400 * 5.0;
        _2398 = as_type<int>(_2424);
    }
    int _2426 = _2398;
    float _2428 = float(_2392);
    out.m_78.x = _2284;
    out.m_78.y = _2404;
    out.m_78.z = _2334;
    out.m_78.w = _2380;
    bool _2430 = !_1972;
    int _2432 = _2430 ? 0 : 1;
    if (_2336)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7893 = as_type<float>(_2426);
        out.gl_Position.z = _7893;
    }
    float _2434 = exp2(_2414);
    float _2436 = _2428 * _2408;
    bool _2438 = !_1976;
    int _2440 = _2438 ? 0 : 1;
    if (_2336)
    {
        out.m_61.x = 0.0;
    }
    float _2442 = _2168 * _2422;
    float _2444 = _2160 * _2422;
    if (_2336)
    {
        return out;
    }
    float _2446 = -_2442;
    float _2448 = fma(_2446, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1454);
    float _2450 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2452 = 1.0 + _2450;
    float _2454 = _2182 * _2422;
    float _2456 = -_2444;
    float _2458 = fma(_2456, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1546);
    float _2460 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2462 = _2448 + _2460;
    bool _2464 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2466 = isnan(1.0);
    bool _2468 = _2464 || _2466;
    bool _2470 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2472 = _2468 || _2470;
    float _2474 = -_2454;
    float _2476 = fma(_2474, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1568);
    float _2478 = 1.0 / _2452;
    float _2480 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2482 = _2458 + _2480;
    float _2484 = _2462 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2486 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2488 = _2476 + _2486;
    int _2490 = _1720 ? 0 : 1;
    float _2492 = -_2434;
    float _2494 = _2492 + 1.0;
    float _2496 = fma(_2482, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2484);
    bool _2498 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2500 = isnan(0.0);
    bool _2502 = _2498 || _2500;
    bool _2504 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2506 = _2502 || _2504;
    float _2508 = _2436 * (-2.0);
    int _2510 = ~_2490;
    int _2512 = _2510 + 1;
    int _2514 = _2512 + 1;
    float _2516 = fma(_2488, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2496);
    float _2518 = -_2442;
    float _2520 = fma(_2518, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2168);
    int _2522 = _2514;
    int _2524 = as_type<int>(_2488);
    float _2526 = _2482;
    if (!_1734)
    {
        int _2528 = ~_2490;
        int _2530 = _2528 + 1;
        _2522 = _2530;
    }
    int _2532 = _2522;
    float _2534 = fma(_2508, _2416, _2416);
    float _2536 = _2506 ? _2494 : 0.0;
    float _2538 = -_2444;
    float _2540 = fma(_2538, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2160);
    bool _2542 = _2516 >= 0.0;
    float _2544 = _2520 * _2520;
    float _2546 = fma(_1674, _2508, _1674);
    float _2548 = _2534;
    if (_2472)
    {
        float _2550 = _2536 * _2478;
        _149 = _2550;
    }
    float _2552 = _149;
    float _2554 = fma(_1832, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2534);
    int _2556 = _2070 ? 0 : 1;
    float _2558 = fma(_2540, _2540, _2544);
    float _2560 = -_2454;
    float _2562 = fma(_2560, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2182);
    float _2564 = fma(_2546, _2552, _2554);
    int _2566 = ~_2556;
    int _2568 = _2566 + 1;
    int _2570 = _2568 + 1;
    float _2572 = fma(_2562, _2562, _2558);
    int _2574 = _2570;
    if (!_2058)
    {
        int _2576 = ~_2556;
        int _2578 = _2576 + 1;
        _2574 = _2578;
    }
    int _2580 = _2574;
    float _2582 = _2564 * 0.15915493667125701904296875;
    int _2584 = abs(_2432);
    if (_2542)
    {
        out.m_61.x = 0.0;
    }
    if (_2542)
    {
        _2548 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2586 = _2548;
    float _2588 = sqrt(_2572);
    float _2590 = float(_2580);
    int _2592 = as_type<int>(_2586);
    if (_2542)
    {
        float _2594 = _2586 * 5.0;
        _2592 = as_type<int>(_2594);
    }
    int _2596 = _2592;
    float _2598 = float(_2532);
    float _2600 = _2582 * 6.283185482025146484375;
    float _2602 = sin(_2600);
    float _2604 = float(_2584);
    int _2606 = abs(_2440);
    if (_2542)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _8164 = as_type<float>(_2596);
        out.gl_Position.z = _8164;
    }
    float _2608 = _2604 * _2598;
    if (_2542)
    {
        return out;
    }
    float _2610 = -_1454;
    float _2612 = _2610 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2614 = _2608 * (-2.0);
    float _2616 = -_1546;
    float _2618 = _2616 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2620 = float(_2606);
    float _2622 = _2612 * _2612;
    float _2624 = fma(_2614, _2418, _2418);
    float _2626 = -_1568;
    float _2628 = _2626 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2630 = -_2366;
    float _2632 = _2630 + 1.0;
    float _2634 = fma(_2618, _2618, _2622);
    float _2636 = fma(_1950, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2624);
    float _2638 = fma(_1960, _2614, _1960);
    float _2640 = fma(_2632, (*spvDescriptorSet0.vp_c9)._m0[143].x, _2410);
    float _2642 = fma(_2628, _2628, _2634);
    float _2644 = fma(_2632, (*spvDescriptorSet0.vp_c9)._m0[143].y, _2412);
    float _2646 = _2620 * _2590;
    float _2648 = fma(_2056, _2386, _2640);
    float _2650 = fma(_2638, _2552, _2636);
    float _2652 = fma(_2072, _2386, _2644);
    float _2654 = rsqrt(_2642);
    float _2656 = fma(_2094, _2382, _2648);
    float _2658 = _2646 * (-2.0);
    float _2660 = fma(_2098, _2382, _2652);
    float _2662 = _2650 * 0.15915493667125701904296875;
    float _2664 = fma(_2096, _2354, _2656);
    float _2666 = fma(_2658, _2420, _2420);
    float _2668 = fma(_2114, _2354, _2660);
    float _2670 = fma(_1668, _2658, _1668);
    float _2672 = fma(_2116, _2290, _2664);
    float _2674 = in.m_68.x;
    float _2676 = in.m_68.y;
    float _2678 = fma(_2006, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2666);
    float _2680 = fma(_2118, _2290, _2668);
    float _2682 = fma(_2142, _2296, _2672);
    float _2684 = _2582 * 6.283185482025146484375;
    float _2686 = cos(_2684);
    float _2688 = fma(_2670, _2552, _2678);
    float _2690 = _2618 * _2654;
    float _2692 = _2628 * _2654;
    float _2694 = fma(_2144, _2296, _2680);
    float _2696 = _2612 * _2654;
    float _2698 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2700 = _2690 * _2698;
    float _2702 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2704 = _2692 * _2702;
    float _2706 = fma(_2232, (*spvDescriptorSet0.vp_c9)._m0[149].x, _2682);
    float _2708 = fma(_2232, (*spvDescriptorSet0.vp_c9)._m0[149].y, _2694);
    float _2710 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2712 = -_2700;
    float _2714 = fma(_2692, _2710, _2712);
    float _2716 = _2662 * 6.283185482025146484375;
    float _2718 = sin(_2716);
    float _2720 = _2688 * 0.15915493667125701904296875;
    float _2722 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2724 = _2696 * _2722;
    float _2726 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2728 = -_2704;
    float _2730 = fma(_2696, _2726, _2728);
    float _2732 = _2714 * _2714;
    float _2734 = _2422 * _2588;
    float _2736 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2738 = -_2724;
    float _2740 = fma(_2690, _2736, _2738);
    float _2742 = _2662 * 6.283185482025146484375;
    float _2744 = cos(_2742);
    float _2746 = fma(_2730, _2730, _2732);
    float _2748 = _2708 * _2676;
    float _2750 = _2706 * _2674;
    float _2752 = _2734 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2754 = _2752 * 0.5;
    float _2756 = _2748 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2758 = _2750 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2760 = _2720 * 6.283185482025146484375;
    float _2762 = sin(_2760);
    float _2764 = _2602 * _2718;
    float _2766 = _2734 * _2756;
    float _2768 = _2686 * _2718;
    float _2770 = _2720 * 6.283185482025146484375;
    float _2772 = cos(_2770);
    float _2774 = _2686 * _2744;
    float _2776 = _2602 * _2744;
    float _2778 = fma(_2762, _2764, _2774);
    float _2780 = fma(_2740, _2740, _2746);
    float _2782 = fma(_2762, _2774, _2764);
    float _2784 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _223);
    float _2786 = rsqrt(_2780);
    float _2788 = _2602 * _2772;
    float _2790 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _227);
    float _2792 = _2686 * _2772;
    float _2794 = _2744 * _2772;
    float _2796 = _2718 * _2772;
    float _2798 = _2734 * _2758;
    float _2800 = _2790 * _2766;
    float _2802 = -_2768;
    float _2804 = fma(_2762, _2776, _2802);
    float _2806 = -_2776;
    float _2808 = fma(_2762, _2768, _2806);
    float _2810 = _2784 * _2798;
    float _2812 = _2792 * _2800;
    float _2814 = -_2800;
    float _2816 = _2762 * _2814;
    float _2818 = _227 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2820 = fma(_2782, _2810, _2812);
    float _2822 = _2730 * _2786;
    float _2824 = _2714 * _2786;
    float _2826 = _2788 * _2800;
    float _2828 = _2740 * _2786;
    float _2830 = _2696 * _2822;
    float _2832 = _2692 * _2824;
    float _2834 = fma(_2794, _2810, _2816);
    float _2836 = fma(_2808, _2754, _2820);
    float _2838 = -_2830;
    float _2840 = fma(_2690, _2824, _2838);
    float _2842 = -_2832;
    float _2844 = fma(_2696, _2828, _2842);
    float _2846 = fma(_2804, _2810, _2826);
    float _2848 = fma(_2796, _2754, _2834);
    float _2850 = _2840 * _2836;
    float _2852 = _2844 * _2836;
    float _2854 = fma(_2778, _2754, _2846);
    float _2856 = _2690 * _2828;
    float _2858 = fma(_2828, _2848, _2850);
    float _2860 = fma(_2822, _2848, _2852);
    float _2862 = _2782 * _2844;
    float _2864 = -_2856;
    float _2866 = fma(_2692, _2822, _2864);
    float _2868 = fma(_2692, _2854, _2858);
    float _2870 = fma(_2690, _2854, _2860);
    float _2872 = _2782 * _2840;
    float _2874 = _2782 * _2866;
    float _2876 = _1568 + _2868;
    float _2878 = _1546 + _2870;
    float _2880 = _2792 * _2844;
    float _2882 = _2792 * _2866;
    float _2884 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2886 = _2876 + _2884;
    float _2888 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2890 = _2878 + _2888;
    float _2892 = _2792 * _2840;
    float _2894 = _2808 * _2844;
    float _2896 = _2886 * _2886;
    float _2898 = _2890 * _2890;
    float _2900 = _2808 * _2840;
    float _2902 = _2808 * _2866;
    float _2904 = fma(_2794, _2822, _2862);
    float _2906 = _2898 + _2896;
    float _2908 = fma(_2794, _2824, _2874);
    float _2910 = fma(_2794, _2828, _2872);
    float _2912 = fma(_2818, _2818, 1.0);
    float _2914 = sqrt(_2906);
    float _2916 = _2866 * _2836;
    float _2918 = -_2762;
    float _2920 = fma(_2918, _2828, _2892);
    float _2922 = fma(_2796, _2824, _2902);
    float _2924 = fma(_2796, _2828, _2900);
    float _2926 = fma(_2824, _2848, _2916);
    float _2928 = -_2762;
    float _2930 = fma(_2928, _2822, _2880);
    float _2932 = -_2762;
    float _2934 = fma(_2932, _2824, _2882);
    float _2936 = rsqrt(_2912);
    float _2938 = fma(_2696, _2854, _2926);
    float _2940 = fma(_2796, _2822, _2894);
    float _2942 = _1454 + _2938;
    bool _2944 = _2914 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2946 = _2796;
    float _2948 = _2898;
    float _2950 = _2896;
    float _2952 = _2876;
    float _2954 = _2878;
    float _2956 = _2900;
    if (!_2944)
    {
        _2946 = _2898;
    }
    float _2958 = _2946;
    float _2960 = _2958;
    if (!_2944)
    {
        _2948 = _2942;
    }
    float _2962 = _2948;
    bool _2964 = !_2944;
    float _2966 = _2962;
    if (!_2964)
    {
        float _2968 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2970 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2972 = _2914 + _2970;
        float _2974 = rsqrt(_2906);
        float _2976 = _2972 * _2968;
        float _2978 = _2942 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2980 = _2976 * 0.15915493667125701904296875;
        float _2982 = _2980 * 6.283185482025146484375;
        float _2984 = sin(_2982);
        float _2986 = _2980 * 6.283185482025146484375;
        float _2988 = cos(_2986);
        float _2990 = fma(_2984, _2978, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2992 = _2974 * _2990;
        float _2994 = fma(_2890, _2992, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2996 = _2988 + (-1.0);
        float _2998 = fma(_2886, _2992, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _3000 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _3002 = _2994 + _3000;
        float _3004 = _2996 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3006 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _3008 = _2998 + _3006;
        float _3010 = _3002 * _3002;
        float _3012 = fma(_2942, _2988, _3004);
        float _3014 = _3008 * _3008;
        _2966 = _3012;
        _2960 = _3010;
        _2950 = _3014;
        _2952 = _2998;
        _2954 = _2994;
    }
    float _3016 = _2966;
    float _3018 = _2960;
    float _3020 = _2950;
    float _3022 = _2952;
    float _3024 = _2954;
    float _3026 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3028 = _3016 + _3026;
    float _3030 = fma(_2788, _2690, _2930);
    float _3032 = fma(_2788, _2696, _2934);
    float _3034 = fma(_2788, _2692, _2920);
    float _3036 = fma(_3028, _3028, _3018);
    float _3038 = fma(_2778, _2690, _2940);
    float _3040 = fma(_2778, _2696, _2922);
    float _3042 = fma(_2778, _2692, _2924);
    float _3044 = _3036 + _3020;
    float _3046 = fma(_2804, _2690, _2904);
    float _3048 = fma(_2804, _2696, _2908);
    float _3050 = _2818 * _2936;
    float _3052 = _223 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3054 = _2818 * _3030;
    float _3056 = fma(_2804, _2692, _2910);
    float _3058 = _2818 * _3032;
    float _3060 = _2818 * _3034;
    float _3062 = -_3038;
    float _3064 = _3050 * _3062;
    float _3066 = -_3040;
    float _3068 = _3050 * _3066;
    float _3070 = -_3042;
    float _3072 = _3050 * _3070;
    float _3074 = fma(_3052, _3046, _3054);
    float _3076 = sqrt(_3044);
    float _3078 = fma(_3052, _3048, _3058);
    float _3080 = fma(_3052, _3056, _3060);
    float _3082 = fma(_2936, _3030, _3064);
    float _3084 = fma(_2936, _3032, _3068);
    float _3086 = _3040 + _3078;
    float _3088 = fma(_2936, _3034, _3072);
    float _3090 = _3038 + _3074;
    float _3092 = _3042 + _3080;
    out.m_80.x = _3046;
    out.m_80.y = _3048;
    out.m_80.z = _3056;
    out.m_82.x = _3082;
    out.m_82.y = _3084;
    out.m_82.z = _3088;
    bool _3094 = _3076 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _3096 = isnan(_3076);
    bool _3098 = _3094 || _3096;
    bool _3100 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _3102 = _3098 || _3100;
    out.m_84.x = _3090;
    out.m_84.y = _3086;
    out.m_84.z = _3092;
    if (!_3102)
    {
        _2956 = 1.0;
    }
    float _3104 = _2956;
    bool _3106 = !_3102;
    float _3108 = _3104;
    if (!_3106)
    {
        bool _3110 = _3076 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _3112 = isnan(_3076);
        bool _3114 = _3110 || _3112;
        bool _3116 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _3118 = _3114 || _3116;
        if (!_3118)
        {
            float _3120 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3122 = _3076 + _3120;
            float _3124 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3126 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _3124;
            float _3128 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _3130 = _3128 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _3132 = 1.0 / _3126;
            float _3134 = _3122 * _3132;
            float _3136 = fma(_3134, _3130, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _3108 = _3136;
            _3138 = true;
        }
        else
        {
            bool _3140 = _3076 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _3142 = isnan(_3076);
            bool _3144 = _3140 || _3142;
            bool _3146 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _3148 = _3144 || _3146;
            if (!_3148)
            {
                float _3150 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3152 = _3076 + _3150;
                float _3154 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3156 = _3154 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _3158 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _3160 = _3158 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _3162 = 1.0 / _3156;
                float _3164 = _3152 * _3162;
                float _3166 = fma(_3164, _3160, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _3108 = _3166;
                _3138 = true;
            }
            else
            {
                _3108 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _3138 = false;
    float _3168 = _3108;
    float _3170 = fma(_2458, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _3172 = fma(_2476, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _3174 = floor(_3170);
    float _3176 = floor(_3172);
    float _3178 = -_3174;
    float _3180 = _3170 + _3178;
    float _3182 = -_3176;
    float _3184 = _3172 + _3182;
    float2 _9116 = float2(_3180, _3184);
    float _3186 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_9116, float2(0.0), isnan(_9116)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_9116, float2(0.0), isnan(_9116)), level(0.0)).x;
    float _3188 = _2448 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3190 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _3192 = _3016 + _3190;
    float _3194 = fma(_2458, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3188);
    float _3196 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _3198 = _3022 + _3196;
    float _3200 = fma(_2476, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3194);
    float _3202 = _2448 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3204 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    bool _3206 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _3208 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _3210 = _3206 || _3208;
    bool _3212 = isnan(0.5);
    bool _3214 = _3210 || _3212;
    float _3216 = _3200 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3218 = fma(_2458, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3202);
    float _3220 = _2448 + _3204;
    float _3222 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _3224 = _3024 + _3222;
    float _3226 = 1.0 / _3216;
    float _3228 = fma(_2476, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3218);
    float _3230 = _3220 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _3232 = fma(_3224, _3168, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _3234 = fma(_3192, _3168, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _3236 = _3228 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3238 = fma(_2458, (*spvDescriptorSet0.vp_c15)._m0[126].x, _3230);
    float _3240 = fma(_3198, _3168, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _3242 = -_2442;
    float _3244 = fma(_3242, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3234);
    float _3246 = _3236 + _3216;
    float _3248 = fma(_2476, (*spvDescriptorSet0.vp_c15)._m0[126].z, _3238);
    float _3250 = -_2454;
    float _3252 = fma(_3250, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3240);
    float _3254 = _3248 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _3256 = _3246 * _3226;
    float _3258 = _3256 * 0.5;
    float _3260 = trunc(_3254);
    int _3262 = int(_3260);
    float _3264 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3266 = fma(_3258, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3264);
    float _3268 = 1.0 / _3266;
    int _3270 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _3272 = _3262 + _3270;
    int _3274 = _3272 + 1;
    float _3276 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3278 = _3268 * _3276;
    float _3280 = _3220 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    bool _3282 = _3278 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _3284 = fma(_2458, (*spvDescriptorSet0.vp_c15)._m0[127].x, _3280);
    bool _3286 = _3278 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _3288 = !_3282;
    int _3290 = _3288 ? 0 : 1;
    float _3292 = fma(_2476, (*spvDescriptorSet0.vp_c15)._m0[127].z, _3284);
    float _3294 = _3292 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    int _3296 = 2;
    float _3298 = _3244;
    float _3300 = _3252;
    int _3302 = _3274;
    float _3304 = _3254;
    if (!_3282)
    {
        _3296 = 1;
    }
    int _3306 = _3296;
    float _3308 = trunc(_3294);
    int _3310 = int(_3308);
    int _3312 = _3306;
    if (!_3286)
    {
        _3312 = _3290;
    }
    int _3314 = _3312;
    bool _3316 = _3274 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _3318 = _3314 << 6;
    int _3320 = _3318 + 48;
    uint _3322 = uint(int(uint(_3320) >> uint(2)));
    uint _3324 = uint(int(uint(int(_3322)) >> uint(2)));
    int _3326 = int(_3322) & 3;
    float _3328 = (*spvDescriptorSet0.vp_c15)._m0[int(_3324)][_3326];
    int _3330 = int(_3322) + 1;
    uint _3332 = uint(int(uint(_3330) >> uint(2)));
    int _3334 = _3330 & 3;
    float _3336 = (*spvDescriptorSet0.vp_c15)._m0[int(_3332)][_3334];
    int _3338 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _3340 = _3310 + _3338;
    int _3342 = _3340 + 1;
    int _3344 = _3318 + 56;
    uint _3346 = uint(int(uint(_3344) >> uint(2)));
    uint _3348 = uint(int(uint(int(_3346)) >> uint(2)));
    int _3350 = int(_3346) & 3;
    float _3352 = (*spvDescriptorSet0.vp_c15)._m0[int(_3348)][_3350];
    int _3354 = int(_3346) + 1;
    uint _3356 = uint(int(uint(_3354) >> uint(2)));
    int _3358 = _3354 & 3;
    float _3360 = (*spvDescriptorSet0.vp_c15)._m0[int(_3356)][_3358];
    int _3362 = _3274 | _3342;
    bool _3364 = _3362 < 0;
    bool _3366 = _3364 || _3316;
    int _3368 = _3318 + 64;
    uint _3370 = uint(int(uint(_3368) >> uint(2)));
    uint _3372 = uint(int(uint(int(_3370)) >> uint(2)));
    int _3374 = int(_3370) & 3;
    float _3376 = (*spvDescriptorSet0.vp_c15)._m0[int(_3372)][_3374];
    int _3378 = int(_3370) + 1;
    uint _3380 = uint(int(uint(_3378) >> uint(2)));
    int _3382 = _3378 & 3;
    float _3384 = (*spvDescriptorSet0.vp_c15)._m0[int(_3380)][_3382];
    float _3386 = -_2444;
    float _3388 = fma(_3386, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3232);
    bool _3390 = _3342 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _3392 = _3390 || _3366;
    int _3394 = _3318 + 72;
    uint _3396 = uint(int(uint(_3394) >> uint(2)));
    uint _3398 = uint(int(uint(int(_3396)) >> uint(2)));
    int _3400 = int(_3396) & 3;
    float _3402 = (*spvDescriptorSet0.vp_c15)._m0[int(_3398)][_3400];
    int _3404 = int(_3396) + 1;
    uint _3406 = uint(int(uint(_3404) >> uint(2)));
    int _3408 = _3404 & 3;
    float _3410 = (*spvDescriptorSet0.vp_c15)._m0[int(_3406)][_3408];
    int _3412 = _3318 + 96;
    uint _3414 = uint(int(uint(_3412) >> uint(2)));
    uint _3416 = uint(int(uint(int(_3414)) >> uint(2)));
    int _3418 = int(_3414) & 3;
    float _3420 = (*spvDescriptorSet0.vp_c15)._m0[int(_3416)][_3418];
    int _3422 = int(_3414) + 1;
    uint _3424 = uint(int(uint(_3422) >> uint(2)));
    int _3426 = _3422 & 3;
    float _3428 = (*spvDescriptorSet0.vp_c15)._m0[int(_3424)][_3426];
    int _3430 = _3318 + 104;
    uint _3432 = uint(int(uint(_3430) >> uint(2)));
    uint _3434 = uint(int(uint(int(_3432)) >> uint(2)));
    int _3436 = int(_3432) & 3;
    float _3438 = (*spvDescriptorSet0.vp_c15)._m0[int(_3434)][_3436];
    int _3440 = int(_3432) + 1;
    uint _3442 = uint(int(uint(_3440) >> uint(2)));
    int _3444 = _3440 & 3;
    float _3446 = (*spvDescriptorSet0.vp_c15)._m0[int(_3442)][_3444];
    float _3448 = _3388;
    float _3450 = as_type<float>(_3342);
    if (!_3214)
    {
        float _3452 = _2462 * _2462;
        float _3454 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3456 = -_1568;
        float _3458 = _3456 + _3240;
        float _3460 = -_1546;
        float _3462 = _3460 + _3232;
        float _3464 = fma(_2482, _2482, _3452);
        float _3466 = fma(_2488, _2488, _3464);
        float _3468 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3470 = sqrt(_3466);
        float _3472 = 1.0 / _2734;
        float _3474 = _3468 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3476 = precise::min(_3470, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3478 = _3476 * _3454;
        float _3480 = -_1454;
        float _3482 = _3480 + _3234;
        float _3484 = _3478 * _3472;
        float _3486 = _3474 * _3484;
        float _3488 = _3458 * _3484;
        float _3490 = fma(_3482, _3486, _2448);
        float _3492 = fma(_3462, _3486, _2458);
        float _3494 = fma(_3474, _3488, _2476);
        _3298 = _3490;
        _3448 = _3492;
        _2524 = as_type<int>(_3484);
        _3300 = _3494;
        _2526 = _3470;
    }
    float _3496 = _3298;
    float _3498 = _3448;
    int _3500 = _2524;
    float _3502 = _3300;
    float _3504 = _2526;
    float _3506 = _3220 * _3428;
    int _3508 = _3500;
    float _3510 = _3504;
    if (!_3392)
    {
        int _3512 = _3342 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _3514 = _3512 + _3274;
        _3302 = _3514;
    }
    int _3516 = _3302;
    float _3518 = _3496 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3520 = _3220 * _3384;
    float _3522 = fma(_2458, _3420, _3506);
    float _3524 = _3220 * _3336;
    if (!_3392)
    {
        int _3526 = _3516 << 2;
        _3508 = _3526;
    }
    int _3528 = _3508;
    float _3530 = fma(_3498, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3518);
    float _3532 = fma(_2476, _3438, _3522);
    float _3534 = fma(_2458, _3328, _3524);
    int _3536 = _3528;
    int _3538 = as_type<int>(_3532);
    if (!_3392)
    {
        int _3540 = 12 & _3528;
        _3536 = _3540;
    }
    int _3542 = _3536;
    int _3544 = _3318 + 80;
    uint _3546 = uint(int(uint(_3544) >> uint(2)));
    uint _3548 = uint(int(uint(int(_3546)) >> uint(2)));
    int _3550 = int(_3546) & 3;
    float _3552 = (*spvDescriptorSet0.vp_c15)._m0[int(_3548)][_3550];
    int _3554 = int(_3546) + 1;
    uint _3556 = uint(int(uint(_3554) >> uint(2)));
    int _3558 = _3554 & 3;
    float _3560 = (*spvDescriptorSet0.vp_c15)._m0[int(_3556)][_3558];
    float _3562 = _3532 + _3446;
    if (!_3392)
    {
        uint _3564 = uint(int(uint(_3516) >> uint(2)));
        _3538 = int(_3564);
    }
    int _3566 = _3538;
    float _3568 = fma(_3502, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3530);
    float _3570 = fma(_2458, _3376, _3520);
    float _3572 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    if (!_3392)
    {
        int _3574 = _3566 << 4;
        int _3576 = _3574 + _3542;
        _3450 = as_type<float>(_3576);
    }
    float _3578 = _3450;
    float _3580 = 1.0 / _3562;
    float _3582 = _3568 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    int _3584 = _3318 + 88;
    uint _3586 = uint(int(uint(_3584) >> uint(2)));
    uint _3588 = uint(int(uint(int(_3586)) >> uint(2)));
    int _3590 = int(_3586) & 3;
    float _3592 = (*spvDescriptorSet0.vp_c15)._m0[int(_3588)][_3590];
    int _3594 = int(_3586) + 1;
    uint _3596 = uint(int(uint(_3594) >> uint(2)));
    int _3598 = _3594 & 3;
    float _3600 = (*spvDescriptorSet0.vp_c15)._m0[int(_3596)][_3598];
    float _3602 = fma(_2476, _3352, _3534);
    float _3604 = fma(_2476, _3402, _3570);
    float _3606 = _3582 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3608 = _3496 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3610 = _3602 + _3360;
    float _3612 = _3604 + _3410;
    float _3614 = -_3606;
    float _3616 = fma(_3614, _3572, 1.0);
    float _3618 = _3578;
    if (!_3392)
    {
        int _3620 = as_type<int>(_3578) + 400;
        uint _3622 = uint(int(uint(_3620) >> uint(2)));
        uint _3624 = uint(int(uint(int(_3622)) >> uint(2)));
        int _3626 = int(_3622) & 3;
        float _3628 = (*spvDescriptorSet0.vp_c15)._m0[int(_3624)][_3626];
        _3618 = _3628;
    }
    float _3630 = _3618;
    float _3632 = _3496 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3634 = fma(_3498, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3608);
    float _3636 = _3496 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3638 = log2(_3616);
    float _3640 = fma(_3498, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3632);
    float _3642 = _3610 * _3580;
    float _3644 = fma(_3502, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3634);
    float _3646 = _3612 * _3580;
    float _3648 = fma(_3502, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3640);
    float _3650 = fma(_3498, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3636);
    bool _3652 = _3642 >= 0.0;
    float _3654 = _3644 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3656 = _3648 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3658 = fma(_3502, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3650);
    bool _3660 = _3642 <= 1.0;
    bool _3662 = _3660 && _3652;
    float _3664 = _3240;
    float _3666 = _3650;
    if (!_3392)
    {
        float _3668 = floor(_3254);
        _3664 = _3668;
    }
    float _3670 = _3664;
    float _3672 = _3656 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3674 = _3658 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    bool _3676 = _3646 >= 0.0;
    bool _3678 = _3676 && _3662;
    float _3680 = _3656 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3682 = fma(_3654, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3672);
    float _3684 = _3638 * 0.693147182464599609375;
    bool _3686 = _3646 <= 1.0;
    bool _3688 = _3686 && _3678;
    float _3690 = _3232;
    if (!_3392)
    {
        float _3692 = floor(_3294);
        _3690 = _3692;
    }
    float _3694 = _3690;
    float _3696 = fma(_3582, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3682);
    float _3698 = _3656 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3700 = _3684 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3702 = fma(_3674, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3696);
    float _3704 = fma(_3654, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3698);
    float _3706 = _3220 * _3560;
    float _3708 = _3670;
    if (!_3392)
    {
        float _3710 = -_3670;
        float _3712 = _3254 + _3710;
        _3708 = _3712;
    }
    float _3714 = _3708;
    float _3716 = 1.0 / _3702;
    float _3718 = fma(_3582, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3704);
    float _3720 = fma(_2458, _3552, _3706);
    if (_3688)
    {
        float _3722 = float(_3314);
        _3666 = _3722;
    }
    float _3724 = _3666;
    float _3726 = fma(_3654, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3680);
    float _3728 = fma(_2476, _3592, _3720);
    float _3730 = _3680;
    if (_3688)
    {
        float _3732 = rint(_3724);
        float _3734 = precise::max(_3732, 0.0);
        uint _3736 = uint(_3734);
        uint _3738 = clamp(_3736, 0u, 65535u);
        _3730 = as_type<float>(_3738);
    }
    float _3740 = _3730;
    float _3742 = fma(_3582, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3726);
    float _3744 = fma(_3674, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3718);
    float _3746 = _3728 + _3600;
    float _3748 = _3694;
    if (!_3392)
    {
        float _3750 = -_3694;
        float _3752 = _3294 + _3750;
        _3748 = _3752;
    }
    float _3754 = _3748;
    float _3756 = fma(_3674, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3742);
    float _3758 = _3746 * _3580;
    float _3760 = _3706;
    float _3762 = _3630;
    if (!_3392)
    {
        float _3764 = rint(_3630);
        float _3766 = precise::max(_3764, 0.0);
        uint _3768 = uint(_3766);
        uint _3770 = clamp(_3768, 0u, 65535u);
        _3760 = as_type<float>(_3770);
    }
    float _3772 = _3760;
    float _3774 = _3744 * _3716;
    float _3776 = _3756 * _3716;
    float _3778 = fma(_3774, 0.5, 0.5);
    float _3780 = fma(_3776, -0.5, 0.5);
    float _3782 = _3646;
    if (_3688)
    {
        float3 _10134 = float3(_3642, _3646, float(as_type<int>(_3740)));
        float3 _10138 = select(_10134, float3(0.0), isnan(_10134));
        float _3784 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _10138.xy, uint(rint(_10138.z)), _3758, level(0.0));
        _3782 = _3784;
    }
    float _3786 = _3782;
    float3 _10148 = float3(_3778, _3780, _3700);
    float _3788 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_10148, float3(0.0), isnan(_10148)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_10148, float3(0.0), isnan(_10148)), level(0.0)).x;
    float3 _10157 = float3(_3778, _3780, _3700);
    float4 _3791 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_10157, float3(0.0), isnan(_10157)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_10157, float3(0.0), isnan(_10157)), level(0.0)).xyzw;
    float _3793 = _3791.x;
    float _3795 = _3791.y;
    float _3797 = _3791.z;
    float _3799 = _3791.w;
    float _3801 = _3714;
    if (!_3392)
    {
        float3 _10180 = float3(_3714, _3754, float(as_type<int>(_3772)));
        float3 _10182 = select(_10180, float3(0.0), isnan(_10180));
        float _3803 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _10182.xy, uint(rint(_10182.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _10182.xy, uint(rint(_10182.z)), level(0.0)).x;
        _3801 = _3803;
    }
    float _3805 = _3801;
    if (_3392)
    {
        _3304 = 1.0;
    }
    float _3807 = _3304;
    float _3809 = _3807;
    if (!_3392)
    {
        int _3811 = _3516 << 4;
        int _3813 = _3811 + 2048;
        uint _3815 = uint(int(uint(_3813) >> uint(2)));
        uint _3817 = uint(int(uint(int(_3815)) >> uint(2)));
        int _3819 = int(_3815) & 3;
        float _3821 = (*spvDescriptorSet0.vp_c15)._m0[int(_3817)][_3819];
        int _3823 = int(_3815) + 1;
        uint _3825 = uint(int(uint(_3823) >> uint(2)));
        int _3827 = _3823 & 3;
        float _3829 = (*spvDescriptorSet0.vp_c15)._m0[int(_3825)][_3827];
        int _3831 = _3813 + 8;
        uint _3833 = uint(int(uint(_3831) >> uint(2)));
        uint _3835 = uint(int(uint(int(_3833)) >> uint(2)));
        int _3837 = int(_3833) & 3;
        float _3839 = (*spvDescriptorSet0.vp_c15)._m0[int(_3835)][_3837];
        int _3841 = int(_3833) + 1;
        uint _3843 = uint(int(uint(_3841) >> uint(2)));
        int _3845 = _3841 & 3;
        float _3847 = (*spvDescriptorSet0.vp_c15)._m0[int(_3843)][_3845];
        float _3849 = _3220 * _3829;
        float _3851 = fma(_2458, _3821, _3849);
        float _3853 = fma(_2476, _3839, _3851);
        float _3855 = _3853 + _3847;
        float _3857 = precise::clamp(_3855, 0.0, 1.0);
        float _3859 = -_3857;
        float _3861 = _3859 + _3805;
        float _3863 = fma(_3861, 500.0, 1.5);
        float _3865 = exp2(_3863);
        float _3867 = 0.0 + _3865;
        float _3869 = precise::clamp(_3867, 0.0, 1.0);
        _3809 = _3869;
    }
    float _3871 = _3809;
    float _3873 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3875 = _3496 + _3873;
    float _3877 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3879 = _3498 + _3877;
    float _3881 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3883 = _3502 + _3881;
    float _3885 = _3875 * _3875;
    float _3887 = fma(_3879, _3879, _3885);
    float _3889 = fma(_3883, _3883, _3887);
    float _3891 = rsqrt(_3889);
    float _3893 = sqrt(_3889);
    float _3895 = _3891 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3897 = _3879 * _3895;
    float _3899 = _3883 * _3895;
    float _3901 = _3897 * _3897;
    float _3903 = _3899 * _3899;
    float _3905 = _3901 + _3903;
    float _3907 = sqrt(_3905);
    bool _3909 = _3907 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3911 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3913 = _3907 + _3911;
    float _3915 = _3883;
    float _3917 = _3905;
    float _3919 = _3913;
    float _3921 = _3875;
    if (_3909)
    {
        float _3923 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3915 = _3923;
    }
    float _3925 = _3915;
    if (_3909)
    {
        float _3927 = rsqrt(_3905);
        _3917 = _3927;
    }
    float _3929 = _3917;
    if (_3909)
    {
        float _3931 = _3913 * _3925;
        _3919 = _3931;
    }
    float _3933 = _3919;
    if (_3909)
    {
        float _3935 = _3933 * 0.15915493667125701904296875;
        _3762 = _3935;
    }
    float _3937 = _3762;
    float _3939 = _3891;
    if (_3909)
    {
        float _3941 = _3937 * 6.283185482025146484375;
        float _3943 = sin(_3941);
        _3939 = _3943;
    }
    float _3945 = _3939;
    float _3947 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3949 = precise::max(0.0, _3947);
    float _3951 = _3780;
    float _3953 = _3949;
    float _3955 = _3947;
    if (_3909)
    {
        float _3957 = _3937 * 6.283185482025146484375;
        float _3959 = cos(_3957);
        _3951 = _3959;
    }
    float _3961 = _3951;
    float _3963 = -_3895;
    float _3965 = -_3949;
    float _3967 = fma(_3875, _3963, _3965);
    if (!_3909)
    {
        _3921 = _3899;
    }
    float _3969 = _3921;
    float _3971 = _3969;
    if (_3909)
    {
        float _3973 = _3967 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3953 = _3973;
    }
    float _3975 = _3953;
    float _3977 = _3975;
    float _3979 = _3945;
    if (_3909)
    {
        float _3981 = fma(_3945, _3975, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3977 = _3981;
    }
    float _3983 = _3977;
    float _3985 = _3983;
    if (!_3909)
    {
        _3979 = _3897;
    }
    float _3987 = _3979;
    float _3989 = _3987;
    float _3991 = _3961;
    if (_3909)
    {
        float _3993 = _3961 + (-1.0);
        _3955 = _3993;
    }
    float _3995 = _3955;
    float _3997 = _3995;
    if (_3909)
    {
        float _3999 = _3929 * _3983;
        _3510 = _3999;
    }
    float _4001 = _3510;
    if (!_3909)
    {
        _3985 = _3967;
    }
    float _4003 = _3985;
    float _4005 = _4003;
    if (_3909)
    {
        float _4007 = _3995 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3997 = _4007;
    }
    float _4009 = _3997;
    float _4011 = _4009;
    if (_3909)
    {
        float _4013 = _3897 * _4001;
        _3989 = _4013;
    }
    float _4015 = _3989;
    if (_3909)
    {
        float _4017 = _3899 * _4001;
        _3971 = _4017;
    }
    float _4019 = _3971;
    if (_3909)
    {
        float _4021 = fma(_3967, _3961, _4009);
        _4005 = _4021;
    }
    float _4023 = _4005;
    if (!_3909)
    {
        _4011 = _3901;
    }
    float _4025 = _4011;
    float _4027 = _4025;
    if (_3909)
    {
        float _4029 = _4015 * _4015;
        _4027 = _4029;
    }
    float _4031 = _4027;
    if (!_3909)
    {
        _3991 = _3903;
    }
    float _4033 = _3991;
    float _4035 = _4033;
    if (_3909)
    {
        float _4037 = _4019 * _4019;
        _4035 = _4037;
    }
    float _4039 = _4035;
    float _4041 = fma(_4023, _4023, _4031);
    float _4043 = _4041 + _4039;
    float _4045 = rsqrt(_4043);
    float _4047 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4049 = fma(_3893, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4047);
    float _4051 = precise::clamp(_4049, 0.0, 1.0);
    float _4053 = -_4051;
    float _4055 = _4053 + 1.0;
    float _4057 = abs(_4055);
    float _4059 = log2(_4057);
    float _4061 = _4045 * _4015;
    float _4063 = _4045 * _4023;
    float _4065 = _4045 * _4019;
    float _4067 = _4061 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4069 = -_4067;
    float _4071 = fma(_4063, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4069);
    float _4073 = _4059 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4075 = -_4065;
    float _4077 = fma(_4075, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4071);
    float _4079 = fma(_4077, -0.5, 0.5);
    float _4081 = exp2(_4073);
    float _4083 = fma(_4077, 0.5, 0.5);
    float _4085 = _4063 + 1.0;
    float _4087 = fma(_4083, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4089 = sqrt(_4079);
    float _4091 = fma(_4083, _4087, -0.212114393711090087890625);
    float _4093 = fma(_4083, _4091, 1.570728778839111328125);
    float _4095 = -_4063;
    float _4097 = fma(_4081, _4085, _4095);
    float _4099 = fma(_4097, 0.5, 0.5);
    float _4101 = _4089 * 0.636619746685028076171875;
    float _4103 = -_4093;
    float _4105 = fma(_4101, _4103, 1.0);
    float2 _10653 = float2(_4105, _4099);
    float3 _4109 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_10653, float2(0.0), isnan(_10653)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_10653, float2(0.0), isnan(_10653)), level(0.0)).xyz;
    float _4111 = _4109.x;
    float _4113 = _4109.y;
    float _4115 = _4109.z;
    float _4117 = abs(_3278);
    float _4119 = log2(_4117);
    float _4121 = _3656 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4123 = -_3186;
    float _4125 = _4123 + 1.0;
    float _4127 = fma(_3654, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4121);
    bool _4129 = _3278 <= 8000.0;
    bool _4131 = isnan(_3278);
    bool _4133 = _4129 || _4131;
    bool _4135 = isnan(8000.0);
    bool _4137 = _4133 || _4135;
    float _4139 = float(_4137);
    float _4141 = fma(_3582, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4127);
    float _4143 = _4119 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _4145 = exp2(_4143);
    float _4147 = fma(_4145, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4149 = precise::clamp(_4147, 0.0, 1.0);
    float _4151 = fma(_4149, -2.0, 3.0);
    float _4153 = _4149 * _4149;
    float _4155 = _4153 * _4151;
    float _4157 = _4059 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4159 = fma(_3674, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4141);
    float _4161 = -_4155;
    float _4163 = _4161 + 1.0;
    float _4165 = _4159 + _3702;
    float _4167 = exp2(_4157);
    float _4169 = fma(_4163, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4155);
    out.gl_Position.x = _3744;
    out.gl_Position.y = _3756;
    out.gl_Position.z = _4159;
    out.gl_Position.w = _3702;
    float _4171 = _4165 * 0.5;
    float _4173 = _4165;
    float _4175 = _4125;
    if (!_3688)
    {
        _4173 = 1.0;
    }
    float _4177 = _4173;
    float _4179 = _4139 * _4169;
    float _4181 = _4177;
    if (_3688)
    {
        bool _4183 = _3786 >= _3758;
        bool _4185 = isnan(_3786);
        bool _4187 = _4183 || _4185;
        bool _4189 = isnan(_3758);
        bool _4191 = _4187 || _4189;
        float _4193 = float(_4191);
        _4181 = _4193;
    }
    float _4195 = _4181;
    out.m_86.z = _4171;
    out.m_86.w = _3702;
    float _4197 = _4179 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    bool _4199 = _3893 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4201 = isnan(_3893);
    bool _4203 = _4199 || _4201;
    bool _4205 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4207 = _4203 || _4205;
    float _4209 = _4195 * _3871;
    float _4211 = _4125 * _4197;
    float _4213 = precise::clamp(_4211, 0.0, 1.0);
    float _4215 = -_4167;
    float _4217 = _4215 + 1.0;
    float _4219 = -_4213;
    float _4221 = fma(_4219, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4223 = _4217 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4225 = -_4209;
    float _4227 = fma(_4225, _4221, 1.0);
    float _4229 = precise::clamp(_4227, 0.0, 1.0);
    if (!_4207)
    {
        _4175 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4231 = _4175;
    float _4233 = _4223 * _3788;
    float _4235 = -_4223;
    float _4237 = _4235 + 1.0;
    float _4239 = _4229 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _4241 = _3799 * _4233;
    float _4243 = _3799 * _4237;
    out.m_88.x = _4239;
    float _4245 = _4115 * _4233;
    float _4247 = fma(_4111, _4241, _3793);
    float _4249 = fma(_4113, _4241, _3795);
    float _4251 = _4241;
    float _4253 = _4233;
    float _4255 = _4231;
    float _4257 = _4231;
    if (!_4207)
    {
        _4251 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4259 = _4251;
    float _4261 = fma(_3799, _4245, _3797);
    float _4263 = _4259;
    float _4265 = _4259;
    if (!_4207)
    {
        _4253 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4267 = _4253;
    out.m_90.x = _4247;
    out.m_90.y = _4249;
    out.m_90.z = _4261;
    out.m_90.w = _4243;
    bool _4269 = !_4207;
    float _4271 = _4267;
    float _4273 = _4267;
    if (!_4269)
    {
        bool _4275 = _3893 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4277 = isnan(_3893);
        bool _4279 = _4275 || _4277;
        bool _4281 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4283 = _4279 || _4281;
        if (!_4283)
        {
            float _4285 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4287 = _3893 + _4285;
            float _4289 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4291 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4289;
            float _4293 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4295 = _4293 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4297 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4299 = _4297 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4301 = 1.0 / _4291;
            float _4303 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4305 = _4303 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4307 = _4287 * _4301;
            float _4309 = precise::clamp(_4307, 0.0, 1.0);
            float _4311 = fma(_4309, _4295, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4313 = fma(_4309, _4299, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4315 = fma(_4309, _4305, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _4265 = _4313;
            _4257 = _4311;
            _4273 = _4315;
            _4317 = true;
        }
        else
        {
            bool _4319 = _3893 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4321 = isnan(_3893);
            bool _4323 = _4319 || _4321;
            bool _4325 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4327 = _4323 || _4325;
            if (!_4327)
            {
                _4255 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4329 = _4255;
            _4257 = _4329;
            if (!_4327)
            {
                _4263 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4331 = _4263;
            _4265 = _4331;
            if (!_4327)
            {
                _4271 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4333 = _4271;
            bool _4335 = !_4327;
            _4273 = _4333;
            if (!_4335)
            {
                bool _4337 = _3893 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4339 = isnan(_3893);
                bool _4341 = _4337 || _4339;
                bool _4343 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4345 = _4341 || _4343;
                if (!_4345)
                {
                    float _4347 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4349 = _3893 + _4347;
                    float _4351 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4353 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4351;
                    float _4355 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4357 = _4355 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4359 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4361 = _4359 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4363 = 1.0 / _4353;
                    float _4365 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4367 = _4365 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4369 = _4349 * _4363;
                    float _4371 = precise::clamp(_4369, 0.0, 1.0);
                    float _4373 = fma(_4371, _4357, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4375 = fma(_4371, _4361, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4377 = fma(_4371, _4367, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _4265 = _4375;
                    _4257 = _4373;
                    _4273 = _4377;
                    _4317 = true;
                }
                else
                {
                    _4265 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4257 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4273 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _4317 = false;
    float _4379 = _4265;
    float _4381 = _4257;
    float _4383 = _4273;
    float _4385 = _4379 * 0.586610972881317138671875;
    bool _4387 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_92.x = 0.0;
    float _4389 = fma(_4381, 0.298911988735198974609375, _4385);
    float _4391 = fma(_4383, 0.114477999508380889892578125, _4389);
    float _4393 = -_4391;
    float _4395 = _4393 + _4381;
    float _4397 = -_4391;
    float _4399 = _4397 + _4379;
    float _4401 = -_4391;
    float _4403 = _4401 + _4383;
    float _4405 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4407 = fma(_4395, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4391);
    float _4409 = fma(_4399, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4391);
    float _4411 = fma(_4403, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4391);
    out.m_61.x = _4405;
    out.m_94.x = _4407;
    out.m_94.y = _4409;
    out.m_94.z = _4411;
    if (!_4387)
    {
        return out;
    }
    float _4413 = -_3496;
    float _4415 = _4413 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _4417 = -_3498;
    float _4419 = _4417 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _4421 = -_3502;
    float _4423 = _4421 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _4425 = _4415 * _4415;
    float _4427 = fma(_4419, _4419, _4425);
    float _4429 = fma(_4423, _4423, _4427);
    float _4431 = sqrt(_4429);
    float _4433 = rsqrt(_4429);
    float _4435 = -_4431;
    float _4437 = _4435 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4439 = _4437 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _4441 = precise::clamp(_4439, 0.0, 1.0);
    float _4443 = _4419 * _4433;
    float _4445 = _4415 * _4433;
    float _4447 = abs(_4441);
    float _4449 = log2(_4447);
    float _4451 = _4423 * _4433;
    float _4453 = _4443 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4455 = _3086 * _4445;
    float _4457 = -_4445;
    float _4459 = -_4453;
    float _4461 = fma(_4457, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4459);
    float _4463 = fma(_3090, _4443, _4455);
    float _4465 = -_4451;
    float _4467 = fma(_4465, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4461);
    float _4469 = fma(_3092, _4451, _4463);
    float _4471 = precise::clamp(_4469, 0.0, 1.0);
    float _4473 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _4475 = _4467 + _4473;
    float _4477 = _4449 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _4479 = _4475 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _4481 = precise::clamp(_4479, 0.0, 1.0);
    float _4483 = exp2(_4477);
    float _4485 = _4483 * _4481;
    float _4487 = _4471 * _4485;
    float _4489 = _4487 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4491 = _4487 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4493 = _4487 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_92.x = _4489;
    out.m_92.y = _4491;
    out.m_92.z = _4493;
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
    bool _4317 = false;
    bool _3138 = false;
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
        float _4550 = as_type<float>(_129);
        out.gl_Position.z = _4550;
    }
    if (!_117)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _4620 = as_type<float>(_167);
        out.gl_Position.z = _4620;
    }
    if (_159)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _169 = as_type<float>(int(gl_VertexIndex));
    float _171 = _147 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _173 = in.m_68.w;
    bool _175 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _177 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _179 = _175 || _177;
    bool _181 = isnan(1.0);
    bool _183 = _179 || _181;
    float _185 = in.m_63.x;
    float _187 = in.m_63.y;
    float _189 = in.m_63.z;
    float _191 = in.m_58.x;
    float _193 = in.m_58.y;
    float _195 = in.m_58.z;
    float _197 = 0.0;
    float _199 = _171;
    if (!_183)
    {
        float _201 = _171 * _171;
        float _203 = _201 * 0.5;
        _197 = _203;
    }
    float _205 = _197;
    float _207 = _205;
    if (!_183)
    {
        float _209 = _205 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _207 = _209;
    }
    float _211 = _207;
    int _213 = as_type<int>(_169) & 1;
    bool _215 = _213 != 0;
    int _217 = as_type<int>(_169) & 2;
    bool _219 = _217 != 0;
    bool _221 = !_215;
    float _223 = _221 ? (-0.5) : 0.5;
    bool _225 = !_219;
    float _227 = _225 ? (-0.5) : 0.5;
    bool _229 = !_183;
    float _231 = _211;
    if (!_229)
    {
        float _233 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _235 = log2(_233);
        float _237 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _239 = _237 + 1.0;
        float _241 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _243 = _171 * _235;
        float _245 = 1.0 / _239;
        float _247 = _241 * 0.693147182464599609375;
        float _249 = exp2(_243);
        float _251 = 1.0 / _247;
        float _253 = _249 + (-1.0);
        float _255 = -_253;
        float _257 = fma(_255, _251, _171);
        float _259 = _257 * _245;
        float _261 = _259 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _231 = _261;
    }
    float _263 = _231;
    bool _265 = !_183;
    if (!_265)
    {
        float _267 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _269 = log2(_267);
        float _271 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _273 = _271 + 1.0;
        float _275 = 1.0 / _273;
        float _277 = _171 * _269;
        float _279 = exp2(_277);
        float _281 = -_279;
        float _283 = _281 + 1.0;
        float _285 = _283 * _275;
        _199 = _285;
    }
    float _287 = _199;
    bool _289 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _291 = _263 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _293 = _263 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _295 = _263 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _297 = fma(_287, _185, _291);
    float _299 = fma(_287, _187, _293);
    float _301 = fma(_287, _189, _295);
    float _303 = fma(_297, _173, _191);
    float _305 = fma(_299, _173, _193);
    float _307 = fma(_301, _173, _195);
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
    float _343 = _305 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _345 = _305 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _347 = _305 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _349 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _351 = _349 != 0;
    float _353 = fma(_303, (*spvDescriptorSet0.vp_c10)._m0[4].x, _343);
    float _355 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _357 = int(_355);
    float _359 = float(_341);
    float _361 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _363 = int(_361);
    float _365 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _367 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _369 = float(_357);
    float _371 = 1.0 / _359;
    float _373 = as_type<float>(_357);
    if (_351)
    {
        float _375 = in.m_70.x;
        _373 = _375;
    }
    float _377 = _373;
    float _379 = _377;
    if (!_351)
    {
        float _381 = in.m_70.y;
        _379 = _381;
    }
    float _383 = _379;
    float _385 = float(uint(_363));
    float _387 = 1.0 / _369;
    int _389 = ~_363;
    int _391 = _389 + 1;
    bool _393 = _363 == 0;
    float _395 = _371 * _147;
    float _397 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _399 = int(_397);
    float _401 = 1.0 / _385;
    float _403 = _387 * _147;
    float _405 = trunc(_395);
    int _407 = int(_405);
    float _409 = float(uint(_399));
    int _411 = ~_399;
    int _413 = _411 + 1;
    int _415 = as_type<int>(_401) + (-2);
    float _417 = 1.0 / _409;
    float _419 = in.m_70.x;
    float _421 = in.m_70.y;
    float _423 = in.m_70.z;
    float _425 = in.m_70.w;
    float _427 = float(uint(_407));
    float _429 = trunc(_403);
    int _431 = int(_429);
    float _433 = as_type<float>(_415) * _427;
    float _435 = trunc(_433);
    float _437 = precise::max(_435, 0.0);
    uint _440 = uint(_437);
    int _442 = as_type<int>(_417) + (-2);
    float _444 = float(uint(_431));
    float _446 = _419 * 2.0;
    float _448 = _433;
    float _450 = as_type<float>(_391);
    if (_351)
    {
        _448 = 1.0;
    }
    float _452 = _448;
    float _454 = _452;
    if (!_351)
    {
        _454 = 1.2345600128173828125;
    }
    float _456 = _454;
    float _458 = as_type<float>(_442) * _444;
    int _460 = _391 * int(_440);
    int _462 = _460 + _407;
    float _464 = trunc(_458);
    float _466 = precise::max(_464, 0.0);
    uint _468 = uint(_466);
    if (_351)
    {
        _450 = 1.0;
    }
    float _470 = _450;
    float _472 = _470;
    if (!_351)
    {
        _472 = 7.345489978790283203125;
    }
    float _474 = _472;
    float _476 = float(uint(_462));
    int _478 = ~_399;
    int _480 = _478 + 1;
    float _482 = _474 * _419;
    float _484 = _383 * _456;
    float _486 = as_type<float>(_415) * _476;
    int _488 = ~_363;
    int _490 = _488 + 1;
    float _492 = trunc(_486);
    float _494 = precise::max(_492, 0.0);
    uint _496 = uint(_494);
    int _498 = _480 * int(_468);
    int _500 = _498 + _431;
    float _502 = float(uint(_500));
    float _504 = floor(_482);
    float _506 = float(_113);
    float _508 = as_type<float>(_442) * _502;
    float _510 = float(_407);
    int _512 = int(_440) + int(_496);
    float _514 = floor(_484);
    int _516 = _490 * _512;
    int _518 = _516 + _407;
    float _520 = -_504;
    float _522 = _482 + _520;
    float _524 = trunc(_508);
    float _526 = precise::max(_524, 0.0);
    uint _528 = uint(_526);
    bool _530 = uint(_518) >= uint(_363);
    float _532 = float(_363);
    bool _534 = !_530;
    int _536 = _534 ? 0 : (-1);
    bool _538 = _510 >= _532;
    bool _540 = isnan(_510);
    bool _542 = _538 || _540;
    bool _544 = isnan(_532);
    bool _546 = _542 || _544;
    float _548 = float(_546);
    float _550 = 1.0 / _506;
    float _552 = _522 * _532;
    int _554 = ~_512;
    int _556 = _554 + _536;
    int _558 = _556 + 1;
    float _560 = -_514;
    float _562 = _484 + _560;
    int _564 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _566 = _564 != 0;
    float _568 = trunc(_548);
    int _570 = int(_568);
    int _572 = int(_468) + int(_528);
    bool _574 = !_566;
    int _576 = _574 ? 0 : 1;
    float _578 = float(_399);
    int _580 = _413 * _572;
    int _582 = _580 + _431;
    float _584 = float(_431);
    float _586 = _550 * _147;
    int _588 = abs(_576);
    float _590 = trunc(_552);
    int _592 = int(_590);
    int _594 = _363 * _558;
    int _596 = _594 + _407;
    float _598 = _532 * _586;
    bool _600 = uint(_582) >= uint(_399);
    float _602 = _562 * _578;
    float _604 = _578 * _586;
    int _606 = ~_570;
    int _608 = _606 + 1;
    int _610 = _608 + 1;
    float _612 = trunc(_598);
    int _614 = int(_612);
    bool _616 = !_393;
    int _618 = _616 ? _596 : (-1);
    int _620 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _622 = _620 != 0;
    int _624 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _626 = _624 != 0;
    int _628 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _630 = _628 != 0;
    bool _632 = _584 >= _578;
    bool _634 = isnan(_584);
    bool _636 = _632 || _634;
    bool _638 = isnan(_578);
    bool _640 = _636 || _638;
    float _642 = float(_640);
    int _644 = _618 * _610;
    bool _646 = !_600;
    int _648 = _646 ? 0 : (-1);
    int _650 = _592 * _588;
    int _652 = _650 + _407;
    bool _654 = !_626;
    int _656 = _654 ? 0 : 1;
    int _658 = _363 + (-1);
    float _660 = trunc(_642);
    int _662 = int(_660);
    int _664 = ~_572;
    int _666 = _664 + _648;
    int _668 = _666 + 1;
    int _670 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _672 = _670 != 0;
    int _674 = _570 * _658;
    int _676 = _674 + _644;
    int _678 = abs(_656);
    bool _680 = !_622;
    int _682 = _680 ? 0 : 1;
    float _684 = trunc(_602);
    int _686 = int(_684);
    bool _688 = !_672;
    int _690 = _688 ? 0 : 1;
    int _692 = abs(_682);
    bool _694 = !_630;
    int _696 = _694 ? 0 : 1;
    int _698 = abs(_690);
    int _700 = _676 * _678;
    int _702 = _399 * _668;
    int _704 = _702 + _431;
    int _706 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _708 = _706 != 0;
    int _710 = abs(_696);
    int _712 = _614 * _692;
    int _714 = _712 + _700;
    float _716 = fma(_303, (*spvDescriptorSet0.vp_c10)._m0[5].x, _345);
    bool _718 = !_708;
    int _720 = _718 ? 0 : 1;
    float _722 = fma(_303, (*spvDescriptorSet0.vp_c10)._m0[6].x, _347);
    int _724 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _726 = _724 != 0;
    int _728 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _730 = _728 != 0;
    int _732 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _734 = _732 != 0;
    int _736 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _738 = _736 != 0;
    int _740 = _686 * _698;
    int _742 = _740 + _431;
    bool _744 = _399 == 0;
    int _746 = _652 * _710;
    int _748 = _746 + _714;
    int _750 = abs(_720);
    float _752 = trunc(_604);
    int _754 = int(_752);
    bool _756 = !_730;
    int _758 = _756 ? 0 : 1;
    float _760 = _419 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _762 = ~_662;
    int _764 = _762 + 1;
    int _766 = _764 + 1;
    int _768 = _592 * _750;
    int _770 = _768 + _748;
    bool _772 = !_744;
    int _774 = _772 ? _704 : (-1);
    int _776 = _399 + (-1);
    bool _778 = !_726;
    int _780 = _778 ? 0 : 1;
    int _782 = _774 * _766;
    int _784 = abs(_758);
    int _786 = abs(_780);
    int _788 = _662 * _776;
    int _790 = _788 + _782;
    bool _792 = !_734;
    int _794 = _792 ? 0 : 1;
    float _796 = float(uint(_770));
    int _798 = _790 * _784;
    int _800 = abs(_794);
    float _802 = as_type<float>(_415) * _796;
    bool _804 = !_738;
    int _806 = _804 ? 0 : 1;
    int _808 = _754 * _786;
    int _810 = _808 + _798;
    int _812 = abs(_806);
    float _814 = trunc(_802);
    float _816 = precise::max(_814, 0.0);
    uint _818 = uint(_816);
    float _820 = float(uint(_652));
    int _822 = _742 * _800;
    int _824 = _822 + _810;
    int _826 = ~_363;
    int _828 = _826 + 1;
    int _830 = ~_399;
    int _832 = _830 + 1;
    int _834 = _686 * _812;
    int _836 = _834 + _824;
    float _838 = as_type<float>(_415) * _820;
    bool _840 = _363 == 0;
    float _842 = float(uint(_836));
    float _844 = trunc(_838);
    float _846 = precise::max(_844, 0.0);
    uint _848 = uint(_846);
    float _850 = as_type<float>(_442) * _842;
    int _852 = _828 * int(_818);
    int _854 = _852 + _770;
    int _856 = ~_363;
    int _858 = _856 + 1;
    float _860 = trunc(_850);
    float _862 = precise::max(_860, 0.0);
    uint _864 = uint(_862);
    float _866 = float(uint(_854));
    float _868 = float(uint(_742));
    float _870 = as_type<float>(_415) * _866;
    int _872 = _858 * int(_848);
    int _874 = _872 + _652;
    float _876 = as_type<float>(_442) * _868;
    float _878 = trunc(_870);
    float _880 = precise::max(_878, 0.0);
    uint _882 = uint(_880);
    float _884 = float(uint(_874));
    int _886 = _832 * int(_864);
    int _888 = _886 + _836;
    float _890 = as_type<float>(_415) * _884;
    int _892 = ~_363;
    int _894 = _892 + 1;
    float _896 = trunc(_876);
    float _898 = precise::max(_896, 0.0);
    uint _900 = uint(_898);
    float _902 = float(uint(_888));
    float _904 = as_type<float>(_442) * _902;
    float _906 = trunc(_890);
    float _908 = precise::max(_906, 0.0);
    uint _910 = uint(_908);
    int _912 = int(_818) + int(_882);
    float _914 = trunc(_904);
    float _916 = precise::max(_914, 0.0);
    uint _918 = uint(_916);
    int _920 = _894 * _912;
    int _922 = _920 + _770;
    int _924 = _832 * int(_900);
    int _926 = _924 + _742;
    bool _928 = uint(_922) >= uint(_363);
    int _930 = int(_848) + int(_910);
    float _932 = float(uint(_926));
    bool _934 = !_928;
    int _936 = _934 ? 0 : (-1);
    int _938 = ~_363;
    int _940 = _938 + 1;
    int _942 = ~_399;
    int _944 = _942 + 1;
    int _946 = int(_864) + int(_918);
    int _948 = ~_912;
    int _950 = _948 + _936;
    int _952 = _950 + 1;
    float _954 = as_type<float>(_442) * _932;
    int _956 = _940 * _930;
    int _958 = _956 + _652;
    int _960 = _944 * _946;
    int _962 = _960 + _836;
    float _964 = trunc(_954);
    float _966 = precise::max(_964, 0.0);
    uint _968 = uint(_966);
    int _970 = _363 * _952;
    int _972 = _970 + _770;
    bool _974 = uint(_958) >= uint(_363);
    bool _976 = uint(_962) >= uint(_399);
    bool _978 = !_974;
    int _980 = _978 ? 0 : (-1);
    bool _982 = !_976;
    int _984 = _982 ? 0 : (-1);
    bool _986 = !_840;
    int _988 = _986 ? _972 : (-1);
    int _990 = ~_946;
    int _992 = _990 + _984;
    int _994 = _992 + 1;
    int _996 = ~_930;
    int _998 = _996 + _980;
    int _1000 = _998 + 1;
    int _1002 = _988 >> 31;
    int _1004 = _399 * _994;
    int _1006 = _1004 + _836;
    int _1008 = _988 & 3;
    bool _1010 = _1008 != 0;
    int _1012 = _363 * _1000;
    int _1014 = _1012 + _652;
    int _1016 = _1002 & 3;
    bool _1018 = !_744;
    int _1020 = _1018 ? _1006 : (-1);
    bool _1022 = uint(_1008) > 1u;
    int _1024 = _988 & 3;
    bool _1026 = _1024 != 0;
    int _1028 = _988 + _1016;
    bool _1030 = _1008 != 3;
    int _1032 = _1020 >> 31;
    int _1034 = _1026 ? 0 : 1;
    int _1036 = _1028 >> 2;
    bool _1038 = uint(_1008) >= 2u;
    int _1040 = _1032 & 3;
    int _1042 = _1036 << 4;
    int _1044 = _1042 + 368;
    int _1046 = _1038 ? 0 : 1;
    int _1048 = _1020 + _1040;
    int _1050 = ~_1034;
    int _1052 = _1050 + 1;
    int _1054 = _1052 + 1;
    int _1056 = _1054;
    if (!_1022)
    {
        int _1058 = ~_1034;
        int _1060 = _1058 + 1;
        _1056 = _1060;
    }
    int _1062 = _1056;
    uint _1064 = uint(int(uint(_1044) >> uint(2)));
    uint _1066 = uint(int(uint(int(_1064)) >> uint(2)));
    int _1068 = int(_1064) & 3;
    float _1070 = (*spvDescriptorSet0.vp_c9)._m0[int(_1066)][_1068];
    int _1072 = int(_1064) + 1;
    uint _1074 = uint(int(uint(_1072) >> uint(2)));
    int _1076 = _1072 & 3;
    float _1078 = (*spvDescriptorSet0.vp_c9)._m0[int(_1074)][_1076];
    int _1080 = ~_1046;
    int _1082 = _1080 + 1;
    int _1084 = _1082 + 1;
    int _1086 = _1048 >> 2;
    int _1088 = _1084;
    if (_1030)
    {
        int _1090 = ~_1046;
        int _1092 = _1090 + 1;
        _1088 = _1092;
    }
    int _1094 = _1088;
    int _1096 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1098 = _1096 != 0;
    int _1100 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1102 = _1100 != 0;
    int _1104 = _1086 << 4;
    int _1106 = _1104 + 512;
    bool _1108 = !_1098;
    int _1110 = _1108 ? 0 : 1;
    bool _1112 = !_1102;
    int _1114 = _1112 ? 0 : 1;
    int _1116 = _1020 & 3;
    bool _1118 = _1116 != 0;
    int _1120 = _1020 & 3;
    bool _1122 = _1120 != 0;
    uint _1124 = uint(int(uint(_1106) >> uint(2)));
    uint _1126 = uint(int(uint(int(_1124)) >> uint(2)));
    int _1128 = int(_1124) & 3;
    float _1130 = (*spvDescriptorSet0.vp_c9)._m0[int(_1126)][_1128];
    int _1132 = int(_1124) + 1;
    uint _1134 = uint(int(uint(_1132) >> uint(2)));
    int _1136 = _1132 & 3;
    float _1138 = (*spvDescriptorSet0.vp_c9)._m0[int(_1134)][_1136];
    bool _1140 = !_840;
    int _1142 = _1140 ? _1014 : (-1);
    bool _1144 = _1008 != 3;
    bool _1146 = uint(_1120) >= 2u;
    int _1148 = _1118 ? 0 : 1;
    bool _1150 = _425 > 0.5;
    bool _1152 = !_1010;
    int _1154 = _1152 ? 0 : 1;
    int _1156 = _1146 ? 0 : 1;
    bool _1158 = !_1144;
    int _1160 = _1158 ? 0 : (-1);
    bool _1162 = uint(_1120) > 1u;
    bool _1164 = _1120 != 3;
    bool _1166 = _1120 != 3;
    int _1168 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1170 = _1168 != 0;
    int _1172 = _1044 + 8;
    uint _1174 = uint(int(uint(_1172) >> uint(2)));
    uint _1176 = uint(int(uint(int(_1174)) >> uint(2)));
    int _1178 = int(_1174) & 3;
    float _1180 = (*spvDescriptorSet0.vp_c9)._m0[int(_1176)][_1178];
    int _1182 = int(_1174) + 1;
    uint _1184 = uint(int(uint(_1182) >> uint(2)));
    int _1186 = _1182 & 3;
    float _1188 = (*spvDescriptorSet0.vp_c9)._m0[int(_1184)][_1186];
    int _1190 = ~_1148;
    int _1192 = _1190 + 1;
    int _1194 = _1192 + 1;
    int _1196 = abs(_1062);
    int _1198 = int(_900) + int(_968);
    int _1200 = _1194;
    if (!_1162)
    {
        int _1202 = ~_1148;
        int _1204 = _1202 + 1;
        _1200 = _1204;
    }
    int _1206 = _1200;
    int _1208 = _1106 + 8;
    uint _1210 = uint(int(uint(_1208) >> uint(2)));
    uint _1212 = uint(int(uint(int(_1210)) >> uint(2)));
    int _1214 = int(_1210) & 3;
    float _1216 = (*spvDescriptorSet0.vp_c9)._m0[int(_1212)][_1214];
    int _1218 = int(_1210) + 1;
    uint _1220 = uint(int(uint(_1218) >> uint(2)));
    int _1222 = _1218 & 3;
    float _1224 = (*spvDescriptorSet0.vp_c9)._m0[int(_1220)][_1222];
    int _1226 = ~_399;
    int _1228 = _1226 + 1;
    float _1230 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1232 = int(_1230);
    int _1234 = abs(_1206);
    int _1236 = _1228 * _1198;
    int _1238 = _1236 + _742;
    int _1240 = abs(_1154);
    int _1242 = ~_1196;
    int _1244 = _1242 + 1;
    int _1246 = _1244 + 1;
    int _1248 = ~_1240;
    int _1250 = _1248 + 1;
    int _1252 = _1250 + 1;
    bool _1254 = !_1122;
    int _1256 = _1254 ? 0 : 1;
    int _1258 = _1246 * as_type<int>(_1078);
    int _1260 = ~_1234;
    int _1262 = _1260 + 1;
    int _1264 = _1262 + 1;
    bool _1266 = uint(_1238) >= uint(_399);
    int _1268 = _1252 * as_type<int>(_1070);
    int _1270 = _1268 + _1258;
    int _1272 = abs(_1256);
    int _1274 = _1264 * as_type<int>(_1138);
    int _1276 = ~_1156;
    int _1278 = _1276 + 1;
    int _1280 = _1278 + 1;
    int _1282 = _1280;
    if (_1164)
    {
        int _1284 = ~_1156;
        int _1286 = _1284 + 1;
        _1282 = _1286;
    }
    int _1288 = _1282;
    bool _1290 = !_1266;
    int _1292 = _1290 ? 0 : (-1);
    int _1294 = ~_1272;
    int _1296 = _1294 + 1;
    int _1298 = _1296 + 1;
    int _1300 = abs(_1094);
    int _1302 = abs(_1160);
    int _1304 = _1298 * as_type<int>(_1130);
    int _1306 = _1304 + _1274;
    int _1308 = abs(_1288);
    int _1310 = ~_1198;
    int _1312 = _1310 + _1292;
    int _1314 = _1312 + 1;
    int _1316 = ~_1300;
    int _1318 = _1316 + 1;
    int _1320 = _1318 + 1;
    int _1322 = _399 * _1314;
    int _1324 = _1322 + _742;
    int _1326 = ~_1308;
    int _1328 = _1326 + 1;
    int _1330 = _1328 + 1;
    bool _1332 = !_1166;
    int _1334 = _1332 ? 0 : (-1);
    int _1336 = _1320 * as_type<int>(_1180);
    int _1338 = _1336 + _1270;
    int _1340 = ~_1302;
    int _1342 = _1340 + 1;
    int _1344 = _1342 + 1;
    int _1346 = abs(_1110);
    int _1348 = _1330 * as_type<int>(_1216);
    int _1350 = _1348 + _1306;
    int _1352 = abs(_1334);
    int _1354 = _1344 * as_type<int>(_1188);
    int _1356 = _1354 + _1338;
    int _1358 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1360 = _1358 != 0;
    int _1362 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1364 = _1362 != 0;
    int _1366 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1368 = _1366 != 0;
    int _1370 = ~_1346;
    int _1372 = _1370 + 1;
    int _1374 = _1372 + 1;
    int _1376 = abs(_1114);
    float _1378 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1380 = ~_1352;
    int _1382 = _1380 + 1;
    int _1384 = _1382 + 1;
    int _1386 = _1356 * _1374;
    int _1388 = ~_1376;
    int _1390 = _1388 + 1;
    int _1392 = _1390 + 1;
    float _1394 = -_1378;
    float _1396 = fma(_760, 2.0, _1394);
    bool _1398 = !_744;
    int _1400 = _1398 ? _1324 : (-1);
    int _1402 = _1384 * as_type<int>(_1224);
    int _1404 = _1402 + _1350;
    float _1406 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _1408 = int(_1406);
    int _1410 = _1142 * _1346;
    int _1412 = _1410 + _1386;
    int _1414 = abs(_1232);
    int _1416 = _1404 * _1392;
    float _1418 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1420 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _1418;
    float _1422 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1424 = _1422 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    int _1426 = _1400 * _1376;
    int _1428 = _1426 + _1416;
    float _1430 = float(uint(_1232));
    float _1432 = fma(_307, (*spvDescriptorSet0.vp_c10)._m0[5].z, _716);
    float _1434 = float(uint(_1414));
    float _1436 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1438 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _1436;
    float _1440 = float(uint(_1412));
    float _1442 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _1444 = _1442 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _1446 = 1.0 / _1430;
    float _1448 = float(uint(_1408));
    float _1450 = _421 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1452 = abs(_1408);
    float _1454 = _1432 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1456 = -_147;
    float _1458 = fma(_1456, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1396);
    float _1460 = float(uint(_1452));
    float _1462 = 1.0 / _1448;
    float _1464 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1466 = fma(_1450, -2.0, _1464);
    float _1468 = 1.0 / _1434;
    int _1470 = as_type<int>(_1446) + (-2);
    float _1472 = fma(_307, (*spvDescriptorSet0.vp_c10)._m0[4].z, _353);
    float _1474 = float(uint(_1428));
    float _1476 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1478 = as_type<float>(_1470) * _1440;
    int _1480 = abs(_1412);
    float _1482 = 1.0 / _1420;
    int _1484 = as_type<int>(_1462) + (-2);
    float _1486 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1488 = float(uint(_1480));
    float _1490 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1492 = as_type<float>(_1484) * _1474;
    float _1494 = fma(_307, (*spvDescriptorSet0.vp_c10)._m0[6].z, _722);
    int _1496 = as_type<int>(_1468) + (-2);
    float _1498 = 1.0 / _1460;
    float _1500 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1502 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1504 = as_type<float>(_1496) * _1488;
    float _1506 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1508 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1510 = _337 + _1508;
    int _1512 = abs(_1428);
    float _1514 = trunc(_1478);
    float _1516 = precise::max(_1514, 0.0);
    uint _1518 = uint(_1516);
    float _1520 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1522 = _1476 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1524 = _1486 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1526 = _1490 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1528 = _1500 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1530 = _1502 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1532 = _1506 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1534 = trunc(_1504);
    float _1536 = precise::max(_1534, 0.0);
    uint _1538 = uint(_1536);
    float _1540 = _1510 * _1482;
    int _1542 = ~_1232;
    int _1544 = _1542 + 1;
    out.m_72.x = _1522;
    out.m_72.y = _1524;
    out.m_72.z = _1526;
    float _1546 = _1472 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    out.m_74.x = _1528;
    out.m_74.y = _1530;
    out.m_74.z = _1532;
    out.m_74.w = _1520;
    float _1548 = trunc(_1492);
    float _1550 = precise::max(_1548, 0.0);
    uint _1552 = uint(_1550);
    int _1554 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1556 = _1554 != 0;
    float _1558 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1466);
    float _1560 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _1562 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _1560;
    float _1564 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _1566 = _1564 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _1568 = _1494 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1570 = as_type<int>(_1498) + (-2);
    float _1572 = 1.0 / _1424;
    int _1574 = _1544 * int(_1518);
    int _1576 = _1574 + _1412;
    float _1578 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1580 = _337 + _1578;
    float _1582 = float(uint(_1512));
    float _1584 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _1586 = _337 + _1584;
    int _1588 = ~_1414;
    int _1590 = _1588 + 1;
    float _1592 = 1.0 / _1444;
    int _1594 = ~_1408;
    int _1596 = _1594 + 1;
    float _1598 = as_type<float>(_1570) * _1582;
    float _1600 = float(uint(_1576));
    int _1602 = _1590 * int(_1538);
    int _1604 = _1602 + _1480;
    int _1606 = _1596 * int(_1552);
    int _1608 = _1606 + _1428;
    float _1610 = 1.0 / _1438;
    float _1612 = as_type<float>(_1470) * _1600;
    float _1614 = float(uint(_1604));
    float _1616 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _1618 = _337 + _1616;
    float _1620 = _1580 * _1572;
    float _1622 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1624 = _337 + _1622;
    float _1626 = float(uint(_1608));
    float _1628 = as_type<float>(_1496) * _1614;
    float _1630 = 1.0 / _1566;
    float _1632 = _1618 * _1592;
    float _1634 = _419 + _421;
    float _1636 = _423 + _419;
    float _1638 = as_type<float>(_1484) * _1626;
    int _1640 = ~_1452;
    int _1642 = _1640 + 1;
    float _1644 = _1634 + (-1.0);
    float _1646 = _1636 + (-1.0);
    float _1648 = trunc(_1598);
    float _1650 = precise::max(_1648, 0.0);
    uint _1652 = uint(_1650);
    float _1654 = _1624 * _1610;
    float _1656 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _1658 = _337 + _1656;
    float _1660 = trunc(_1612);
    float _1662 = precise::max(_1660, 0.0);
    uint _1664 = uint(_1662);
    float _1666 = _1658 * _1630;
    float _1668 = fma(_1646, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _1670 = ~_1232;
    int _1672 = _1670 + 1;
    float _1674 = fma(_1644, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1676 = 1.0 / _1562;
    int _1678 = _1642 * int(_1652);
    int _1680 = _1678 + _1512;
    float _1682 = float(uint(_1680));
    float _1684 = floor(_446);
    int _1686 = int(_1518) + int(_1664);
    float _1688 = as_type<float>(_1570) * _1682;
    int _1690 = _1672 * _1686;
    int _1692 = _1690 + _1412;
    int _1694 = ~_1408;
    int _1696 = _1694 + 1;
    float _1698 = trunc(_1628);
    float _1700 = precise::max(_1698, 0.0);
    uint _1702 = uint(_1700);
    float _1704 = _1586 * _1676;
    float _1706 = trunc(_1638);
    float _1708 = precise::max(_1706, 0.0);
    uint _1710 = uint(_1708);
    bool _1712 = _1684 >= 0.0;
    bool _1714 = isnan(_1684);
    bool _1716 = _1712 || _1714;
    bool _1718 = isnan(0.0);
    bool _1720 = _1716 || _1718;
    int _1722 = int(_1538) + int(_1702);
    float _1724 = trunc(_1688);
    float _1726 = precise::max(_1724, 0.0);
    uint _1728 = uint(_1726);
    float _1730 = -_227;
    int _1732 = _1150 ? as_type<int>(_1730) : as_type<int>(_227);
    bool _1734 = _1684 > 0.0;
    int _1736 = ~_1414;
    int _1738 = _1736 + 1;
    int _1740 = as_type<int>(_1684);
    float _1742 = as_type<float>(_1642);
    float _1744 = as_type<float>(_1702);
    if (_1556)
    {
        _1740 = 0;
    }
    int _1746 = _1740;
    float _1748 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1750 = _1746;
    if (!_1556)
    {
        _1750 = 1;
    }
    int _1752 = _1750;
    int _1754 = _1738 * _1722;
    int _1756 = _1754 + _1480;
    bool _1758 = uint(_1692) >= uint(_1232);
    float _1760 = _423 + _421;
    int _1762 = int(_1552) + int(_1710);
    bool _1764 = !_1758;
    int _1766 = _1764 ? 0 : (-1);
    float _1768 = _1760 + (-1.0);
    bool _1770 = _419 > 0.5;
    int _1772 = _1696 * _1762;
    int _1774 = _1772 + _1428;
    bool _1776 = !_1360;
    float _1778 = _1776 ? _227 : as_type<float>(_1732);
    bool _1780 = uint(_1756) >= uint(_1414);
    int _1782 = int(_1734);
    int _1784 = _1720 ? 2 : 0;
    int _1786 = _1782 | _1784;
    int _1788 = _1780 ? 4 : 0;
    int _1790 = _1786 | _1788;
    int _1792 = _1364 ? 8 : 0;
    int _1794 = _1790 | _1792;
    int _1796 = _1770 ? 16 : 0;
    int _1798 = _1794 | _1796;
    int _1800 = _1368 ? 32 : 0;
    int _1802 = _1798 | _1800;
    int _1804 = _1170 ? 64 : 0;
    int _1806 = _1802 | _1804;
    int _1808 = _1806 & 16;
    bool _1810 = !_1780;
    int _1812 = _1810 ? 0 : (-1);
    bool _1814 = _1808 != 0;
    int _1816 = ~_1686;
    int _1818 = _1816 + _1766;
    int _1820 = _1818 + 1;
    float _1822 = -_223;
    int _1824 = _1814 ? as_type<int>(_1822) : as_type<int>(_223);
    bool _1826 = uint(_1774) >= uint(_1408);
    bool _1828 = _421 > 0.5;
    int _1830 = int(_1652) + int(_1728);
    float _1832 = _419 + (-0.5);
    int _1834 = ~_1452;
    int _1836 = _1834 + 1;
    bool _1838 = !_1170;
    float _1840 = _1838 ? _223 : as_type<float>(_1824);
    int _1842 = _1232 * _1820;
    int _1844 = _1842 + _1412;
    float _1846 = -_227;
    float _1848 = _1828 ? _1846 : _227;
    int _1850 = _1836 * _1830;
    int _1852 = _1850 + _1512;
    bool _1854 = _1752 != 1;
    bool _1856 = _1232 == 0;
    bool _1858 = !_1826;
    int _1860 = _1858 ? 0 : (-1);
    bool _1862 = !_1856;
    int _1864 = _1862 ? _1844 : (-1);
    int _1866 = ~_1762;
    int _1868 = _1866 + _1860;
    int _1870 = _1868 + 1;
    bool _1872 = uint(_1852) >= uint(_1452);
    int _1874 = ~_1812;
    int _1876 = _1722 + _1874;
    int _1878 = _1876 + 1;
    int _1880 = _1428 ^ _1408;
    int _1882 = _1408 * _1870;
    int _1884 = _1882 + _1428;
    bool _1886 = !_1872;
    int _1888 = _1886 ? 0 : (-1);
    bool _1890 = _1232 == 0;
    uint _1892 = uint(int(uint(_1880) >> uint(31)));
    int _1894 = _1412 ^ _1232;
    int _1896 = ~_1888;
    int _1898 = _1830 + _1896;
    int _1900 = _1898 + 1;
    int _1902 = ~int(_1892);
    int _1904 = _1902 + 1;
    float _1906 = _423 * 2.0;
    uint _1908 = uint(int(uint(_1894) >> uint(31)));
    bool _1910 = !_1364;
    float _1912 = _1910 ? _227 : _1848;
    int _1914 = _1900 ^ _1904;
    bool _1916 = _423 > 0.5;
    int _1918 = ~int(_1908);
    int _1920 = _1918 + 1;
    int _1922 = ~_1904;
    int _1924 = _1922 + _1914;
    int _1926 = _1924 + 1;
    float _1928 = -_223;
    int _1930 = _1916 ? as_type<int>(_1928) : as_type<int>(_223);
    float _1932 = floor(_1906);
    int _1934 = _1878 ^ _1920;
    bool _1936 = _1408 == 0;
    bool _1938 = _1408 == 0;
    float _1940 = _421 * 2.0;
    int _1942 = ~_1920;
    int _1944 = _1942 + _1934;
    int _1946 = _1944 + 1;
    float _1948 = floor(_1940);
    float _1950 = _421 + (-0.5);
    bool _1952 = !_1368;
    float _1954 = _1952 ? _223 : as_type<float>(_1930);
    bool _1956 = !_1936;
    int _1958 = _1956 ? _1884 : (-1);
    float _1960 = fma(_1768, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1962 = !_1890;
    int _1964 = _1962 ? _1946 : (-1);
    int _1966 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1968 = _1966 != 0;
    int _1970 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1972 = _1970 != 0;
    int _1974 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1976 = _1974 != 0;
    float _1978 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1980 = (*spvDescriptorSet0.vp_c9)._m0[198].y;
    float _1982 = _1848;
    if (!_1854)
    {
        _1980 = _421;
    }
    float _1984 = _1980;
    float _1986 = fma(_419, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1978);
    float _1988 = _1984;
    if (!_1854)
    {
        _1742 = _421;
    }
    float _1990 = _1742;
    float _1992 = _1990;
    if (_1854)
    {
        _1988 = _419;
    }
    float _1994 = _1988;
    float _1996 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1986);
    if (_1854)
    {
        _1992 = _419;
    }
    float _1998 = _1992;
    float _2000 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _2002 = !_1938;
    int _2004 = _2002 ? _1926 : (-1);
    float _2006 = _423 + (-0.5);
    if (!_1854)
    {
        _1982 = _423;
    }
    float _2008 = _1982;
    float _2010 = fma(_421, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2000);
    float _2012 = _2008;
    if (!_1854)
    {
        _1744 = _423;
    }
    float _2014 = _1744;
    bool _2016 = _1932 >= 0.0;
    bool _2018 = isnan(_1932);
    bool _2020 = _2016 || _2018;
    bool _2022 = isnan(0.0);
    bool _2024 = _2020 || _2022;
    float _2026 = _2014;
    if (_1854)
    {
        _2012 = _421;
    }
    float _2028 = _2012;
    float _2030 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _2032 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _2030;
    if (_1854)
    {
        _2026 = _421;
    }
    float _2034 = _2026;
    float _2036 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _2038 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _2036;
    int _2040 = _2024 ? 0 : 1;
    float _2042 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _2044 = _2042 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _2046 = !_1968;
    int _2048 = _2046 ? 0 : 1;
    float _2050 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _2052 = _2050 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _2054 = _1932 > 0.0;
    float _2056 = fma(_2044, _1620, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _2058 = _1948 > 0.0;
    float _2060 = fma(_2032, _1540, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _2062 = _1948 >= 0.0;
    bool _2064 = isnan(_1948);
    bool _2066 = _2062 || _2064;
    bool _2068 = isnan(0.0);
    bool _2070 = _2066 || _2068;
    float _2072 = fma(_2052, _1620, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _2074 = fma(_2038, _1540, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _2076 = _2028 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2078 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _2080 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _2078;
    float _2082 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _2084 = _2082 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _2086 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _2088 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _2086;
    float _2090 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _2092 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _2090;
    float _2094 = fma(_2080, _1654, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _2096 = fma(_2084, _1632, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _2098 = fma(_2088, _1654, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _2100 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _2102 = _2100 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _2104 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _2106 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _2104;
    float _2108 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _2110 = _2108 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _2112 = _1748 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2114 = fma(_2102, _1632, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _2116 = fma(_2106, _1704, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _2118 = fma(_2092, _1704, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _2120 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _2122 = _2120 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _2124 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _2126 = ~_2040;
    int _2128 = _2126 + 1;
    int _2130 = _2128 + 1;
    float _2132 = _1994 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _2134 = _2130;
    if (!_2054)
    {
        int _2136 = ~_2040;
        int _2138 = _2136 + 1;
        _2134 = _2138;
    }
    int _2140 = _2134;
    float _2142 = fma(_2122, _1666, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _2144 = fma(_2110, _1666, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _2146 = fma(_1998, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2124);
    float _2148 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2150 = fma(_2034, (*spvDescriptorSet0.vp_c9)._m0[83].w, _365);
    float _2152 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2154 = fma(_2076, -2.0, _367);
    float _2156 = float(_1864);
    float _2158 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2160 = _1546 + _2158;
    float _2162 = -_2152;
    float _2164 = fma(_2132, 2.0, _2162);
    float _2166 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2168 = _1454 + _2166;
    float _2170 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2172 = fma(_2112, _2156, _1458);
    float _2174 = float(_1964);
    float _2176 = _2168 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2178 = float(_2004);
    float _2180 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2182 = _1568 + _2180;
    float _2184 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2150);
    float _2186 = fma(_2160, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2176);
    float _2188 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2190 = _2148 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2192 = float(_1958);
    float _2194 = _1840 + 0.5;
    float _2196 = -_147;
    float _2198 = fma(_2196, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2164);
    float _2200 = fma(_2182, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2186);
    float _2202 = -_2184;
    float _2204 = _2202 + 1.0;
    float _2206 = fma(_2112, _2194, _2172);
    float _2208 = _2170 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2210 = fma(_2190, _2192, _2198);
    float _2212 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2154);
    float _2214 = _1912 + (-0.5);
    float _2216 = -_1558;
    float _2218 = fma(_2208, _2174, _2216);
    float _2220 = _1954 + 0.5;
    bool _2222 = _337 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _2224 = isnan(_337);
    bool _2226 = _2222 || _2224;
    bool _2228 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _2230 = _2226 || _2228;
    float _2232 = float(_2230);
    float _2234 = _2188 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2236 = fma(_2190, _2220, _2210);
    bool _2238 = _337 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _2240 = isnan(_337);
    bool _2242 = _2238 || _2240;
    bool _2244 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _2246 = _2242 || _2244;
    float _2248 = float(_2246);
    float _2250 = -_2208;
    float _2252 = fma(_2250, _2214, _2218);
    float _2254 = -_2212;
    float _2256 = fma(_2234, _2178, _2254);
    float _2258 = -_1996;
    float _2260 = _2258 + 1.0;
    bool _2262 = _337 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _2264 = isnan(_337);
    bool _2266 = _2262 || _2264;
    bool _2268 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _2270 = _2266 || _2268;
    float _2272 = float(_2270);
    float _2274 = -_2248;
    float _2276 = _2274 + 1.0;
    float _2278 = -_2232;
    float _2280 = _2278 + 1.0;
    float _2282 = -_2260;
    float _2284 = fma(_1840, _2282, _2206);
    float _2286 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2146);
    float _2288 = _1778 + (-0.5);
    float _2290 = _2272 * _2276;
    float _2292 = -_2272;
    float _2294 = _2292 + 1.0;
    float _2296 = _2248 * _2280;
    float _2298 = -_2286;
    float _2300 = _2298 + 1.0;
    float _2302 = -_2234;
    float _2304 = fma(_2302, _2288, _2256);
    bool _2306 = _337 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _2308 = isnan(_337);
    bool _2310 = _2306 || _2308;
    bool _2312 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _2314 = _2310 || _2312;
    float _2316 = float(_2314);
    float _2318 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2010);
    bool _2320 = _337 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _2322 = isnan(_337);
    bool _2324 = _2320 || _2322;
    bool _2326 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _2328 = _2324 || _2326;
    float _2330 = float(_2328);
    float _2332 = -_2300;
    float _2334 = fma(_1954, _2332, _2236);
    bool _2336 = _2200 >= 0.0;
    float _2338 = -_2318;
    float _2340 = _2338 + 1.0;
    bool _2342 = _337 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _2344 = isnan(_337);
    bool _2346 = _2342 || _2344;
    bool _2348 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _2350 = _2346 || _2348;
    float _2352 = float(_2350);
    float _2354 = _2316 * _2294;
    bool _2356 = _337 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _2358 = isnan(_337);
    bool _2360 = _2356 || _2358;
    bool _2362 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _2364 = _2360 || _2362;
    float _2366 = float(_2364);
    float _2368 = -_2316;
    float _2370 = _2368 + 1.0;
    float _2372 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2374 = log2(_2372);
    float _2376 = -_2330;
    float _2378 = _2376 + 1.0;
    float _2380 = fma(_1778, _2204, _2304);
    float _2382 = _2330 * _2370;
    float _2384 = _2168 * _2168;
    float _2386 = _2352 * _2378;
    float _2388 = -_2352;
    float _2390 = _2388 + 1.0;
    int _2392 = abs(_2048);
    float _2394 = fma(_2160, _2160, _2384);
    float _2396 = _2384;
    int _2398 = _2140;
    if (_2336)
    {
        _2396 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2400 = _2396;
    float _2402 = _2366 * _2390;
    float _2404 = fma(_1912, _2340, _2252);
    float _2406 = fma(_2182, _2182, _2394);
    float _2408 = float(_2140);
    float _2410 = _2060 * _2402;
    float _2412 = _2074 * _2402;
    float _2414 = _2374 * _147;
    float _2416 = in.m_76.x;
    float _2418 = in.m_76.y;
    float _2420 = in.m_76.z;
    float _2422 = rsqrt(_2406);
    if (_2336)
    {
        float _2424 = _2400 * 5.0;
        _2398 = as_type<int>(_2424);
    }
    int _2426 = _2398;
    float _2428 = float(_2392);
    out.m_78.x = _2284;
    out.m_78.y = _2404;
    out.m_78.z = _2334;
    out.m_78.w = _2380;
    bool _2430 = !_1972;
    int _2432 = _2430 ? 0 : 1;
    if (_2336)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7893 = as_type<float>(_2426);
        out.gl_Position.z = _7893;
    }
    float _2434 = exp2(_2414);
    float _2436 = _2428 * _2408;
    bool _2438 = !_1976;
    int _2440 = _2438 ? 0 : 1;
    if (_2336)
    {
        out.m_61.x = 0.0;
    }
    float _2442 = _2168 * _2422;
    float _2444 = _2160 * _2422;
    if (_2336)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2446 = -_2442;
    float _2448 = fma(_2446, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1454);
    float _2450 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2452 = 1.0 + _2450;
    float _2454 = _2182 * _2422;
    float _2456 = -_2444;
    float _2458 = fma(_2456, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1546);
    float _2460 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2462 = _2448 + _2460;
    bool _2464 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2466 = isnan(1.0);
    bool _2468 = _2464 || _2466;
    bool _2470 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2472 = _2468 || _2470;
    float _2474 = -_2454;
    float _2476 = fma(_2474, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1568);
    float _2478 = 1.0 / _2452;
    float _2480 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2482 = _2458 + _2480;
    float _2484 = _2462 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2486 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2488 = _2476 + _2486;
    int _2490 = _1720 ? 0 : 1;
    float _2492 = -_2434;
    float _2494 = _2492 + 1.0;
    float _2496 = fma(_2482, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2484);
    bool _2498 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2500 = isnan(0.0);
    bool _2502 = _2498 || _2500;
    bool _2504 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2506 = _2502 || _2504;
    float _2508 = _2436 * (-2.0);
    int _2510 = ~_2490;
    int _2512 = _2510 + 1;
    int _2514 = _2512 + 1;
    float _2516 = fma(_2488, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2496);
    float _2518 = -_2442;
    float _2520 = fma(_2518, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2168);
    int _2522 = _2514;
    int _2524 = as_type<int>(_2488);
    float _2526 = _2482;
    if (!_1734)
    {
        int _2528 = ~_2490;
        int _2530 = _2528 + 1;
        _2522 = _2530;
    }
    int _2532 = _2522;
    float _2534 = fma(_2508, _2416, _2416);
    float _2536 = _2506 ? _2494 : 0.0;
    float _2538 = -_2444;
    float _2540 = fma(_2538, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2160);
    bool _2542 = _2516 >= 0.0;
    float _2544 = _2520 * _2520;
    float _2546 = fma(_1674, _2508, _1674);
    float _2548 = _2534;
    if (_2472)
    {
        float _2550 = _2536 * _2478;
        _149 = _2550;
    }
    float _2552 = _149;
    float _2554 = fma(_1832, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2534);
    int _2556 = _2070 ? 0 : 1;
    float _2558 = fma(_2540, _2540, _2544);
    float _2560 = -_2454;
    float _2562 = fma(_2560, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2182);
    float _2564 = fma(_2546, _2552, _2554);
    int _2566 = ~_2556;
    int _2568 = _2566 + 1;
    int _2570 = _2568 + 1;
    float _2572 = fma(_2562, _2562, _2558);
    int _2574 = _2570;
    if (!_2058)
    {
        int _2576 = ~_2556;
        int _2578 = _2576 + 1;
        _2574 = _2578;
    }
    int _2580 = _2574;
    float _2582 = _2564 * 0.15915493667125701904296875;
    int _2584 = abs(_2432);
    if (_2542)
    {
        out.m_61.x = 0.0;
    }
    if (_2542)
    {
        _2548 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2586 = _2548;
    float _2588 = sqrt(_2572);
    float _2590 = float(_2580);
    int _2592 = as_type<int>(_2586);
    if (_2542)
    {
        float _2594 = _2586 * 5.0;
        _2592 = as_type<int>(_2594);
    }
    int _2596 = _2592;
    float _2598 = float(_2532);
    float _2600 = _2582 * 6.283185482025146484375;
    float _2602 = sin(_2600);
    float _2604 = float(_2584);
    int _2606 = abs(_2440);
    if (_2542)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _8164 = as_type<float>(_2596);
        out.gl_Position.z = _8164;
    }
    float _2608 = _2604 * _2598;
    if (_2542)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2610 = -_1454;
    float _2612 = _2610 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2614 = _2608 * (-2.0);
    float _2616 = -_1546;
    float _2618 = _2616 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2620 = float(_2606);
    float _2622 = _2612 * _2612;
    float _2624 = fma(_2614, _2418, _2418);
    float _2626 = -_1568;
    float _2628 = _2626 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2630 = -_2366;
    float _2632 = _2630 + 1.0;
    float _2634 = fma(_2618, _2618, _2622);
    float _2636 = fma(_1950, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2624);
    float _2638 = fma(_1960, _2614, _1960);
    float _2640 = fma(_2632, (*spvDescriptorSet0.vp_c9)._m0[143].x, _2410);
    float _2642 = fma(_2628, _2628, _2634);
    float _2644 = fma(_2632, (*spvDescriptorSet0.vp_c9)._m0[143].y, _2412);
    float _2646 = _2620 * _2590;
    float _2648 = fma(_2056, _2386, _2640);
    float _2650 = fma(_2638, _2552, _2636);
    float _2652 = fma(_2072, _2386, _2644);
    float _2654 = rsqrt(_2642);
    float _2656 = fma(_2094, _2382, _2648);
    float _2658 = _2646 * (-2.0);
    float _2660 = fma(_2098, _2382, _2652);
    float _2662 = _2650 * 0.15915493667125701904296875;
    float _2664 = fma(_2096, _2354, _2656);
    float _2666 = fma(_2658, _2420, _2420);
    float _2668 = fma(_2114, _2354, _2660);
    float _2670 = fma(_1668, _2658, _1668);
    float _2672 = fma(_2116, _2290, _2664);
    float _2674 = in.m_68.x;
    float _2676 = in.m_68.y;
    float _2678 = fma(_2006, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2666);
    float _2680 = fma(_2118, _2290, _2668);
    float _2682 = fma(_2142, _2296, _2672);
    float _2684 = _2582 * 6.283185482025146484375;
    float _2686 = cos(_2684);
    float _2688 = fma(_2670, _2552, _2678);
    float _2690 = _2618 * _2654;
    float _2692 = _2628 * _2654;
    float _2694 = fma(_2144, _2296, _2680);
    float _2696 = _2612 * _2654;
    float _2698 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2700 = _2690 * _2698;
    float _2702 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2704 = _2692 * _2702;
    float _2706 = fma(_2232, (*spvDescriptorSet0.vp_c9)._m0[149].x, _2682);
    float _2708 = fma(_2232, (*spvDescriptorSet0.vp_c9)._m0[149].y, _2694);
    float _2710 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2712 = -_2700;
    float _2714 = fma(_2692, _2710, _2712);
    float _2716 = _2662 * 6.283185482025146484375;
    float _2718 = sin(_2716);
    float _2720 = _2688 * 0.15915493667125701904296875;
    float _2722 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2724 = _2696 * _2722;
    float _2726 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2728 = -_2704;
    float _2730 = fma(_2696, _2726, _2728);
    float _2732 = _2714 * _2714;
    float _2734 = _2422 * _2588;
    float _2736 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2738 = -_2724;
    float _2740 = fma(_2690, _2736, _2738);
    float _2742 = _2662 * 6.283185482025146484375;
    float _2744 = cos(_2742);
    float _2746 = fma(_2730, _2730, _2732);
    float _2748 = _2708 * _2676;
    float _2750 = _2706 * _2674;
    float _2752 = _2734 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2754 = _2752 * 0.5;
    float _2756 = _2748 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2758 = _2750 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2760 = _2720 * 6.283185482025146484375;
    float _2762 = sin(_2760);
    float _2764 = _2602 * _2718;
    float _2766 = _2734 * _2756;
    float _2768 = _2686 * _2718;
    float _2770 = _2720 * 6.283185482025146484375;
    float _2772 = cos(_2770);
    float _2774 = _2686 * _2744;
    float _2776 = _2602 * _2744;
    float _2778 = fma(_2762, _2764, _2774);
    float _2780 = fma(_2740, _2740, _2746);
    float _2782 = fma(_2762, _2774, _2764);
    float _2784 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _223);
    float _2786 = rsqrt(_2780);
    float _2788 = _2602 * _2772;
    float _2790 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _227);
    float _2792 = _2686 * _2772;
    float _2794 = _2744 * _2772;
    float _2796 = _2718 * _2772;
    float _2798 = _2734 * _2758;
    float _2800 = _2790 * _2766;
    float _2802 = -_2768;
    float _2804 = fma(_2762, _2776, _2802);
    float _2806 = -_2776;
    float _2808 = fma(_2762, _2768, _2806);
    float _2810 = _2784 * _2798;
    float _2812 = _2792 * _2800;
    float _2814 = -_2800;
    float _2816 = _2762 * _2814;
    float _2818 = _227 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2820 = fma(_2782, _2810, _2812);
    float _2822 = _2730 * _2786;
    float _2824 = _2714 * _2786;
    float _2826 = _2788 * _2800;
    float _2828 = _2740 * _2786;
    float _2830 = _2696 * _2822;
    float _2832 = _2692 * _2824;
    float _2834 = fma(_2794, _2810, _2816);
    float _2836 = fma(_2808, _2754, _2820);
    float _2838 = -_2830;
    float _2840 = fma(_2690, _2824, _2838);
    float _2842 = -_2832;
    float _2844 = fma(_2696, _2828, _2842);
    float _2846 = fma(_2804, _2810, _2826);
    float _2848 = fma(_2796, _2754, _2834);
    float _2850 = _2840 * _2836;
    float _2852 = _2844 * _2836;
    float _2854 = fma(_2778, _2754, _2846);
    float _2856 = _2690 * _2828;
    float _2858 = fma(_2828, _2848, _2850);
    float _2860 = fma(_2822, _2848, _2852);
    float _2862 = _2782 * _2844;
    float _2864 = -_2856;
    float _2866 = fma(_2692, _2822, _2864);
    float _2868 = fma(_2692, _2854, _2858);
    float _2870 = fma(_2690, _2854, _2860);
    float _2872 = _2782 * _2840;
    float _2874 = _2782 * _2866;
    float _2876 = _1568 + _2868;
    float _2878 = _1546 + _2870;
    float _2880 = _2792 * _2844;
    float _2882 = _2792 * _2866;
    float _2884 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2886 = _2876 + _2884;
    float _2888 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2890 = _2878 + _2888;
    float _2892 = _2792 * _2840;
    float _2894 = _2808 * _2844;
    float _2896 = _2886 * _2886;
    float _2898 = _2890 * _2890;
    float _2900 = _2808 * _2840;
    float _2902 = _2808 * _2866;
    float _2904 = fma(_2794, _2822, _2862);
    float _2906 = _2898 + _2896;
    float _2908 = fma(_2794, _2824, _2874);
    float _2910 = fma(_2794, _2828, _2872);
    float _2912 = fma(_2818, _2818, 1.0);
    float _2914 = sqrt(_2906);
    float _2916 = _2866 * _2836;
    float _2918 = -_2762;
    float _2920 = fma(_2918, _2828, _2892);
    float _2922 = fma(_2796, _2824, _2902);
    float _2924 = fma(_2796, _2828, _2900);
    float _2926 = fma(_2824, _2848, _2916);
    float _2928 = -_2762;
    float _2930 = fma(_2928, _2822, _2880);
    float _2932 = -_2762;
    float _2934 = fma(_2932, _2824, _2882);
    float _2936 = rsqrt(_2912);
    float _2938 = fma(_2696, _2854, _2926);
    float _2940 = fma(_2796, _2822, _2894);
    float _2942 = _1454 + _2938;
    bool _2944 = _2914 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2946 = _2796;
    float _2948 = _2898;
    float _2950 = _2896;
    float _2952 = _2876;
    float _2954 = _2878;
    float _2956 = _2900;
    if (!_2944)
    {
        _2946 = _2898;
    }
    float _2958 = _2946;
    float _2960 = _2958;
    if (!_2944)
    {
        _2948 = _2942;
    }
    float _2962 = _2948;
    bool _2964 = !_2944;
    float _2966 = _2962;
    if (!_2964)
    {
        float _2968 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2970 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2972 = _2914 + _2970;
        float _2974 = rsqrt(_2906);
        float _2976 = _2972 * _2968;
        float _2978 = _2942 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2980 = _2976 * 0.15915493667125701904296875;
        float _2982 = _2980 * 6.283185482025146484375;
        float _2984 = sin(_2982);
        float _2986 = _2980 * 6.283185482025146484375;
        float _2988 = cos(_2986);
        float _2990 = fma(_2984, _2978, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2992 = _2974 * _2990;
        float _2994 = fma(_2890, _2992, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2996 = _2988 + (-1.0);
        float _2998 = fma(_2886, _2992, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _3000 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _3002 = _2994 + _3000;
        float _3004 = _2996 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3006 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _3008 = _2998 + _3006;
        float _3010 = _3002 * _3002;
        float _3012 = fma(_2942, _2988, _3004);
        float _3014 = _3008 * _3008;
        _2966 = _3012;
        _2960 = _3010;
        _2950 = _3014;
        _2952 = _2998;
        _2954 = _2994;
    }
    float _3016 = _2966;
    float _3018 = _2960;
    float _3020 = _2950;
    float _3022 = _2952;
    float _3024 = _2954;
    float _3026 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3028 = _3016 + _3026;
    float _3030 = fma(_2788, _2690, _2930);
    float _3032 = fma(_2788, _2696, _2934);
    float _3034 = fma(_2788, _2692, _2920);
    float _3036 = fma(_3028, _3028, _3018);
    float _3038 = fma(_2778, _2690, _2940);
    float _3040 = fma(_2778, _2696, _2922);
    float _3042 = fma(_2778, _2692, _2924);
    float _3044 = _3036 + _3020;
    float _3046 = fma(_2804, _2690, _2904);
    float _3048 = fma(_2804, _2696, _2908);
    float _3050 = _2818 * _2936;
    float _3052 = _223 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3054 = _2818 * _3030;
    float _3056 = fma(_2804, _2692, _2910);
    float _3058 = _2818 * _3032;
    float _3060 = _2818 * _3034;
    float _3062 = -_3038;
    float _3064 = _3050 * _3062;
    float _3066 = -_3040;
    float _3068 = _3050 * _3066;
    float _3070 = -_3042;
    float _3072 = _3050 * _3070;
    float _3074 = fma(_3052, _3046, _3054);
    float _3076 = sqrt(_3044);
    float _3078 = fma(_3052, _3048, _3058);
    float _3080 = fma(_3052, _3056, _3060);
    float _3082 = fma(_2936, _3030, _3064);
    float _3084 = fma(_2936, _3032, _3068);
    float _3086 = _3040 + _3078;
    float _3088 = fma(_2936, _3034, _3072);
    float _3090 = _3038 + _3074;
    float _3092 = _3042 + _3080;
    out.m_80.x = _3046;
    out.m_80.y = _3048;
    out.m_80.z = _3056;
    out.m_82.x = _3082;
    out.m_82.y = _3084;
    out.m_82.z = _3088;
    bool _3094 = _3076 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _3096 = isnan(_3076);
    bool _3098 = _3094 || _3096;
    bool _3100 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _3102 = _3098 || _3100;
    out.m_84.x = _3090;
    out.m_84.y = _3086;
    out.m_84.z = _3092;
    if (!_3102)
    {
        _2956 = 1.0;
    }
    float _3104 = _2956;
    bool _3106 = !_3102;
    float _3108 = _3104;
    if (!_3106)
    {
        bool _3110 = _3076 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _3112 = isnan(_3076);
        bool _3114 = _3110 || _3112;
        bool _3116 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _3118 = _3114 || _3116;
        if (!_3118)
        {
            float _3120 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3122 = _3076 + _3120;
            float _3124 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3126 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _3124;
            float _3128 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _3130 = _3128 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _3132 = 1.0 / _3126;
            float _3134 = _3122 * _3132;
            float _3136 = fma(_3134, _3130, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _3108 = _3136;
            _3138 = true;
        }
        else
        {
            bool _3140 = _3076 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _3142 = isnan(_3076);
            bool _3144 = _3140 || _3142;
            bool _3146 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _3148 = _3144 || _3146;
            if (!_3148)
            {
                float _3150 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3152 = _3076 + _3150;
                float _3154 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3156 = _3154 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _3158 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _3160 = _3158 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _3162 = 1.0 / _3156;
                float _3164 = _3152 * _3162;
                float _3166 = fma(_3164, _3160, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _3108 = _3166;
                _3138 = true;
            }
            else
            {
                _3108 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _3138 = false;
    float _3168 = _3108;
    float _3170 = fma(_2458, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _3172 = fma(_2476, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _3174 = floor(_3170);
    float _3176 = floor(_3172);
    float _3178 = -_3174;
    float _3180 = _3170 + _3178;
    float _3182 = -_3176;
    float _3184 = _3172 + _3182;
    float2 _9116 = float2(_3180, _3184);
    float _3186 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_9116, float2(0.0), isnan(_9116)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_9116, float2(0.0), isnan(_9116)), level(0.0)).x;
    float _3188 = _2448 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3190 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _3192 = _3016 + _3190;
    float _3194 = fma(_2458, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3188);
    float _3196 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _3198 = _3022 + _3196;
    float _3200 = fma(_2476, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3194);
    float _3202 = _2448 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3204 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    bool _3206 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _3208 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _3210 = _3206 || _3208;
    bool _3212 = isnan(0.5);
    bool _3214 = _3210 || _3212;
    float _3216 = _3200 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3218 = fma(_2458, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3202);
    float _3220 = _2448 + _3204;
    float _3222 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _3224 = _3024 + _3222;
    float _3226 = 1.0 / _3216;
    float _3228 = fma(_2476, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3218);
    float _3230 = _3220 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _3232 = fma(_3224, _3168, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _3234 = fma(_3192, _3168, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _3236 = _3228 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3238 = fma(_2458, (*spvDescriptorSet0.vp_c15)._m0[126].x, _3230);
    float _3240 = fma(_3198, _3168, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _3242 = -_2442;
    float _3244 = fma(_3242, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3234);
    float _3246 = _3236 + _3216;
    float _3248 = fma(_2476, (*spvDescriptorSet0.vp_c15)._m0[126].z, _3238);
    float _3250 = -_2454;
    float _3252 = fma(_3250, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3240);
    float _3254 = _3248 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _3256 = _3246 * _3226;
    float _3258 = _3256 * 0.5;
    float _3260 = trunc(_3254);
    int _3262 = int(_3260);
    float _3264 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3266 = fma(_3258, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3264);
    float _3268 = 1.0 / _3266;
    int _3270 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _3272 = _3262 + _3270;
    int _3274 = _3272 + 1;
    float _3276 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3278 = _3268 * _3276;
    float _3280 = _3220 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    bool _3282 = _3278 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _3284 = fma(_2458, (*spvDescriptorSet0.vp_c15)._m0[127].x, _3280);
    bool _3286 = _3278 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _3288 = !_3282;
    int _3290 = _3288 ? 0 : 1;
    float _3292 = fma(_2476, (*spvDescriptorSet0.vp_c15)._m0[127].z, _3284);
    float _3294 = _3292 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    int _3296 = 2;
    float _3298 = _3244;
    float _3300 = _3252;
    int _3302 = _3274;
    float _3304 = _3254;
    if (!_3282)
    {
        _3296 = 1;
    }
    int _3306 = _3296;
    float _3308 = trunc(_3294);
    int _3310 = int(_3308);
    int _3312 = _3306;
    if (!_3286)
    {
        _3312 = _3290;
    }
    int _3314 = _3312;
    bool _3316 = _3274 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _3318 = _3314 << 6;
    int _3320 = _3318 + 48;
    uint _3322 = uint(int(uint(_3320) >> uint(2)));
    uint _3324 = uint(int(uint(int(_3322)) >> uint(2)));
    int _3326 = int(_3322) & 3;
    float _3328 = (*spvDescriptorSet0.vp_c15)._m0[int(_3324)][_3326];
    int _3330 = int(_3322) + 1;
    uint _3332 = uint(int(uint(_3330) >> uint(2)));
    int _3334 = _3330 & 3;
    float _3336 = (*spvDescriptorSet0.vp_c15)._m0[int(_3332)][_3334];
    int _3338 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _3340 = _3310 + _3338;
    int _3342 = _3340 + 1;
    int _3344 = _3318 + 56;
    uint _3346 = uint(int(uint(_3344) >> uint(2)));
    uint _3348 = uint(int(uint(int(_3346)) >> uint(2)));
    int _3350 = int(_3346) & 3;
    float _3352 = (*spvDescriptorSet0.vp_c15)._m0[int(_3348)][_3350];
    int _3354 = int(_3346) + 1;
    uint _3356 = uint(int(uint(_3354) >> uint(2)));
    int _3358 = _3354 & 3;
    float _3360 = (*spvDescriptorSet0.vp_c15)._m0[int(_3356)][_3358];
    int _3362 = _3274 | _3342;
    bool _3364 = _3362 < 0;
    bool _3366 = _3364 || _3316;
    int _3368 = _3318 + 64;
    uint _3370 = uint(int(uint(_3368) >> uint(2)));
    uint _3372 = uint(int(uint(int(_3370)) >> uint(2)));
    int _3374 = int(_3370) & 3;
    float _3376 = (*spvDescriptorSet0.vp_c15)._m0[int(_3372)][_3374];
    int _3378 = int(_3370) + 1;
    uint _3380 = uint(int(uint(_3378) >> uint(2)));
    int _3382 = _3378 & 3;
    float _3384 = (*spvDescriptorSet0.vp_c15)._m0[int(_3380)][_3382];
    float _3386 = -_2444;
    float _3388 = fma(_3386, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3232);
    bool _3390 = _3342 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _3392 = _3390 || _3366;
    int _3394 = _3318 + 72;
    uint _3396 = uint(int(uint(_3394) >> uint(2)));
    uint _3398 = uint(int(uint(int(_3396)) >> uint(2)));
    int _3400 = int(_3396) & 3;
    float _3402 = (*spvDescriptorSet0.vp_c15)._m0[int(_3398)][_3400];
    int _3404 = int(_3396) + 1;
    uint _3406 = uint(int(uint(_3404) >> uint(2)));
    int _3408 = _3404 & 3;
    float _3410 = (*spvDescriptorSet0.vp_c15)._m0[int(_3406)][_3408];
    int _3412 = _3318 + 96;
    uint _3414 = uint(int(uint(_3412) >> uint(2)));
    uint _3416 = uint(int(uint(int(_3414)) >> uint(2)));
    int _3418 = int(_3414) & 3;
    float _3420 = (*spvDescriptorSet0.vp_c15)._m0[int(_3416)][_3418];
    int _3422 = int(_3414) + 1;
    uint _3424 = uint(int(uint(_3422) >> uint(2)));
    int _3426 = _3422 & 3;
    float _3428 = (*spvDescriptorSet0.vp_c15)._m0[int(_3424)][_3426];
    int _3430 = _3318 + 104;
    uint _3432 = uint(int(uint(_3430) >> uint(2)));
    uint _3434 = uint(int(uint(int(_3432)) >> uint(2)));
    int _3436 = int(_3432) & 3;
    float _3438 = (*spvDescriptorSet0.vp_c15)._m0[int(_3434)][_3436];
    int _3440 = int(_3432) + 1;
    uint _3442 = uint(int(uint(_3440) >> uint(2)));
    int _3444 = _3440 & 3;
    float _3446 = (*spvDescriptorSet0.vp_c15)._m0[int(_3442)][_3444];
    float _3448 = _3388;
    float _3450 = as_type<float>(_3342);
    if (!_3214)
    {
        float _3452 = _2462 * _2462;
        float _3454 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3456 = -_1568;
        float _3458 = _3456 + _3240;
        float _3460 = -_1546;
        float _3462 = _3460 + _3232;
        float _3464 = fma(_2482, _2482, _3452);
        float _3466 = fma(_2488, _2488, _3464);
        float _3468 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3470 = sqrt(_3466);
        float _3472 = 1.0 / _2734;
        float _3474 = _3468 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3476 = precise::min(_3470, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3478 = _3476 * _3454;
        float _3480 = -_1454;
        float _3482 = _3480 + _3234;
        float _3484 = _3478 * _3472;
        float _3486 = _3474 * _3484;
        float _3488 = _3458 * _3484;
        float _3490 = fma(_3482, _3486, _2448);
        float _3492 = fma(_3462, _3486, _2458);
        float _3494 = fma(_3474, _3488, _2476);
        _3298 = _3490;
        _3448 = _3492;
        _2524 = as_type<int>(_3484);
        _3300 = _3494;
        _2526 = _3470;
    }
    float _3496 = _3298;
    float _3498 = _3448;
    int _3500 = _2524;
    float _3502 = _3300;
    float _3504 = _2526;
    float _3506 = _3220 * _3428;
    int _3508 = _3500;
    float _3510 = _3504;
    if (!_3392)
    {
        int _3512 = _3342 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _3514 = _3512 + _3274;
        _3302 = _3514;
    }
    int _3516 = _3302;
    float _3518 = _3496 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3520 = _3220 * _3384;
    float _3522 = fma(_2458, _3420, _3506);
    float _3524 = _3220 * _3336;
    if (!_3392)
    {
        int _3526 = _3516 << 2;
        _3508 = _3526;
    }
    int _3528 = _3508;
    float _3530 = fma(_3498, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3518);
    float _3532 = fma(_2476, _3438, _3522);
    float _3534 = fma(_2458, _3328, _3524);
    int _3536 = _3528;
    int _3538 = as_type<int>(_3532);
    if (!_3392)
    {
        int _3540 = 12 & _3528;
        _3536 = _3540;
    }
    int _3542 = _3536;
    int _3544 = _3318 + 80;
    uint _3546 = uint(int(uint(_3544) >> uint(2)));
    uint _3548 = uint(int(uint(int(_3546)) >> uint(2)));
    int _3550 = int(_3546) & 3;
    float _3552 = (*spvDescriptorSet0.vp_c15)._m0[int(_3548)][_3550];
    int _3554 = int(_3546) + 1;
    uint _3556 = uint(int(uint(_3554) >> uint(2)));
    int _3558 = _3554 & 3;
    float _3560 = (*spvDescriptorSet0.vp_c15)._m0[int(_3556)][_3558];
    float _3562 = _3532 + _3446;
    if (!_3392)
    {
        uint _3564 = uint(int(uint(_3516) >> uint(2)));
        _3538 = int(_3564);
    }
    int _3566 = _3538;
    float _3568 = fma(_3502, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3530);
    float _3570 = fma(_2458, _3376, _3520);
    float _3572 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    if (!_3392)
    {
        int _3574 = _3566 << 4;
        int _3576 = _3574 + _3542;
        _3450 = as_type<float>(_3576);
    }
    float _3578 = _3450;
    float _3580 = 1.0 / _3562;
    float _3582 = _3568 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    int _3584 = _3318 + 88;
    uint _3586 = uint(int(uint(_3584) >> uint(2)));
    uint _3588 = uint(int(uint(int(_3586)) >> uint(2)));
    int _3590 = int(_3586) & 3;
    float _3592 = (*spvDescriptorSet0.vp_c15)._m0[int(_3588)][_3590];
    int _3594 = int(_3586) + 1;
    uint _3596 = uint(int(uint(_3594) >> uint(2)));
    int _3598 = _3594 & 3;
    float _3600 = (*spvDescriptorSet0.vp_c15)._m0[int(_3596)][_3598];
    float _3602 = fma(_2476, _3352, _3534);
    float _3604 = fma(_2476, _3402, _3570);
    float _3606 = _3582 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3608 = _3496 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3610 = _3602 + _3360;
    float _3612 = _3604 + _3410;
    float _3614 = -_3606;
    float _3616 = fma(_3614, _3572, 1.0);
    float _3618 = _3578;
    if (!_3392)
    {
        int _3620 = as_type<int>(_3578) + 400;
        uint _3622 = uint(int(uint(_3620) >> uint(2)));
        uint _3624 = uint(int(uint(int(_3622)) >> uint(2)));
        int _3626 = int(_3622) & 3;
        float _3628 = (*spvDescriptorSet0.vp_c15)._m0[int(_3624)][_3626];
        _3618 = _3628;
    }
    float _3630 = _3618;
    float _3632 = _3496 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3634 = fma(_3498, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3608);
    float _3636 = _3496 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3638 = log2(_3616);
    float _3640 = fma(_3498, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3632);
    float _3642 = _3610 * _3580;
    float _3644 = fma(_3502, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3634);
    float _3646 = _3612 * _3580;
    float _3648 = fma(_3502, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3640);
    float _3650 = fma(_3498, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3636);
    bool _3652 = _3642 >= 0.0;
    float _3654 = _3644 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3656 = _3648 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3658 = fma(_3502, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3650);
    bool _3660 = _3642 <= 1.0;
    bool _3662 = _3660 && _3652;
    float _3664 = _3240;
    float _3666 = _3650;
    if (!_3392)
    {
        float _3668 = floor(_3254);
        _3664 = _3668;
    }
    float _3670 = _3664;
    float _3672 = _3656 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3674 = _3658 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    bool _3676 = _3646 >= 0.0;
    bool _3678 = _3676 && _3662;
    float _3680 = _3656 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3682 = fma(_3654, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3672);
    float _3684 = _3638 * 0.693147182464599609375;
    bool _3686 = _3646 <= 1.0;
    bool _3688 = _3686 && _3678;
    float _3690 = _3232;
    if (!_3392)
    {
        float _3692 = floor(_3294);
        _3690 = _3692;
    }
    float _3694 = _3690;
    float _3696 = fma(_3582, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3682);
    float _3698 = _3656 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3700 = _3684 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3702 = fma(_3674, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3696);
    float _3704 = fma(_3654, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3698);
    float _3706 = _3220 * _3560;
    float _3708 = _3670;
    if (!_3392)
    {
        float _3710 = -_3670;
        float _3712 = _3254 + _3710;
        _3708 = _3712;
    }
    float _3714 = _3708;
    float _3716 = 1.0 / _3702;
    float _3718 = fma(_3582, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3704);
    float _3720 = fma(_2458, _3552, _3706);
    if (_3688)
    {
        float _3722 = float(_3314);
        _3666 = _3722;
    }
    float _3724 = _3666;
    float _3726 = fma(_3654, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3680);
    float _3728 = fma(_2476, _3592, _3720);
    float _3730 = _3680;
    if (_3688)
    {
        float _3732 = rint(_3724);
        float _3734 = precise::max(_3732, 0.0);
        uint _3736 = uint(_3734);
        uint _3738 = clamp(_3736, 0u, 65535u);
        _3730 = as_type<float>(_3738);
    }
    float _3740 = _3730;
    float _3742 = fma(_3582, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3726);
    float _3744 = fma(_3674, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3718);
    float _3746 = _3728 + _3600;
    float _3748 = _3694;
    if (!_3392)
    {
        float _3750 = -_3694;
        float _3752 = _3294 + _3750;
        _3748 = _3752;
    }
    float _3754 = _3748;
    float _3756 = fma(_3674, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3742);
    float _3758 = _3746 * _3580;
    float _3760 = _3706;
    float _3762 = _3630;
    if (!_3392)
    {
        float _3764 = rint(_3630);
        float _3766 = precise::max(_3764, 0.0);
        uint _3768 = uint(_3766);
        uint _3770 = clamp(_3768, 0u, 65535u);
        _3760 = as_type<float>(_3770);
    }
    float _3772 = _3760;
    float _3774 = _3744 * _3716;
    float _3776 = _3756 * _3716;
    float _3778 = fma(_3774, 0.5, 0.5);
    float _3780 = fma(_3776, -0.5, 0.5);
    float _3782 = _3646;
    if (_3688)
    {
        float3 _10134 = float3(_3642, _3646, float(as_type<int>(_3740)));
        float3 _10138 = select(_10134, float3(0.0), isnan(_10134));
        float _3784 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _10138.xy, uint(rint(_10138.z)), _3758, level(0.0));
        _3782 = _3784;
    }
    float _3786 = _3782;
    float3 _10148 = float3(_3778, _3780, _3700);
    float _3788 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_10148, float3(0.0), isnan(_10148)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_10148, float3(0.0), isnan(_10148)), level(0.0)).x;
    float3 _10157 = float3(_3778, _3780, _3700);
    float4 _3791 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_10157, float3(0.0), isnan(_10157)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_10157, float3(0.0), isnan(_10157)), level(0.0)).xyzw;
    float _3793 = _3791.x;
    float _3795 = _3791.y;
    float _3797 = _3791.z;
    float _3799 = _3791.w;
    float _3801 = _3714;
    if (!_3392)
    {
        float3 _10180 = float3(_3714, _3754, float(as_type<int>(_3772)));
        float3 _10182 = select(_10180, float3(0.0), isnan(_10180));
        float _3803 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _10182.xy, uint(rint(_10182.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _10182.xy, uint(rint(_10182.z)), level(0.0)).x;
        _3801 = _3803;
    }
    float _3805 = _3801;
    if (_3392)
    {
        _3304 = 1.0;
    }
    float _3807 = _3304;
    float _3809 = _3807;
    if (!_3392)
    {
        int _3811 = _3516 << 4;
        int _3813 = _3811 + 2048;
        uint _3815 = uint(int(uint(_3813) >> uint(2)));
        uint _3817 = uint(int(uint(int(_3815)) >> uint(2)));
        int _3819 = int(_3815) & 3;
        float _3821 = (*spvDescriptorSet0.vp_c15)._m0[int(_3817)][_3819];
        int _3823 = int(_3815) + 1;
        uint _3825 = uint(int(uint(_3823) >> uint(2)));
        int _3827 = _3823 & 3;
        float _3829 = (*spvDescriptorSet0.vp_c15)._m0[int(_3825)][_3827];
        int _3831 = _3813 + 8;
        uint _3833 = uint(int(uint(_3831) >> uint(2)));
        uint _3835 = uint(int(uint(int(_3833)) >> uint(2)));
        int _3837 = int(_3833) & 3;
        float _3839 = (*spvDescriptorSet0.vp_c15)._m0[int(_3835)][_3837];
        int _3841 = int(_3833) + 1;
        uint _3843 = uint(int(uint(_3841) >> uint(2)));
        int _3845 = _3841 & 3;
        float _3847 = (*spvDescriptorSet0.vp_c15)._m0[int(_3843)][_3845];
        float _3849 = _3220 * _3829;
        float _3851 = fma(_2458, _3821, _3849);
        float _3853 = fma(_2476, _3839, _3851);
        float _3855 = _3853 + _3847;
        float _3857 = precise::clamp(_3855, 0.0, 1.0);
        float _3859 = -_3857;
        float _3861 = _3859 + _3805;
        float _3863 = fma(_3861, 500.0, 1.5);
        float _3865 = exp2(_3863);
        float _3867 = 0.0 + _3865;
        float _3869 = precise::clamp(_3867, 0.0, 1.0);
        _3809 = _3869;
    }
    float _3871 = _3809;
    float _3873 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3875 = _3496 + _3873;
    float _3877 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3879 = _3498 + _3877;
    float _3881 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3883 = _3502 + _3881;
    float _3885 = _3875 * _3875;
    float _3887 = fma(_3879, _3879, _3885);
    float _3889 = fma(_3883, _3883, _3887);
    float _3891 = rsqrt(_3889);
    float _3893 = sqrt(_3889);
    float _3895 = _3891 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3897 = _3879 * _3895;
    float _3899 = _3883 * _3895;
    float _3901 = _3897 * _3897;
    float _3903 = _3899 * _3899;
    float _3905 = _3901 + _3903;
    float _3907 = sqrt(_3905);
    bool _3909 = _3907 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3911 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3913 = _3907 + _3911;
    float _3915 = _3883;
    float _3917 = _3905;
    float _3919 = _3913;
    float _3921 = _3875;
    if (_3909)
    {
        float _3923 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3915 = _3923;
    }
    float _3925 = _3915;
    if (_3909)
    {
        float _3927 = rsqrt(_3905);
        _3917 = _3927;
    }
    float _3929 = _3917;
    if (_3909)
    {
        float _3931 = _3913 * _3925;
        _3919 = _3931;
    }
    float _3933 = _3919;
    if (_3909)
    {
        float _3935 = _3933 * 0.15915493667125701904296875;
        _3762 = _3935;
    }
    float _3937 = _3762;
    float _3939 = _3891;
    if (_3909)
    {
        float _3941 = _3937 * 6.283185482025146484375;
        float _3943 = sin(_3941);
        _3939 = _3943;
    }
    float _3945 = _3939;
    float _3947 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3949 = precise::max(0.0, _3947);
    float _3951 = _3780;
    float _3953 = _3949;
    float _3955 = _3947;
    if (_3909)
    {
        float _3957 = _3937 * 6.283185482025146484375;
        float _3959 = cos(_3957);
        _3951 = _3959;
    }
    float _3961 = _3951;
    float _3963 = -_3895;
    float _3965 = -_3949;
    float _3967 = fma(_3875, _3963, _3965);
    if (!_3909)
    {
        _3921 = _3899;
    }
    float _3969 = _3921;
    float _3971 = _3969;
    if (_3909)
    {
        float _3973 = _3967 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3953 = _3973;
    }
    float _3975 = _3953;
    float _3977 = _3975;
    float _3979 = _3945;
    if (_3909)
    {
        float _3981 = fma(_3945, _3975, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3977 = _3981;
    }
    float _3983 = _3977;
    float _3985 = _3983;
    if (!_3909)
    {
        _3979 = _3897;
    }
    float _3987 = _3979;
    float _3989 = _3987;
    float _3991 = _3961;
    if (_3909)
    {
        float _3993 = _3961 + (-1.0);
        _3955 = _3993;
    }
    float _3995 = _3955;
    float _3997 = _3995;
    if (_3909)
    {
        float _3999 = _3929 * _3983;
        _3510 = _3999;
    }
    float _4001 = _3510;
    if (!_3909)
    {
        _3985 = _3967;
    }
    float _4003 = _3985;
    float _4005 = _4003;
    if (_3909)
    {
        float _4007 = _3995 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3997 = _4007;
    }
    float _4009 = _3997;
    float _4011 = _4009;
    if (_3909)
    {
        float _4013 = _3897 * _4001;
        _3989 = _4013;
    }
    float _4015 = _3989;
    if (_3909)
    {
        float _4017 = _3899 * _4001;
        _3971 = _4017;
    }
    float _4019 = _3971;
    if (_3909)
    {
        float _4021 = fma(_3967, _3961, _4009);
        _4005 = _4021;
    }
    float _4023 = _4005;
    if (!_3909)
    {
        _4011 = _3901;
    }
    float _4025 = _4011;
    float _4027 = _4025;
    if (_3909)
    {
        float _4029 = _4015 * _4015;
        _4027 = _4029;
    }
    float _4031 = _4027;
    if (!_3909)
    {
        _3991 = _3903;
    }
    float _4033 = _3991;
    float _4035 = _4033;
    if (_3909)
    {
        float _4037 = _4019 * _4019;
        _4035 = _4037;
    }
    float _4039 = _4035;
    float _4041 = fma(_4023, _4023, _4031);
    float _4043 = _4041 + _4039;
    float _4045 = rsqrt(_4043);
    float _4047 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4049 = fma(_3893, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4047);
    float _4051 = precise::clamp(_4049, 0.0, 1.0);
    float _4053 = -_4051;
    float _4055 = _4053 + 1.0;
    float _4057 = abs(_4055);
    float _4059 = log2(_4057);
    float _4061 = _4045 * _4015;
    float _4063 = _4045 * _4023;
    float _4065 = _4045 * _4019;
    float _4067 = _4061 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4069 = -_4067;
    float _4071 = fma(_4063, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4069);
    float _4073 = _4059 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4075 = -_4065;
    float _4077 = fma(_4075, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4071);
    float _4079 = fma(_4077, -0.5, 0.5);
    float _4081 = exp2(_4073);
    float _4083 = fma(_4077, 0.5, 0.5);
    float _4085 = _4063 + 1.0;
    float _4087 = fma(_4083, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4089 = sqrt(_4079);
    float _4091 = fma(_4083, _4087, -0.212114393711090087890625);
    float _4093 = fma(_4083, _4091, 1.570728778839111328125);
    float _4095 = -_4063;
    float _4097 = fma(_4081, _4085, _4095);
    float _4099 = fma(_4097, 0.5, 0.5);
    float _4101 = _4089 * 0.636619746685028076171875;
    float _4103 = -_4093;
    float _4105 = fma(_4101, _4103, 1.0);
    float2 _10653 = float2(_4105, _4099);
    float3 _4109 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_10653, float2(0.0), isnan(_10653)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_10653, float2(0.0), isnan(_10653)), level(0.0)).xyz;
    float _4111 = _4109.x;
    float _4113 = _4109.y;
    float _4115 = _4109.z;
    float _4117 = abs(_3278);
    float _4119 = log2(_4117);
    float _4121 = _3656 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4123 = -_3186;
    float _4125 = _4123 + 1.0;
    float _4127 = fma(_3654, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4121);
    bool _4129 = _3278 <= 8000.0;
    bool _4131 = isnan(_3278);
    bool _4133 = _4129 || _4131;
    bool _4135 = isnan(8000.0);
    bool _4137 = _4133 || _4135;
    float _4139 = float(_4137);
    float _4141 = fma(_3582, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4127);
    float _4143 = _4119 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _4145 = exp2(_4143);
    float _4147 = fma(_4145, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4149 = precise::clamp(_4147, 0.0, 1.0);
    float _4151 = fma(_4149, -2.0, 3.0);
    float _4153 = _4149 * _4149;
    float _4155 = _4153 * _4151;
    float _4157 = _4059 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4159 = fma(_3674, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4141);
    float _4161 = -_4155;
    float _4163 = _4161 + 1.0;
    float _4165 = _4159 + _3702;
    float _4167 = exp2(_4157);
    float _4169 = fma(_4163, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4155);
    out.gl_Position.x = _3744;
    out.gl_Position.y = _3756;
    out.gl_Position.z = _4159;
    out.gl_Position.w = _3702;
    float _4171 = _4165 * 0.5;
    float _4173 = _4165;
    float _4175 = _4125;
    if (!_3688)
    {
        _4173 = 1.0;
    }
    float _4177 = _4173;
    float _4179 = _4139 * _4169;
    float _4181 = _4177;
    if (_3688)
    {
        bool _4183 = _3786 >= _3758;
        bool _4185 = isnan(_3786);
        bool _4187 = _4183 || _4185;
        bool _4189 = isnan(_3758);
        bool _4191 = _4187 || _4189;
        float _4193 = float(_4191);
        _4181 = _4193;
    }
    float _4195 = _4181;
    out.m_86.z = _4171;
    out.m_86.w = _3702;
    float _4197 = _4179 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    bool _4199 = _3893 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4201 = isnan(_3893);
    bool _4203 = _4199 || _4201;
    bool _4205 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4207 = _4203 || _4205;
    float _4209 = _4195 * _3871;
    float _4211 = _4125 * _4197;
    float _4213 = precise::clamp(_4211, 0.0, 1.0);
    float _4215 = -_4167;
    float _4217 = _4215 + 1.0;
    float _4219 = -_4213;
    float _4221 = fma(_4219, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4223 = _4217 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4225 = -_4209;
    float _4227 = fma(_4225, _4221, 1.0);
    float _4229 = precise::clamp(_4227, 0.0, 1.0);
    if (!_4207)
    {
        _4175 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4231 = _4175;
    float _4233 = _4223 * _3788;
    float _4235 = -_4223;
    float _4237 = _4235 + 1.0;
    float _4239 = _4229 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _4241 = _3799 * _4233;
    float _4243 = _3799 * _4237;
    out.m_88.x = _4239;
    float _4245 = _4115 * _4233;
    float _4247 = fma(_4111, _4241, _3793);
    float _4249 = fma(_4113, _4241, _3795);
    float _4251 = _4241;
    float _4253 = _4233;
    float _4255 = _4231;
    float _4257 = _4231;
    if (!_4207)
    {
        _4251 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4259 = _4251;
    float _4261 = fma(_3799, _4245, _3797);
    float _4263 = _4259;
    float _4265 = _4259;
    if (!_4207)
    {
        _4253 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4267 = _4253;
    out.m_90.x = _4247;
    out.m_90.y = _4249;
    out.m_90.z = _4261;
    out.m_90.w = _4243;
    bool _4269 = !_4207;
    float _4271 = _4267;
    float _4273 = _4267;
    if (!_4269)
    {
        bool _4275 = _3893 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4277 = isnan(_3893);
        bool _4279 = _4275 || _4277;
        bool _4281 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4283 = _4279 || _4281;
        if (!_4283)
        {
            float _4285 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4287 = _3893 + _4285;
            float _4289 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4291 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4289;
            float _4293 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4295 = _4293 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4297 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4299 = _4297 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4301 = 1.0 / _4291;
            float _4303 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4305 = _4303 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4307 = _4287 * _4301;
            float _4309 = precise::clamp(_4307, 0.0, 1.0);
            float _4311 = fma(_4309, _4295, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4313 = fma(_4309, _4299, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4315 = fma(_4309, _4305, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _4265 = _4313;
            _4257 = _4311;
            _4273 = _4315;
            _4317 = true;
        }
        else
        {
            bool _4319 = _3893 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4321 = isnan(_3893);
            bool _4323 = _4319 || _4321;
            bool _4325 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4327 = _4323 || _4325;
            if (!_4327)
            {
                _4255 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4329 = _4255;
            _4257 = _4329;
            if (!_4327)
            {
                _4263 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4331 = _4263;
            _4265 = _4331;
            if (!_4327)
            {
                _4271 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4333 = _4271;
            bool _4335 = !_4327;
            _4273 = _4333;
            if (!_4335)
            {
                bool _4337 = _3893 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4339 = isnan(_3893);
                bool _4341 = _4337 || _4339;
                bool _4343 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4345 = _4341 || _4343;
                if (!_4345)
                {
                    float _4347 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4349 = _3893 + _4347;
                    float _4351 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4353 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4351;
                    float _4355 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4357 = _4355 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4359 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4361 = _4359 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4363 = 1.0 / _4353;
                    float _4365 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4367 = _4365 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4369 = _4349 * _4363;
                    float _4371 = precise::clamp(_4369, 0.0, 1.0);
                    float _4373 = fma(_4371, _4357, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4375 = fma(_4371, _4361, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4377 = fma(_4371, _4367, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _4265 = _4375;
                    _4257 = _4373;
                    _4273 = _4377;
                    _4317 = true;
                }
                else
                {
                    _4265 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4257 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4273 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _4317 = false;
    float _4379 = _4265;
    float _4381 = _4257;
    float _4383 = _4273;
    float _4385 = _4379 * 0.586610972881317138671875;
    bool _4387 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_92.x = 0.0;
    float _4389 = fma(_4381, 0.298911988735198974609375, _4385);
    float _4391 = fma(_4383, 0.114477999508380889892578125, _4389);
    float _4393 = -_4391;
    float _4395 = _4393 + _4381;
    float _4397 = -_4391;
    float _4399 = _4397 + _4379;
    float _4401 = -_4391;
    float _4403 = _4401 + _4383;
    float _4405 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4407 = fma(_4395, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4391);
    float _4409 = fma(_4399, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4391);
    float _4411 = fma(_4403, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4391);
    out.m_61.x = _4405;
    out.m_94.x = _4407;
    out.m_94.y = _4409;
    out.m_94.z = _4411;
    if (!_4387)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _4413 = -_3496;
    float _4415 = _4413 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _4417 = -_3498;
    float _4419 = _4417 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _4421 = -_3502;
    float _4423 = _4421 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _4425 = _4415 * _4415;
    float _4427 = fma(_4419, _4419, _4425);
    float _4429 = fma(_4423, _4423, _4427);
    float _4431 = sqrt(_4429);
    float _4433 = rsqrt(_4429);
    float _4435 = -_4431;
    float _4437 = _4435 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4439 = _4437 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _4441 = precise::clamp(_4439, 0.0, 1.0);
    float _4443 = _4419 * _4433;
    float _4445 = _4415 * _4433;
    float _4447 = abs(_4441);
    float _4449 = log2(_4447);
    float _4451 = _4423 * _4433;
    float _4453 = _4443 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4455 = _3086 * _4445;
    float _4457 = -_4445;
    float _4459 = -_4453;
    float _4461 = fma(_4457, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4459);
    float _4463 = fma(_3090, _4443, _4455);
    float _4465 = -_4451;
    float _4467 = fma(_4465, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4461);
    float _4469 = fma(_3092, _4451, _4463);
    float _4471 = precise::clamp(_4469, 0.0, 1.0);
    float _4473 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _4475 = _4467 + _4473;
    float _4477 = _4449 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _4479 = _4475 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _4481 = precise::clamp(_4479, 0.0, 1.0);
    float _4483 = exp2(_4477);
    float _4485 = _4483 * _4481;
    float _4487 = _4471 * _4485;
    float _4489 = _4487 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4491 = _4487 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4493 = _4487 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_92.x = _4489;
    out.m_92.y = _4491;
    out.m_92.z = _4493;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

